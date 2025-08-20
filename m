Return-Path: <linux-gpio+bounces-24683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4890BB2E8AC
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 01:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0381B7AD840
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 23:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27972DF3CC;
	Wed, 20 Aug 2025 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2S2e6p6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AED2DE70D
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755732731; cv=none; b=ucIO+8tGc9JyomerSYozxoJpb5Qz8TQ+n4z2SwkXfqqSS/ELLcJnaSL7gewDVzzFMq6vLF3QDk3/rgsdkOPo9TTM02TqSRHUc1kr0ahFc71UGrQZtv7S0fjFtvNM27SbYut2HvLYGgwHb+wDb8W+TKjXJzwl4FKD/kFHOAFxmKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755732731; c=relaxed/simple;
	bh=LMr43yRnmxuO/uD3zJJ89VBbBtaSiPB0V2/BmNhy96M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mb9s2UFFvRzBD9rfb1uu45P/nuROKGUoVlVhrBSTPkgqQvCX0vPhlu7X4JxImt/zfDC4gHzoeMvrjNapoU+HNkNqo1C0ojexixL3JobbGm2tD1pSL343qAIpZ0I/ifVrBWqulqr+fReZTW7AfNy2a35thNyI9gvsOUkFrYl54bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2S2e6p6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B44EC4CEE7;
	Wed, 20 Aug 2025 23:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755732731;
	bh=LMr43yRnmxuO/uD3zJJ89VBbBtaSiPB0V2/BmNhy96M=;
	h=From:To:Cc:Subject:Date:From;
	b=T2S2e6p6LUHivBH/g8xREnsbxNGizqCAZrfoSjI/13sFi/zbBfqGH7fdmxwfdrxJp
	 NZXNEYV3rcsGBrcLrsOPgrgQFAV4PaOGhHrPVSJGoxiaJyAMw3gRsnLdKMnOHo+6o5
	 wNx5KUjHTFHFUXdf7Hz4Qd5PiCK2jxZENuJcz5rse7KE0tqbwbK+bceL0W7qaEwBOD
	 xhE4OrhO6ugbYt4PIACxMge/4e9qAwfHbRKHx9L9/LU4CtnbONdEkqcKhaxMrSRxyb
	 nCdmkm8r+xUPDiJj/BusRNm1M2ET+fQyHn6QzEB33QaU6OjXQXi+N2cpJhlA07c3z0
	 ijdXACYS6G/Ag==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com,
	Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: amd: Don't access irq_data's hwirq member directly
Date: Wed, 20 Aug 2025 18:31:52 -0500
Message-ID: <20250820233203.1429901-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is an irqd_to_hwirq() intended to get the hwirq number. Switch
all use to it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/pinctrl/pinctrl-amd.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 127eeb0104d85..f9b7ee607c02d 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -384,13 +384,13 @@ static void amd_gpio_irq_enable(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
-	gpiochip_enable_irq(gc, d->hwirq);
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + irqd_to_hwirq(d)*4);
 	pin_reg |= BIT(INTERRUPT_ENABLE_OFF);
 	pin_reg |= BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + irqd_to_hwirq(d)*4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -402,13 +402,13 @@ static void amd_gpio_irq_disable(struct irq_data *d)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + irqd_to_hwirq(d)*4);
 	pin_reg &= ~BIT(INTERRUPT_ENABLE_OFF);
 	pin_reg &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + irqd_to_hwirq(d)*4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
-	gpiochip_disable_irq(gc, d->hwirq);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void amd_gpio_irq_mask(struct irq_data *d)
@@ -419,9 +419,9 @@ static void amd_gpio_irq_mask(struct irq_data *d)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + irqd_to_hwirq(d)*4);
 	pin_reg &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + irqd_to_hwirq(d)*4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -433,9 +433,9 @@ static void amd_gpio_irq_unmask(struct irq_data *d)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + irqd_to_hwirq(d)*4);
 	pin_reg |= BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + irqd_to_hwirq(d)*4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -449,17 +449,17 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	int err;
 
 	pm_pr_dbg("Setting wake for GPIO %lu to %s\n",
-		   d->hwirq, str_enable_disable(on));
+		   irqd_to_hwirq(d), str_enable_disable(on));
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + irqd_to_hwirq(d)*4);
 
 	if (on)
 		pin_reg |= wake_mask;
 	else
 		pin_reg &= ~wake_mask;
 
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + irqd_to_hwirq(d)*4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	if (on)
@@ -497,7 +497,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + irqd_to_hwirq(d)*4);
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -563,10 +563,10 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	pin_reg_irq_en = pin_reg;
 	pin_reg_irq_en |= mask;
 	pin_reg_irq_en &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg_irq_en, gpio_dev->base + (d->hwirq)*4);
-	while ((readl(gpio_dev->base + (d->hwirq)*4) & mask) != mask)
+	writel(pin_reg_irq_en, gpio_dev->base + irqd_to_hwirq(d)*4);
+	while ((readl(gpio_dev->base + irqd_to_hwirq(d)*4) & mask) != mask)
 		continue;
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + irqd_to_hwirq(d)*4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return ret;
-- 
2.43.0


