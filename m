Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4032570A89
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 21:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbiGKTRo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 15:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiGKTRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 15:17:43 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5FA61125;
        Mon, 11 Jul 2022 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657567062; x=1689103062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=45EQw3qU6tDaLAI+Utl3TBU1Hd4MTG76KWkOWfSe10Q=;
  b=XzmJk5xchGq+gWPDuAebpJ71QjDCizUSCFhNb0pPTTbAJ7cdfUe9OaHj
   iei9HprizycLLxO4dm9+jxYANjzkP0DYesFgK0QyX6fgAYp/UdgKcq0d3
   b0gwUvC19ufqIImR3B+4Qf+zzuhNdV7hzLVOVnmi2y1egoo+yO+semkjZ
   mhMbOJbPO5YC/ISfxjdk4rXH6Wn8QjtFJhUL0dk/7WTEeiXCRhEjS0oO9
   j/6xLqDaCJWKe1xDyp3nHcxycqstJYro11GFa4D9CRSCo2deGgsKJtksp
   higv5Hi5jE1zfQfpKWPJWStFxd/GZzR6ZxuS53sUs4D1SXBdVEvd+sDOb
   g==;
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="171650157"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jul 2022 12:17:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 12:17:41 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Jul 2022 12:17:38 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linus.walleij@linaro.org>, <kavyasree.kotagiri@microchip.com>,
        <alexandre.belloni@bootlin.com>, <colin.foster@in-advantage.com>,
        <UNGLinuxDriver@microchip.com>, <maxime.chevallier@bootlin.com>,
        <michael@walle.cc>, <andy.shevchenko@gmail.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v3 1/2] pinctrl: ocelot: Fix pincfg for lan966x
Date:   Mon, 11 Jul 2022 21:21:12 +0200
Message-ID: <20220711192113.3522664-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220711192113.3522664-1-horatiu.vultur@microchip.com>
References: <20220711192113.3522664-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The blamed commit introduce support for lan966x which use the same
pinconf_ops as sparx5. The problem is that pinconf_ops is specific to
sparx5. More precisely the offset of the bits in the pincfg register are
different and also lan966x doesn't have support for
PIN_CONFIG_INPUT_SCHMITT_ENABLE.

Fix this by making pinconf_ops more generic such that it can be also
used by lan966x. This is done by introducing 'ocelot_pincfg_data' which
contains the offset and what is supported for each SOC.

Fixes: 531d6ab36571 ("pinctrl: ocelot: Extend support for lan966x")
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 196 ++++++++++++++++++++-----------
 1 file changed, 125 insertions(+), 71 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 5f4a8c5c6650..4edb36cfa161 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -29,19 +29,12 @@
 #define ocelot_clrsetbits(addr, clear, set) \
 	writel((readl(addr) & ~(clear)) | (set), (addr))
 
-/* PINCONFIG bits (sparx5 only) */
 enum {
 	PINCONF_BIAS,
 	PINCONF_SCHMITT,
 	PINCONF_DRIVE_STRENGTH,
 };
 
-#define BIAS_PD_BIT BIT(4)
-#define BIAS_PU_BIT BIT(3)
-#define BIAS_BITS   (BIAS_PD_BIT|BIAS_PU_BIT)
-#define SCHMITT_BIT BIT(2)
-#define DRIVE_BITS  GENMASK(1, 0)
-
 /* GPIO standard registers */
 #define OCELOT_GPIO_OUT_SET	0x0
 #define OCELOT_GPIO_OUT_CLR	0x4
@@ -321,6 +314,14 @@ struct ocelot_pin_caps {
 	unsigned char a_functions[OCELOT_FUNC_PER_PIN];	/* Additional functions */
 };
 
+struct ocelot_pincfg_data {
+	u8 pd_bit;
+	u8 pu_bit;
+	u8 drive_bits;
+	u8 schmitt_bit;
+	bool has_schmitt;
+};
+
 struct ocelot_pinctrl {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
@@ -328,10 +329,16 @@ struct ocelot_pinctrl {
 	struct regmap *map;
 	struct regmap *pincfg;
 	struct pinctrl_desc *desc;
+	struct ocelot_pincfg_data *pincfg_data;
 	struct ocelot_pmx_func func[FUNC_MAX];
 	u8 stride;
 };
 
+struct ocelot_match_data {
+	struct pinctrl_desc desc;
+	struct ocelot_pincfg_data pincfg_data;
+};
+
 #define LUTON_P(p, f0, f1)						\
 static struct ocelot_pin_caps luton_pin_##p = {				\
 	.pin = p,							\
@@ -1334,15 +1341,17 @@ static int ocelot_hw_get_value(struct ocelot_pinctrl *info,
 		ret = 0;
 		switch (reg) {
 		case PINCONF_BIAS:
-			*val = regcfg & BIAS_BITS;
+			*val = regcfg &
+				(info->pincfg_data->pd_bit |
+				 info->pincfg_data->pu_bit);
 			break;
 
 		case PINCONF_SCHMITT:
-			*val = regcfg & SCHMITT_BIT;
+			*val = regcfg & info->pincfg_data->schmitt_bit;
 			break;
 
 		case PINCONF_DRIVE_STRENGTH:
-			*val = regcfg & DRIVE_BITS;
+			*val = regcfg & info->pincfg_data->drive_bits;
 			break;
 
 		default:
@@ -1383,19 +1392,23 @@ static int ocelot_hw_set_value(struct ocelot_pinctrl *info,
 		ret = 0;
 		switch (reg) {
 		case PINCONF_BIAS:
-			ret = ocelot_pincfg_clrsetbits(info, pin, BIAS_BITS,
+			ret = ocelot_pincfg_clrsetbits(info, pin,
+						       info->pincfg_data->pd_bit |
+						       info->pincfg_data->pu_bit,
 						       val);
 			break;
 
 		case PINCONF_SCHMITT:
-			ret = ocelot_pincfg_clrsetbits(info, pin, SCHMITT_BIT,
+			ret = ocelot_pincfg_clrsetbits(info, pin,
+						       info->pincfg_data->schmitt_bit,
 						       val);
 			break;
 
 		case PINCONF_DRIVE_STRENGTH:
 			if (val <= 3)
 				ret = ocelot_pincfg_clrsetbits(info, pin,
-							       DRIVE_BITS, val);
+							       info->pincfg_data->drive_bits,
+							       val);
 			else
 				ret = -EINVAL;
 			break;
@@ -1425,17 +1438,20 @@ static int ocelot_pinconf_get(struct pinctrl_dev *pctldev,
 		if (param == PIN_CONFIG_BIAS_DISABLE)
 			val = (val == 0);
 		else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
-			val = (val & BIAS_PD_BIT ? true : false);
+			val = !!(val & info->pincfg_data->pd_bit);
 		else    /* PIN_CONFIG_BIAS_PULL_UP */
-			val = (val & BIAS_PU_BIT ? true : false);
+			val = !!(val & info->pincfg_data->pu_bit);
 		break;
 
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (!info->pincfg_data->has_schmitt)
+			return -EOPNOTSUPP;
+
 		err = ocelot_hw_get_value(info, pin, PINCONF_SCHMITT, &val);
 		if (err)
 			return err;
 
-		val = (val & SCHMITT_BIT ? true : false);
+		val = !!(val & info->pincfg_data->schmitt_bit);
 		break;
 
 	case PIN_CONFIG_DRIVE_STRENGTH:
@@ -1491,8 +1507,8 @@ static int ocelot_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_BIAS_PULL_UP:
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			arg = (param == PIN_CONFIG_BIAS_DISABLE) ? 0 :
-			(param == PIN_CONFIG_BIAS_PULL_UP) ? BIAS_PU_BIT :
-			BIAS_PD_BIT;
+			(param == PIN_CONFIG_BIAS_PULL_UP) ? info->pincfg_data->pu_bit :
+			info->pincfg_data->pd_bit;
 
 			err = ocelot_hw_set_value(info, pin, PINCONF_BIAS, arg);
 			if (err)
@@ -1501,7 +1517,10 @@ static int ocelot_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 
 		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-			arg = arg ? SCHMITT_BIT : 0;
+			if (!info->pincfg_data->has_schmitt)
+				return -EOPNOTSUPP;
+
+			arg = arg ? info->pincfg_data->schmitt_bit : 0;
 			err = ocelot_hw_set_value(info, pin, PINCONF_SCHMITT,
 						  arg);
 			if (err)
@@ -1562,69 +1581,95 @@ static const struct pinctrl_ops ocelot_pctl_ops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc luton_desc = {
-	.name = "luton-pinctrl",
-	.pins = luton_pins,
-	.npins = ARRAY_SIZE(luton_pins),
-	.pctlops = &ocelot_pctl_ops,
-	.pmxops = &ocelot_pmx_ops,
-	.owner = THIS_MODULE,
+static struct ocelot_match_data luton_desc = {
+	.desc = {
+		.name = "luton-pinctrl",
+		.pins = luton_pins,
+		.npins = ARRAY_SIZE(luton_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &ocelot_pmx_ops,
+		.owner = THIS_MODULE,
+	},
 };
 
-static struct pinctrl_desc serval_desc = {
-	.name = "serval-pinctrl",
-	.pins = serval_pins,
-	.npins = ARRAY_SIZE(serval_pins),
-	.pctlops = &ocelot_pctl_ops,
-	.pmxops = &ocelot_pmx_ops,
-	.owner = THIS_MODULE,
+static struct ocelot_match_data serval_desc = {
+	.desc = {
+		.name = "serval-pinctrl",
+		.pins = serval_pins,
+		.npins = ARRAY_SIZE(serval_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &ocelot_pmx_ops,
+		.owner = THIS_MODULE,
+	},
 };
 
-static struct pinctrl_desc ocelot_desc = {
-	.name = "ocelot-pinctrl",
-	.pins = ocelot_pins,
-	.npins = ARRAY_SIZE(ocelot_pins),
-	.pctlops = &ocelot_pctl_ops,
-	.pmxops = &ocelot_pmx_ops,
-	.owner = THIS_MODULE,
+static struct ocelot_match_data ocelot_desc = {
+	.desc = {
+		.name = "ocelot-pinctrl",
+		.pins = ocelot_pins,
+		.npins = ARRAY_SIZE(ocelot_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &ocelot_pmx_ops,
+		.owner = THIS_MODULE,
+	},
 };
 
-static struct pinctrl_desc jaguar2_desc = {
-	.name = "jaguar2-pinctrl",
-	.pins = jaguar2_pins,
-	.npins = ARRAY_SIZE(jaguar2_pins),
-	.pctlops = &ocelot_pctl_ops,
-	.pmxops = &ocelot_pmx_ops,
-	.owner = THIS_MODULE,
+static struct ocelot_match_data jaguar2_desc = {
+	.desc = {
+		.name = "jaguar2-pinctrl",
+		.pins = jaguar2_pins,
+		.npins = ARRAY_SIZE(jaguar2_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &ocelot_pmx_ops,
+		.owner = THIS_MODULE,
+	},
 };
 
-static struct pinctrl_desc servalt_desc = {
-	.name = "servalt-pinctrl",
-	.pins = servalt_pins,
-	.npins = ARRAY_SIZE(servalt_pins),
-	.pctlops = &ocelot_pctl_ops,
-	.pmxops = &ocelot_pmx_ops,
-	.owner = THIS_MODULE,
+static struct ocelot_match_data servalt_desc = {
+	.desc = {
+		.name = "servalt-pinctrl",
+		.pins = servalt_pins,
+		.npins = ARRAY_SIZE(servalt_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &ocelot_pmx_ops,
+		.owner = THIS_MODULE,
+	},
 };
 
-static struct pinctrl_desc sparx5_desc = {
-	.name = "sparx5-pinctrl",
-	.pins = sparx5_pins,
-	.npins = ARRAY_SIZE(sparx5_pins),
-	.pctlops = &ocelot_pctl_ops,
-	.pmxops = &ocelot_pmx_ops,
-	.confops = &ocelot_confops,
-	.owner = THIS_MODULE,
+static struct ocelot_match_data sparx5_desc = {
+	.desc = {
+		.name = "sparx5-pinctrl",
+		.pins = sparx5_pins,
+		.npins = ARRAY_SIZE(sparx5_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &ocelot_pmx_ops,
+		.confops = &ocelot_confops,
+		.owner = THIS_MODULE,
+	},
+	.pincfg_data = {
+		.pd_bit = BIT(4),
+		.pu_bit = BIT(3),
+		.drive_bits = GENMASK(1, 0),
+		.has_schmitt = true,
+		.schmitt_bit = BIT(2),
+	},
 };
 
-static struct pinctrl_desc lan966x_desc = {
-	.name = "lan966x-pinctrl",
-	.pins = lan966x_pins,
-	.npins = ARRAY_SIZE(lan966x_pins),
-	.pctlops = &ocelot_pctl_ops,
-	.pmxops = &lan966x_pmx_ops,
-	.confops = &ocelot_confops,
-	.owner = THIS_MODULE,
+static struct ocelot_match_data lan966x_desc = {
+	.desc = {
+		.name = "lan966x-pinctrl",
+		.pins = lan966x_pins,
+		.npins = ARRAY_SIZE(lan966x_pins),
+		.pctlops = &ocelot_pctl_ops,
+		.pmxops = &lan966x_pmx_ops,
+		.confops = &ocelot_confops,
+		.owner = THIS_MODULE,
+	},
+	.pincfg_data = {
+		.pd_bit = BIT(3),
+		.pu_bit = BIT(2),
+		.drive_bits = GENMASK(1, 0),
+	},
 };
 
 static int ocelot_create_group_func_map(struct device *dev,
@@ -1913,6 +1958,7 @@ static struct regmap *ocelot_pinctrl_create_pincfg(struct platform_device *pdev)
 
 static int ocelot_pinctrl_probe(struct platform_device *pdev)
 {
+	const struct ocelot_match_data *data;
 	struct device *dev = &pdev->dev;
 	struct ocelot_pinctrl *info;
 	struct reset_control *reset;
@@ -1929,7 +1975,15 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	info->desc = (struct pinctrl_desc *)device_get_match_data(dev);
+	data = device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	info->desc = devm_kmemdup(dev, &data->desc,
+				  sizeof(struct pinctrl_desc), GFP_KERNEL);
+	info->pincfg_data = devm_kmemdup(dev, &data->pincfg_data,
+					 sizeof(struct ocelot_match_data),
+					 GFP_KERNEL);
 
 	reset = devm_reset_control_get_optional_shared(dev, "switch");
 	if (IS_ERR(reset))
-- 
2.33.0

