Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57331267E46
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Sep 2020 08:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgIMG71 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 02:59:27 -0400
Received: from out28-52.mail.aliyun.com ([115.124.28.52]:37210 "EHLO
        out28-52.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgIMG7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 02:59:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.638439-0.000183839-0.361377;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.IWSCMpo_1599980345;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IWSCMpo_1599980345)
          by smtp.aliyun-inc.com(10.147.42.16);
          Sun, 13 Sep 2020 14:59:16 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 3/3] pinctrl: Ingenic: Add I2S pins support for Ingenic SoCs.
Date:   Sun, 13 Sep 2020 14:58:36 +0800
Message-Id: <20200913065836.12156-4-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200913065836.12156-1-zhouyanjie@wanyeetech.com>
References: <20200913065836.12156-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

1.Add I2S pins support for the JZ4780 SoC.
2.Add I2S pins support for the X1000 SoC.
3.Add I2S pins support for the X1500 SoC.
4.Add I2S pins support for the X1830 SoC.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    No change.
    
    v3->v4:
    Add Paul Cercueil's Reviewed-by.

 drivers/pinctrl/pinctrl-ingenic.c | 70 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d5ac8489ba3d..c8e50a58a5e5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1083,6 +1083,11 @@ static int jz4780_mmc0_8bit_a_pins[] = { 0x04, 0x05, 0x06, 0x07, 0x18, };
 static int jz4780_i2c3_pins[] = { 0x6a, 0x6b, };
 static int jz4780_i2c4_e_pins[] = { 0x8c, 0x8d, };
 static int jz4780_i2c4_f_pins[] = { 0xb9, 0xb8, };
+static int jz4780_i2s_data_tx_pins[] = { 0x87, };
+static int jz4780_i2s_data_rx_pins[] = { 0x86, };
+static int jz4780_i2s_clk_txrx_pins[] = { 0x6c, 0x6d, };
+static int jz4780_i2s_clk_rx_pins[] = { 0x88, 0x89, };
+static int jz4780_i2s_sysclk_pins[] = { 0x85, };
 static int jz4780_hdmi_ddc_pins[] = { 0xb9, 0xb8, };
 
 static int jz4780_uart2_data_funcs[] = { 1, 1, };
@@ -1125,6 +1130,11 @@ static int jz4780_mmc0_8bit_a_funcs[] = { 1, 1, 1, 1, 1, };
 static int jz4780_i2c3_funcs[] = { 1, 1, };
 static int jz4780_i2c4_e_funcs[] = { 1, 1, };
 static int jz4780_i2c4_f_funcs[] = { 1, 1, };
+static int jz4780_i2s_data_tx_funcs[] = { 0, };
+static int jz4780_i2s_data_rx_funcs[] = { 0, };
+static int jz4780_i2s_clk_txrx_funcs[] = { 1, 0, };
+static int jz4780_i2s_clk_rx_funcs[] = { 1, 1, };
+static int jz4780_i2s_sysclk_funcs[] = { 2, };
 static int jz4780_hdmi_ddc_funcs[] = { 0, 0, };
 
 static const struct group_desc jz4780_groups[] = {
@@ -1213,6 +1223,11 @@ static const struct group_desc jz4780_groups[] = {
 	INGENIC_PIN_GROUP("i2c3-data", jz4780_i2c3),
 	INGENIC_PIN_GROUP("i2c4-data-e", jz4780_i2c4_e),
 	INGENIC_PIN_GROUP("i2c4-data-f", jz4780_i2c4_f),
+	INGENIC_PIN_GROUP("i2s-data-tx", jz4780_i2s_data_tx),
+	INGENIC_PIN_GROUP("i2s-data-rx", jz4780_i2s_data_rx),
+	INGENIC_PIN_GROUP("i2s-clk-txrx", jz4780_i2s_clk_txrx),
+	INGENIC_PIN_GROUP("i2s-clk-rx", jz4780_i2s_clk_rx),
+	INGENIC_PIN_GROUP("i2s-sysclk", jz4780_i2s_sysclk),
 	INGENIC_PIN_GROUP("hdmi-ddc", jz4780_hdmi_ddc),
 	INGENIC_PIN_GROUP("cim-data", jz4770_cim_8bit),
 	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit),
@@ -1261,6 +1276,9 @@ static const char *jz4780_nemc_groups[] = {
 };
 static const char *jz4780_i2c3_groups[] = { "i2c3-data", };
 static const char *jz4780_i2c4_groups[] = { "i2c4-data-e", "i2c4-data-f", };
+static const char *jz4780_i2s_groups[] = {
+	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-clk-rx", "i2s-sysclk",
+};
 static const char *jz4780_cim_groups[] = { "cim-data", };
 static const char *jz4780_hdmi_ddc_groups[] = { "hdmi-ddc", };
 
@@ -1287,6 +1305,7 @@ static const struct function_desc jz4780_functions[] = {
 	{ "i2c2", jz4770_i2c2_groups, ARRAY_SIZE(jz4770_i2c2_groups), },
 	{ "i2c3", jz4780_i2c3_groups, ARRAY_SIZE(jz4780_i2c3_groups), },
 	{ "i2c4", jz4780_i2c4_groups, ARRAY_SIZE(jz4780_i2c4_groups), },
+	{ "i2s", jz4780_i2s_groups, ARRAY_SIZE(jz4780_i2s_groups), },
 	{ "cim", jz4780_cim_groups, ARRAY_SIZE(jz4780_cim_groups), },
 	{ "lcd", jz4770_lcd_groups, ARRAY_SIZE(jz4770_lcd_groups), },
 	{ "pwm0", jz4770_pwm0_groups, ARRAY_SIZE(jz4770_pwm0_groups), },
@@ -1368,6 +1387,10 @@ static int x1000_i2c0_pins[] = { 0x38, 0x37, };
 static int x1000_i2c1_a_pins[] = { 0x01, 0x00, };
 static int x1000_i2c1_c_pins[] = { 0x5b, 0x5a, };
 static int x1000_i2c2_pins[] = { 0x61, 0x60, };
+static int x1000_i2s_data_tx_pins[] = { 0x24, };
+static int x1000_i2s_data_rx_pins[] = { 0x23, };
+static int x1000_i2s_clk_txrx_pins[] = { 0x21, 0x22, };
+static int x1000_i2s_sysclk_pins[] = { 0x20, };
 static int x1000_cim_pins[] = {
 	0x08, 0x09, 0x0a, 0x0b,
 	0x13, 0x12, 0x11, 0x10, 0x0f, 0x0e, 0x0d, 0x0c,
@@ -1430,6 +1453,10 @@ static int x1000_i2c0_funcs[] = { 0, 0, };
 static int x1000_i2c1_a_funcs[] = { 2, 2, };
 static int x1000_i2c1_c_funcs[] = { 0, 0, };
 static int x1000_i2c2_funcs[] = { 1, 1, };
+static int x1000_i2s_data_tx_funcs[] = { 1, };
+static int x1000_i2s_data_rx_funcs[] = { 1, };
+static int x1000_i2s_clk_txrx_funcs[] = { 1, 1, };
+static int x1000_i2s_sysclk_funcs[] = { 1, };
 static int x1000_cim_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
 static int x1000_lcd_8bit_funcs[] = {
 	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
@@ -1483,6 +1510,10 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("i2c1-data-a", x1000_i2c1_a),
 	INGENIC_PIN_GROUP("i2c1-data-c", x1000_i2c1_c),
 	INGENIC_PIN_GROUP("i2c2-data", x1000_i2c2),
+	INGENIC_PIN_GROUP("i2s-data-tx", x1000_i2s_data_tx),
+	INGENIC_PIN_GROUP("i2s-data-rx", x1000_i2s_data_rx),
+	INGENIC_PIN_GROUP("i2s-clk-txrx", x1000_i2s_clk_txrx),
+	INGENIC_PIN_GROUP("i2s-sysclk", x1000_i2s_sysclk),
 	INGENIC_PIN_GROUP("cim-data", x1000_cim),
 	INGENIC_PIN_GROUP("lcd-8bit", x1000_lcd_8bit),
 	INGENIC_PIN_GROUP("lcd-16bit", x1000_lcd_16bit),
@@ -1524,6 +1555,9 @@ static const char *x1000_cs2_groups[] = { "emc-cs2", };
 static const char *x1000_i2c0_groups[] = { "i2c0-data", };
 static const char *x1000_i2c1_groups[] = { "i2c1-data-a", "i2c1-data-c", };
 static const char *x1000_i2c2_groups[] = { "i2c2-data", };
+static const char *x1000_i2s_groups[] = {
+	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
+};
 static const char *x1000_cim_groups[] = { "cim-data", };
 static const char *x1000_lcd_groups[] = {
 	"lcd-8bit", "lcd-16bit", "lcd-no-pins",
@@ -1549,6 +1583,7 @@ static const struct function_desc x1000_functions[] = {
 	{ "i2c0", x1000_i2c0_groups, ARRAY_SIZE(x1000_i2c0_groups), },
 	{ "i2c1", x1000_i2c1_groups, ARRAY_SIZE(x1000_i2c1_groups), },
 	{ "i2c2", x1000_i2c2_groups, ARRAY_SIZE(x1000_i2c2_groups), },
+	{ "i2s", x1000_i2s_groups, ARRAY_SIZE(x1000_i2s_groups), },
 	{ "cim", x1000_cim_groups, ARRAY_SIZE(x1000_cim_groups), },
 	{ "lcd", x1000_lcd_groups, ARRAY_SIZE(x1000_lcd_groups), },
 	{ "pwm0", x1000_pwm0_groups, ARRAY_SIZE(x1000_pwm0_groups), },
@@ -1584,6 +1619,10 @@ static int x1500_i2c0_pins[] = { 0x38, 0x37, };
 static int x1500_i2c1_a_pins[] = { 0x01, 0x00, };
 static int x1500_i2c1_c_pins[] = { 0x5b, 0x5a, };
 static int x1500_i2c2_pins[] = { 0x61, 0x60, };
+static int x1500_i2s_data_tx_pins[] = { 0x24, };
+static int x1500_i2s_data_rx_pins[] = { 0x23, };
+static int x1500_i2s_clk_txrx_pins[] = { 0x21, 0x22, };
+static int x1500_i2s_sysclk_pins[] = { 0x20, };
 static int x1500_cim_pins[] = {
 	0x08, 0x09, 0x0a, 0x0b,
 	0x13, 0x12, 0x11, 0x10, 0x0f, 0x0e, 0x0d, 0x0c,
@@ -1607,6 +1646,10 @@ static int x1500_i2c0_funcs[] = { 0, 0, };
 static int x1500_i2c1_a_funcs[] = { 2, 2, };
 static int x1500_i2c1_c_funcs[] = { 0, 0, };
 static int x1500_i2c2_funcs[] = { 1, 1, };
+static int x1500_i2s_data_tx_funcs[] = { 1, };
+static int x1500_i2s_data_rx_funcs[] = { 1, };
+static int x1500_i2s_clk_txrx_funcs[] = { 1, 1, };
+static int x1500_i2s_sysclk_funcs[] = { 1, };
 static int x1500_cim_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
 static int x1500_pwm_pwm0_funcs[] = { 0, };
 static int x1500_pwm_pwm1_funcs[] = { 1, };
@@ -1629,6 +1672,10 @@ static const struct group_desc x1500_groups[] = {
 	INGENIC_PIN_GROUP("i2c1-data-a", x1500_i2c1_a),
 	INGENIC_PIN_GROUP("i2c1-data-c", x1500_i2c1_c),
 	INGENIC_PIN_GROUP("i2c2-data", x1500_i2c2),
+	INGENIC_PIN_GROUP("i2s-data-tx", x1500_i2s_data_tx),
+	INGENIC_PIN_GROUP("i2s-data-rx", x1500_i2s_data_rx),
+	INGENIC_PIN_GROUP("i2s-clk-txrx", x1500_i2s_clk_txrx),
+	INGENIC_PIN_GROUP("i2s-sysclk", x1500_i2s_sysclk),
 	INGENIC_PIN_GROUP("cim-data", x1500_cim),
 	{ "lcd-no-pins", },
 	INGENIC_PIN_GROUP("pwm0", x1500_pwm_pwm0),
@@ -1647,6 +1694,9 @@ static const char *x1500_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
 static const char *x1500_i2c0_groups[] = { "i2c0-data", };
 static const char *x1500_i2c1_groups[] = { "i2c1-data-a", "i2c1-data-c", };
 static const char *x1500_i2c2_groups[] = { "i2c2-data", };
+static const char *x1500_i2s_groups[] = {
+	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
+};
 static const char *x1500_cim_groups[] = { "cim-data", };
 static const char *x1500_lcd_groups[] = { "lcd-no-pins", };
 static const char *x1500_pwm0_groups[] = { "pwm0", };
@@ -1664,6 +1714,7 @@ static const struct function_desc x1500_functions[] = {
 	{ "i2c0", x1500_i2c0_groups, ARRAY_SIZE(x1500_i2c0_groups), },
 	{ "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
 	{ "i2c2", x1500_i2c2_groups, ARRAY_SIZE(x1500_i2c2_groups), },
+	{ "i2s", x1500_i2s_groups, ARRAY_SIZE(x1500_i2s_groups), },
 	{ "cim", x1500_cim_groups, ARRAY_SIZE(x1500_cim_groups), },
 	{ "lcd", x1500_lcd_groups, ARRAY_SIZE(x1500_lcd_groups), },
 	{ "pwm0", x1500_pwm0_groups, ARRAY_SIZE(x1500_pwm0_groups), },
@@ -1722,6 +1773,11 @@ static int x1830_mmc1_4bit_pins[] = { 0x45, 0x46, 0x47, };
 static int x1830_i2c0_pins[] = { 0x0c, 0x0d, };
 static int x1830_i2c1_pins[] = { 0x39, 0x3a, };
 static int x1830_i2c2_pins[] = { 0x5b, 0x5c, };
+static int x1830_i2s_data_tx_pins[] = { 0x53, };
+static int x1830_i2s_data_rx_pins[] = { 0x54, };
+static int x1830_i2s_clk_txrx_pins[] = { 0x58, 0x52, };
+static int x1830_i2s_clk_rx_pins[] = { 0x56, 0x55, };
+static int x1830_i2s_sysclk_pins[] = { 0x57, };
 static int x1830_lcd_rgb_18bit_pins[] = {
 	0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
 	0x68, 0x69, 0x6c, 0x6d, 0x6e, 0x6f,
@@ -1784,6 +1840,11 @@ static int x1830_mmc1_4bit_funcs[] = { 0, 0, 0, };
 static int x1830_i2c0_funcs[] = { 1, 1, };
 static int x1830_i2c1_funcs[] = { 0, 0, };
 static int x1830_i2c2_funcs[] = { 1, 1, };
+static int x1830_i2s_data_tx_funcs[] = { 0, };
+static int x1830_i2s_data_rx_funcs[] = { 0, };
+static int x1830_i2s_clk_txrx_funcs[] = { 0, 0, };
+static int x1830_i2s_clk_rx_funcs[] = { 0, 0, };
+static int x1830_i2s_sysclk_funcs[] = { 0, };
 static int x1830_lcd_rgb_18bit_funcs[] = {
 	0, 0, 0, 0, 0, 0,
 	0, 0, 0, 0, 0, 0,
@@ -1842,6 +1903,11 @@ static const struct group_desc x1830_groups[] = {
 	INGENIC_PIN_GROUP("i2c0-data", x1830_i2c0),
 	INGENIC_PIN_GROUP("i2c1-data", x1830_i2c1),
 	INGENIC_PIN_GROUP("i2c2-data", x1830_i2c2),
+	INGENIC_PIN_GROUP("i2s-data-tx", x1830_i2s_data_tx),
+	INGENIC_PIN_GROUP("i2s-data-rx", x1830_i2s_data_rx),
+	INGENIC_PIN_GROUP("i2s-clk-txrx", x1830_i2s_clk_txrx),
+	INGENIC_PIN_GROUP("i2s-clk-rx", x1830_i2s_clk_rx),
+	INGENIC_PIN_GROUP("i2s-sysclk", x1830_i2s_sysclk),
 	INGENIC_PIN_GROUP("lcd-rgb-18bit", x1830_lcd_rgb_18bit),
 	INGENIC_PIN_GROUP("lcd-slcd-8bit", x1830_lcd_slcd_8bit),
 	INGENIC_PIN_GROUP("lcd-slcd-16bit", x1830_lcd_slcd_16bit),
@@ -1884,6 +1950,9 @@ static const char *x1830_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
 static const char *x1830_i2c0_groups[] = { "i2c0-data", };
 static const char *x1830_i2c1_groups[] = { "i2c1-data", };
 static const char *x1830_i2c2_groups[] = { "i2c2-data", };
+static const char *x1830_i2s_groups[] = {
+	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-clk-rx", "i2s-sysclk",
+};
 static const char *x1830_lcd_groups[] = {
 	"lcd-rgb-18bit", "lcd-slcd-8bit", "lcd-slcd-16bit", "lcd-no-pins",
 };
@@ -1908,6 +1977,7 @@ static const struct function_desc x1830_functions[] = {
 	{ "i2c0", x1830_i2c0_groups, ARRAY_SIZE(x1830_i2c0_groups), },
 	{ "i2c1", x1830_i2c1_groups, ARRAY_SIZE(x1830_i2c1_groups), },
 	{ "i2c2", x1830_i2c2_groups, ARRAY_SIZE(x1830_i2c2_groups), },
+	{ "i2s", x1830_i2s_groups, ARRAY_SIZE(x1830_i2s_groups), },
 	{ "lcd", x1830_lcd_groups, ARRAY_SIZE(x1830_lcd_groups), },
 	{ "pwm0", x1830_pwm0_groups, ARRAY_SIZE(x1830_pwm0_groups), },
 	{ "pwm1", x1830_pwm1_groups, ARRAY_SIZE(x1830_pwm1_groups), },
-- 
2.11.0

