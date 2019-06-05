Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54697367D0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 01:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfFEXTD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 19:19:03 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:30043 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfFEXTD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 19:19:03 -0400
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id x55NIxKF018857
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Jun 2019 17:18:59 -0600 (CST)
Received: from SED.RFC1918.192.168.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id x55NIwoj006279
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 5 Jun 2019 17:18:59 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH] gpio: xilinx: convert from OF GPIO to standard devm APIs
Date:   Wed,  5 Jun 2019 17:18:52 -0600
Message-Id: <1559776732-27636-1-git-send-email-hancock@sedsystems.ca>
X-Mailer: git-send-email 1.8.3.1
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver was using the OF GPIO helper API, but barely used any of its
features and it cost more code than it saved. Also, the OF GPIO code is
now deprecated. Convert it to use a more standard setup and use devm
APIs for initialization to avoid the need for a remove function.

Our rationale for this change is that we are using the Xilinx GPIO with
resources injected using the MFD core rather than on the device tree
itself. Using platform rather than OF-specific resources allows this to
work for free.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 drivers/gpio/Kconfig       |   1 -
 drivers/gpio/gpio-xilinx.c | 105 ++++++++++++++++++++-------------------------
 2 files changed, 47 insertions(+), 59 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index acd40eb..66f1f13 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -602,7 +602,6 @@ config GPIO_XGENE_SB
 
 config GPIO_XILINX
 	tristate "Xilinx GPIO support"
-	depends on OF_GPIO
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 32944eb..c9563b27 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -33,14 +32,16 @@
 
 /**
  * struct xgpio_instance - Stores information about GPIO device
- * @mmchip: OF GPIO chip for memory mapped banks
+ * @gc: GPIO chip
+ * @regs: register block
  * @gpio_width: GPIO width for every channel
  * @gpio_state: GPIO state shadow register
  * @gpio_dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
  */
 struct xgpio_instance {
-	struct of_mm_gpio_chip mmchip;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	unsigned int gpio_width[2];
 	u32 gpio_state[2];
 	u32 gpio_dir[2];
@@ -84,11 +85,10 @@ static inline int xgpio_offset(struct xgpio_instance *chip, int gpio)
  */
 static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 	u32 val;
 
-	val = xgpio_readreg(mm_gc->regs + XGPIO_DATA_OFFSET +
+	val = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
 			    xgpio_regoffset(chip, gpio));
 
 	return !!(val & BIT(xgpio_offset(chip, gpio)));
@@ -106,7 +106,6 @@ static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
 static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
@@ -119,7 +118,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		chip->gpio_state[index] &= ~BIT(offset);
 
-	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
+	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 		       xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
@@ -138,7 +137,6 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			       unsigned long *bits)
 {
 	unsigned long flags;
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 	int index = xgpio_index(chip, 0);
 	int offset, i;
@@ -150,7 +148,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 		if (*mask == 0)
 			break;
 		if (index !=  xgpio_index(chip, i)) {
-			xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
+			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 				       xgpio_regoffset(chip, i),
 				       chip->gpio_state[index]);
 			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
@@ -166,7 +164,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 		}
 	}
 
-	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
+	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 		       xgpio_regoffset(chip, i), chip->gpio_state[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
@@ -184,7 +182,6 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	unsigned long flags;
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
@@ -193,7 +190,7 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 	/* Set the GPIO bit in shadow register and set direction as input */
 	chip->gpio_dir[index] |= BIT(offset);
-	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET +
+	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 		       xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
@@ -216,7 +213,6 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
@@ -228,12 +224,12 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 		chip->gpio_state[index] |= BIT(offset);
 	else
 		chip->gpio_state[index] &= ~BIT(offset);
-	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
+	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 			xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
 
 	/* Clear the GPIO bit in shadow register and set direction as output */
 	chip->gpio_dir[index] &= ~BIT(offset);
-	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET +
+	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 			xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
@@ -243,43 +239,23 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 /**
  * xgpio_save_regs - Set initial values of GPIO pins
- * @mm_gc: Pointer to memory mapped GPIO chip structure
+ * @chip: Pointer to GPIO instance
  */
-static void xgpio_save_regs(struct of_mm_gpio_chip *mm_gc)
+static void xgpio_save_regs(struct xgpio_instance *chip)
 {
-	struct xgpio_instance *chip =
-		container_of(mm_gc, struct xgpio_instance, mmchip);
-
-	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET,	chip->gpio_state[0]);
-	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0]);
+	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET,	chip->gpio_state[0]);
+	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0]);
 
 	if (!chip->gpio_width[1])
 		return;
 
-	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFFSET,
+	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFFSET,
 		       chip->gpio_state[1]);
-	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFSET,
+	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFSET,
 		       chip->gpio_dir[1]);
 }
 
 /**
- * xgpio_remove - Remove method for the GPIO device.
- * @pdev: pointer to the platform device
- *
- * This function remove gpiochips and frees all the allocated resources.
- *
- * Return: 0 always
- */
-static int xgpio_remove(struct platform_device *pdev)
-{
-	struct xgpio_instance *chip = platform_get_drvdata(pdev);
-
-	of_mm_gpiochip_remove(&chip->mmchip);
-
-	return 0;
-}
-
-/**
  * xgpio_of_probe - Probe method for the GPIO device.
  * @pdev: pointer to the platform device
  *
@@ -340,25 +316,39 @@ static int xgpio_probe(struct platform_device *pdev)
 		spin_lock_init(&chip->gpio_lock[1]);
 	}
 
-	chip->mmchip.gc.ngpio = chip->gpio_width[0] + chip->gpio_width[1];
-	chip->mmchip.gc.parent = &pdev->dev;
-	chip->mmchip.gc.direction_input = xgpio_dir_in;
-	chip->mmchip.gc.direction_output = xgpio_dir_out;
-	chip->mmchip.gc.get = xgpio_get;
-	chip->mmchip.gc.set = xgpio_set;
-	chip->mmchip.gc.set_multiple = xgpio_set_multiple;
-
-	chip->mmchip.save_regs = xgpio_save_regs;
-
-	/* Call the OF gpio helper to setup and register the GPIO device */
-	status = of_mm_gpiochip_add_data(np, &chip->mmchip, chip);
-	if (status) {
-		pr_err("%pOF: error in probe function with status %d\n",
-		       np, status);
-		return status;
+	chip->gc.base = -1;
+	chip->gc.ngpio = chip->gpio_width[0] + chip->gpio_width[1];
+	chip->gc.parent = &pdev->dev;
+	chip->gc.direction_input = xgpio_dir_in;
+	chip->gc.direction_output = xgpio_dir_out;
+	chip->gc.get = xgpio_get;
+	chip->gc.set = xgpio_set;
+	chip->gc.set_multiple = xgpio_set_multiple;
+
+	chip->gc.label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOF", np);
+	if (!chip->gc.label) {
+		status = -ENOMEM;
+		goto probe_error;
+	}
+
+	chip->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(chip->regs)) {
+		status = PTR_ERR(chip->regs);
+		goto probe_error;
 	}
 
+	xgpio_save_regs(chip);
+
+	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
+	if (status)
+		goto probe_error;
+
 	return 0;
+
+probe_error:
+	pr_err("%pOF: error in probe function with status %d\n",
+	       np, status);
+	return status;
 }
 
 static const struct of_device_id xgpio_of_match[] = {
@@ -370,7 +360,6 @@ static int xgpio_probe(struct platform_device *pdev)
 
 static struct platform_driver xgpio_plat_driver = {
 	.probe		= xgpio_probe,
-	.remove		= xgpio_remove,
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
-- 
1.8.3.1

