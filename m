Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02F638DD7B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 00:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhEWWf6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 18:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhEWWfz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 18:35:55 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DF2C06138D
        for <linux-gpio@vger.kernel.org>; Sun, 23 May 2021 15:34:28 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 8CB68202A54;
        Mon, 24 May 2021 00:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621809266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2X9pHkF5aWPdiW7BSlrKumYHJyz+s9wXhroqdIN+ocs=;
        b=tMS0KhEeMuk9/kBXf8DmZK8AatGSiDaVH2yZQeBLmTN7sb1M4GtXU7Fkvnu4cdUrVIJWt3
        fnKBWsqlfQn/Pq36mIRaPtiLLZb36e7w0aOs16fkHn8goHK2eFpLTZb33vVdtp8mK/i2D+
        ytCyHbVjDQeI7xvJHEhxObV/QpPuzsswYlKAKKUms3Rrc7O3e+FDkkimm5TXPHk3k23RNi
        LX7wsNDqJjqp2PoZI/OtKi3iPVmzCx5OsM1yncB39C2LZBPD0L5RYQL/G3L9tseHFqSXm/
        Z1jZscv/PUOzBHvTth8x+3gS4yH8IexzwQ/hxnxJY0opTmyWJx0zTTaQs+0TCQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v3 1/6] gpio: regmap: Add quirk for output data register
Date:   Mon, 24 May 2021 00:33:59 +0200
Message-Id: <be5ffefa007ee4ebd7d4cec88f5f2fb7cd5b689e.1621809029.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621809029.git.sander@svanheule.net>
References: <cover.1621809029.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO chips may not support setting the output value when a pin is
configured as an input, although the current implementation assumes this
is always possible.

Add support for setting pin direction before value. The order defaults
to setting the value first, but this can be reversed by setting the
GPIO_REGMAP_QUIRK_SET_DIRECTION_FIRST flag in regmap_config.quirks.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/gpio/gpio-regmap.c  | 15 +++++++++++++--
 include/linux/gpio/regmap.h | 13 +++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..95553734e169 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -15,6 +15,7 @@ struct gpio_regmap {
 	struct device *parent;
 	struct regmap *regmap;
 	struct gpio_chip gpio_chip;
+	unsigned int quirks;
 
 	int reg_stride;
 	int ngpio_per_reg;
@@ -173,9 +174,18 @@ static int gpio_regmap_direction_input(struct gpio_chip *chip,
 static int gpio_regmap_direction_output(struct gpio_chip *chip,
 					unsigned int offset, int value)
 {
-	gpio_regmap_set(chip, offset, value);
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	int ret;
+
+	if (gpio->quirks & GPIO_REGMAP_QUIRK_SET_DIRECTION_FIRST) {
+		ret = gpio_regmap_set_direction(chip, offset, true);
+		gpio_regmap_set(chip, offset, value);
+	} else {
+		gpio_regmap_set(chip, offset, value);
+		ret = gpio_regmap_set_direction(chip, offset, true);
+	}
 
-	return gpio_regmap_set_direction(chip, offset, true);
+	return ret;
 }
 
 void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data)
@@ -227,6 +237,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	gpio->parent = config->parent;
 	gpio->regmap = config->regmap;
+	gpio->quirks = config->quirks;
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	gpio->reg_stride = config->reg_stride;
 	gpio->reg_mask_xlate = config->reg_mask_xlate;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 334dd928042b..cb609489903e 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -12,6 +12,17 @@ struct regmap;
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
 
+enum gpio_regmap_quirk {
+	/*
+	 * For hardware where the pin output value cannot be set while the pin
+	 * is configured as an input. Resolve by setting the direction to
+	 * output first, and the new value second. Because the previous output
+	 * value is used immediately after the direction change, this may result
+	 * in glitches.
+	 */
+	GPIO_REGMAP_QUIRK_SET_DIRECTION_FIRST = BIT(0),
+};
+
 /**
  * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
  * @parent:		The parent device
@@ -31,6 +42,7 @@ struct regmap;
  * @reg_stride:		(Optional) May be set if the registers (of the
  *			same type, dat, set, etc) are not consecutive.
  * @ngpio_per_reg:	Number of GPIOs per register
+ * @quirks:		Flags indicating GPIO chip hardware issues
  * @irq_domain:		(Optional) IRQ domain if the controller is
  *			interrupt-capable
  * @reg_mask_xlate:     (Optional) Translates base address and GPIO
@@ -73,6 +85,7 @@ struct gpio_regmap_config {
 	unsigned int reg_dir_out_base;
 	int reg_stride;
 	int ngpio_per_reg;
+	unsigned int quirks;
 	struct irq_domain *irq_domain;
 
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
-- 
2.31.1

