Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02700294E9F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 16:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442932AbgJUOZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 10:25:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:25036 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408132AbgJUOZd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 10:25:33 -0400
IronPort-SDR: VAybJY9yFFlG4LWjSUSFqoO1bKGN6axgE4ouq0WrHBvxzcJh4C/eg6ip5J5fXYaoqEgoGXLN+H
 iJLClO0RfX8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="231566283"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="231566283"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 07:25:32 -0700
IronPort-SDR: 3VxZcUwBa2Om1knVqamdU4rZXkkj/oeU7vcpDmWsap6SW8Z1CPJLK5EA/EnN67PAfIgzopazWZ
 GD9g64NFJxfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="321029636"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2020 07:25:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E9696376; Wed, 21 Oct 2020 17:25:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Extract gpiod_not_found() helper
Date:   Wed, 21 Oct 2020 17:25:28 +0300
Message-Id: <20201021142528.10285-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Several places in the code are using same idiom, i.e.
	IS_ERR(desc) && PTR_ERR(desc) == -ENOENT
which meaning is GPIO description is not found.

For better readability extract gpiod_not_found() helper and use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-devres.c |  8 +++-----
 drivers/gpio/gpiolib-of.c     | 12 ++++++------
 drivers/gpio/gpiolib.c        | 12 +++++-------
 drivers/gpio/gpiolib.h        |  2 ++
 4 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 7dbce4c4ebdf..174f88d5ec17 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -246,10 +246,8 @@ struct gpio_desc *__must_check devm_gpiod_get_index_optional(struct device *dev,
 	struct gpio_desc *desc;
 
 	desc = devm_gpiod_get_index(dev, con_id, index, flags);
-	if (IS_ERR(desc)) {
-		if (PTR_ERR(desc) == -ENOENT)
-			return NULL;
-	}
+	if (gpiod_not_found(desc))
+		return NULL;
 
 	return desc;
 }
@@ -308,7 +306,7 @@ devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
 	struct gpio_descs *descs;
 
 	descs = devm_gpiod_get_array(dev, con_id, flags);
-	if (PTR_ERR(descs) == -ENOENT)
+	if (gpiod_not_found(descs))
 		return NULL;
 
 	return descs;
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 892a513b7a64..b4a71119a4b0 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -509,31 +509,31 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 		desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
 						&of_flags);
 
-		if (!IS_ERR(desc) || PTR_ERR(desc) != -ENOENT)
+		if (!gpiod_not_found(desc))
 			break;
 	}
 
-	if (PTR_ERR(desc) == -ENOENT) {
+	if (gpiod_not_found(desc)) {
 		/* Special handling for SPI GPIOs if used */
 		desc = of_find_spi_gpio(dev, con_id, &of_flags);
 	}
 
-	if (PTR_ERR(desc) == -ENOENT) {
+	if (gpiod_not_found(desc)) {
 		/* This quirk looks up flags and all */
 		desc = of_find_spi_cs_gpio(dev, con_id, idx, flags);
 		if (!IS_ERR(desc))
 			return desc;
 	}
 
-	if (PTR_ERR(desc) == -ENOENT) {
+	if (gpiod_not_found(desc)) {
 		/* Special handling for regulator GPIOs if used */
 		desc = of_find_regulator_gpio(dev, con_id, &of_flags);
 	}
 
-	if (PTR_ERR(desc) == -ENOENT)
+	if (gpiod_not_found(desc))
 		desc = of_find_arizona_gpio(dev, con_id, &of_flags);
 
-	if (PTR_ERR(desc) == -ENOENT)
+	if (gpiod_not_found(desc))
 		desc = of_find_usb_gpio(dev, con_id, &of_flags);
 
 	if (IS_ERR(desc))
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 43ddcf454b5f..00f2e291e25c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3778,7 +3778,7 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 
 		desc = fwnode_get_named_gpiod(fwnode, prop_name, index, flags,
 					      label);
-		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
+		if (!gpiod_not_found(desc))
 			break;
 	}
 
@@ -3954,7 +3954,7 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 	 * Either we are not using DT or ACPI, or their lookup did not return
 	 * a result. In that case, use platform lookup as a fallback.
 	 */
-	if (!desc || desc == ERR_PTR(-ENOENT)) {
+	if (!desc || gpiod_not_found(desc)) {
 		dev_dbg(dev, "using lookup tables for GPIO lookup\n");
 		desc = gpiod_find(dev, con_id, idx, &lookupflags);
 	}
@@ -4089,10 +4089,8 @@ struct gpio_desc *__must_check gpiod_get_index_optional(struct device *dev,
 	struct gpio_desc *desc;
 
 	desc = gpiod_get_index(dev, con_id, index, flags);
-	if (IS_ERR(desc)) {
-		if (PTR_ERR(desc) == -ENOENT)
-			return NULL;
-	}
+	if (gpiod_not_found(desc))
+		return NULL;
 
 	return desc;
 }
@@ -4296,7 +4294,7 @@ struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
 	struct gpio_descs *descs;
 
 	descs = gpiod_get_array(dev, con_id, flags);
-	if (PTR_ERR(descs) == -ENOENT)
+	if (gpiod_not_found(descs))
 		return NULL;
 
 	return descs;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index e9c5d25ab529..4c63b4a3a5ef 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -130,6 +130,8 @@ struct gpio_desc {
 #endif
 };
 
+#define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
+
 int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
-- 
2.28.0

