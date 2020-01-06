Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28A96131C54
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgAFX1h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:27:37 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39998 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbgAFX1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1578353247; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lHG33tJ7sLpduVkEMtT18ROEVw3KifulzGi3hCLfby8=;
        b=DAlkFtyBn/r+JO6Vzp667I85u9NUkTCVb9jFa/JxG9c/hZ683IkG6ngAhXLKHLEeCMYTpt
        /G1fvyvq1RizkLpwlXNZuOZNsfTFCTA7Dpyrry3g0GSLMa2m/oGCbkshPVZYg5a8og8Gdz
        H4Brj1cyv26lj2ZHl0tg70OKBcJatNs=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/5] pinctrl: ingenic: Put ingenic_chip_info pointer in match data
Date:   Tue,  7 Jan 2020 00:27:08 +0100
Message-Id: <20200106232711.559727-3-paul@crapouillou.net>
In-Reply-To: <20200106232711.559727-1-paul@crapouillou.net>
References: <20200106232711.559727-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of passing a numeric ID as match data, and retrieve a pointer to
the ingenic_chip_info structure in an ugly succession of if/else in the
probe function, get the pointer to the ingenic_chip_info structure
directly from the match data, and store the numeric ID inside the
ingenic_chip_info structure.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 102 +++++++++++++-----------------
 1 file changed, 45 insertions(+), 57 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 10a94f2f8658..7a1d6a720b78 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -73,6 +73,7 @@ enum jz_version {
 struct ingenic_chip_info {
 	unsigned int num_chips;
 	unsigned int reg_offset;
+	enum jz_version version;
 
 	const struct group_desc *groups;
 	unsigned int num_groups;
@@ -88,7 +89,6 @@ struct ingenic_pinctrl {
 	struct regmap *map;
 	struct pinctrl_dev *pctl;
 	struct pinctrl_pin_desc *pdesc;
-	enum jz_version version;
 
 	const struct ingenic_chip_info *info;
 };
@@ -226,6 +226,7 @@ static const struct function_desc jz4740_functions[] = {
 static const struct ingenic_chip_info jz4740_chip_info = {
 	.num_chips = 4,
 	.reg_offset = 0x100,
+	.version = ID_JZ4740,
 	.groups = jz4740_groups,
 	.num_groups = ARRAY_SIZE(jz4740_groups),
 	.functions = jz4740_functions,
@@ -350,6 +351,7 @@ static const struct function_desc jz4725b_functions[] = {
 static const struct ingenic_chip_info jz4725b_chip_info = {
 	.num_chips = 4,
 	.reg_offset = 0x100,
+	.version = ID_JZ4725B,
 	.groups = jz4725b_groups,
 	.num_groups = ARRAY_SIZE(jz4725b_groups),
 	.functions = jz4725b_functions,
@@ -604,6 +606,7 @@ static const struct function_desc jz4760_functions[] = {
 static const struct ingenic_chip_info jz4760_chip_info = {
 	.num_chips = 6,
 	.reg_offset = 0x100,
+	.version = ID_JZ4760,
 	.groups = jz4760_groups,
 	.num_groups = ARRAY_SIZE(jz4760_groups),
 	.functions = jz4760_functions,
@@ -615,6 +618,7 @@ static const struct ingenic_chip_info jz4760_chip_info = {
 static const struct ingenic_chip_info jz4760b_chip_info = {
 	.num_chips = 6,
 	.reg_offset = 0x100,
+	.version = ID_JZ4760B,
 	.groups = jz4760_groups,
 	.num_groups = ARRAY_SIZE(jz4760_groups),
 	.functions = jz4760_functions,
@@ -894,6 +898,7 @@ static const struct function_desc jz4770_functions[] = {
 static const struct ingenic_chip_info jz4770_chip_info = {
 	.num_chips = 6,
 	.reg_offset = 0x100,
+	.version = ID_JZ4770,
 	.groups = jz4770_groups,
 	.num_groups = ARRAY_SIZE(jz4770_groups),
 	.functions = jz4770_functions,
@@ -1028,6 +1033,7 @@ static const struct function_desc jz4780_functions[] = {
 static const struct ingenic_chip_info jz4780_chip_info = {
 	.num_chips = 6,
 	.reg_offset = 0x100,
+	.version = ID_JZ4780,
 	.groups = jz4780_groups,
 	.num_groups = ARRAY_SIZE(jz4780_groups),
 	.functions = jz4780_functions,
@@ -1285,6 +1291,7 @@ static const struct function_desc x1000_functions[] = {
 static const struct ingenic_chip_info x1000_chip_info = {
 	.num_chips = 4,
 	.reg_offset = 0x100,
+	.version = ID_X1000,
 	.groups = x1000_groups,
 	.num_groups = ARRAY_SIZE(x1000_groups),
 	.functions = x1000_functions,
@@ -1296,6 +1303,7 @@ static const struct ingenic_chip_info x1000_chip_info = {
 static const struct ingenic_chip_info x1000e_chip_info = {
 	.num_chips = 4,
 	.reg_offset = 0x100,
+	.version = ID_X1000E,
 	.groups = x1000_groups,
 	.num_groups = ARRAY_SIZE(x1000_groups),
 	.functions = x1000_functions,
@@ -1409,6 +1417,7 @@ static const struct function_desc x1500_functions[] = {
 static const struct ingenic_chip_info x1500_chip_info = {
 	.num_chips = 4,
 	.reg_offset = 0x100,
+	.version = ID_X1500,
 	.groups = x1500_groups,
 	.num_groups = ARRAY_SIZE(x1500_groups),
 	.functions = x1500_functions,
@@ -1624,6 +1633,7 @@ static const struct function_desc x1830_functions[] = {
 static const struct ingenic_chip_info x1830_chip_info = {
 	.num_chips = 4,
 	.reg_offset = 0x1000,
+	.version = ID_X1830,
 	.groups = x1830_groups,
 	.num_groups = ARRAY_SIZE(x1830_groups),
 	.functions = x1830_functions,
@@ -1682,7 +1692,7 @@ static inline bool ingenic_gpio_get_value(struct ingenic_gpio_chip *jzgc,
 static void ingenic_gpio_set_value(struct ingenic_gpio_chip *jzgc,
 				   u8 offset, int value)
 {
-	if (jzgc->jzpc->version >= ID_JZ4760)
+	if (jzgc->jzpc->info->version >= ID_JZ4760)
 		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_PAT0, offset, !!value);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, offset, !!value);
@@ -1693,7 +1703,7 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 {
 	u8 reg1, reg2;
 
-	if (jzgc->jzpc->version >= ID_JZ4760) {
+	if (jzgc->jzpc->info->version >= ID_JZ4760) {
 		reg1 = JZ4760_GPIO_PAT1;
 		reg2 = JZ4760_GPIO_PAT0;
 	} else {
@@ -1703,7 +1713,7 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		if (jzgc->jzpc->version >= ID_X1000) {
+		if (jzgc->jzpc->info->version >= ID_X1000) {
 			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, true);
 			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, true);
 			ingenic_gpio_shadow_set_bit_load(jzgc);
@@ -1713,7 +1723,7 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		}
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		if (jzgc->jzpc->version >= ID_X1000) {
+		if (jzgc->jzpc->info->version >= ID_X1000) {
 			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, false);
 			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, true);
 			ingenic_gpio_shadow_set_bit_load(jzgc);
@@ -1723,7 +1733,7 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		}
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		if (jzgc->jzpc->version >= ID_X1000) {
+		if (jzgc->jzpc->info->version >= ID_X1000) {
 			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, true);
 			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, false);
 			ingenic_gpio_shadow_set_bit_load(jzgc);
@@ -1734,7 +1744,7 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 	default:
-		if (jzgc->jzpc->version >= ID_X1000) {
+		if (jzgc->jzpc->info->version >= ID_X1000) {
 			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, false);
 			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, false);
 			ingenic_gpio_shadow_set_bit_load(jzgc);
@@ -1768,7 +1778,7 @@ static void ingenic_gpio_irq_enable(struct irq_data *irqd)
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
 	int irq = irqd->hwirq;
 
-	if (jzgc->jzpc->version >= ID_JZ4760)
+	if (jzgc->jzpc->info->version >= ID_JZ4760)
 		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_INT, irq, true);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, true);
@@ -1784,7 +1794,7 @@ static void ingenic_gpio_irq_disable(struct irq_data *irqd)
 
 	ingenic_gpio_irq_mask(irqd);
 
-	if (jzgc->jzpc->version >= ID_JZ4760)
+	if (jzgc->jzpc->info->version >= ID_JZ4760)
 		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_INT, irq, false);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, false);
@@ -1809,7 +1819,7 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 			irq_set_type(jzgc, irq, IRQ_TYPE_EDGE_RISING);
 	}
 
-	if (jzgc->jzpc->version >= ID_JZ4760)
+	if (jzgc->jzpc->info->version >= ID_JZ4760)
 		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_FLAG, irq, false);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
@@ -1866,7 +1876,7 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(irq_chip, desc);
 
-	if (jzgc->jzpc->version >= ID_JZ4760)
+	if (jzgc->jzpc->info->version >= ID_JZ4760)
 		flag = ingenic_gpio_read_reg(jzgc, JZ4760_GPIO_FLAG);
 	else
 		flag = ingenic_gpio_read_reg(jzgc, JZ4740_GPIO_FLAG);
@@ -1948,7 +1958,7 @@ static int ingenic_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	struct ingenic_pinctrl *jzpc = jzgc->jzpc;
 	unsigned int pin = gc->base + offset;
 
-	if (jzpc->version >= ID_JZ4760)
+	if (jzpc->info->version >= ID_JZ4760)
 		return ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PAT1);
 
 	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_SELECT))
@@ -1974,13 +1984,13 @@ static int ingenic_pinmux_set_pin_fn(struct ingenic_pinctrl *jzpc,
 	dev_dbg(jzpc->dev, "set pin P%c%u to function %u\n",
 			'A' + offt, idx, func);
 
-	if (jzpc->version >= ID_X1000) {
+	if (jzpc->info->version >= ID_X1000) {
 		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
 		ingenic_shadow_config_pin(jzpc, pin, GPIO_MSK, false);
 		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, func & 0x2);
 		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, func & 0x1);
 		ingenic_shadow_config_pin_load(jzpc, pin);
-	} else if (jzpc->version >= ID_JZ4760) {
+	} else if (jzpc->info->version >= ID_JZ4760) {
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, false);
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, func & 0x2);
@@ -2033,12 +2043,12 @@ static int ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "set pin P%c%u to %sput\n",
 			'A' + offt, idx, input ? "in" : "out");
 
-	if (jzpc->version >= ID_X1000) {
+	if (jzpc->info->version >= ID_X1000) {
 		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
 		ingenic_shadow_config_pin(jzpc, pin, GPIO_MSK, true);
 		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, input);
 		ingenic_shadow_config_pin_load(jzpc, pin);
-	} else if (jzpc->version >= ID_JZ4760) {
+	} else if (jzpc->info->version >= ID_JZ4760) {
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, true);
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, input);
@@ -2068,7 +2078,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 	bool pull;
 
-	if (jzpc->version >= ID_JZ4760)
+	if (jzpc->info->version >= ID_JZ4760)
 		pull = !ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PEN);
 	else
 		pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
@@ -2100,7 +2110,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, unsigned int bias)
 {
-	if (jzpc->version >= ID_X1830) {
+	if (jzpc->info->version >= ID_X1830) {
 		unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 		unsigned int half = PINS_PER_GPIO_CHIP / 2;
 		unsigned int idxh = pin % half * 2;
@@ -2118,7 +2128,7 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 					REG_SET(X1830_GPIO_PEH), bias << idxh);
 		}
 
-	} else if (jzpc->version >= ID_JZ4760) {
+	} else if (jzpc->info->version >= ID_JZ4760) {
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !bias);
 	} else {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !bias);
@@ -2128,7 +2138,7 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 static void ingenic_set_output_level(struct ingenic_pinctrl *jzpc,
 				     unsigned int pin, bool high)
 {
-	if (jzpc->version >= ID_JZ4760)
+	if (jzpc->info->version >= ID_JZ4760)
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, high);
 	else
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DATA, high);
@@ -2258,20 +2268,6 @@ static const struct regmap_config ingenic_pinctrl_regmap_config = {
 	.reg_stride = 4,
 };
 
-static const struct of_device_id ingenic_pinctrl_of_match[] = {
-	{ .compatible = "ingenic,jz4740-pinctrl", .data = (void *) ID_JZ4740 },
-	{ .compatible = "ingenic,jz4725b-pinctrl", .data = (void *)ID_JZ4725B },
-	{ .compatible = "ingenic,jz4760-pinctrl", .data = (void *) ID_JZ4760 },
-	{ .compatible = "ingenic,jz4760b-pinctrl", .data = (void *) ID_JZ4760B },
-	{ .compatible = "ingenic,jz4770-pinctrl", .data = (void *) ID_JZ4770 },
-	{ .compatible = "ingenic,jz4780-pinctrl", .data = (void *) ID_JZ4780 },
-	{ .compatible = "ingenic,x1000-pinctrl", .data = (void *) ID_X1000 },
-	{ .compatible = "ingenic,x1000e-pinctrl", .data = (void *) ID_X1000E },
-	{ .compatible = "ingenic,x1500-pinctrl", .data = (void *) ID_X1500 },
-	{ .compatible = "ingenic,x1830-pinctrl", .data = (void *) ID_X1830 },
-	{},
-};
-
 static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4740-gpio", },
 	{ .compatible = "ingenic,jz4760-gpio", },
@@ -2391,29 +2387,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	jzpc->dev = dev;
-	jzpc->version = (enum jz_version)of_device_get_match_data(dev);
-
-	if (jzpc->version >= ID_X1830)
-		chip_info = &x1830_chip_info;
-	else if (jzpc->version >= ID_X1500)
-		chip_info = &x1500_chip_info;
-	else if (jzpc->version >= ID_X1000E)
-		chip_info = &x1000e_chip_info;
-	else if (jzpc->version >= ID_X1000)
-		chip_info = &x1000_chip_info;
-	else if (jzpc->version >= ID_JZ4780)
-		chip_info = &jz4780_chip_info;
-	else if (jzpc->version >= ID_JZ4770)
-		chip_info = &jz4770_chip_info;
-	else if (jzpc->version >= ID_JZ4760B)
-		chip_info = &jz4760b_chip_info;
-	else if (jzpc->version >= ID_JZ4760)
-		chip_info = &jz4760_chip_info;
-	else if (jzpc->version >= ID_JZ4725B)
-		chip_info = &jz4725b_chip_info;
-	else
-		chip_info = &jz4740_chip_info;
-	jzpc->info = chip_info;
+	jzpc->info = chip_info = of_device_get_match_data(dev);
 
 	pctl_desc = devm_kzalloc(&pdev->dev, sizeof(*pctl_desc), GFP_KERNEL);
 	if (!pctl_desc)
@@ -2482,6 +2456,20 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ingenic_pinctrl_of_match[] = {
+	{ .compatible = "ingenic,jz4740-pinctrl", .data = &jz4740_chip_info },
+	{ .compatible = "ingenic,jz4725b-pinctrl", .data = &jz4725b_chip_info },
+	{ .compatible = "ingenic,jz4760-pinctrl", .data = &jz4760_chip_info },
+	{ .compatible = "ingenic,jz4760b-pinctrl", .data = &jz4760b_chip_info },
+	{ .compatible = "ingenic,jz4770-pinctrl", .data = &jz4770_chip_info },
+	{ .compatible = "ingenic,jz4780-pinctrl", .data = &jz4780_chip_info },
+	{ .compatible = "ingenic,x1000-pinctrl", .data = &x1000_chip_info },
+	{ .compatible = "ingenic,x1000e-pinctrl", .data = &x1000e_chip_info },
+	{ .compatible = "ingenic,x1500-pinctrl", .data = &x1500_chip_info },
+	{ .compatible = "ingenic,x1830-pinctrl", .data = &x1830_chip_info },
+	{},
+};
+
 static struct platform_driver ingenic_pinctrl_driver = {
 	.driver = {
 		.name = "pinctrl-ingenic",
-- 
2.24.1

