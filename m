Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864A62A6DEB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 20:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731610AbgKDTbJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 14:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731591AbgKDTbI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 14:31:08 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16ECC0613D3
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 11:31:06 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id n18so23295906wrs.5
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 11:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1oSX8d0s20vIvtJY9+lIFEPud2sgwrsAcD0zHkP4J58=;
        b=jROSX61wiGcQl/3Sr8iMkFKwo5ku/gPD2tfbkmWFGtaHr0xchnH/TmDRRe2GlOOlHu
         Qhc0KBr2uCH3WGajmR6vCf0dEOywr12i+LUe/99d74bfhFO1WUuK2QGUXjW/4rRBRQnQ
         jrng0T9Hn8mvUpDeLALigaSiEnwPGJDfln7jUi78mQpYqr43BGB2fu8So4oZSpPJBo/K
         Xla0b6GYdKcYHfWkxOVhR9oEZzMIH9dX/XxloYei8BVLH2cEoO26dPPiuexhMYo/ditg
         TT7s2JV3rQModxDxRe0H2Ke1y9nGJXITER31Vi61eRymeDva/1oSzoDdQUaonecgvNDC
         9pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1oSX8d0s20vIvtJY9+lIFEPud2sgwrsAcD0zHkP4J58=;
        b=RzpyYSCo+4ExNH6cKv+qlUA7+up8p04FbQuziOqp0TZey68tTYvzMMbFR0Ukp8UwC0
         jeglOp4REfy6RCOTO9LfoDb6Rlb2MiPMJZFujDNDQvYdOtpdDnB4YzmePER9/lVtaKm2
         H5QAGgw4i/y55eO6peKjIFD6L+rfDXSeAwYkiZUab9rRXlQpvYH9wzyL7q4RZZbbx5DZ
         rMmO6HdPvhfRFt/NMy8E0TMs32ntKM67hG1B2UwADjUhwsLRMqpehdHYFgwtaTH/8ciC
         Jl5WX+HnQ1QVsGh955I269vDd2TOIQoyYXPsvG7rrP2KTZShvCrl3ApoSzPtnX7P1M5r
         wq7Q==
X-Gm-Message-State: AOAM532QkNwJZGJ97ZfOJgmWcsiny+sAAtx5b7T8F9KRG8xy8fRb0Ybi
        JKn+ArJPPciYO7uERR3NYN5x+w==
X-Google-Smtp-Source: ABdhPJyqaBBx7QnlBAAw+jyikp3ziav/LSZ9syModQn7bIOgmOIPjrrwwNV6unhBCuRHw0Aj4JqxIQ==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr35481847wra.313.1604518265637;
        Wed, 04 Nov 2020 11:31:05 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m12sm4051671wrs.92.2020.11.04.11.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:31:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RFT PATCH v2 7/8] gpio: exar: switch to using regmap
Date:   Wed,  4 Nov 2020 20:30:50 +0100
Message-Id: <20201104193051.32236-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104193051.32236-1-brgl@bgdev.pl>
References: <20201104193051.32236-1-brgl@bgdev.pl>
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
---
 drivers/gpio/Kconfig     |  1 +
 drivers/gpio/gpio-exar.c | 87 ++++++++++++++++------------------------
 2 files changed, 35 insertions(+), 53 deletions(-)

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
index 28b0b4b5fa35..94ef500567ef 100644
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
+	struct regmap *regs;
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
+	if (regmap_test_bits(exar_gpio->regs, addr, BIT(bit)))
 		return GPIO_LINE_DIRECTION_IN;
 
 	return GPIO_LINE_DIRECTION_OUT;
@@ -109,7 +71,7 @@ static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
 	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
-	return !!(exar_get(chip, addr) & BIT(bit));
+	return !!(regmap_test_bits(exar_gpio->regs, addr, BIT(bit)));
 }
 
 static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
@@ -119,21 +81,39 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
-	exar_update(chip, addr, value, bit);
+	regmap_assign_bits(exar_gpio->regs, addr, BIT(bit), value);
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
+	regmap_clear_bits(exar_gpio->regs, addr, BIT(bit));
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
+	regmap_set_bits(exar_gpio->regs, addr, BIT(bit));
+
+	return 0;
 }
 
+static const struct regmap_config exar_regmap_config = {
+	.name		= "exar-gpio",
+	.reg_bits	= 8,
+	.val_bits	= 8,
+};
+
 static int gpio_exar_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -163,13 +143,17 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	if (!exar_gpio)
 		return -ENOMEM;
 
-	mutex_init(&exar_gpio->lock);
+	/*
+	 * We don't need to check the return values of mmio regmap operations (unless
+	 * the regmap has a clock attached which is not the case here).
+	 */
+	exar_gpio->regs = devm_regmap_init_mmio(dev, p, &exar_regmap_config);
+	if (IS_ERR(exar_gpio->regs))
+		return PTR_ERR(exar_gpio->regs);
 
 	index = ida_alloc(&ida_index, GFP_KERNEL);
-	if (index < 0) {
-		ret = index;
-		goto err_mutex_destroy;
-	}
+	if (index < 0)
+		return index;
 
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
@@ -195,8 +179,6 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 err_destroy:
 	ida_free(&ida_index, index);
-err_mutex_destroy:
-	mutex_destroy(&exar_gpio->lock);
 	return ret;
 }
 
@@ -205,7 +187,6 @@ static int gpio_exar_remove(struct platform_device *pdev)
 	struct exar_gpio_chip *exar_gpio = platform_get_drvdata(pdev);
 
 	ida_free(&ida_index, exar_gpio->index);
-	mutex_destroy(&exar_gpio->lock);
 
 	return 0;
 }
-- 
2.29.1

