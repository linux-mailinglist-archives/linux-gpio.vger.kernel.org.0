Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 914E810D8EE
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 18:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfK2RZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 12:25:59 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37301 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbfK2RZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 12:25:48 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iak1U-0003D6-Mz; Fri, 29 Nov 2019 18:25:40 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iak1S-0003AN-LL; Fri, 29 Nov 2019 18:25:38 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, joel@jms.id.au, andrew@aj.id.au,
        lgirdwood@gmail.com, broonie@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH v3 1/6] gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset
Date:   Fri, 29 Nov 2019 18:25:32 +0100
Message-Id: <20191129172537.31410-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129172537.31410-1-m.felsch@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During discussion [1] we decided to rename the gpio subsystem local
helper so the name is more meaningful for users outside the gpio
subsystem. Making the helper public is done by a 2nd patch. The
current users are the gpiolib itself and the aspeed gpio driver.
The renaming is done by the following command:

    find ./drivers/gpio -type f -exec sed -i 's/gpio_chip_hwgpio/gpiod_to_offset/g' {} \;

[1] https://lkml.org/lkml/2019/11/27/357

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:
v3:
- new patch

 drivers/gpio/gpio-aspeed.c   |  6 ++---
 drivers/gpio/gpiolib-sysfs.c |  8 +++---
 drivers/gpio/gpiolib.c       | 52 ++++++++++++++++++------------------
 drivers/gpio/gpiolib.h       |  2 +-
 4 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 09e53c5f3b0a..b1d1d39e5174 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -21,7 +21,7 @@
 
 /*
  * These two headers aren't meant to be used by GPIO drivers. We need
- * them in order to access gpio_chip_hwgpio() which we need to implement
+ * them in order to access gpiod_to_offset() which we need to implement
  * the aspeed specific API which allows the coprocessor to request
  * access to some GPIOs and to arbitrate between coprocessor and ARM.
  */
@@ -1007,7 +1007,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 {
 	struct gpio_chip *chip = gpiod_to_chip(desc);
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
-	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
+	int rc = 0, bindex, offset = gpiod_to_offset(desc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 
@@ -1053,7 +1053,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 {
 	struct gpio_chip *chip = gpiod_to_chip(desc);
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
-	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
+	int rc = 0, bindex, offset = gpiod_to_offset(desc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fbf6b1a0a4fa..d4cab6a80928 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -192,7 +192,7 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	 *        Remove this redundant call (along with the corresponding
 	 *        unlock) when those drivers have been fixed.
 	 */
-	ret = gpiochip_lock_as_irq(desc->gdev->chip, gpio_chip_hwgpio(desc));
+	ret = gpiochip_lock_as_irq(desc->gdev->chip, gpiod_to_offset(desc));
 	if (ret < 0)
 		goto err_put_kn;
 
@@ -206,7 +206,7 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	return 0;
 
 err_unlock:
-	gpiochip_unlock_as_irq(desc->gdev->chip, gpio_chip_hwgpio(desc));
+	gpiochip_unlock_as_irq(desc->gdev->chip, gpiod_to_offset(desc));
 err_put_kn:
 	sysfs_put(data->value_kn);
 
@@ -224,7 +224,7 @@ static void gpio_sysfs_free_irq(struct device *dev)
 
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
-	gpiochip_unlock_as_irq(desc->gdev->chip, gpio_chip_hwgpio(desc));
+	gpiochip_unlock_as_irq(desc->gdev->chip, gpiod_to_offset(desc));
 	sysfs_put(data->value_kn);
 }
 
@@ -622,7 +622,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	else
 		data->direction_can_change = false;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_to_offset(desc);
 	if (chip->names && chip->names[offset])
 		ioname = chip->names[offset];
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 104ed299d5ea..548cf41c6179 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -218,7 +218,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	int ret;
 
 	chip = gpiod_to_chip(desc);
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_to_offset(desc);
 
 	if (!chip->get_direction)
 		return -ENOTSUPP;
@@ -2679,7 +2679,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	if (chip->request) {
 		/* chip->request may sleep */
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		offset = gpio_chip_hwgpio(desc);
+		offset = gpiod_to_offset(desc);
 		if (gpiochip_line_is_valid(chip, offset))
 			ret = chip->request(chip, offset);
 		else
@@ -2781,7 +2781,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		if (chip->free) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
 			might_sleep_if(chip->can_sleep);
-			chip->free(chip, gpio_chip_hwgpio(desc));
+			chip->free(chip, gpiod_to_offset(desc));
 			spin_lock_irqsave(&gpio_lock, flags);
 		}
 		kfree_const(desc->label);
@@ -2965,9 +2965,9 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	 * assume we are in input mode after this.
 	 */
 	if (chip->direction_input) {
-		ret = chip->direction_input(chip, gpio_chip_hwgpio(desc));
+		ret = chip->direction_input(chip, gpiod_to_offset(desc));
 	} else if (chip->get_direction &&
-		  (chip->get_direction(chip, gpio_chip_hwgpio(desc)) != 1)) {
+		  (chip->get_direction(chip, gpiod_to_offset(desc)) != 1)) {
 		gpiod_warn(desc,
 			   "%s: missing direction_input() operation and line is output\n",
 			   __func__);
@@ -2977,10 +2977,10 @@ int gpiod_direction_input(struct gpio_desc *desc)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
 	if (test_bit(FLAG_PULL_UP, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
+		gpio_set_config(chip, gpiod_to_offset(desc),
 				PIN_CONFIG_BIAS_PULL_UP);
 	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-		gpio_set_config(chip, gpio_chip_hwgpio(desc),
+		gpio_set_config(chip, gpiod_to_offset(desc),
 				PIN_CONFIG_BIAS_PULL_DOWN);
 
 	trace_gpio_direction(desc_to_gpio(desc), 1, ret);
@@ -3008,11 +3008,11 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	}
 
 	if (gc->direction_output) {
-		ret = gc->direction_output(gc, gpio_chip_hwgpio(desc), val);
+		ret = gc->direction_output(gc, gpiod_to_offset(desc), val);
 	} else {
 		/* Check that we are in output mode if we can */
 		if (gc->get_direction &&
-		    gc->get_direction(gc, gpio_chip_hwgpio(desc))) {
+		    gc->get_direction(gc, gpiod_to_offset(desc))) {
 			gpiod_warn(desc,
 				"%s: missing direction_output() operation\n",
 				__func__);
@@ -3022,7 +3022,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		 * If we can't actively set the direction, we are some
 		 * output-only chip, so just drive the output as desired.
 		 */
-		gc->set(gc, gpio_chip_hwgpio(desc), val);
+		gc->set(gc, gpiod_to_offset(desc), val);
 	}
 
 	if (!ret)
@@ -3085,7 +3085,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	gc = desc->gdev->chip;
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
 		/* First see if we can enable open drain in hardware */
-		ret = gpio_set_config(gc, gpio_chip_hwgpio(desc),
+		ret = gpio_set_config(gc, gpiod_to_offset(desc),
 				      PIN_CONFIG_DRIVE_OPEN_DRAIN);
 		if (!ret)
 			goto set_output_value;
@@ -3096,7 +3096,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 		}
 	}
 	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
-		ret = gpio_set_config(gc, gpio_chip_hwgpio(desc),
+		ret = gpio_set_config(gc, gpiod_to_offset(desc),
 				      PIN_CONFIG_DRIVE_OPEN_SOURCE);
 		if (!ret)
 			goto set_output_value;
@@ -3106,7 +3106,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 			goto set_output_flag;
 		}
 	} else {
-		gpio_set_config(gc, gpio_chip_hwgpio(desc),
+		gpio_set_config(gc, gpiod_to_offset(desc),
 				PIN_CONFIG_DRIVE_PUSH_PULL);
 	}
 
@@ -3150,7 +3150,7 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	}
 
 	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
-	return chip->set_config(chip, gpio_chip_hwgpio(desc), config);
+	return chip->set_config(chip, gpiod_to_offset(desc), config);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
@@ -3186,7 +3186,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 
 	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
 					  !transitory);
-	gpio = gpio_chip_hwgpio(desc);
+	gpio = gpiod_to_offset(desc);
 	rc = chip->set_config(chip, gpio, packed);
 	if (rc == -ENOTSUPP) {
 		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
@@ -3240,7 +3240,7 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 	int value;
 
 	chip = desc->gdev->chip;
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_to_offset(desc);
 	value = chip->get ? chip->get(chip, offset) : -EIO;
 	value = value < 0 ? value : !!value;
 	trace_gpio_value(desc_to_gpio(desc), 1, value);
@@ -3329,7 +3329,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		first = i;
 		do {
 			const struct gpio_desc *desc = desc_array[i];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_to_offset(desc);
 
 			__set_bit(hwgpio, mask);
 			i++;
@@ -3349,7 +3349,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 
 		for (j = first; j < i; ) {
 			const struct gpio_desc *desc = desc_array[j];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_to_offset(desc);
 			int value = test_bit(hwgpio, bits);
 
 			if (!raw && test_bit(FLAG_ACTIVE_LOW, &desc->flags))
@@ -3479,7 +3479,7 @@ static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0;
 	struct gpio_chip *chip = desc->gdev->chip;
-	int offset = gpio_chip_hwgpio(desc);
+	int offset = gpiod_to_offset(desc);
 
 	if (value) {
 		ret = chip->direction_input(chip, offset);
@@ -3504,7 +3504,7 @@ static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value
 {
 	int ret = 0;
 	struct gpio_chip *chip = desc->gdev->chip;
-	int offset = gpio_chip_hwgpio(desc);
+	int offset = gpiod_to_offset(desc);
 
 	if (value) {
 		ret = chip->direction_output(chip, offset, 1);
@@ -3526,7 +3526,7 @@ static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 
 	chip = desc->gdev->chip;
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	chip->set(chip, gpio_chip_hwgpio(desc), value);
+	chip->set(chip, gpiod_to_offset(desc), value);
 }
 
 /*
@@ -3610,7 +3610,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 
 		do {
 			struct gpio_desc *desc = desc_array[i];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_to_offset(desc);
 			int value = test_bit(i, value_bitmap);
 
 			/*
@@ -3822,7 +3822,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 		return -EINVAL;
 
 	chip = desc->gdev->chip;
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_to_offset(desc);
 	if (chip->to_irq) {
 		int retirq = chip->to_irq(chip, offset);
 
@@ -4678,7 +4678,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	int ret;
 
 	chip = gpiod_to_chip(desc);
-	hwnum = gpio_chip_hwgpio(desc);
+	hwnum = gpiod_to_offset(desc);
 
 	local_desc = gpiochip_request_own_desc(chip, hwnum, name,
 					       lflags, dflags);
@@ -4759,7 +4759,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 * If pin hardware number of array member 0 is also 0, select
 		 * its chip as a candidate for fast bitmap processing path.
 		 */
-		if (descs->ndescs == 0 && gpio_chip_hwgpio(desc) == 0) {
+		if (descs->ndescs == 0 && gpiod_to_offset(desc) == 0) {
 			struct gpio_descs *array;
 
 			bitmap_size = BITS_TO_LONGS(chip->ngpio > count ?
@@ -4803,7 +4803,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 * but their pins are not in hardware order.
 		 */
 		else if (array_info &&
-			   gpio_chip_hwgpio(desc) != descs->ndescs) {
+			   gpiod_to_offset(desc) != descs->ndescs) {
 			/*
 			 * Don't use fast path if all array members processed so
 			 * far belong to the same chip as this one but its pin
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b8b10a409c7b..a7f93ce6e114 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -127,7 +127,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
  */
-static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
+static inline int gpiod_to_offet(const struct gpio_desc *desc)
 {
 	return desc - &desc->gdev->descs[0];
 }
-- 
2.20.1

