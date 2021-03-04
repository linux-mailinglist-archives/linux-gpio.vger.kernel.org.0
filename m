Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86AEB32DD9D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 00:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbhCDXKE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 18:10:04 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:43367 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhCDXKD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 18:10:03 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Ds65j6PZWz1qrf4;
        Fri,  5 Mar 2021 00:10:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Ds65j5bmSz1sP7F;
        Fri,  5 Mar 2021 00:10:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id CcHPO68a8lMi; Fri,  5 Mar 2021 00:10:00 +0100 (CET)
X-Auth-Info: vBsr98+W1+HvbJMaliq6omsSw8EnZj9JJI/qocATKLo=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri,  5 Mar 2021 00:10:00 +0100 (CET)
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] Revert "gpiolib: generalize devprop_gpiochip_set_names() for device properties"
Date:   Fri,  5 Mar 2021 00:09:56 +0100
Message-Id: <20210304230956.154626-1-marex@denx.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names()
for device properties") because this breaks OF "gpio-line-names" behavior on
STM32MP1 platform.

On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000, see
arch/arm/boot/dts/stm32mp151.dtsi. The driver for pin-controller@50002000
is in drivers/pinctrl/stm32/pinctrl-stm32.c and iterates over all of its DT
subnodes when registering each GPIO bank gpiochip. Each gpiochip has:
- gpio_chip.parent = dev where dev is the device node of the pin controller
- gpio_chip.of_node = np which is the OF node of the GPIO bank
Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node) , i.e.
pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.

The original code behaved correctly, as it extracted the "gpio-line-names"
from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
This patch reinstates the original correct behavior.

Signed-off-by: Marek Vasut <marex@denx.de>
Reported-by: Roman Guskov <rguskov@dh-electronics.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Roman Guskov <rguskov@dh-electronics.com>
---
 drivers/gpio/gpiolib-acpi.c |  3 +++
 drivers/gpio/gpiolib-of.c   |  5 +++++
 drivers/gpio/gpiolib.c      | 32 ++++++++++++++------------------
 include/linux/gpio/driver.h |  3 +++
 4 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index e37a57d0a2f07..7a7618edfa198 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1252,6 +1252,9 @@ void acpi_gpiochip_add(struct gpio_chip *chip)
 		return;
 	}
 
+	if (!chip->names)
+		devprop_gpiochip_set_names(chip, dev_fwnode(chip->parent));
+
 	acpi_gpiochip_request_regions(acpi_gpio);
 	acpi_gpiochip_scan_gpios(acpi_gpio);
 	acpi_walk_dep_device_list(handle);
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index baf0153b7bca3..3b21c999172e6 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1026,6 +1026,11 @@ int of_gpiochip_add(struct gpio_chip *chip)
 	if (ret)
 		return ret;
 
+	/* If the chip defines names itself, these take precedence */
+	if (!chip->names)
+		devprop_gpiochip_set_names(chip,
+					   of_fwnode_handle(chip->of_node));
+
 	of_node_get(chip->of_node);
 
 	ret = of_gpiochip_scan_gpios(chip);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index adf55db080d86..12362cd9b3c98 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -343,6 +343,9 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 	struct gpio_device *gdev = gc->gpiodev;
 	int i;
 
+	if (!gc->names)
+		return 0;
+
 	/* First check all names if they are unique */
 	for (i = 0; i != gc->ngpio; ++i) {
 		struct gpio_desc *gpio;
@@ -364,27 +367,25 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 /*
  * devprop_gpiochip_set_names - Set GPIO line names using device properties
  * @chip: GPIO chip whose lines should be named, if possible
+ * @fwnode: Property Node containing the gpio-line-names property
  *
  * Looks for device property "gpio-line-names" and if it exists assigns
  * GPIO line names for the chip. The memory allocated for the assigned
- * names belong to the underlying software node and should not be released
+ * names belong to the underlying firmware node and should not be released
  * by the caller.
  */
-static int devprop_gpiochip_set_names(struct gpio_chip *chip)
+void devprop_gpiochip_set_names(struct gpio_chip *chip,
+				const struct fwnode_handle *fwnode)
 {
 	struct gpio_device *gdev = chip->gpiodev;
-	struct device *dev = chip->parent;
 	const char **names;
 	int ret, i;
 	int count;
 
-	/* GPIO chip may not have a parent device whose properties we inspect. */
-	if (!dev)
-		return 0;
-
-	count = device_property_string_array_count(dev, "gpio-line-names");
+	count = fwnode_property_read_string_array(fwnode, "gpio-line-names",
+						  NULL, 0);
 	if (count < 0)
-		return 0;
+		return;
 
 	if (count > gdev->ngpio) {
 		dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
@@ -394,22 +395,20 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 
 	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
 	if (!names)
-		return -ENOMEM;
+		return;
 
-	ret = device_property_read_string_array(dev, "gpio-line-names",
+	ret = fwnode_property_read_string_array(fwnode, "gpio-line-names",
 						names, count);
 	if (ret < 0) {
 		dev_warn(&gdev->dev, "failed to read GPIO line names\n");
 		kfree(names);
-		return ret;
+		return;
 	}
 
 	for (i = 0; i < count; i++)
 		gdev->descs[i].name = names[i];
 
 	kfree(names);
-
-	return 0;
 }
 
 static unsigned long *gpiochip_allocate_mask(struct gpio_chip *gc)
@@ -682,10 +681,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
 
-	if (gc->names)
-		ret = gpiochip_set_desc_names(gc);
-	else
-		ret = devprop_gpiochip_set_names(gc);
+	ret = gpiochip_set_desc_names(gc);
 	if (ret)
 		goto err_remove_from_list;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 286de0520574e..adc1ddcd1b739 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -685,6 +685,9 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 					    enum gpiod_flags dflags);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
+void devprop_gpiochip_set_names(struct gpio_chip *gc,
+				const struct fwnode_handle *fwnode);
+
 #ifdef CONFIG_GPIOLIB
 
 /* lock/unlock as IRQ */
-- 
2.30.1

