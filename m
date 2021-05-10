Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3DF379802
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhEJTxe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:53:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:13484 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230342AbhEJTxd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:53:33 -0400
IronPort-SDR: fwVV5fpP6yV6jOwjN6qUWbXpGCf/geO4XPM2wZQFkcR6m79Es0tBuVGaaiOlaS0kbENNH0jOOF
 ognEEpHZhf+A==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196182311"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="196182311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:52:28 -0700
IronPort-SDR: hBjYXniIBFmzEHYpEBPd+Du6AhPVl+UlxEwRcHPmBGXUFcU56MU2XD876tt8ikrN9hkhcfajt9
 bRKa/l6RgJvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="461431720"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 10 May 2021 12:52:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 839D7D7; Mon, 10 May 2021 22:52:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] gpiolib: Introduce for_each_gpio_desc() macro
Date:   Mon, 10 May 2021 22:52:42 +0300
Message-Id: <20210510195242.12443-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In a few places we are using a loop against all GPIO descriptors
for a given device. Replace it with a consolidated for_each tupe
of macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-of.c    | 9 ++++-----
 drivers/gpio/gpiolib-sysfs.c | 3 +--
 drivers/gpio/gpiolib.c       | 7 ++++---
 drivers/gpio/gpiolib.h       | 6 ++++++
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bbcc7c073f63..fb1bfbfb3fc3 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -711,13 +711,12 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
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
+	for_each_gpio_desc(i, chip, desc) {
+		if (test_bit(FLAG_IS_HOGGED, desc->flags) && desc->hog == hog)
+			gpiochip_free_own_desc(desc);
 	}
 }
 
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index ae49bb23c6ed..b0c7a303adde 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -801,8 +801,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 	mutex_unlock(&sysfs_lock);
 
 	/* unregister gpiod class devices owned by sysfs */
-	for (i = 0; i < chip->ngpio; i++) {
-		desc = &gdev->descs[i];
+	for_each_gpio_desc(i, chip, desc) {
 		if (test_and_clear_bit(FLAG_SYSFS, &desc->flags))
 			gpiod_free(desc);
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 220a9d8dd4e3..d61e11084a09 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4012,11 +4012,12 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
  */
 static void gpiochip_free_hogs(struct gpio_chip *gc)
 {
+	struct gpio_desc *desc;
 	int id;
 
-	for (id = 0; id < gc->ngpio; id++) {
-		if (test_bit(FLAG_IS_HOGGED, &gc->gpiodev->descs[id].flags))
-			gpiochip_free_own_desc(&gc->gpiodev->descs[id]);
+	for_each_gpio_desc(id, gc, desc) {
+		if (test_bit(FLAG_IS_HOGGED, &desc->flags))
+			gpiochip_free_own_desc(desc);
 	}
 }
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 30bc3f80f83e..b6d8d71bfbd5 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -82,6 +82,12 @@ struct gpio_array {
 };
 
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
+
+#define for_each_gpio_desc(i, gc, desc)			\
+	for (i = 0, desc = gpiochip_get_desc(gc, i);	\
+	     i < gc->ngpio;				\
+	     i++, desc = gpiochip_get_desc(gc, i))	\
+
 int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  unsigned int array_size,
 				  struct gpio_desc **desc_array,
-- 
2.30.2

