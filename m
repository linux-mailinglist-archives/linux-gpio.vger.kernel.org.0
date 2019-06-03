Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B99A033A40
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 23:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfFCVvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 17:51:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52841 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFCVvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 17:51:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id s3so5421427wms.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qqvI+yIVxXINs4aGpj6be18z1tCSS3+QptrQMLPlFsY=;
        b=Sk9fzMDXavThWKy5XBPn6J/0gAsyUAxXYmUUnMnzjAJUynZM7qUcvPP0yCcVzjmZOG
         horljNKG6p+ydOf7kHJaDJOMi+GEIN7/CXDjoyigoMhQqvCu24CqKnYOwfzMsWcHPS1A
         K9+xw1MNHDikC3g/utH2Q9Un+oA3cEfmqLYasHm+hypSkOsMD8U7pvsb3fdm513WxlF9
         Wz4zNrH+tREKYphSBUKMw7qygCfXm+Zb/eGw1dI8sUdtGablXqYzBgrk2fg482WS9eun
         5Fy/MZDtlR67Q8vZgm1VuiJl/4zsKRaVANbVXWQFwNO5KiwX44r+dOQwnD556lnMuMcf
         JliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qqvI+yIVxXINs4aGpj6be18z1tCSS3+QptrQMLPlFsY=;
        b=je/bH9nRvnaVDVPl7H2rvkme5Zyk6T8ph3WsQzVItJg+XdPHpMuC0TZ84uFZezfpCv
         jqgtbELL+zdkt7yr6DpwBZuSZyCHFzwUnXlDZoNlYERzoQ4tgMNdT+pAF8q0ilHNZdcD
         RqEV2K4EAap6VvM95ggj3faTMP3ALl1K+p5a1JgFbexSNNMKIKtHWEIqprZJ/3Xr/c9K
         JxC1LXLYxvc6kS8ECJjZam84RoIEUx7TF95KKTGRHDA8qgw89ZOmgKyZ2mi5hwE7idTt
         0bGVwHNUvjfs9veLeVeXyJm6MmyiJbReA8chmCYwBZmtHAyuLPV9z9HnpApRWAxxWWzv
         UCWw==
X-Gm-Message-State: APjAAAXcf7jxtj4StnNbFbaK4Er4OJOXgo3rLPgJkt0oM7MLlZTSXpKC
        acc11xzoR5N82MTuvatfMJ8EeUruDYo=
X-Google-Smtp-Source: APXvYqzC0oAKfAQhVaHrYK5R/COHCGUqa2kfFebzJAtqT8ggWzf71yVTaLXTWtJDfFv7bJRaLoP3Pw==
X-Received: by 2002:a1c:c912:: with SMTP id f18mr3454904wmb.118.1559598689238;
        Mon, 03 Jun 2019 14:51:29 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id g11sm13518873wrq.89.2019.06.03.14.51.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 14:51:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Martin Sperl <kernel@martin.sperl.org>
Subject: [PATCH v2] gpio: pass lookup and descriptor flags to request_own
Date:   Mon,  3 Jun 2019 23:51:25 +0200
Message-Id: <20190603215125.731-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When a gpio_chip wants to request a descriptor from itself
using gpiochip_request_own_desc() it needs to be able to specify
fully how to use the descriptor, notably line inversion
semantics. The workaround in the gpiolib.c can be removed
and cases (such as SPI CS) where we need at times to request
a GPIO with line inversion semantics directly on a chip for
workarounds, can be fully supported with this call.

Fix up some users of the API that weren't really using the
last flag to set up the line as input or output properly
but instead just calling direction setting explicitly
after requesting the line.

Cc: Martin Sperl <kernel@martin.sperl.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Made this more explicit and included all required headers
  everywhere as lookup and line flags need to have their
  unique defines and use them.
---
 arch/arm/mach-omap1/ams-delta-fiq.c   |  4 +++-
 arch/arm/mach-omap1/board-ams-delta.c |  5 +++--
 drivers/gpio/gpio-mvebu.c             | 11 ++++------
 drivers/gpio/gpiolib-acpi.c           |  6 +++---
 drivers/gpio/gpiolib.c                | 31 +++++++++------------------
 drivers/hid/hid-cp2112.c              |  7 ++++--
 drivers/memory/omap-gpmc.c            |  4 +++-
 include/linux/gpio/driver.h           |  4 +++-
 8 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/arch/arm/mach-omap1/ams-delta-fiq.c b/arch/arm/mach-omap1/ams-delta-fiq.c
index 51212133ce06..46ca2d9d38ef 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq.c
+++ b/arch/arm/mach-omap1/ams-delta-fiq.c
@@ -14,6 +14,7 @@
  * the Free Software Foundation.
  */
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -102,7 +103,8 @@ void __init ams_delta_init_fiq(struct gpio_chip *chip,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(irq_data); i++) {
-		gpiod = gpiochip_request_own_desc(chip, i, pin_name[i], 0);
+		gpiod = gpiochip_request_own_desc(chip, i, pin_name[i],
+						  GPIO_ACTIVE_HIGH, GPIOD_IN);
 		if (IS_ERR(gpiod)) {
 			pr_err("%s: failed to get GPIO pin %d (%ld)\n",
 			       __func__, i, PTR_ERR(gpiod));
diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index b6e814166ee0..e49542540fc6 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -13,6 +13,7 @@
  */
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -609,12 +610,12 @@ static void __init modem_assign_irq(struct gpio_chip *chip)
 	struct gpio_desc *gpiod;
 
 	gpiod = gpiochip_request_own_desc(chip, AMS_DELTA_GPIO_PIN_MODEM_IRQ,
-					  "modem_irq", 0);
+					  "modem_irq", GPIO_ACTIVE_HIGH,
+					  GPIOD_IN);
 	if (IS_ERR(gpiod)) {
 		pr_err("%s: modem IRQ GPIO request failed (%ld)\n", __func__,
 		       PTR_ERR(gpiod));
 	} else {
-		gpiod_direction_input(gpiod);
 		ams_delta_modem_ports[0].irq = gpiod_to_irq(gpiod);
 	}
 }
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 059094ac44cb..869d47f89599 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -38,6 +38,7 @@
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -618,18 +619,14 @@ static int mvebu_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 		ret = -EBUSY;
 	} else {
 		desc = gpiochip_request_own_desc(&mvchip->chip,
-						 pwm->hwpwm, "mvebu-pwm", 0);
+						 pwm->hwpwm, "mvebu-pwm",
+						 GPIO_ACTIVE_HIGH,
+						 GPIOD_OUT_LOW);
 		if (IS_ERR(desc)) {
 			ret = PTR_ERR(desc);
 			goto out;
 		}
 
-		ret = gpiod_direction_output(desc, 0);
-		if (ret) {
-			gpiochip_free_own_desc(desc);
-			goto out;
-		}
-
 		mvpwm->gpiod = desc;
 	}
 out:
diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index c9fc9e232aaf..39f2f9035c11 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -217,14 +217,13 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	if (!handler)
 		return AE_OK;
 
-	desc = gpiochip_request_own_desc(chip, pin, "ACPI:Event", 0);
+	desc = gpiochip_request_own_desc(chip, pin, "ACPI:Event",
+					 GPIO_ACTIVE_HIGH, GPIOD_IN);
 	if (IS_ERR(desc)) {
 		dev_err(chip->parent, "Failed to request GPIO\n");
 		return AE_ERROR;
 	}
 
-	gpiod_direction_input(desc);
-
 	ret = gpiochip_lock_as_irq(chip, pin);
 	if (ret) {
 		dev_err(chip->parent, "Failed to lock GPIO as interrupt\n");
@@ -951,6 +950,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 			const char *label = "ACPI:OpRegion";
 
 			desc = gpiochip_request_own_desc(chip, pin, label,
+							 GPIO_ACTIVE_HIGH,
 							 flags);
 			if (IS_ERR(desc)) {
 				status = AE_ERROR;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..4561cb39bdb4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2503,7 +2503,11 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
  * @chip: GPIO chip
  * @hwnum: hardware number of the GPIO for which to request the descriptor
  * @label: label for the GPIO
- * @flags: flags for this GPIO or 0 if default
+ * @lflags: lookup flags for this GPIO or 0 if default, this can be used to
+ * specify things like line inversion semantics with the machine flags
+ * such as GPIO_OUT_LOW
+ * @dflags: descriptor request flags for this GPIO or 0 if default, this
+ * can be used to specify consumer semantics such as open drain
  *
  * Function allows GPIO chip drivers to request and use their own GPIO
  * descriptors via gpiolib API. Difference to gpiod_request() is that this
@@ -2517,9 +2521,9 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
  */
 struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
 					    const char *label,
-					    enum gpiod_flags flags)
+					    enum gpio_lookup_flags lflags,
+					    enum gpiod_flags dflags)
 {
-	unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	struct gpio_desc *desc = gpiochip_get_desc(chip, hwnum);
 	int err;
 
@@ -2532,7 +2536,7 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
 	if (err < 0)
 		return ERR_PTR(err);
 
-	err = gpiod_configure_flags(desc, label, lflags, flags);
+	err = gpiod_configure_flags(desc, label, lflags, dflags);
 	if (err) {
 		chip_err(chip, "setup of own GPIO %s failed\n", label);
 		gpiod_free_commit(desc);
@@ -4420,15 +4424,8 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	chip = gpiod_to_chip(desc);
 	hwnum = gpio_chip_hwgpio(desc);
 
-	/*
-	 * FIXME: not very elegant that we call gpiod_configure_flags()
-	 * twice here (once inside gpiochip_request_own_desc() and
-	 * again here), but the gpiochip_request_own_desc() is external
-	 * and cannot really pass the lflags so this is the lesser evil
-	 * at the moment. Pass zero as dflags on this first call so we
-	 * don't screw anything up.
-	 */
-	local_desc = gpiochip_request_own_desc(chip, hwnum, name, 0);
+	local_desc = gpiochip_request_own_desc(chip, hwnum, name,
+					       lflags, dflags);
 	if (IS_ERR(local_desc)) {
 		status = PTR_ERR(local_desc);
 		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed, %d\n",
@@ -4436,14 +4433,6 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 		return status;
 	}
 
-	status = gpiod_configure_flags(desc, name, lflags, dflags);
-	if (status < 0) {
-		pr_err("setup of hog GPIO %s (chip %s, offset %d) failed, %d\n",
-		       name, chip->label, hwnum, status);
-		gpiochip_free_own_desc(desc);
-		return status;
-	}
-
 	/* Mark GPIO as hogged so it can be identified and removed later */
 	set_bit(FLAG_IS_HOGGED, &desc->flags);
 
diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 47f65857408d..f6fb97a14de6 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -24,7 +24,8 @@
  *   https://www.silabs.com/documents/public/application-notes/an495-cp2112-interface-specification.pdf
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio/driver.h>
 #include <linux/hid.h>
 #include <linux/hidraw.h>
@@ -1203,7 +1204,9 @@ static int __maybe_unused cp2112_allocate_irq(struct cp2112_device *dev,
 		return -EINVAL;
 
 	dev->desc[pin] = gpiochip_request_own_desc(&dev->gc, pin,
-						   "HID/I2C:Event", 0);
+						   "HID/I2C:Event",
+						   GPIO_ACTIVE_HIGH,
+						   GPIOD_IN);
 	if (IS_ERR(dev->desc[pin])) {
 		dev_err(dev->gc.parent, "Failed to request GPIO\n");
 		return PTR_ERR(dev->desc[pin]);
diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index f6297599433f..f4f98957dc86 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -22,6 +22,7 @@
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h> /* GPIO descriptor enum */
+#include <linux/gpio/machine.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
 #include <linux/platform_device.h>
@@ -2172,7 +2173,8 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 
 		waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
 							 wait_pin, "WAITPIN",
-							 0);
+							 GPIO_ACTIVE_HIGH,
+							 GPIOD_IN);
 		if (IS_ERR(waitpin_desc)) {
 			dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
 			ret = PTR_ERR(waitpin_desc);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a1d273c96016..937c40fb61f7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -18,6 +18,7 @@ struct seq_file;
 struct gpio_device;
 struct module;
 enum gpiod_flags;
+enum gpio_lookup_flags;
 
 #ifdef CONFIG_GPIOLIB
 
@@ -614,7 +615,8 @@ gpiochip_remove_pin_ranges(struct gpio_chip *chip)
 
 struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
 					    const char *label,
-					    enum gpiod_flags flags);
+					    enum gpio_lookup_flags lflags,
+					    enum gpiod_flags dflags);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
 void devprop_gpiochip_set_names(struct gpio_chip *chip,
-- 
2.20.1

