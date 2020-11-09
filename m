Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8862AC668
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730408AbgKIUxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:55 -0500
Received: from mga11.intel.com ([192.55.52.93]:33886 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730305AbgKIUxy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:54 -0500
IronPort-SDR: Ze6ylc3Qv2Sm96JUAzd5S3PrCLO/J+atGDwlIvu2Ku8pNABb7z0KUp8zCgjkRrKJgJChRyo6fU
 QBnuguT7rn5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="166360553"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="166360553"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:53 -0800
IronPort-SDR: oy2CxVa8c2mWbc/qilhMJy9wHlv7LbEXIEVx63Bta9pVykmP2jFV8bAApfG0fz56rJjUMoksdS
 Cf4/GkN9wzFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="365605629"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2020 12:53:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2D6694C7; Mon,  9 Nov 2020 22:53:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 07/17] gpiolib: Extract gpio_set_config_with_argument_optional() helper
Date:   Mon,  9 Nov 2020 22:53:22 +0200
Message-Id: <20201109205332.19592-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function is useful for internal use in GPIO library.
There will be new user coming, prepare a helper for the new comer
and the existing ones.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 50 ++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0691ecbd9a16..4558af08df23 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2105,6 +2105,30 @@ static int gpio_set_config_with_argument(struct gpio_desc *desc,
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
+		if (ret)
+			dev_dbg(dev, "Persistence not supported for GPIO %d\n", gpio);
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
@@ -2114,7 +2138,6 @@ static int gpio_set_bias(struct gpio_desc *desc)
 {
 	enum pin_config_param bias;
 	unsigned int arg;
-	int ret;
 
 	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
 		bias = PIN_CONFIG_BIAS_DISABLE;
@@ -2136,11 +2159,7 @@ static int gpio_set_bias(struct gpio_desc *desc)
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
@@ -2382,10 +2401,6 @@ EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 {
 	enum pin_config_param mode = PIN_CONFIG_PERSIST_STATE;
-	struct gpio_chip *gc;
-	unsigned long packed;
-	int gpio;
-	int rc;
 
 	VALIDATE_DESC(desc);
 	/*
@@ -2395,20 +2410,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	assign_bit(FLAG_TRANSITORY, &desc->flags, transitory);
 
 	/* If the driver supports it, set the persistence state now */
-	gc = desc->gdev->chip;
-	if (!gc->set_config)
-		return 0;
-
-	packed = pinconf_to_config_packed(mode, !transitory);
-	gpio = gpio_chip_hwgpio(desc);
-	rc = gpio_do_set_config(gc, gpio, packed);
-	if (rc == -ENOTSUPP) {
-		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
-				gpio);
-		return 0;
-	}
-
-	return rc;
+	return gpio_set_config_with_argument_optional(desc, mode, !transitory);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_transitory);
 
-- 
2.28.0

