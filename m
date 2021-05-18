Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D88387425
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 10:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240968AbhERIfS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 04:35:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:9262 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234924AbhERIek (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 04:34:40 -0400
IronPort-SDR: 9jFl1JtgnHFAiUu67JThXd5miCSDh6hiaOWg+aTIO13mNz5d+YuVPZ7FH0oTsxjE/sI4vuxPnJ
 VbZTvIyUaCJg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197573452"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; 
   d="scan'208";a="197573452"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 01:33:23 -0700
IronPort-SDR: iEwDzqkc500Zg8Xg92IhY+yDsGunU1ZLCx6sOEJQ83AwG4Z8O/rnjnhclMCbvJlV0FE6jvSS/P
 rNPHtUfpoyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; 
   d="scan'208";a="404753698"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 18 May 2021 01:33:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AFB7612F; Tue, 18 May 2021 11:33:42 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 1/1] gpiolib: Introduce for_each_gpio_desc_if() macro
Date:   Tue, 18 May 2021 11:33:39 +0300
Message-Id: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In a few places we are using a loop against all GPIO descriptors
with a given flag for a given device. Replace it with a consolidated
for_each type of macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed compilation issue (LKP), injected if (test_bit) into the loop
 drivers/gpio/gpiolib-of.c    | 10 ++++------
 drivers/gpio/gpiolib-sysfs.c |  7 ++-----
 drivers/gpio/gpiolib.c       |  7 +++----
 drivers/gpio/gpiolib.h       |  7 +++++++
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bbcc7c073f63..2f8f3f0c8373 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -711,14 +711,12 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 static void of_gpiochip_remove_hog(struct gpio_chip *chip,
 				   struct device_node *hog)
 {
-	struct gpio_desc *descs = chip->gpiodev->descs;
+	struct gpio_desc *desc;
 	unsigned int i;
 
-	for (i = 0; i < chip->ngpio; i++) {
-		if (test_bit(FLAG_IS_HOGGED, &descs[i].flags) &&
-		    descs[i].hog == hog)
-			gpiochip_free_own_desc(&descs[i]);
-	}
+	for_each_gpio_desc_if(i, chip, desc, FLAG_IS_HOGGED)
+		if (desc->hog == hog)
+			gpiochip_free_own_desc(desc);
 }
 
 static int of_gpiochip_match_node(struct gpio_chip *chip, void *data)
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index ae49bb23c6ed..41b3b782bf3f 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -801,11 +801,8 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 	mutex_unlock(&sysfs_lock);
 
 	/* unregister gpiod class devices owned by sysfs */
-	for (i = 0; i < chip->ngpio; i++) {
-		desc = &gdev->descs[i];
-		if (test_and_clear_bit(FLAG_SYSFS, &desc->flags))
-			gpiod_free(desc);
-	}
+	for_each_gpio_desc_if(i, chip, desc, FLAG_SYSFS)
+		gpiod_free(desc);
 }
 
 static int __init gpiolib_sysfs_init(void)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 220a9d8dd4e3..97a69362a584 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4012,12 +4012,11 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
  */
 static void gpiochip_free_hogs(struct gpio_chip *gc)
 {
+	struct gpio_desc *desc;
 	int id;
 
-	for (id = 0; id < gc->ngpio; id++) {
-		if (test_bit(FLAG_IS_HOGGED, &gc->gpiodev->descs[id].flags))
-			gpiochip_free_own_desc(&gc->gpiodev->descs[id]);
-	}
+	for_each_gpio_desc_if(id, gc, desc, FLAG_IS_HOGGED)
+		gpiochip_free_own_desc(desc);
 }
 
 /**
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 30bc3f80f83e..69c96a4276de 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -82,6 +82,13 @@ struct gpio_array {
 };
 
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
+
+#define for_each_gpio_desc_if(i, gc, desc, flag)		\
+	for (i = 0, desc = gpiochip_get_desc(gc, i);		\
+	     i < gc->ngpio;					\
+	     i++, desc = gpiochip_get_desc(gc, i))		\
+		if (!test_bit(flag, &desc->flags)) {} else
+
 int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  unsigned int array_size,
 				  struct gpio_desc **desc_array,
-- 
2.30.2

