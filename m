Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B00044AB24
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245181AbhKIKFO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:05:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:32996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245174AbhKIKFM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:05:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0841361175;
        Tue,  9 Nov 2021 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636452146;
        bh=KJmcwLJG+KEgzaRVE6V4y1Ie9xrUPZgAR8HZCp2KqGQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n6rd/AHYdyBjwWwEJStADk/FqU0W3aflxO9Y1OsKlT0vQkA3WSwkaTR3M8hp9pLQg
         S8V8f5p66QjMIDGuTncneSsclV4p6GOr3uorGF+sKkseCM7EblkrsBXyXeGguGuIq+
         X+RnWiLn/EpL1/1qWbwG76EEcLNvztaDLwmhTvcoOs2gddebcayMYoPFYemjkIlNnb
         e7uAVp6Zqq91ixUNL9p1d4tbRB5dg4z+o3k6O1q3NIbZTOXbCtSFePQtzhqDXVbVxf
         AU/Rytg28IcpIYpOzMURbjyk+lBut96NNqKPAPg79mLuRomagGfX4mqIR3QZsUE2uU
         TSNwWEpSmC6lQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] gpiolib: shrink further
Date:   Tue,  9 Nov 2021 11:02:04 +0100
Message-Id: <20211109100207.2474024-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211109100207.2474024-1-arnd@kernel.org>
References: <20211109100207.2474024-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

gpio_set_debounce() only has a single user, which is trivially
converted to gpiod_set_debounce(), while gpio_cansleep() and
devm_gpio_free() have no users at all.

Remove them all to shrink the old gpio interface.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 Documentation/driver-api/gpio/legacy.rst      |  2 --
 drivers/gpio/gpiolib-devres.c                 | 25 ----------------
 drivers/input/touchscreen/ads7846.c           |  3 +-
 include/linux/gpio.h                          | 29 -------------------
 5 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 148e19381b79..52821478decd 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -277,7 +277,6 @@ GPIO
   devm_gpiochip_add_data()
   devm_gpio_request()
   devm_gpio_request_one()
-  devm_gpio_free()
 
 I2C
   devm_i2c_new_dummy_device()
diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
index 06c05e2d62c1..eae185f771d7 100644
--- a/Documentation/driver-api/gpio/legacy.rst
+++ b/Documentation/driver-api/gpio/legacy.rst
@@ -238,8 +238,6 @@ setup or driver probe/teardown code, so this is an easy constraint.)::
         ## 	gpio_free_array()
 
                 gpio_free()
-                gpio_set_debounce()
-
 
 
 Claiming and Releasing GPIOs
diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 79da85d17b71..55465ead492f 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -385,13 +385,6 @@ static void devm_gpio_release(struct device *dev, void *res)
 	gpio_free(*gpio);
 }
 
-static int devm_gpio_match(struct device *dev, void *res, void *data)
-{
-	unsigned *this = res, *gpio = data;
-
-	return *this == *gpio;
-}
-
 /**
  *      devm_gpio_request - request a GPIO for a managed device
  *      @dev: device to request the GPIO for
@@ -459,24 +452,6 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
 }
 EXPORT_SYMBOL_GPL(devm_gpio_request_one);
 
-/**
- *      devm_gpio_free - free a GPIO
- *      @dev: device to free GPIO for
- *      @gpio: GPIO to free
- *
- *      Except for the extra @dev argument, this function takes the
- *      same arguments and performs the same function as gpio_free().
- *      This function instead of gpio_free() should be used to manually
- *      free GPIOs allocated with devm_gpio_request().
- */
-void devm_gpio_free(struct device *dev, unsigned int gpio)
-{
-
-	WARN_ON(devres_release(dev, devm_gpio_release, devm_gpio_match,
-		&gpio));
-}
-EXPORT_SYMBOL_GPL(devm_gpio_free);
-
 static void devm_gpio_chip_release(void *data)
 {
 	struct gpio_chip *gc = data;
diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index a25a77dd9a32..d0664e3b89bb 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -27,6 +27,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ads7846.h>
@@ -1018,7 +1019,7 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 		ts->gpio_pendown = pdata->gpio_pendown;
 
 		if (pdata->gpio_pendown_debounce)
-			gpio_set_debounce(pdata->gpio_pendown,
+			gpiod_set_debounce(gpio_to_desc(pdata->gpio_pendown),
 					  pdata->gpio_pendown_debounce);
 	} else {
 		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index c19256f67e02..64cc8f09eba8 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -117,11 +117,6 @@ static inline int gpio_direction_output(unsigned gpio, int value)
 	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
 }
 
-static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
-{
-	return gpiod_set_debounce(gpio_to_desc(gpio), debounce);
-}
-
 static inline int gpio_get_value_cansleep(unsigned gpio)
 {
 	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
@@ -140,11 +135,6 @@ static inline void gpio_set_value(unsigned gpio, int value)
 	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
 }
 
-static inline int gpio_cansleep(unsigned gpio)
-{
-	return gpiod_cansleep(gpio_to_desc(gpio));
-}
-
 static inline int gpio_to_irq(unsigned gpio)
 {
 	return gpiod_to_irq(gpio_to_desc(gpio));
@@ -181,8 +171,6 @@ struct device;
 int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
 int devm_gpio_request_one(struct device *dev, unsigned gpio,
 			  unsigned long flags, const char *label);
-void devm_gpio_free(struct device *dev, unsigned int gpio);
-
 #else /* ! CONFIG_GPIOLIB */
 
 #include <linux/kernel.h>
@@ -239,11 +227,6 @@ static inline int gpio_direction_output(unsigned gpio, int value)
 	return -ENOSYS;
 }
 
-static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
-{
-	return -ENOSYS;
-}
-
 static inline int gpio_get_value(unsigned gpio)
 {
 	/* GPIO can never have been requested or set as {in,out}put */
@@ -257,13 +240,6 @@ static inline void gpio_set_value(unsigned gpio, int value)
 	WARN_ON(1);
 }
 
-static inline int gpio_cansleep(unsigned gpio)
-{
-	/* GPIO can never have been requested or set as {in,out}put */
-	WARN_ON(1);
-	return 0;
-}
-
 static inline int gpio_get_value_cansleep(unsigned gpio)
 {
 	/* GPIO can never have been requested or set as {in,out}put */
@@ -319,11 +295,6 @@ static inline int devm_gpio_request_one(struct device *dev, unsigned gpio,
 	return -EINVAL;
 }
 
-static inline void devm_gpio_free(struct device *dev, unsigned int gpio)
-{
-	WARN_ON(1);
-}
-
 #endif /* ! CONFIG_GPIOLIB */
 
 #endif /* __LINUX_GPIO_H */
-- 
2.29.2

