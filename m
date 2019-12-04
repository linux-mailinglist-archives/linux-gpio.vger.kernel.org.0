Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC6821135E0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 20:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfLDTmd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 14:42:33 -0500
Received: from mga12.intel.com ([192.55.52.136]:12765 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727867AbfLDTmc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Dec 2019 14:42:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 11:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; 
   d="scan'208";a="219005577"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2019 11:42:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5144894; Wed,  4 Dec 2019 21:42:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpiolib: Make use of assign_bit() API
Date:   Wed,  4 Dec 2019 21:42:29 +0200
Message-Id: <20191204194229.64251-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have for some time the assign_bit() API to replace open coded

	if (foo)
		set_bit(n, bar);
	else
		clear_bit(n, bar);

Use this API in GPIO library code.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 59 ++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 134985210619..b332121da4b5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -224,15 +224,15 @@ int gpiod_get_direction(struct gpio_desc *desc)
 		return -ENOTSUPP;
 
 	ret = chip->get_direction(chip, offset);
-	if (ret > 0) {
-		/* GPIOF_DIR_IN, or other positive */
+	if (ret < 0)
+		return ret;
+
+	/* GPIOF_DIR_IN or other positive, otherwise GPIOF_DIR_OUT */
+	if (ret > 0)
 		ret = 1;
-		clear_bit(FLAG_IS_OUT, &desc->flags);
-	}
-	if (ret == 0) {
-		/* GPIOF_DIR_OUT */
-		set_bit(FLAG_IS_OUT, &desc->flags);
-	}
+
+	assign_bit(FLAG_IS_OUT, &desc->flags, !ret);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_get_direction);
@@ -484,15 +484,6 @@ static int linehandle_validate_flags(u32 flags)
 	return 0;
 }
 
-static void linehandle_configure_flag(unsigned long *flagsp,
-				      u32 bit, bool active)
-{
-	if (active)
-		set_bit(bit, flagsp);
-	else
-		clear_bit(bit, flagsp);
-}
-
 static long linehandle_set_config(struct linehandle_state *lh,
 				  void __user *ip)
 {
@@ -514,22 +505,22 @@ static long linehandle_set_config(struct linehandle_state *lh,
 		desc = lh->descs[i];
 		flagsp = &desc->flags;
 
-		linehandle_configure_flag(flagsp, FLAG_ACTIVE_LOW,
+		assign_bit(FLAG_ACTIVE_LOW, flagsp,
 			lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
 
-		linehandle_configure_flag(flagsp, FLAG_OPEN_DRAIN,
+		assign_bit(FLAG_OPEN_DRAIN, flagsp,
 			lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
 
-		linehandle_configure_flag(flagsp, FLAG_OPEN_SOURCE,
+		assign_bit(FLAG_OPEN_SOURCE, flagsp,
 			lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
 
-		linehandle_configure_flag(flagsp, FLAG_PULL_UP,
+		assign_bit(FLAG_PULL_UP, flagsp,
 			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
 
-		linehandle_configure_flag(flagsp, FLAG_PULL_DOWN,
+		assign_bit(FLAG_PULL_DOWN, flagsp,
 			lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
 
-		linehandle_configure_flag(flagsp, FLAG_BIAS_DISABLE,
+		assign_bit(FLAG_BIAS_DISABLE, flagsp,
 			lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
 
 		/*
@@ -1561,15 +1552,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		struct gpio_desc *desc = &gdev->descs[i];
 
 		if (chip->get_direction && gpiochip_line_is_valid(chip, i)) {
-			if (!chip->get_direction(chip, i))
-				set_bit(FLAG_IS_OUT, &desc->flags);
-			else
-				clear_bit(FLAG_IS_OUT, &desc->flags);
+			assign_bit(FLAG_IS_OUT,
+				   &desc->flags, !chip->get_direction(chip, i));
 		} else {
-			if (!chip->direction_input)
-				set_bit(FLAG_IS_OUT, &desc->flags);
-			else
-				clear_bit(FLAG_IS_OUT, &desc->flags);
+			assign_bit(FLAG_IS_OUT,
+				   &desc->flags, !chip->direction_input);
 		}
 	}
 
@@ -3371,10 +3358,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	 * Handle FLAG_TRANSITORY first, enabling queries to gpiolib for
 	 * persistence state.
 	 */
-	if (transitory)
-		set_bit(FLAG_TRANSITORY, &desc->flags);
-	else
-		clear_bit(FLAG_TRANSITORY, &desc->flags);
+	assign_bit(FLAG_TRANSITORY, &desc->flags, transitory);
 
 	/* If the driver supports it, set the persistence state now */
 	chip = desc->gdev->chip;
@@ -3830,10 +3814,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				gpio_set_open_source_value_commit(desc, value);
 			} else {
 				__set_bit(hwgpio, mask);
-				if (value)
-					__set_bit(hwgpio, bits);
-				else
-					__clear_bit(hwgpio, bits);
+				__assign_bit(hwgpio, bits, value);
 				count++;
 			}
 			i++;
-- 
2.24.0

