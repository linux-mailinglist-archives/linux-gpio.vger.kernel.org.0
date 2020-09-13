Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E1A267E42
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Sep 2020 08:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgIMG71 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 02:59:27 -0400
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:42292 "EHLO
        out28-172.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgIMG7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 02:59:24 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.487979-9.28007e-05-0.511928;FP=0|0|0|0|0|-1|-1|-1;HT=e01l04362;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.IWSCMpo_1599980345;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IWSCMpo_1599980345)
          by smtp.aliyun-inc.com(10.147.42.16);
          Sun, 13 Sep 2020 14:59:14 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 1/3] pinctrl: Ingenic: Add SSI pins support for JZ4770 and JZ4780.
Date:   Sun, 13 Sep 2020 14:58:34 +0800
Message-Id: <20200913065836.12156-2-zhouyanjie@wanyeetech.com>
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

Add SSI pins support for the JZ4770 SoC and the
JZ4780 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v1->v2:
    Rebase on top of kernel 5.9-rc3.
    
    v2->v3:
    Add Paul Cercueil's Reviewed-by.
    
    v3->v4:
    No change.

 drivers/pinctrl/pinctrl-ingenic.c | 267 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a8d1b53ec4c1..00f29fd684fa 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -633,6 +633,46 @@ static int jz4770_uart2_data_pins[] = { 0x5c, 0x5e, };
 static int jz4770_uart2_hwflow_pins[] = { 0x5d, 0x5f, };
 static int jz4770_uart3_data_pins[] = { 0x6c, 0x85, };
 static int jz4770_uart3_hwflow_pins[] = { 0x88, 0x89, };
+static int jz4770_ssi0_dt_a_pins[] = { 0x15, };
+static int jz4770_ssi0_dt_b_pins[] = { 0x35, };
+static int jz4770_ssi0_dt_d_pins[] = { 0x55, };
+static int jz4770_ssi0_dt_e_pins[] = { 0x71, };
+static int jz4770_ssi0_dr_a_pins[] = { 0x14, };
+static int jz4770_ssi0_dr_b_pins[] = { 0x34, };
+static int jz4770_ssi0_dr_d_pins[] = { 0x54, };
+static int jz4770_ssi0_dr_e_pins[] = { 0x6e, };
+static int jz4770_ssi0_clk_a_pins[] = { 0x12, };
+static int jz4770_ssi0_clk_b_pins[] = { 0x3c, };
+static int jz4770_ssi0_clk_d_pins[] = { 0x58, };
+static int jz4770_ssi0_clk_e_pins[] = { 0x6f, };
+static int jz4770_ssi0_gpc_b_pins[] = { 0x3e, };
+static int jz4770_ssi0_gpc_d_pins[] = { 0x56, };
+static int jz4770_ssi0_gpc_e_pins[] = { 0x73, };
+static int jz4770_ssi0_ce0_a_pins[] = { 0x13, };
+static int jz4770_ssi0_ce0_b_pins[] = { 0x3d, };
+static int jz4770_ssi0_ce0_d_pins[] = { 0x59, };
+static int jz4770_ssi0_ce0_e_pins[] = { 0x70, };
+static int jz4770_ssi0_ce1_b_pins[] = { 0x3f, };
+static int jz4770_ssi0_ce1_d_pins[] = { 0x57, };
+static int jz4770_ssi0_ce1_e_pins[] = { 0x72, };
+static int jz4770_ssi1_dt_b_pins[] = { 0x35, };
+static int jz4770_ssi1_dt_d_pins[] = { 0x55, };
+static int jz4770_ssi1_dt_e_pins[] = { 0x71, };
+static int jz4770_ssi1_dr_b_pins[] = { 0x34, };
+static int jz4770_ssi1_dr_d_pins[] = { 0x54, };
+static int jz4770_ssi1_dr_e_pins[] = { 0x6e, };
+static int jz4770_ssi1_clk_b_pins[] = { 0x3c, };
+static int jz4770_ssi1_clk_d_pins[] = { 0x58, };
+static int jz4770_ssi1_clk_e_pins[] = { 0x6f, };
+static int jz4770_ssi1_gpc_b_pins[] = { 0x3e, };
+static int jz4770_ssi1_gpc_d_pins[] = { 0x56, };
+static int jz4770_ssi1_gpc_e_pins[] = { 0x73, };
+static int jz4770_ssi1_ce0_b_pins[] = { 0x3d, };
+static int jz4770_ssi1_ce0_d_pins[] = { 0x59, };
+static int jz4770_ssi1_ce0_e_pins[] = { 0x70, };
+static int jz4770_ssi1_ce1_b_pins[] = { 0x3f, };
+static int jz4770_ssi1_ce1_d_pins[] = { 0x57, };
+static int jz4770_ssi1_ce1_e_pins[] = { 0x72, };
 static int jz4770_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
 static int jz4770_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
 static int jz4770_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
@@ -703,6 +743,46 @@ static int jz4770_uart2_data_funcs[] = { 0, 0, };
 static int jz4770_uart2_hwflow_funcs[] = { 0, 0, };
 static int jz4770_uart3_data_funcs[] = { 0, 1, };
 static int jz4770_uart3_hwflow_funcs[] = { 0, 0, };
+static int jz4770_ssi0_dt_a_funcs[] = { 2, };
+static int jz4770_ssi0_dt_b_funcs[] = { 1, };
+static int jz4770_ssi0_dt_d_funcs[] = { 1, };
+static int jz4770_ssi0_dt_e_funcs[] = { 0, };
+static int jz4770_ssi0_dr_a_funcs[] = { 1, };
+static int jz4770_ssi0_dr_b_funcs[] = { 1, };
+static int jz4770_ssi0_dr_d_funcs[] = { 1, };
+static int jz4770_ssi0_dr_e_funcs[] = { 0, };
+static int jz4770_ssi0_clk_a_funcs[] = { 2, };
+static int jz4770_ssi0_clk_b_funcs[] = { 1, };
+static int jz4770_ssi0_clk_d_funcs[] = { 1, };
+static int jz4770_ssi0_clk_e_funcs[] = { 0, };
+static int jz4770_ssi0_gpc_b_funcs[] = { 1, };
+static int jz4770_ssi0_gpc_d_funcs[] = { 1, };
+static int jz4770_ssi0_gpc_e_funcs[] = { 0, };
+static int jz4770_ssi0_ce0_a_funcs[] = { 2, };
+static int jz4770_ssi0_ce0_b_funcs[] = { 1, };
+static int jz4770_ssi0_ce0_d_funcs[] = { 1, };
+static int jz4770_ssi0_ce0_e_funcs[] = { 0, };
+static int jz4770_ssi0_ce1_b_funcs[] = { 1, };
+static int jz4770_ssi0_ce1_d_funcs[] = { 1, };
+static int jz4770_ssi0_ce1_e_funcs[] = { 0, };
+static int jz4770_ssi1_dt_b_funcs[] = { 2, };
+static int jz4770_ssi1_dt_d_funcs[] = { 2, };
+static int jz4770_ssi1_dt_e_funcs[] = { 1, };
+static int jz4770_ssi1_dr_b_funcs[] = { 2, };
+static int jz4770_ssi1_dr_d_funcs[] = { 2, };
+static int jz4770_ssi1_dr_e_funcs[] = { 1, };
+static int jz4770_ssi1_clk_b_funcs[] = { 2, };
+static int jz4770_ssi1_clk_d_funcs[] = { 2, };
+static int jz4770_ssi1_clk_e_funcs[] = { 1, };
+static int jz4770_ssi1_gpc_b_funcs[] = { 2, };
+static int jz4770_ssi1_gpc_d_funcs[] = { 2, };
+static int jz4770_ssi1_gpc_e_funcs[] = { 1, };
+static int jz4770_ssi1_ce0_b_funcs[] = { 2, };
+static int jz4770_ssi1_ce0_d_funcs[] = { 2, };
+static int jz4770_ssi1_ce0_e_funcs[] = { 1, };
+static int jz4770_ssi1_ce1_b_funcs[] = { 2, };
+static int jz4770_ssi1_ce1_d_funcs[] = { 2, };
+static int jz4770_ssi1_ce1_e_funcs[] = { 1, };
 static int jz4770_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
 static int jz4770_mmc0_4bit_a_funcs[] = { 1, 1, 1, };
 static int jz4770_mmc0_1bit_e_funcs[] = { 0, 0, 0, };
@@ -763,6 +843,46 @@ static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("uart2-hwflow", jz4770_uart2_hwflow),
 	INGENIC_PIN_GROUP("uart3-data", jz4770_uart3_data),
 	INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow),
+	INGENIC_PIN_GROUP("ssi0-dt-a", jz4770_ssi0_dt_a),
+	INGENIC_PIN_GROUP("ssi0-dt-b", jz4770_ssi0_dt_b),
+	INGENIC_PIN_GROUP("ssi0-dt-d", jz4770_ssi0_dt_d),
+	INGENIC_PIN_GROUP("ssi0-dt-e", jz4770_ssi0_dt_e),
+	INGENIC_PIN_GROUP("ssi0-dr-a", jz4770_ssi0_dr_a),
+	INGENIC_PIN_GROUP("ssi0-dr-b", jz4770_ssi0_dr_b),
+	INGENIC_PIN_GROUP("ssi0-dr-d", jz4770_ssi0_dr_d),
+	INGENIC_PIN_GROUP("ssi0-dr-e", jz4770_ssi0_dr_e),
+	INGENIC_PIN_GROUP("ssi0-clk-a", jz4770_ssi0_clk_a),
+	INGENIC_PIN_GROUP("ssi0-clk-b", jz4770_ssi0_clk_b),
+	INGENIC_PIN_GROUP("ssi0-clk-d", jz4770_ssi0_clk_d),
+	INGENIC_PIN_GROUP("ssi0-clk-e", jz4770_ssi0_clk_e),
+	INGENIC_PIN_GROUP("ssi0-gpc-b", jz4770_ssi0_gpc_b),
+	INGENIC_PIN_GROUP("ssi0-gpc-d", jz4770_ssi0_gpc_d),
+	INGENIC_PIN_GROUP("ssi0-gpc-e", jz4770_ssi0_gpc_e),
+	INGENIC_PIN_GROUP("ssi0-ce0-a", jz4770_ssi0_ce0_a),
+	INGENIC_PIN_GROUP("ssi0-ce0-b", jz4770_ssi0_ce0_b),
+	INGENIC_PIN_GROUP("ssi0-ce0-d", jz4770_ssi0_ce0_d),
+	INGENIC_PIN_GROUP("ssi0-ce0-e", jz4770_ssi0_ce0_e),
+	INGENIC_PIN_GROUP("ssi0-ce1-b", jz4770_ssi0_ce1_b),
+	INGENIC_PIN_GROUP("ssi0-ce1-d", jz4770_ssi0_ce1_d),
+	INGENIC_PIN_GROUP("ssi0-ce1-e", jz4770_ssi0_ce1_e),
+	INGENIC_PIN_GROUP("ssi1-dt-b", jz4770_ssi1_dt_b),
+	INGENIC_PIN_GROUP("ssi1-dt-d", jz4770_ssi1_dt_d),
+	INGENIC_PIN_GROUP("ssi1-dt-e", jz4770_ssi1_dt_e),
+	INGENIC_PIN_GROUP("ssi1-dr-b", jz4770_ssi1_dr_b),
+	INGENIC_PIN_GROUP("ssi1-dr-d", jz4770_ssi1_dr_d),
+	INGENIC_PIN_GROUP("ssi1-dr-e", jz4770_ssi1_dr_e),
+	INGENIC_PIN_GROUP("ssi1-clk-b", jz4770_ssi1_clk_b),
+	INGENIC_PIN_GROUP("ssi1-clk-d", jz4770_ssi1_clk_d),
+	INGENIC_PIN_GROUP("ssi1-clk-e", jz4770_ssi1_clk_e),
+	INGENIC_PIN_GROUP("ssi1-gpc-b", jz4770_ssi1_gpc_b),
+	INGENIC_PIN_GROUP("ssi1-gpc-d", jz4770_ssi1_gpc_d),
+	INGENIC_PIN_GROUP("ssi1-gpc-e", jz4770_ssi1_gpc_e),
+	INGENIC_PIN_GROUP("ssi1-ce0-b", jz4770_ssi1_ce0_b),
+	INGENIC_PIN_GROUP("ssi1-ce0-d", jz4770_ssi1_ce0_d),
+	INGENIC_PIN_GROUP("ssi1-ce0-e", jz4770_ssi1_ce0_e),
+	INGENIC_PIN_GROUP("ssi1-ce1-b", jz4770_ssi1_ce1_b),
+	INGENIC_PIN_GROUP("ssi1-ce1-d", jz4770_ssi1_ce1_d),
+	INGENIC_PIN_GROUP("ssi1-ce1-e", jz4770_ssi1_ce1_e),
 	INGENIC_PIN_GROUP("mmc0-1bit-a", jz4770_mmc0_1bit_a),
 	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4770_mmc0_4bit_a),
 	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4770_mmc0_1bit_e),
@@ -815,6 +935,22 @@ static const char *jz4770_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
 static const char *jz4770_uart1_groups[] = { "uart1-data", "uart1-hwflow", };
 static const char *jz4770_uart2_groups[] = { "uart2-data", "uart2-hwflow", };
 static const char *jz4770_uart3_groups[] = { "uart3-data", "uart3-hwflow", };
+static const char *jz4770_ssi0_groups[] = {
+	"ssi0-dt-a", "ssi0-dt-b", "ssi0-dt-d", "ssi0-dt-e",
+	"ssi0-dr-a", "ssi0-dr-b", "ssi0-dr-d", "ssi0-dr-e",
+	"ssi0-clk-a", "ssi0-clk-b", "ssi0-clk-d", "ssi0-clk-e",
+	"ssi0-gpc-b", "ssi0-gpc-d", "ssi0-gpc-e",
+	"ssi0-ce0-a", "ssi0-ce0-b", "ssi0-ce0-d", "ssi0-ce0-e",
+	"ssi0-ce1-b", "ssi0-ce1-d", "ssi0-ce1-e",
+};
+static const char *jz4770_ssi1_groups[] = {
+	"ssi1-dt-b", "ssi1-dt-d", "ssi1-dt-e",
+	"ssi1-dr-b", "ssi1-dr-d", "ssi1-dr-e",
+	"ssi1-clk-b", "ssi1-clk-d", "ssi1-clk-e",
+	"ssi1-gpc-b", "ssi1-gpc-d", "ssi1-gpc-e",
+	"ssi1-ce0-b", "ssi1-ce0-d", "ssi1-ce0-e",
+	"ssi1-ce1-b", "ssi1-ce1-d", "ssi1-ce1-e",
+};
 static const char *jz4770_mmc0_groups[] = {
 	"mmc0-1bit-a", "mmc0-4bit-a",
 	"mmc0-1bit-e", "mmc0-4bit-e", "mmc0-8bit-e",
@@ -858,6 +994,8 @@ static const struct function_desc jz4770_functions[] = {
 	{ "uart1", jz4770_uart1_groups, ARRAY_SIZE(jz4770_uart1_groups), },
 	{ "uart2", jz4770_uart2_groups, ARRAY_SIZE(jz4770_uart2_groups), },
 	{ "uart3", jz4770_uart3_groups, ARRAY_SIZE(jz4770_uart3_groups), },
+	{ "ssi0", jz4770_ssi0_groups, ARRAY_SIZE(jz4770_ssi0_groups), },
+	{ "ssi1", jz4770_ssi1_groups, ARRAY_SIZE(jz4770_ssi1_groups), },
 	{ "mmc0", jz4770_mmc0_groups, ARRAY_SIZE(jz4770_mmc0_groups), },
 	{ "mmc1", jz4770_mmc1_groups, ARRAY_SIZE(jz4770_mmc1_groups), },
 	{ "mmc2", jz4770_mmc2_groups, ARRAY_SIZE(jz4770_mmc2_groups), },
@@ -900,6 +1038,39 @@ static const struct ingenic_chip_info jz4770_chip_info = {
 static int jz4780_uart2_data_pins[] = { 0x66, 0x67, };
 static int jz4780_uart2_hwflow_pins[] = { 0x65, 0x64, };
 static int jz4780_uart4_data_pins[] = { 0x54, 0x4a, };
+static int jz4780_ssi0_dt_a_19_pins[] = { 0x13, };
+static int jz4780_ssi0_dt_a_21_pins[] = { 0x15, };
+static int jz4780_ssi0_dt_a_28_pins[] = { 0x1c, };
+static int jz4780_ssi0_dt_b_pins[] = { 0x3d, };
+static int jz4780_ssi0_dt_d_pins[] = { 0x59, };
+static int jz4780_ssi0_dr_a_20_pins[] = { 0x14, };
+static int jz4780_ssi0_dr_a_27_pins[] = { 0x1b, };
+static int jz4780_ssi0_dr_b_pins[] = { 0x34, };
+static int jz4780_ssi0_dr_d_pins[] = { 0x54, };
+static int jz4780_ssi0_clk_a_pins[] = { 0x12, };
+static int jz4780_ssi0_clk_b_5_pins[] = { 0x25, };
+static int jz4780_ssi0_clk_b_28_pins[] = { 0x3c, };
+static int jz4780_ssi0_clk_d_pins[] = { 0x58, };
+static int jz4780_ssi0_gpc_b_pins[] = { 0x3e, };
+static int jz4780_ssi0_gpc_d_pins[] = { 0x56, };
+static int jz4780_ssi0_ce0_a_23_pins[] = { 0x17, };
+static int jz4780_ssi0_ce0_a_25_pins[] = { 0x19, };
+static int jz4780_ssi0_ce0_b_pins[] = { 0x3f, };
+static int jz4780_ssi0_ce0_d_pins[] = { 0x57, };
+static int jz4780_ssi0_ce1_b_pins[] = { 0x35, };
+static int jz4780_ssi0_ce1_d_pins[] = { 0x55, };
+static int jz4780_ssi1_dt_b_pins[] = { 0x3d, };
+static int jz4780_ssi1_dt_d_pins[] = { 0x59, };
+static int jz4780_ssi1_dr_b_pins[] = { 0x34, };
+static int jz4780_ssi1_dr_d_pins[] = { 0x54, };
+static int jz4780_ssi1_clk_b_pins[] = { 0x3c, };
+static int jz4780_ssi1_clk_d_pins[] = { 0x58, };
+static int jz4780_ssi1_gpc_b_pins[] = { 0x3e, };
+static int jz4780_ssi1_gpc_d_pins[] = { 0x56, };
+static int jz4780_ssi1_ce0_b_pins[] = { 0x3f, };
+static int jz4780_ssi1_ce0_d_pins[] = { 0x57, };
+static int jz4780_ssi1_ce1_b_pins[] = { 0x35, };
+static int jz4780_ssi1_ce1_d_pins[] = { 0x55, };
 static int jz4780_mmc0_8bit_a_pins[] = { 0x04, 0x05, 0x06, 0x07, 0x18, };
 static int jz4780_i2c3_pins[] = { 0x6a, 0x6b, };
 static int jz4780_i2c4_e_pins[] = { 0x8c, 0x8d, };
@@ -909,6 +1080,39 @@ static int jz4780_hdmi_ddc_pins[] = { 0xb9, 0xb8, };
 static int jz4780_uart2_data_funcs[] = { 1, 1, };
 static int jz4780_uart2_hwflow_funcs[] = { 1, 1, };
 static int jz4780_uart4_data_funcs[] = { 2, 2, };
+static int jz4780_ssi0_dt_a_19_funcs[] = { 2, };
+static int jz4780_ssi0_dt_a_21_funcs[] = { 2, };
+static int jz4780_ssi0_dt_a_28_funcs[] = { 2, };
+static int jz4780_ssi0_dt_b_funcs[] = { 1, };
+static int jz4780_ssi0_dt_d_funcs[] = { 1, };
+static int jz4780_ssi0_dr_a_20_funcs[] = { 2, };
+static int jz4780_ssi0_dr_a_27_funcs[] = { 2, };
+static int jz4780_ssi0_dr_b_funcs[] = { 1, };
+static int jz4780_ssi0_dr_d_funcs[] = { 1, };
+static int jz4780_ssi0_clk_a_funcs[] = { 2, };
+static int jz4780_ssi0_clk_b_5_funcs[] = { 1, };
+static int jz4780_ssi0_clk_b_28_funcs[] = { 1, };
+static int jz4780_ssi0_clk_d_funcs[] = { 1, };
+static int jz4780_ssi0_gpc_b_funcs[] = { 1, };
+static int jz4780_ssi0_gpc_d_funcs[] = { 1, };
+static int jz4780_ssi0_ce0_a_23_funcs[] = { 2, };
+static int jz4780_ssi0_ce0_a_25_funcs[] = { 2, };
+static int jz4780_ssi0_ce0_b_funcs[] = { 1, };
+static int jz4780_ssi0_ce0_d_funcs[] = { 1, };
+static int jz4780_ssi0_ce1_b_funcs[] = { 1, };
+static int jz4780_ssi0_ce1_d_funcs[] = { 1, };
+static int jz4780_ssi1_dt_b_funcs[] = { 2, };
+static int jz4780_ssi1_dt_d_funcs[] = { 2, };
+static int jz4780_ssi1_dr_b_funcs[] = { 2, };
+static int jz4780_ssi1_dr_d_funcs[] = { 2, };
+static int jz4780_ssi1_clk_b_funcs[] = { 2, };
+static int jz4780_ssi1_clk_d_funcs[] = { 2, };
+static int jz4780_ssi1_gpc_b_funcs[] = { 2, };
+static int jz4780_ssi1_gpc_d_funcs[] = { 2, };
+static int jz4780_ssi1_ce0_b_funcs[] = { 2, };
+static int jz4780_ssi1_ce0_d_funcs[] = { 2, };
+static int jz4780_ssi1_ce1_b_funcs[] = { 2, };
+static int jz4780_ssi1_ce1_d_funcs[] = { 2, };
 static int jz4780_mmc0_8bit_a_funcs[] = { 1, 1, 1, 1, 1, };
 static int jz4780_i2c3_funcs[] = { 1, 1, };
 static int jz4780_i2c4_e_funcs[] = { 1, 1, };
@@ -925,6 +1129,51 @@ static const struct group_desc jz4780_groups[] = {
 	INGENIC_PIN_GROUP("uart3-data", jz4770_uart3_data),
 	INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow),
 	INGENIC_PIN_GROUP("uart4-data", jz4780_uart4_data),
+	INGENIC_PIN_GROUP("ssi0-dt-a-19", jz4780_ssi0_dt_a_19),
+	INGENIC_PIN_GROUP("ssi0-dt-a-21", jz4780_ssi0_dt_a_21),
+	INGENIC_PIN_GROUP("ssi0-dt-a-28", jz4780_ssi0_dt_a_28),
+	INGENIC_PIN_GROUP("ssi0-dt-b", jz4780_ssi0_dt_b),
+	INGENIC_PIN_GROUP("ssi0-dt-d", jz4780_ssi0_dt_d),
+	INGENIC_PIN_GROUP("ssi0-dt-e", jz4770_ssi0_dt_e),
+	INGENIC_PIN_GROUP("ssi0-dr-a-20", jz4780_ssi0_dr_a_20),
+	INGENIC_PIN_GROUP("ssi0-dr-a-27", jz4780_ssi0_dr_a_27),
+	INGENIC_PIN_GROUP("ssi0-dr-b", jz4780_ssi0_dr_b),
+	INGENIC_PIN_GROUP("ssi0-dr-d", jz4780_ssi0_dr_d),
+	INGENIC_PIN_GROUP("ssi0-dr-e", jz4770_ssi0_dr_e),
+	INGENIC_PIN_GROUP("ssi0-clk-a", jz4780_ssi0_clk_a),
+	INGENIC_PIN_GROUP("ssi0-clk-b-5", jz4780_ssi0_clk_b_5),
+	INGENIC_PIN_GROUP("ssi0-clk-b-28", jz4780_ssi0_clk_b_28),
+	INGENIC_PIN_GROUP("ssi0-clk-d", jz4780_ssi0_clk_d),
+	INGENIC_PIN_GROUP("ssi0-clk-e", jz4770_ssi0_clk_e),
+	INGENIC_PIN_GROUP("ssi0-gpc-b", jz4780_ssi0_gpc_b),
+	INGENIC_PIN_GROUP("ssi0-gpc-d", jz4780_ssi0_gpc_d),
+	INGENIC_PIN_GROUP("ssi0-gpc-e", jz4770_ssi0_gpc_e),
+	INGENIC_PIN_GROUP("ssi0-ce0-a-23", jz4780_ssi0_ce0_a_23),
+	INGENIC_PIN_GROUP("ssi0-ce0-a-25", jz4780_ssi0_ce0_a_25),
+	INGENIC_PIN_GROUP("ssi0-ce0-b", jz4780_ssi0_ce0_b),
+	INGENIC_PIN_GROUP("ssi0-ce0-d", jz4780_ssi0_ce0_d),
+	INGENIC_PIN_GROUP("ssi0-ce0-e", jz4770_ssi0_ce0_e),
+	INGENIC_PIN_GROUP("ssi0-ce1-b", jz4780_ssi0_ce1_b),
+	INGENIC_PIN_GROUP("ssi0-ce1-d", jz4780_ssi0_ce1_d),
+	INGENIC_PIN_GROUP("ssi0-ce1-e", jz4770_ssi0_ce1_e),
+	INGENIC_PIN_GROUP("ssi1-dt-b", jz4780_ssi1_dt_b),
+	INGENIC_PIN_GROUP("ssi1-dt-d", jz4780_ssi1_dt_d),
+	INGENIC_PIN_GROUP("ssi1-dt-e", jz4770_ssi1_dt_e),
+	INGENIC_PIN_GROUP("ssi1-dr-b", jz4780_ssi1_dr_b),
+	INGENIC_PIN_GROUP("ssi1-dr-d", jz4780_ssi1_dr_d),
+	INGENIC_PIN_GROUP("ssi1-dr-e", jz4770_ssi1_dr_e),
+	INGENIC_PIN_GROUP("ssi1-clk-b", jz4780_ssi1_clk_b),
+	INGENIC_PIN_GROUP("ssi1-clk-d", jz4780_ssi1_clk_d),
+	INGENIC_PIN_GROUP("ssi1-clk-e", jz4770_ssi1_clk_e),
+	INGENIC_PIN_GROUP("ssi1-gpc-b", jz4780_ssi1_gpc_b),
+	INGENIC_PIN_GROUP("ssi1-gpc-d", jz4780_ssi1_gpc_d),
+	INGENIC_PIN_GROUP("ssi1-gpc-e", jz4770_ssi1_gpc_e),
+	INGENIC_PIN_GROUP("ssi1-ce0-b", jz4780_ssi1_ce0_b),
+	INGENIC_PIN_GROUP("ssi1-ce0-d", jz4780_ssi1_ce0_d),
+	INGENIC_PIN_GROUP("ssi1-ce0-e", jz4770_ssi1_ce0_e),
+	INGENIC_PIN_GROUP("ssi1-ce1-b", jz4780_ssi1_ce1_b),
+	INGENIC_PIN_GROUP("ssi1-ce1-d", jz4780_ssi1_ce1_d),
+	INGENIC_PIN_GROUP("ssi1-ce1-e", jz4770_ssi1_ce1_e),
 	INGENIC_PIN_GROUP("mmc0-1bit-a", jz4770_mmc0_1bit_a),
 	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4770_mmc0_4bit_a),
 	INGENIC_PIN_GROUP("mmc0-8bit-a", jz4780_mmc0_8bit_a),
@@ -972,6 +1221,22 @@ static const struct group_desc jz4780_groups[] = {
 
 static const char *jz4780_uart2_groups[] = { "uart2-data", "uart2-hwflow", };
 static const char *jz4780_uart4_groups[] = { "uart4-data", };
+static const char *jz4780_ssi0_groups[] = {
+	"ssi0-dt-a-19", "ssi0-dt-a-21", "ssi0-dt-a-28", "ssi0-dt-b", "ssi0-dt-d", "ssi0-dt-e",
+	"ssi0-dr-a-20", "ssi0-dr-a-27", "ssi0-dr-b", "ssi0-dr-d", "ssi0-dr-e",
+	"ssi0-clk-a", "ssi0-clk-b-5", "ssi0-clk-b-28", "ssi0-clk-d", "ssi0-clk-e",
+	"ssi0-gpc-b", "ssi0-gpc-d", "ssi0-gpc-e",
+	"ssi0-ce0-a-23", "ssi0-ce0-a-25", "ssi0-ce0-b", "ssi0-ce0-d", "ssi0-ce0-e",
+	"ssi0-ce1-b", "ssi0-ce1-d", "ssi0-ce1-e",
+};
+static const char *jz4780_ssi1_groups[] = {
+	"ssi1-dt-b", "ssi1-dt-d", "ssi1-dt-e",
+	"ssi1-dr-b", "ssi1-dr-d", "ssi1-dr-e",
+	"ssi1-clk-b", "ssi1-clk-d", "ssi1-clk-e",
+	"ssi1-gpc-b", "ssi1-gpc-d", "ssi1-gpc-e",
+	"ssi1-ce0-b", "ssi1-ce0-d", "ssi1-ce0-e",
+	"ssi1-ce1-b", "ssi1-ce1-d", "ssi1-ce1-e",
+};
 static const char *jz4780_mmc0_groups[] = {
 	"mmc0-1bit-a", "mmc0-4bit-a", "mmc0-8bit-a",
 	"mmc0-1bit-e", "mmc0-4bit-e",
@@ -997,6 +1262,8 @@ static const struct function_desc jz4780_functions[] = {
 	{ "uart2", jz4780_uart2_groups, ARRAY_SIZE(jz4780_uart2_groups), },
 	{ "uart3", jz4770_uart3_groups, ARRAY_SIZE(jz4770_uart3_groups), },
 	{ "uart4", jz4780_uart4_groups, ARRAY_SIZE(jz4780_uart4_groups), },
+	{ "ssi0", jz4780_ssi0_groups, ARRAY_SIZE(jz4780_ssi0_groups), },
+	{ "ssi1", jz4780_ssi1_groups, ARRAY_SIZE(jz4780_ssi1_groups), },
 	{ "mmc0", jz4780_mmc0_groups, ARRAY_SIZE(jz4780_mmc0_groups), },
 	{ "mmc1", jz4780_mmc1_groups, ARRAY_SIZE(jz4780_mmc1_groups), },
 	{ "mmc2", jz4780_mmc2_groups, ARRAY_SIZE(jz4780_mmc2_groups), },
-- 
2.11.0

