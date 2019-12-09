Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A23F116DB0
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfLINJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:37 -0500
Received: from mga18.intel.com ([134.134.136.126]:29135 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727595AbfLINJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="206887935"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2019 05:09:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9D226869; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 10/24] pinctrl: lynxpoint: Switch to memory mapped IO accessors
Date:   Mon,  9 Dec 2019 15:09:12 +0200
Message-Id: <20191209130926.86483-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert driver to use memory mapped IO accessors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 88 +++++++++++------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 1d5f5053fe14..4ed2d4daea19 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -50,7 +50,7 @@ struct lp_gpio {
 	struct gpio_chip	chip;
 	struct device		*dev;
 	raw_spinlock_t		lock;
-	unsigned long		reg_base;
+	void __iomem		*regs;
 };
 
 /*
@@ -82,7 +82,7 @@ struct lp_gpio {
  * LP94_CONFIG2 (gpio 94) ...
  */
 
-static unsigned long lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
+static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
 				 int reg)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
@@ -95,21 +95,21 @@ static unsigned long lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
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
 	u32 value;
 
 	pm_runtime_get(lg->dev); /* should we put if failed */
 
 	/* Fail if BIOS reserved pin for ACPI use */
-	if (!(inl(acpi_use) & BIT(offset % 32))) {
+	if (!(ioread32(acpi_use) & BIT(offset % 32))) {
 		dev_err(lg->dev, "gpio %d reserved for ACPI\n", offset);
 		return -EBUSY;
 	}
@@ -118,14 +118,14 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 	 * Reconfigure pin to GPIO mode if needed and issue a warning,
 	 * since we expect firmware to configure it properly.
 	 */
-	value = inl(reg);
+	value = ioread32(reg);
 	if ((value & USE_SEL_MASK) != USE_SEL_GPIO) {
-		outl((value & USE_SEL_MASK) | USE_SEL_GPIO, reg);
+		iowrite32((value & USE_SEL_MASK) | USE_SEL_GPIO, reg);
 		dev_warn(lg->dev, FW_BUG "pin %u forcibly reconfigured as GPIO\n", offset);
 	}
 
 	/* enable input sensing */
-	outl(inl(conf2) & ~GPINDIS_BIT, conf2);
+	iowrite32(ioread32(conf2) & ~GPINDIS_BIT, conf2);
 
 
 	return 0;
@@ -134,10 +134,10 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
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
@@ -147,15 +147,15 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
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
@@ -173,7 +173,7 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 	if (type & IRQ_TYPE_LEVEL_HIGH)
 		value |= TRIG_SEL_BIT | INT_INV_BIT;
 
-	outl(value, reg);
+	iowrite32(value, reg);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(d, handle_edge_irq);
@@ -187,22 +187,22 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 
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
@@ -210,11 +210,11 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
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
@@ -224,13 +224,13 @@ static int lp_gpio_direction_output(struct gpio_chip *chip,
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
@@ -242,7 +242,8 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct lp_gpio *lg = gpiochip_get_data(gc);
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
-	unsigned long reg, ena, pending;
+	void __iomem *reg, *ena;
+	unsigned long pending;
 	u32 base, pin;
 
 	/* check from GPIO controller which pin triggered the interrupt */
@@ -251,13 +252,13 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
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
@@ -279,11 +280,11 @@ static void lp_irq_enable(struct irq_data *d)
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
 
@@ -292,11 +293,11 @@ static void lp_irq_disable(struct irq_data *d)
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
 
@@ -313,16 +314,16 @@ static struct irq_chip lp_irqchip = {
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
@@ -334,7 +335,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	struct gpio_chip *gc;
 	struct resource *io_rc, *irq_rc;
 	struct device *dev = &pdev->dev;
-	unsigned long reg_len;
+	void __iomem *regs;
 	int ret;
 
 	lg = devm_kzalloc(dev, sizeof(*lg), GFP_KERNEL);
@@ -345,21 +346,19 @@ static int lp_gpio_probe(struct platform_device *pdev)
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
+	regs = devm_ioport_map(dev, io_rc->start, resource_size(io_rc));
+	if (!regs) {
+		dev_err(dev, "failed mapping IO region %pR\n", &io_rc);
 		return -EBUSY;
 	}
 
+	lg->regs = regs;
+
 	raw_spin_lock_init(&lg->lock);
 
 	gc = &lg->chip;
@@ -377,6 +376,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->parent = dev;
 
 	/* set up interrupts  */
+	irq_rc = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (irq_rc && irq_rc->start) {
 		struct gpio_irq_chip *girq;
 
@@ -419,14 +419,14 @@ static int lp_gpio_runtime_resume(struct device *dev)
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
2.24.0

