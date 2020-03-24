Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08914191220
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 14:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgCXN5I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 09:57:08 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:55846 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbgCXN5I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 09:57:08 -0400
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id JDwu2200P5USYZQ06Dwua9; Tue, 24 Mar 2020 14:57:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jGk34-0006On-Ln; Tue, 24 Mar 2020 14:56:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jGk34-0001ki-Jv; Tue, 24 Mar 2020 14:56:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v6 5/8] gpiolib: Introduce gpiod_set_config()
Date:   Tue, 24 Mar 2020 14:56:50 +0100
Message-Id: <20200324135653.6676-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324135653.6676-1-geert+renesas@glider.be>
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO Aggregator will need a method to forward a .set_config() call
to its parent gpiochip.  This requires obtaining the gpio_chip and
offset for a given gpio_desc.  While gpiod_to_chip() is public,
gpio_chip_hwgpio() is not, so there is currently no method to obtain the
needed GPIO offset parameter.

Hence introduce a public gpiod_set_config() helper, which invokes the
.set_config() callback through a gpio_desc pointer, like is done for
most other gpio_chip callbacks.

Rewrite the existing gpiod_set_debounce() helper as a wrapper around
gpiod_set_config(), to avoid duplication.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6:
  - New.
---
 drivers/gpio/gpiolib.c        | 28 ++++++++++++++++++++++------
 include/linux/gpio/consumer.h |  8 ++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c756602e249c052e..30ea75e972b5a3b1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3478,6 +3478,26 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
+/**
+ * gpiod_set_config - sets @config for a GPIO
+ * @desc: descriptor of the GPIO for which to set the configuration
+ * @config: Same packed config format as generic pinconf
+ *
+ * Returns:
+ * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
+ * configuration.
+ */
+int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
+{
+	struct gpio_chip *chip;
+
+	VALIDATE_DESC(desc);
+	chip = desc->gdev->chip;
+
+	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
+}
+EXPORT_SYMBOL_GPL(gpiod_set_config);
+
 /**
  * gpiod_set_debounce - sets @debounce time for a GPIO
  * @desc: descriptor of the GPIO for which to set debounce time
@@ -3489,14 +3509,10 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output);
  */
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
-	struct gpio_chip	*chip;
-	unsigned long		config;
-
-	VALIDATE_DESC(desc);
-	chip = desc->gdev->chip;
+	unsigned long config;
 
 	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
-	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
+	return gpiod_set_config(desc, config);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0a72fccf60fff230..901aab89d025f3ff 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -157,6 +157,7 @@ int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 				       struct gpio_array *array_info,
 				       unsigned long *value_bitmap);
 
+int gpiod_set_config(struct gpio_desc *desc, unsigned long config);
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 void gpiod_toggle_active_low(struct gpio_desc *desc);
@@ -473,6 +474,13 @@ static inline int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 	return 0;
 }
 
+static inline int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+	return -ENOSYS;
+}
+
 static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
 	/* GPIO can never have been requested */
-- 
2.17.1

