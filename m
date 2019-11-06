Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8028F1913
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 15:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731665AbfKFOsf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 09:48:35 -0500
Received: from mga01.intel.com ([192.55.52.88]:55344 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729430AbfKFOsf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 09:48:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 06:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="227984470"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2019 06:48:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 42E00189; Wed,  6 Nov 2019 16:48:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/8] pinctrl: lynxpoint: Switch to memory mapped IO accessors
Date:   Wed,  6 Nov 2019 16:48:27 +0200
Message-Id: <20191106144829.32275-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert driver to use memory mapped IO accessors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 83 +++++++++++------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 05921729fe78..d3065b5a5f75 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -48,7 +48,7 @@ struct lp_gpio {
 	struct gpio_chip	chip;
 	struct device		*dev;
 	raw_spinlock_t		lock;
-	unsigned long		reg_base;
+	void __iomem		*regs;
 };
 
 /*
@@ -80,7 +80,7 @@ struct lp_gpio {
  * LP94_CONFIG2 (gpio 94) ...
  */
 
-static unsigned long lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
+static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
 				 int reg)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
@@ -93,29 +93,29 @@ static unsigned long lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
 		/* bitmapped registers */
 		reg_offset = (offset / 32) * 4;
 
-	return lg->reg_base + reg + reg_offset;
+	return lg->regs + reg + reg_offset;
 }
 
 static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
-	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
-	unsigned long conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
-	unsigned long acpi_use = lp_gpio_reg(chip, offset, LP_ACPI_OWNED);
+	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
+	void __iomem *conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
+	void __iomem *acpi_use = lp_gpio_reg(chip, offset, LP_ACPI_OWNED);
 
 	pm_runtime_get(lg->dev); /* should we put if failed */
 
 	/* Fail if BIOS reserved pin for ACPI use */
-	if (!(inl(acpi_use) & BIT(offset % 32))) {
+	if (!(ioread32(acpi_use) & BIT(offset % 32))) {
 		dev_err(lg->dev, "gpio %d reserved for ACPI\n", offset);
 		return -EBUSY;
 	}
 	/* Fail if pin is in alternate function mode (not GPIO mode) */
-	if (!(inl(reg) & USE_SEL_BIT))
+	if (!(ioread32(reg) & USE_SEL_BIT))
 		return -ENODEV;
 
 	/* enable input sensing */
-	outl(inl(conf2) & ~GPINDIS_BIT, conf2);
+	iowrite32(ioread32(conf2) & ~GPINDIS_BIT, conf2);
 
 
 	return 0;
@@ -124,10 +124,10 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 static void lp_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
-	unsigned long conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
+	void __iomem *conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
 
 	/* disable input sensing */
-	outl(inl(conf2) | GPINDIS_BIT, conf2);
+	iowrite32(ioread32(conf2) | GPINDIS_BIT, conf2);
 
 	pm_runtime_put(lg->dev);
 }
@@ -137,15 +137,15 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct lp_gpio *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
+	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_CONFIG1);
 	unsigned long flags;
 	u32 value;
-	unsigned long reg = lp_gpio_reg(&lg->chip, hwirq, LP_CONFIG1);
 
 	if (hwirq >= lg->chip.ngpio)
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&lg->lock, flags);
-	value = inl(reg);
+	value = ioread32(reg);
 
 	/* set both TRIG_SEL and INV bits to 0 for rising edge */
 	if (type & IRQ_TYPE_EDGE_RISING)
@@ -163,7 +163,7 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 	if (type & IRQ_TYPE_LEVEL_HIGH)
 		value |= TRIG_SEL_BIT | INT_INV_BIT;
 
-	outl(value, reg);
+	iowrite32(value, reg);
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 
 	return 0;
@@ -171,22 +171,22 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 
 static int lp_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
-	return !!(inl(reg) & IN_LVL_BIT);
+	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
+	return !!(ioread32(reg) & IN_LVL_BIT);
 }
 
 static void lp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
-	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
+	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lg->lock, flags);
 
 	if (value)
-		outl(inl(reg) | OUT_LVL_BIT, reg);
+		iowrite32(ioread32(reg) | OUT_LVL_BIT, reg);
 	else
-		outl(inl(reg) & ~OUT_LVL_BIT, reg);
+		iowrite32(ioread32(reg) & ~OUT_LVL_BIT, reg);
 
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
@@ -194,11 +194,11 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
-	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
+	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lg->lock, flags);
-	outl(inl(reg) | DIR_BIT, reg);
+	iowrite32(ioread32(reg) | DIR_BIT, reg);
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 
 	return 0;
@@ -208,13 +208,13 @@ static int lp_gpio_direction_output(struct gpio_chip *chip,
 				      unsigned offset, int value)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
-	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
+	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
 	lp_gpio_set(chip, offset, value);
 
 	raw_spin_lock_irqsave(&lg->lock, flags);
-	outl(inl(reg) & ~DIR_BIT, reg);
+	iowrite32(ioread32(reg) & ~DIR_BIT, reg);
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 
 	return 0;
@@ -226,7 +226,8 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct lp_gpio *lg = gpiochip_get_data(gc);
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
-	unsigned long reg, ena, pending;
+	void __iomem *reg, *ena;
+	unsigned long pending;
 	u32 base, pin;
 
 	/* check from GPIO controller which pin triggered the interrupt */
@@ -235,13 +236,13 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 		ena = lp_gpio_reg(&lg->chip, base, LP_INT_ENABLE);
 
 		/* Only interrupts that are enabled */
-		pending = inl(reg) & inl(ena);
+		pending = ioread32(reg) & ioread32(ena);
 
 		for_each_set_bit(pin, &pending, 32) {
 			unsigned irq;
 
 			/* Clear before handling so we don't lose an edge */
-			outl(BIT(pin), reg);
+			iowrite32(BIT(pin), reg);
 
 			irq = irq_find_mapping(lg->chip.irq.domain, base + pin);
 			generic_handle_irq(irq);
@@ -263,11 +264,11 @@ static void lp_irq_enable(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct lp_gpio *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
-	unsigned long reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
+	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lg->lock, flags);
-	outl(inl(reg) | BIT(hwirq % 32), reg);
+	iowrite32(ioread32(reg) | BIT(hwirq % 32), reg);
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
@@ -276,11 +277,11 @@ static void lp_irq_disable(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct lp_gpio *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
-	unsigned long reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
+	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lg->lock, flags);
-	outl(inl(reg) & ~BIT(hwirq % 32), reg);
+	iowrite32(ioread32(reg) & ~BIT(hwirq % 32), reg);
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
@@ -297,16 +298,16 @@ static struct irq_chip lp_irqchip = {
 static int lp_gpio_irq_init_hw(struct gpio_chip *chip)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
-	unsigned long reg;
+	void __iomem *reg;
 	unsigned base;
 
 	for (base = 0; base < lg->chip.ngpio; base += 32) {
 		/* disable gpio pin interrupts */
 		reg = lp_gpio_reg(&lg->chip, base, LP_INT_ENABLE);
-		outl(0, reg);
+		iowrite32(0, reg);
 		/* Clear interrupt status register */
 		reg = lp_gpio_reg(&lg->chip, base, LP_INT_STAT);
-		outl(0xffffffff, reg);
+		iowrite32(0xffffffff, reg);
 	}
 
 	return 0;
@@ -318,7 +319,6 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	struct gpio_chip *gc;
 	struct resource *io_rc, *irq_rc;
 	struct device *dev = &pdev->dev;
-	unsigned long reg_len;
 	int ret = -ENODEV;
 
 	lg = devm_kzalloc(dev, sizeof(struct lp_gpio), GFP_KERNEL);
@@ -329,18 +329,14 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, lg);
 
 	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
-	irq_rc = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-
 	if (!io_rc) {
 		dev_err(dev, "missing IO resources\n");
 		return -EINVAL;
 	}
 
-	lg->reg_base = io_rc->start;
-	reg_len = resource_size(io_rc);
-
-	if (!devm_request_region(dev, lg->reg_base, reg_len, "lp-gpio")) {
-		dev_err(dev, "failed requesting IO region %pR\n", &io_rc);
+	lg->regs = devm_ioport_map(dev, io_rc->start, resource_size(io_rc));
+	if (!lg->regs) {
+		dev_err(dev, "failed mapping IO region %pR\n", &io_rc);
 		return -EBUSY;
 	}
 
@@ -361,6 +357,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->parent = dev;
 
 	/* set up interrupts  */
+	irq_rc = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (irq_rc && irq_rc->start) {
 		struct gpio_irq_chip *girq;
 
@@ -403,14 +400,14 @@ static int lp_gpio_runtime_resume(struct device *dev)
 static int lp_gpio_resume(struct device *dev)
 {
 	struct lp_gpio *lg = dev_get_drvdata(dev);
-	unsigned long reg;
+	void __iomem *reg;
 	int i;
 
 	/* on some hardware suspend clears input sensing, re-enable it here */
 	for (i = 0; i < lg->chip.ngpio; i++) {
 		if (gpiochip_is_requested(&lg->chip, i) != NULL) {
 			reg = lp_gpio_reg(&lg->chip, i, LP_CONFIG2);
-			outl(inl(reg) & ~GPINDIS_BIT, reg);
+			iowrite32(ioread32(reg) & ~GPINDIS_BIT, reg);
 		}
 	}
 	return 0;
-- 
2.24.0.rc1

