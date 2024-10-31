Return-Path: <linux-gpio+bounces-12356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C89B7856
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 11:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8101C21147
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 10:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B48D1946CF;
	Thu, 31 Oct 2024 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQvhKQtJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD14812C478;
	Thu, 31 Oct 2024 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730369175; cv=none; b=b0AMOqVc2giGaEBDQeIF12SCqMLxlUhmJZ6x76PfUjEr6T286lpiRwOBzf4g2uyx6DGV1tqCs01WY5w9KtfiEEiv4bnAp8jE70Tw61eiofgF+chWwD+Pw1xQjtkEBkr6c3m3Hslxqprmllo8LorRbLGdX6nobzSUeApZTiZpKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730369175; c=relaxed/simple;
	bh=i2n1EABRuu+xXI0n8nOypJacRYM0a5ZiqO0YHTXY1zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OLOhopo48KlbGXQ679sULyj73ROL958YOPnDwgsdCyU/lUGsX/Dm4YaoxsBWF2InA6ASgBGPjjiOH2wTLBAPaT54l2e6BYMgY7kfzx75t5FSY2mHDa9eV38rBj8wB079TZF+B6JeG9vN9qtN+0VAcuepqKJvcngr8HfczcuQkdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQvhKQtJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730369173; x=1761905173;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i2n1EABRuu+xXI0n8nOypJacRYM0a5ZiqO0YHTXY1zI=;
  b=cQvhKQtJ+ha5xC/0aTVjuN7iScW3vn8FpnZHkfszG67iiPbLW/Fm+sHu
   GaVkAUJdFiuTqniL030MrUSo2W9i0NguUMgGQY0GYzRQpk5tUzOQGqmKy
   x8Ys1J15FQ/vj4UIRjaYpAhAr3qjePLDIF4cEFR4Xp41M5EqmvvxDWqJ8
   pXlHNxzt1ctTW08cV4L06oO0tZyAe44J0bFec3NkacnrgmWlBioH8xG6U
   IKs7TJlUD9bRH+mJmfaNOIWFMZlNRAI/A+3IMZsuMvgo3XKZ1G7aMh4pl
   hR4sWSvXPsCqf8AV90ByFko/GWvetrNox4gaJ0SfN81wI2Y0Iidc688wx
   Q==;
X-CSE-ConnectionGUID: 0vvZ0GNpTk2BQxIhbBiLwA==
X-CSE-MsgGUID: C3D+VF77Smac/aDCqoeOEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30264458"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30264458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:06:13 -0700
X-CSE-ConnectionGUID: YBYajD9ERhiDSekzaVgEpQ==
X-CSE-MsgGUID: AgA0OFHHSKGUOAzPiDZWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87182745"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2024 03:06:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 180A11C4; Thu, 31 Oct 2024 12:06:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: altera: Drop legacy-of-mm-gpiochip.h header
Date: Thu, 31 Oct 2024 12:06:08 +0200
Message-ID: <20241031100608.2401209-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove legacy-of-mm-gpiochip.h header file, replace of_* functions
and structs with appropriate alternatives.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-altera.c | 175 ++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 100 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 6340134d68c6..cac8696091f7 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -4,11 +4,16 @@
  * Based on gpio-mpc8xxx.c
  */
 
+#include <linux/bitops.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/gpio/driver.h>
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <linux/gpio/driver.h>
 
 #define ALTERA_GPIO_MAX_NGPIO		32
 #define ALTERA_GPIO_DATA		0x0
@@ -18,7 +23,8 @@
 
 /**
 * struct altera_gpio_chip
-* @mmchip		: memory mapped chip structure.
+* @gc			: GPIO chip structure.
+* @regs			: memory mapped IO address for the controller registers.
 * @gpio_lock		: synchronization lock so that new irq/set/get requests
 *			  will be blocked until the current one completes.
 * @interrupt_trigger	: specifies the hardware configured IRQ trigger type
@@ -26,7 +32,8 @@
 * @mapped_irq		: kernel mapped irq number.
 */
 struct altera_gpio_chip {
-	struct of_mm_gpio_chip mmchip;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	raw_spinlock_t gpio_lock;
 	int interrupt_trigger;
 	int mapped_irq;
@@ -34,40 +41,36 @@ struct altera_gpio_chip {
 
 static void altera_gpio_irq_unmask(struct irq_data *d)
 {
-	struct altera_gpio_chip *altera_gc;
-	struct of_mm_gpio_chip *mm_gc;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 intmask;
 
-	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	mm_gc = &altera_gc->mmchip;
-	gpiochip_enable_irq(&mm_gc->gc, irqd_to_hwirq(d));
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 
 	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
-	intmask = readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	intmask = readl(altera_gc->regs + ALTERA_GPIO_IRQ_MASK);
 	/* Set ALTERA_GPIO_IRQ_MASK bit to unmask */
 	intmask |= BIT(irqd_to_hwirq(d));
-	writel(intmask, mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	writel(intmask, altera_gc->regs + ALTERA_GPIO_IRQ_MASK);
 	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
 }
 
 static void altera_gpio_irq_mask(struct irq_data *d)
 {
-	struct altera_gpio_chip *altera_gc;
-	struct of_mm_gpio_chip *mm_gc;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 	u32 intmask;
 
-	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	mm_gc = &altera_gc->mmchip;
-
 	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
-	intmask = readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	intmask = readl(altera_gc->regs + ALTERA_GPIO_IRQ_MASK);
 	/* Clear ALTERA_GPIO_IRQ_MASK bit to mask */
 	intmask &= ~BIT(irqd_to_hwirq(d));
-	writel(intmask, mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	writel(intmask, altera_gc->regs + ALTERA_GPIO_IRQ_MASK);
 	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
-	gpiochip_disable_irq(&mm_gc->gc, irqd_to_hwirq(d));
+
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 /*
@@ -77,9 +80,8 @@ static void altera_gpio_irq_mask(struct irq_data *d)
 static int altera_gpio_irq_set_type(struct irq_data *d,
 				   unsigned int type)
 {
-	struct altera_gpio_chip *altera_gc;
-
-	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 
 	if (type == IRQ_TYPE_NONE) {
 		irq_set_handler_locked(d, handle_bad_irq);
@@ -105,49 +107,39 @@ static unsigned int altera_gpio_irq_startup(struct irq_data *d)
 
 static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct of_mm_gpio_chip *mm_gc;
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 
-	mm_gc = to_of_mm_gpio_chip(gc);
-
-	return !!(readl(mm_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));
+	return !!(readl(altera_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));
 }
 
 static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct of_mm_gpio_chip *mm_gc;
-	struct altera_gpio_chip *chip;
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 	unsigned int data_reg;
 
-	mm_gc = to_of_mm_gpio_chip(gc);
-	chip = gpiochip_get_data(gc);
-
-	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
-	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
+	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
+	data_reg = readl(altera_gc->regs + ALTERA_GPIO_DATA);
 	if (value)
 		data_reg |= BIT(offset);
 	else
 		data_reg &= ~BIT(offset);
-	writel(data_reg, mm_gc->regs + ALTERA_GPIO_DATA);
-	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	writel(data_reg, altera_gc->regs + ALTERA_GPIO_DATA);
+	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
 }
 
 static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct of_mm_gpio_chip *mm_gc;
-	struct altera_gpio_chip *chip;
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 	unsigned int gpio_ddr;
 
-	mm_gc = to_of_mm_gpio_chip(gc);
-	chip = gpiochip_get_data(gc);
-
-	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
 	/* Set pin as input, assumes software controlled IP */
-	gpio_ddr = readl(mm_gc->regs + ALTERA_GPIO_DIR);
+	gpio_ddr = readl(altera_gc->regs + ALTERA_GPIO_DIR);
 	gpio_ddr &= ~BIT(offset);
-	writel(gpio_ddr, mm_gc->regs + ALTERA_GPIO_DIR);
-	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	writel(gpio_ddr, altera_gc->regs + ALTERA_GPIO_DIR);
+	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
 
 	return 0;
 }
@@ -155,53 +147,46 @@ static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 static int altera_gpio_direction_output(struct gpio_chip *gc,
 		unsigned offset, int value)
 {
-	struct of_mm_gpio_chip *mm_gc;
-	struct altera_gpio_chip *chip;
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 	unsigned int data_reg, gpio_ddr;
 
-	mm_gc = to_of_mm_gpio_chip(gc);
-	chip = gpiochip_get_data(gc);
-
-	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
 	/* Sets the GPIO value */
-	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
+	data_reg = readl(altera_gc->regs + ALTERA_GPIO_DATA);
 	if (value)
 		data_reg |= BIT(offset);
 	else
 		data_reg &= ~BIT(offset);
-	writel(data_reg, mm_gc->regs + ALTERA_GPIO_DATA);
+	writel(data_reg, altera_gc->regs + ALTERA_GPIO_DATA);
 
 	/* Set pin as output, assumes software controlled IP */
-	gpio_ddr = readl(mm_gc->regs + ALTERA_GPIO_DIR);
+	gpio_ddr = readl(altera_gc->regs + ALTERA_GPIO_DIR);
 	gpio_ddr |= BIT(offset);
-	writel(gpio_ddr, mm_gc->regs + ALTERA_GPIO_DIR);
-	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	writel(gpio_ddr, altera_gc->regs + ALTERA_GPIO_DIR);
+	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
 
 	return 0;
 }
 
 static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 {
-	struct altera_gpio_chip *altera_gc;
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
+	struct irq_domain *irqdomain = gc->irq.domain;
 	struct irq_chip *chip;
-	struct of_mm_gpio_chip *mm_gc;
-	struct irq_domain *irqdomain;
 	unsigned long status;
 	int i;
 
-	altera_gc = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
-	mm_gc = &altera_gc->mmchip;
-	irqdomain = altera_gc->mmchip.gc.irq.domain;
 
 	chained_irq_enter(chip, desc);
 
 	while ((status =
-	      (readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
-	      readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
-		writel(status, mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
-		for_each_set_bit(i, &status, mm_gc->gc.ngpio)
+	        (readl(altera_gc->regs + ALTERA_GPIO_EDGE_CAP) &
+	         readl(altera_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
+		writel(status, altera_gc->regs + ALTERA_GPIO_EDGE_CAP);
+		for_each_set_bit(i, &status, gc->ngpio)
 			generic_handle_domain_irq(irqdomain, i);
 	}
 
@@ -210,24 +195,21 @@ static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 
 static void altera_gpio_irq_leveL_high_handler(struct irq_desc *desc)
 {
-	struct altera_gpio_chip *altera_gc;
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
+	struct irq_domain *irqdomain = gc->irq.domain;
 	struct irq_chip *chip;
-	struct of_mm_gpio_chip *mm_gc;
-	struct irq_domain *irqdomain;
 	unsigned long status;
 	int i;
 
-	altera_gc = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
-	mm_gc = &altera_gc->mmchip;
-	irqdomain = altera_gc->mmchip.gc.irq.domain;
 
 	chained_irq_enter(chip, desc);
 
-	status = readl(mm_gc->regs + ALTERA_GPIO_DATA);
-	status &= readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
+	status = readl(altera_gc->regs + ALTERA_GPIO_DATA);
+	status &= readl(altera_gc->regs + ALTERA_GPIO_IRQ_MASK);
 
-	for_each_set_bit(i, &status, mm_gc->gc.ngpio)
+	for_each_set_bit(i, &status, gc->ngpio)
 		generic_handle_domain_irq(irqdomain, i);
 
 	chained_irq_exit(chip, desc);
@@ -246,7 +228,7 @@ static const struct irq_chip altera_gpio_irq_chip = {
 
 static int altera_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	int reg, ret;
 	struct altera_gpio_chip *altera_gc;
 	struct gpio_irq_chip *girq;
@@ -257,39 +239,42 @@ static int altera_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&altera_gc->gpio_lock);
 
-	if (of_property_read_u32(node, "altr,ngpio", &reg))
+	if (device_property_read_u32(dev, "altr,ngpio", &reg))
 		/* By default assume maximum ngpio */
-		altera_gc->mmchip.gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+		altera_gc->gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
 	else
-		altera_gc->mmchip.gc.ngpio = reg;
+		altera_gc->gc.ngpio = reg;
 
-	if (altera_gc->mmchip.gc.ngpio > ALTERA_GPIO_MAX_NGPIO) {
+	if (altera_gc->gc.ngpio > ALTERA_GPIO_MAX_NGPIO) {
 		dev_warn(&pdev->dev,
 			"ngpio is greater than %d, defaulting to %d\n",
 			ALTERA_GPIO_MAX_NGPIO, ALTERA_GPIO_MAX_NGPIO);
-		altera_gc->mmchip.gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+		altera_gc->gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
 	}
 
-	altera_gc->mmchip.gc.direction_input	= altera_gpio_direction_input;
-	altera_gc->mmchip.gc.direction_output	= altera_gpio_direction_output;
-	altera_gc->mmchip.gc.get		= altera_gpio_get;
-	altera_gc->mmchip.gc.set		= altera_gpio_set;
-	altera_gc->mmchip.gc.owner		= THIS_MODULE;
-	altera_gc->mmchip.gc.parent		= &pdev->dev;
+	altera_gc->gc.direction_input	= altera_gpio_direction_input;
+	altera_gc->gc.direction_output	= altera_gpio_direction_output;
+	altera_gc->gc.get		= altera_gpio_get;
+	altera_gc->gc.set		= altera_gpio_set;
+	altera_gc->gc.owner		= THIS_MODULE;
+	altera_gc->gc.parent		= &pdev->dev;
+
+	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(altera_gc->regs))
+		return dev_err_probe(dev, PTR_ERR(altera_gc->regs), "failed to ioremap memory resource\n");
 
 	altera_gc->mapped_irq = platform_get_irq_optional(pdev, 0);
-
 	if (altera_gc->mapped_irq < 0)
 		goto skip_irq;
 
-	if (of_property_read_u32(node, "altr,interrupt-type", &reg)) {
+	if (device_property_read_u32(dev, "altr,interrupt-type", &reg)) {
 		dev_err(&pdev->dev,
 			"altr,interrupt-type value not set in device tree\n");
 		return -EINVAL;
 	}
 	altera_gc->interrupt_trigger = reg;
 
-	girq = &altera_gc->mmchip.gc.irq;
+	girq = &altera_gc->gc.irq;
 	gpio_irq_chip_set_chip(girq, &altera_gpio_irq_chip);
 
 	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)
@@ -306,24 +291,15 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	girq->parents[0] = altera_gc->mapped_irq;
 
 skip_irq:
-	ret = of_mm_gpiochip_add_data(node, &altera_gc->mmchip, altera_gc);
+	ret = devm_gpiochip_add_data(dev, &altera_gc->gc, altera_gc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, altera_gc);
-
 	return 0;
 }
 
-static void altera_gpio_remove(struct platform_device *pdev)
-{
-	struct altera_gpio_chip *altera_gc = platform_get_drvdata(pdev);
-
-	of_mm_gpiochip_remove(&altera_gc->mmchip);
-}
-
 static const struct of_device_id altera_gpio_of_match[] = {
 	{ .compatible = "altr,pio-1.0", },
 	{},
@@ -336,7 +312,6 @@ static struct platform_driver altera_gpio_driver = {
 		.of_match_table = altera_gpio_of_match,
 	},
 	.probe		= altera_gpio_probe,
-	.remove		= altera_gpio_remove,
 };
 
 static int __init altera_gpio_init(void)
-- 
2.43.0.rc1.1336.g36b5255a03ac


