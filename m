Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605FD2AC65F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbgKIUxw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:52 -0500
Received: from mga01.intel.com ([192.55.52.88]:25510 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729817AbgKIUxv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:51 -0500
IronPort-SDR: Jpx0D7VEXKBz2B/FS9NJUzNdmhD0xDxga+Wosl2eeyU8Is5zqHYarVP3bFxgCtuh2oxVPGHBBs
 KPh1n74uZG8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="187826499"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="187826499"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:50 -0800
IronPort-SDR: ds5MM9+u8s4EVE7iggKdSwDbW7pYd5Q8xsxteGHHtNt5HZ+VJeG9gRmxbDhdCwzN1d0QRcZgKF
 LgDHMQ7aBTkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="307778218"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2020 12:53:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E3EA517C; Mon,  9 Nov 2020 22:53:47 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 01/17] gpiolib: Replace unsigned by unsigned int
Date:   Mon,  9 Nov 2020 22:53:16 +0200
Message-Id: <20201109205332.19592-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace unsigned by unsigned int in GPIO library code.
Note, legacy API left untouched.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c        | 16 ++++++++--------
 include/linux/gpio/consumer.h |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bb5a9557b350..f94225d7817b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -211,7 +211,7 @@ static int gpiochip_find_base(int ngpio)
 int gpiod_get_direction(struct gpio_desc *desc)
 {
 	struct gpio_chip *gc;
-	unsigned offset;
+	unsigned int offset;
 	int ret;
 
 	gc = gpiod_to_chip(desc);
@@ -1333,7 +1333,7 @@ void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 }
 EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
 
-static int gpiochip_to_irq(struct gpio_chip *gc, unsigned offset)
+static int gpiochip_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct irq_domain *domain = gc->irq.domain;
 
@@ -1635,7 +1635,7 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
  * @gc: the gpiochip owning the GPIO
  * @offset: the offset of the GPIO to request for GPIO function
  */
-int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset)
+int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset)
 {
 #ifdef CONFIG_PINCTRL
 	if (list_empty(&gc->gpiodev->pin_ranges))
@@ -1651,7 +1651,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
  * @gc: the gpiochip to request the gpio function for
  * @offset: the offset of the GPIO to free from GPIO function
  */
-void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset)
+void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset)
 {
 	pinctrl_gpio_free(gc->gpiodev->base + offset);
 }
@@ -1663,7 +1663,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
  * @offset: the offset of the GPIO to apply the configuration
  * @config: the configuration to be applied
  */
-int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,
+int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
 	return pinctrl_gpio_set_config(gc->gpiodev->base + offset, config);
@@ -1994,7 +1994,7 @@ void gpiod_free(struct gpio_desc *desc)
  * help with diagnostics, and knowing that the signal is used as a GPIO
  * can help avoid accidentally multiplexing it to another controller.
  */
-const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned offset)
+const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_desc *desc;
 
@@ -2098,7 +2098,7 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
 	unsigned long config;
-	unsigned arg;
+	unsigned int arg;
 
 	switch (mode) {
 	case PIN_CONFIG_BIAS_PULL_DOWN:
@@ -2354,7 +2354,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_config);
  * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
  * debounce time.
  */
-int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
+int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce)
 {
 	unsigned long config;
 
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 901aab89d025..ef49307611d2 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -158,7 +158,7 @@ int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 				       unsigned long *value_bitmap);
 
 int gpiod_set_config(struct gpio_desc *desc, unsigned long config);
-int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
+int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce);
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 void gpiod_toggle_active_low(struct gpio_desc *desc);
 
@@ -481,7 +481,7 @@ static inline int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
 	return -ENOSYS;
 }
 
-static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
+static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce)
 {
 	/* GPIO can never have been requested */
 	WARN_ON(desc);
-- 
2.28.0

