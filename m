Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9907243544
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgHMHtn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:49:43 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39183 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgHMHtd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:49:33 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D7nAfL5028965, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D7nAfL5028965
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 13 Aug 2020 15:49:10 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 13 Aug 2020 15:49:09 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 7/9] pinctrl: realtek: DHC: Fix pinctrl driver coding style according to checkpatch.pl.
Date:   Thu, 13 Aug 2020 15:49:06 +0800
Message-ID: <20200813074908.889-8-tychang@realtek.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813074908.889-1-tychang@realtek.com>
References: <20200813074908.889-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix Realtek DHC SoC pinctrl driver coding style.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 drivers/pinctrl/pinctrl-rtd1195.h | 131 +++++++---
 drivers/pinctrl/pinctrl-rtd119x.c | 125 +++++----
 drivers/pinctrl/pinctrl-rtd1295.h | 407 ++++++++++++++++++++++--------
 3 files changed, 467 insertions(+), 196 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rtd1195.h b/drivers/pinctrl/pinctrl-rtd1195.h
index 9f3471d02221..f0dd91f416e8 100644
--- a/drivers/pinctrl/pinctrl-rtd1195.h
+++ b/drivers/pinctrl/pinctrl-rtd1195.h
@@ -1,3 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause */
+
+/*
+ * Realtek RTD1195 pin controller driver
+ *
+ * Copyright (c) 2019 Realtek Semiconductor Corp.
+ */
+
 #ifndef PINCTRL_RTD1195_H
 #define PINCTRL_RTD1195_H
 
@@ -76,15 +84,20 @@ static const unsigned int rtd1195_ur1_cts_n_pins[] = { RTD1195_ISO_UR1_CTS_N };
 static const unsigned int rtd1195_ur1_rts_n_pins[] = { RTD1195_ISO_UR1_RTS_N };
 static const unsigned int rtd1195_i2c_scl_0_pins[] = { RTD1195_ISO_I2C_SCL_0 };
 static const unsigned int rtd1195_i2c_sda_0_pins[] = { RTD1195_ISO_I2C_SDA_0 };
-static const unsigned int rtd1195_etn_led_link_pins[] = { RTD1195_ISO_ETN_LED_LINK };
-static const unsigned int rtd1195_etn_led_rxtx_pins[] = { RTD1195_ISO_ETN_LED_RXTX };
+static const unsigned int rtd1195_etn_led_link_pins[] = {
+				RTD1195_ISO_ETN_LED_LINK };
+static const unsigned int rtd1195_etn_led_rxtx_pins[] = {
+				RTD1195_ISO_ETN_LED_RXTX };
 static const unsigned int rtd1195_i2c_scl_6_pins[] = { RTD1195_ISO_I2C_SCL_6 };
 static const unsigned int rtd1195_i2c_sda_6_pins[] = { RTD1195_ISO_I2C_SDA_6 };
 static const unsigned int rtd1195_ai_loc_pins[] = { RTD1195_ISO_AI_LOC };
-static const unsigned int rtd1195_ejtag_avcpu_loc_pins[] = { RTD1195_ISO_EJTAG_AVCPU_LOC };
+static const unsigned int rtd1195_ejtag_avcpu_loc_pins[] = {
+				RTD1195_ISO_EJTAG_AVCPU_LOC };
 static const unsigned int rtd1195_ur1_loc_pins[] = { RTD1195_ISO_UR1_LOC };
-static const unsigned int rtd1195_pwm_01_open_drain_pins[] = { RTD1195_ISO_PWM_01_OPEN_DRAIN };
-static const unsigned int rtd1195_pwm_23_open_drain_pins[] = { RTD1195_ISO_PWM_23_OPEN_DRAIN };
+static const unsigned int rtd1195_pwm_01_open_drain_pins[] = {
+				RTD1195_ISO_PWM_01_OPEN_DRAIN };
+static const unsigned int rtd1195_pwm_23_open_drain_pins[] = {
+				RTD1195_ISO_PWM_23_OPEN_DRAIN };
 
 
 #define RTD1195_GROUP(_name) \
@@ -148,26 +161,46 @@ static const char * const rtd1195_iso_avcpu_ejtag_misc_loc_groups[] = {
 	"ejtag_avcpu_loc"
 };
 
-
-static const char * const rtd1195_iso_etn_led_groups[] = { "etn_led_link", "etn_led_rxtx" };
-static const char * const rtd1195_iso_i2c0_groups[] = { "i2c_scl_0", "i2c_sda_0" };
+static const char * const rtd1195_iso_etn_led_groups[] = {
+	"etn_led_link", "etn_led_rxtx"
+};
+static const char * const rtd1195_iso_i2c0_groups[] = {
+	"i2c_scl_0", "i2c_sda_0"
+};
 static const char * const rtd1195_iso_i2c2_groups[] = { "vfd_d" };
 static const char * const rtd1195_iso_i2c3_groups[] = { "ir_tx" };
-static const char * const rtd1195_iso_i2c6_groups[] = { "i2c_scl_6", "i2c_sda_6" };
+static const char * const rtd1195_iso_i2c6_groups[] = {
+	"i2c_scl_6", "i2c_sda_6"
+};
 static const char * const rtd1195_iso_ir_rx_groups[] = { "ir_rx" };
 static const char * const rtd1195_iso_ir_tx_groups[] = { "ir_tx" };
 static const char * const rtd1195_iso_pwm_groups[] = {
 	"ur0_rx", "ur0_tx", "ur1_rx", "ur1_tx", "etn_led_link", "etn_led_rxtx"
 };
-static const char * const rtd1195_iso_standby_dbg_groups[] = { "ir_rx", "usb0", "usb1" };
+static const char * const rtd1195_iso_standby_dbg_groups[] = {
+	"ir_rx", "usb0", "usb1"
+};
 static const char * const rtd1195_iso_uart0_groups[] = { "ur0_rx", "ur0_tx" };
-static const char * const rtd1195_iso_uart1_groups[] = { "ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n", "ur1_loc" };
+static const char * const rtd1195_iso_uart1_groups[] = {
+	"ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n", "ur1_loc"
+};
 static const char * const rtd1195_iso_ur1_misc_groups[] = { "ur1_loc" };
-static const char * const rtd1195_iso_vfd_groups[] = { "vfd_cs_n", "vfd_clk", "vfd_d" };
-static const char * const rtd1195_iso_pwm_01_normal_groups[] = { "pwm_01_open_drain" };
-static const char * const rtd1195_iso_pwm_23_normal_groups[] = { "pwm_23_open_drain" };
-static const char * const rtd1195_iso_pwm_01_open_drain_groups[] = { "pwm_01_open_drain" };
-static const char * const rtd1195_iso_pwm_23_open_drain_groups[] = { "pwm_23_open_drain" };
+static const char * const rtd1195_iso_vfd_groups[] = {
+	"vfd_cs_n", "vfd_clk", "vfd_d"
+};
+static const char * const rtd1195_iso_pwm_01_normal_groups[] = {
+	"pwm_01_open_drain"
+};
+static const char * const rtd1195_iso_pwm_23_normal_groups[] = {
+	"pwm_23_open_drain"
+};
+static const char * const rtd1195_iso_pwm_01_open_drain_groups[] = {
+	"pwm_01_open_drain"
+};
+static const char * const rtd1195_iso_pwm_23_open_drain_groups[] = {
+	"pwm_23_open_drain"
+
+};
 
 
 
@@ -527,12 +560,17 @@ static const unsigned int rtd1195_i2c_scl_1_pins[] = { RTD1195_I2C_SCL_1 };
 static const unsigned int rtd1195_i2c_sda_1_pins[] = { RTD1195_I2C_SDA_1 };
 static const unsigned int rtd1195_i2c_scl_4_pins[] = { RTD1195_I2C_SCL_4 };
 static const unsigned int rtd1195_i2c_sda_4_pins[] = { RTD1195_I2C_SDA_4 };
-static const unsigned int rtd1195_sensor_cko_0_pins[] = { RTD1195_SENSOR_CKO_0 };
-static const unsigned int rtd1195_sensor_cko_1_pins[] = { RTD1195_SENSOR_CKO_1 };
+static const unsigned int rtd1195_sensor_cko_0_pins[] = {
+					RTD1195_SENSOR_CKO_0 };
+static const unsigned int rtd1195_sensor_cko_1_pins[] = {
+					RTD1195_SENSOR_CKO_1 };
 static const unsigned int rtd1195_sensor_rst_pins[] = { RTD1195_SENSOR_RST };
-static const unsigned int rtd1195_sensor_stb_0_pins[] = { RTD1195_SENSOR_STB_0 };
-static const unsigned int rtd1195_sensor_stb_1_pins[] = { RTD1195_SENSOR_STB_1 };
-static const unsigned int rtd1195_ejtag_scpu_loc_pins[] = { RTD1195_EJTAG_SCPU_LOC };
+static const unsigned int rtd1195_sensor_stb_0_pins[] = {
+					RTD1195_SENSOR_STB_0 };
+static const unsigned int rtd1195_sensor_stb_1_pins[] = {
+					RTD1195_SENSOR_STB_1 };
+static const unsigned int rtd1195_ejtag_scpu_loc_pins[] = {
+					RTD1195_EJTAG_SCPU_LOC };
 static const unsigned int rtd1195_hif_loc_pins[] = { RTD1195_HI_LOC };
 static const unsigned int rtd1195_ao_loc_pins[] = { RTD1195_AO_LOC };
 
@@ -617,11 +655,14 @@ static const struct rtd119x_pin_group_desc rtd1195_crt_pin_groups[] = {
 static const char * const rtd1195_crt_gpio_groups[] = {
 	"gpio_0", "gpio_1", "gpio_2", "gpio_3",
 	"gpio_4", "gpio_5", "gpio_6", "gpio_7", "gpio_8",
-	"nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3", "nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7",
-	"nf_rdy", "nf_rd_n", "nf_wr_n", "nf_ale", "nf_cle", "nf_ce_n_0", "nf_ce_n_1",
+	"nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3",
+	"nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7",
+	"nf_rdy", "nf_rd_n", "nf_wr_n", "nf_ale",
+	"nf_cle", "nf_ce_n_0", "nf_ce_n_1",
 	"mmc_data_0", "mmc_data_1", "mmc_data_2", "mmc_data_3",
 	"mmc_clk", "mmc_cmd", "mmc_wp", "mmc_cd",
-	"sdio_clk", "sdio_data_0", "sdio_data_1", "sdio_data_2", "sdio_data_3", "sdio_cmd",
+	"sdio_clk", "sdio_data_0", "sdio_data_1",
+	"sdio_data_2", "sdio_data_3", "sdio_cmd",
 	"i2c_scl_5", "i2c_sda_5",
 	"tp1_data", "tp1_clk", "tp1_valid", "tp1_sync",
 	"tp0_data", "tp0_clk", "tp0_valid", "tp0_sync",
@@ -649,7 +690,8 @@ static const char * const rtd1195_crt_avcpu_ejtag_misc_groups[] = {
 };
 static const char * const rtd1195_crt_cpu_loop_groups[] = { "usb_id" };
 static const char * const rtd1195_crt_emmc_groups[] = {
-	"nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3", "nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7",
+	"nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3",
+	"nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7",
 	"nf_rdy", "nf_rd_n", "nf_wr_n", "nf_ale", "nf_cle",
 };
 static const char * const rtd1195_crt_gspi_groups[] = {
@@ -664,30 +706,45 @@ static const char * const rtd1195_crt_hif_misc_groups[] = {
 };
 
 
-static const char * const rtd1195_crt_i2c1_groups[] = { "i2c_scl_1", "i2c_sda_1" };
-static const char * const rtd1195_crt_i2c2_groups[] = { "tp1_sync", "tp1_clk" };
-static const char * const rtd1195_crt_i2c3_groups[] = { "tp1_data", "tp1_valid" };
-static const char * const rtd1195_crt_i2c4_groups[] = { "i2c_scl_4", "i2c_sda_4" };
-static const char * const rtd1195_crt_i2c5_groups[] = { "i2c_scl_5", "i2c_sda_5" };
+static const char * const rtd1195_crt_i2c1_groups[] = {
+	"i2c_scl_1", "i2c_sda_1"
+};
+static const char * const rtd1195_crt_i2c2_groups[] = {
+	"tp1_sync", "tp1_clk"
+};
+static const char * const rtd1195_crt_i2c3_groups[] = {
+	"tp1_data", "tp1_valid" };
+static const char * const rtd1195_crt_i2c4_groups[] = {
+	"i2c_scl_4", "i2c_sda_4"
+};
+static const char * const rtd1195_crt_i2c5_groups[] = {
+	"i2c_scl_5", "i2c_sda_5"
+};
 static const char * const rtd1195_crt_mmc_groups[] = {
 	"mmc_data_0", "mmc_data_1", "mmc_data_2", "mmc_data_3",
 	"mmc_clk", "mmc_cmd", "mmc_wp", "mmc_cd",
 };
 static const char * const rtd1195_crt_nand_groups[] = {
-	"nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3", "nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7",
-	"nf_rdy", "nf_rd_n", "nf_wr_n", "nf_ale", "nf_cle", "nf_ce_n_0", "nf_ce_n_1",
+	"nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3",
+	"nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7",
+	"nf_rdy", "nf_rd_n", "nf_wr_n", "nf_ale",
+	"nf_cle", "nf_ce_n_0", "nf_ce_n_1",
 };
 static const char * const rtd1195_crt_scpu_ejtag_gpio_groups[] = {
 	"gpio_4", "gpio_5", "gpio_6", "gpio_7", "gpio_8", "ejtag_scpu_loc"
 };
 static const char * const rtd1195_crt_scpu_ejtag_cr_groups[] = {
-	"mmc_data_0", "mmc_data_3", "mmc_clk", "mmc_cmd", "mmc_wp", "ejtag_scpu_loc"
+	"mmc_data_0", "mmc_data_3", "mmc_clk",
+	"mmc_cmd", "mmc_wp", "ejtag_scpu_loc"
 };
 
 static const char * const rtd1195_crt_sdio_groups[] = {
-	"sdio_clk", "sdio_data_0", "sdio_data_1", "sdio_data_2", "sdio_data_3", "sdio_cmd",
+	"sdio_clk", "sdio_data_0", "sdio_data_1",
+	"sdio_data_2", "sdio_data_3", "sdio_cmd",
+};
+static const char * const rtd1195_crt_sensor_groups[] = {
+	"sensor_cko_0", "sensor_cko_1"
 };
-static const char * const rtd1195_crt_sensor_groups[] = { "sensor_cko_0", "sensor_cko_1" };
 static const char * const rtd1195_crt_spdif_groups[] = { "spdif" };
 static const char * const rtd1195_crt_tp0_groups[] = {
 	"tp0_data", "tp0_clk", "tp0_valid", "tp0_sync",
@@ -695,7 +752,9 @@ static const char * const rtd1195_crt_tp0_groups[] = {
 static const char * const rtd1195_crt_tp1_groups[] = {
 	"tp1_data", "tp1_clk", "tp1_valid", "tp1_sync",
 };
-static const char * const rtd1195_crt_uart1_groups[] = { "gpio_0", "gpio_1", "gpio_2", "gpio_3" };
+static const char * const rtd1195_crt_uart1_groups[] = {
+	"gpio_0", "gpio_1", "gpio_2", "gpio_3"
+};
 static const char * const rtd1195_crt_usb_groups[] = { "sensor_cko_1" };
 
 #define RTD1195_FUNC(_name) \
diff --git a/drivers/pinctrl/pinctrl-rtd119x.c b/drivers/pinctrl/pinctrl-rtd119x.c
index e8c818c38b83..26e88050e9ed 100644
--- a/drivers/pinctrl/pinctrl-rtd119x.c
+++ b/drivers/pinctrl/pinctrl-rtd119x.c
@@ -1,9 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
 /*
- * Copyright (c) 2017 Andreas Färber
+ * Realtek DHC pin controller driver
  *
- * SPDX-License-Identifier: GPL-2.0+
+ * Copyright (c) 2019 Realtek Semiconductor Corp.
  */
 
+
 #include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -151,7 +154,7 @@ static int rtd119x_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
 }
 
 static const char *rtd119x_pinctrl_get_group_name(struct pinctrl_dev *pcdev,
-		unsigned selector)
+		unsigned int selector)
 {
 	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
@@ -159,7 +162,8 @@ static const char *rtd119x_pinctrl_get_group_name(struct pinctrl_dev *pcdev,
 }
 
 static int rtd119x_pinctrl_get_group_pins(struct pinctrl_dev *pcdev,
-		unsigned selector, const unsigned **pins, unsigned *num_pins)
+		unsigned int selector, const unsigned int **pins,
+		unsigned int *num_pins)
 {
 	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
@@ -185,7 +189,7 @@ static int rtd119x_pinctrl_get_functions_count(struct pinctrl_dev *pcdev)
 }
 
 static const char *rtd119x_pinctrl_get_function_name(struct pinctrl_dev *pcdev,
-		unsigned selector)
+		unsigned int selector)
 {
 	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
@@ -193,8 +197,8 @@ static const char *rtd119x_pinctrl_get_function_name(struct pinctrl_dev *pcdev,
 }
 
 static int rtd119x_pinctrl_get_function_groups(struct pinctrl_dev *pcdev,
-		unsigned selector, const char * const **groups,
-		unsigned * const num_groups)
+		unsigned int selector, const char * const **groups,
+		unsigned int * const num_groups)
 {
 	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
@@ -204,7 +208,8 @@ static int rtd119x_pinctrl_get_function_groups(struct pinctrl_dev *pcdev,
 	return 0;
 }
 
-static const struct pinctrl_pin_desc *rtd119x_pinctrl_get_pin_by_number(struct rtd119x_pinctrl *data, int number)
+static const struct pinctrl_pin_desc *rtd119x_pinctrl_get_pin_by_number(
+		struct rtd119x_pinctrl *data, int number)
 {
 	int i;
 
@@ -216,7 +221,8 @@ static const struct pinctrl_pin_desc *rtd119x_pinctrl_get_pin_by_number(struct r
 	return NULL;
 }
 
-static const struct rtd119x_pin_desc *rtd119x_pinctrl_find_mux(struct rtd119x_pinctrl *data, const char *name)
+static const struct rtd119x_pin_desc *rtd119x_pinctrl_find_mux(
+		struct rtd119x_pinctrl *data, const char *name)
 {
 	int i;
 
@@ -228,7 +234,8 @@ static const struct rtd119x_pin_desc *rtd119x_pinctrl_find_mux(struct rtd119x_pi
 	return NULL;
 }
 
-static const struct rtd119x_pin_config_desc *rtd119x_pinctrl_find_config(struct rtd119x_pinctrl *data, const char *name)
+static const struct rtd119x_pin_config_desc *rtd119x_pinctrl_find_config(
+		struct rtd119x_pinctrl *data, const char *name)
 {
 	int i;
 
@@ -275,7 +282,8 @@ static int rtd119x_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
 		return -ENOTSUPP;
 
 	if (!mux->functions) {
-		dev_err(pcdev->dev, "No functions available for pin %s\n", pin_name);
+		dev_err(pcdev->dev,
+			"No functions available for pin %s\n", pin_name);
 		return -ENOTSUPP;
 	}
 
@@ -290,12 +298,13 @@ static int rtd119x_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
 		return 0;
 	}
 
-	dev_err(pcdev->dev, "No function %s available for pin %s\n", func_name, pin_name);
+	dev_err(pcdev->dev, "No function %s available for pin %s\n",
+			func_name, pin_name);
 	return -EINVAL;
 }
 
 static int rtd119x_pinctrl_set_mux(struct pinctrl_dev *pcdev,
-		unsigned function, unsigned group)
+		unsigned int function, unsigned int group)
 {
 	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 	const unsigned int *pins;
@@ -309,7 +318,8 @@ static int rtd119x_pinctrl_set_mux(struct pinctrl_dev *pcdev,
 
 	ret = rtd119x_pinctrl_get_group_pins(pcdev, group, &pins, &num_pins);
 	if (ret) {
-		dev_err(pcdev->dev, "Getting pins for group %s failed\n", group_name);
+		dev_err(pcdev->dev, "Getting pins for group %s failed\n",
+			group_name);
 		return ret;
 	}
 
@@ -323,7 +333,7 @@ static int rtd119x_pinctrl_set_mux(struct pinctrl_dev *pcdev,
 }
 
 static int rtd119x_pinctrl_gpio_request_enable(struct pinctrl_dev *pcdev,
-	struct pinctrl_gpio_range *range, unsigned offset)
+	struct pinctrl_gpio_range *range, unsigned int offset)
 {
 	return rtd119x_pinctrl_set_one_mux(pcdev, offset, "gpio");
 }
@@ -413,9 +423,9 @@ static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
 				return -EINVAL;
 			break;
 		case PCONF_UNSUPP:
-			pr_err("[%s] not support drive strength\n", config_desc->name);
+			dev_err(data->pcdev->dev, "[%s] not support drive strength\n",
+				config_desc->name);
 			return -ENOTSUPP;
-			break;
 		default:
 			return -EINVAL;
 		}
@@ -450,7 +460,7 @@ static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
 	return 0;
 }
 
-static int rtd119x_pin_config_get(struct pinctrl_dev *pcdev, unsigned pinnr,
+static int rtd119x_pin_config_get(struct pinctrl_dev *pcdev, unsigned int pinnr,
 		unsigned long *config)
 {
 	unsigned int param = pinconf_to_config_param(*config);
@@ -465,8 +475,8 @@ static int rtd119x_pin_config_get(struct pinctrl_dev *pcdev, unsigned pinnr,
 	return 0;
 }
 
-static int rtd119x_pin_config_set(struct pinctrl_dev *pcdev, unsigned pinnr,
-		unsigned long *configs, unsigned num_configs)
+static int rtd119x_pin_config_set(struct pinctrl_dev *pcdev, unsigned int pinnr,
+		unsigned long *configs, unsigned int num_configs)
 {
 	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 	const struct pinctrl_pin_desc *pin_desc;
@@ -492,8 +502,8 @@ static int rtd119x_pin_config_set(struct pinctrl_dev *pcdev, unsigned pinnr,
 }
 
 
-static int rtd119x_pin_config_group_set(struct pinctrl_dev *pcdev, unsigned group,
-				unsigned long *configs, unsigned num_configs)
+static int rtd119x_pin_config_group_set(struct pinctrl_dev *pcdev,
+					unsigned int group, unsigned long *configs, unsigned int num_configs)
 {
 	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 	const unsigned int *pins;
@@ -516,7 +526,7 @@ static int rtd119x_pin_config_group_set(struct pinctrl_dev *pcdev, unsigned grou
 	}
 
 	return 0;
- }
+}
 
 
 static const struct pinconf_ops rtd119x_pinconf_ops = {
@@ -529,55 +539,66 @@ static const struct pinconf_ops rtd119x_pinconf_ops = {
 static void rtd119x_pinctrl_selftest(struct rtd119x_pinctrl *data)
 {
 	int i, j, k;
+	const struct rtd119x_pinctrl_desc *info = data->info;
 
-	for (i = 0; i < data->info->num_muxes; i++) {
+	for (i = 0; i < info->num_muxes; i++) {
 		/* Check for pin */
-		for (j = 0; j < data->info->num_pins; j++) {
-			if (strcmp(data->info->pins[j].name, data->info->muxes[i].name) == 0)
+		for (j = 0; j < info->num_pins; j++) {
+			if (strcmp(info->pins[j].name,
+				info->muxes[i].name) == 0)
 				break;
 		}
-		if (j == data->info->num_pins)
+		if (j == info->num_pins)
 			dev_warn(data->pcdev->dev, "Mux %s lacking matching pin\n",
-				 data->info->muxes[i].name);
+				info->muxes[i].name);
 
 		/* Check for group */
-		for (j = 0; j < data->info->num_groups; j++) {
-			if (strcmp(data->info->groups[j].name, data->info->muxes[i].name) == 0)
+		for (j = 0; j < info->num_groups; j++) {
+			if (strcmp(info->groups[j].name,
+				info->muxes[i].name) == 0)
 				break;
 		}
-		if (j == data->info->num_groups)
+		if (j == info->num_groups)
 			dev_warn(data->pcdev->dev, "Mux %s lacking matching group\n",
-				 data->info->muxes[i].name);
+				 info->muxes[i].name);
 
-		for (j = 0; data->info->muxes[i].functions[j].name; j++) {
+		for (j = 0; info->muxes[i].functions[j].name; j++) {
 			/* Check for function */
-			for (k = 0; k < data->info->num_functions; k++) {
-				if (strcmp(data->info->functions[k].name,
-					data->info->muxes[i].functions[j].name) == 0)
+			for (k = 0; k < info->num_functions; k++) {
+				if (strcmp(info->functions[k].name,
+					info->muxes[i].functions[j].name) == 0)
 					break;
 			}
-			if (k == data->info->num_functions)
+			if (k == info->num_functions)
 				dev_warn(data->pcdev->dev, "Mux %s lacking function %s\n",
-					 data->info->muxes[i].name,
-					 data->info->muxes[i].functions[j].name);
-
-			/* Check for duplicate mux value - assumption: ascending order */
-			if (j > 0 && data->info->muxes[i].functions[j].mux_value
-				< data->info->muxes[i].functions[j - 1].mux_value)
+					 info->muxes[i].name,
+					 info->muxes[i].functions[j].name);
+
+			/* Check for duplicate mux value
+			 *- assumption: ascending order
+			 */
+			if (j > 0 && info->muxes[i].functions[j].mux_value
+				< info->muxes[i].functions[j - 1].mux_value)
 				dev_warn(data->pcdev->dev, "Mux %s function %s has unexpected value\n",
-					 data->info->muxes[i].name,
-					 data->info->muxes[i].functions[j].name);
+					 info->muxes[i].name,
+					 info->muxes[i].functions[j].name);
 		}
 	}
 }
 
 static const struct of_device_id rtd119x_pinctrl_dt_ids[] = {
-	 { .compatible = "realtek,rtd1195-iso-pinctrl", .data = &rtd1195_iso_pinctrl_desc },
-	 { .compatible = "realtek,rtd1195-crt-pinctrl", .data = &rtd1195_crt_pinctrl_desc },
-	 { .compatible = "realtek,rtd1295-iso-pinctrl", .data = &rtd1295_iso_pinctrl_desc },
-	 { .compatible = "realtek,rtd1295-sb2-pinctrl", .data = &rtd1295_sb2_pinctrl_desc },
-	 { .compatible = "realtek,rtd1295-disp-pinctrl", .data = &rtd1295_disp_pinctrl_desc },
-	 { .compatible = "realtek,rtd1295-cr-pinctrl", .data = &rtd1295_cr_pinctrl_desc },
+	 { .compatible = "realtek,rtd1195-iso-pinctrl",
+		.data = &rtd1195_iso_pinctrl_desc },
+	 { .compatible = "realtek,rtd1195-crt-pinctrl",
+		.data = &rtd1195_crt_pinctrl_desc },
+	 { .compatible = "realtek,rtd1295-iso-pinctrl",
+		.data = &rtd1295_iso_pinctrl_desc },
+	 { .compatible = "realtek,rtd1295-sb2-pinctrl",
+		.data = &rtd1295_sb2_pinctrl_desc },
+	 { .compatible = "realtek,rtd1295-disp-pinctrl",
+		.data = &rtd1295_disp_pinctrl_desc },
+	 { .compatible = "realtek,rtd1295-cr-pinctrl",
+		.data = &rtd1295_cr_pinctrl_desc },
 	 { }
 };
 
@@ -630,3 +651,5 @@ static struct platform_driver rtd119x_pinctrl_driver = {
 	},
 };
 builtin_platform_driver(rtd119x_pinctrl_driver);
+MODULE_DESCRIPTION("rtk pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-rtd1295.h b/drivers/pinctrl/pinctrl-rtd1295.h
index 018d00345298..5c550bd8ee12 100644
--- a/drivers/pinctrl/pinctrl-rtd1295.h
+++ b/drivers/pinctrl/pinctrl-rtd1295.h
@@ -1,3 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause */
+
+/*
+ * Realtek pin controller driver
+ *
+ * Copyright (c) 2019 Realtek Semiconductor Corp.
+ */
+
 #ifndef PINCTRL_RTD1295_H
 #define PINCTRL_RTD1295_H
 
@@ -116,8 +124,10 @@ static const unsigned int rtd1295_iso_gpio_23_pins[] = { RTD1295_ISO_GPIO_23 };
 static const unsigned int rtd1295_iso_gpio_24_pins[] = { RTD1295_ISO_GPIO_24 };
 static const unsigned int rtd1295_iso_gpio_25_pins[] = { RTD1295_ISO_GPIO_25 };
 static const unsigned int rtd1295_i2c_sda_6_pins[] = { RTD1295_I2C_SDA_6 };
-static const unsigned int rtd1295_etn_led_link_pins[] = { RTD1295_ETN_LED_LINK };
-static const unsigned int rtd1295_etn_led_rxtx_pins[] = { RTD1295_ETN_LED_RXTX };
+static const unsigned int rtd1295_etn_led_link_pins[] = {
+				RTD1295_ETN_LED_LINK };
+static const unsigned int rtd1295_etn_led_rxtx_pins[] = {
+				RTD1295_ETN_LED_RXTX };
 static const unsigned int rtd1295_nat_led_0_pins[] = { RTD1295_NAT_LED_0 };
 static const unsigned int rtd1295_nat_led_1_pins[] = { RTD1295_NAT_LED_1 };
 static const unsigned int rtd1295_nat_led_2_pins[] = { RTD1295_NAT_LED_2 };
@@ -128,16 +138,31 @@ static const unsigned int rtd1295_pwm_23_loc0_pins[] = { RTD1295_PWM_23_LOC0 };
 static const unsigned int rtd1295_pwm_01_loc0_pins[] = { RTD1295_PWM_01_LOC0 };
 static const unsigned int rtd1295_pwm_23_loc1_pins[] = { RTD1295_PWM_23_LOC1 };
 static const unsigned int rtd1295_pwm_01_loc1_pins[] = { RTD1295_PWM_01_LOC1 };
-static const unsigned int rtd1295_ejtag_avcpu_loc_pins[] = { RTD1295_EJTAG_AVCPU_LOC };
+static const unsigned int rtd1295_ejtag_avcpu_loc_pins[] = {
+				RTD1295_EJTAG_AVCPU_LOC };
 static const unsigned int rtd1295_ur2_loc_pins[] = { RTD1295_UR2_LOC };
 
-static const unsigned int rtd1295_i2c0_pins[] = { RTD1295_I2C_SCL_0, RTD1295_I2C_SDA_0 };
-static const unsigned int rtd1295_i2c1_pins[] = { RTD1295_I2C_SCL_1, RTD1295_I2C_SDA_1 };
-static const unsigned int rtd1295_i2c6_pins[] = { RTD1295_I2C_SCL_6, RTD1295_I2C_SDA_6 };
-static const unsigned int rtd1295_uart0_pins[] = { RTD1295_UR0_RX, RTD1295_UR0_TX };
-static const unsigned int rtd1295_uart1_pins[] = { RTD1295_UR1_RX, RTD1295_UR1_TX };
-static const unsigned int rtd1295_uart2_0_pins[] = { RTD1295_ISO_GPIO_2, RTD1295_ISO_GPIO_3, RTD1295_ISO_GPIO_4, RTD1295_ISO_GPIO_5 };
-static const unsigned int rtd1295_uart2_1_pins[] = { RTD1295_ISO_GPIO_23, RTD1295_ISO_GPIO_24, RTD1295_ISO_GPIO_33, RTD1295_ISO_GPIO_34 };
+static const unsigned int rtd1295_i2c0_pins[] = {
+	RTD1295_I2C_SCL_0, RTD1295_I2C_SDA_0
+};
+static const unsigned int rtd1295_i2c1_pins[] = {
+	RTD1295_I2C_SCL_1, RTD1295_I2C_SDA_1
+};
+static const unsigned int rtd1295_i2c6_pins[] = {
+	RTD1295_I2C_SCL_6, RTD1295_I2C_SDA_6
+};
+static const unsigned int rtd1295_uart0_pins[] = {
+				RTD1295_UR0_RX, RTD1295_UR0_TX };
+static const unsigned int rtd1295_uart1_pins[] = {
+				RTD1295_UR1_RX, RTD1295_UR1_TX };
+static const unsigned int rtd1295_uart2_0_pins[] = {
+	RTD1295_ISO_GPIO_2, RTD1295_ISO_GPIO_3,
+	RTD1295_ISO_GPIO_4, RTD1295_ISO_GPIO_5
+};
+static const unsigned int rtd1295_uart2_1_pins[] = {
+	RTD1295_ISO_GPIO_23, RTD1295_ISO_GPIO_24,
+	RTD1295_ISO_GPIO_33, RTD1295_ISO_GPIO_34
+};
 
 #define RTD1295_GROUP(_name) \
 	{ \
@@ -199,41 +224,90 @@ static const struct rtd119x_pin_group_desc rtd1295_iso_pin_groups[] = {
 };
 
 static const char * const rtd1295_iso_gpio_groups[] = {
-	"iso_gpio_2", "iso_gpio_3", "iso_gpio_4", "iso_gpio_5", "hdmi_hpd", "iso_gpio_7",
-	"ir_rx", "ir_tx", "ur0_rx", "ur0_tx", "ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n",
+	"iso_gpio_2", "iso_gpio_3", "iso_gpio_4",
+	"iso_gpio_5", "hdmi_hpd", "iso_gpio_7",
+	"ir_rx", "ir_tx", "ur0_rx", "ur0_tx",
+	"ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n",
 	"i2c_scl_0", "i2c_sda_0", "i2c_scl_1", "i2c_sda_1", "i2c_scl_6",
-	"iso_gpio_21", "iso_gpio_22", "iso_gpio_23", "iso_gpio_24", "iso_gpio_25",
+	"iso_gpio_21", "iso_gpio_22", "iso_gpio_23",
+	"iso_gpio_24", "iso_gpio_25",
 	"i2c_sda_6", "etn_led_link", "etn_led_rxtx",
 	"nat_led_0", "nat_led_1", "nat_led_2", "nat_led_3",
 	"iso_gpio_33", "iso_gpio_34"
 };
-static const char * const rtd1295_iso_acpu_ejtag_loc_iso_groups[] = { "iso_gpio_2", "iso_gpio_3", "iso_gpio_4", "iso_gpio_5", "iso_gpio_7" };
+static const char * const rtd1295_iso_acpu_ejtag_loc_iso_groups[] = {
+	"iso_gpio_2", "iso_gpio_3", "iso_gpio_4", "iso_gpio_5", "iso_gpio_7"
+};
 static const char * const rtd1295_iso_edp_hpd_groups[] = { "iso_gpio_7" };
-static const char * const rtd1295_iso_etn_led_groups[] = { "etn_led_link", "etn_led_rxtx" };
-static const char * const rtd1295_iso_i2c0_groups[] = { "i2c_scl_0", "i2c_sda_0", "i2c0" };
-static const char * const rtd1295_iso_i2c1_groups[] = { "i2c_scl_1", "i2c_sda_1", "i2c1" };
-static const char * const rtd1295_iso_i2c6_groups[] = { "i2c_scl_6", "i2c_sda_6", "i2c6" };
+static const char * const rtd1295_iso_etn_led_groups[] = {
+	"etn_led_link", "etn_led_rxtx"
+};
+static const char * const rtd1295_iso_i2c0_groups[] = {
+	"i2c_scl_0", "i2c_sda_0", "i2c0"
+};
+static const char * const rtd1295_iso_i2c1_groups[] = {
+	"i2c_scl_1", "i2c_sda_1", "i2c1"
+};
+static const char * const rtd1295_iso_i2c6_groups[] = {
+	"i2c_scl_6", "i2c_sda_6", "i2c6"
+};
 static const char * const rtd1295_iso_ir_rx_groups[] = { "ir_rx" };
 static const char * const rtd1295_iso_ir_tx_groups[] = { "ir_tx" };
-static const char * const rtd1295_iso_nat_led_groups[] = { "nat_led_0", "nat_led_1", "nat_led_2", "nat_led_3" };
-static const char * const rtd1295_iso_pwm_1_groups[] = { "etn_led_link", "etn_led_rxtx", "nat_led_0", "nat_led_1" };
-static const char * const rtd1295_iso_pwm_0_groups[] = { "iso_gpio_21", "iso_gpio_22", "iso_gpio_23", "iso_gpio_24" };
+static const char * const rtd1295_iso_nat_led_groups[] = {
+	"nat_led_0", "nat_led_1", "nat_led_2", "nat_led_3"
+};
+static const char * const rtd1295_iso_pwm_1_groups[] = {
+	"etn_led_link", "etn_led_rxtx", "nat_led_0", "nat_led_1"
+};
+static const char * const rtd1295_iso_pwm_0_groups[] = {
+	"iso_gpio_21", "iso_gpio_22", "iso_gpio_23", "iso_gpio_24"
+};
 static const char * const rtd1295_iso_rtc_groups[] = { "iso_gpio_25" };
-static const char * const rtd1295_iso_sc_groups[] = { "nat_led_0", "nat_led_1", "nat_led_2", "nat_led_3" };
-static const char * const rtd1295_iso_standby_dbg_groups[] = { "iso_gpio_2", "iso_gpio_3", "ir_rx" };
-static const char * const rtd1295_iso_uart0_groups[] = { "ur0_rx", "ur0_tx", "uart0" };
-static const char * const rtd1295_iso_uart1_groups[] = { "ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n", "uart1" };
-static const char * const rtd1295_iso_uart2_0_groups[] = { "iso_gpio_2", "iso_gpio_3", "iso_gpio_4", "iso_gpio_5", "ur2_loc" };
-static const char * const rtd1295_iso_uart2_1_groups[] = { "iso_gpio_23", "iso_gpio_24", "iso_gpio_33", "iso_gpio_34", "ur2_loc" };
-static const char * const rtd1295_iso_pwm_01_loc0_normal_groups[] = { "pwm_01_loc0" };
-static const char * const rtd1295_iso_pwm_23_loc0_normal_groups[] = { "pwm_23_loc0" };
-static const char * const rtd1295_iso_pwm_01_loc0_open_drain_groups[] = { "pwm_01_loc0" };
-static const char * const rtd1295_iso_pwm_23_loc0_open_drain_groups[] = { "pwm_23_loc0" };
-static const char * const rtd1295_iso_pwm_01_loc1_normal_groups[] = { "pwm_01_loc1" };
-static const char * const rtd1295_iso_pwm_23_loc1_normal_groups[] = { "pwm_23_loc1" };
-static const char * const rtd1295_iso_pwm_01_loc1_open_drain_groups[] = { "pwm_01_loc1" };
-static const char * const rtd1295_iso_pwm_23_loc1_open_drain_groups[] = { "pwm_23_loc1" };
-static const char * const rtd1295_iso_acpu_ejtag_loc_nf_groups[] = { "ejtag_avcpu_loc" };
+static const char * const rtd1295_iso_sc_groups[] = {
+	"nat_led_0", "nat_led_1", "nat_led_2", "nat_led_3"
+};
+static const char * const rtd1295_iso_standby_dbg_groups[] = {
+	"iso_gpio_2", "iso_gpio_3", "ir_rx"
+};
+static const char * const rtd1295_iso_uart0_groups[] = {
+	"ur0_rx", "ur0_tx", "uart0"
+};
+static const char * const rtd1295_iso_uart1_groups[] = {
+	"ur1_rx", "ur1_tx", "ur1_cts_n", "ur1_rts_n", "uart1"
+};
+static const char * const rtd1295_iso_uart2_0_groups[] = {
+	"iso_gpio_2", "iso_gpio_3", "iso_gpio_4", "iso_gpio_5", "ur2_loc"
+};
+static const char * const rtd1295_iso_uart2_1_groups[] = {
+	"iso_gpio_23", "iso_gpio_24", "iso_gpio_33", "iso_gpio_34", "ur2_loc"
+};
+static const char * const rtd1295_iso_pwm_01_loc0_normal_groups[] = {
+	"pwm_01_loc0"
+};
+static const char * const rtd1295_iso_pwm_23_loc0_normal_groups[] = {
+	"pwm_23_loc0"
+};
+static const char * const rtd1295_iso_pwm_01_loc0_open_drain_groups[] = {
+	"pwm_01_loc0"
+};
+static const char * const rtd1295_iso_pwm_23_loc0_open_drain_groups[] = {
+	"pwm_23_loc0"
+};
+static const char * const rtd1295_iso_pwm_01_loc1_normal_groups[] = {
+	"pwm_01_loc1"
+};
+static const char * const rtd1295_iso_pwm_23_loc1_normal_groups[] = {
+	"pwm_23_loc1"
+};
+static const char * const rtd1295_iso_pwm_01_loc1_open_drain_groups[] = {
+	"pwm_01_loc1"
+};
+static const char * const rtd1295_iso_pwm_23_loc1_open_drain_groups[] = {
+	"pwm_23_loc1"
+};
+static const char * const rtd1295_iso_acpu_ejtag_loc_nf_groups[] = {
+	"ejtag_avcpu_loc"
+};
 
 
 #define RTD1295_FUNC(_name) \
@@ -608,11 +682,15 @@ static const unsigned int rtd1295_i2c_sda_4_pins[] = { RTD1295_I2C_SDA_4 };
 static const unsigned int rtd1295_i2c_scl_5_pins[] = { RTD1295_I2C_SCL_5 };
 static const unsigned int rtd1295_i2c_sda_5_pins[] = { RTD1295_I2C_SDA_5 };
 static const unsigned int rtd1295_usb_id_pins[] = { RTD1295_USB_ID };
-static const unsigned int rtd1295_sensor_cko_0_pins[] = { RTD1295_SENSOR_CKO_0 };
-static const unsigned int rtd1295_sensor_cko_1_pins[] = { RTD1295_SENSOR_CKO_1 };
+static const unsigned int rtd1295_sensor_cko_0_pins[] = {
+				RTD1295_SENSOR_CKO_0 };
+static const unsigned int rtd1295_sensor_cko_1_pins[] = {
+				RTD1295_SENSOR_CKO_1 };
 static const unsigned int rtd1295_sensor_rst_pins[] = { RTD1295_SENSOR_RST };
-static const unsigned int rtd1295_sensor_stb_0_pins[] = { RTD1295_SENSOR_STB_0 };
-static const unsigned int rtd1295_sensor_stb_1_pins[] = { RTD1295_SENSOR_STB_1 };
+static const unsigned int rtd1295_sensor_stb_0_pins[] = {
+				RTD1295_SENSOR_STB_0 };
+static const unsigned int rtd1295_sensor_stb_1_pins[] = {
+				RTD1295_SENSOR_STB_1 };
 static const unsigned int rtd1295_tp0_data_pins[] = { RTD1295_TP0_DATA };
 static const unsigned int rtd1295_tp0_clk_pins[] = { RTD1295_TP0_CLK };
 static const unsigned int rtd1295_tp0_valid_pins[] = { RTD1295_TP0_VALID };
@@ -621,33 +699,54 @@ static const unsigned int rtd1295_tp1_data_pins[] = { RTD1295_TP1_DATA };
 static const unsigned int rtd1295_tp1_clk_pins[] = { RTD1295_TP1_CLK };
 static const unsigned int rtd1295_tp1_valid_pins[] = { RTD1295_TP1_VALID };
 static const unsigned int rtd1295_rgmii0_txc_pins[] = { RTD1295_RGMII0_TXC };
-static const unsigned int rtd1295_rgmii0_tx_ctl_pins[] = { RTD1295_RGMII0_TX_CTL };
-static const unsigned int rtd1295_rgmii0_txd_0_pins[] = { RTD1295_RGMII0_TXD_0 };
-static const unsigned int rtd1295_rgmii0_txd_1_pins[] = { RTD1295_RGMII0_TXD_1 };
-static const unsigned int rtd1295_rgmii0_txd_2_pins[] = { RTD1295_RGMII0_TXD_2 };
-static const unsigned int rtd1295_rgmii0_txd_3_pins[] = { RTD1295_RGMII0_TXD_3 };
+static const unsigned int rtd1295_rgmii0_tx_ctl_pins[] = {
+				RTD1295_RGMII0_TX_CTL };
+static const unsigned int rtd1295_rgmii0_txd_0_pins[] = {
+				RTD1295_RGMII0_TXD_0 };
+static const unsigned int rtd1295_rgmii0_txd_1_pins[] = {
+				RTD1295_RGMII0_TXD_1 };
+static const unsigned int rtd1295_rgmii0_txd_2_pins[] = {
+				RTD1295_RGMII0_TXD_2 };
+static const unsigned int rtd1295_rgmii0_txd_3_pins[] = {
+				RTD1295_RGMII0_TXD_3 };
 static const unsigned int rtd1295_rgmii0_rxc_pins[] = { RTD1295_RGMII0_RXC };
-static const unsigned int rtd1295_rgmii0_rx_ctl_pins[] = { RTD1295_RGMII0_RX_CTL };
-static const unsigned int rtd1295_rgmii0_rxd_0_pins[] = { RTD1295_RGMII0_RXD_0 };
-static const unsigned int rtd1295_rgmii0_rxd_1_pins[] = { RTD1295_RGMII0_RXD_1 };
-static const unsigned int rtd1295_rgmii0_rxd_2_pins[] = { RTD1295_RGMII0_RXD_2 };
-static const unsigned int rtd1295_rgmii0_rxd_3_pins[] = { RTD1295_RGMII0_RXD_3 };
+static const unsigned int rtd1295_rgmii0_rx_ctl_pins[] = {
+				RTD1295_RGMII0_RX_CTL };
+static const unsigned int rtd1295_rgmii0_rxd_0_pins[] = {
+				RTD1295_RGMII0_RXD_0 };
+static const unsigned int rtd1295_rgmii0_rxd_1_pins[] = {
+				RTD1295_RGMII0_RXD_1 };
+static const unsigned int rtd1295_rgmii0_rxd_2_pins[] = {
+				RTD1295_RGMII0_RXD_2 };
+static const unsigned int rtd1295_rgmii0_rxd_3_pins[] = {
+				RTD1295_RGMII0_RXD_3 };
 static const unsigned int rtd1295_rgmii0_mdio_pins[] = { RTD1295_RGMII0_MDIO };
 static const unsigned int rtd1295_rgmii0_mdc_pins[] = { RTD1295_RGMII0_MDC };
 static const unsigned int rtd1295_rgmii1_txc_pins[] = { RTD1295_RGMII1_TXC };
-static const unsigned int rtd1295_rgmii1_tx_ctl_pins[] = { RTD1295_RGMII1_TX_CTL };
-static const unsigned int rtd1295_rgmii1_txd_0_pins[] = { RTD1295_RGMII1_TXD_0 };
-static const unsigned int rtd1295_rgmii1_txd_1_pins[] = { RTD1295_RGMII1_TXD_1 };
-static const unsigned int rtd1295_rgmii1_txd_2_pins[] = { RTD1295_RGMII1_TXD_2 };
-static const unsigned int rtd1295_rgmii1_txd_3_pins[] = { RTD1295_RGMII1_TXD_3 };
+static const unsigned int rtd1295_rgmii1_tx_ctl_pins[] = {
+				RTD1295_RGMII1_TX_CTL };
+static const unsigned int rtd1295_rgmii1_txd_0_pins[] = {
+				RTD1295_RGMII1_TXD_0 };
+static const unsigned int rtd1295_rgmii1_txd_1_pins[] = {
+				RTD1295_RGMII1_TXD_1 };
+static const unsigned int rtd1295_rgmii1_txd_2_pins[] = {
+				RTD1295_RGMII1_TXD_2 };
+static const unsigned int rtd1295_rgmii1_txd_3_pins[] = {
+				RTD1295_RGMII1_TXD_3 };
 static const unsigned int rtd1295_rgmii1_rxc_pins[] = { RTD1295_RGMII1_RXC };
-static const unsigned int rtd1295_rgmii1_rx_ctl_pins[] = { RTD1295_RGMII1_RX_CTL };
-static const unsigned int rtd1295_rgmii1_rxd_0_pins[] = { RTD1295_RGMII1_RXD_0 };
-static const unsigned int rtd1295_rgmii1_rxd_1_pins[] = { RTD1295_RGMII1_RXD_1 };
-static const unsigned int rtd1295_rgmii1_rxd_2_pins[] = { RTD1295_RGMII1_RXD_2 };
-static const unsigned int rtd1295_rgmii1_rxd_3_pins[] = { RTD1295_RGMII1_RXD_3 };
+static const unsigned int rtd1295_rgmii1_rx_ctl_pins[] = {
+				RTD1295_RGMII1_RX_CTL };
+static const unsigned int rtd1295_rgmii1_rxd_0_pins[] = {
+				RTD1295_RGMII1_RXD_0 };
+static const unsigned int rtd1295_rgmii1_rxd_1_pins[] = {
+				RTD1295_RGMII1_RXD_1 };
+static const unsigned int rtd1295_rgmii1_rxd_2_pins[] = {
+				RTD1295_RGMII1_RXD_2 };
+static const unsigned int rtd1295_rgmii1_rxd_3_pins[] = {
+				RTD1295_RGMII1_RXD_3 };
 static const unsigned int rtd1295_hif_loc_pins[] = { RTD1295_HI_LOC };
-static const unsigned int rtd1295_ejtag_scpu_loc_pins[] = { RTD1295_EJTAG_SCPU_LOC };
+static const unsigned int rtd1295_ejtag_scpu_loc_pins[] = {
+				RTD1295_EJTAG_SCPU_LOC };
 static const unsigned int rtd1295_sf_en_pins[] = { RTD1295_SF_EN };
 static const unsigned int rtd1295_tp0_loc_pins[] = { RTD1295_TP0_LOC };
 static const unsigned int rtd1295_tp1_loc_pins[] = { RTD1295_TP1_LOC };
@@ -720,46 +819,96 @@ static const struct rtd119x_pin_group_desc rtd1295_sb2_pin_groups[] = {
 };
 
 static const char * const rtd1295_sb2_gpio_groups[] = {
-	"gpio_0", "gpio_1", "gpio_2", "gpio_3", "gpio_4", "gpio_5", "gpio_6", "gpio_7", "gpio_8", "gpio_9",
+	"gpio_0", "gpio_1", "gpio_2", "gpio_3", "gpio_4",
+	"gpio_5", "gpio_6", "gpio_7", "gpio_8", "gpio_9",
 	"i2c_scl_4", "i2c_sda_4", "i2c_scl_5", "i2c_sda_5", "usb_id",
-	"sensor_cko_0", "sensor_cko_1", "sensor_rst", "sensor_stb_0", "sensor_stb_1",
+	"sensor_cko_0", "sensor_cko_1", "sensor_rst",
+	"sensor_stb_0", "sensor_stb_1",
 	"tp0_data", "tp0_clk", "tp0_valid", "tp0_sync",
 	"tp1_data", "tp1_clk", "tp1_valid", "tp1_sync",
-	"rgmii0_txc", "rgmii0_tx_ctl", "rgmii0_txd_0", "rgmii0_txd_1", "rgmii0_txd_2", "rgmii0_txd_3",
-	"rgmii0_rxc", "rgmii0_rx_ctl", "rgmii0_rxd_0", "rgmii0_rxd_1", "rgmii0_rxd_2", "rgmii0_rxd_3",
+	"rgmii0_txc", "rgmii0_tx_ctl", "rgmii0_txd_0",
+	"rgmii0_txd_1", "rgmii0_txd_2", "rgmii0_txd_3",
+	"rgmii0_rxc", "rgmii0_rx_ctl", "rgmii0_rxd_0",
+	"rgmii0_rxd_1", "rgmii0_rxd_2", "rgmii0_rxd_3",
 	"rgmii0_mdio", "rgmii0_mdc",
-	"rgmii1_txc", "rgmii1_tx_ctl", "rgmii1_txd_0", "rgmii1_txd_1", "rgmii1_txd_2", "rgmii1_txd_3",
-	"rgmii1_rxc", "rgmii1_rx_ctl", "rgmii1_rxd_0", "rgmii1_rxd_1", "rgmii1_rxd_2", "rgmii1_rxd_3",
+	"rgmii1_txc", "rgmii1_tx_ctl", "rgmii1_txd_0",
+	"rgmii1_txd_1", "rgmii1_txd_2", "rgmii1_txd_3",
+	"rgmii1_rxc", "rgmii1_rx_ctl", "rgmii1_rxd_0",
+	"rgmii1_rxd_1", "rgmii1_rxd_2", "rgmii1_rxd_3",
+};
+static const char * const rtd1295_sb2_ai_groups[] = {
+	"tp0_data", "tp0_sync", "tp0_valid", "tp0_clk"
 };
-static const char * const rtd1295_sb2_ai_groups[] = { "tp0_data", "tp0_sync", "tp0_valid", "tp0_clk" };
 static const char * const rtd1295_sb2_dc_fan_sensor_groups[] = { "gpio_9" };
-static const char * const rtd1295_sb2_eth_gpy_groups[] = { "rgmii0_mdio", "rgmii0_mdc" };
-static const char * const rtd1295_sb2_gspi_groups[] = { "gpio_4", "gpio_5", "gpio_6", "gpio_7" };
-static const char * const rtd1295_sb2_i2c2_groups[] = { "tp1_sync", "tp1_clk" };
-static const char * const rtd1295_sb2_i2c3_groups[] = { "tp1_data", "tp1_valid" };
-static const char * const rtd1295_sb2_i2c4_groups[] = { "i2c_scl_4", "i2c_sda_4" };
-static const char * const rtd1295_sb2_i2c5_groups[] = { "i2c_scl_5", "i2c_sda_5" };
-static const char * const rtd1295_sb2_nand_groups[] = { "i2c_sda_5", "i2c_scl_5" };
+static const char * const rtd1295_sb2_eth_gpy_groups[] = {
+	"rgmii0_mdio", "rgmii0_mdc"
+};
+static const char * const rtd1295_sb2_gspi_groups[] = {
+	"gpio_4", "gpio_5", "gpio_6", "gpio_7"
+};
+static const char * const rtd1295_sb2_i2c2_groups[] = {
+	"tp1_sync", "tp1_clk"
+};
+static const char * const rtd1295_sb2_i2c3_groups[] = {
+	"tp1_data", "tp1_valid"
+};
+static const char * const rtd1295_sb2_i2c4_groups[] = {
+	"i2c_scl_4", "i2c_sda_4"
+};
+static const char * const rtd1295_sb2_i2c5_groups[] = {
+	"i2c_scl_5", "i2c_sda_5"
+};
+static const char * const rtd1295_sb2_nand_groups[] = {
+	"i2c_sda_5", "i2c_scl_5"
+};
 static const char * const rtd1295_sb2_rgmii_groups[] = {
-	"rgmii0_txc", "rgmii0_tx_ctl", "rgmii0_txd_0", "rgmii0_txd_1", "rgmii0_txd_2", "rgmii0_txd_3",
-	"rgmii0_rxc", "rgmii0_rx_ctl", "rgmii0_rxd_0", "rgmii0_rxd_1", "rgmii0_rxd_2", "rgmii0_rxd_3",
+	"rgmii0_txc", "rgmii0_tx_ctl", "rgmii0_txd_0",
+	"rgmii0_txd_1", "rgmii0_txd_2", "rgmii0_txd_3",
+	"rgmii0_rxc", "rgmii0_rx_ctl", "rgmii0_rxd_0",
+	"rgmii0_rxd_1", "rgmii0_rxd_2", "rgmii0_rxd_3",
 	"rgmii0_mdio", "rgmii0_mdc",
-	"rgmii1_txc", "rgmii1_tx_ctl", "rgmii1_txd_0", "rgmii1_txd_1", "rgmii1_txd_2", "rgmii1_txd_3",
-	"rgmii1_rxc", "rgmii1_rx_ctl", "rgmii1_rxd_0", "rgmii1_rxd_1", "rgmii1_rxd_2", "rgmii1_rxd_3",
+	"rgmii1_txc", "rgmii1_tx_ctl", "rgmii1_txd_0",
+	"rgmii1_txd_1", "rgmii1_txd_2", "rgmii1_txd_3",
+	"rgmii1_rxc", "rgmii1_rx_ctl", "rgmii1_rxd_0",
+	"rgmii1_rxd_1", "rgmii1_rxd_2", "rgmii1_rxd_3",
 };
 
-static const char * const rtd1295_sb2_scpu_ejtag_loc_gpio_groups[] = { "gpio_4", "gpio_5", "gpio_6", "gpio_7", "gpio_8", "ejtag_scpu_loc" };
-static const char * const rtd1295_sb2_scpu_ejtag_loc_cr_groups[] = { "ejtag_scpu_loc" };
-static const char * const rtd1295_sb2_sensor_cko_output_groups[] = { "sensor_cko_0", "sensor_cko_1" };
-static const char * const rtd1295_sb2_spi_groups[] = { "gpio_0", "gpio_1", "gpio_2", "gpio_3" };
+static const char * const rtd1295_sb2_scpu_ejtag_loc_gpio_groups[] = {
+	"gpio_4", "gpio_5", "gpio_6", "gpio_7", "gpio_8", "ejtag_scpu_loc"
+};
+static const char * const rtd1295_sb2_scpu_ejtag_loc_cr_groups[] = {
+	"ejtag_scpu_loc"
+};
+static const char * const rtd1295_sb2_sensor_cko_output_groups[] = {
+	"sensor_cko_0", "sensor_cko_1"
+};
+static const char * const rtd1295_sb2_spi_groups[] = {
+	"gpio_0", "gpio_1", "gpio_2", "gpio_3"
+};
 static const char * const rtd1295_sb2_test_loop_dis_groups[] = { "usb_id" };
-static const char * const rtd1295_sb2_tp0_loc_rgmii0_tx_groups[] = { "rgmii0_txd_0", "rgmii0_txd_1", "rgmii0_txd_2", "rgmii0_txd_3", "tp0_loc" };
-static const char * const rtd1295_sb2_tp0_loc_tp0_groups[] = { "tp0_data", "tp0_sync", "tp0_valid", "tp0_clk", "tp0_loc" };
-static const char * const rtd1295_sb2_tp0_loc_tp1_groups[] = { "tp0_data", "tp0_sync", "tp0_valid", "tp0_clk", "tp0_loc" };
-static const char * const rtd1295_sb2_tp1_loc_rgmii0_rx_groups[] = { "rgmii0_rxd_0", "rgmii0_rxd_1", "rgmii0_rxd_2", "rgmii0_rxd_3", "tp1_loc" };
-static const char * const rtd1295_sb2_tp1_loc_tp0_groups[] = { "tp1_data", "tp1_sync", "tp1_valid", "tp1_clk", "tp1_loc" };
-static const char * const rtd1295_sb2_tp1_loc_tp1_groups[] = { "tp1_data", "tp1_sync", "tp1_valid", "tp1_clk", "tp1_loc" };
-static const char * const rtd1295_sb2_usb_clock_output_groups[] = { "sensor_cko_1" };
+static const char * const rtd1295_sb2_tp0_loc_rgmii0_tx_groups[] = {
+	"rgmii0_txd_0", "rgmii0_txd_1", "rgmii0_txd_2",
+	"rgmii0_txd_3", "tp0_loc"
+};
+static const char * const rtd1295_sb2_tp0_loc_tp0_groups[] = {
+	"tp0_data", "tp0_sync", "tp0_valid", "tp0_clk", "tp0_loc"
+};
+static const char * const rtd1295_sb2_tp0_loc_tp1_groups[] = {
+	"tp0_data", "tp0_sync", "tp0_valid", "tp0_clk", "tp0_loc"
+};
+static const char * const rtd1295_sb2_tp1_loc_rgmii0_rx_groups[] = {
+	"rgmii0_rxd_0", "rgmii0_rxd_1", "rgmii0_rxd_2",
+	"rgmii0_rxd_3", "tp1_loc"
+};
+static const char * const rtd1295_sb2_tp1_loc_tp0_groups[] = {
+	"tp1_data", "tp1_sync", "tp1_valid", "tp1_clk", "tp1_loc"
+};
+static const char * const rtd1295_sb2_tp1_loc_tp1_groups[] = {
+	"tp1_data", "tp1_sync", "tp1_valid", "tp1_clk", "tp1_loc"
+};
+static const char * const rtd1295_sb2_usb_clock_output_groups[] = {
+	"sensor_cko_1"
+};
 static const char * const rtd1295_sb2_hif_loc_misc_groups[] = { "hif_loc" };
 static const char * const rtd1295_sb2_hif_loc_nf_groups[] = { "hif_loc" };
 
@@ -1146,9 +1295,15 @@ static const char * const rtd1295_disp_gpio_groups[] = {
 	"spdif", "dmic_clk", "dmic_data",
 	"ao_lrck", "ao_bck", "aock", "ao_sd_0", "ao_sd_1", "ao_sd_2", "ao_sd_3",
 };
-static const char * const rtd1295_disp_ai_groups[] = { "dmic_clk", "dmic_data", "ao_sd_2", "ao_sd_3" };
-static const char * const rtd1295_disp_ao_groups[] = { "ao_lrck", "ao_bck", "aock", "ao_sd_0", "ao_sd_1", "ao_sd_2", "ao_sd_3" };
-static const char * const rtd1295_disp_dmic_groups[] = { "dmic_clk", "dmic_data" };
+static const char * const rtd1295_disp_ai_groups[] = {
+	"dmic_clk", "dmic_data", "ao_sd_2", "ao_sd_3"
+};
+static const char * const rtd1295_disp_ao_groups[] = {
+	"ao_lrck", "ao_bck", "aock", "ao_sd_0", "ao_sd_1", "ao_sd_2", "ao_sd_3"
+};
+static const char * const rtd1295_disp_dmic_groups[] = {
+	"dmic_clk", "dmic_data"
+};
 static const char * const rtd1295_disp_spdif_out_groups[] = { "spdif" };
 
 #define RTD1295_FUNC(_name) \
@@ -1347,8 +1502,10 @@ static const unsigned int rtd1295_sdio_data_0_pins[] = { RTD1295_SDIO_DATA_0 };
 static const unsigned int rtd1295_sdio_data_1_pins[] = { RTD1295_SDIO_DATA_1 };
 static const unsigned int rtd1295_sdio_data_2_pins[] = { RTD1295_SDIO_DATA_2 };
 static const unsigned int rtd1295_sdio_data_3_pins[] = { RTD1295_SDIO_DATA_3 };
-static const unsigned int rtd1295_pcie_clkreq_0_pins[] = { RTD1295_PCIE_CLKREQ_0 };
-static const unsigned int rtd1295_pcie_clkreq_1_pins[] = { RTD1295_PCIE_CLKREQ_1 };
+static const unsigned int rtd1295_pcie_clkreq_0_pins[] = {
+				RTD1295_PCIE_CLKREQ_0 };
+static const unsigned int rtd1295_pcie_clkreq_1_pins[] = {
+				RTD1295_PCIE_CLKREQ_1 };
 static const unsigned int rtd1295_prob_0_pins[] = { RTD1295_PROB_0 };
 static const unsigned int rtd1295_prob_1_pins[] = { RTD1295_PROB_1 };
 static const unsigned int rtd1295_prob_2_pins[] = { RTD1295_PROB_2 };
@@ -1399,25 +1556,57 @@ static const struct rtd119x_pin_group_desc rtd1295_cr_pin_groups[] = {
 
 static const char * const rtd1295_cr_gpio_groups[] = {
 	"nf_cle", "nf_ale", "nf_rd_n", "nf_wr_n", "nf_rdy",
-	"nf_dd_7", "nf_dd_6", "nf_dd_5", "nf_dd_4", "nf_dd_3", "nf_dd_2", "nf_dd_1", "nf_dd_0",
+	"nf_dd_7", "nf_dd_6", "nf_dd_5", "nf_dd_4",
+	"nf_dd_3", "nf_dd_2", "nf_dd_1", "nf_dd_0",
 	"nf_dqs", "nf_ce_n_0", "nf_ce_n_1",
 	"emmc_dd_sb",
-	"mmc_cmd", "mmc_clk", "mmc_wp", "mmc_cd", "mmc_data_0", "mmc_data_1", "mmc_data_2", "mmc_data_3",
-	"sdio_cmd", "sdio_clk", "sdio_data_0", "sdio_data_1", "sdio_data_2", "sdio_data_3",
+	"mmc_cmd", "mmc_clk", "mmc_wp", "mmc_cd", "mmc_data_0",
+	"mmc_data_1", "mmc_data_2", "mmc_data_3",
+	"sdio_cmd", "sdio_clk", "sdio_data_0", "sdio_data_1",
+	"sdio_data_2", "sdio_data_3",
 	"pcie_clkreq_0", "pcie_clkreq_1",
 	"prob_0", "prob_1", "prob_2", "prob_3",
 };
-static const char * const rtd1295_cr_avcpu_ej_groups[] = { "nf_rdy", "nf_rd_n", "nf_dd_5", "nf_dd_6", "nf_dd_7" };
-static const char * const rtd1295_cr_emmc_groups[] = { "nf_rdy", "nf_rd_n", "nf_cle", "nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3", "nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7", "emmc_dd_db" };
-static const char * const rtd1295_cr_hif_groups[] = { "nf_wr_n", "nf_ale", "nf_cle", "nf_dd_4" };
-static const char * const rtd1295_cr_nand_groups[] = { "nf_dqs", "nf_rdy", "nf_rd_n", "nf_wr_n", "nf_ale", "nf_cle", "nf_ce_n_0", "nf_ce_n_1", "nf_dd_0", "nf_dd_1", "nf_dd_2", "nf_dd_3", "nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7" };
-static const char * const rtd1295_cr_p2s_groups[] = { "prob_0", "prob_1" };
-static const char * const rtd1295_cr_pcie_groups[] = { "pcie_clkreq_0", "pcie_clkreq_1" };
-static const char * const rtd1295_cr_pll_test_groups[] = { "prob_0", "prob_1", "prob_2", "prob_3" };
-static const char * const rtd1295_cr_scpu_ejtag_loc_cr_groups[] = { "mmc_cmd", "mmc_clk", "mmc_wp", "mmc_data_0", "mmc_data_3" };
-static const char * const rtd1295_cr_sd_card_groups[] = { "mmc_cmd", "mmc_clk", "mmc_wp", "mmc_cd", "mmc_data_0", "mmc_data_1", "mmc_data_2", "mmc_data_3" };
-static const char * const rtd1295_cr_sdio_0_groups[] = { "sdio_cmd", "sdio_clk", "sdio_data_0", "sdio_data_1", "sdio_data_2", "sdio_data_3" };
-static const char * const rtd1295_cr_sdio_1_groups[] = { "mmc_cmd", "mmc_clk", "mmc_data_0", "mmc_data_1", "mmc_data_2", "mmc_data_3" };
+static const char * const rtd1295_cr_avcpu_ej_groups[] = {
+	"nf_rdy", "nf_rd_n", "nf_dd_5", "nf_dd_6", "nf_dd_7"
+};
+static const char * const rtd1295_cr_emmc_groups[] = {
+	"nf_rdy", "nf_rd_n", "nf_cle", "nf_dd_0", "nf_dd_1",
+	"nf_dd_2", "nf_dd_3", "nf_dd_4", "nf_dd_5", "nf_dd_6",
+	"nf_dd_7", "emmc_dd_db"
+};
+static const char * const rtd1295_cr_hif_groups[] = {
+	"nf_wr_n", "nf_ale", "nf_cle", "nf_dd_4"
+};
+static const char * const rtd1295_cr_nand_groups[] = {
+	"nf_dqs", "nf_rdy", "nf_rd_n", "nf_wr_n", "nf_ale", "nf_cle",
+	"nf_ce_n_0", "nf_ce_n_1", "nf_dd_0", "nf_dd_1", "nf_dd_2",
+	"nf_dd_3", "nf_dd_4", "nf_dd_5", "nf_dd_6", "nf_dd_7"
+};
+static const char * const rtd1295_cr_p2s_groups[] = {
+	"prob_0", "prob_1"
+};
+static const char * const rtd1295_cr_pcie_groups[] = {
+	"pcie_clkreq_0", "pcie_clkreq_1"
+};
+static const char * const rtd1295_cr_pll_test_groups[] = {
+	"prob_0", "prob_1", "prob_2", "prob_3"
+};
+static const char * const rtd1295_cr_scpu_ejtag_loc_cr_groups[] = {
+	"mmc_cmd", "mmc_clk", "mmc_wp", "mmc_data_0", "mmc_data_3"
+};
+static const char * const rtd1295_cr_sd_card_groups[] = {
+	"mmc_cmd", "mmc_clk", "mmc_wp", "mmc_cd", "mmc_data_0",
+	"mmc_data_1", "mmc_data_2", "mmc_data_3"
+};
+static const char * const rtd1295_cr_sdio_0_groups[] = {
+	"sdio_cmd", "sdio_clk", "sdio_data_0",
+	"sdio_data_1", "sdio_data_2", "sdio_data_3"
+};
+static const char * const rtd1295_cr_sdio_1_groups[] = {
+	"mmc_cmd", "mmc_clk", "mmc_data_0",
+	"mmc_data_1", "mmc_data_2", "mmc_data_3"
+};
 
 
 #define RTD1295_FUNC(_name) \
-- 
2.28.0

