Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210F52B4179
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 11:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgKPKmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 05:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729233AbgKPKmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 05:42:54 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CBBC0617A6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:53 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id w24so23156668wmi.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NzHd8yMlzJUVP/iKaDBAkoAJiAGV4P4WxXUX90OVeHw=;
        b=HY31/PcYcfd4XT9V24pQkQqWPiOUyhA489/gFpMk5EzhTGUehSGkoh4XbTYis4TurZ
         xFA7hPao/FaH7kjJRaA+o2cA0y9LYvkn4Ib8khnLBbXNk0UMC0WMjnwgjFzsZ8Q303Xa
         oH8OghRsvqrlk7UlMphu8Zwz2C1iyypRxtlN/B/9lotAAdwBn59hvDhrw5uwvr+SjM66
         jg58fpuYmU1XrKXbloI8ti/RLJsN4hW2nA3CYjdu2m0WYiuh//X1suMLpmYy5HYyM9gp
         hGJv1Wf2Nx+JW7lZ5L+5XQr/9UEg8HgQkoLPB52e6ZgnvUETnNUzXWsBCZnUIQvVvS3J
         DZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzHd8yMlzJUVP/iKaDBAkoAJiAGV4P4WxXUX90OVeHw=;
        b=m+xWXny7/ZjmHpDPlnuMyXgOepgbBV+s8YZs2xOmMmgkcKo/KN5d15qZIJabVaaQzD
         z/aosWKDPbi3SOUsdYxzB3HR/sWZptxVPmYeNPLKuwSUf+dWZ66C12diCTh6Fs+Uckhy
         zGUHTsa2jmS/X9U+BagHyXU0wQ+knMQ/R8z3yc6e45QbRQhGfGFBvDDOdRYOt83II73c
         WySjvUi15gIHtmaqCdbKhMVd6BoBZ8H0V33fITt8Ouii4dIRaIpbBhmfssI1QuOg/FqD
         hyPHMsgSkzJgIWdjxYxM79L81AA+Dcr74EBvHQ1GBA0UzUSCAcxcOLXmBQgVy+hLibjV
         iolA==
X-Gm-Message-State: AOAM5326XkofsWsHbsLihkF5eQAj5U1YctnbS+JrpSAMfJImpcpH0u8C
        XUVIvWQrAmcr/wCqtLbyDqtdPw==
X-Google-Smtp-Source: ABdhPJysv+mfcnM/Yeqh8j8pF9nfGBraGAuzwMlySbsTsJLNspINsw2bCuMp0VAcFiy9zbgGT1USgg==
X-Received: by 2002:a1c:e006:: with SMTP id x6mr15135428wmg.107.1605523372546;
        Mon, 16 Nov 2020 02:42:52 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id v16sm20583283wml.33.2020.11.16.02.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 02:42:52 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 6/7] gpio: exar: switch to using regmap
Date:   Mon, 16 Nov 2020 11:42:41 +0100
Message-Id: <20201116104242.19907-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116104242.19907-1-brgl@bgdev.pl>
References: <20201116104242.19907-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can simplify the code in gpio-exar by using regmap. This allows us to
drop the mutex (regmap provides its own locking) and we can also reuse
regmap's bit operations instead of implementing our own update function.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig     |  1 +
 drivers/gpio/gpio-exar.c | 96 ++++++++++++++++++----------------------
 2 files changed, 43 insertions(+), 54 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..253a61ec9645 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -255,6 +255,7 @@ config GPIO_EP93XX
 config GPIO_EXAR
 	tristate "Support for GPIO pins on XR17V352/354/358"
 	depends on SERIAL_8250_EXAR
+	select REGMAP_MMIO
 	help
 	  Selecting this option will enable handling of GPIO pins present
 	  on Exar XR17V352/354/358 chips.
diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 28b0b4b5fa35..79fb0964ace3 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #define EXAR_OFFSET_MPIOLVL_LO 0x90
 #define EXAR_OFFSET_MPIOSEL_LO 0x93
@@ -26,9 +27,8 @@ static DEFINE_IDA(ida_index);
 
 struct exar_gpio_chip {
 	struct gpio_chip gpio_chip;
-	struct mutex lock;
+	struct regmap *regmap;
 	int index;
-	void __iomem *regs;
 	char name[20];
 	unsigned int first_pin;
 };
@@ -53,51 +53,13 @@ exar_offset_to_bit(struct exar_gpio_chip *exar_gpio, unsigned int offset)
 	return (offset + exar_gpio->first_pin) % 8;
 }
 
-static void exar_update(struct gpio_chip *chip, unsigned int reg, int val,
-			unsigned int offset)
-{
-	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	int temp;
-
-	mutex_lock(&exar_gpio->lock);
-	temp = readb(exar_gpio->regs + reg);
-	temp &= ~BIT(offset);
-	if (val)
-		temp |= BIT(offset);
-	writeb(temp, exar_gpio->regs + reg);
-	mutex_unlock(&exar_gpio->lock);
-}
-
-static int exar_set_direction(struct gpio_chip *chip, int direction,
-			      unsigned int offset)
-{
-	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
-	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
-
-	exar_update(chip, addr, direction, bit);
-	return 0;
-}
-
-static int exar_get(struct gpio_chip *chip, unsigned int reg)
-{
-	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	int value;
-
-	mutex_lock(&exar_gpio->lock);
-	value = readb(exar_gpio->regs + reg);
-	mutex_unlock(&exar_gpio->lock);
-
-	return value;
-}
-
 static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
 	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
-	if (exar_get(chip, addr) & BIT(bit))
+	if (regmap_test_bits(exar_gpio->regmap, addr, BIT(bit)))
 		return GPIO_LINE_DIRECTION_IN;
 
 	return GPIO_LINE_DIRECTION_OUT;
@@ -109,7 +71,7 @@ static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
 	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
-	return !!(exar_get(chip, addr) & BIT(bit));
+	return !!(regmap_test_bits(exar_gpio->regmap, addr, BIT(bit)));
 }
 
 static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
@@ -119,21 +81,47 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
-	exar_update(chip, addr, value, bit);
+	if (value)
+		regmap_set_bits(exar_gpio->regmap, addr, BIT(bit));
+	else
+		regmap_clear_bits(exar_gpio->regmap, addr, BIT(bit));
 }
 
 static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
 				 int value)
 {
+	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
+	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
+
 	exar_set_value(chip, offset, value);
-	return exar_set_direction(chip, 0, offset);
+	regmap_clear_bits(exar_gpio->regmap, addr, BIT(bit));
+
+	return 0;
 }
 
 static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
-	return exar_set_direction(chip, 1, offset);
+	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
+	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
+
+	regmap_set_bits(exar_gpio->regmap, addr, BIT(bit));
+
+	return 0;
 }
 
+static const struct regmap_config exar_regmap_config = {
+	.name		= "exar-gpio",
+	/*
+	 * While we're not programmatically blocking the regmap from accessing
+	 * any non-GPIO registers, 11 address bits holds the maximum address
+	 * we need to access from this driver.
+	 */
+	.reg_bits	= 11,
+	.val_bits	= 8,
+};
+
 static int gpio_exar_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -163,13 +151,17 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	if (!exar_gpio)
 		return -ENOMEM;
 
-	mutex_init(&exar_gpio->lock);
+	/*
+	 * We don't need to check the return values of mmio regmap operations (unless
+	 * the regmap has a clock attached which is not the case here).
+	 */
+	exar_gpio->regmap = devm_regmap_init_mmio(dev, p, &exar_regmap_config);
+	if (IS_ERR(exar_gpio->regmap))
+		return PTR_ERR(exar_gpio->regmap);
 
 	index = ida_alloc(&ida_index, GFP_KERNEL);
-	if (index < 0) {
-		ret = index;
-		goto err_mutex_destroy;
-	}
+	if (index < 0)
+		return index;
 
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
@@ -181,7 +173,6 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	exar_gpio->gpio_chip.set = exar_set_value;
 	exar_gpio->gpio_chip.base = -1;
 	exar_gpio->gpio_chip.ngpio = ngpios;
-	exar_gpio->regs = p;
 	exar_gpio->index = index;
 	exar_gpio->first_pin = first_pin;
 
@@ -195,8 +186,6 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 err_destroy:
 	ida_free(&ida_index, index);
-err_mutex_destroy:
-	mutex_destroy(&exar_gpio->lock);
 	return ret;
 }
 
@@ -205,7 +194,6 @@ static int gpio_exar_remove(struct platform_device *pdev)
 	struct exar_gpio_chip *exar_gpio = platform_get_drvdata(pdev);
 
 	ida_free(&ida_index, exar_gpio->index);
-	mutex_destroy(&exar_gpio->lock);
 
 	return 0;
 }
-- 
2.29.1

