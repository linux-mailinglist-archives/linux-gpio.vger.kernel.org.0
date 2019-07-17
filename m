Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E062E6B742
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 09:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfGQHKJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 03:10:09 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43771 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQHKI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 03:10:08 -0400
Received: by mail-lf1-f66.google.com with SMTP id c19so15610135lfm.10
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2019 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bo9L0jUNVl2DofBKes/HfIWXScuOlEVmBhqJ4IgATMU=;
        b=tzrjwE76Swvzf9pGNx8Soln8PZy2EIGwZa9HsPFW3GtZgw+30LPr6G7as9W/S6736X
         5Tx1iXfteJhPrVSRQT5NRyAkd7Zt737hUvHY3qQXtfipP8Q8GxvZRM8wwraycX1QbNjJ
         AbUukts1EiyykW+GEwSa9gy8f3zQN6uCHYOkIYSAw6p7mBTzxqvyNNxnJ/zdbMbvglUW
         lMBpGjzdxWHQrSwARvqb1db+wSLmZ5mSfhCd4NvtfOpYWt1JFdmEqhsqHPTPrm7vDcDn
         t33gFopqfbUe0IWpfbJY0/4J2be+YS+rVkaa9ZroWdsqnGyRe6i89SW7Uonx4XP3E8EL
         dy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bo9L0jUNVl2DofBKes/HfIWXScuOlEVmBhqJ4IgATMU=;
        b=ts7SOv7GPsxC5wwOy4om1zWnYIXWh2C/sEXR4G+s0Q0htclwa62x8wYgnTwLIW8DcQ
         t6zsSd/A8OA4rnwvIOtVlBT8SJ4eCxKCRialF5Ex6KpFRlC1bQHSTer/5X3Al7awAzaN
         I11gM+uvksbXL1dDWWipWcMpL544nDzVB3UkR97EVnoiI7zpUF/cu0y6+ZV2E30uG0v9
         el0yStf1LyheAj3qZxULkwxbDPT5Is3aak51us/L4XDdLSsz6lCAZ5P6PionaicbllyU
         VLuYFhMSzm6S4H5cQvk8rQMEALOggQAM0gZdzxw0tXJe1D9Ek46Na2ge+jX8zbUJV479
         LPug==
X-Gm-Message-State: APjAAAU7p1mAGA1zlVqzdwJVM3kN1rCpYEjRr4/iyd8leVIccwa0kyqq
        KM3NxDXMLEF7neeA6jgNSJDSQ3HHnM0=
X-Google-Smtp-Source: APXvYqyqiwMSg1+YWXwcyeBxZj7r3Diqh/D0b3Z9IzRXgLzqcR0yz9cutckKQ/KkH37n4niwRsbWZA==
X-Received: by 2002:a19:8c57:: with SMTP id i23mr16605739lfj.192.1563347405896;
        Wed, 17 Jul 2019 00:10:05 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y25sm4670413lja.45.2019.07.17.00.10.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 00:10:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] gpio: of: Break out OF-only code
Date:   Wed, 17 Jul 2019 09:10:01 +0200
Message-Id: <20190717071001.3858-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Add missing header file.
---
 drivers/gpio/gpiolib-of.c | 114 ++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-of.h |  45 +++++++++++++++
 drivers/gpio/gpiolib.c    | 113 +++----------------------------------
 drivers/gpio/gpiolib.h    |  27 ---------
 4 files changed, 167 insertions(+), 132 deletions(-)
 create mode 100644 drivers/gpio/gpiolib-of.h

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
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
new file mode 100644
index 000000000000..34954921d96e
--- /dev/null
+++ b/drivers/gpio/gpiolib-of.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef GPIOLIB_OF_H
+#define GPIOLIB_OF_H
+
+struct gpio_chip;
+enum of_gpio_flags;
+
+#ifdef CONFIG_OF_GPIO
+struct gpio_desc *of_find_gpio(struct device *dev,
+			       const char *con_id,
+			       unsigned int idx,
+			       unsigned long *lookupflags);
+struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
+		   const char *list_name, int index, enum of_gpio_flags *flags);
+int of_gpiochip_add(struct gpio_chip *gc);
+void of_gpiochip_remove(struct gpio_chip *gc);
+int of_gpio_get_count(struct device *dev, const char *con_id);
+bool of_gpio_need_valid_mask(struct gpio_chip *gc);
+#else
+static inline struct gpio_desc *of_find_gpio(struct device *dev,
+					     const char *con_id,
+					     unsigned int idx,
+					     unsigned long *lookupflags)
+{
+	return ERR_PTR(-ENOENT);
+}
+static inline struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
+		   const char *list_name, int index, enum of_gpio_flags *flags)
+{
+	return ERR_PTR(-ENOENT);
+}
+static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
+static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
+static inline int of_gpio_get_count(struct device *dev, const char *con_id)
+{
+	return 0;
+}
+static inline bool of_gpio_need_valid_mask(struct gpio_chip *gc)
+{
+	return false;
+}
+#endif /* CONFIG_OF_GPIO */
+
+#endif /* GPIOLIB_OF_H */
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

