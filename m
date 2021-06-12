Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977493A50D3
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 23:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhFLVPk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 17:15:40 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:48054 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhFLVPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 17:15:38 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a4dd:c59:8cbd:ee0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 4A2EE20C9CE;
        Sat, 12 Jun 2021 23:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1623532415;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=317W/muonwzc8HyyIWPeaiAscRYe6DIw3INbtrhWtnM=;
        b=RuCEaKtiUTzxYp/z23JXa71RRL9w5iN+5OQaQKxpJAXMoOgumORYPsBRakUWfcZiWSaAlY
        s7kxGe0yVVIvzgB13qclbFAPPeMnMucXX5H9bPVrxUNLF2oe28nt3lS6Wsm5FM4REYhNye
        eMHDRzgOKW54n6/YmKyKNhtWnX4v7pY81GtZBzFeChxxpZyfLMA1gnI5TBrmPeUrRj5n1u
        fWmpLfPornw8GBY91LkkziaFgwLQRadl18URvbew+T5ojUMK4Y5Fe/Phw+KIhSPazgE81n
        pKVJ55PKXBM3W9oRoH86Mj4+luMW3Fp09S5HrW4itOwTQweVsWq48xWuG1THwQ==
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
Subject: [PATCH v5 2/8] gpio: regmap: Add quirk for aliased data registers
Date:   Sat, 12 Jun 2021 23:12:32 +0200
Message-Id: <5d8e5e8a29ecf39da48beb94c42003a5c686ec4e.1623532208.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623532208.git.sander@svanheule.net>
References: <cover.1623532208.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some chips have the read-only input and write-only output data registers
aliased to the same offset. As a result it is not possible to perform
read-modify-writes on the output values, when a line is still configured
as input.

Add a quirk for aliased data registers, and document how the regmap
should be set up for correct operation.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/gpio/gpio-regmap.c  |  7 ++++++-
 include/linux/gpio/regmap.h | 13 +++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..3a3d0d9a945c 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -15,6 +15,7 @@ struct gpio_regmap {
 	struct device *parent;
 	struct regmap *regmap;
 	struct gpio_chip gpio_chip;
+	unsigned int quirks;
 
 	int reg_stride;
 	int ngpio_per_reg;
@@ -68,7 +69,10 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	ret = regmap_read(gpio->regmap, reg, &val);
+	if (gpio->quirks & GPIO_REGMAP_QUIRK_ALIASED_DATA)
+		ret = regmap_read_bypassed(gpio->regmap, reg, &val);
+	else
+		ret = regmap_read(gpio->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -227,6 +231,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	gpio->parent = config->parent;
 	gpio->regmap = config->regmap;
+	gpio->quirks = config->quirks;
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	gpio->reg_stride = config->reg_stride;
 	gpio->reg_mask_xlate = config->reg_mask_xlate;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 334dd928042b..b0751a10fa4a 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -12,6 +12,17 @@ struct regmap;
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
 
+enum gpio_regmap_quirk {
+	/*
+	 * For hardware where the (read-only) input and (write-only) output
+	 * registers are aliased to the same offset. In this case the register
+	 * must not be marked as volatile and a regcache must be used, to cache
+	 * the write-only output values. Register reads for the input values
+	 * will be performed by bypassing the cache.
+	 */
+	GPIO_REGMAP_QUIRK_ALIASED_DATA = BIT(0),
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

