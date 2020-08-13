Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E518124354E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgHMHtn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:49:43 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39160 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgHMHtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:49:31 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D7n9fN5028965, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D7n9fN5028965
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
Subject: [PATCH v3 3/9] pinctrl: realtek: rtd1195: Add missed pins and pin configs.
Date:   Thu, 13 Aug 2020 15:49:02 +0800
Message-ID: <20200813074908.889-4-tychang@realtek.com>
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

Add missed pins and pin configs for Realtek DHC SoC RTD1195 pinctrl driver.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 drivers/pinctrl/pinctrl-rtd1195.h | 332 +++++++++++++++++++++++-------
 1 file changed, 258 insertions(+), 74 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rtd1195.h b/drivers/pinctrl/pinctrl-rtd1195.h
index 8eaab8a0dbf3..9f3471d02221 100644
--- a/drivers/pinctrl/pinctrl-rtd1195.h
+++ b/drivers/pinctrl/pinctrl-rtd1195.h
@@ -23,6 +23,11 @@ enum rtd1195_iso_pins {
 	RTD1195_ISO_ETN_LED_RXTX,
 	RTD1195_ISO_I2C_SCL_6,
 	RTD1195_ISO_I2C_SDA_6,
+	RTD1195_ISO_AI_LOC,
+	RTD1195_ISO_EJTAG_AVCPU_LOC,
+	RTD1195_ISO_UR1_LOC,
+	RTD1195_ISO_PWM_01_OPEN_DRAIN,
+	RTD1195_ISO_PWM_23_OPEN_DRAIN,
 };
 
 static const struct pinctrl_pin_desc rtd1195_iso_pins[] = {
@@ -47,6 +52,11 @@ static const struct pinctrl_pin_desc rtd1195_iso_pins[] = {
 	PINCTRL_PIN(RTD1195_ISO_ETN_LED_RXTX, "etn_led_rxtx"),
 	PINCTRL_PIN(RTD1195_ISO_I2C_SCL_6, "i2c_scl_6"),
 	PINCTRL_PIN(RTD1195_ISO_I2C_SDA_6, "i2c_sda_6"),
+	PINCTRL_PIN(RTD1195_ISO_AI_LOC, "ai_loc"),
+	PINCTRL_PIN(RTD1195_ISO_EJTAG_AVCPU_LOC, "ejtag_avcpu_loc"),
+	PINCTRL_PIN(RTD1195_ISO_UR1_LOC, "ur1_loc"),
+	PINCTRL_PIN(RTD1195_ISO_PWM_01_OPEN_DRAIN, "pwm_01_open_drain"),
+	PINCTRL_PIN(RTD1195_ISO_PWM_23_OPEN_DRAIN, "pwm_23_open_drain"),
 };
 
 static const unsigned int rtd1195_iso_gpio_0_pins[] = { RTD1195_ISO_GPIO_0 };
@@ -70,6 +80,12 @@ static const unsigned int rtd1195_etn_led_link_pins[] = { RTD1195_ISO_ETN_LED_LI
 static const unsigned int rtd1195_etn_led_rxtx_pins[] = { RTD1195_ISO_ETN_LED_RXTX };
 static const unsigned int rtd1195_i2c_scl_6_pins[] = { RTD1195_ISO_I2C_SCL_6 };
 static const unsigned int rtd1195_i2c_sda_6_pins[] = { RTD1195_ISO_I2C_SDA_6 };
+static const unsigned int rtd1195_ai_loc_pins[] = { RTD1195_ISO_AI_LOC };
+static const unsigned int rtd1195_ejtag_avcpu_loc_pins[] = { RTD1195_ISO_EJTAG_AVCPU_LOC };
+static const unsigned int rtd1195_ur1_loc_pins[] = { RTD1195_ISO_UR1_LOC };
+static const unsigned int rtd1195_pwm_01_open_drain_pins[] = { RTD1195_ISO_PWM_01_OPEN_DRAIN };
+static const unsigned int rtd1195_pwm_23_open_drain_pins[] = { RTD1195_ISO_PWM_23_OPEN_DRAIN };
+
 
 #define RTD1195_GROUP(_name) \
 	{ \
@@ -100,6 +116,11 @@ static const struct rtd119x_pin_group_desc rtd1195_iso_pin_groups[] = {
 	RTD1195_GROUP(etn_led_rxtx),
 	RTD1195_GROUP(i2c_scl_6),
 	RTD1195_GROUP(i2c_sda_6),
+	RTD1195_GROUP(ai_loc),
+	RTD1195_GROUP(ejtag_avcpu_loc),
+	RTD1195_GROUP(ur1_loc),
+	RTD1195_GROUP(pwm_01_open_drain),
+	RTD1195_GROUP(pwm_23_open_drain),
 };
 
 static const char * const rtd1195_iso_gpio_groups[] = {
@@ -112,13 +133,22 @@ static const char * const rtd1195_iso_gpio_groups[] = {
 	"etn_led_link", "etn_led_rxtx",
 	"i2c_scl_6", "i2c_sda_6",
 };
-static const char * const rtd1195_iso_ai_groups[] = {
-	"usb0", "usb1", "vfd_cs_n", "vfd_clk",
-	"ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n"
+static const char * const rtd1195_iso_ai_ur1_groups[] = {
+	"ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n", "ai_loc"
+};
+
+static const char * const rtd1195_iso_ai_vfd_groups[] = {
+	"usb0", "usb1", "vfd_cs_n", "vfd_clk", "ai_loc"
+};
+
+static const char * const rtd1195_iso_avcpu_ejtag_iso_groups[] = {
+	"vfd_cs_n", "vfd_clk", "vfd_d", "usb0", "usb1", "ejtag_avcpu_loc"
 };
-static const char * const rtd1195_iso_avcpu_ejtag_groups[] = {
-	"vfd_cs_n", "vfd_clk", "vfd_d", "usb0", "usb1"
+static const char * const rtd1195_iso_avcpu_ejtag_misc_loc_groups[] = {
+	"ejtag_avcpu_loc"
 };
+
+
 static const char * const rtd1195_iso_etn_led_groups[] = { "etn_led_link", "etn_led_rxtx" };
 static const char * const rtd1195_iso_i2c0_groups[] = { "i2c_scl_0", "i2c_sda_0" };
 static const char * const rtd1195_iso_i2c2_groups[] = { "vfd_d" };
@@ -131,8 +161,16 @@ static const char * const rtd1195_iso_pwm_groups[] = {
 };
 static const char * const rtd1195_iso_standby_dbg_groups[] = { "ir_rx", "usb0", "usb1" };
 static const char * const rtd1195_iso_uart0_groups[] = { "ur0_rx", "ur0_tx" };
-static const char * const rtd1195_iso_uart1_groups[] = { "ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n" };
+static const char * const rtd1195_iso_uart1_groups[] = { "ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n", "ur1_loc" };
+static const char * const rtd1195_iso_ur1_misc_groups[] = { "ur1_loc" };
 static const char * const rtd1195_iso_vfd_groups[] = { "vfd_cs_n", "vfd_clk", "vfd_d" };
+static const char * const rtd1195_iso_pwm_01_normal_groups[] = { "pwm_01_open_drain" };
+static const char * const rtd1195_iso_pwm_23_normal_groups[] = { "pwm_23_open_drain" };
+static const char * const rtd1195_iso_pwm_01_open_drain_groups[] = { "pwm_01_open_drain" };
+static const char * const rtd1195_iso_pwm_23_open_drain_groups[] = { "pwm_23_open_drain" };
+
+
+
 
 #define RTD1195_FUNC(_name) \
 	{ \
@@ -143,8 +181,10 @@ static const char * const rtd1195_iso_vfd_groups[] = { "vfd_cs_n", "vfd_clk", "v
 
 static const struct rtd119x_pin_func_desc rtd1195_iso_pin_functions[] = {
 	RTD1195_FUNC(gpio),
-	RTD1195_FUNC(ai),
-	RTD1195_FUNC(avcpu_ejtag),
+	RTD1195_FUNC(ai_ur1),
+	RTD1195_FUNC(ai_vfd),
+	RTD1195_FUNC(avcpu_ejtag_iso),
+	RTD1195_FUNC(avcpu_ejtag_misc_loc),
 	RTD1195_FUNC(etn_led),
 	RTD1195_FUNC(i2c0),
 	RTD1195_FUNC(i2c2),
@@ -156,7 +196,12 @@ static const struct rtd119x_pin_func_desc rtd1195_iso_pin_functions[] = {
 	RTD1195_FUNC(standby_dbg),
 	RTD1195_FUNC(uart0),
 	RTD1195_FUNC(uart1),
+	RTD1195_FUNC(ur1_misc),
 	RTD1195_FUNC(vfd),
+	RTD1195_FUNC(pwm_01_normal),
+	RTD1195_FUNC(pwm_23_normal),
+	RTD1195_FUNC(pwm_01_open_drain),
+	RTD1195_FUNC(pwm_23_open_drain),
 };
 
 #undef RTD1195_FUNC
@@ -166,17 +211,17 @@ static const struct rtd119x_pin_desc rtd1195_iso_muxes[] = {
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
 		RTK_PIN_FUNC(0x1 << 0, "vfd"),
 		RTK_PIN_FUNC(0x2 << 0, "i2c2"),
-		RTK_PIN_FUNC(0x3 << 0, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 0, "avcpu_ejtag_iso")),
 	RTK_PIN_MUX(vfd_clk, 0x10, GENMASK(3, 2),
 		RTK_PIN_FUNC(0x0 << 2, "gpio"),
 		RTK_PIN_FUNC(0x1 << 2, "vfd"),
-		RTK_PIN_FUNC(0x2 << 2, "ai"),
-		RTK_PIN_FUNC(0x3 << 2, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x2 << 2, "ai_vfd"),
+		RTK_PIN_FUNC(0x3 << 2, "avcpu_ejtag_iso")),
 	RTK_PIN_MUX(vfd_cs_n, 0x10, GENMASK(5, 4),
 		RTK_PIN_FUNC(0x0 << 4, "gpio"),
 		RTK_PIN_FUNC(0x1 << 4, "vfd"),
-		RTK_PIN_FUNC(0x2 << 4, "ai"),
-		RTK_PIN_FUNC(0x3 << 4, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x2 << 4, "ai_vfd"),
+		RTK_PIN_FUNC(0x3 << 4, "avcpu_ejtag_iso")),
 	RTK_PIN_MUX(ir_rx, 0x10, GENMASK(7, 6),
 		RTK_PIN_FUNC(0x0 << 6, "gpio"),
 		RTK_PIN_FUNC(0x1 << 6, "ir_rx"),
@@ -184,31 +229,31 @@ static const struct rtd119x_pin_desc rtd1195_iso_muxes[] = {
 	RTK_PIN_MUX(usb0, 0x10, GENMASK(9, 8),
 		RTK_PIN_FUNC(0x0 << 8, "gpio"),
 		RTK_PIN_FUNC(0x1 << 8, "standby_dbg"),
-		RTK_PIN_FUNC(0x2 << 8, "ai"),
-		RTK_PIN_FUNC(0x3 << 8, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x2 << 8, "ai_vfd"),
+		RTK_PIN_FUNC(0x3 << 8, "avcpu_ejtag_iso")),
 	RTK_PIN_MUX(usb1, 0x10, GENMASK(11, 10),
 		RTK_PIN_FUNC(0x0 << 10, "gpio"),
 		RTK_PIN_FUNC(0x1 << 10, "standby_dbg"),
-		RTK_PIN_FUNC(0x2 << 10, "ai"),
-		RTK_PIN_FUNC(0x3 << 10, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x2 << 10, "ai_vfd"),
+		RTK_PIN_FUNC(0x3 << 10, "avcpu_ejtag_iso")),
 	RTK_PIN_MUX(ur1_rx, 0x10, GENMASK(13, 12),
 		RTK_PIN_FUNC(0x0 << 12, "gpio"),
 		RTK_PIN_FUNC(0x1 << 12, "uart1"),
-		RTK_PIN_FUNC(0x2 << 12, "ai"),
+		RTK_PIN_FUNC(0x2 << 12, "ai_ur1"),
 		RTK_PIN_FUNC(0x3 << 12, "pwm")),
 	RTK_PIN_MUX(ur1_tx, 0x10, GENMASK(15, 14),
 		RTK_PIN_FUNC(0x0 << 14, "gpio"),
 		RTK_PIN_FUNC(0x1 << 14, "uart1"),
-		RTK_PIN_FUNC(0x2 << 14, "ai"),
+		RTK_PIN_FUNC(0x2 << 14, "ai_ur1"),
 		RTK_PIN_FUNC(0x3 << 14, "pwm")),
 	RTK_PIN_MUX(ur1_rts_n, 0x10, GENMASK(17, 16),
 		RTK_PIN_FUNC(0x0 << 16, "gpio"),
 		RTK_PIN_FUNC(0x1 << 16, "uart1"),
-		RTK_PIN_FUNC(0x2 << 16, "ai")),
+		RTK_PIN_FUNC(0x2 << 16, "ai_ur1")),
 	RTK_PIN_MUX(ur1_cts_n, 0x10, GENMASK(19, 18),
 		RTK_PIN_FUNC(0x0 << 18, "gpio"),
 		RTK_PIN_FUNC(0x1 << 18, "uart1"),
-		RTK_PIN_FUNC(0x2 << 18, "ai")),
+		RTK_PIN_FUNC(0x2 << 18, "ai_ur1")),
 	RTK_PIN_MUX(ur0_rx, 0x10, GENMASK(21, 20),
 		RTK_PIN_FUNC(0x0 << 20, "gpio"),
 		RTK_PIN_FUNC(0x1 << 20, "uart0"),
@@ -242,13 +287,44 @@ static const struct rtd119x_pin_desc rtd1195_iso_muxes[] = {
 		RTK_PIN_FUNC(0x0 << 4, "gpio"),
 		RTK_PIN_FUNC(0x1 << 4, "ir_tx"),
 		RTK_PIN_FUNC(0x2 << 4, "i2c3")),
-	/* pwm_23_open_drain_switch */
-	/* pwm_01_open_drain_switch */
-	/* ur1_loc */
-	/* ejtag_avcpu_loc */
-	/* ai_loc */
+	RTK_PIN_MUX(pwm_23_open_drain, 0x14, GENMASK(24, 24),
+		RTK_PIN_FUNC(0x0 << 24, "pwm_23_normal"),
+		RTK_PIN_FUNC(0x1 << 24, "pwm_23_open_drain")),
+	RTK_PIN_MUX(pwm_01_open_drain, 0x14, GENMASK(25, 25),
+		RTK_PIN_FUNC(0x0 << 25, "pwm_01_normal"),
+		RTK_PIN_FUNC(0x1 << 25, "pwm_01_open_drain")),
+	RTK_PIN_MUX(ur1_loc, 0x14, GENMASK(27, 26),
+		RTK_PIN_FUNC(0x1 << 26, "uart1"),
+		RTK_PIN_FUNC(0x2 << 26, "ur1_misc")),
+	RTK_PIN_MUX(ejtag_avcpu_loc, 0x14, GENMASK(29, 28),
+		RTK_PIN_FUNC(0x1 << 28, "avcpu_ejtag_iso"),
+		RTK_PIN_FUNC(0x2 << 28, "avcpu_ejtag_misc_loc")),
+	RTK_PIN_MUX(ai_loc, 0x14, GENMASK(31, 30),
+		RTK_PIN_FUNC(0x1 << 30, "ai_ur1"),
+		RTK_PIN_FUNC(0x2 << 30, "ai_vfd")),
+};
+
+static const struct rtd119x_pin_config_desc rtd1195_iso_configs[] = {
+	RTK_PIN_CONFIG(ir_rx, 0x0, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(vfd_cs_n, 0x0, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(vfd_clk, 0x0, 16, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(vfd_d, 0x0, 20, 1, 0, 2, 3, PADDRI_2_4),
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
 };
 
+
 static const struct rtd119x_pinctrl_desc rtd1195_iso_pinctrl_desc = {
 	.pins = rtd1195_iso_pins,
 	.num_pins = ARRAY_SIZE(rtd1195_iso_pins),
@@ -258,6 +334,8 @@ static const struct rtd119x_pinctrl_desc rtd1195_iso_pinctrl_desc = {
 	.num_functions = ARRAY_SIZE(rtd1195_iso_pin_functions),
 	.muxes = rtd1195_iso_muxes,
 	.num_muxes = ARRAY_SIZE(rtd1195_iso_muxes),
+	.configs = rtd1195_iso_configs,
+	.num_configs = ARRAY_SIZE(rtd1195_iso_configs),
 };
 
 /* CRT */
@@ -323,6 +401,9 @@ enum rtd1195_crt_pins {
 	RTD1195_SENSOR_RST,
 	RTD1195_SENSOR_STB_0,
 	RTD1195_SENSOR_STB_1,
+	RTD1195_EJTAG_SCPU_LOC,
+	RTD1195_HI_LOC,
+	RTD1195_AO_LOC,
 };
 
 static const struct pinctrl_pin_desc rtd1195_crt_pins[] = {
@@ -386,6 +467,9 @@ static const struct pinctrl_pin_desc rtd1195_crt_pins[] = {
 	PINCTRL_PIN(RTD1195_SENSOR_RST, "sensor_rst"),
 	PINCTRL_PIN(RTD1195_SENSOR_STB_0, "sensor_stb_0"),
 	PINCTRL_PIN(RTD1195_SENSOR_STB_1, "sensor_stb_1"),
+	PINCTRL_PIN(RTD1195_EJTAG_SCPU_LOC, "ejtag_scpu_loc"),
+	PINCTRL_PIN(RTD1195_HI_LOC, "hif_loc"),
+	PINCTRL_PIN(RTD1195_AO_LOC, "ao_loc"),
 };
 
 static const unsigned int rtd1195_gpio_0_pins[] = { RTD1195_GPIO_0 };
@@ -448,6 +532,14 @@ static const unsigned int rtd1195_sensor_cko_1_pins[] = { RTD1195_SENSOR_CKO_1 }
 static const unsigned int rtd1195_sensor_rst_pins[] = { RTD1195_SENSOR_RST };
 static const unsigned int rtd1195_sensor_stb_0_pins[] = { RTD1195_SENSOR_STB_0 };
 static const unsigned int rtd1195_sensor_stb_1_pins[] = { RTD1195_SENSOR_STB_1 };
+static const unsigned int rtd1195_ejtag_scpu_loc_pins[] = { RTD1195_EJTAG_SCPU_LOC };
+static const unsigned int rtd1195_hif_loc_pins[] = { RTD1195_HI_LOC };
+static const unsigned int rtd1195_ao_loc_pins[] = { RTD1195_AO_LOC };
+
+
+
+
+
 
 #define RTD1195_GROUP(_name) \
 	{ \
@@ -517,6 +609,9 @@ static const struct rtd119x_pin_group_desc rtd1195_crt_pin_groups[] = {
 	RTD1195_GROUP(sensor_rst),
 	RTD1195_GROUP(sensor_stb_0),
 	RTD1195_GROUP(sensor_stb_1),
+	RTD1195_GROUP(ejtag_scpu_loc),
+	RTD1195_GROUP(hif_loc),
+	RTD1195_GROUP(ao_loc),
 };
 
 static const char * const rtd1195_crt_gpio_groups[] = {
@@ -540,11 +635,16 @@ static const char * const rtd1195_crt_gpio_groups[] = {
 	"sensor_stb_0", "sensor_stb_1",
 };
 
-static const char * const rtd1195_crt_ao_groups[] = {
-	"gpio_4", "gpio_5", "gpio_6", "gpio_7",
-	"tp0_data", "tp0_sync", "tp0_valid", "tp0_clk",
+static const char * const rtd1195_crt_ao_tp0_groups[] = {
+	"tp0_data", "tp0_sync", "tp0_valid", "tp0_clk", "ao_loc"
+};
+
+static const char * const rtd1195_crt_ao_gpio_groups[] = {
+	"gpio_4", "gpio_5", "gpio_6", "gpio_7", "ao_loc"
 };
-static const char * const rtd1195_crt_avcpu_ejtag_groups[] = {
+
+
+static const char * const rtd1195_crt_avcpu_ejtag_misc_groups[] = {
 	"nf_rdy", "nf_rd_n", "nf_dd_5", "nf_dd_6", "nf_dd_7"
 };
 static const char * const rtd1195_crt_cpu_loop_groups[] = { "usb_id" };
@@ -555,10 +655,15 @@ static const char * const rtd1195_crt_emmc_groups[] = {
 static const char * const rtd1195_crt_gspi_groups[] = {
 	"gpio_0", "gpio_1", "gpio_2", "gpio_3",
 };
-static const char * const rtd1195_crt_hif_groups[] = {
-	"gpio_0", "gpio_1", "gpio_2", "gpio_3",
-	"nf_dd_4", "nf_wr_n", "nf_ale", "nf_cle",
+static const char * const rtd1195_crt_hif_nf_groups[] = {
+	"nf_dd_4", "nf_wr_n", "nf_ale", "nf_cle", "hif_loc"
 };
+
+static const char * const rtd1195_crt_hif_misc_groups[] = {
+	"gpio_0", "gpio_1", "gpio_2", "gpio_3", "hif_loc"
+};
+
+
 static const char * const rtd1195_crt_i2c1_groups[] = { "i2c_scl_1", "i2c_sda_1" };
 static const char * const rtd1195_crt_i2c2_groups[] = { "tp1_sync", "tp1_clk" };
 static const char * const rtd1195_crt_i2c3_groups[] = { "tp1_data", "tp1_valid" };
@@ -572,9 +677,13 @@ static const char * const rtd1195_crt_nand_groups[] = {
 	"nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3", "nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7",
 	"nf_rdy", "nf_rd_n", "nf_wr_n", "nf_ale", "nf_cle", "nf_ce_n_0", "nf_ce_n_1",
 };
-static const char * const rtd1195_crt_scpu_ejtag_groups[] = {
-	"mmc_data_0", "mmc_data_3", "mmc_clk", "mmc_cmd", "mmc_wp"
+static const char * const rtd1195_crt_scpu_ejtag_gpio_groups[] = {
+	"gpio_4", "gpio_5", "gpio_6", "gpio_7", "gpio_8", "ejtag_scpu_loc"
+};
+static const char * const rtd1195_crt_scpu_ejtag_cr_groups[] = {
+	"mmc_data_0", "mmc_data_3", "mmc_clk", "mmc_cmd", "mmc_wp", "ejtag_scpu_loc"
 };
+
 static const char * const rtd1195_crt_sdio_groups[] = {
 	"sdio_clk", "sdio_data_0", "sdio_data_1", "sdio_data_2", "sdio_data_3", "sdio_cmd",
 };
@@ -598,12 +707,14 @@ static const char * const rtd1195_crt_usb_groups[] = { "sensor_cko_1" };
 
 static const struct rtd119x_pin_func_desc rtd1195_crt_pin_functions[] = {
 	RTD1195_FUNC(gpio),
-	RTD1195_FUNC(ao),
-	RTD1195_FUNC(avcpu_ejtag),
+	RTD1195_FUNC(ao_tp0),
+	RTD1195_FUNC(ao_gpio),
+	RTD1195_FUNC(avcpu_ejtag_misc),
 	RTD1195_FUNC(cpu_loop),
 	RTD1195_FUNC(emmc),
 	RTD1195_FUNC(gspi),
-	RTD1195_FUNC(hif),
+	RTD1195_FUNC(hif_misc),
+	RTD1195_FUNC(hif_nf),
 	RTD1195_FUNC(i2c1),
 	RTD1195_FUNC(i2c2),
 	RTD1195_FUNC(i2c3),
@@ -611,7 +722,8 @@ static const struct rtd119x_pin_func_desc rtd1195_crt_pin_functions[] = {
 	RTD1195_FUNC(i2c5),
 	RTD1195_FUNC(mmc),
 	RTD1195_FUNC(nand),
-	RTD1195_FUNC(scpu_ejtag),
+	RTD1195_FUNC(scpu_ejtag_gpio),
+	RTD1195_FUNC(scpu_ejtag_cr),
 	RTD1195_FUNC(sdio),
 	RTD1195_FUNC(sensor),
 	RTD1195_FUNC(spdif),
@@ -628,27 +740,27 @@ static const struct rtd119x_pin_desc rtd1195_crt_muxes[] = {
 		RTK_PIN_FUNC(0x0 << 2, "gpio"),
 		RTK_PIN_FUNC(0x1 << 2, "nand"),
 		RTK_PIN_FUNC(0x2 << 2, "emmc"),
-		RTK_PIN_FUNC(0x3 << 2, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 2, "avcpu_ejtag_misc")),
 	RTK_PIN_MUX(nf_rd_n, 0x60, GENMASK(5, 4),
 		RTK_PIN_FUNC(0x0 << 4, "gpio"),
 		RTK_PIN_FUNC(0x1 << 4, "nand"),
 		RTK_PIN_FUNC(0x2 << 4, "emmc"),
-		RTK_PIN_FUNC(0x3 << 4, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 4, "avcpu_ejtag_misc")),
 	RTK_PIN_MUX(nf_wr_n, 0x60, GENMASK(7, 6),
 		RTK_PIN_FUNC(0x0 << 6, "gpio"),
 		RTK_PIN_FUNC(0x1 << 6, "nand"),
 		RTK_PIN_FUNC(0x2 << 6, "emmc"),
-		RTK_PIN_FUNC(0x3 << 6, "hif")),
+		RTK_PIN_FUNC(0x3 << 6, "hif_nf")),
 	RTK_PIN_MUX(nf_ale, 0x60, GENMASK(9, 8),
 		RTK_PIN_FUNC(0x0 << 8, "gpio"),
 		RTK_PIN_FUNC(0x1 << 8, "nand"),
 		RTK_PIN_FUNC(0x2 << 8, "emmc"),
-		RTK_PIN_FUNC(0x3 << 8, "hif")),
+		RTK_PIN_FUNC(0x3 << 8, "hif_nf")),
 	RTK_PIN_MUX(nf_cle, 0x60, GENMASK(11, 10),
 		RTK_PIN_FUNC(0x0 << 10, "gpio"),
 		RTK_PIN_FUNC(0x1 << 10, "nand"),
 		RTK_PIN_FUNC(0x2 << 10, "emmc"),
-		RTK_PIN_FUNC(0x3 << 10, "hif")),
+		RTK_PIN_FUNC(0x3 << 10, "hif_nf")),
 	RTK_PIN_MUX(nf_ce_n_0, 0x60, GENMASK(13, 12),
 		RTK_PIN_FUNC(0x0 << 12, "gpio"),
 		RTK_PIN_FUNC(0x1 << 12, "nand")),
@@ -675,22 +787,22 @@ static const struct rtd119x_pin_desc rtd1195_crt_muxes[] = {
 		RTK_PIN_FUNC(0x0 << 24, "gpio"),
 		RTK_PIN_FUNC(0x1 << 24, "nand"),
 		RTK_PIN_FUNC(0x2 << 24, "emmc"),
-		RTK_PIN_FUNC(0x3 << 24, "hif")),
+		RTK_PIN_FUNC(0x3 << 24, "hif_nf")),
 	RTK_PIN_MUX(nf_dd_5, 0x60, GENMASK(27, 26),
 		RTK_PIN_FUNC(0x0 << 26, "gpio"),
 		RTK_PIN_FUNC(0x1 << 26, "nand"),
 		RTK_PIN_FUNC(0x2 << 26, "emmc"),
-		RTK_PIN_FUNC(0x3 << 26, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 26, "avcpu_ejtag_misc")),
 	RTK_PIN_MUX(nf_dd_6, 0x60, GENMASK(29, 28),
 		RTK_PIN_FUNC(0x0 << 28, "gpio"),
 		RTK_PIN_FUNC(0x1 << 28, "nand"),
 		RTK_PIN_FUNC(0x2 << 28, "emmc"),
-		RTK_PIN_FUNC(0x3 << 28, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 28, "avcpu_ejtag_misc")),
 	RTK_PIN_MUX(nf_dd_7, 0x60, GENMASK(31, 30),
 		RTK_PIN_FUNC(0x0 << 30, "gpio"),
 		RTK_PIN_FUNC(0x1 << 30, "nand"),
 		RTK_PIN_FUNC(0x2 << 30, "emmc"),
-		RTK_PIN_FUNC(0x3 << 30, "avcpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 30, "avcpu_ejtag_misc")),
 
 	RTK_PIN_MUX(sdio_cmd, 0x64, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
@@ -714,22 +826,22 @@ static const struct rtd119x_pin_desc rtd1195_crt_muxes[] = {
 	RTK_PIN_MUX(mmc_cmd, 0x64, GENMASK(17, 16),
 		RTK_PIN_FUNC(0x0 << 16, "gpio"),
 		RTK_PIN_FUNC(0x1 << 16, "mmc"),
-		RTK_PIN_FUNC(0x3 << 16, "scpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 16, "scpu_ejtag_cr")),
 	RTK_PIN_MUX(mmc_clk, 0x64, GENMASK(19, 18),
 		RTK_PIN_FUNC(0x0 << 18, "gpio"),
 		RTK_PIN_FUNC(0x1 << 18, "mmc"),
-		RTK_PIN_FUNC(0x3 << 18, "scpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 18, "scpu_ejtag_cr")),
 	RTK_PIN_MUX(mmc_wp, 0x64, GENMASK(21, 20),
 		RTK_PIN_FUNC(0x0 << 20, "gpio"),
 		RTK_PIN_FUNC(0x1 << 20, "mmc"),
-		RTK_PIN_FUNC(0x3 << 20, "scpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 20, "scpu_ejtag_cr")),
 	RTK_PIN_MUX(mmc_cd, 0x64, GENMASK(23, 22),
 		RTK_PIN_FUNC(0x0 << 22, "gpio"),
 		RTK_PIN_FUNC(0x1 << 22, "mmc")),
 	RTK_PIN_MUX(mmc_data_0, 0x64, GENMASK(25, 24),
 		RTK_PIN_FUNC(0x0 << 24, "gpio"),
 		RTK_PIN_FUNC(0x1 << 24, "mmc"),
-		RTK_PIN_FUNC(0x3 << 24, "scpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 24, "scpu_ejtag_cr")),
 	RTK_PIN_MUX(mmc_data_1, 0x64, GENMASK(27, 26),
 		RTK_PIN_FUNC(0x0 << 26, "gpio"),
 		RTK_PIN_FUNC(0x1 << 26, "mmc")),
@@ -739,28 +851,28 @@ static const struct rtd119x_pin_desc rtd1195_crt_muxes[] = {
 	RTK_PIN_MUX(mmc_data_3, 0x64, GENMASK(31, 30),
 		RTK_PIN_FUNC(0x0 << 30, "gpio"),
 		RTK_PIN_FUNC(0x1 << 30, "mmc"),
-		RTK_PIN_FUNC(0x3 << 30, "scpu_ejtag")),
+		RTK_PIN_FUNC(0x3 << 30, "scpu_ejtag_cr")),
 
 	RTK_PIN_MUX(tp0_data, 0x68, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "tp0"),
 		RTK_PIN_FUNC(0x1 << 0, "tp1"),
 		RTK_PIN_FUNC(0x2 << 0, "gpio"),
-		RTK_PIN_FUNC(0x3 << 0, "ao")),
+		RTK_PIN_FUNC(0x3 << 0, "ao_tp0")),
 	RTK_PIN_MUX(tp0_sync, 0x68, GENMASK(3, 2),
 		RTK_PIN_FUNC(0x0 << 2, "tp0"),
 		RTK_PIN_FUNC(0x1 << 2, "tp1"),
 		RTK_PIN_FUNC(0x2 << 2, "gpio"),
-		RTK_PIN_FUNC(0x3 << 2, "ao")),
+		RTK_PIN_FUNC(0x3 << 2, "ao_tp0")),
 	RTK_PIN_MUX(tp0_valid, 0x68, GENMASK(5, 4),
 		RTK_PIN_FUNC(0x0 << 4, "tp0"),
 		RTK_PIN_FUNC(0x1 << 4, "tp1"),
 		RTK_PIN_FUNC(0x2 << 4, "gpio"),
-		RTK_PIN_FUNC(0x3 << 4, "ao")),
+		RTK_PIN_FUNC(0x3 << 4, "ao_tp0")),
 	RTK_PIN_MUX(tp0_clk, 0x68, GENMASK(7, 6),
 		RTK_PIN_FUNC(0x0 << 6, "tp0"),
 		RTK_PIN_FUNC(0x1 << 6, "tp1"),
 		RTK_PIN_FUNC(0x2 << 6, "gpio"),
-		RTK_PIN_FUNC(0x3 << 6, "ao")),
+		RTK_PIN_FUNC(0x3 << 6, "ao_tp0")),
 	RTK_PIN_MUX(tp1_data, 0x68, GENMASK(17, 16),
 		RTK_PIN_FUNC(0x0 << 16, "tp1"),
 		RTK_PIN_FUNC(0x1 << 16, "tp0"),
@@ -810,8 +922,12 @@ static const struct rtd119x_pin_desc rtd1195_crt_muxes[] = {
 	RTK_PIN_MUX(usb_id, 0x6c, GENMASK(17, 16),
 		RTK_PIN_FUNC(0x1 << 16, "gpio"),
 		RTK_PIN_FUNC(0x2 << 16, "cpu_loop")),
-	/* hi_loc */
-	/* ejtag_scpu_loc */
+	RTK_PIN_MUX(hif_loc, 0x6c, GENMASK(19, 18),
+		RTK_PIN_FUNC(0x1 << 18, "hif_misc"),
+		RTK_PIN_FUNC(0x2 << 18, "hif_nf")),
+	RTK_PIN_MUX(ejtag_scpu_loc, 0x6c, GENMASK(21, 20),
+		RTK_PIN_FUNC(0x1 << 20, "scpu_ejtag_gpio"),
+		RTK_PIN_FUNC(0x2 << 20, "scpu_ejtag_cr")),
 	RTK_PIN_MUX(sensor_stb_1, 0x6c, GENMASK(23, 22),
 		RTK_PIN_FUNC(0x0 << 22, "gpio")),
 	RTK_PIN_MUX(sensor_stb_0, 0x6c, GENMASK(25, 24),
@@ -829,47 +945,113 @@ static const struct rtd119x_pin_desc rtd1195_crt_muxes[] = {
 	RTK_PIN_MUX(gpio_0, 0x70, GENMASK(2, 0),
 		RTK_PIN_FUNC(0x1 << 0, "gpio"),
 		RTK_PIN_FUNC(0x2 << 0, "uart1"),
-		RTK_PIN_FUNC(0x3 << 0, "hif"),
+		RTK_PIN_FUNC(0x3 << 0, "hif_misc"),
 		RTK_PIN_FUNC(0x4 << 0, "gspi")),
 	RTK_PIN_MUX(gpio_1, 0x70, GENMASK(5, 3),
 		RTK_PIN_FUNC(0x1 << 3, "gpio"),
 		RTK_PIN_FUNC(0x2 << 3, "uart1"),
-		RTK_PIN_FUNC(0x3 << 3, "hif"),
+		RTK_PIN_FUNC(0x3 << 3, "hif_misc"),
 		RTK_PIN_FUNC(0x4 << 3, "gspi")),
 	RTK_PIN_MUX(gpio_2, 0x70, GENMASK(8, 6),
 		RTK_PIN_FUNC(0x1 << 6, "gpio"),
 		RTK_PIN_FUNC(0x2 << 6, "uart1"),
-		RTK_PIN_FUNC(0x3 << 6, "hif"),
+		RTK_PIN_FUNC(0x3 << 6, "hif_misc"),
 		RTK_PIN_FUNC(0x4 << 6, "gspi")),
 	RTK_PIN_MUX(gpio_3, 0x70, GENMASK(11, 9),
 		RTK_PIN_FUNC(0x1 << 9, "gpio"),
 		RTK_PIN_FUNC(0x2 << 9, "uart1"),
-		RTK_PIN_FUNC(0x3 << 9, "hif"),
+		RTK_PIN_FUNC(0x3 << 9, "hif_misc"),
 		RTK_PIN_FUNC(0x4 << 9, "gspi")),
 	RTK_PIN_MUX(gpio_4, 0x70, GENMASK(13, 12),
 		RTK_PIN_FUNC(0x1 << 12, "gpio"),
-		RTK_PIN_FUNC(0x2 << 12, "scpu_ejtag"),
-		RTK_PIN_FUNC(0x3 << 12, "ao")),
+		RTK_PIN_FUNC(0x2 << 12, "scpu_ejtag_gpio"),
+		RTK_PIN_FUNC(0x3 << 12, "ao_gpio")),
 	RTK_PIN_MUX(gpio_5, 0x70, GENMASK(15, 14),
 		RTK_PIN_FUNC(0x1 << 14, "gpio"),
-		RTK_PIN_FUNC(0x2 << 14, "scpu_ejtag"),
-		RTK_PIN_FUNC(0x3 << 14, "ao")),
+		RTK_PIN_FUNC(0x2 << 14, "scpu_ejtag_gpio"),
+		RTK_PIN_FUNC(0x3 << 14, "ao_gpio")),
 	RTK_PIN_MUX(gpio_6, 0x70, GENMASK(17, 16),
 		RTK_PIN_FUNC(0x1 << 16, "gpio"),
-		RTK_PIN_FUNC(0x2 << 16, "scpu_ejtag"),
-		RTK_PIN_FUNC(0x3 << 16, "ao")),
+		RTK_PIN_FUNC(0x2 << 16, "scpu_ejtag_gpio"),
+		RTK_PIN_FUNC(0x3 << 16, "ao_gpio")),
 	RTK_PIN_MUX(gpio_7, 0x70, GENMASK(19, 18),
 		RTK_PIN_FUNC(0x1 << 18, "gpio"),
-		RTK_PIN_FUNC(0x2 << 18, "scpu_ejtag"),
-		RTK_PIN_FUNC(0x3 << 18, "ao")),
+		RTK_PIN_FUNC(0x2 << 18, "scpu_ejtag_gpio"),
+		RTK_PIN_FUNC(0x3 << 18, "ao_gpio")),
 	RTK_PIN_MUX(gpio_8, 0x70, GENMASK(21, 20),
 		RTK_PIN_FUNC(0x1 << 20, "gpio"),
-		RTK_PIN_FUNC(0x2 << 20, "scpu_ejtag")),
+		RTK_PIN_FUNC(0x2 << 20, "scpu_ejtag_gpio")),
+	RTK_PIN_MUX(ao_loc, 0x74, GENMASK(3, 2),
+		RTK_PIN_FUNC(0x1 << 2, "ao_tp0"),
+		RTK_PIN_FUNC(0x2 << 2, "ao_gpio")),
+};
 
-	/* sf_en */
-	/* ao_loc */
+static const struct rtd119x_pin_config_desc rtd1195_crt_configs[] = {
+	RTK_PIN_CONFIG(nf_ale, 0x78, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_ce_n_0, 0x78, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_ce_n_1, 0x78, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_rdy, 0x78, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_rd_n, 0x78, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_wr_n, 0x78, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_cle, 0x78, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_dd_0, 0x7c, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_dd_1, 0x7c, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_dd_2, 0x7c, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_dd_3, 0x7c, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_dd_4, 0x7c, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_dd_5, 0x7c, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_dd_6, 0x7c, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(nf_dd_7, 0x7c, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_cmd, 0x80, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_clk, 0x80, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_wp, 0x80, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_cd, 0x80, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_data_0, 0x80, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_data_1, 0x80, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_data_2, 0x80, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(mmc_data_3, 0x80, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sdio_cmd, 0x84, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sdio_clk, 0x84, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sdio_wp, 0x84, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sdio_cd, 0x84, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sdio_data_0, 0x84, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sdio_data_1, 0x84, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sdio_data_2, 0x84, 24, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(sdio_data_3, 0x84, 28, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(spdif, 0x88, 0, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(tp0_clk, 0x8c, 0, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(tp0_sync, 0x8c, 4, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(tp0_valid, 0x8c, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(tp0_data, 0x8c, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(tp1_clk, 0x90, 0, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(tp1_sync, 0x90, 4, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(tp1_valid, 0x90, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(tp1_data, 0x90, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(i2c_sda_1, 0x94, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_scl_1, 0x94, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_sda_4, 0x94, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_scl_4, 0x94, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_sda_5, 0x94, 16, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(i2c_scl_5, 0x94, 20, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_0, 0x98, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_1, 0x98, 4, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_2, 0x98, 8, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_3, 0x98, 12, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(gpio_4, 0x98, 16, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(gpio_5, 0x98, 20, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(gpio_6, 0x98, 24, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(gpio_7, 0x98, 28, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(gpio_8, 0x9c, 0, 1, 0, 2, 3, PADDRI_4_8),
+	RTK_PIN_CONFIG(hdmi_hpd, 0x9c, 4, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(usb_id, 0x9c, 8, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(sensor_stb_0, 0x9c, 12, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(sensor_stb_1, 0x9c, 16, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(sensor_rst, 0x9c, 20, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(sensor_cko_0, 0x9c, 24, 1, 0, 2, 3, PADDRI_2_4),
+	RTK_PIN_CONFIG(sensor_cko_1, 0x9c, 28, 1, 0, 2, 3, PADDRI_2_4),
 };
 
+
 static const struct rtd119x_pinctrl_desc rtd1195_crt_pinctrl_desc = {
 	.pins = rtd1195_crt_pins,
 	.num_pins = ARRAY_SIZE(rtd1195_crt_pins),
@@ -879,6 +1061,8 @@ static const struct rtd119x_pinctrl_desc rtd1195_crt_pinctrl_desc = {
 	.num_functions = ARRAY_SIZE(rtd1195_crt_pin_functions),
 	.muxes = rtd1195_crt_muxes,
 	.num_muxes = ARRAY_SIZE(rtd1195_crt_muxes),
+	.configs = rtd1195_crt_configs,
+	.num_configs = ARRAY_SIZE(rtd1195_crt_configs),
 };
 
 #endif
-- 
2.28.0

