Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0D344AB28
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245165AbhKIKFR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:05:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:33078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245190AbhKIKFQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:05:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1264861167;
        Tue,  9 Nov 2021 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636452150;
        bh=9vK0q1Gu9w0BTlhyMWFqQaJZ6ZTjcHavcORrzYvFfs0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eBkpmcqbZzTsG7gPPxtBtwQIv9etRQxlswIt3xjRKlFDCsOpB9JbcNNjZLSTMMf74
         Hz+jUlvuu71bgO51fu7c+sPkbIrpiBDpA21iWTKqe10F+YdH99RfLIp6DSGkALko6E
         swrSNoy3bS5mw++lSfVVtTDv5KovUdr2tjPx6mPs2Pi16YmpOTLT6ehaTav4lmQVeW
         MCNX/9zxE8FBhCTjvV0xN/q5QHAUpVwXcrNiwAqXzHrwzcyTExrF42mFmFxImO0DZ8
         ihYtv2Jo64EzMvLMuhTdKS3i+YTLZsaYYD/CzPD2pepbsvxpGJoDsF0qz8ei1smUhg
         tT8SyDgkLLkaQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] gpiolib: remove gpio_to_chip
Date:   Tue,  9 Nov 2021 11:02:06 +0100
Message-Id: <20211109100207.2474024-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211109100207.2474024-1-arnd@kernel.org>
References: <20211109100207.2474024-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

There are only two callers of this helper, remove them by
open-coding the call to the gpiod version.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/core.c    | 5 ++---
 drivers/soc/fsl/qe/gpio.c | 4 +---
 include/linux/gpio.h      | 7 -------
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 976607758e98..8d3c00782178 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -28,7 +28,6 @@
 
 #ifdef CONFIG_GPIOLIB
 #include "../gpio/gpiolib.h"
-#include <linux/gpio.h>
 #endif
 
 #include "core.h"
@@ -324,7 +323,7 @@ static bool pinctrl_ready_for_gpio_range(unsigned gpio)
 {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_gpio_range *range = NULL;
-	struct gpio_chip *chip = gpio_to_chip(gpio);
+	struct gpio_chip *chip = gpiod_to_chip(gpio_to_desc(gpio));
 
 	if (WARN(!chip, "no gpio_chip for gpio%i?", gpio))
 		return false;
@@ -1657,7 +1656,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 			}
 		}
 		if (gpio_num >= 0)
-			chip = gpio_to_chip(gpio_num);
+			chip = gpiod_to_chip(gpio_to_desc(gpio_num));
 		else
 			chip = NULL;
 		if (chip)
diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 99f7de43c3c6..a6aa55055e9a 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -15,8 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/gpio/driver.h>
-/* FIXME: needed for gpio_to_chip() get rid of this */
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <soc/fsl/qe/qe.h>
@@ -173,7 +171,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 	err = of_get_gpio(np, index);
 	if (err < 0)
 		goto err0;
-	gc = gpio_to_chip(err);
+	gc = gpiod_to_chip(gpio_to_desc(err));
 	if (WARN_ON(!gc)) {
 		err = -ENODEV;
 		goto err0;
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 7ceb93678689..61fb427b4e70 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -96,12 +96,6 @@ static inline bool gpio_is_valid(int number)
 
 struct device;
 
-/* caller holds gpio_lock *OR* gpio is marked as requested */
-static inline struct gpio_chip *gpio_to_chip(unsigned gpio)
-{
-	return gpiod_to_chip(gpio_to_desc(gpio));
-}
-
 /* Always use the library code for GPIO management calls,
  * or when sleeping may be involved.
  */
@@ -158,7 +152,6 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
 #include <linux/bug.h>
 
 struct device;
-struct gpio_chip;
 
 static inline bool gpio_is_valid(int number)
 {
-- 
2.29.2

