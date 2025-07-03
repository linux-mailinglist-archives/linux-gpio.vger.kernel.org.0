Return-Path: <linux-gpio+bounces-22745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8FAAF7F91
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DC577B182A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30472F271B;
	Thu,  3 Jul 2025 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pmpp0wrF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827172E8887;
	Thu,  3 Jul 2025 18:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566093; cv=none; b=iTjcadPq4uqkGSaT2WFVaQfvzFKZO4HChpOCZgtFYtgCC2ISFQK9ksQNOMR9xoN0Dim1ykiqwWLVJU0r9isFB2X2aZ03/f4MkUBckaqXdUDcnC9nt9HlTbU+tkByVXZjWTayh26CEKH7NQNTG5rLE9pbJOON1WZIILq+GZTGyRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566093; c=relaxed/simple;
	bh=YiqVQC3SEAez8UuppiBb1A/1oAVhrV1uDfIH1n4yS0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JbDs9dPievpyonODNTYxDu5HeKyju9bAngkmJFK8aquYXYHggiCTSY0RYowESWOJIi/JaeTkgR0jgg0zo9IENZ2zzFvTuigh2BJV5xC1kZJuJG0YRt01CeIkFiT+9NhwpCAig5BDWCtAHWIPZ3u1ErQEnRFQdJGkKZVAYaOUIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pmpp0wrF; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563I7qYW084143;
	Thu, 3 Jul 2025 13:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751566072;
	bh=ypas7tZObOqRmhztcSlepuuKBYdFBB7gJSb015XTayg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pmpp0wrF3Q5E14weLibWR8aIdvpDXEDiS4KQLDx5zMB+pEdRJ+rZG5NL/XkhabcA5
	 RNksPs+ZTDGZk/eOTLv2d1jVa+gvPC4JP5XfgndfomNWO6/L/QcIw3Z+XKIDDA7wSv
	 dF+aXutR/F5OY2FI7o5dSmzG2IF3cZvmL0ye5G5U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563I7qHO2065817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 13:07:52 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 13:07:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 13:07:52 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563I7pSe1546973;
	Thu, 3 Jul 2025 13:07:51 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <jcormier@criticallink.com>
Subject: [PATCH v6 2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
Date: Thu, 3 Jul 2025 13:07:51 -0500
Message-ID: <20250703180751.168755-3-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703180751.168755-1-s-ramamoorthy@ti.com>
References: <20250703180751.168755-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add support for the TI TPS65214 PMIC with the addition of an id_table,
separate TPS65214 template_chip, and device-specific _change_direction
functions.

- Use platform_get_device_id() to assign dev-specific information.
- Use different change_direction() functions since TPS65214's GPIO
  configuration bits are changeable during device operation through bit
  GPIO_CONFIG in GENERAL_CONFIG register.
- Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.

Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
Tested-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/gpio/gpio-tps65219.c | 95 +++++++++++++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 2355eec0cee6..f6a99402ae46 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * GPIO driver for TI TPS65215/TPS65219 PMICs
+ * GPIO driver for TI TPS65214/TPS65215/TPS65219 PMICs
  *
  * Copyright (C) 2022, 2025 Texas Instruments Incorporated - http://www.ti.com/
  */
@@ -13,10 +13,15 @@
 #include <linux/regmap.h>
 
 #define TPS65219_GPIO0_DIR_MASK		BIT(3)
+#define TPS65214_GPIO0_DIR_MASK		BIT(1)
 #define TPS6521X_GPIO0_OFFSET		2
 #define TPS6521X_GPIO0_IDX		0
 
 /*
+ * TPS65214 GPIO mapping
+ * Linux gpio offset 0 -> GPIO (pin16) -> bit_offset 2
+ * Linux gpio offset 1 -> GPO1 (pin9 ) -> bit_offset 0
+ *
  * TPS65215 & TPS65219 GPIO mapping
  * Linux gpio offset 0 -> GPIO (pin16) -> bit_offset 2
  * Linux gpio offset 1 -> GPO1 (pin8 ) -> bit_offset 0
@@ -24,10 +29,26 @@
  */
 
 struct tps65219_gpio {
+	int (*change_dir)(struct gpio_chip *gc, unsigned int offset, unsigned int dir);
 	struct gpio_chip gpio_chip;
 	struct tps65219 *tps;
 };
 
+static int tps65214_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
+	int ret, val;
+
+	if (offset != TPS6521X_GPIO0_IDX)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	ret = regmap_read(gpio->tps->regmap, TPS65219_REG_GENERAL_CONFIG, &val);
+	if (ret)
+		return ret;
+
+	return !(val & TPS65214_GPIO0_DIR_MASK);
+}
+
 static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
@@ -119,6 +140,34 @@ static int tps65219_gpio_change_direction(struct gpio_chip *gc, unsigned int off
 	return -ENOTSUPP;
 }
 
+static int tps65214_gpio_change_direction(struct gpio_chip *gc, unsigned int offset,
+					  unsigned int direction)
+{
+	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
+	struct device *dev = gpio->tps->dev;
+	int val, ret;
+
+	/* Verified if GPIO or GPO in parent function
+	 * Masked value: 0 = GPIO, 1 = VSEL
+	 */
+	ret = regmap_read(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG, &val);
+	if (ret)
+		return ret;
+
+	ret = !!(val & BIT(TPS65219_GPIO0_DIR_MASK));
+	if (ret)
+		dev_err(dev, "GPIO%d configured as VSEL, not GPIO\n", offset);
+
+	ret = regmap_update_bits(gpio->tps->regmap, TPS65219_REG_GENERAL_CONFIG,
+				 TPS65214_GPIO0_DIR_MASK, direction);
+	if (ret)
+		dev_err(dev,
+			"Fail to change direction to %u for GPIO%d.\n",
+			direction, offset);
+
+	return ret;
+}
+
 static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
@@ -132,11 +181,13 @@ static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned int offs
 	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_IN)
 		return 0;
 
-	return tps65219_gpio_change_direction(gc, offset, GPIO_LINE_DIRECTION_IN);
+	return gpio->change_dir(gc, offset, GPIO_LINE_DIRECTION_IN);
 }
 
 static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
 {
+	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
+
 	tps65219_gpio_set(gc, offset, value);
 	if (offset != TPS6521X_GPIO0_IDX)
 		return 0;
@@ -144,9 +195,22 @@ static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int off
 	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
 		return 0;
 
-	return tps65219_gpio_change_direction(gc, offset, GPIO_LINE_DIRECTION_OUT);
+	return gpio->change_dir(gc, offset, GPIO_LINE_DIRECTION_OUT);
 }
 
+static const struct gpio_chip tps65214_template_chip = {
+	.label			= "tps65214-gpio",
+	.owner			= THIS_MODULE,
+	.get_direction		= tps65214_gpio_get_direction,
+	.direction_input	= tps65219_gpio_direction_input,
+	.direction_output	= tps65219_gpio_direction_output,
+	.get			= tps65219_gpio_get,
+	.set_rv			= tps65219_gpio_set,
+	.base			= -1,
+	.ngpio			= 2,
+	.can_sleep		= true,
+};
+
 static const struct gpio_chip tps65219_template_chip = {
 	.label			= "tps65219-gpio",
 	.owner			= THIS_MODULE,
@@ -154,7 +218,7 @@ static const struct gpio_chip tps65219_template_chip = {
 	.direction_input	= tps65219_gpio_direction_input,
 	.direction_output	= tps65219_gpio_direction_output,
 	.get			= tps65219_gpio_get,
-	.set			= tps65219_gpio_set,
+	.set_rv			= tps65219_gpio_set,
 	.base			= -1,
 	.ngpio			= 3,
 	.can_sleep		= true,
@@ -162,6 +226,7 @@ static const struct gpio_chip tps65219_template_chip = {
 
 static int tps65219_gpio_probe(struct platform_device *pdev)
 {
+	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
 	struct tps65219_gpio *gpio;
 
@@ -169,22 +234,38 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
 	if (!gpio)
 		return -ENOMEM;
 
+	if (chip == TPS65214) {
+		gpio->gpio_chip = tps65214_template_chip;
+		gpio->change_dir = tps65214_gpio_change_direction;
+	} else if (chip == TPS65219) {
+		gpio->gpio_chip = tps65219_template_chip;
+		gpio->change_dir = tps65219_gpio_change_direction;
+	} else {
+		return -ENODATA;
+	}
+
 	gpio->tps = tps;
-	gpio->gpio_chip = tps65219_template_chip;
 	gpio->gpio_chip.parent = tps->dev;
 
 	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
 }
 
+static const struct platform_device_id tps6521x_gpio_id_table[] = {
+	{ "tps65214-gpio", TPS65214 },
+	{ "tps65219-gpio", TPS65219 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
+
 static struct platform_driver tps65219_gpio_driver = {
 	.driver = {
 		.name = "tps65219-gpio",
 	},
 	.probe = tps65219_gpio_probe,
+	.id_table = tps6521x_gpio_id_table,
 };
 module_platform_driver(tps65219_gpio_driver);
 
-MODULE_ALIAS("platform:tps65219-gpio");
 MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
-MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
+MODULE_DESCRIPTION("TPS65214/TPS65215/TPS65219 GPIO driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


