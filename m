Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E5824354B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgHMHt2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:49:28 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39127 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbgHMHt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:49:27 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D7n9FD1028958, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D7n9FD1028958
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 13 Aug 2020 15:49:09 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:08 +0800
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
Subject: [PATCH v3 1/9] pinctrl: realtek: rtd1295: Add missed pins.
Date:   Thu, 13 Aug 2020 15:49:00 +0800
Message-ID: <20200813074908.889-2-tychang@realtek.com>
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

The current Realtek DHC SoC RTD1295 pinctrl driver missed some
pins definition that may make the pin group does not mux completely.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 drivers/pinctrl/pinctrl-rtd119x.c |   4 +-
 drivers/pinctrl/pinctrl-rtd1295.h | 192 +++++++++++++++++++++++++-----
 2 files changed, 161 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rtd119x.c b/drivers/pinctrl/pinctrl-rtd119x.c
index d69716243297..60bf8c283a7a 100644
--- a/drivers/pinctrl/pinctrl-rtd119x.c
+++ b/drivers/pinctrl/pinctrl-rtd119x.c
@@ -304,7 +304,7 @@ static void rtd119x_pinctrl_selftest(struct rtd119x_pinctrl *data)
 			/* Check for function */
 			for (k = 0; k < data->info->num_functions; k++) {
 				if (strcmp(data->info->functions[k].name,
-				           data->info->muxes[i].functions[j].name) == 0)
+					data->info->muxes[i].functions[j].name) == 0)
 					break;
 			}
 			if (k == data->info->num_functions)
@@ -314,7 +314,7 @@ static void rtd119x_pinctrl_selftest(struct rtd119x_pinctrl *data)
 
 			/* Check for duplicate mux value - assumption: ascending order */
 			if (j > 0 && data->info->muxes[i].functions[j].mux_value
-			          <= data->info->muxes[i].functions[j - 1].mux_value)
+				< data->info->muxes[i].functions[j - 1].mux_value)
 				dev_warn(data->pcdev->dev, "Mux %s function %s has unexpected value\n",
 					 data->info->muxes[i].name,
 					 data->info->muxes[i].functions[j].name);
diff --git a/drivers/pinctrl/pinctrl-rtd1295.h b/drivers/pinctrl/pinctrl-rtd1295.h
index 57d8129f12b2..383870adb42f 100644
--- a/drivers/pinctrl/pinctrl-rtd1295.h
+++ b/drivers/pinctrl/pinctrl-rtd1295.h
@@ -37,6 +37,12 @@ enum rtd1295_iso_pins {
 	RTD1295_NAT_LED_3,
 	RTD1295_ISO_GPIO_33,
 	RTD1295_ISO_GPIO_34,
+	RTD1295_PWM_23_LOC0,
+	RTD1295_PWM_01_LOC0,
+	RTD1295_PWM_23_LOC1,
+	RTD1295_PWM_01_LOC1,
+	RTD1295_EJTAG_AVCPU_LOC,
+	RTD1295_UR2_LOC,
 };
 
 static const struct pinctrl_pin_desc rtd1295_iso_pins[] = {
@@ -75,6 +81,12 @@ static const struct pinctrl_pin_desc rtd1295_iso_pins[] = {
 	PINCTRL_PIN(RTD1295_NAT_LED_3, "nat_led_3"),
 	PINCTRL_PIN(RTD1295_ISO_GPIO_33, "iso_gpio_33"),
 	PINCTRL_PIN(RTD1295_ISO_GPIO_34, "iso_gpio_34"),
+	PINCTRL_PIN(RTD1295_PWM_23_LOC0, "pwm_23_loc0"),
+	PINCTRL_PIN(RTD1295_PWM_01_LOC0, "pwm_01_loc0"),
+	PINCTRL_PIN(RTD1295_PWM_23_LOC1, "pwm_23_loc1"),
+	PINCTRL_PIN(RTD1295_PWM_01_LOC1, "pwm_01_loc1"),
+	PINCTRL_PIN(RTD1295_EJTAG_AVCPU_LOC, "ejtag_avcpu_loc"),
+	PINCTRL_PIN(RTD1295_UR2_LOC, "ur2_loc"),
 };
 
 static const unsigned int rtd1295_iso_gpio_0_pins[] = { RTD1295_ISO_GPIO_0 };
@@ -112,6 +124,12 @@ static const unsigned int rtd1295_nat_led_2_pins[] = { RTD1295_NAT_LED_2 };
 static const unsigned int rtd1295_nat_led_3_pins[] = { RTD1295_NAT_LED_3 };
 static const unsigned int rtd1295_iso_gpio_33_pins[] = { RTD1295_ISO_GPIO_33 };
 static const unsigned int rtd1295_iso_gpio_34_pins[] = { RTD1295_ISO_GPIO_34 };
+static const unsigned int rtd1295_pwm_23_loc0_pins[] = { RTD1295_PWM_23_LOC0 };
+static const unsigned int rtd1295_pwm_01_loc0_pins[] = { RTD1295_PWM_01_LOC0 };
+static const unsigned int rtd1295_pwm_23_loc1_pins[] = { RTD1295_PWM_23_LOC1 };
+static const unsigned int rtd1295_pwm_01_loc1_pins[] = { RTD1295_PWM_01_LOC1 };
+static const unsigned int rtd1295_ejtag_avcpu_loc_pins[] = { RTD1295_EJTAG_AVCPU_LOC };
+static const unsigned int rtd1295_ur2_loc_pins[] = { RTD1295_UR2_LOC };
 
 static const unsigned int rtd1295_i2c0_pins[] = { RTD1295_I2C_SCL_0, RTD1295_I2C_SDA_0 };
 static const unsigned int rtd1295_i2c1_pins[] = { RTD1295_I2C_SCL_1, RTD1295_I2C_SDA_1 };
@@ -164,6 +182,12 @@ static const struct rtd119x_pin_group_desc rtd1295_iso_pin_groups[] = {
 	RTD1295_GROUP(nat_led_3),
 	RTD1295_GROUP(iso_gpio_33),
 	RTD1295_GROUP(iso_gpio_34),
+	RTD1295_GROUP(pwm_23_loc0),
+	RTD1295_GROUP(pwm_01_loc0),
+	RTD1295_GROUP(pwm_23_loc1),
+	RTD1295_GROUP(pwm_01_loc1),
+	RTD1295_GROUP(ejtag_avcpu_loc),
+	RTD1295_GROUP(ur2_loc),
 
 	RTD1295_GROUP(i2c0),
 	RTD1295_GROUP(i2c1),
@@ -192,14 +216,25 @@ static const char * const rtd1295_iso_i2c6_groups[] = { "i2c_scl_6", "i2c_sda_6"
 static const char * const rtd1295_iso_ir_rx_groups[] = { "ir_rx" };
 static const char * const rtd1295_iso_ir_tx_groups[] = { "ir_tx" };
 static const char * const rtd1295_iso_nat_led_groups[] = { "nat_led_0", "nat_led_1", "nat_led_2", "nat_led_3" };
-static const char * const rtd1295_iso_pwm_groups[] = { "etn_led_link", "etn_led_rxtx", "nat_led_0", "nat_led_1" };
+static const char * const rtd1295_iso_pwm_1_groups[] = { "etn_led_link", "etn_led_rxtx", "nat_led_0", "nat_led_1" };
+static const char * const rtd1295_iso_pwm_0_groups[] = { "iso_gpio_21", "iso_gpio_22", "iso_gpio_23", "iso_gpio_24" };
 static const char * const rtd1295_iso_rtc_groups[] = { "iso_gpio_25" };
 static const char * const rtd1295_iso_sc_groups[] = { "nat_led_0", "nat_led_1", "nat_led_2", "nat_led_3" };
 static const char * const rtd1295_iso_standby_dbg_groups[] = { "iso_gpio_2", "iso_gpio_3", "ir_rx" };
 static const char * const rtd1295_iso_uart0_groups[] = { "ur0_rx", "ur0_tx", "uart0" };
 static const char * const rtd1295_iso_uart1_groups[] = { "ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n", "uart1" };
-static const char * const rtd1295_iso_uart2_0_groups[] = { "iso_gpio_2", "iso_gpio_3", "iso_gpio_4", "iso_gpio_5" };
-static const char * const rtd1295_iso_uart2_1_groups[] = { "iso_gpio_23", "iso_gpio_24", "iso_gpio_33", "iso_gpio_34" };
+static const char * const rtd1295_iso_uart2_0_groups[] = { "iso_gpio_2", "iso_gpio_3", "iso_gpio_4", "iso_gpio_5", "ur2_loc" };
+static const char * const rtd1295_iso_uart2_1_groups[] = { "iso_gpio_23", "iso_gpio_24", "iso_gpio_33", "iso_gpio_34", "ur2_loc" };
+static const char * const rtd1295_iso_pwm_01_loc0_normal_groups[] = { "pwm_01_loc0" };
+static const char * const rtd1295_iso_pwm_23_loc0_normal_groups[] = { "pwm_23_loc0" };
+static const char * const rtd1295_iso_pwm_01_loc0_open_drain_groups[] = { "pwm_01_loc0" };
+static const char * const rtd1295_iso_pwm_23_loc0_open_drain_groups[] = { "pwm_23_loc0" };
+static const char * const rtd1295_iso_pwm_01_loc1_normal_groups[] = { "pwm_01_loc1" };
+static const char * const rtd1295_iso_pwm_23_loc1_normal_groups[] = { "pwm_23_loc1" };
+static const char * const rtd1295_iso_pwm_01_loc1_open_drain_groups[] = { "pwm_01_loc1" };
+static const char * const rtd1295_iso_pwm_23_loc1_open_drain_groups[] = { "pwm_23_loc1" };
+static const char * const rtd1295_iso_acpu_ejtag_loc_nf_groups[] = { "ejtag_avcpu_loc" };
+
 
 #define RTD1295_FUNC(_name) \
 	{ \
@@ -219,7 +254,8 @@ static const struct rtd119x_pin_func_desc rtd1295_iso_pin_functions[] = {
 	RTD1295_FUNC(ir_rx),
 	RTD1295_FUNC(ir_tx),
 	RTD1295_FUNC(nat_led),
-	RTD1295_FUNC(pwm),
+	RTD1295_FUNC(pwm_0),
+	RTD1295_FUNC(pwm_1),
 	RTD1295_FUNC(rtc),
 	RTD1295_FUNC(sc),
 	RTD1295_FUNC(standby_dbg),
@@ -227,6 +263,15 @@ static const struct rtd119x_pin_func_desc rtd1295_iso_pin_functions[] = {
 	RTD1295_FUNC(uart1),
 	RTD1295_FUNC(uart2_0),
 	RTD1295_FUNC(uart2_1),
+	RTD1295_FUNC(pwm_01_loc0_normal),
+	RTD1295_FUNC(pwm_23_loc0_normal),
+	RTD1295_FUNC(pwm_01_loc0_open_drain),
+	RTD1295_FUNC(pwm_23_loc0_open_drain),
+	RTD1295_FUNC(pwm_01_loc1_normal),
+	RTD1295_FUNC(pwm_23_loc1_normal),
+	RTD1295_FUNC(pwm_01_loc1_open_drain),
+	RTD1295_FUNC(pwm_23_loc1_open_drain),
+	RTD1295_FUNC(acpu_ejtag_loc_nf),
 };
 
 #undef RTD1295_FUNC
@@ -278,11 +323,11 @@ static const struct rtd119x_pin_desc rtd1295_iso_muxes[] = {
 	RTK_PIN_MUX(etn_led_link, 0x10, GENMASK(27, 26),
 		RTK_PIN_FUNC(0x0 << 26, "gpio"),
 		RTK_PIN_FUNC(0x1 << 26, "etn_led"),
-		RTK_PIN_FUNC(0x2 << 26, "pwm")),
+		RTK_PIN_FUNC(0x2 << 26, "pwm_1")),
 	RTK_PIN_MUX(etn_led_rxtx, 0x10, GENMASK(29, 28),
 		RTK_PIN_FUNC(0x0 << 28, "gpio"),
 		RTK_PIN_FUNC(0x1 << 28, "etn_led"),
-		RTK_PIN_FUNC(0x2 << 28, "pwm")),
+		RTK_PIN_FUNC(0x2 << 28, "pwm_1")),
 
 	RTK_PIN_MUX(i2c_scl_6, 0x14, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
@@ -311,12 +356,12 @@ static const struct rtd119x_pin_desc rtd1295_iso_muxes[] = {
 	RTK_PIN_MUX(nat_led_0, 0x14, GENMASK(17, 16),
 		RTK_PIN_FUNC(0x0 << 16, "gpio"),
 		RTK_PIN_FUNC(0x1 << 16, "nat_led"),
-		RTK_PIN_FUNC(0x2 << 16, "pwm"),
+		RTK_PIN_FUNC(0x2 << 16, "pwm_1"),
 		RTK_PIN_FUNC(0x3 << 16, "sc")),
 	RTK_PIN_MUX(nat_led_1, 0x14, GENMASK(19, 18),
 		RTK_PIN_FUNC(0x0 << 18, "gpio"),
 		RTK_PIN_FUNC(0x1 << 18, "nat_led"),
-		RTK_PIN_FUNC(0x2 << 18, "pwm"),
+		RTK_PIN_FUNC(0x2 << 18, "pwm_1"),
 		RTK_PIN_FUNC(0x3 << 18, "sc")),
 	RTK_PIN_MUX(nat_led_2, 0x14, GENMASK(21, 20),
 		RTK_PIN_FUNC(0x0 << 20, "gpio"),
@@ -326,20 +371,38 @@ static const struct rtd119x_pin_desc rtd1295_iso_muxes[] = {
 		RTK_PIN_FUNC(0x0 << 22, "gpio"),
 		RTK_PIN_FUNC(0x1 << 22, "nat_led"),
 		RTK_PIN_FUNC(0x3 << 22, "sc")),
+	RTK_PIN_MUX(pwm_23_loc0, 0x14, GENMASK(24, 24),
+		RTK_PIN_FUNC(0x0 << 24, "pwm_23_loc0_normal"),
+		RTK_PIN_FUNC(0x1 << 24, "pwm_23_loc0_open_drain")),
+	RTK_PIN_MUX(pwm_01_loc0, 0x14, GENMASK(25, 25),
+		RTK_PIN_FUNC(0x0 << 25, "pwm_01_loc0_normal"),
+		RTK_PIN_FUNC(0x1 << 25, "pwm_01_loc0_open_drain")),
+	RTK_PIN_MUX(pwm_23_loc1, 0x14, GENMASK(26, 26),
+		RTK_PIN_FUNC(0x0 << 26, "pwm_23_loc1_normal"),
+		RTK_PIN_FUNC(0x1 << 26, "pwm_23_loc1_open_drain")),
+	RTK_PIN_MUX(pwm_01_loc1, 0x14, GENMASK(27, 27),
+		RTK_PIN_FUNC(0x0 << 27, "pwm_01_loc1_normal"),
+		RTK_PIN_FUNC(0x1 << 27, "pwm_01_loc1_open_drain")),
+	RTK_PIN_MUX(ejtag_avcpu_loc, 0x14, GENMASK(29, 28),
+		RTK_PIN_FUNC(0x1 << 28, "acpu_ejtag_loc_iso"),
+		RTK_PIN_FUNC(0x2 << 28, "acpu_ejtag_loc_nf")),
+	RTK_PIN_MUX(ur2_loc, 0x14, GENMASK(31, 30),
+		RTK_PIN_FUNC(0x1 << 30, "uart2_0"),
+		RTK_PIN_FUNC(0x2 << 30, "uart2_1")),
 
 	RTK_PIN_MUX(iso_gpio_21, 0x1c, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
-		RTK_PIN_FUNC(0x1 << 0, "pwm")),
+		RTK_PIN_FUNC(0x1 << 0, "pwm_0")),
 	RTK_PIN_MUX(iso_gpio_22, 0x1c, GENMASK(3, 2),
 		RTK_PIN_FUNC(0x0 << 2, "gpio"),
-		RTK_PIN_FUNC(0x1 << 2, "pwm")),
+		RTK_PIN_FUNC(0x1 << 2, "pwm_0")),
 	RTK_PIN_MUX(iso_gpio_23, 0x1c, GENMASK(5, 4),
 		RTK_PIN_FUNC(0x0 << 4, "gpio"),
-		RTK_PIN_FUNC(0x1 << 4, "pwm"),
+		RTK_PIN_FUNC(0x1 << 4, "pwm_0"),
 		RTK_PIN_FUNC(0x2 << 4, "uart2_1")),
 	RTK_PIN_MUX(iso_gpio_24, 0x1c, GENMASK(7, 6),
 		RTK_PIN_FUNC(0x0 << 6, "gpio"),
-		RTK_PIN_FUNC(0x1 << 6, "pwm"),
+		RTK_PIN_FUNC(0x1 << 6, "pwm_0"),
 		RTK_PIN_FUNC(0x2 << 6, "uart2_1")),
 	RTK_PIN_MUX(iso_gpio_25, 0x1c, GENMASK(9, 8),
 		RTK_PIN_FUNC(0x0 << 8, "gpio"),
@@ -420,6 +483,11 @@ enum rtd1295_sb2_pins {
 	RTD1295_RGMII1_RXD_1,
 	RTD1295_RGMII1_RXD_2,
 	RTD1295_RGMII1_RXD_3,
+	RTD1295_HI_LOC,
+	RTD1295_EJTAG_SCPU_LOC,
+	RTD1295_SF_EN,
+	RTD1295_TP0_LOC,
+	RTD1295_TP1_LOC,
 };
 
 static const struct pinctrl_pin_desc rtd1295_sb2_pins[] = {
@@ -477,6 +545,11 @@ static const struct pinctrl_pin_desc rtd1295_sb2_pins[] = {
 	PINCTRL_PIN(RTD1295_RGMII1_RXD_1,  "rgmii1_rxd_1"),
 	PINCTRL_PIN(RTD1295_RGMII1_RXD_2,  "rgmii1_rxd_2"),
 	PINCTRL_PIN(RTD1295_RGMII1_RXD_3,  "rgmii1_rxd_3"),
+	PINCTRL_PIN(RTD1295_HI_LOC,  "hif_loc"),
+	PINCTRL_PIN(RTD1295_EJTAG_SCPU_LOC,  "ejtag_scpu_loc"),
+	PINCTRL_PIN(RTD1295_SF_EN,  "sf_en"),
+	PINCTRL_PIN(RTD1295_TP0_LOC,  "tp0_loc"),
+	PINCTRL_PIN(RTD1295_TP1_LOC,  "tp1_loc"),
 };
 
 static const unsigned int rtd1295_gpio_0_pins[] = { RTD1295_GPIO_0 };
@@ -533,6 +606,16 @@ static const unsigned int rtd1295_rgmii1_rxd_0_pins[] = { RTD1295_RGMII1_RXD_0 }
 static const unsigned int rtd1295_rgmii1_rxd_1_pins[] = { RTD1295_RGMII1_RXD_1 };
 static const unsigned int rtd1295_rgmii1_rxd_2_pins[] = { RTD1295_RGMII1_RXD_2 };
 static const unsigned int rtd1295_rgmii1_rxd_3_pins[] = { RTD1295_RGMII1_RXD_3 };
+static const unsigned int rtd1295_hif_loc_pins[] = { RTD1295_HI_LOC };
+static const unsigned int rtd1295_ejtag_scpu_loc_pins[] = { RTD1295_EJTAG_SCPU_LOC };
+static const unsigned int rtd1295_sf_en_pins[] = { RTD1295_SF_EN };
+static const unsigned int rtd1295_tp0_loc_pins[] = { RTD1295_TP0_LOC };
+static const unsigned int rtd1295_tp1_loc_pins[] = { RTD1295_TP1_LOC };
+
+
+
+
+
 
 static const struct rtd119x_pin_group_desc rtd1295_sb2_pin_groups[] = {
 	RTD1295_GROUP(gpio_0),
@@ -589,6 +672,11 @@ static const struct rtd119x_pin_group_desc rtd1295_sb2_pin_groups[] = {
 	RTD1295_GROUP(rgmii1_rxd_1),
 	RTD1295_GROUP(rgmii1_rxd_2),
 	RTD1295_GROUP(rgmii1_rxd_3),
+	RTD1295_GROUP(hif_loc),
+	RTD1295_GROUP(ejtag_scpu_loc),
+	RTD1295_GROUP(sf_en),
+	RTD1295_GROUP(tp0_loc),
+	RTD1295_GROUP(tp1_loc),
 };
 
 static const char * const rtd1295_sb2_gpio_groups[] = {
@@ -619,17 +707,23 @@ static const char * const rtd1295_sb2_rgmii_groups[] = {
 	"rgmii1_txc", "rgmii1_tx_ctl", "rgmii1_txd_0", "rgmii1_txd_1", "rgmii1_txd_2", "rgmii1_txd_3",
 	"rgmii1_rxc", "rgmii1_rx_ctl", "rgmii1_rxd_0", "rgmii1_rxd_1", "rgmii1_rxd_2", "rgmii1_rxd_3",
 };
-static const char * const rtd1295_sb2_scpu_ejtag_loc_gpio_groups[] = { "gpio_4", "gpio_5", "gpio_6", "gpio_7", "gpio_8" };
+
+static const char * const rtd1295_sb2_scpu_ejtag_loc_gpio_groups[] = { "gpio_4", "gpio_5", "gpio_6", "gpio_7", "gpio_8", "ejtag_scpu_loc" };
+static const char * const rtd1295_sb2_scpu_ejtag_loc_cr_groups[] = { "ejtag_scpu_loc" };
 static const char * const rtd1295_sb2_sensor_cko_output_groups[] = { "sensor_cko_0", "sensor_cko_1" };
 static const char * const rtd1295_sb2_spi_groups[] = { "gpio_0", "gpio_1", "gpio_2", "gpio_3" };
 static const char * const rtd1295_sb2_test_loop_dis_groups[] = { "usb_id" };
-static const char * const rtd1295_sb2_tp0_loc_rgmii0_tx_groups[] = { "rgmii0_txd_0", "rgmii0_txd_1", "rgmii0_txd_2", "rgmii0_txd_3" };
-static const char * const rtd1295_sb2_tp0_loc_tp0_groups[] = { "tp0_data", "tp0_sync", "tp0_valid", "tp0_clk" };
-static const char * const rtd1295_sb2_tp0_loc_tp1_groups[] = { "tp0_data", "tp0_sync", "tp0_valid", "tp0_clk" };
-static const char * const rtd1295_sb2_tp1_loc_rgmii0_rx_groups[] = { "rgmii0_rxd_0", "rgmii0_rxd_1", "rgmii0_rxd_2", "rgmii0_rxd_3" };
-static const char * const rtd1295_sb2_tp1_loc_tp0_groups[] = { "tp1_data", "tp1_sync", "tp1_valid", "tp1_clk" };
-static const char * const rtd1295_sb2_tp1_loc_tp1_groups[] = { "tp1_data", "tp1_sync", "tp1_valid", "tp1_clk" };
+static const char * const rtd1295_sb2_tp0_loc_rgmii0_tx_groups[] = { "rgmii0_txd_0", "rgmii0_txd_1", "rgmii0_txd_2", "rgmii0_txd_3", "tp0_loc" };
+static const char * const rtd1295_sb2_tp0_loc_tp0_groups[] = { "tp0_data", "tp0_sync", "tp0_valid", "tp0_clk", "tp0_loc" };
+static const char * const rtd1295_sb2_tp0_loc_tp1_groups[] = { "tp0_data", "tp0_sync", "tp0_valid", "tp0_clk", "tp0_loc" };
+static const char * const rtd1295_sb2_tp1_loc_rgmii0_rx_groups[] = { "rgmii0_rxd_0", "rgmii0_rxd_1", "rgmii0_rxd_2", "rgmii0_rxd_3", "tp1_loc" };
+static const char * const rtd1295_sb2_tp1_loc_tp0_groups[] = { "tp1_data", "tp1_sync", "tp1_valid", "tp1_clk", "tp1_loc" };
+static const char * const rtd1295_sb2_tp1_loc_tp1_groups[] = { "tp1_data", "tp1_sync", "tp1_valid", "tp1_clk", "tp1_loc" };
 static const char * const rtd1295_sb2_usb_clock_output_groups[] = { "sensor_cko_1" };
+static const char * const rtd1295_sb2_hif_loc_misc_groups[] = { "hif_loc" };
+static const char * const rtd1295_sb2_hif_loc_nf_groups[] = { "hif_loc" };
+
+
 
 #define RTD1295_FUNC(_name) \
 	{ \
@@ -661,6 +755,9 @@ static const struct rtd119x_pin_func_desc rtd1295_sb2_pin_functions[] = {
 	RTD1295_FUNC(tp1_loc_tp0),
 	RTD1295_FUNC(tp1_loc_tp1),
 	RTD1295_FUNC(usb_clock_output),
+	RTD1295_FUNC(hif_loc_misc),
+	RTD1295_FUNC(hif_loc_nf),
+	RTD1295_FUNC(scpu_ejtag_loc_cr),
 };
 
 #undef RTD1295_FUNC
@@ -759,6 +856,12 @@ static const struct rtd119x_pin_desc rtd1295_sb2_muxes[] = {
 	RTK_PIN_MUX(usb_id, 0x0c, GENMASK(17, 16),
 		RTK_PIN_FUNC(0x0 << 16, "gpio"),
 		RTK_PIN_FUNC(0x2 << 16, "test_loop_dis")),
+	RTK_PIN_MUX(hif_loc, 0x0c, GENMASK(19, 18),
+		RTK_PIN_FUNC(0x1 << 18, "hif_loc_misc"),
+		RTK_PIN_FUNC(0x2 << 18, "hif_loc_nf")),
+	RTK_PIN_MUX(ejtag_scpu_loc, 0x0c, GENMASK(21, 20),
+		RTK_PIN_FUNC(0x1 << 20, "scpu_ejtag_loc_gpio"),
+		RTK_PIN_FUNC(0x2 << 20, "scpu_ejtag_loc_cr")),
 	RTK_PIN_MUX(sensor_stb_1, 0x0c, GENMASK(23, 22),
 		RTK_PIN_FUNC(0x0 << 22, "gpio")),
 	RTK_PIN_MUX(sensor_stb_0, 0x0c, GENMASK(25, 24),
@@ -773,6 +876,18 @@ static const struct rtd119x_pin_desc rtd1295_sb2_muxes[] = {
 		RTK_PIN_FUNC(0x0 << 30, "gpio"),
 		RTK_PIN_FUNC(0x1 << 30, "sensor_cko_output")),
 
+	RTK_PIN_MUX(sf_en, 0x14, GENMASK(0, 0),
+		RTK_PIN_FUNC(0x0 << 0, "gpio"),
+		RTK_PIN_FUNC(0x1 << 0, "spi")),
+	RTK_PIN_MUX(tp0_loc, 0x14, GENMASK(7, 7),
+		RTK_PIN_FUNC(0x0 << 7, "tp0_loc_tp0"),
+		RTK_PIN_FUNC(0x0 << 7, "tp0_loc_tp1"),
+		RTK_PIN_FUNC(0x1 << 7, "tp0_loc_rgmii0_tx")),
+	RTK_PIN_MUX(tp1_loc, 0x14, GENMASK(8, 8),
+		RTK_PIN_FUNC(0x0 << 8, "tp1_loc_tp1"),
+		RTK_PIN_FUNC(0x0 << 8, "tp1_loc_tp0"),
+		RTK_PIN_FUNC(0x1 << 8, "tp1_loc_rgmii0_rx")),
+
 	RTK_PIN_MUX(rgmii0_txc, 0x6c, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
 		RTK_PIN_FUNC(0x1 << 0, "rgmii")),
@@ -1041,6 +1156,7 @@ enum rtd1295_cr_pins {
 	RTD1295_PROB_1,
 	RTD1295_PROB_2,
 	RTD1295_PROB_3,
+	RTD1295_SDIO_LOC,
 };
 
 static const struct pinctrl_pin_desc rtd1295_cr_pins[] = {
@@ -1081,6 +1197,7 @@ static const struct pinctrl_pin_desc rtd1295_cr_pins[] = {
 	PINCTRL_PIN(RTD1295_PROB_1, "prob_1"),
 	PINCTRL_PIN(RTD1295_PROB_2, "prob_2"),
 	PINCTRL_PIN(RTD1295_PROB_3, "prob_3"),
+	PINCTRL_PIN(RTD1295_SDIO_LOC, "sdio_loc"),
 };
 
 static const unsigned int rtd1295_nf_cle_pins[] = { RTD1295_NF_CLE };
@@ -1120,6 +1237,8 @@ static const unsigned int rtd1295_prob_0_pins[] = { RTD1295_PROB_0 };
 static const unsigned int rtd1295_prob_1_pins[] = { RTD1295_PROB_1 };
 static const unsigned int rtd1295_prob_2_pins[] = { RTD1295_PROB_2 };
 static const unsigned int rtd1295_prob_3_pins[] = { RTD1295_PROB_3 };
+static const unsigned int rtd1295_sdio_loc_pins[] = { RTD1295_SDIO_LOC };
+
 
 static const struct rtd119x_pin_group_desc rtd1295_cr_pin_groups[] = {
 	RTD1295_GROUP(nf_cle),
@@ -1159,6 +1278,7 @@ static const struct rtd119x_pin_group_desc rtd1295_cr_pin_groups[] = {
 	RTD1295_GROUP(prob_1),
 	RTD1295_GROUP(prob_2),
 	RTD1295_GROUP(prob_3),
+	RTD1295_GROUP(sdio_loc),
 };
 
 static const char * const rtd1295_cr_gpio_groups[] = {
@@ -1180,7 +1300,9 @@ static const char * const rtd1295_cr_pcie_groups[] = { "pcie_clkreq_0", "pcie_cl
 static const char * const rtd1295_cr_pll_test_groups[] = { "prob_0", "prob_1", "prob_2", "prob_3" };
 static const char * const rtd1295_cr_scpu_ejtag_loc_cr_groups[] = { "mmc_cmd", "mmc_clk", "mmc_wp", "mmc_data_0", "mmc_data_3" };
 static const char * const rtd1295_cr_sd_card_groups[] = { "mmc_cmd", "mmc_clk", "mmc_wp", "mmc_cd", "mmc_data_0", "mmc_data_1", "mmc_data_2", "mmc_data_3" };
-static const char * const rtd1295_cr_sdio_groups[] = { "sdio_cmd", "sdio_clk", "sdio_data_0", "sdio_data_1", "sdio_data_2", "sdio_data_3", "mmc_cmd", "mmc_clk", "mmc_data_0", "mmc_data_1", "mmc_data_2", "mmc_data_3" };
+static const char * const rtd1295_cr_sdio_0_groups[] = { "sdio_cmd", "sdio_clk", "sdio_data_0", "sdio_data_1", "sdio_data_2", "sdio_data_3" };
+static const char * const rtd1295_cr_sdio_1_groups[] = { "mmc_cmd", "mmc_clk", "mmc_data_0", "mmc_data_1", "mmc_data_2", "mmc_data_3" };
+
 
 #define RTD1295_FUNC(_name) \
 	{ \
@@ -1200,7 +1322,8 @@ static const struct rtd119x_pin_func_desc rtd1295_cr_pin_functions[] = {
 	RTD1295_FUNC(pll_test),
 	RTD1295_FUNC(scpu_ejtag_loc_cr),
 	RTD1295_FUNC(sd_card),
-	RTD1295_FUNC(sdio),
+	RTD1295_FUNC(sdio_0),
+	RTD1295_FUNC(sdio_1),
 };
 
 #undef RTD1295_FUNC
@@ -1277,34 +1400,34 @@ static const struct rtd119x_pin_desc rtd1295_cr_muxes[] = {
 
 	RTK_PIN_MUX(sdio_cmd, 0x04, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
-		RTK_PIN_FUNC(0x1 << 0, "sdio")),
+		RTK_PIN_FUNC(0x1 << 0, "sdio_0")),
 	RTK_PIN_MUX(sdio_clk, 0x04, GENMASK(3, 2),
 		RTK_PIN_FUNC(0x0 << 2, "gpio"),
-		RTK_PIN_FUNC(0x1 << 2, "sdio")),
+		RTK_PIN_FUNC(0x1 << 2, "sdio_0")),
 	RTK_PIN_MUX(sdio_data_0, 0x04, GENMASK(5, 4),
 		RTK_PIN_FUNC(0x0 << 4, "gpio"),
-		RTK_PIN_FUNC(0x1 << 4, "sdio")),
+		RTK_PIN_FUNC(0x1 << 4, "sdio_0")),
 	RTK_PIN_MUX(sdio_data_1, 0x04, GENMASK(7, 6),
 		RTK_PIN_FUNC(0x0 << 6, "gpio"),
-		RTK_PIN_FUNC(0x1 << 6, "sdio")),
+		RTK_PIN_FUNC(0x1 << 6, "sdio_0")),
 	RTK_PIN_MUX(sdio_data_2, 0x04, GENMASK(9, 8),
 		RTK_PIN_FUNC(0x0 << 8, "gpio"),
-		RTK_PIN_FUNC(0x1 << 8, "sdio")),
+		RTK_PIN_FUNC(0x1 << 8, "sdio_0")),
 	RTK_PIN_MUX(sdio_data_3, 0x04, GENMASK(11, 10),
 		RTK_PIN_FUNC(0x0 << 10, "gpio"),
-		RTK_PIN_FUNC(0x1 << 10, "sdio")),
+		RTK_PIN_FUNC(0x1 << 10, "sdio_0")),
 	RTK_PIN_MUX(emmc_dd_sb, 0x04, GENMASK(13, 12),
 		RTK_PIN_FUNC(0x0 << 12, "gpio"),
 		RTK_PIN_FUNC(0x2 << 12, "emmc")),
 	RTK_PIN_MUX(mmc_cmd, 0x04, GENMASK(17, 16),
 		RTK_PIN_FUNC(0x0 << 16, "gpio"),
 		RTK_PIN_FUNC(0x1 << 16, "sd_card"),
-		RTK_PIN_FUNC(0x2 << 16, "sdio"),
+		RTK_PIN_FUNC(0x2 << 16, "sdio_1"),
 		RTK_PIN_FUNC(0x3 << 16, "scpu_ejtag_loc_cr")),
 	RTK_PIN_MUX(mmc_clk, 0x04, GENMASK(19, 18),
 		RTK_PIN_FUNC(0x0 << 18, "gpio"),
 		RTK_PIN_FUNC(0x1 << 18, "sd_card"),
-		RTK_PIN_FUNC(0x2 << 18, "sdio"),
+		RTK_PIN_FUNC(0x2 << 18, "sdio_1"),
 		RTK_PIN_FUNC(0x3 << 18, "scpu_ejtag_loc_cr")),
 	RTK_PIN_MUX(mmc_wp, 0x04, GENMASK(21, 20),
 		RTK_PIN_FUNC(0x0 << 20, "gpio"),
@@ -1316,22 +1439,25 @@ static const struct rtd119x_pin_desc rtd1295_cr_muxes[] = {
 	RTK_PIN_MUX(mmc_data_0, 0x04, GENMASK(25, 24),
 		RTK_PIN_FUNC(0x0 << 24, "gpio"),
 		RTK_PIN_FUNC(0x1 << 24, "sd_card"),
-		RTK_PIN_FUNC(0x2 << 24, "sdio"),
+		RTK_PIN_FUNC(0x2 << 24, "sdio_1"),
 		RTK_PIN_FUNC(0x3 << 24, "scpu_ejtag_loc_cr")),
 	RTK_PIN_MUX(mmc_data_1, 0x04, GENMASK(27, 26),
 		RTK_PIN_FUNC(0x0 << 26, "gpio"),
 		RTK_PIN_FUNC(0x1 << 26, "sd_card"),
-		RTK_PIN_FUNC(0x2 << 26, "sdio")),
+		RTK_PIN_FUNC(0x2 << 26, "sdio_1")),
 	RTK_PIN_MUX(mmc_data_2, 0x04, GENMASK(29, 28),
 		RTK_PIN_FUNC(0x0 << 28, "gpio"),
 		RTK_PIN_FUNC(0x1 << 28, "sd_card"),
-		RTK_PIN_FUNC(0x2 << 28, "sdio")),
+		RTK_PIN_FUNC(0x2 << 28, "sdio_1")),
 	RTK_PIN_MUX(mmc_data_3, 0x04, GENMASK(31, 30),
 		RTK_PIN_FUNC(0x0 << 30, "gpio"),
 		RTK_PIN_FUNC(0x1 << 30, "sd_card"),
-		RTK_PIN_FUNC(0x2 << 30, "sdio"),
+		RTK_PIN_FUNC(0x2 << 30, "sdio_1"),
 		RTK_PIN_FUNC(0x3 << 30, "scpu_ejtag_loc_cr")),
 
+	RTK_PIN_MUX(sdio_loc, 0x1c, GENMASK(1, 0),
+		RTK_PIN_FUNC(0x0 << 0, "sdio_0"),
+		RTK_PIN_FUNC(0x1 << 0, "sdio_1")),
 	RTK_PIN_MUX(pcie_clkreq_0, 0x1c, GENMASK(3, 2),
 		RTK_PIN_FUNC(0x0 << 2, "gpio"),
 		RTK_PIN_FUNC(0x1 << 2, "pcie")),
-- 
2.28.0

