Return-Path: <linux-gpio+bounces-18228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EC6A7B361
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 02:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9B87188BA14
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 00:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB581F561C;
	Fri,  4 Apr 2025 00:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVadE9ve"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888031F4E21;
	Fri,  4 Apr 2025 00:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725149; cv=none; b=OAQM8QsPOnN0wp1RxOtxxp+T7EtywfUxSzy8GQrLgZKzOawRXp8ChGM2Z4vigC1OvEZKMTArifcWM42u0GvOi7e2WRXQ/y2Jg8TwZ1WvsOrXYTvkuYwoeYenjqn+RDD5ofpbgTZCmIi7rwfLqtXy8uavOCmZsBDl0vmkiwVY1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725149; c=relaxed/simple;
	bh=i/DCMFl5qlU1LRFV/7xradP9/bYF8C1qGKf5kcHOzE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qbg/lPNKq6FH/o35UkBlvW0QAcddLvJ51GMmBAhaXWDsAxyzsTIxWzafp2d9UTKKyZgMkngQpL/7bWArLJAsG3/PdwRegL2VwrYIszG7IOJrokPNRsDebXbowwCFx0gchEJXAwLGvFYs9Kh3VMdrP0TKqq3CUCiFcrEguIuPCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVadE9ve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADC0C4CEE3;
	Fri,  4 Apr 2025 00:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725149;
	bh=i/DCMFl5qlU1LRFV/7xradP9/bYF8C1qGKf5kcHOzE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JVadE9vev9ZspiUstHpiIbZibAmLBzlwh9JiaXWJ7XlWCme/DJJc3+t82IJ4re330
	 e3L9TyeanDEZK9ZJY3JLUK96YK13Bp7jcLX4f5a0gYh5OIJ4eCttF/X4746Lvl6Vft
	 OCgDn6C9gSZiluplv/B09ORat4OtVjyk6p/OSPG50KSGEE2BIwY9Jb87eCkPNdfGJq
	 qogg2UFPQwXygV5z6uarCcJuEsDlDauFjDVplq2y8jlBIYtpp+WumXYJqmRgXcd0cK
	 C++UaG6LN/ZY+LpUkv2xZ2cUL9/E3OPgvJ9Xbp+Sja1NU/lHvIZWOMZXSgHIBmgwgE
	 pZ5wPDtiaheSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Mastykin <mastichi@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 03/20] pinctrl: mcp23s08: Get rid of spurious level interrupts
Date: Thu,  3 Apr 2025 20:05:23 -0400
Message-Id: <20250404000541.2688670-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000541.2688670-1-sashal@kernel.org>
References: <20250404000541.2688670-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
Content-Transfer-Encoding: 8bit

From: Dmitry Mastykin <mastichi@gmail.com>

[ Upstream commit 7b0671b97f0872d6950ccc925e210cb3f67721bf ]

irq_mask()/irq_unmask() are not called for nested interrupts. So level
interrupts are never masked, chip's interrupt output is not cleared on
INTCAP or GPIO read, the irq handler is uselessly called again. Nested
irq handler is not called again, because interrupt reason is cleared by
its first call.
/proc/interrupts shows that number of chip's irqs is greater than
number of nested irqs.

This patch adds masking and unmasking level interrupts inside irq handler.

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
Link: https://lore.kernel.org/20250122120504.1279790-1-mastichi@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index f384c72d95545..70d7485ada364 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -382,6 +382,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 {
 	struct mcp23s08 *mcp = data;
 	int intcap, intcon, intf, i, gpio, gpio_orig, intcap_mask, defval, gpinten;
+	bool need_unmask = false;
 	unsigned long int enabled_interrupts;
 	unsigned int child_irq;
 	bool intf_set, intcap_changed, gpio_bit_changed,
@@ -396,9 +397,6 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		goto unlock;
 	}
 
-	if (mcp_read(mcp, MCP_INTCAP, &intcap))
-		goto unlock;
-
 	if (mcp_read(mcp, MCP_INTCON, &intcon))
 		goto unlock;
 
@@ -408,6 +406,16 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	if (mcp_read(mcp, MCP_DEFVAL, &defval))
 		goto unlock;
 
+	/* Mask level interrupts to avoid their immediate reactivation after clearing */
+	if (intcon) {
+		need_unmask = true;
+		if (mcp_write(mcp, MCP_GPINTEN, gpinten & ~intcon))
+			goto unlock;
+	}
+
+	if (mcp_read(mcp, MCP_INTCAP, &intcap))
+		goto unlock;
+
 	/* This clears the interrupt(configurable on S18) */
 	if (mcp_read(mcp, MCP_GPIO, &gpio))
 		goto unlock;
@@ -470,9 +478,18 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		}
 	}
 
+	if (need_unmask) {
+		mutex_lock(&mcp->lock);
+		goto unlock;
+	}
+
 	return IRQ_HANDLED;
 
 unlock:
+	if (need_unmask)
+		if (mcp_write(mcp, MCP_GPINTEN, gpinten))
+			dev_err(mcp->chip.parent, "can't unmask GPINTEN\n");
+
 	mutex_unlock(&mcp->lock);
 	return IRQ_HANDLED;
 }
-- 
2.39.5


