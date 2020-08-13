Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32498243543
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgHMHtf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:49:35 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39179 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgHMHta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:49:30 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D7n9fL5028965, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D7n9fL5028965
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 13 Aug 2020 15:49:09 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:08 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 13 Aug 2020 15:49:08 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/9] pinctrl: realtek: rtd1295: Add pin configs.
Date:   Thu, 13 Aug 2020 15:49:01 +0800
Message-ID: <20200813074908.889-3-tychang@realtek.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813074908.889-1-tychang@realtek.com>
References: <20200813074908.889-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pin configs for Realtek DHC SoC RTD1295 pinctrl driver.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 drivers/pinctrl/pinctrl-rtd119x.c | 257 +++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rtd1295.h | 194 ++++++++++++++++++++++
 2 files changed, 447 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rtd119x.c b/drivers/pinctrl/pinctrl-rtd119x.c
index 60bf8c283a7a..e8c818c38b83 100644
--- a/drivers/pinctrl/pinctrl-rtd119x.c
+++ b/drivers/pinctrl/pinctrl-rtd119x.c
@@ -36,6 +36,26 @@ struct rtd119x_pin_mux_desc {
 	u32 mux_value;
 };
 
+struct rtd119x_pin_sconfig_desc {
+	const char *name;
+	unsigned int reg_offset;
+	unsigned int ndrive_offset;
+	unsigned int ndrive_maskbits;
+	unsigned int pdrive_offset;
+	unsigned int pdrive_maskbits;
+};
+
+struct rtd119x_pin_config_desc {
+	const char *name;
+	unsigned int reg_offset;
+	unsigned int base_bit;
+	unsigned int pud_en_offset;
+	unsigned int pud_sel_offset;
+	unsigned int curr_offset;
+	unsigned int smt_offset;
+	unsigned int curr_type;
+};
+
 struct rtd119x_pin_desc {
 	const char *name;
 	unsigned int mux_offset;
@@ -43,6 +63,31 @@ struct rtd119x_pin_desc {
 	const struct rtd119x_pin_mux_desc *functions;
 };
 
+#define RTK_PIN_SCONFIG(_name, _reg_off, _n_offset, _n_mask, _p_offset, _p_mask) \
+		{ \
+			.name = # _name, \
+			.reg_offset = _reg_off, \
+			.ndrive_offset = _n_offset, \
+			.ndrive_maskbits = _n_mask, \
+			.pdrive_offset = _p_offset, \
+			.pdrive_maskbits = _p_mask, \
+		}
+
+
+#define RTK_PIN_CONFIG(_name, _reg_off, _base_bit, _pud_en_off, \
+		_pud_sel_off, _curr_off, _smt_off, _curr_type) \
+	{ \
+		.name = # _name, \
+		.reg_offset = _reg_off, \
+		.base_bit = _base_bit, \
+		.pud_en_offset = _pud_en_off, \
+		.pud_sel_offset = _pud_sel_off, \
+		.curr_offset = _curr_off, \
+		.smt_offset = _smt_off, \
+		.curr_type = _curr_type, \
+	}
+
+
 #define RTK_PIN_MUX(_name, _mux_off, _mux_mask, ...) \
 	{ \
 		.name = # _name, \
@@ -68,8 +113,17 @@ struct rtd119x_pinctrl_desc {
 	unsigned int num_functions;
 	const struct rtd119x_pin_desc *muxes;
 	unsigned int num_muxes;
+	const struct rtd119x_pin_config_desc *configs;
+	unsigned int num_configs;
+	const struct rtd119x_pin_sconfig_desc *sconfigs;
+	unsigned int num_sconfigs;
 };
 
+#define PCONF_UNSUPP 0xffffffff
+#define PADDRI_4_8 1
+#define PADDRI_2_4 0
+
+
 #include "pinctrl-rtd1195.h"
 #include "pinctrl-rtd1295.h"
 
@@ -80,6 +134,15 @@ struct rtd119x_pinctrl {
 	const struct rtd119x_pinctrl_desc *info;
 };
 
+/* custom pinconf parameters */
+#define RTK_P_DRIVE	(PIN_CONFIG_END + 1)
+#define RTK_N_DRIVE	(PIN_CONFIG_END + 2)
+
+static const struct pinconf_generic_params rtd119x_custom_bindings[] = {
+	{"rtk,pdrive",  RTK_P_DRIVE,	0},
+	{"rtk,ndrive",	RTK_N_DRIVE,	0},
+};
+
 static int rtd119x_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
 {
 	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
@@ -165,6 +228,32 @@ static const struct rtd119x_pin_desc *rtd119x_pinctrl_find_mux(struct rtd119x_pi
 	return NULL;
 }
 
+static const struct rtd119x_pin_config_desc *rtd119x_pinctrl_find_config(struct rtd119x_pinctrl *data, const char *name)
+{
+	int i;
+
+	for (i = 0; i < data->info->num_configs; i++) {
+		if (strcmp(data->info->configs[i].name, name) == 0)
+			return &data->info->configs[i];
+	}
+
+	return NULL;
+}
+
+static const struct rtd119x_pin_sconfig_desc *rtd119x_pinctrl_find_sconfig(struct rtd119x_pinctrl *data, const char *name)
+{
+	int i;
+
+	for (i = 0; i < data->info->num_configs; i++) {
+		if (strcmp(data->info->sconfigs[i].name, name) == 0)
+			return &data->info->sconfigs[i];
+	}
+
+	return NULL;
+}
+
+
+
 static int rtd119x_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
 	unsigned int pin, const char *func_name)
 {
@@ -247,10 +336,123 @@ static const struct pinmux_ops rtd119x_pinmux_ops = {
 	.gpio_request_enable = rtd119x_pinctrl_gpio_request_enable,
 };
 
+
+static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
+	const char *pin_name, enum pin_config_param param,
+	enum pin_config_param arg)
+{
+	u8 set_val = 0;
+	u16 strength;
+	u32 val, mask;
+	int pulsel_off, pulen_off, smt_off, curr_off;
+	const struct rtd119x_pin_config_desc *config_desc;
+	const struct rtd119x_pin_sconfig_desc *sconfig_desc;
+
+	config_desc = rtd119x_pinctrl_find_config(data, pin_name);
+	if (!config_desc)
+		return -ENOTSUPP;
+
+	smt_off = config_desc->base_bit + config_desc->smt_offset;
+	curr_off = config_desc->base_bit + config_desc->curr_offset;
+	pulsel_off = config_desc->base_bit + config_desc->pud_sel_offset;
+	pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
+
+	switch ((u32)param) {
+	case PIN_CONFIG_INPUT_SCHMITT:
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		set_val = arg;
+		val = readl(data->base + config_desc->reg_offset);
+		if (set_val)
+			val |= BIT(smt_off);
+		else
+			val &= ~BIT(smt_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		val = readl(data->base + config_desc->reg_offset);
+		if (set_val)
+			val |= BIT(pulen_off);
+		else
+			val &= ~BIT(pulen_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		val = readl(data->base + config_desc->reg_offset);
+		val &= ~BIT(pulen_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		val = readl(data->base + config_desc->reg_offset);
+		val |= BIT(pulen_off) | BIT(pulsel_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		val = readl(data->base + config_desc->reg_offset);
+		val |= BIT(pulen_off);
+		val &= ~BIT(pulsel_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		strength = arg;
+		val = readl(data->base + config_desc->reg_offset);
+		switch (config_desc->curr_type) {
+		case PADDRI_4_8:
+			if (strength == 4)
+				val &= ~BIT(curr_off);
+			else if (strength == 8)
+				val |= BIT(curr_off);
+			else
+				return -EINVAL;
+			break;
+		case PADDRI_2_4:
+			if (strength == 2)
+				val &= ~BIT(curr_off);
+			else if (strength == 4)
+				val |= BIT(curr_off);
+			else
+				return -EINVAL;
+			break;
+		case PCONF_UNSUPP:
+			pr_err("[%s] not support drive strength\n", config_desc->name);
+			return -ENOTSUPP;
+			break;
+		default:
+			return -EINVAL;
+		}
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case RTK_P_DRIVE:
+		sconfig_desc = rtd119x_pinctrl_find_sconfig(data, pin_name);
+		if (!sconfig_desc)
+			return -ENOTSUPP;
+		set_val = arg;
+		val = readl(data->base + sconfig_desc->reg_offset);
+		mask = GENMASK(sconfig_desc->pdrive_offset +
+				sconfig_desc->pdrive_maskbits - 1, sconfig_desc->pdrive_offset);
+		val = (val & ~mask) | (set_val << sconfig_desc->pdrive_offset);
+		writel(val, data->base + sconfig_desc->reg_offset);
+		break;
+	case RTK_N_DRIVE:
+		sconfig_desc = rtd119x_pinctrl_find_sconfig(data, pin_name);
+		if (!sconfig_desc)
+			return -ENOTSUPP;
+		set_val = arg;
+		val = readl(data->base + sconfig_desc->reg_offset);
+		mask = GENMASK(sconfig_desc->ndrive_offset +
+				sconfig_desc->ndrive_maskbits - 1, sconfig_desc->ndrive_offset);
+		val = (val & ~mask) | (set_val << sconfig_desc->ndrive_offset);
+		writel(val, data->base + sconfig_desc->reg_offset);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int rtd119x_pin_config_get(struct pinctrl_dev *pcdev, unsigned pinnr,
 		unsigned long *config)
 {
-	//struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 	unsigned int param = pinconf_to_config_param(*config);
 	unsigned int arg = 0;
 
@@ -266,15 +468,62 @@ static int rtd119x_pin_config_get(struct pinctrl_dev *pcdev, unsigned pinnr,
 static int rtd119x_pin_config_set(struct pinctrl_dev *pcdev, unsigned pinnr,
 		unsigned long *configs, unsigned num_configs)
 {
-	//struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	const struct pinctrl_pin_desc *pin_desc;
+	const char *pin_name;
+	int i;
+	int ret = 0;
+
+	pin_desc = rtd119x_pinctrl_get_pin_by_number(data, pinnr);
+	if (!pin_desc)
+		return -ENOTSUPP;
+
+	pin_name = pin_desc->name;
+
+	for (i = 0; i < num_configs; i++) {
+		ret = rtd119x_pconf_parse_conf(data, pin_name,
+			pinconf_to_config_param(configs[i]),
+			pinconf_to_config_argument(configs[i]));
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
 
+
+static int rtd119x_pin_config_group_set(struct pinctrl_dev *pcdev, unsigned group,
+				unsigned long *configs, unsigned num_configs)
+{
+	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	const unsigned int *pins;
+	unsigned int num_pins;
+	const char *group_name;
+	int i, ret;
+
+		group_name = data->info->groups[group].name;
+
+	ret = rtd119x_pinctrl_get_group_pins(pcdev, group, &pins, &num_pins);
+	if (ret) {
+		dev_err(pcdev->dev, "Getting pins for group %s failed\n", group_name);
+		return ret;
+	}
+
+	for (i = 0; i < num_pins; i++) {
+		ret = rtd119x_pin_config_set(pcdev, pins[i], configs, num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+ }
+
+
 static const struct pinconf_ops rtd119x_pinconf_ops = {
 	.is_generic = true,
 	.pin_config_get = rtd119x_pin_config_get,
 	.pin_config_set = rtd119x_pin_config_set,
+	.pin_config_group_set = rtd119x_pin_config_group_set,
 };
 
 static void rtd119x_pinctrl_selftest(struct rtd119x_pinctrl *data)
@@ -356,8 +605,8 @@ static int rtd119x_pinctrl_probe(struct platform_device *pdev)
 	data->desc.pctlops = &rtd119x_pinctrl_ops;
 	data->desc.pmxops = &rtd119x_pinmux_ops;
 	data->desc.confops = &rtd119x_pinconf_ops;
-	data->desc.custom_params = NULL;
-	data->desc.num_custom_params = 0;
+	data->desc.custom_params = rtd119x_custom_bindings;
+	data->desc.num_custom_params = ARRAY_SIZE(rtd119x_custom_bindings);
 	data->desc.owner = THIS_MODULE;
 
 	data->pcdev = pinctrl_register(&data->desc, &pdev->dev, data);
diff --git a/drivers/pinctrl/pinctrl-rtd1295.h b/drivers/pinctrl/pinctrl-rtd1295.h
index 383870adb42f..018d00345298 100644
--- a/drivers/pinctrl/pinctrl-rtd1295.h
+++ b/drivers/pinctrl/pinctrl-rtd1295.h
@@ -415,6 +415,44 @@ static const struct rtd119x_pin_desc rtd1295_iso_muxes[] = {
 		RTK_PIN_FUNC(0x2 << 12, "uart2_1")),
 };
 
+static const struct rtd119x_pin_config_desc rtd1295_iso_configs[] = {
+	RTK_PIN_CONFIG(iso_gpio_2, 0x0, 0, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_3, 0x0, 4, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ir_rx, 0x0, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_4, 0x0, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_5, 0x0, 16, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_7, 0x0, 20, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(i2c_sda_0, 0x0, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_scl_0, 0x0, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(ur1_rx, 0x4, 0, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ur1_tx, 0x4, 4, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ur1_rts_n, 0x4, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ur1_cts_n, 0x4, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ur0_rx, 0x4, 16, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ur0_tx, 0x4, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(etn_led_link, 0x4, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(etn_led_rxtx, 0x4, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_sda_6, 0x8, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_scl_6, 0x8, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(ir_tx, 0x8, 20, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(i2c_sda_1, 0x8, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_scl_1, 0x8, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(hdmi_hpd, 0xc, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(nat_led_0, 0xc, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nat_led_1, 0xc, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nat_led_2, 0xc, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nat_led_3, 0xc, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(iso_gpio_21, 0x18, 0, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_22, 0x18, 4, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_23, 0x18, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_24, 0x18, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_25, 0x18, 16, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(iso_gpio_33, 0x20, 0, 1, 0, 2, 3, 2),
+	RTK_PIN_CONFIG(iso_gpio_34, 0x20, 4, 1, 0, 2, 3, 2),
+};
+
+
+
 static const struct rtd119x_pinctrl_desc rtd1295_iso_pinctrl_desc = {
 	.pins = rtd1295_iso_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_iso_pins),
@@ -424,6 +462,8 @@ static const struct rtd119x_pinctrl_desc rtd1295_iso_pinctrl_desc = {
 	.num_functions = ARRAY_SIZE(rtd1295_iso_pin_functions),
 	.muxes = rtd1295_iso_muxes,
 	.num_muxes = ARRAY_SIZE(rtd1295_iso_muxes),
+	.configs = rtd1295_iso_configs,
+	.num_configs = ARRAY_SIZE(rtd1295_iso_configs),
 };
 
 /* SB2 */
@@ -979,6 +1019,64 @@ static const struct rtd119x_pin_desc rtd1295_sb2_muxes[] = {
 		RTK_PIN_FUNC(0x1 << 22, "rgmii")),
 };
 
+static const struct rtd119x_pin_config_desc rtd1295_sb2_configs[] = {
+	RTK_PIN_CONFIG(tp0_clk, 0x28, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(tp0_sync, 0x28, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(tp0_valid, 0x28, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(tp0_data, 0x28, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(tp1_clk, 0x2C, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(tp1_sync, 0x2C, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(tp1_valid, 0x2C, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(tp1_data, 0x2C, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_sda_4, 0x30, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_scl_4, 0x30, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_sda_5, 0x30, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_scl_5, 0x30, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_0, 0x34, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_1, 0x34, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_2, 0x34, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_3, 0x34, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_4, 0x34, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_5, 0x34, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_6, 0x34, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_7, 0x34, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_8, 0x38, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_9, 0x38, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(usb_id, 0x38, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sensor_stb_0, 0x38, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sensor_stb_1, 0x38, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sensor_rst, 0x38, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sensor_cko_0, 0x38, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sensor_cko_1, 0x38, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_txc, 0x64, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_tx_ctl, 0x64, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_txd_0, 0x64, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_txd_1, 0x64, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_txd_2, 0x64, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_txd_3, 0x64, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_rxc, 0x64, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_rx_ctl, 0x64, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_rxd_0, 0x68, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_rxd_1, 0x68, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_rxd_2, 0x68, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_rxd_3, 0x68, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_mdio, 0x68, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii0_mdc, 0x68, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_txc, 0x74, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_tx_ctl, 0x74, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_txd_0, 0x74, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_txd_1, 0x74, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_txd_2, 0x74, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_txd_3, 0x74, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_rxc, 0x74, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_rx_ctl, 0x74, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_rxd_0, 0x78, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_rxd_1, 0x78, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_rxd_2, 0x78, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(rgmii1_rxd_3, 0x78, 12, 1, 0, 2, 3, PADDRI_4_8),
+};
+
+
 static const struct rtd119x_pinctrl_desc rtd1295_sb2_pinctrl_desc = {
 	.pins = rtd1295_sb2_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_sb2_pins),
@@ -988,6 +1086,8 @@ static const struct rtd119x_pinctrl_desc rtd1295_sb2_pinctrl_desc = {
 	.num_functions = ARRAY_SIZE(rtd1295_sb2_pin_functions),
 	.muxes = rtd1295_sb2_muxes,
 	.num_muxes = ARRAY_SIZE(rtd1295_sb2_muxes),
+	.configs = rtd1295_sb2_configs,
+	.num_configs = ARRAY_SIZE(rtd1295_sb2_configs),
 };
 
 /* Disp */
@@ -1105,6 +1205,20 @@ static const struct rtd119x_pin_desc rtd1295_disp_muxes[] = {
 		RTK_PIN_FUNC(0x2 << 18, "ai")),
 };
 
+static const struct rtd119x_pin_config_desc rtd1295_disp_configs[] = {
+	RTK_PIN_CONFIG(spdif, 0x0, 0, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(dmic_clk, 0x0, 4, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(dmic_data, 0x0, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ao_lrck, 0x4, 0, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ao_bck, 0x4, 4, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(aock, 0x4, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ao_sd_0, 0x4, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ao_sd_1, 0x4, 16, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ao_sd_2, 0x4, 20, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(ao_sd_3, 0x4, 24, 1, 0, 2, 3, PADDRI_2_4),
+};
+
+
 static const struct rtd119x_pinctrl_desc rtd1295_disp_pinctrl_desc = {
 	.pins = rtd1295_disp_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_disp_pins),
@@ -1114,6 +1228,8 @@ static const struct rtd119x_pinctrl_desc rtd1295_disp_pinctrl_desc = {
 	.num_functions = ARRAY_SIZE(rtd1295_disp_pin_functions),
 	.muxes = rtd1295_disp_muxes,
 	.num_muxes = ARRAY_SIZE(rtd1295_disp_muxes),
+	.configs = rtd1295_disp_configs,
+	.num_configs = ARRAY_SIZE(rtd1295_disp_configs),
 };
 
 /* CR */
@@ -1480,6 +1596,80 @@ static const struct rtd119x_pin_desc rtd1295_cr_muxes[] = {
 		RTK_PIN_FUNC(0x1 << 12, "pll_test")),
 };
 
+static const struct rtd119x_pin_config_desc rtd1295_cr_configs[] = {
+	RTK_PIN_CONFIG(nf_dqs, 0x8, 0, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_ale, 0x8, 4, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_ce_n_0, 0x8, 8, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_ce_n_1, 0x8, 12, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_rdy, 0x8, 16, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_rd_n, 0x8, 20, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_wr_n, 0x8, 24, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_cle, 0x8, 28, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_dd_0, 0xc, 0, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_dd_1, 0xc, 4, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_dd_2, 0xc, 8, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_dd_3, 0xc, 12, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_dd_4, 0xc, 16, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_dd_5, 0xc, 20, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_dd_6, 0xc, 24, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(nf_dd_7, 0xc, 28, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(mmc_cmd, 0x10, 0, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(mmc_clk, 0x10, 4, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(mmc_wp, 0x10, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_cd, 0x10, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_data_0, 0x10, 16, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(mmc_data_1, 0x10, 20, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(mmc_data_2, 0x10, 24, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(mmc_data_3, 0x10, 28, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(sdio_cmd, 0x14, 0, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(sdio_clk, 0x14, 4, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(sdio_data_0, 0x14, 16, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(sdio_data_1, 0x14, 20, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(sdio_data_2, 0x14, 24, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(sdio_data_3, 0x14, 28, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(emmc_dd_sb, 0x18, 0, 1, 0, 2, 3, PCONF_UNSUPP),
+	RTK_PIN_CONFIG(pcie_clkreq_0, 0x18, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(pcie_clkreq_1, 0x18, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(prob_0, 0x18, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(prob_1, 0x18, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(prob_2, 0x18, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(prob_3, 0x18, 24, 1, 0, 2, 3, PADDRI_4_8),
+};
+
+static const struct rtd119x_pin_sconfig_desc rtd1295_cr_sconfigs[] = {
+	RTK_PIN_SCONFIG(nf_ce_n_1, 0x20, 0, 4, 4, 4),
+	RTK_PIN_SCONFIG(nf_ce_n_0, 0x20, 8, 4, 12, 4),
+	RTK_PIN_SCONFIG(nf_rdy, 0x20, 16, 4, 20, 4),
+	RTK_PIN_SCONFIG(nf_dqs, 0x20, 24, 4, 28, 4),
+	RTK_PIN_SCONFIG(nf_dd_0, 0x24, 0, 4, 4, 4),
+	RTK_PIN_SCONFIG(nf_dd_1, 0x24, 8, 4, 12, 4),
+	RTK_PIN_SCONFIG(nf_dd_2, 0x24, 16, 4, 20, 4),
+	RTK_PIN_SCONFIG(nf_dd_3, 0x24, 24, 4, 28, 4),
+	RTK_PIN_SCONFIG(nf_dd_4, 0x28, 0, 4, 4, 4),
+	RTK_PIN_SCONFIG(nf_dd_5, 0x28, 8, 4, 12, 4),
+	RTK_PIN_SCONFIG(nf_dd_6, 0x28, 16, 4, 20, 4),
+	RTK_PIN_SCONFIG(nf_dd_7, 0x28, 24, 4, 28, 4),
+	RTK_PIN_SCONFIG(nf_ale, 0x2c, 0, 4, 4, 4),
+	RTK_PIN_SCONFIG(nf_cle, 0x2c, 8, 4, 12, 4),
+	RTK_PIN_SCONFIG(nf_wr_n, 0x2c, 16, 4, 20, 4),
+	RTK_PIN_SCONFIG(nf_rd_n, 0x2c, 24, 4, 28, 4),
+	RTK_PIN_SCONFIG(emmc_dd_sb, 0x30, 4, 4, 4, 4),
+	RTK_PIN_SCONFIG(mmc_cmd, 0x34, 0, 4, 4, 4),
+	RTK_PIN_SCONFIG(mmc_clk, 0x34, 8, 4, 12, 4),
+	RTK_PIN_SCONFIG(mmc_data_0, 0x38, 0, 4, 4, 4),
+	RTK_PIN_SCONFIG(mmc_data_1, 0x38, 8, 4, 12, 4),
+	RTK_PIN_SCONFIG(mmc_data_2, 0x38, 16, 4, 20, 4),
+	RTK_PIN_SCONFIG(mmc_data_3, 0x38, 24, 4, 28, 4),
+	RTK_PIN_SCONFIG(sdio_cmd, 0x3c, 0, 4, 4, 4),
+	RTK_PIN_SCONFIG(sdio_clk, 0x3c, 8, 4, 12, 4),
+	RTK_PIN_SCONFIG(sdio_data_0, 0x40, 0, 4, 4, 4),
+	RTK_PIN_SCONFIG(sdio_data_1, 0x40, 8, 4, 12, 4),
+	RTK_PIN_SCONFIG(sdio_data_2, 0x40, 16, 4, 20, 4),
+	RTK_PIN_SCONFIG(sdio_data_3, 0x40, 24, 4, 28, 4),
+};
+
+
+
 static const struct rtd119x_pinctrl_desc rtd1295_cr_pinctrl_desc = {
 	.pins = rtd1295_cr_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_cr_pins),
@@ -1489,6 +1679,10 @@ static const struct rtd119x_pinctrl_desc rtd1295_cr_pinctrl_desc = {
 	.num_functions = ARRAY_SIZE(rtd1295_cr_pin_functions),
 	.muxes = rtd1295_cr_muxes,
 	.num_muxes = ARRAY_SIZE(rtd1295_cr_muxes),
+	.configs = rtd1295_cr_configs,
+	.num_configs = ARRAY_SIZE(rtd1295_cr_configs),
+	.sconfigs = rtd1295_cr_sconfigs,
+	.num_sconfigs = ARRAY_SIZE(rtd1295_cr_sconfigs),
 };
 
 #endif
-- 
2.28.0

