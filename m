Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC892D74AB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 12:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394499AbgLKL2f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 06:28:35 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:22276 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394418AbgLKL22 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 06:28:28 -0500
X-IronPort-AV: E=Sophos;i="5.78,411,1599490800"; 
   d="scan'208";a="65422225"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Dec 2020 20:27:56 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3A34C42D7EA1;
        Fri, 11 Dec 2020 20:27:56 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 06/10] gpio: bd9571mwv: rid of using struct bd9571mwv
Date:   Fri, 11 Dec 2020 20:27:36 +0900
Message-Id: <1607686060-17448-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To simplify this driver, use dev_get_regmap() and
rid of using struct bd9571mwv.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/gpio/gpio-bd9571mwv.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index abb622c..0e5395f 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -16,8 +16,8 @@
 #include <linux/mfd/bd9571mwv.h>
 
 struct bd9571mwv_gpio {
+	struct regmap *regmap;
 	struct gpio_chip chip;
-	struct bd9571mwv *bd;
 };
 
 static int bd9571mwv_gpio_get_direction(struct gpio_chip *chip,
@@ -26,7 +26,7 @@ static int bd9571mwv_gpio_get_direction(struct gpio_chip *chip,
 	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
 	int ret, val;
 
-	ret = regmap_read(gpio->bd->regmap, BD9571MWV_GPIO_DIR, &val);
+	ret = regmap_read(gpio->regmap, BD9571MWV_GPIO_DIR, &val);
 	if (ret < 0)
 		return ret;
 	if (val & BIT(offset))
@@ -40,8 +40,7 @@ static int bd9571mwv_gpio_direction_input(struct gpio_chip *chip,
 {
 	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->bd->regmap, BD9571MWV_GPIO_DIR,
-			   BIT(offset), 0);
+	regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_DIR, BIT(offset), 0);
 
 	return 0;
 }
@@ -52,9 +51,9 @@ static int bd9571mwv_gpio_direction_output(struct gpio_chip *chip,
 	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
 
 	/* Set the initial value */
-	regmap_update_bits(gpio->bd->regmap, BD9571MWV_GPIO_OUT,
+	regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_OUT,
 			   BIT(offset), value ? BIT(offset) : 0);
-	regmap_update_bits(gpio->bd->regmap, BD9571MWV_GPIO_DIR,
+	regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_DIR,
 			   BIT(offset), BIT(offset));
 
 	return 0;
@@ -65,7 +64,7 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
 	int ret, val;
 
-	ret = regmap_read(gpio->bd->regmap, BD9571MWV_GPIO_IN, &val);
+	ret = regmap_read(gpio->regmap, BD9571MWV_GPIO_IN, &val);
 	if (ret < 0)
 		return ret;
 
@@ -77,7 +76,7 @@ static void bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
 {
 	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->bd->regmap, BD9571MWV_GPIO_OUT,
+	regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_OUT,
 			   BIT(offset), value ? BIT(offset) : 0);
 }
 
@@ -105,9 +104,9 @@ static int bd9571mwv_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio);
 
-	gpio->bd = dev_get_drvdata(pdev->dev.parent);
+	gpio->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	gpio->chip = template_chip;
-	gpio->chip.parent = gpio->bd->dev;
+	gpio->chip.parent = pdev->dev.parent;
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (ret < 0) {
-- 
2.7.4

