Return-Path: <linux-gpio+bounces-12840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD09C4C39
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 03:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5828D289ACF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 02:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2866E2040A8;
	Tue, 12 Nov 2024 02:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="B4BuOlL5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m127206.xmail.ntesmail.com (mail-m127206.xmail.ntesmail.com [115.236.127.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3DD16630A;
	Tue, 12 Nov 2024 02:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377381; cv=none; b=qrtDFhklsckauWrrnmq2Vh3D3I3Z3O/GYbzs45HHHToC32JfLKhNlD65AYviNzOlvEYb1j/CKfRHNvRdglmct5cHhH1ulvek3+OxdcmEXHEiea0za1PiwDT+PV/qfnaLLdOjh6IgFF1dRzEocMa1wNp+tU4IWvNgTqNzcJmqEVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377381; c=relaxed/simple;
	bh=ikDyrepRcR/GcMVOs1PYQ5moK8iBWkhxGfTp1TVD2ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SzF4wpOxTURRP3IGx+qFMXh6igXSuuNhkiqNh7zXFTxYCUrbnKYJliT9VHd+Cl06FWw6MXGhmUULUKP9jJzfWSCd0t9ksqA29xEj8I4IfMxVthz3opojy68YfQ8PrJtWCRNhukV0O2q87NZaF6+DYZ8aQD4RJnBtJZAeh3bQVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=B4BuOlL5; arc=none smtp.client-ip=115.236.127.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f37;
	Tue, 12 Nov 2024 09:54:17 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
Date: Tue, 12 Nov 2024 09:54:08 +0800
Message-Id: <20241112015408.3139996-5-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1PTFZIT0kZTRpCHUtJT09WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e1428e409d8kunm275d3f37
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBQ6ISo5KTIqMBoQPzUSSSwj
	OUIKCjVVSlVKTEhKSExNT05CT0hCVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSktIQzcG
DKIM-Signature:a=rsa-sha256;
	b=B4BuOlL5tsBqQdef+Wlc71JSyi354lSEC1mheLS2w85oIb4J0/jXCKWuyGD4Z1mjCVP08Eq7YemWzBZu+Xtoz6Rvb6c2rLe8I7osMBL6piJ7gjxf1r8+xGfHJ2JlnHlkF1k1QJkDv/i092IN/48D9N+WoOL67icrt/bPch0PtzM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=mNEmQIXIeVppZTHWDm1sWax6s+N6SW3qLZo4jlaSVhk=;
	h=date:mime-version:subject:message-id:from;

Since the GPIO can only generate interrupts when its direction is set to
input, it is set to input before requesting the interrupt resources.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpio/gpio-rockchip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index c090cac694bf..cdfdd5501a1e 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -476,8 +476,11 @@ static int rockchip_irq_reqres(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
+	rockchip_gpio_direction_input(&bank->gpio_chip, hwirq);
+
+	return gpiochip_reqres_irq(&bank->gpio_chip, hwirq);
 }
 
 static void rockchip_irq_relres(struct irq_data *d)
-- 
2.34.1


