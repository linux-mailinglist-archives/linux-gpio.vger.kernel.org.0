Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0D46A8D8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 14:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfGPMjZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 08:39:25 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46528 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPMjZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 08:39:25 -0400
Received: by mail-lf1-f65.google.com with SMTP id z15so9310576lfh.13
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3a8I5EXmIN8G39obZEAFG93tFVy+yeyWB1a7ukCYXM=;
        b=mfaONPjB0vJoQYnfJo47p57y0AOQEtDB3MCINkIkcowhl5YRV7sw+udHrtvGdg7KRD
         hkpmRY0CD83QFa4w0XRF/la5twwuGF/ao+9lrkGo3VNdStLvr6Ugi5MEhCrEQJbvuz5E
         vO3XY461LIvem5fAH2e4F2VVOTzmJfoB6xN+ZgxiwZB1l57pMBCIUT/RfF+O2opVOYPY
         l19HKxFHf0lqY0VpvBfaO73ojwnRxJJ/tLaotka6vZNwOo/Spvr0xwjQge+fHsqpR+T9
         BC+p3UHzdfMqlNz//xJHQefgLKwdA7edm40hyOREoOfRq0E1M7f+NIYiRd0qwsfYEuDa
         RtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3a8I5EXmIN8G39obZEAFG93tFVy+yeyWB1a7ukCYXM=;
        b=keFIl5SfzYA+lmlTUaxE1FnzBtFpa0xQmGhX87+Pfr0UGGCxpgHatf5eA9s83LuUgF
         EhnIJd5HKQpnyt3jXqg+4hgreAmbnm7opZ6rDqmTZYvvLdCEk6qaRo86NZqr+1htlez8
         r9j/HlcFZTda04mBdM65C0fOk+/jYweXENlXHFQUa5DxP1VprESfghOCysOVRTfnyjdz
         /GU5/yj6/6cOyI1L6r3vptxEQMgl07SfrVWQwFty2u6WjB9rL68qXmZwkeqIMD+ub+SM
         3tJTA+XzITWa7lD/VVLzAZRNCBA/e+DzrQkUOmsr4JLKtX0tvpLQe1UwCHX4Hn4sAznE
         E1zg==
X-Gm-Message-State: APjAAAX3FZcH8WkirzpAQJWhJOeBDVCp3Eiz6yuy3lCUM10OhryZCmve
        8WZ1tGZdENm3eUQBSWVot5P6rUHBvSI=
X-Google-Smtp-Source: APXvYqz4i0DLlrK+pKh8KUVfXBdpzAkYJu9l0TQucG9XiJRMFTraiPr5HKxKla4TNZMlzQG7JcE6TA==
X-Received: by 2002:ac2:4243:: with SMTP id m3mr14834046lfl.9.1563280761766;
        Tue, 16 Jul 2019 05:39:21 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h129sm2814065lfd.74.2019.07.16.05.39.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 05:39:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] gpio: of: Break out OF-only code
Date:   Tue, 16 Jul 2019 14:39:18 +0200
Message-Id: <20190716123918.26004-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The core gpiolib should not contain any OF/device tree-only
code. Try to break out the main part of it and push it down
into the optional gpiolib-of.c part of the library.

Create a local gpiolib-of.h header and move stuff around a
bit to get a clean cut.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 114 ++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c    | 113 +++----------------------------------
 drivers/gpio/gpiolib.h    |  27 ---------
 3 files changed, 122 insertions(+), 132 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2bc0bcd7a410..00ed60304cd4 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -21,6 +21,34 @@
 #include <linux/gpio/machine.h>
 
 #include "gpiolib.h"
+#include "gpiolib-of.h"
+
+/*
+ * This is used by external users of of_gpio_count() from <linux/of_gpio.h>
+ *
+ * FIXME: get rid of those external users by converting them to GPIO
+ * descriptors and let them all use gpiod_get_count()
+ */
+int of_gpio_get_count(struct device *dev, const char *con_id)
+{
+	int ret;
+	char propname[32];
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
+		if (con_id)
+			snprintf(propname, sizeof(propname), "%s-%s",
+				 con_id, gpio_suffixes[i]);
+		else
+			snprintf(propname, sizeof(propname), "%s",
+				 gpio_suffixes[i]);
+
+		ret = of_gpio_named_count(dev->of_node, propname);
+		if (ret > 0)
+			break;
+	}
+	return ret ? ret : -ENOENT;
+}
 
 static int of_gpiochip_match_node_and_xlate(struct gpio_chip *chip, void *data)
 {
@@ -53,6 +81,23 @@ static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
 	return gpiochip_get_desc(chip, ret);
 }
 
+/**
+ * of_gpio_need_valid_mask() - figure out if the OF GPIO driver needs
+ * to set the .valid_mask
+ * @dev: the device for the GPIO provider
+ * @return: true if the valid mask needs to be set
+ */
+bool of_gpio_need_valid_mask(struct gpio_chip *gc)
+{
+	int size;
+	struct device_node *np = gc->of_node;
+
+	size = of_property_count_u32_elems(np,  "gpio-reserved-ranges");
+	if (size > 0 && size % 2 == 0)
+		return true;
+	return false;
+}
+
 static void of_gpio_flags_quirks(struct device_node *np,
 				 const char *propname,
 				 enum of_gpio_flags *flags,
@@ -237,6 +282,75 @@ int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
 }
 EXPORT_SYMBOL(of_get_named_gpio_flags);
 
+/**
+ * gpiod_get_from_of_node() - obtain a GPIO from an OF node
+ * @node:	handle of the OF node
+ * @propname:	name of the DT property representing the GPIO
+ * @index:	index of the GPIO to obtain for the consumer
+ * @dflags:	GPIO initialization flags
+ * @label:	label to attach to the requested GPIO
+ *
+ * Returns:
+ * On successful request the GPIO pin is configured in accordance with
+ * provided @dflags.
+ *
+ * In case of error an ERR_PTR() is returned.
+ */
+struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
+					 const char *propname, int index,
+					 enum gpiod_flags dflags,
+					 const char *label)
+{
+	unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+	struct gpio_desc *desc;
+	enum of_gpio_flags flags;
+	bool active_low = false;
+	bool single_ended = false;
+	bool open_drain = false;
+	bool transitory = false;
+	int ret;
+
+	desc = of_get_named_gpiod_flags(node, propname,
+					index, &flags);
+
+	if (!desc || IS_ERR(desc)) {
+		return desc;
+	}
+
+	active_low = flags & OF_GPIO_ACTIVE_LOW;
+	single_ended = flags & OF_GPIO_SINGLE_ENDED;
+	open_drain = flags & OF_GPIO_OPEN_DRAIN;
+	transitory = flags & OF_GPIO_TRANSITORY;
+
+	ret = gpiod_request(desc, label);
+	if (ret == -EBUSY && (flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
+		return desc;
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (active_low)
+		lflags |= GPIO_ACTIVE_LOW;
+
+	if (single_ended) {
+		if (open_drain)
+			lflags |= GPIO_OPEN_DRAIN;
+		else
+			lflags |= GPIO_OPEN_SOURCE;
+	}
+
+	if (transitory)
+		lflags |= GPIO_TRANSITORY;
+
+	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
+	if (ret < 0) {
+		gpiod_put(desc);
+		return ERR_PTR(ret);
+	}
+
+	return desc;
+}
+EXPORT_SYMBOL(gpiod_get_from_of_node);
+
 /*
  * The SPI GPIO bindings happened before we managed to establish that GPIO
  * properties should be named "foo-gpios" so we have this special kludge for
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 24300f401fce..3e262a280f95 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -11,7 +11,6 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/idr.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
@@ -30,6 +29,7 @@
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
+#include "gpiolib-of.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/gpio.h>
@@ -360,22 +360,15 @@ static unsigned long *gpiochip_allocate_mask(struct gpio_chip *chip)
 	return p;
 }
 
-static int gpiochip_alloc_valid_mask(struct gpio_chip *gpiochip)
+static int gpiochip_alloc_valid_mask(struct gpio_chip *gc)
 {
-#ifdef CONFIG_OF_GPIO
-	int size;
-	struct device_node *np = gpiochip->of_node;
-
-	size = of_property_count_u32_elems(np,  "gpio-reserved-ranges");
-	if (size > 0 && size % 2 == 0)
-		gpiochip->need_valid_mask = true;
-#endif
-
-	if (!gpiochip->need_valid_mask)
+	if (IS_ENABLED(CONFIG_OF_GPIO))
+		gc->need_valid_mask = of_gpio_need_valid_mask(gc);
+	if (!gc->need_valid_mask)
 		return 0;
 
-	gpiochip->valid_mask = gpiochip_allocate_mask(gpiochip);
-	if (!gpiochip->valid_mask)
+	gc->valid_mask = gpiochip_allocate_mask(gc);
+	if (!gc->valid_mask)
 		return -ENOMEM;
 
 	return 0;
@@ -3993,27 +3986,6 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 	return desc;
 }
 
-static int dt_gpio_count(struct device *dev, const char *con_id)
-{
-	int ret;
-	char propname[32];
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
-		if (con_id)
-			snprintf(propname, sizeof(propname), "%s-%s",
-				 con_id, gpio_suffixes[i]);
-		else
-			snprintf(propname, sizeof(propname), "%s",
-				 gpio_suffixes[i]);
-
-		ret = of_gpio_named_count(dev->of_node, propname);
-		if (ret > 0)
-			break;
-	}
-	return ret ? ret : -ENOENT;
-}
-
 static int platform_gpio_count(struct device *dev, const char *con_id)
 {
 	struct gpiod_lookup_table *table;
@@ -4046,7 +4018,7 @@ int gpiod_count(struct device *dev, const char *con_id)
 	int count = -ENOENT;
 
 	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
-		count = dt_gpio_count(dev, con_id);
+		count = of_gpio_get_count(dev, con_id);
 	else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev))
 		count = acpi_gpio_count(dev, con_id);
 
@@ -4247,75 +4219,6 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpiod_get_index);
 
-/**
- * gpiod_get_from_of_node() - obtain a GPIO from an OF node
- * @node:	handle of the OF node
- * @propname:	name of the DT property representing the GPIO
- * @index:	index of the GPIO to obtain for the consumer
- * @dflags:	GPIO initialization flags
- * @label:	label to attach to the requested GPIO
- *
- * Returns:
- * On successful request the GPIO pin is configured in accordance with
- * provided @dflags.
- *
- * In case of error an ERR_PTR() is returned.
- */
-struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
-					 const char *propname, int index,
-					 enum gpiod_flags dflags,
-					 const char *label)
-{
-	unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
-	struct gpio_desc *desc;
-	enum of_gpio_flags flags;
-	bool active_low = false;
-	bool single_ended = false;
-	bool open_drain = false;
-	bool transitory = false;
-	int ret;
-
-	desc = of_get_named_gpiod_flags(node, propname,
-					index, &flags);
-
-	if (!desc || IS_ERR(desc)) {
-		return desc;
-	}
-
-	active_low = flags & OF_GPIO_ACTIVE_LOW;
-	single_ended = flags & OF_GPIO_SINGLE_ENDED;
-	open_drain = flags & OF_GPIO_OPEN_DRAIN;
-	transitory = flags & OF_GPIO_TRANSITORY;
-
-	ret = gpiod_request(desc, label);
-	if (ret == -EBUSY && (flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
-		return desc;
-	if (ret)
-		return ERR_PTR(ret);
-
-	if (active_low)
-		lflags |= GPIO_ACTIVE_LOW;
-
-	if (single_ended) {
-		if (open_drain)
-			lflags |= GPIO_OPEN_DRAIN;
-		else
-			lflags |= GPIO_OPEN_SOURCE;
-	}
-
-	if (transitory)
-		lflags |= GPIO_TRANSITORY;
-
-	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
-	if (ret < 0) {
-		gpiod_put(desc);
-		return ERR_PTR(ret);
-	}
-
-	return desc;
-}
-EXPORT_SYMBOL(gpiod_get_from_of_node);
-
 /**
  * fwnode_get_named_gpiod - obtain a GPIO from firmware node
  * @fwnode:	handle of the firmware node
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 7c52c2442173..75d2e909d8c6 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/cdev.h>
 
-enum of_gpio_flags;
 struct acpi_device;
 
 /**
@@ -92,32 +91,6 @@ struct acpi_gpio_info {
 /* gpio suffixes used for ACPI and device tree lookup */
 static __maybe_unused const char * const gpio_suffixes[] = { "gpios", "gpio" };
 
-#ifdef CONFIG_OF_GPIO
-struct gpio_desc *of_find_gpio(struct device *dev,
-			       const char *con_id,
-			       unsigned int idx,
-			       unsigned long *lookupflags);
-struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
-		   const char *list_name, int index, enum of_gpio_flags *flags);
-int of_gpiochip_add(struct gpio_chip *gc);
-void of_gpiochip_remove(struct gpio_chip *gc);
-#else
-static inline struct gpio_desc *of_find_gpio(struct device *dev,
-					     const char *con_id,
-					     unsigned int idx,
-					     unsigned long *lookupflags)
-{
-	return ERR_PTR(-ENOENT);
-}
-static inline struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
-		   const char *list_name, int index, enum of_gpio_flags *flags)
-{
-	return ERR_PTR(-ENOENT);
-}
-static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
-static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
-#endif /* CONFIG_OF_GPIO */
-
 #ifdef CONFIG_ACPI
 void acpi_gpiochip_add(struct gpio_chip *chip);
 void acpi_gpiochip_remove(struct gpio_chip *chip);
-- 
2.21.0

