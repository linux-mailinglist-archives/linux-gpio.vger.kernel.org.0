Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126822EAB3F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 13:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbhAEMy1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 07:54:27 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:40180 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbhAEMy0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 07:54:26 -0500
Received: by mail-lf1-f44.google.com with SMTP id m12so72296218lfo.7;
        Tue, 05 Jan 2021 04:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wgEJw0Gi7656t3/rv1rBSKj4Jy3xKXdQbpqBhq9DA4M=;
        b=P20J6N/f/WDeIopDrafLbxGyEmnLsPs8ET9Sm90ec81NL/VbAzVmz19pSvKwYxuYRY
         Jrn0VAv50zHtrQjedbrwGfgoIRZ6H6ZdNA/XFTBGKyAbUH9cPbWY3+YTw8k5CWyKZPFm
         93L3i4y5/Lu92+Y2zuKiLICFu0u4TLVv6crI1GZtaxM5P4rwQOPBpRfIm2iebwauYYB8
         4tgQI/EaZzmDfc4Kj4byE9dzAiUriLksR41/gqsbJQJ1ihsCd+qx9PV8r24GWNgBPhF0
         axWaavXMKF91mruK+E7eZCZRHNqblHhwGUYeOkZowgXqz0YPTlSsc+hjWifh3X8wTi+J
         Ny8g==
X-Gm-Message-State: AOAM532Dgsr4kaHCORrfgSW1q4g5yXjeBr1KdKjKzllZ/Iv7ntpp5CeW
        UyCXqpfJZMCZ70x8GcPObnnvrKh+7mc=
X-Google-Smtp-Source: ABdhPJxX/yZHudPaTJcg6m+ZM6lJt59OLmyJridU/Ijr0zGolSamI9q4OiiOGptJvGYI98ZQeXmygA==
X-Received: by 2002:a19:3f12:: with SMTP id m18mr31690957lfa.519.1609851223026;
        Tue, 05 Jan 2021 04:53:43 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id l15sm4342029lfc.244.2021.01.05.04.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:53:42 -0800 (PST)
Date:   Tue, 5 Jan 2021 14:53:35 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: bd7xxxx: Do not depend on parent driver data
Message-ID: <20210105125335.GA3430233@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ROHM BD70528 and BD71828 GPIO drivers only need the regmap
pointer from parent. Regmap can be obtained via dev_get_regmap()
so do not require parent to populate driver data for that.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-bd70528.c | 46 +++++++++++++++++--------------------
 drivers/gpio/gpio-bd71828.c | 28 ++++++++++------------
 2 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
index 45b3da8da336..276a0fe6346d 100644
--- a/drivers/gpio/gpio-bd70528.c
+++ b/drivers/gpio/gpio-bd70528.c
@@ -12,7 +12,8 @@
 #define GPIO_OUT_REG(offset) (BD70528_REG_GPIO1_OUT + (offset) * 2)
 
 struct bd70528_gpio {
-	struct rohm_regmap_dev chip;
+	struct regmap *regmap;
+	struct device *dev;
 	struct gpio_chip gpio;
 };
 
@@ -35,11 +36,11 @@ static int bd70528_set_debounce(struct bd70528_gpio *bdgpio,
 		val = BD70528_DEBOUNCE_50MS;
 		break;
 	default:
-		dev_err(bdgpio->chip.dev,
+		dev_err(bdgpio->dev,
 			"Invalid debounce value %u\n", debounce);
 		return -EINVAL;
 	}
-	return regmap_update_bits(bdgpio->chip.regmap, GPIO_IN_REG(offset),
+	return regmap_update_bits(bdgpio->regmap, GPIO_IN_REG(offset),
 				 BD70528_DEBOUNCE_MASK, val);
 }
 
@@ -49,9 +50,9 @@ static int bd70528_get_direction(struct gpio_chip *chip, unsigned int offset)
 	int val, ret;
 
 	/* Do we need to do something to IRQs here? */
-	ret = regmap_read(bdgpio->chip.regmap, GPIO_OUT_REG(offset), &val);
+	ret = regmap_read(bdgpio->regmap, GPIO_OUT_REG(offset), &val);
 	if (ret) {
-		dev_err(bdgpio->chip.dev, "Could not read gpio direction\n");
+		dev_err(bdgpio->dev, "Could not read gpio direction\n");
 		return ret;
 	}
 	if (val & BD70528_GPIO_OUT_EN_MASK)
@@ -67,13 +68,13 @@ static int bd70528_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 	switch (pinconf_to_config_param(config)) {
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		return regmap_update_bits(bdgpio->chip.regmap,
+		return regmap_update_bits(bdgpio->regmap,
 					  GPIO_OUT_REG(offset),
 					  BD70528_GPIO_DRIVE_MASK,
 					  BD70528_GPIO_OPEN_DRAIN);
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		return regmap_update_bits(bdgpio->chip.regmap,
+		return regmap_update_bits(bdgpio->regmap,
 					  GPIO_OUT_REG(offset),
 					  BD70528_GPIO_DRIVE_MASK,
 					  BD70528_GPIO_PUSH_PULL);
@@ -93,7 +94,7 @@ static int bd70528_direction_input(struct gpio_chip *chip, unsigned int offset)
 	struct bd70528_gpio *bdgpio = gpiochip_get_data(chip);
 
 	/* Do we need to do something to IRQs here? */
-	return regmap_update_bits(bdgpio->chip.regmap, GPIO_OUT_REG(offset),
+	return regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
 				 BD70528_GPIO_OUT_EN_MASK,
 				 BD70528_GPIO_OUT_DISABLE);
 }
@@ -105,10 +106,10 @@ static void bd70528_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	struct bd70528_gpio *bdgpio = gpiochip_get_data(chip);
 	u8 val = (value) ? BD70528_GPIO_OUT_HI : BD70528_GPIO_OUT_LO;
 
-	ret = regmap_update_bits(bdgpio->chip.regmap, GPIO_OUT_REG(offset),
+	ret = regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
 				 BD70528_GPIO_OUT_MASK, val);
 	if (ret)
-		dev_err(bdgpio->chip.dev, "Could not set gpio to %d\n", value);
+		dev_err(bdgpio->dev, "Could not set gpio to %d\n", value);
 }
 
 static int bd70528_direction_output(struct gpio_chip *chip, unsigned int offset,
@@ -117,7 +118,7 @@ static int bd70528_direction_output(struct gpio_chip *chip, unsigned int offset,
 	struct bd70528_gpio *bdgpio = gpiochip_get_data(chip);
 
 	bd70528_gpio_set(chip, offset, value);
-	return regmap_update_bits(bdgpio->chip.regmap, GPIO_OUT_REG(offset),
+	return regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
 				 BD70528_GPIO_OUT_EN_MASK,
 				 BD70528_GPIO_OUT_ENABLE);
 }
@@ -129,11 +130,11 @@ static int bd70528_gpio_get_o(struct bd70528_gpio *bdgpio, unsigned int offset)
 	int ret;
 	unsigned int val;
 
-	ret = regmap_read(bdgpio->chip.regmap, GPIO_OUT_REG(offset), &val);
+	ret = regmap_read(bdgpio->regmap, GPIO_OUT_REG(offset), &val);
 	if (!ret)
 		ret = !!(val & BD70528_GPIO_OUT_MASK);
 	else
-		dev_err(bdgpio->chip.dev, "GPIO (out) state read failed\n");
+		dev_err(bdgpio->dev, "GPIO (out) state read failed\n");
 
 	return ret;
 }
@@ -143,12 +144,12 @@ static int bd70528_gpio_get_i(struct bd70528_gpio *bdgpio, unsigned int offset)
 	unsigned int val;
 	int ret;
 
-	ret = regmap_read(bdgpio->chip.regmap, BD70528_REG_GPIO_STATE, &val);
+	ret = regmap_read(bdgpio->regmap, BD70528_REG_GPIO_STATE, &val);
 
 	if (!ret)
 		ret = !(val & GPIO_IN_STATE_MASK(offset));
 	else
-		dev_err(bdgpio->chip.dev, "GPIO (in) state read failed\n");
+		dev_err(bdgpio->dev, "GPIO (in) state read failed\n");
 
 	return ret;
 }
@@ -173,7 +174,7 @@ static int bd70528_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	else if (ret == GPIO_LINE_DIRECTION_IN)
 		ret = bd70528_gpio_get_i(bdgpio, offset);
 	else
-		dev_err(bdgpio->chip.dev, "failed to read GPIO direction\n");
+		dev_err(bdgpio->dev, "failed to read GPIO direction\n");
 
 	return ret;
 }
@@ -181,20 +182,13 @@ static int bd70528_gpio_get(struct gpio_chip *chip, unsigned int offset)
 static int bd70528_probe(struct platform_device *pdev)
 {
 	struct bd70528_gpio *bdgpio;
-	struct rohm_regmap_dev *bd70528;
 	int ret;
 
-	bd70528 = dev_get_drvdata(pdev->dev.parent);
-	if (!bd70528) {
-		dev_err(&pdev->dev, "No MFD driver data\n");
-		return -EINVAL;
-	}
-
 	bdgpio = devm_kzalloc(&pdev->dev, sizeof(*bdgpio),
 			      GFP_KERNEL);
 	if (!bdgpio)
 		return -ENOMEM;
-	bdgpio->chip.dev = &pdev->dev;
+	bdgpio->dev = &pdev->dev;
 	bdgpio->gpio.parent = pdev->dev.parent;
 	bdgpio->gpio.label = "bd70528-gpio";
 	bdgpio->gpio.owner = THIS_MODULE;
@@ -210,7 +204,9 @@ static int bd70528_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF_GPIO
 	bdgpio->gpio.of_node = pdev->dev.parent->of_node;
 #endif
-	bdgpio->chip.regmap = bd70528->regmap;
+	bdgpio->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!bdgpio->regmap)
+		return -ENODEV;
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &bdgpio->gpio,
 				     bdgpio);
diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-bd71828.c
index 3dbbc638e9a9..fcdcbb57c76d 100644
--- a/drivers/gpio/gpio-bd71828.c
+++ b/drivers/gpio/gpio-bd71828.c
@@ -11,7 +11,8 @@
 #define HALL_GPIO_OFFSET 3
 
 struct bd71828_gpio {
-	struct rohm_regmap_dev chip;
+	struct regmap *regmap;
+	struct device *dev;
 	struct gpio_chip gpio;
 };
 
@@ -29,10 +30,10 @@ static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	if (offset == HALL_GPIO_OFFSET)
 		return;
 
-	ret = regmap_update_bits(bdgpio->chip.regmap, GPIO_OUT_REG(offset),
+	ret = regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
 				 BD71828_GPIO_OUT_MASK, val);
 	if (ret)
-		dev_err(bdgpio->chip.dev, "Could not set gpio to %d\n", value);
+		dev_err(bdgpio->dev, "Could not set gpio to %d\n", value);
 }
 
 static int bd71828_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -42,10 +43,10 @@ static int bd71828_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct bd71828_gpio *bdgpio = gpiochip_get_data(chip);
 
 	if (offset == HALL_GPIO_OFFSET)
-		ret = regmap_read(bdgpio->chip.regmap, BD71828_REG_IO_STAT,
+		ret = regmap_read(bdgpio->regmap, BD71828_REG_IO_STAT,
 				  &val);
 	else
-		ret = regmap_read(bdgpio->chip.regmap, GPIO_OUT_REG(offset),
+		ret = regmap_read(bdgpio->regmap, GPIO_OUT_REG(offset),
 				  &val);
 	if (!ret)
 		ret = (val & BD71828_GPIO_OUT_MASK);
@@ -63,12 +64,12 @@ static int bd71828_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 	switch (pinconf_to_config_param(config)) {
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		return regmap_update_bits(bdgpio->chip.regmap,
+		return regmap_update_bits(bdgpio->regmap,
 					  GPIO_OUT_REG(offset),
 					  BD71828_GPIO_DRIVE_MASK,
 					  BD71828_GPIO_OPEN_DRAIN);
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		return regmap_update_bits(bdgpio->chip.regmap,
+		return regmap_update_bits(bdgpio->regmap,
 					  GPIO_OUT_REG(offset),
 					  BD71828_GPIO_DRIVE_MASK,
 					  BD71828_GPIO_PUSH_PULL);
@@ -97,20 +98,13 @@ static int bd71828_get_direction(struct gpio_chip *chip, unsigned int offset)
 static int bd71828_probe(struct platform_device *pdev)
 {
 	struct bd71828_gpio *bdgpio;
-	struct rohm_regmap_dev *bd71828;
-
-	bd71828 = dev_get_drvdata(pdev->dev.parent);
-	if (!bd71828) {
-		dev_err(&pdev->dev, "No MFD driver data\n");
-		return -EINVAL;
-	}
 
 	bdgpio = devm_kzalloc(&pdev->dev, sizeof(*bdgpio),
 			      GFP_KERNEL);
 	if (!bdgpio)
 		return -ENOMEM;
 
-	bdgpio->chip.dev = &pdev->dev;
+	bdgpio->dev = &pdev->dev;
 	bdgpio->gpio.parent = pdev->dev.parent;
 	bdgpio->gpio.label = "bd71828-gpio";
 	bdgpio->gpio.owner = THIS_MODULE;
@@ -128,7 +122,9 @@ static int bd71828_probe(struct platform_device *pdev)
 	 */
 	bdgpio->gpio.ngpio = 4;
 	bdgpio->gpio.of_node = pdev->dev.parent->of_node;
-	bdgpio->chip.regmap = bd71828->regmap;
+	bdgpio->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!bdgpio->regmap)
+		return -ENODEV;
 
 	return devm_gpiochip_add_data(&pdev->dev, &bdgpio->gpio,
 				     bdgpio);

base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
