Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320002AFB01
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgKKWGV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:21 -0500
Received: from mga11.intel.com ([192.55.52.93]:61332 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgKKWGV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:21 -0500
IronPort-SDR: rij4CGH989K841Y4QOdNz3f8u5t1mJ3DStv5jTn9UA27OpznLcm/romTv8hxbmGE472mrgAfa7
 5xgVcMgWQ41Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="166717637"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="166717637"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:20 -0800
IronPort-SDR: lJ87Q1bc0zbCSSpJDCRu5TWw8cJgTWLpAYRsxsoJEtOHiqyVQRlFqWOD/ppd9bxwLmy9EEM5DJ
 fTu7BHuS1pYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="308626166"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 11 Nov 2020 14:06:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 777653D3; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 04/18] gpiolib: Extract gpio_set_config_with_argument_optional() helper
Date:   Thu, 12 Nov 2020 00:05:45 +0200
Message-Id: <20201111220559.39680-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function is useful for internal use in the GPIO library.
There will be new user coming, prepare a helper for the new comer
and the existing ones.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 53 +++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2bfc44ca4425..c4f73597a54d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2105,6 +2105,29 @@ static int gpio_set_config_with_argument(struct gpio_desc *desc,
 	return gpio_do_set_config(gc, gpio_chip_hwgpio(desc), config);
 }
 
+static int gpio_set_config_with_argument_optional(struct gpio_desc *desc,
+						  enum pin_config_param mode,
+						  u32 argument)
+{
+	struct device *dev = &desc->gdev->dev;
+	int gpio = gpio_chip_hwgpio(desc);
+	int ret;
+
+	ret = gpio_set_config_with_argument(desc, mode, argument);
+	if (ret != -ENOTSUPP)
+		return ret;
+
+	switch (mode) {
+	case PIN_CONFIG_PERSIST_STATE:
+		dev_dbg(dev, "Persistence not supported for GPIO %d\n", gpio);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 {
 	return gpio_set_config_with_argument(desc, mode, 0);
@@ -2114,7 +2137,6 @@ static int gpio_set_bias(struct gpio_desc *desc)
 {
 	enum pin_config_param bias;
 	unsigned int arg;
-	int ret;
 
 	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
 		bias = PIN_CONFIG_BIAS_DISABLE;
@@ -2136,11 +2158,7 @@ static int gpio_set_bias(struct gpio_desc *desc)
 		break;
 	}
 
-	ret = gpio_set_config_with_argument(desc, bias, arg);
-	if (ret != -ENOTSUPP)
-		return ret;
-
-	return 0;
+	return gpio_set_config_with_argument_optional(desc, bias, arg);
 }
 
 /**
@@ -2381,11 +2399,6 @@ EXPORT_SYMBOL_GPL(gpiod_set_debounce);
  */
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 {
-	struct gpio_chip *gc;
-	unsigned long packed;
-	int gpio;
-	int rc;
-
 	VALIDATE_DESC(desc);
 	/*
 	 * Handle FLAG_TRANSITORY first, enabling queries to gpiolib for
@@ -2394,21 +2407,9 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	assign_bit(FLAG_TRANSITORY, &desc->flags, transitory);
 
 	/* If the driver supports it, set the persistence state now */
-	gc = desc->gdev->chip;
-	if (!gc->set_config)
-		return 0;
-
-	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
-					  !transitory);
-	gpio = gpio_chip_hwgpio(desc);
-	rc = gpio_do_set_config(gc, gpio, packed);
-	if (rc == -ENOTSUPP) {
-		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
-				gpio);
-		return 0;
-	}
-
-	return rc;
+	return gpio_set_config_with_argument_optional(desc,
+						      PIN_CONFIG_PERSIST_STATE,
+						      !transitory);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_transitory);
 
-- 
2.28.0

