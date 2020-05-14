Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC311D2B37
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 11:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgENJWG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 05:22:06 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:52958 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgENJVv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 05:21:51 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 04E9LQV40025255, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 04E9LQV40025255
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 14 May 2020 17:21:26 +0800
Received: from RTIITEXHVM1.realtek.com.tw (172.21.6.62) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 14 May 2020 17:21:25 +0800
Received: from RTEXMB06.realtek.com.tw (172.21.6.99) by
 RTIITEXHVM1.realtek.com.tw (172.21.6.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 14 May 2020 17:21:25 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 14 May 2020 17:21:25 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/7] pinctrl: realtek: rtd1295: Add pin configs.
Date:   Thu, 14 May 2020 17:21:20 +0800
Message-ID: <20200514092125.6875-3-tychang@realtek.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514092125.6875-1-tychang@realtek.com>
References: <20200514092125.6875-1-tychang@realtek.com>
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
 drivers/pinctrl/pinctrl-rtd119x.c | 160 +++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rtd1295.h | 159 +++++++++++++++++++++++++++++
 2 files changed, 317 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rtd119x.c b/drivers/pinctrl/pinctrl-rtd119x.c
index 60bf8c283a7a..52b16d610e13 100644
--- a/drivers/pinctrl/pinctrl-rtd119x.c
+++ b/drivers/pinctrl/pinctrl-rtd119x.c
@@ -36,6 +36,17 @@ struct rtd119x_pin_mux_desc {
 	u32 mux_value;
 };
 
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
@@ -43,6 +54,20 @@ struct rtd119x_pin_desc {
 	const struct rtd119x_pin_mux_desc *functions;
 };
 
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
@@ -68,8 +93,15 @@ struct rtd119x_pinctrl_desc {
 	unsigned int num_functions;
 	const struct rtd119x_pin_desc *muxes;
 	unsigned int num_muxes;
+	const struct rtd119x_pin_config_desc *configs;
+	unsigned int num_configs;
 };
 
+#define PCONF_UNSUPP 0xffffffff
+#define PADDRI_4_8 1
+#define PADDRI_2_4 0
+
+
 #include "pinctrl-rtd1195.h"
 #include "pinctrl-rtd1295.h"
 
@@ -165,6 +197,19 @@ static const struct rtd119x_pin_desc *rtd119x_pinctrl_find_mux(struct rtd119x_pi
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
+
 static int rtd119x_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
 	unsigned int pin, const char *func_name)
 {
@@ -247,10 +292,100 @@ static const struct pinmux_ops rtd119x_pinmux_ops = {
 	.gpio_request_enable = rtd119x_pinctrl_gpio_request_enable,
 };
 
+
+static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
+	const struct rtd119x_pin_config_desc *config_desc, enum pin_config_param param,
+	enum pin_config_param arg)
+{
+	u8 set_val = 0;
+	u16 strength;
+	u32 val, mask;
+	int pulsel_off, pulen_off, smt_off, curr_off;
+
+	smt_off = config_desc->base_bit + config_desc->smt_offset;
+	curr_off = config_desc->base_bit + config_desc->curr_offset;
+	pulsel_off = config_desc->base_bit + config_desc->pud_sel_offset;
+	pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_SCHMITT:
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		set_val = arg;
+		if (set_val)
+			set_val = 1;
+		else
+			set_val = 0;
+
+		val = readl(data->base + config_desc->reg_offset);
+		mask = 1 << smt_off;
+		val = (val & ~mask) | (set_val << smt_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		strength = arg;
+		switch (config_desc->curr_type) {
+		case PADDRI_4_8:
+			if (strength == 4)
+				set_val = 0;
+			else if (strength == 8)
+				set_val = 1;
+			else
+				return -EINVAL;
+			break;
+		case PADDRI_2_4:
+			if (strength == 2)
+				set_val = 0;
+			else if (strength == 4)
+				set_val = 1;
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
+		val = readl(data->base + config_desc->reg_offset);
+		mask = 1 << curr_off;
+		val = (val & ~mask) | (set_val <<  curr_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		val = readl(data->base + config_desc->reg_offset);
+		mask = 1 << pulen_off;
+		val = (val & ~mask) | (1 << pulen_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		val = readl(data->base + config_desc->reg_offset);
+		mask = 1 << pulen_off;
+		val = val & ~mask;
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		val = readl(data->base + config_desc->reg_offset);
+		mask = (1 << pulen_off) | (1 << pulsel_off);
+		val = (val & ~mask) | (1 << pulen_off) | (1 << pulsel_off);
+		writel(val, data->base + config_desc->reg_offset);
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		val = readl(data->base + config_desc->reg_offset);
+		mask = (1 << pulen_off) | (0 << pulsel_off);
+		val = (val & ~mask) | (1 << pulen_off);
+		writel(val, data->base + config_desc->reg_offset);
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
 
@@ -266,11 +401,32 @@ static int rtd119x_pin_config_get(struct pinctrl_dev *pcdev, unsigned pinnr,
 static int rtd119x_pin_config_set(struct pinctrl_dev *pcdev, unsigned pinnr,
 		unsigned long *configs, unsigned num_configs)
 {
-	//struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	const struct rtd119x_pin_config_desc *config_desc;
+	const struct pinctrl_pin_desc *pin_desc;
+	const char *pin_name;
+	int i;
+
+	pin_desc = rtd119x_pinctrl_get_pin_by_number(data, pinnr);
+	if (!pin_desc)
+		return -ENOTSUPP;
+
+	pin_name = pin_desc->name;
+	config_desc = rtd119x_pinctrl_find_config(data, pin_name);
+	if (!config_desc)
+		return -ENOTSUPP;
+
+	for (i = 0; i < num_configs; i++) {
+		rtd119x_pconf_parse_conf(data, config_desc,
+			pinconf_to_config_param(configs[i]),
+			pinconf_to_config_argument(configs[i]));
+	}
 
 	return 0;
 }
 
+
+
 static const struct pinconf_ops rtd119x_pinconf_ops = {
 	.is_generic = true,
 	.pin_config_get = rtd119x_pin_config_get,
diff --git a/drivers/pinctrl/pinctrl-rtd1295.h b/drivers/pinctrl/pinctrl-rtd1295.h
index 383870adb42f..0232c5d8b353 100644
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
@@ -1480,6 +1596,47 @@ static const struct rtd119x_pin_desc rtd1295_cr_muxes[] = {
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
+
 static const struct rtd119x_pinctrl_desc rtd1295_cr_pinctrl_desc = {
 	.pins = rtd1295_cr_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_cr_pins),
@@ -1489,6 +1646,8 @@ static const struct rtd119x_pinctrl_desc rtd1295_cr_pinctrl_desc = {
 	.num_functions = ARRAY_SIZE(rtd1295_cr_pin_functions),
 	.muxes = rtd1295_cr_muxes,
 	.num_muxes = ARRAY_SIZE(rtd1295_cr_muxes),
+	.configs = rtd1295_cr_configs,
+	.num_configs = ARRAY_SIZE(rtd1295_cr_configs),
 };
 
 #endif
-- 
2.26.2

