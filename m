Return-Path: <linux-gpio+bounces-24757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C07FBB2FD8C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 16:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0135A035DF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A9B2F619D;
	Thu, 21 Aug 2025 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ro2wwNzF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2D32E7BDF
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787789; cv=none; b=p02jeU1EJ8OgaMxg7Eqis3xPCyqtBNBtu/a2pKpXT90eb4vrQOWejwHSiLuiAZFgzuw5lt6WQWGeoWXK67b6W9/03RPCNbyDRF/lwZoFlBlv/jdEScnkVEmSl4/1YteOLHY5QAT2/VtJK5Kj9ZlwFcRSmIqJ4LpoVU4J6qdQNco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787789; c=relaxed/simple;
	bh=kxNWKSl5MUOYUu3aJzWU8RcLjWlLedNNyMiftiZL5jM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qBdITZKOX6SZEIlzLXmnNvonwfQQMIbvpj0U8BxMPCs+9/XU9oFWJO/QW1wWEVMBuVnAV+ACbLgBkfWCkFsDvFkzuqbQlhaZnd4pqhpMoxek2zRnwE3+hbE0YftNbpVPtO4vrhrIneLTG3g02usjPAdyuOYcN1yXSJN7VwdB9nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ro2wwNzF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BEEC4CEED;
	Thu, 21 Aug 2025 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755787789;
	bh=kxNWKSl5MUOYUu3aJzWU8RcLjWlLedNNyMiftiZL5jM=;
	h=From:To:Cc:Subject:Date:From;
	b=Ro2wwNzFY1/QGYbHFd/6UVYAhHeZlPAHLn61sqPg1C87lpLkT/vbNmqPEobVDCBJz
	 G9LaRzq2mLRv7FBSSXCygQVTitJQg4UsY6r/w8qlvqGFVk06o1oKZXteCeDNOBi+hq
	 TK+6/BCBGJxa+C3QJ9vXESkJWvnu5s6aIOZ8ewdi7+s4RAvoJGdqOCdFDn+DG98AHV
	 /jymQYRoujUUZZi7qt8x1Ibw0QEe0PZTyIc0mSOYfNR0qaT5+5j+jBTMZunzEEyJ3I
	 8b1kDpcBS299J5RCTes4Radd3B+mXed40V6Ngo30qbKTXYzq4wI0cR6Oc0rQENXh0h
	 dNGBkCd/m9sWQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com,
	Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: amd: Don't access irq_data's hwirq member directly
Date: Thu, 21 Aug 2025 09:49:11 -0500
Message-ID: <20250821144942.2463014-1-superm1@kernel.org>
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
v2:
 * Declare a variable on stack in all functions using irqd_to_hwirq()
---
 drivers/pinctrl/pinctrl-amd.c | 40 ++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 127eeb0104d85..2dac5c71eb008 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -383,14 +383,15 @@ static void amd_gpio_irq_enable(struct irq_data *d)
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	gpiochip_enable_irq(gc, d->hwirq);
+	gpiochip_enable_irq(gc, hwirq);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + hwirq * 4);
 	pin_reg |= BIT(INTERRUPT_ENABLE_OFF);
 	pin_reg |= BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + hwirq * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -400,15 +401,16 @@ static void amd_gpio_irq_disable(struct irq_data *d)
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + hwirq * 4);
 	pin_reg &= ~BIT(INTERRUPT_ENABLE_OFF);
 	pin_reg &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + hwirq * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
-	gpiochip_disable_irq(gc, d->hwirq);
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void amd_gpio_irq_mask(struct irq_data *d)
@@ -417,11 +419,12 @@ static void amd_gpio_irq_mask(struct irq_data *d)
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + hwirq * 4);
 	pin_reg &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + hwirq * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -431,11 +434,12 @@ static void amd_gpio_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + hwirq * 4);
 	pin_reg |= BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + hwirq * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -446,20 +450,21 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 	u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	int err;
 
 	pm_pr_dbg("Setting wake for GPIO %lu to %s\n",
-		   d->hwirq, str_enable_disable(on));
+		   hwirq, str_enable_disable(on));
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + hwirq * 4);
 
 	if (on)
 		pin_reg |= wake_mask;
 	else
 		pin_reg &= ~wake_mask;
 
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + hwirq * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	if (on)
@@ -495,9 +500,10 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg = readl(gpio_dev->base + hwirq * 4);
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -563,10 +569,10 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	pin_reg_irq_en = pin_reg;
 	pin_reg_irq_en |= mask;
 	pin_reg_irq_en &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg_irq_en, gpio_dev->base + (d->hwirq)*4);
-	while ((readl(gpio_dev->base + (d->hwirq)*4) & mask) != mask)
+	writel(pin_reg_irq_en, gpio_dev->base + hwirq * 4);
+	while ((readl(gpio_dev->base + hwirq * 4) & mask) != mask)
 		continue;
-	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	writel(pin_reg, gpio_dev->base + hwirq * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return ret;
-- 
2.43.0


