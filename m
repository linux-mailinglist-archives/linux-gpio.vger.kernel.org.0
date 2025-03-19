Return-Path: <linux-gpio+bounces-17772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EDA68855
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 10:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4EEC188B48A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 09:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D03E25DB0B;
	Wed, 19 Mar 2025 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVSLLuiK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD282255E47;
	Wed, 19 Mar 2025 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376788; cv=none; b=byxeIaDIy/yWe5REq4/Dl6i3fihO3IL/v5Tgsyby8MHyt9ls+uOKFDpQVEG+5w2kbYEF4r2ezsUWtLfa9k9R1ff+psMBvh+DkMKM/8wn/BtEugIzXGDjt8nsHvw9ENFQQs6f/v2ju7MbCvrdNfndaR1tqsxdPlRKoVMvsBdTrCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376788; c=relaxed/simple;
	bh=gODY0rz69D9LDXdTGisofUcys5c9uPuXFizxodp1vEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOAcHGxlAmDdDvDfQ7xB9AXd2YNA/1n3QkE2ej7BVPJM7VeIna+SwroUfK8JAPh4R9rSZMtxzBs/QeLHHP00hSQzNH4Gc3aSVSzrj1uZ46tXPQElQlu9MLLV/jmS0O/+tGKMGl8/jXFuewODp/N6KCWcxomJNErgJnZldcsnhhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVSLLuiK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21330C4CEEF;
	Wed, 19 Mar 2025 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376787;
	bh=gODY0rz69D9LDXdTGisofUcys5c9uPuXFizxodp1vEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cVSLLuiKQoloz0lmDoQtsONjy7KFnqRHBahL4UpAvmug7YKYmen3NE+e53K0411Mi
	 RX3ezVbq19KAAVFm2Zqd4BlCpyBnrUVHUquasBP5KgKMDFEaZFiPNZS5uFgr1DExEl
	 yH1Q9aQLfUqt57sB2U8yXb5FZww/iO7fSp2SJ30POhRLvKrpOfoKz4JbxbUzFz3CMV
	 GtgdcXK9mt3cbPjzIQD+OHqzvEbgO0beuSXBJ+f4dq7WAWpY5LvITHD0LJx4rw9ST/
	 +zmj4lDXwtjP/yZCtylIbFLbtPce6RSY5mWmzlqar15DhXYMUh4DuuUpCjarqGz4Fd
	 WcHV0pJTbSmpw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 47/57] irqdomain: pinctrl: Switch to irq_find_mapping()
Date: Wed, 19 Mar 2025 10:29:40 +0100
Message-ID: <20250319092951.37667-48-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_linear_revmap() is deprecated, so remove all its uses and supersede
them by an identical call to irq_find_mapping().

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/pinctrl-keembay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index b693f4787044..0d7cc8280ea2 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1268,7 +1268,7 @@ static void keembay_gpio_irq_handler(struct irq_desc *desc)
 	for_each_set_clump8(bit, clump, &reg, BITS_PER_TYPE(typeof(reg))) {
 		pin = clump & ~KEEMBAY_GPIO_IRQ_ENABLE;
 		val = keembay_read_pin(kpc->base0 + KEEMBAY_GPIO_DATA_IN, pin);
-		kmb_irq = irq_linear_revmap(gc->irq.domain, pin);
+		kmb_irq = irq_find_mapping(gc->irq.domain, pin);
 
 		/* Checks if the interrupt is enabled */
 		if (val && (clump & KEEMBAY_GPIO_IRQ_ENABLE))
-- 
2.49.0


