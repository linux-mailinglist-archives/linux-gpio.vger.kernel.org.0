Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97552227D2C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 12:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGUKhm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 06:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgGUKhm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 06:37:42 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B203C061794;
        Tue, 21 Jul 2020 03:37:42 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j18so2316401wmi.3;
        Tue, 21 Jul 2020 03:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SC074S5TfJChQy0mxoc20RhFnNGoJ86cVYJOpO7wX5U=;
        b=Zaw2hdmHR8s3lyvVJx4SqTkq6+ee7nDPa6I2j9HmI+6dQe6WNmm3Ox6QxprsZNI0/O
         1ozhzlOk0fcy28eprvoIQAAcs3T1FEkf8gVoz9F4GLqW7F0ZzfmQ/46Q74ZDMU11r09/
         zNkouSquU/djLMZ94/sb37UpaP9TMEauqxCMUrs4+h/+bkyqgmFRCvtMQQOrIQS2co2J
         y4eLjUqM7hfz0oLMqAH9CspT18iqdd90r+IQs5nSQpxLYvWUt3gym/cfyZMmY3wRDFkZ
         IsjmJFTt/rOmQMxD8TrpwOjoqA+E9Ude2n3PY6DLJzmztf5UeVcc+JdniBd3SnPmurAr
         OcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SC074S5TfJChQy0mxoc20RhFnNGoJ86cVYJOpO7wX5U=;
        b=DZymrDGuMG/0tFzzABe2JV41/IL78iG4j+yBdXE+g4G+HPgf0zKhFgA+FA3Hq2qb/x
         vzXPKrOt/gwV3i+9Q/ikMs/W2p5sAdern3Bc/5KWd8T25YtZfob+21tzJE01EQuO3RRZ
         JXfK+KJ+zvwaVxgnNgvYweE68qHve1VB+jGUMQXUxb9aWC00AygtKGEHzBP9ZSeKb1oZ
         NJfgru2F4eOROE8pUZeO5LNUYdBkod5Xvmm4mA3zkijGlyfeqtQic6vDs0hasaMzrOF3
         yp8CmeADgIlsxaXROqL/euOfD9mWvxsFbQ0fE9xVKVX1O3iUVRNb1oe85z3Vq35WH4kF
         y2XA==
X-Gm-Message-State: AOAM530y8OW3RpIt2zbDjwXysebDqDz/DsOekLjzgwzA6JZndLf1X5l5
        wjsMr0Ym//QM0Qfs2G5IkcQ=
X-Google-Smtp-Source: ABdhPJwbWqiEgyOgGMQcFdMyvgUQxUHXGeQE07kR88F9mlI9K9tnrTcl5r62VwpnKifpEKpYug+dbQ==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr3365244wmi.148.1595327860678;
        Tue, 21 Jul 2020 03:37:40 -0700 (PDT)
Received: from localhost ([156.204.216.226])
        by smtp.gmail.com with ESMTPSA id q3sm2774348wmq.22.2020.07.21.03.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 03:37:40 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH] gpio: fixed some coding style issues in gpiolib files
Date:   Tue, 21 Jul 2020 12:36:34 +0200
Message-Id: <20200721103634.2939493-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpiolib-acpi.c   |  3 ++-
 drivers/gpio/gpiolib-devres.c | 16 ++++++++--------
 drivers/gpio/gpiolib-legacy.c |  6 +++---
 drivers/gpio/gpiolib-of.c     |  3 +--
 drivers/gpio/gpiolib.c        | 34 +++++++++++++++++-----------------
 5 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 9276051663da..c0a2f66ec552 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -277,6 +277,7 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 
 	if (pin <= 255) {
 		char ev_name[5];
+
 		sprintf(ev_name, "_%c%02hhX",
 			agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
 			pin);
@@ -1094,7 +1095,7 @@ static void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip)
 						    NULL, achip);
 	if (ACPI_FAILURE(status))
 		dev_err(chip->parent,
-		        "Failed to install GPIO OpRegion handler\n");
+			"Failed to install GPIO OpRegion handler\n");
 }
 
 static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 5c91c4365da1..a138928d21cf 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -382,14 +382,14 @@ EXPORT_SYMBOL_GPL(devm_gpiod_put_array);
 
 static void devm_gpio_release(struct device *dev, void *res)
 {
-	unsigned *gpio = res;
+	unsigned int *gpio = res;
 
 	gpio_free(*gpio);
 }
 
 static int devm_gpio_match(struct device *dev, void *res, void *data)
 {
-	unsigned *this = res, *gpio = data;
+	unsigned int *this = res, *gpio = data;
 
 	return *this == *gpio;
 }
@@ -409,12 +409,12 @@ static int devm_gpio_match(struct device *dev, void *res, void *data)
  *      separately, devm_gpio_free() must be used.
  */
 
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label)
+int devm_gpio_request(struct device *dev, unsigned int gpio, const char *label)
 {
-	unsigned *dr;
+	unsigned int *dr;
 	int rc;
 
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
+	dr = devres_alloc(devm_gpio_release, sizeof(unsigned int), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
@@ -438,13 +438,13 @@ EXPORT_SYMBOL_GPL(devm_gpio_request);
  *	@flags:	GPIO configuration as specified by GPIOF_*
  *	@label:	a literal description string of this GPIO
  */
-int devm_gpio_request_one(struct device *dev, unsigned gpio,
+int devm_gpio_request_one(struct device *dev, unsigned int gpio,
 			  unsigned long flags, const char *label)
 {
-	unsigned *dr;
+	unsigned int *dr;
 	int rc;
 
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
+	dr = devres_alloc(devm_gpio_release, sizeof(unsigned int), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 30e2476a6dc4..c4f2e8eb4c98 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -6,7 +6,7 @@
 
 #include "gpiolib.h"
 
-void gpio_free(unsigned gpio)
+void gpio_free(unsigned int gpio)
 {
 	gpiod_free(gpio_to_desc(gpio));
 }
@@ -18,7 +18,7 @@ EXPORT_SYMBOL_GPL(gpio_free);
  * @flags:	GPIO configuration as specified by GPIOF_*
  * @label:	a literal description string of this GPIO
  */
-int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
+int gpio_request_one(unsigned int gpio, unsigned long flags, const char *label)
 {
 	struct gpio_desc *desc;
 	int err;
@@ -65,7 +65,7 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 }
 EXPORT_SYMBOL_GPL(gpio_request_one);
 
-int gpio_request(unsigned gpio, const char *label)
+int gpio_request(unsigned int gpio, const char *label)
 {
 	struct gpio_desc *desc = gpio_to_desc(gpio);
 
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 219eb0054233..15be8a7030a6 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -316,9 +316,8 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 	desc = of_get_named_gpiod_flags(node, propname,
 					index, &flags);
 
-	if (!desc || IS_ERR(desc)) {
+	if (!desc || IS_ERR(desc))
 		return desc;
-	}
 
 	active_low = flags & OF_GPIO_ACTIVE_LOW;
 	single_ended = flags & OF_GPIO_SINGLE_ENDED;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4fa075d49fbc..0d94dd7fdb24 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -105,7 +105,7 @@ static inline void desc_set_label(struct gpio_desc *d, const char *label)
  * The GPIO descriptor associated with the given GPIO, or %NULL if no GPIO
  * with the given number exists in the system.
  */
-struct gpio_desc *gpio_to_desc(unsigned gpio)
+struct gpio_desc *gpio_to_desc(unsigned int gpio)
 {
 	struct gpio_device *gdev;
 	unsigned long flags;
@@ -215,7 +215,7 @@ static int gpiochip_find_base(int ngpio)
 int gpiod_get_direction(struct gpio_desc *desc)
 {
 	struct gpio_chip *gc;
-	unsigned offset;
+	unsigned int offset;
 	int ret;
 
 	gc = gpiod_to_chip(desc);
@@ -974,6 +974,7 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
 	    && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
 		int level = gpiod_get_value_cansleep(le->desc);
+
 		if (level)
 			/* Emit low-to-high event */
 			ge.id = GPIOEVENT_EVENT_RISING_EDGE;
@@ -1620,7 +1621,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 {
 	unsigned long	flags;
 	int		ret = 0;
-	unsigned	i;
+	unsigned int	i;
 	int		base = gc->base;
 	struct gpio_device *gdev;
 
@@ -2128,9 +2129,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
 						   unsigned int *type)
 {
 	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
+	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2)
 		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
-	}
 
 	/* This is for board files and others not using DT */
 	if (is_fwnode_irqchip(fwspec->fwnode)) {
@@ -2441,7 +2441,7 @@ void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 }
 EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
 
-static int gpiochip_to_irq(struct gpio_chip *gc, unsigned offset)
+static int gpiochip_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct irq_domain *domain = gc->irq.domain;
 
@@ -2601,6 +2601,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 	/* If a parent irqdomain is provided, let's build a hierarchy */
 	if (gpiochip_hierarchy_is_hierarchical(gc)) {
 		int ret = gpiochip_hierarchy_add_domain(gc);
+
 		if (ret)
 			return ret;
 	} else {
@@ -2835,7 +2836,7 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
  * @gc: the gpiochip owning the GPIO
  * @offset: the offset of the GPIO to request for GPIO function
  */
-int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset)
+int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset)
 {
 #ifdef CONFIG_PINCTRL
 	if (list_empty(&gc->gpiodev->pin_ranges))
@@ -2851,7 +2852,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
  * @gc: the gpiochip to request the gpio function for
  * @offset: the offset of the GPIO to free from GPIO function
  */
-void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset)
+void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset)
 {
 	pinctrl_gpio_free(gc->gpiodev->base + offset);
 }
@@ -2863,7 +2864,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
  * @offset: the offset of the GPIO to apply the configuration
  * @config: the configuration to be applied
  */
-int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,
+int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
 	return pinctrl_gpio_set_config(gc->gpiodev->base + offset, config);
@@ -3011,7 +3012,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	struct gpio_chip	*gc = desc->gdev->chip;
 	int			ret;
 	unsigned long		flags;
-	unsigned		offset;
+	unsigned int		offset;
 
 	if (label) {
 		label = kstrdup_const(label, GFP_KERNEL);
@@ -3188,7 +3189,7 @@ void gpiod_free(struct gpio_desc *desc)
  * help with diagnostics, and knowing that the signal is used as a GPIO
  * can help avoid accidentally multiplexing it to another controller.
  */
-const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned offset)
+const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_desc *desc;
 
@@ -3292,7 +3293,7 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
 	unsigned long config;
-	unsigned arg;
+	unsigned int arg;
 
 	switch (mode) {
 	case PIN_CONFIG_BIAS_PULL_DOWN:
@@ -3485,8 +3486,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 			ret = gpiod_direction_input(desc);
 			goto set_output_flag;
 		}
-	}
-	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
+	} else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
 		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_SOURCE);
 		if (!ret)
 			goto set_output_value;
@@ -3547,7 +3547,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_config);
  * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
  * debounce time.
  */
-int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
+int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce)
 {
 	unsigned long config;
 
@@ -5407,9 +5407,9 @@ core_initcall(gpiolib_dev_init);
 
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 {
-	unsigned		i;
+	unsigned int		i;
 	struct gpio_chip	*gc = gdev->chip;
-	unsigned		gpio = gdev->base;
+	unsigned int		gpio = gdev->base;
 	struct gpio_desc	*gdesc = &gdev->descs[0];
 	bool			is_out;
 	bool			is_irq;
-- 
2.28.0.rc0

