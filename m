Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD54298EFE
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781125AbgJZOTA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:19:00 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44494 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781120AbgJZOS7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:18:59 -0400
Received: by mail-wr1-f66.google.com with SMTP id t9so12769669wrq.11
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZWPI8QDzUF9d2DydMsPhQvG9960psVdbdyNTKcxk/Ew=;
        b=j0ElfpFVTGknp521eaDxu0v5BJxMeHCq3sFAlqVmZsXJb66uXJLYds5E7QRedTU5sy
         MHMYFQw03FcmyCoKYbG4BS+mSi5jkBSgHGpCH1xaX8z2L7WUoqVr7PV4zD1gsTjuc92k
         sa3PtaTloZrj0bDa25xT+tgXejP8+3OS2jpVapkogP+LK25g9oVw1PLlnZYKlZ8vXcT8
         ntbHpS9K1TWjWabQVtogsGXKxZbzNsGtxak5VlmxFaMncAvIwSm4SiQQVeoCtlha8ifU
         h1j1rTrjfUP44ii+H8eR1tV4h9PewyhTYg7v3oz0rWOsgM5z2EbuhfIfpgIm0M0bHQST
         VIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZWPI8QDzUF9d2DydMsPhQvG9960psVdbdyNTKcxk/Ew=;
        b=df2J86zQbukQeH7+yKWaseja7XKXrhZgYEElNOaPCP8kbNW8tZWGRtAhaZecmFLw8Z
         AvPzjQu0/za4YkNcjDTenLvh5uQ0AqUzdR1hE1jGVKulsN1WsD2SptCghMnnlMLE60Gi
         fUNc4YnaX3R65BAAdLTcSsgonJ+oG//cU/RPFIoQJfiXCrXgxT4uUwk0K+xkorGmuY3C
         Y6MrUZVCSEZ4/GlS2s64+dIZP6UBJ+plMLCSzsdm9UO+5HxeOXx+IY77NtQ604lRu1G5
         UvGDfVILEm9jMdU2vYqs9K6NSLyyUuRsq0kJiPlzndmwGfS3ztJqo5WHcEjm3mLW9rDc
         O8EA==
X-Gm-Message-State: AOAM531Vi+Tpvz0kb3xJTCdttEWfhERkZo/JR0xeGNwlbCyS9FMdykrf
        tNjnnu0TbQMnPU39uBCqyqTISMG1QR1KYg==
X-Google-Smtp-Source: ABdhPJwHHI1We49SJh88pwxA/++JUYOiCaCAXx573XSneFa0hHFiepN/wXwoKpbcGWteI3VEYqePlg==
X-Received: by 2002:adf:f841:: with SMTP id d1mr18135937wrq.297.1603721936781;
        Mon, 26 Oct 2020 07:18:56 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id e15sm21920841wro.13.2020.10.26.07.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:18:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RFT PATCH 6/7] gpio: exar: switch to using regmap
Date:   Mon, 26 Oct 2020 15:18:38 +0100
Message-Id: <20201026141839.28536-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026141839.28536-1-brgl@bgdev.pl>
References: <20201026141839.28536-1-brgl@bgdev.pl>
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
 drivers/gpio/gpio-exar.c | 91 ++++++++++++++++------------------------
 2 files changed, 38 insertions(+), 54 deletions(-)

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
index 629f4dad6919..e4da278f74a2 100644
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
@@ -119,21 +81,41 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
-	exar_update(chip, addr, value, bit);
+	if (value)
+		regmap_set_bits(exar_gpio->regs, addr, BIT(bit));
+	else
+		regmap_clear_bits(exar_gpio->regs, addr, BIT(bit));
 }
 
 static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
 				 int value)
 {
-	exar_set_value(chip, offset, value);
-	return exar_set_direction(chip, 0, offset);
+	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
+	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
+
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
@@ -163,13 +145,17 @@ static int gpio_exar_probe(struct platform_device *pdev)
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
@@ -195,8 +181,6 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 err_destroy:
 	ida_free(&ida_index, index);
-err_mutex_destroy:
-	mutex_destroy(&exar_gpio->lock);
 	return ret;
 }
 
@@ -205,7 +189,6 @@ static int gpio_exar_remove(struct platform_device *pdev)
 	struct exar_gpio_chip *exar_gpio = platform_get_drvdata(pdev);
 
 	ida_free(&ida_index, exar_gpio->index);
-	mutex_destroy(&exar_gpio->lock);
 
 	return 0;
 }
-- 
2.29.1

