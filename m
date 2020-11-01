Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076A52A1CBC
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Nov 2020 10:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgKAJB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Nov 2020 04:01:29 -0500
Received: from aposti.net ([89.234.176.197]:35482 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgKAJB3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 1 Nov 2020 04:01:29 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] pinctrl: ingenic: Get rid of repetitive data
Date:   Sun,  1 Nov 2020 09:01:03 +0000
Message-Id: <20201101090104.5088-2-paul@crapouillou.net>
In-Reply-To: <20201101090104.5088-1-paul@crapouillou.net>
References: <20201101090104.5088-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Abuse the pin function pointer to store the pin function value directly,
when all the pins of a group have the same function value. Now when the
pointer value is <= 3 (unsigned), the pointer value is used as the pin
function; otherwise it is used as a regular pointer.

This drastically reduces the number of pin function tables needed, and
drops .data usage by about 2 KiB. Additionally, the few pin function
tables that are still around now contain u8 instead of int, since the
largest number that will be stored is 3.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 1258 ++++++++++-------------------
 1 file changed, 447 insertions(+), 811 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 621909b01deb..ed63dfb68241 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -134,61 +134,42 @@ static int jz4740_pwm_pwm5_pins[] = { 0x7c, };
 static int jz4740_pwm_pwm6_pins[] = { 0x7e, };
 static int jz4740_pwm_pwm7_pins[] = { 0x7f, };
 
-static int jz4740_mmc_1bit_funcs[] = { 0, 0, 0, };
-static int jz4740_mmc_4bit_funcs[] = { 0, 0, 0, };
-static int jz4740_uart0_data_funcs[] = { 1, 1, };
-static int jz4740_uart0_hwflow_funcs[] = { 1, 1, };
-static int jz4740_uart1_data_funcs[] = { 2, 2, };
-static int jz4740_lcd_8bit_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4740_lcd_16bit_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4740_lcd_18bit_funcs[] = { 0, 0, };
-static int jz4740_lcd_18bit_tft_funcs[] = { 0, 0, 0, 0, };
-static int jz4740_nand_cs1_funcs[] = { 0, };
-static int jz4740_nand_cs2_funcs[] = { 0, };
-static int jz4740_nand_cs3_funcs[] = { 0, };
-static int jz4740_nand_cs4_funcs[] = { 0, };
-static int jz4740_nand_fre_fwe_funcs[] = { 0, 0, };
-static int jz4740_pwm_pwm0_funcs[] = { 0, };
-static int jz4740_pwm_pwm1_funcs[] = { 0, };
-static int jz4740_pwm_pwm2_funcs[] = { 0, };
-static int jz4740_pwm_pwm3_funcs[] = { 0, };
-static int jz4740_pwm_pwm4_funcs[] = { 0, };
-static int jz4740_pwm_pwm5_funcs[] = { 0, };
-static int jz4740_pwm_pwm6_funcs[] = { 0, };
-static int jz4740_pwm_pwm7_funcs[] = { 0, };
-
-#define INGENIC_PIN_GROUP(name, id)			\
+
+#define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
 	{						\
 		name,					\
 		id##_pins,				\
 		ARRAY_SIZE(id##_pins),			\
-		id##_funcs,				\
+		funcs,					\
 	}
 
+#define INGENIC_PIN_GROUP(name, id, func)		\
+	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
+
 static const struct group_desc jz4740_groups[] = {
-	INGENIC_PIN_GROUP("mmc-1bit", jz4740_mmc_1bit),
-	INGENIC_PIN_GROUP("mmc-4bit", jz4740_mmc_4bit),
-	INGENIC_PIN_GROUP("uart0-data", jz4740_uart0_data),
-	INGENIC_PIN_GROUP("uart0-hwflow", jz4740_uart0_hwflow),
-	INGENIC_PIN_GROUP("uart1-data", jz4740_uart1_data),
-	INGENIC_PIN_GROUP("lcd-8bit", jz4740_lcd_8bit),
-	INGENIC_PIN_GROUP("lcd-16bit", jz4740_lcd_16bit),
-	INGENIC_PIN_GROUP("lcd-18bit", jz4740_lcd_18bit),
-	INGENIC_PIN_GROUP("lcd-18bit-tft", jz4740_lcd_18bit_tft),
+	INGENIC_PIN_GROUP("mmc-1bit", jz4740_mmc_1bit, 0),
+	INGENIC_PIN_GROUP("mmc-4bit", jz4740_mmc_4bit, 0),
+	INGENIC_PIN_GROUP("uart0-data", jz4740_uart0_data, 1),
+	INGENIC_PIN_GROUP("uart0-hwflow", jz4740_uart0_hwflow, 1),
+	INGENIC_PIN_GROUP("uart1-data", jz4740_uart1_data, 2),
+	INGENIC_PIN_GROUP("lcd-8bit", jz4740_lcd_8bit, 0),
+	INGENIC_PIN_GROUP("lcd-16bit", jz4740_lcd_16bit, 0),
+	INGENIC_PIN_GROUP("lcd-18bit", jz4740_lcd_18bit, 0),
+	INGENIC_PIN_GROUP("lcd-18bit-tft", jz4740_lcd_18bit_tft, 0),
 	{ "lcd-no-pins", },
-	INGENIC_PIN_GROUP("nand-cs1", jz4740_nand_cs1),
-	INGENIC_PIN_GROUP("nand-cs2", jz4740_nand_cs2),
-	INGENIC_PIN_GROUP("nand-cs3", jz4740_nand_cs3),
-	INGENIC_PIN_GROUP("nand-cs4", jz4740_nand_cs4),
-	INGENIC_PIN_GROUP("nand-fre-fwe", jz4740_nand_fre_fwe),
-	INGENIC_PIN_GROUP("pwm0", jz4740_pwm_pwm0),
-	INGENIC_PIN_GROUP("pwm1", jz4740_pwm_pwm1),
-	INGENIC_PIN_GROUP("pwm2", jz4740_pwm_pwm2),
-	INGENIC_PIN_GROUP("pwm3", jz4740_pwm_pwm3),
-	INGENIC_PIN_GROUP("pwm4", jz4740_pwm_pwm4),
-	INGENIC_PIN_GROUP("pwm5", jz4740_pwm_pwm5),
-	INGENIC_PIN_GROUP("pwm6", jz4740_pwm_pwm6),
-	INGENIC_PIN_GROUP("pwm7", jz4740_pwm_pwm7),
+	INGENIC_PIN_GROUP("nand-cs1", jz4740_nand_cs1, 0),
+	INGENIC_PIN_GROUP("nand-cs2", jz4740_nand_cs2, 0),
+	INGENIC_PIN_GROUP("nand-cs3", jz4740_nand_cs3, 0),
+	INGENIC_PIN_GROUP("nand-cs4", jz4740_nand_cs4, 0),
+	INGENIC_PIN_GROUP("nand-fre-fwe", jz4740_nand_fre_fwe, 0),
+	INGENIC_PIN_GROUP("pwm0", jz4740_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", jz4740_pwm_pwm1, 0),
+	INGENIC_PIN_GROUP("pwm2", jz4740_pwm_pwm2, 0),
+	INGENIC_PIN_GROUP("pwm3", jz4740_pwm_pwm3, 0),
+	INGENIC_PIN_GROUP("pwm4", jz4740_pwm_pwm4, 0),
+	INGENIC_PIN_GROUP("pwm5", jz4740_pwm_pwm5, 0),
+	INGENIC_PIN_GROUP("pwm6", jz4740_pwm_pwm6, 0),
+	INGENIC_PIN_GROUP("pwm7", jz4740_pwm_pwm7, 0),
 };
 
 static const char *jz4740_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
@@ -268,54 +249,33 @@ static int jz4725b_lcd_24bit_pins[] = { 0x76, 0x77, 0x78, 0x79, };
 static int jz4725b_lcd_special_pins[] = { 0x76, 0x77, 0x78, 0x79, };
 static int jz4725b_lcd_generic_pins[] = { 0x75, };
 
-static int jz4725b_mmc0_1bit_funcs[] = { 1, 1, 1, };
-static int jz4725b_mmc0_4bit_funcs[] = { 1, 0, 1, };
-static int jz4725b_mmc1_1bit_funcs[] = { 0, 0, 0, };
-static int jz4725b_mmc1_4bit_funcs[] = { 0, 0, 0, };
-static int jz4725b_uart_data_funcs[] = { 1, 1, };
-static int jz4725b_nand_cs1_funcs[] = { 0, };
-static int jz4725b_nand_cs2_funcs[] = { 0, };
-static int jz4725b_nand_cs3_funcs[] = { 0, };
-static int jz4725b_nand_cs4_funcs[] = { 0, };
-static int jz4725b_nand_cle_ale_funcs[] = { 0, 0, };
-static int jz4725b_nand_fre_fwe_funcs[] = { 0, 0, };
-static int jz4725b_pwm_pwm0_funcs[] = { 0, };
-static int jz4725b_pwm_pwm1_funcs[] = { 0, };
-static int jz4725b_pwm_pwm2_funcs[] = { 0, };
-static int jz4725b_pwm_pwm3_funcs[] = { 0, };
-static int jz4725b_pwm_pwm4_funcs[] = { 0, };
-static int jz4725b_pwm_pwm5_funcs[] = { 0, };
-static int jz4725b_lcd_8bit_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4725b_lcd_16bit_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4725b_lcd_18bit_funcs[] = { 0, 0, };
-static int jz4725b_lcd_24bit_funcs[] = { 1, 1, 1, 1, };
-static int jz4725b_lcd_special_funcs[] = { 0, 0, 0, 0, };
-static int jz4725b_lcd_generic_funcs[] = { 0, };
+static u8 jz4725b_mmc0_4bit_funcs[] = { 1, 0, 1, };
 
 static const struct group_desc jz4725b_groups[] = {
-	INGENIC_PIN_GROUP("mmc0-1bit", jz4725b_mmc0_1bit),
-	INGENIC_PIN_GROUP("mmc0-4bit", jz4725b_mmc0_4bit),
-	INGENIC_PIN_GROUP("mmc1-1bit", jz4725b_mmc1_1bit),
-	INGENIC_PIN_GROUP("mmc1-4bit", jz4725b_mmc1_4bit),
-	INGENIC_PIN_GROUP("uart-data", jz4725b_uart_data),
-	INGENIC_PIN_GROUP("nand-cs1", jz4725b_nand_cs1),
-	INGENIC_PIN_GROUP("nand-cs2", jz4725b_nand_cs2),
-	INGENIC_PIN_GROUP("nand-cs3", jz4725b_nand_cs3),
-	INGENIC_PIN_GROUP("nand-cs4", jz4725b_nand_cs4),
-	INGENIC_PIN_GROUP("nand-cle-ale", jz4725b_nand_cle_ale),
-	INGENIC_PIN_GROUP("nand-fre-fwe", jz4725b_nand_fre_fwe),
-	INGENIC_PIN_GROUP("pwm0", jz4725b_pwm_pwm0),
-	INGENIC_PIN_GROUP("pwm1", jz4725b_pwm_pwm1),
-	INGENIC_PIN_GROUP("pwm2", jz4725b_pwm_pwm2),
-	INGENIC_PIN_GROUP("pwm3", jz4725b_pwm_pwm3),
-	INGENIC_PIN_GROUP("pwm4", jz4725b_pwm_pwm4),
-	INGENIC_PIN_GROUP("pwm5", jz4725b_pwm_pwm5),
-	INGENIC_PIN_GROUP("lcd-8bit", jz4725b_lcd_8bit),
-	INGENIC_PIN_GROUP("lcd-16bit", jz4725b_lcd_16bit),
-	INGENIC_PIN_GROUP("lcd-18bit", jz4725b_lcd_18bit),
-	INGENIC_PIN_GROUP("lcd-24bit", jz4725b_lcd_24bit),
-	INGENIC_PIN_GROUP("lcd-special", jz4725b_lcd_special),
-	INGENIC_PIN_GROUP("lcd-generic", jz4725b_lcd_generic),
+	INGENIC_PIN_GROUP("mmc0-1bit", jz4725b_mmc0_1bit, 1),
+	INGENIC_PIN_GROUP_FUNCS("mmc0-4bit", jz4725b_mmc0_4bit,
+				jz4725b_mmc0_4bit_funcs),
+	INGENIC_PIN_GROUP("mmc1-1bit", jz4725b_mmc1_1bit, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit", jz4725b_mmc1_4bit, 0),
+	INGENIC_PIN_GROUP("uart-data", jz4725b_uart_data, 1),
+	INGENIC_PIN_GROUP("nand-cs1", jz4725b_nand_cs1, 0),
+	INGENIC_PIN_GROUP("nand-cs2", jz4725b_nand_cs2, 0),
+	INGENIC_PIN_GROUP("nand-cs3", jz4725b_nand_cs3, 0),
+	INGENIC_PIN_GROUP("nand-cs4", jz4725b_nand_cs4, 0),
+	INGENIC_PIN_GROUP("nand-cle-ale", jz4725b_nand_cle_ale, 0),
+	INGENIC_PIN_GROUP("nand-fre-fwe", jz4725b_nand_fre_fwe, 0),
+	INGENIC_PIN_GROUP("pwm0", jz4725b_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", jz4725b_pwm_pwm1, 0),
+	INGENIC_PIN_GROUP("pwm2", jz4725b_pwm_pwm2, 0),
+	INGENIC_PIN_GROUP("pwm3", jz4725b_pwm_pwm3, 0),
+	INGENIC_PIN_GROUP("pwm4", jz4725b_pwm_pwm4, 0),
+	INGENIC_PIN_GROUP("pwm5", jz4725b_pwm_pwm5, 0),
+	INGENIC_PIN_GROUP("lcd-8bit", jz4725b_lcd_8bit, 0),
+	INGENIC_PIN_GROUP("lcd-16bit", jz4725b_lcd_16bit, 0),
+	INGENIC_PIN_GROUP("lcd-18bit", jz4725b_lcd_18bit, 0),
+	INGENIC_PIN_GROUP("lcd-24bit", jz4725b_lcd_24bit, 1),
+	INGENIC_PIN_GROUP("lcd-special", jz4725b_lcd_special, 0),
+	INGENIC_PIN_GROUP("lcd-generic", jz4725b_lcd_generic, 0),
 };
 
 static const char *jz4725b_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
@@ -431,110 +391,61 @@ static int jz4760_pwm_pwm5_pins[] = { 0x85, };
 static int jz4760_pwm_pwm6_pins[] = { 0x6a, };
 static int jz4760_pwm_pwm7_pins[] = { 0x6b, };
 
-static int jz4760_uart0_data_funcs[] = { 0, 0, };
-static int jz4760_uart0_hwflow_funcs[] = { 0, 0, };
-static int jz4760_uart1_data_funcs[] = { 0, 0, };
-static int jz4760_uart1_hwflow_funcs[] = { 0, 0, };
-static int jz4760_uart2_data_funcs[] = { 0, 0, };
-static int jz4760_uart2_hwflow_funcs[] = { 0, 0, };
-static int jz4760_uart3_data_funcs[] = { 0, 1, };
-static int jz4760_uart3_hwflow_funcs[] = { 0, 0, };
-static int jz4760_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
-static int jz4760_mmc0_4bit_a_funcs[] = { 1, 1, 1, };
-static int jz4760_mmc0_1bit_e_funcs[] = { 0, 0, 0, };
-static int jz4760_mmc0_4bit_e_funcs[] = { 0, 0, 0, };
-static int jz4760_mmc0_8bit_e_funcs[] = { 0, 0, 0, 0, };
-static int jz4760_mmc1_1bit_d_funcs[] = { 0, 0, 0, };
-static int jz4760_mmc1_4bit_d_funcs[] = { 0, 0, 0, };
-static int jz4760_mmc1_1bit_e_funcs[] = { 1, 1, 1, };
-static int jz4760_mmc1_4bit_e_funcs[] = { 1, 1, 1, };
-static int jz4760_mmc1_8bit_e_funcs[] = { 1, 1, 1, 1, };
-static int jz4760_mmc2_1bit_b_funcs[] = { 0, 0, 0, };
-static int jz4760_mmc2_4bit_b_funcs[] = { 0, 0, 0, };
-static int jz4760_mmc2_1bit_e_funcs[] = { 2, 2, 2, };
-static int jz4760_mmc2_4bit_e_funcs[] = { 2, 2, 2, };
-static int jz4760_mmc2_8bit_e_funcs[] = { 2, 2, 2, 2, };
-static int jz4760_nemc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4760_nemc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4760_nemc_cle_ale_funcs[] = { 0, 0, };
-static int jz4760_nemc_addr_funcs[] = { 0, 0, 0, 0, };
-static int jz4760_nemc_rd_we_funcs[] = { 0, 0, };
-static int jz4760_nemc_frd_fwe_funcs[] = { 0, 0, };
-static int jz4760_nemc_wait_funcs[] = { 0, };
-static int jz4760_nemc_cs1_funcs[] = { 0, };
-static int jz4760_nemc_cs2_funcs[] = { 0, };
-static int jz4760_nemc_cs3_funcs[] = { 0, };
-static int jz4760_nemc_cs4_funcs[] = { 0, };
-static int jz4760_nemc_cs5_funcs[] = { 0, };
-static int jz4760_nemc_cs6_funcs[] = { 0, };
-static int jz4760_i2c0_funcs[] = { 0, 0, };
-static int jz4760_i2c1_funcs[] = { 0, 0, };
-static int jz4760_cim_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4760_lcd_24bit_funcs[] = {
-	0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0,
-};
-static int jz4760_pwm_pwm0_funcs[] = { 0, };
-static int jz4760_pwm_pwm1_funcs[] = { 0, };
-static int jz4760_pwm_pwm2_funcs[] = { 0, };
-static int jz4760_pwm_pwm3_funcs[] = { 0, };
-static int jz4760_pwm_pwm4_funcs[] = { 0, };
-static int jz4760_pwm_pwm5_funcs[] = { 0, };
-static int jz4760_pwm_pwm6_funcs[] = { 0, };
-static int jz4760_pwm_pwm7_funcs[] = { 0, };
+static u8 jz4760_uart3_data_funcs[] = { 0, 1, };
+static u8 jz4760_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
 
 static const struct group_desc jz4760_groups[] = {
-	INGENIC_PIN_GROUP("uart0-data", jz4760_uart0_data),
-	INGENIC_PIN_GROUP("uart0-hwflow", jz4760_uart0_hwflow),
-	INGENIC_PIN_GROUP("uart1-data", jz4760_uart1_data),
-	INGENIC_PIN_GROUP("uart1-hwflow", jz4760_uart1_hwflow),
-	INGENIC_PIN_GROUP("uart2-data", jz4760_uart2_data),
-	INGENIC_PIN_GROUP("uart2-hwflow", jz4760_uart2_hwflow),
-	INGENIC_PIN_GROUP("uart3-data", jz4760_uart3_data),
-	INGENIC_PIN_GROUP("uart3-hwflow", jz4760_uart3_hwflow),
-	INGENIC_PIN_GROUP("mmc0-1bit-a", jz4760_mmc0_1bit_a),
-	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4760_mmc0_4bit_a),
-	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4760_mmc0_1bit_e),
-	INGENIC_PIN_GROUP("mmc0-4bit-e", jz4760_mmc0_4bit_e),
-	INGENIC_PIN_GROUP("mmc0-8bit-e", jz4760_mmc0_8bit_e),
-	INGENIC_PIN_GROUP("mmc1-1bit-d", jz4760_mmc1_1bit_d),
-	INGENIC_PIN_GROUP("mmc1-4bit-d", jz4760_mmc1_4bit_d),
-	INGENIC_PIN_GROUP("mmc1-1bit-e", jz4760_mmc1_1bit_e),
-	INGENIC_PIN_GROUP("mmc1-4bit-e", jz4760_mmc1_4bit_e),
-	INGENIC_PIN_GROUP("mmc1-8bit-e", jz4760_mmc1_8bit_e),
-	INGENIC_PIN_GROUP("mmc2-1bit-b", jz4760_mmc2_1bit_b),
-	INGENIC_PIN_GROUP("mmc2-4bit-b", jz4760_mmc2_4bit_b),
-	INGENIC_PIN_GROUP("mmc2-1bit-e", jz4760_mmc2_1bit_e),
-	INGENIC_PIN_GROUP("mmc2-4bit-e", jz4760_mmc2_4bit_e),
-	INGENIC_PIN_GROUP("mmc2-8bit-e", jz4760_mmc2_8bit_e),
-	INGENIC_PIN_GROUP("nemc-8bit-data", jz4760_nemc_8bit_data),
-	INGENIC_PIN_GROUP("nemc-16bit-data", jz4760_nemc_16bit_data),
-	INGENIC_PIN_GROUP("nemc-cle-ale", jz4760_nemc_cle_ale),
-	INGENIC_PIN_GROUP("nemc-addr", jz4760_nemc_addr),
-	INGENIC_PIN_GROUP("nemc-rd-we", jz4760_nemc_rd_we),
-	INGENIC_PIN_GROUP("nemc-frd-fwe", jz4760_nemc_frd_fwe),
-	INGENIC_PIN_GROUP("nemc-wait", jz4760_nemc_wait),
-	INGENIC_PIN_GROUP("nemc-cs1", jz4760_nemc_cs1),
-	INGENIC_PIN_GROUP("nemc-cs2", jz4760_nemc_cs2),
-	INGENIC_PIN_GROUP("nemc-cs3", jz4760_nemc_cs3),
-	INGENIC_PIN_GROUP("nemc-cs4", jz4760_nemc_cs4),
-	INGENIC_PIN_GROUP("nemc-cs5", jz4760_nemc_cs5),
-	INGENIC_PIN_GROUP("nemc-cs6", jz4760_nemc_cs6),
-	INGENIC_PIN_GROUP("i2c0-data", jz4760_i2c0),
-	INGENIC_PIN_GROUP("i2c1-data", jz4760_i2c1),
-	INGENIC_PIN_GROUP("cim-data", jz4760_cim),
-	INGENIC_PIN_GROUP("lcd-24bit", jz4760_lcd_24bit),
+	INGENIC_PIN_GROUP("uart0-data", jz4760_uart0_data, 0),
+	INGENIC_PIN_GROUP("uart0-hwflow", jz4760_uart0_hwflow, 0),
+	INGENIC_PIN_GROUP("uart1-data", jz4760_uart1_data, 0),
+	INGENIC_PIN_GROUP("uart1-hwflow", jz4760_uart1_hwflow, 0),
+	INGENIC_PIN_GROUP("uart2-data", jz4760_uart2_data, 0),
+	INGENIC_PIN_GROUP("uart2-hwflow", jz4760_uart2_hwflow, 0),
+	INGENIC_PIN_GROUP_FUNCS("uart3-data", jz4760_uart3_data,
+				jz4760_uart3_data_funcs),
+	INGENIC_PIN_GROUP("uart3-hwflow", jz4760_uart3_hwflow, 0),
+	INGENIC_PIN_GROUP_FUNCS("mmc0-1bit-a", jz4760_mmc0_1bit_a,
+				jz4760_mmc0_1bit_a_funcs),
+	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4760_mmc0_4bit_a, 1),
+	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4760_mmc0_1bit_e, 0),
+	INGENIC_PIN_GROUP("mmc0-4bit-e", jz4760_mmc0_4bit_e, 0),
+	INGENIC_PIN_GROUP("mmc0-8bit-e", jz4760_mmc0_8bit_e, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit-d", jz4760_mmc1_1bit_d, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit-d", jz4760_mmc1_4bit_d, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit-e", jz4760_mmc1_1bit_e, 1),
+	INGENIC_PIN_GROUP("mmc1-4bit-e", jz4760_mmc1_4bit_e, 1),
+	INGENIC_PIN_GROUP("mmc1-8bit-e", jz4760_mmc1_8bit_e, 1),
+	INGENIC_PIN_GROUP("mmc2-1bit-b", jz4760_mmc2_1bit_b, 0),
+	INGENIC_PIN_GROUP("mmc2-4bit-b", jz4760_mmc2_4bit_b, 0),
+	INGENIC_PIN_GROUP("mmc2-1bit-e", jz4760_mmc2_1bit_e, 2),
+	INGENIC_PIN_GROUP("mmc2-4bit-e", jz4760_mmc2_4bit_e, 2),
+	INGENIC_PIN_GROUP("mmc2-8bit-e", jz4760_mmc2_8bit_e, 2),
+	INGENIC_PIN_GROUP("nemc-8bit-data", jz4760_nemc_8bit_data, 0),
+	INGENIC_PIN_GROUP("nemc-16bit-data", jz4760_nemc_16bit_data, 0),
+	INGENIC_PIN_GROUP("nemc-cle-ale", jz4760_nemc_cle_ale, 0),
+	INGENIC_PIN_GROUP("nemc-addr", jz4760_nemc_addr, 0),
+	INGENIC_PIN_GROUP("nemc-rd-we", jz4760_nemc_rd_we, 0),
+	INGENIC_PIN_GROUP("nemc-frd-fwe", jz4760_nemc_frd_fwe, 0),
+	INGENIC_PIN_GROUP("nemc-wait", jz4760_nemc_wait, 0),
+	INGENIC_PIN_GROUP("nemc-cs1", jz4760_nemc_cs1, 0),
+	INGENIC_PIN_GROUP("nemc-cs2", jz4760_nemc_cs2, 0),
+	INGENIC_PIN_GROUP("nemc-cs3", jz4760_nemc_cs3, 0),
+	INGENIC_PIN_GROUP("nemc-cs4", jz4760_nemc_cs4, 0),
+	INGENIC_PIN_GROUP("nemc-cs5", jz4760_nemc_cs5, 0),
+	INGENIC_PIN_GROUP("nemc-cs6", jz4760_nemc_cs6, 0),
+	INGENIC_PIN_GROUP("i2c0-data", jz4760_i2c0, 0),
+	INGENIC_PIN_GROUP("i2c1-data", jz4760_i2c1, 0),
+	INGENIC_PIN_GROUP("cim-data", jz4760_cim, 0),
+	INGENIC_PIN_GROUP("lcd-24bit", jz4760_lcd_24bit, 0),
 	{ "lcd-no-pins", },
-	INGENIC_PIN_GROUP("pwm0", jz4760_pwm_pwm0),
-	INGENIC_PIN_GROUP("pwm1", jz4760_pwm_pwm1),
-	INGENIC_PIN_GROUP("pwm2", jz4760_pwm_pwm2),
-	INGENIC_PIN_GROUP("pwm3", jz4760_pwm_pwm3),
-	INGENIC_PIN_GROUP("pwm4", jz4760_pwm_pwm4),
-	INGENIC_PIN_GROUP("pwm5", jz4760_pwm_pwm5),
-	INGENIC_PIN_GROUP("pwm6", jz4760_pwm_pwm6),
-	INGENIC_PIN_GROUP("pwm7", jz4760_pwm_pwm7),
+	INGENIC_PIN_GROUP("pwm0", jz4760_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", jz4760_pwm_pwm1, 0),
+	INGENIC_PIN_GROUP("pwm2", jz4760_pwm_pwm2, 0),
+	INGENIC_PIN_GROUP("pwm3", jz4760_pwm_pwm3, 0),
+	INGENIC_PIN_GROUP("pwm4", jz4760_pwm_pwm4, 0),
+	INGENIC_PIN_GROUP("pwm5", jz4760_pwm_pwm5, 0),
+	INGENIC_PIN_GROUP("pwm6", jz4760_pwm_pwm6, 0),
+	INGENIC_PIN_GROUP("pwm7", jz4760_pwm_pwm7, 0),
 };
 
 static const char *jz4760_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -735,200 +646,103 @@ static int jz4770_mac_rmii_pins[] = {
 static int jz4770_mac_mii_pins[] = { 0xa7, 0xaf, };
 static int jz4770_otg_pins[] = { 0x8a, };
 
-static int jz4770_uart0_data_funcs[] = { 0, 0, };
-static int jz4770_uart0_hwflow_funcs[] = { 0, 0, };
-static int jz4770_uart1_data_funcs[] = { 0, 0, };
-static int jz4770_uart1_hwflow_funcs[] = { 0, 0, };
-static int jz4770_uart2_data_funcs[] = { 0, 0, };
-static int jz4770_uart2_hwflow_funcs[] = { 0, 0, };
-static int jz4770_uart3_data_funcs[] = { 0, 1, };
-static int jz4770_uart3_hwflow_funcs[] = { 0, 0, };
-static int jz4770_ssi0_dt_a_funcs[] = { 2, };
-static int jz4770_ssi0_dt_b_funcs[] = { 1, };
-static int jz4770_ssi0_dt_d_funcs[] = { 1, };
-static int jz4770_ssi0_dt_e_funcs[] = { 0, };
-static int jz4770_ssi0_dr_a_funcs[] = { 1, };
-static int jz4770_ssi0_dr_b_funcs[] = { 1, };
-static int jz4770_ssi0_dr_d_funcs[] = { 1, };
-static int jz4770_ssi0_dr_e_funcs[] = { 0, };
-static int jz4770_ssi0_clk_a_funcs[] = { 2, };
-static int jz4770_ssi0_clk_b_funcs[] = { 1, };
-static int jz4770_ssi0_clk_d_funcs[] = { 1, };
-static int jz4770_ssi0_clk_e_funcs[] = { 0, };
-static int jz4770_ssi0_gpc_b_funcs[] = { 1, };
-static int jz4770_ssi0_gpc_d_funcs[] = { 1, };
-static int jz4770_ssi0_gpc_e_funcs[] = { 0, };
-static int jz4770_ssi0_ce0_a_funcs[] = { 2, };
-static int jz4770_ssi0_ce0_b_funcs[] = { 1, };
-static int jz4770_ssi0_ce0_d_funcs[] = { 1, };
-static int jz4770_ssi0_ce0_e_funcs[] = { 0, };
-static int jz4770_ssi0_ce1_b_funcs[] = { 1, };
-static int jz4770_ssi0_ce1_d_funcs[] = { 1, };
-static int jz4770_ssi0_ce1_e_funcs[] = { 0, };
-static int jz4770_ssi1_dt_b_funcs[] = { 2, };
-static int jz4770_ssi1_dt_d_funcs[] = { 2, };
-static int jz4770_ssi1_dt_e_funcs[] = { 1, };
-static int jz4770_ssi1_dr_b_funcs[] = { 2, };
-static int jz4770_ssi1_dr_d_funcs[] = { 2, };
-static int jz4770_ssi1_dr_e_funcs[] = { 1, };
-static int jz4770_ssi1_clk_b_funcs[] = { 2, };
-static int jz4770_ssi1_clk_d_funcs[] = { 2, };
-static int jz4770_ssi1_clk_e_funcs[] = { 1, };
-static int jz4770_ssi1_gpc_b_funcs[] = { 2, };
-static int jz4770_ssi1_gpc_d_funcs[] = { 2, };
-static int jz4770_ssi1_gpc_e_funcs[] = { 1, };
-static int jz4770_ssi1_ce0_b_funcs[] = { 2, };
-static int jz4770_ssi1_ce0_d_funcs[] = { 2, };
-static int jz4770_ssi1_ce0_e_funcs[] = { 1, };
-static int jz4770_ssi1_ce1_b_funcs[] = { 2, };
-static int jz4770_ssi1_ce1_d_funcs[] = { 2, };
-static int jz4770_ssi1_ce1_e_funcs[] = { 1, };
-static int jz4770_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
-static int jz4770_mmc0_4bit_a_funcs[] = { 1, 1, 1, };
-static int jz4770_mmc0_1bit_e_funcs[] = { 0, 0, 0, };
-static int jz4770_mmc0_4bit_e_funcs[] = { 0, 0, 0, };
-static int jz4770_mmc0_8bit_e_funcs[] = { 0, 0, 0, 0, };
-static int jz4770_mmc1_1bit_d_funcs[] = { 0, 0, 0, };
-static int jz4770_mmc1_4bit_d_funcs[] = { 0, 0, 0, };
-static int jz4770_mmc1_1bit_e_funcs[] = { 1, 1, 1, };
-static int jz4770_mmc1_4bit_e_funcs[] = { 1, 1, 1, };
-static int jz4770_mmc1_8bit_e_funcs[] = { 1, 1, 1, 1, };
-static int jz4770_mmc2_1bit_b_funcs[] = { 0, 0, 0, };
-static int jz4770_mmc2_4bit_b_funcs[] = { 0, 0, 0, };
-static int jz4770_mmc2_1bit_e_funcs[] = { 2, 2, 2, };
-static int jz4770_mmc2_4bit_e_funcs[] = { 2, 2, 2, };
-static int jz4770_mmc2_8bit_e_funcs[] = { 2, 2, 2, 2, };
-static int jz4770_nemc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4770_nemc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4770_nemc_cle_ale_funcs[] = { 0, 0, };
-static int jz4770_nemc_addr_funcs[] = { 0, 0, 0, 0, };
-static int jz4770_nemc_rd_we_funcs[] = { 0, 0, };
-static int jz4770_nemc_frd_fwe_funcs[] = { 0, 0, };
-static int jz4770_nemc_wait_funcs[] = { 0, };
-static int jz4770_nemc_cs1_funcs[] = { 0, };
-static int jz4770_nemc_cs2_funcs[] = { 0, };
-static int jz4770_nemc_cs3_funcs[] = { 0, };
-static int jz4770_nemc_cs4_funcs[] = { 0, };
-static int jz4770_nemc_cs5_funcs[] = { 0, };
-static int jz4770_nemc_cs6_funcs[] = { 0, };
-static int jz4770_i2c0_funcs[] = { 0, 0, };
-static int jz4770_i2c1_funcs[] = { 0, 0, };
-static int jz4770_i2c2_funcs[] = { 2, 2, };
-static int jz4770_cim_8bit_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4770_cim_12bit_funcs[] = { 0, 0, 0, 0, };
-static int jz4770_lcd_24bit_funcs[] = {
-	0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0,
-};
-static int jz4770_pwm_pwm0_funcs[] = { 0, };
-static int jz4770_pwm_pwm1_funcs[] = { 0, };
-static int jz4770_pwm_pwm2_funcs[] = { 0, };
-static int jz4770_pwm_pwm3_funcs[] = { 0, };
-static int jz4770_pwm_pwm4_funcs[] = { 0, };
-static int jz4770_pwm_pwm5_funcs[] = { 0, };
-static int jz4770_pwm_pwm6_funcs[] = { 0, };
-static int jz4770_pwm_pwm7_funcs[] = { 0, };
-static int jz4770_mac_rmii_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
-static int jz4770_mac_mii_funcs[] = { 0, 0, };
-static int jz4770_otg_funcs[] = { 0, };
-
 static const struct group_desc jz4770_groups[] = {
-	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data),
-	INGENIC_PIN_GROUP("uart0-hwflow", jz4770_uart0_hwflow),
-	INGENIC_PIN_GROUP("uart1-data", jz4770_uart1_data),
-	INGENIC_PIN_GROUP("uart1-hwflow", jz4770_uart1_hwflow),
-	INGENIC_PIN_GROUP("uart2-data", jz4770_uart2_data),
-	INGENIC_PIN_GROUP("uart2-hwflow", jz4770_uart2_hwflow),
-	INGENIC_PIN_GROUP("uart3-data", jz4770_uart3_data),
-	INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow),
-	INGENIC_PIN_GROUP("ssi0-dt-a", jz4770_ssi0_dt_a),
-	INGENIC_PIN_GROUP("ssi0-dt-b", jz4770_ssi0_dt_b),
-	INGENIC_PIN_GROUP("ssi0-dt-d", jz4770_ssi0_dt_d),
-	INGENIC_PIN_GROUP("ssi0-dt-e", jz4770_ssi0_dt_e),
-	INGENIC_PIN_GROUP("ssi0-dr-a", jz4770_ssi0_dr_a),
-	INGENIC_PIN_GROUP("ssi0-dr-b", jz4770_ssi0_dr_b),
-	INGENIC_PIN_GROUP("ssi0-dr-d", jz4770_ssi0_dr_d),
-	INGENIC_PIN_GROUP("ssi0-dr-e", jz4770_ssi0_dr_e),
-	INGENIC_PIN_GROUP("ssi0-clk-a", jz4770_ssi0_clk_a),
-	INGENIC_PIN_GROUP("ssi0-clk-b", jz4770_ssi0_clk_b),
-	INGENIC_PIN_GROUP("ssi0-clk-d", jz4770_ssi0_clk_d),
-	INGENIC_PIN_GROUP("ssi0-clk-e", jz4770_ssi0_clk_e),
-	INGENIC_PIN_GROUP("ssi0-gpc-b", jz4770_ssi0_gpc_b),
-	INGENIC_PIN_GROUP("ssi0-gpc-d", jz4770_ssi0_gpc_d),
-	INGENIC_PIN_GROUP("ssi0-gpc-e", jz4770_ssi0_gpc_e),
-	INGENIC_PIN_GROUP("ssi0-ce0-a", jz4770_ssi0_ce0_a),
-	INGENIC_PIN_GROUP("ssi0-ce0-b", jz4770_ssi0_ce0_b),
-	INGENIC_PIN_GROUP("ssi0-ce0-d", jz4770_ssi0_ce0_d),
-	INGENIC_PIN_GROUP("ssi0-ce0-e", jz4770_ssi0_ce0_e),
-	INGENIC_PIN_GROUP("ssi0-ce1-b", jz4770_ssi0_ce1_b),
-	INGENIC_PIN_GROUP("ssi0-ce1-d", jz4770_ssi0_ce1_d),
-	INGENIC_PIN_GROUP("ssi0-ce1-e", jz4770_ssi0_ce1_e),
-	INGENIC_PIN_GROUP("ssi1-dt-b", jz4770_ssi1_dt_b),
-	INGENIC_PIN_GROUP("ssi1-dt-d", jz4770_ssi1_dt_d),
-	INGENIC_PIN_GROUP("ssi1-dt-e", jz4770_ssi1_dt_e),
-	INGENIC_PIN_GROUP("ssi1-dr-b", jz4770_ssi1_dr_b),
-	INGENIC_PIN_GROUP("ssi1-dr-d", jz4770_ssi1_dr_d),
-	INGENIC_PIN_GROUP("ssi1-dr-e", jz4770_ssi1_dr_e),
-	INGENIC_PIN_GROUP("ssi1-clk-b", jz4770_ssi1_clk_b),
-	INGENIC_PIN_GROUP("ssi1-clk-d", jz4770_ssi1_clk_d),
-	INGENIC_PIN_GROUP("ssi1-clk-e", jz4770_ssi1_clk_e),
-	INGENIC_PIN_GROUP("ssi1-gpc-b", jz4770_ssi1_gpc_b),
-	INGENIC_PIN_GROUP("ssi1-gpc-d", jz4770_ssi1_gpc_d),
-	INGENIC_PIN_GROUP("ssi1-gpc-e", jz4770_ssi1_gpc_e),
-	INGENIC_PIN_GROUP("ssi1-ce0-b", jz4770_ssi1_ce0_b),
-	INGENIC_PIN_GROUP("ssi1-ce0-d", jz4770_ssi1_ce0_d),
-	INGENIC_PIN_GROUP("ssi1-ce0-e", jz4770_ssi1_ce0_e),
-	INGENIC_PIN_GROUP("ssi1-ce1-b", jz4770_ssi1_ce1_b),
-	INGENIC_PIN_GROUP("ssi1-ce1-d", jz4770_ssi1_ce1_d),
-	INGENIC_PIN_GROUP("ssi1-ce1-e", jz4770_ssi1_ce1_e),
-	INGENIC_PIN_GROUP("mmc0-1bit-a", jz4770_mmc0_1bit_a),
-	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4770_mmc0_4bit_a),
-	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4770_mmc0_1bit_e),
-	INGENIC_PIN_GROUP("mmc0-4bit-e", jz4770_mmc0_4bit_e),
-	INGENIC_PIN_GROUP("mmc0-8bit-e", jz4770_mmc0_8bit_e),
-	INGENIC_PIN_GROUP("mmc1-1bit-d", jz4770_mmc1_1bit_d),
-	INGENIC_PIN_GROUP("mmc1-4bit-d", jz4770_mmc1_4bit_d),
-	INGENIC_PIN_GROUP("mmc1-1bit-e", jz4770_mmc1_1bit_e),
-	INGENIC_PIN_GROUP("mmc1-4bit-e", jz4770_mmc1_4bit_e),
-	INGENIC_PIN_GROUP("mmc1-8bit-e", jz4770_mmc1_8bit_e),
-	INGENIC_PIN_GROUP("mmc2-1bit-b", jz4770_mmc2_1bit_b),
-	INGENIC_PIN_GROUP("mmc2-4bit-b", jz4770_mmc2_4bit_b),
-	INGENIC_PIN_GROUP("mmc2-1bit-e", jz4770_mmc2_1bit_e),
-	INGENIC_PIN_GROUP("mmc2-4bit-e", jz4770_mmc2_4bit_e),
-	INGENIC_PIN_GROUP("mmc2-8bit-e", jz4770_mmc2_8bit_e),
-	INGENIC_PIN_GROUP("nemc-8bit-data", jz4770_nemc_8bit_data),
-	INGENIC_PIN_GROUP("nemc-16bit-data", jz4770_nemc_16bit_data),
-	INGENIC_PIN_GROUP("nemc-cle-ale", jz4770_nemc_cle_ale),
-	INGENIC_PIN_GROUP("nemc-addr", jz4770_nemc_addr),
-	INGENIC_PIN_GROUP("nemc-rd-we", jz4770_nemc_rd_we),
-	INGENIC_PIN_GROUP("nemc-frd-fwe", jz4770_nemc_frd_fwe),
-	INGENIC_PIN_GROUP("nemc-wait", jz4770_nemc_wait),
-	INGENIC_PIN_GROUP("nemc-cs1", jz4770_nemc_cs1),
-	INGENIC_PIN_GROUP("nemc-cs2", jz4770_nemc_cs2),
-	INGENIC_PIN_GROUP("nemc-cs3", jz4770_nemc_cs3),
-	INGENIC_PIN_GROUP("nemc-cs4", jz4770_nemc_cs4),
-	INGENIC_PIN_GROUP("nemc-cs5", jz4770_nemc_cs5),
-	INGENIC_PIN_GROUP("nemc-cs6", jz4770_nemc_cs6),
-	INGENIC_PIN_GROUP("i2c0-data", jz4770_i2c0),
-	INGENIC_PIN_GROUP("i2c1-data", jz4770_i2c1),
-	INGENIC_PIN_GROUP("i2c2-data", jz4770_i2c2),
-	INGENIC_PIN_GROUP("cim-data-8bit", jz4770_cim_8bit),
-	INGENIC_PIN_GROUP("cim-data-12bit", jz4770_cim_12bit),
-	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit),
+	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
+	INGENIC_PIN_GROUP("uart0-hwflow", jz4770_uart0_hwflow, 0),
+	INGENIC_PIN_GROUP("uart1-data", jz4770_uart1_data, 0),
+	INGENIC_PIN_GROUP("uart1-hwflow", jz4770_uart1_hwflow, 0),
+	INGENIC_PIN_GROUP("uart2-data", jz4770_uart2_data, 0),
+	INGENIC_PIN_GROUP("uart2-hwflow", jz4770_uart2_hwflow, 0),
+	INGENIC_PIN_GROUP_FUNCS("uart3-data", jz4770_uart3_data,
+				jz4760_uart3_data_funcs),
+	INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow, 0),
+	INGENIC_PIN_GROUP("ssi0-dt-a", jz4770_ssi0_dt_a, 2),
+	INGENIC_PIN_GROUP("ssi0-dt-b", jz4770_ssi0_dt_b, 1),
+	INGENIC_PIN_GROUP("ssi0-dt-d", jz4770_ssi0_dt_d, 1),
+	INGENIC_PIN_GROUP("ssi0-dt-e", jz4770_ssi0_dt_e, 0),
+	INGENIC_PIN_GROUP("ssi0-dr-a", jz4770_ssi0_dr_a, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-b", jz4770_ssi0_dr_b, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-d", jz4770_ssi0_dr_d, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-e", jz4770_ssi0_dr_e, 0),
+	INGENIC_PIN_GROUP("ssi0-clk-a", jz4770_ssi0_clk_a, 2),
+	INGENIC_PIN_GROUP("ssi0-clk-b", jz4770_ssi0_clk_b, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-d", jz4770_ssi0_clk_d, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-e", jz4770_ssi0_clk_e, 0),
+	INGENIC_PIN_GROUP("ssi0-gpc-b", jz4770_ssi0_gpc_b, 1),
+	INGENIC_PIN_GROUP("ssi0-gpc-d", jz4770_ssi0_gpc_d, 1),
+	INGENIC_PIN_GROUP("ssi0-gpc-e", jz4770_ssi0_gpc_e, 0),
+	INGENIC_PIN_GROUP("ssi0-ce0-a", jz4770_ssi0_ce0_a, 2),
+	INGENIC_PIN_GROUP("ssi0-ce0-b", jz4770_ssi0_ce0_b, 1),
+	INGENIC_PIN_GROUP("ssi0-ce0-d", jz4770_ssi0_ce0_d, 1),
+	INGENIC_PIN_GROUP("ssi0-ce0-e", jz4770_ssi0_ce0_e, 0),
+	INGENIC_PIN_GROUP("ssi0-ce1-b", jz4770_ssi0_ce1_b, 1),
+	INGENIC_PIN_GROUP("ssi0-ce1-d", jz4770_ssi0_ce1_d, 1),
+	INGENIC_PIN_GROUP("ssi0-ce1-e", jz4770_ssi0_ce1_e, 0),
+	INGENIC_PIN_GROUP("ssi1-dt-b", jz4770_ssi1_dt_b, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-d", jz4770_ssi1_dt_d, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-e", jz4770_ssi1_dt_e, 1),
+	INGENIC_PIN_GROUP("ssi1-dr-b", jz4770_ssi1_dr_b, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-d", jz4770_ssi1_dr_d, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-e", jz4770_ssi1_dr_e, 1),
+	INGENIC_PIN_GROUP("ssi1-clk-b", jz4770_ssi1_clk_b, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-d", jz4770_ssi1_clk_d, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-e", jz4770_ssi1_clk_e, 1),
+	INGENIC_PIN_GROUP("ssi1-gpc-b", jz4770_ssi1_gpc_b, 2),
+	INGENIC_PIN_GROUP("ssi1-gpc-d", jz4770_ssi1_gpc_d, 2),
+	INGENIC_PIN_GROUP("ssi1-gpc-e", jz4770_ssi1_gpc_e, 1),
+	INGENIC_PIN_GROUP("ssi1-ce0-b", jz4770_ssi1_ce0_b, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-d", jz4770_ssi1_ce0_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-e", jz4770_ssi1_ce0_e, 1),
+	INGENIC_PIN_GROUP("ssi1-ce1-b", jz4770_ssi1_ce1_b, 2),
+	INGENIC_PIN_GROUP("ssi1-ce1-d", jz4770_ssi1_ce1_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce1-e", jz4770_ssi1_ce1_e, 1),
+	INGENIC_PIN_GROUP_FUNCS("mmc0-1bit-a", jz4770_mmc0_1bit_a,
+				jz4760_mmc0_1bit_a_funcs),
+	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4770_mmc0_4bit_a, 1),
+	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4770_mmc0_1bit_e, 0),
+	INGENIC_PIN_GROUP("mmc0-4bit-e", jz4770_mmc0_4bit_e, 0),
+	INGENIC_PIN_GROUP("mmc0-8bit-e", jz4770_mmc0_8bit_e, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit-d", jz4770_mmc1_1bit_d, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit-d", jz4770_mmc1_4bit_d, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit-e", jz4770_mmc1_1bit_e, 1),
+	INGENIC_PIN_GROUP("mmc1-4bit-e", jz4770_mmc1_4bit_e, 1),
+	INGENIC_PIN_GROUP("mmc1-8bit-e", jz4770_mmc1_8bit_e, 1),
+	INGENIC_PIN_GROUP("mmc2-1bit-b", jz4770_mmc2_1bit_b, 0),
+	INGENIC_PIN_GROUP("mmc2-4bit-b", jz4770_mmc2_4bit_b, 0),
+	INGENIC_PIN_GROUP("mmc2-1bit-e", jz4770_mmc2_1bit_e, 2),
+	INGENIC_PIN_GROUP("mmc2-4bit-e", jz4770_mmc2_4bit_e, 2),
+	INGENIC_PIN_GROUP("mmc2-8bit-e", jz4770_mmc2_8bit_e, 2),
+	INGENIC_PIN_GROUP("nemc-8bit-data", jz4770_nemc_8bit_data, 0),
+	INGENIC_PIN_GROUP("nemc-16bit-data", jz4770_nemc_16bit_data, 0),
+	INGENIC_PIN_GROUP("nemc-cle-ale", jz4770_nemc_cle_ale, 0),
+	INGENIC_PIN_GROUP("nemc-addr", jz4770_nemc_addr, 0),
+	INGENIC_PIN_GROUP("nemc-rd-we", jz4770_nemc_rd_we, 0),
+	INGENIC_PIN_GROUP("nemc-frd-fwe", jz4770_nemc_frd_fwe, 0),
+	INGENIC_PIN_GROUP("nemc-wait", jz4770_nemc_wait, 0),
+	INGENIC_PIN_GROUP("nemc-cs1", jz4770_nemc_cs1, 0),
+	INGENIC_PIN_GROUP("nemc-cs2", jz4770_nemc_cs2, 0),
+	INGENIC_PIN_GROUP("nemc-cs3", jz4770_nemc_cs3, 0),
+	INGENIC_PIN_GROUP("nemc-cs4", jz4770_nemc_cs4, 0),
+	INGENIC_PIN_GROUP("nemc-cs5", jz4770_nemc_cs5, 0),
+	INGENIC_PIN_GROUP("nemc-cs6", jz4770_nemc_cs6, 0),
+	INGENIC_PIN_GROUP("i2c0-data", jz4770_i2c0, 0),
+	INGENIC_PIN_GROUP("i2c1-data", jz4770_i2c1, 0),
+	INGENIC_PIN_GROUP("i2c2-data", jz4770_i2c2, 2),
+	INGENIC_PIN_GROUP("cim-data-8bit", jz4770_cim_8bit, 0),
+	INGENIC_PIN_GROUP("cim-data-12bit", jz4770_cim_12bit, 0),
+	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit, 0),
 	{ "lcd-no-pins", },
-	INGENIC_PIN_GROUP("pwm0", jz4770_pwm_pwm0),
-	INGENIC_PIN_GROUP("pwm1", jz4770_pwm_pwm1),
-	INGENIC_PIN_GROUP("pwm2", jz4770_pwm_pwm2),
-	INGENIC_PIN_GROUP("pwm3", jz4770_pwm_pwm3),
-	INGENIC_PIN_GROUP("pwm4", jz4770_pwm_pwm4),
-	INGENIC_PIN_GROUP("pwm5", jz4770_pwm_pwm5),
-	INGENIC_PIN_GROUP("pwm6", jz4770_pwm_pwm6),
-	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7),
-	INGENIC_PIN_GROUP("mac-rmii", jz4770_mac_rmii),
-	INGENIC_PIN_GROUP("mac-mii", jz4770_mac_mii),
-	INGENIC_PIN_GROUP("otg-vbus", jz4770_otg),
+	INGENIC_PIN_GROUP("pwm0", jz4770_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", jz4770_pwm_pwm1, 0),
+	INGENIC_PIN_GROUP("pwm2", jz4770_pwm_pwm2, 0),
+	INGENIC_PIN_GROUP("pwm3", jz4770_pwm_pwm3, 0),
+	INGENIC_PIN_GROUP("pwm4", jz4770_pwm_pwm4, 0),
+	INGENIC_PIN_GROUP("pwm5", jz4770_pwm_pwm5, 0),
+	INGENIC_PIN_GROUP("pwm6", jz4770_pwm_pwm6, 0),
+	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7, 0),
+	INGENIC_PIN_GROUP("mac-rmii", jz4770_mac_rmii, 0),
+	INGENIC_PIN_GROUP("mac-mii", jz4770_mac_mii, 0),
+	INGENIC_PIN_GROUP("otg-vbus", jz4770_otg, 0),
 };
 
 static const char *jz4770_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -1090,156 +904,115 @@ static int jz4780_i2s_clk_rx_pins[] = { 0x88, 0x89, };
 static int jz4780_i2s_sysclk_pins[] = { 0x85, };
 static int jz4780_hdmi_ddc_pins[] = { 0xb9, 0xb8, };
 
-static int jz4780_uart2_data_funcs[] = { 1, 1, };
-static int jz4780_uart2_hwflow_funcs[] = { 1, 1, };
-static int jz4780_uart4_data_funcs[] = { 2, 2, };
-static int jz4780_ssi0_dt_a_19_funcs[] = { 2, };
-static int jz4780_ssi0_dt_a_21_funcs[] = { 2, };
-static int jz4780_ssi0_dt_a_28_funcs[] = { 2, };
-static int jz4780_ssi0_dt_b_funcs[] = { 1, };
-static int jz4780_ssi0_dt_d_funcs[] = { 1, };
-static int jz4780_ssi0_dr_a_20_funcs[] = { 2, };
-static int jz4780_ssi0_dr_a_27_funcs[] = { 2, };
-static int jz4780_ssi0_dr_b_funcs[] = { 1, };
-static int jz4780_ssi0_dr_d_funcs[] = { 1, };
-static int jz4780_ssi0_clk_a_funcs[] = { 2, };
-static int jz4780_ssi0_clk_b_5_funcs[] = { 1, };
-static int jz4780_ssi0_clk_b_28_funcs[] = { 1, };
-static int jz4780_ssi0_clk_d_funcs[] = { 1, };
-static int jz4780_ssi0_gpc_b_funcs[] = { 1, };
-static int jz4780_ssi0_gpc_d_funcs[] = { 1, };
-static int jz4780_ssi0_ce0_a_23_funcs[] = { 2, };
-static int jz4780_ssi0_ce0_a_25_funcs[] = { 2, };
-static int jz4780_ssi0_ce0_b_funcs[] = { 1, };
-static int jz4780_ssi0_ce0_d_funcs[] = { 1, };
-static int jz4780_ssi0_ce1_b_funcs[] = { 1, };
-static int jz4780_ssi0_ce1_d_funcs[] = { 1, };
-static int jz4780_ssi1_dt_b_funcs[] = { 2, };
-static int jz4780_ssi1_dt_d_funcs[] = { 2, };
-static int jz4780_ssi1_dr_b_funcs[] = { 2, };
-static int jz4780_ssi1_dr_d_funcs[] = { 2, };
-static int jz4780_ssi1_clk_b_funcs[] = { 2, };
-static int jz4780_ssi1_clk_d_funcs[] = { 2, };
-static int jz4780_ssi1_gpc_b_funcs[] = { 2, };
-static int jz4780_ssi1_gpc_d_funcs[] = { 2, };
-static int jz4780_ssi1_ce0_b_funcs[] = { 2, };
-static int jz4780_ssi1_ce0_d_funcs[] = { 2, };
-static int jz4780_ssi1_ce1_b_funcs[] = { 2, };
-static int jz4780_ssi1_ce1_d_funcs[] = { 2, };
-static int jz4780_mmc0_8bit_a_funcs[] = { 1, 1, 1, 1, 1, };
-static int jz4780_i2c3_funcs[] = { 1, 1, };
-static int jz4780_i2c4_e_funcs[] = { 1, 1, };
-static int jz4780_i2c4_f_funcs[] = { 1, 1, };
-static int jz4780_i2s_data_tx_funcs[] = { 0, };
-static int jz4780_i2s_data_rx_funcs[] = { 0, };
-static int jz4780_i2s_clk_txrx_funcs[] = { 1, 0, };
-static int jz4780_i2s_clk_rx_funcs[] = { 1, 1, };
-static int jz4780_i2s_sysclk_funcs[] = { 2, };
-static int jz4780_hdmi_ddc_funcs[] = { 0, 0, };
+static u8 jz4780_i2s_clk_txrx_funcs[] = { 1, 0, };
 
 static const struct group_desc jz4780_groups[] = {
-	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data),
-	INGENIC_PIN_GROUP("uart0-hwflow", jz4770_uart0_hwflow),
-	INGENIC_PIN_GROUP("uart1-data", jz4770_uart1_data),
-	INGENIC_PIN_GROUP("uart1-hwflow", jz4770_uart1_hwflow),
-	INGENIC_PIN_GROUP("uart2-data", jz4780_uart2_data),
-	INGENIC_PIN_GROUP("uart2-hwflow", jz4780_uart2_hwflow),
-	INGENIC_PIN_GROUP("uart3-data", jz4770_uart3_data),
-	INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow),
-	INGENIC_PIN_GROUP("uart4-data", jz4780_uart4_data),
-	INGENIC_PIN_GROUP("ssi0-dt-a-19", jz4780_ssi0_dt_a_19),
-	INGENIC_PIN_GROUP("ssi0-dt-a-21", jz4780_ssi0_dt_a_21),
-	INGENIC_PIN_GROUP("ssi0-dt-a-28", jz4780_ssi0_dt_a_28),
-	INGENIC_PIN_GROUP("ssi0-dt-b", jz4780_ssi0_dt_b),
-	INGENIC_PIN_GROUP("ssi0-dt-d", jz4780_ssi0_dt_d),
-	INGENIC_PIN_GROUP("ssi0-dt-e", jz4770_ssi0_dt_e),
-	INGENIC_PIN_GROUP("ssi0-dr-a-20", jz4780_ssi0_dr_a_20),
-	INGENIC_PIN_GROUP("ssi0-dr-a-27", jz4780_ssi0_dr_a_27),
-	INGENIC_PIN_GROUP("ssi0-dr-b", jz4780_ssi0_dr_b),
-	INGENIC_PIN_GROUP("ssi0-dr-d", jz4780_ssi0_dr_d),
-	INGENIC_PIN_GROUP("ssi0-dr-e", jz4770_ssi0_dr_e),
-	INGENIC_PIN_GROUP("ssi0-clk-a", jz4780_ssi0_clk_a),
-	INGENIC_PIN_GROUP("ssi0-clk-b-5", jz4780_ssi0_clk_b_5),
-	INGENIC_PIN_GROUP("ssi0-clk-b-28", jz4780_ssi0_clk_b_28),
-	INGENIC_PIN_GROUP("ssi0-clk-d", jz4780_ssi0_clk_d),
-	INGENIC_PIN_GROUP("ssi0-clk-e", jz4770_ssi0_clk_e),
-	INGENIC_PIN_GROUP("ssi0-gpc-b", jz4780_ssi0_gpc_b),
-	INGENIC_PIN_GROUP("ssi0-gpc-d", jz4780_ssi0_gpc_d),
-	INGENIC_PIN_GROUP("ssi0-gpc-e", jz4770_ssi0_gpc_e),
-	INGENIC_PIN_GROUP("ssi0-ce0-a-23", jz4780_ssi0_ce0_a_23),
-	INGENIC_PIN_GROUP("ssi0-ce0-a-25", jz4780_ssi0_ce0_a_25),
-	INGENIC_PIN_GROUP("ssi0-ce0-b", jz4780_ssi0_ce0_b),
-	INGENIC_PIN_GROUP("ssi0-ce0-d", jz4780_ssi0_ce0_d),
-	INGENIC_PIN_GROUP("ssi0-ce0-e", jz4770_ssi0_ce0_e),
-	INGENIC_PIN_GROUP("ssi0-ce1-b", jz4780_ssi0_ce1_b),
-	INGENIC_PIN_GROUP("ssi0-ce1-d", jz4780_ssi0_ce1_d),
-	INGENIC_PIN_GROUP("ssi0-ce1-e", jz4770_ssi0_ce1_e),
-	INGENIC_PIN_GROUP("ssi1-dt-b", jz4780_ssi1_dt_b),
-	INGENIC_PIN_GROUP("ssi1-dt-d", jz4780_ssi1_dt_d),
-	INGENIC_PIN_GROUP("ssi1-dt-e", jz4770_ssi1_dt_e),
-	INGENIC_PIN_GROUP("ssi1-dr-b", jz4780_ssi1_dr_b),
-	INGENIC_PIN_GROUP("ssi1-dr-d", jz4780_ssi1_dr_d),
-	INGENIC_PIN_GROUP("ssi1-dr-e", jz4770_ssi1_dr_e),
-	INGENIC_PIN_GROUP("ssi1-clk-b", jz4780_ssi1_clk_b),
-	INGENIC_PIN_GROUP("ssi1-clk-d", jz4780_ssi1_clk_d),
-	INGENIC_PIN_GROUP("ssi1-clk-e", jz4770_ssi1_clk_e),
-	INGENIC_PIN_GROUP("ssi1-gpc-b", jz4780_ssi1_gpc_b),
-	INGENIC_PIN_GROUP("ssi1-gpc-d", jz4780_ssi1_gpc_d),
-	INGENIC_PIN_GROUP("ssi1-gpc-e", jz4770_ssi1_gpc_e),
-	INGENIC_PIN_GROUP("ssi1-ce0-b", jz4780_ssi1_ce0_b),
-	INGENIC_PIN_GROUP("ssi1-ce0-d", jz4780_ssi1_ce0_d),
-	INGENIC_PIN_GROUP("ssi1-ce0-e", jz4770_ssi1_ce0_e),
-	INGENIC_PIN_GROUP("ssi1-ce1-b", jz4780_ssi1_ce1_b),
-	INGENIC_PIN_GROUP("ssi1-ce1-d", jz4780_ssi1_ce1_d),
-	INGENIC_PIN_GROUP("ssi1-ce1-e", jz4770_ssi1_ce1_e),
-	INGENIC_PIN_GROUP("mmc0-1bit-a", jz4770_mmc0_1bit_a),
-	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4770_mmc0_4bit_a),
-	INGENIC_PIN_GROUP("mmc0-8bit-a", jz4780_mmc0_8bit_a),
-	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4770_mmc0_1bit_e),
-	INGENIC_PIN_GROUP("mmc0-4bit-e", jz4770_mmc0_4bit_e),
-	INGENIC_PIN_GROUP("mmc1-1bit-d", jz4770_mmc1_1bit_d),
-	INGENIC_PIN_GROUP("mmc1-4bit-d", jz4770_mmc1_4bit_d),
-	INGENIC_PIN_GROUP("mmc1-1bit-e", jz4770_mmc1_1bit_e),
-	INGENIC_PIN_GROUP("mmc1-4bit-e", jz4770_mmc1_4bit_e),
-	INGENIC_PIN_GROUP("mmc2-1bit-b", jz4770_mmc2_1bit_b),
-	INGENIC_PIN_GROUP("mmc2-4bit-b", jz4770_mmc2_4bit_b),
-	INGENIC_PIN_GROUP("mmc2-1bit-e", jz4770_mmc2_1bit_e),
-	INGENIC_PIN_GROUP("mmc2-4bit-e", jz4770_mmc2_4bit_e),
-	INGENIC_PIN_GROUP("nemc-data", jz4770_nemc_8bit_data),
-	INGENIC_PIN_GROUP("nemc-cle-ale", jz4770_nemc_cle_ale),
-	INGENIC_PIN_GROUP("nemc-addr", jz4770_nemc_addr),
-	INGENIC_PIN_GROUP("nemc-rd-we", jz4770_nemc_rd_we),
-	INGENIC_PIN_GROUP("nemc-frd-fwe", jz4770_nemc_frd_fwe),
-	INGENIC_PIN_GROUP("nemc-wait", jz4770_nemc_wait),
-	INGENIC_PIN_GROUP("nemc-cs1", jz4770_nemc_cs1),
-	INGENIC_PIN_GROUP("nemc-cs2", jz4770_nemc_cs2),
-	INGENIC_PIN_GROUP("nemc-cs3", jz4770_nemc_cs3),
-	INGENIC_PIN_GROUP("nemc-cs4", jz4770_nemc_cs4),
-	INGENIC_PIN_GROUP("nemc-cs5", jz4770_nemc_cs5),
-	INGENIC_PIN_GROUP("nemc-cs6", jz4770_nemc_cs6),
-	INGENIC_PIN_GROUP("i2c0-data", jz4770_i2c0),
-	INGENIC_PIN_GROUP("i2c1-data", jz4770_i2c1),
-	INGENIC_PIN_GROUP("i2c2-data", jz4770_i2c2),
-	INGENIC_PIN_GROUP("i2c3-data", jz4780_i2c3),
-	INGENIC_PIN_GROUP("i2c4-data-e", jz4780_i2c4_e),
-	INGENIC_PIN_GROUP("i2c4-data-f", jz4780_i2c4_f),
-	INGENIC_PIN_GROUP("i2s-data-tx", jz4780_i2s_data_tx),
-	INGENIC_PIN_GROUP("i2s-data-rx", jz4780_i2s_data_rx),
-	INGENIC_PIN_GROUP("i2s-clk-txrx", jz4780_i2s_clk_txrx),
-	INGENIC_PIN_GROUP("i2s-clk-rx", jz4780_i2s_clk_rx),
-	INGENIC_PIN_GROUP("i2s-sysclk", jz4780_i2s_sysclk),
-	INGENIC_PIN_GROUP("hdmi-ddc", jz4780_hdmi_ddc),
-	INGENIC_PIN_GROUP("cim-data", jz4770_cim_8bit),
-	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit),
+	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
+	INGENIC_PIN_GROUP("uart0-hwflow", jz4770_uart0_hwflow, 0),
+	INGENIC_PIN_GROUP("uart1-data", jz4770_uart1_data, 0),
+	INGENIC_PIN_GROUP("uart1-hwflow", jz4770_uart1_hwflow, 0),
+	INGENIC_PIN_GROUP("uart2-data", jz4780_uart2_data, 1),
+	INGENIC_PIN_GROUP("uart2-hwflow", jz4780_uart2_hwflow, 1),
+	INGENIC_PIN_GROUP_FUNCS("uart3-data", jz4770_uart3_data,
+				jz4760_uart3_data_funcs),
+	INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow, 0),
+	INGENIC_PIN_GROUP("uart4-data", jz4780_uart4_data, 2),
+	INGENIC_PIN_GROUP("ssi0-dt-a-19", jz4780_ssi0_dt_a_19, 2),
+	INGENIC_PIN_GROUP("ssi0-dt-a-21", jz4780_ssi0_dt_a_21, 2),
+	INGENIC_PIN_GROUP("ssi0-dt-a-28", jz4780_ssi0_dt_a_28, 2),
+	INGENIC_PIN_GROUP("ssi0-dt-b", jz4780_ssi0_dt_b, 1),
+	INGENIC_PIN_GROUP("ssi0-dt-d", jz4780_ssi0_dt_d, 1),
+	INGENIC_PIN_GROUP("ssi0-dt-e", jz4770_ssi0_dt_e, 0),
+	INGENIC_PIN_GROUP("ssi0-dr-a-20", jz4780_ssi0_dr_a_20, 2),
+	INGENIC_PIN_GROUP("ssi0-dr-a-27", jz4780_ssi0_dr_a_27, 2),
+	INGENIC_PIN_GROUP("ssi0-dr-b", jz4780_ssi0_dr_b, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-d", jz4780_ssi0_dr_d, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-e", jz4770_ssi0_dr_e, 0),
+	INGENIC_PIN_GROUP("ssi0-clk-a", jz4780_ssi0_clk_a, 2),
+	INGENIC_PIN_GROUP("ssi0-clk-b-5", jz4780_ssi0_clk_b_5, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-b-28", jz4780_ssi0_clk_b_28, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-d", jz4780_ssi0_clk_d, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-e", jz4770_ssi0_clk_e, 0),
+	INGENIC_PIN_GROUP("ssi0-gpc-b", jz4780_ssi0_gpc_b, 1),
+	INGENIC_PIN_GROUP("ssi0-gpc-d", jz4780_ssi0_gpc_d, 1),
+	INGENIC_PIN_GROUP("ssi0-gpc-e", jz4770_ssi0_gpc_e, 0),
+	INGENIC_PIN_GROUP("ssi0-ce0-a-23", jz4780_ssi0_ce0_a_23, 2),
+	INGENIC_PIN_GROUP("ssi0-ce0-a-25", jz4780_ssi0_ce0_a_25, 2),
+	INGENIC_PIN_GROUP("ssi0-ce0-b", jz4780_ssi0_ce0_b, 1),
+	INGENIC_PIN_GROUP("ssi0-ce0-d", jz4780_ssi0_ce0_d, 1),
+	INGENIC_PIN_GROUP("ssi0-ce0-e", jz4770_ssi0_ce0_e, 0),
+	INGENIC_PIN_GROUP("ssi0-ce1-b", jz4780_ssi0_ce1_b, 1),
+	INGENIC_PIN_GROUP("ssi0-ce1-d", jz4780_ssi0_ce1_d, 1),
+	INGENIC_PIN_GROUP("ssi0-ce1-e", jz4770_ssi0_ce1_e, 0),
+	INGENIC_PIN_GROUP("ssi1-dt-b", jz4780_ssi1_dt_b, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-d", jz4780_ssi1_dt_d, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-e", jz4770_ssi1_dt_e, 1),
+	INGENIC_PIN_GROUP("ssi1-dr-b", jz4780_ssi1_dr_b, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-d", jz4780_ssi1_dr_d, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-e", jz4770_ssi1_dr_e, 1),
+	INGENIC_PIN_GROUP("ssi1-clk-b", jz4780_ssi1_clk_b, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-d", jz4780_ssi1_clk_d, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-e", jz4770_ssi1_clk_e, 1),
+	INGENIC_PIN_GROUP("ssi1-gpc-b", jz4780_ssi1_gpc_b, 2),
+	INGENIC_PIN_GROUP("ssi1-gpc-d", jz4780_ssi1_gpc_d, 2),
+	INGENIC_PIN_GROUP("ssi1-gpc-e", jz4770_ssi1_gpc_e, 1),
+	INGENIC_PIN_GROUP("ssi1-ce0-b", jz4780_ssi1_ce0_b, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-d", jz4780_ssi1_ce0_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-e", jz4770_ssi1_ce0_e, 1),
+	INGENIC_PIN_GROUP("ssi1-ce1-b", jz4780_ssi1_ce1_b, 2),
+	INGENIC_PIN_GROUP("ssi1-ce1-d", jz4780_ssi1_ce1_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce1-e", jz4770_ssi1_ce1_e, 1),
+	INGENIC_PIN_GROUP_FUNCS("mmc0-1bit-a", jz4770_mmc0_1bit_a,
+				jz4760_mmc0_1bit_a_funcs),
+	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4770_mmc0_4bit_a, 1),
+	INGENIC_PIN_GROUP("mmc0-8bit-a", jz4780_mmc0_8bit_a, 1),
+	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4770_mmc0_1bit_e, 0),
+	INGENIC_PIN_GROUP("mmc0-4bit-e", jz4770_mmc0_4bit_e, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit-d", jz4770_mmc1_1bit_d, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit-d", jz4770_mmc1_4bit_d, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit-e", jz4770_mmc1_1bit_e, 1),
+	INGENIC_PIN_GROUP("mmc1-4bit-e", jz4770_mmc1_4bit_e, 1),
+	INGENIC_PIN_GROUP("mmc2-1bit-b", jz4770_mmc2_1bit_b, 0),
+	INGENIC_PIN_GROUP("mmc2-4bit-b", jz4770_mmc2_4bit_b, 0),
+	INGENIC_PIN_GROUP("mmc2-1bit-e", jz4770_mmc2_1bit_e, 2),
+	INGENIC_PIN_GROUP("mmc2-4bit-e", jz4770_mmc2_4bit_e, 2),
+	INGENIC_PIN_GROUP("nemc-data", jz4770_nemc_8bit_data, 0),
+	INGENIC_PIN_GROUP("nemc-cle-ale", jz4770_nemc_cle_ale, 0),
+	INGENIC_PIN_GROUP("nemc-addr", jz4770_nemc_addr, 0),
+	INGENIC_PIN_GROUP("nemc-rd-we", jz4770_nemc_rd_we, 0),
+	INGENIC_PIN_GROUP("nemc-frd-fwe", jz4770_nemc_frd_fwe, 0),
+	INGENIC_PIN_GROUP("nemc-wait", jz4770_nemc_wait, 0),
+	INGENIC_PIN_GROUP("nemc-cs1", jz4770_nemc_cs1, 0),
+	INGENIC_PIN_GROUP("nemc-cs2", jz4770_nemc_cs2, 0),
+	INGENIC_PIN_GROUP("nemc-cs3", jz4770_nemc_cs3, 0),
+	INGENIC_PIN_GROUP("nemc-cs4", jz4770_nemc_cs4, 0),
+	INGENIC_PIN_GROUP("nemc-cs5", jz4770_nemc_cs5, 0),
+	INGENIC_PIN_GROUP("nemc-cs6", jz4770_nemc_cs6, 0),
+	INGENIC_PIN_GROUP("i2c0-data", jz4770_i2c0, 0),
+	INGENIC_PIN_GROUP("i2c1-data", jz4770_i2c1, 0),
+	INGENIC_PIN_GROUP("i2c2-data", jz4770_i2c2, 2),
+	INGENIC_PIN_GROUP("i2c3-data", jz4780_i2c3, 1),
+	INGENIC_PIN_GROUP("i2c4-data-e", jz4780_i2c4_e, 1),
+	INGENIC_PIN_GROUP("i2c4-data-f", jz4780_i2c4_f, 1),
+	INGENIC_PIN_GROUP("i2s-data-tx", jz4780_i2s_data_tx, 0),
+	INGENIC_PIN_GROUP("i2s-data-rx", jz4780_i2s_data_rx, 0),
+	INGENIC_PIN_GROUP_FUNCS("i2s-clk-txrx", jz4780_i2s_clk_txrx,
+				jz4780_i2s_clk_txrx_funcs),
+	INGENIC_PIN_GROUP("i2s-clk-rx", jz4780_i2s_clk_rx, 1),
+	INGENIC_PIN_GROUP("i2s-sysclk", jz4780_i2s_sysclk, 2),
+	INGENIC_PIN_GROUP("hdmi-ddc", jz4780_hdmi_ddc, 0),
+	INGENIC_PIN_GROUP("cim-data", jz4770_cim_8bit, 0),
+	INGENIC_PIN_GROUP("cim-data-12bit", jz4770_cim_12bit, 0),
+	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit, 0),
 	{ "lcd-no-pins", },
-	INGENIC_PIN_GROUP("pwm0", jz4770_pwm_pwm0),
-	INGENIC_PIN_GROUP("pwm1", jz4770_pwm_pwm1),
-	INGENIC_PIN_GROUP("pwm2", jz4770_pwm_pwm2),
-	INGENIC_PIN_GROUP("pwm3", jz4770_pwm_pwm3),
-	INGENIC_PIN_GROUP("pwm4", jz4770_pwm_pwm4),
-	INGENIC_PIN_GROUP("pwm5", jz4770_pwm_pwm5),
-	INGENIC_PIN_GROUP("pwm6", jz4770_pwm_pwm6),
-	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7),
+	INGENIC_PIN_GROUP("pwm0", jz4770_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", jz4770_pwm_pwm1, 0),
+	INGENIC_PIN_GROUP("pwm2", jz4770_pwm_pwm2, 0),
+	INGENIC_PIN_GROUP("pwm3", jz4770_pwm_pwm3, 0),
+	INGENIC_PIN_GROUP("pwm4", jz4770_pwm_pwm4, 0),
+	INGENIC_PIN_GROUP("pwm5", jz4770_pwm_pwm5, 0),
+	INGENIC_PIN_GROUP("pwm6", jz4770_pwm_pwm6, 0),
+	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7, 0),
 };
 
 static const char *jz4780_uart2_groups[] = { "uart2-data", "uart2-hwflow", };
@@ -1411,119 +1184,61 @@ static int x1000_mac_pins[] = {
 	0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x26,
 };
 
-static int x1000_uart0_data_funcs[] = { 0, 0, };
-static int x1000_uart0_hwflow_funcs[] = { 0, 0, };
-static int x1000_uart1_data_a_funcs[] = { 2, 2, };
-static int x1000_uart1_data_d_funcs[] = { 1, 1, };
-static int x1000_uart1_hwflow_funcs[] = { 1, 1, };
-static int x1000_uart2_data_a_funcs[] = { 2, 2, };
-static int x1000_uart2_data_d_funcs[] = { 0, 0, };
-static int x1000_sfc_funcs[] = { 1, 1, 1, 1, 1, 1, };
-static int x1000_ssi_dt_a_22_funcs[] = { 2, };
-static int x1000_ssi_dt_a_29_funcs[] = { 2, };
-static int x1000_ssi_dt_d_funcs[] = { 0, };
-static int x1000_ssi_dr_a_23_funcs[] = { 2, };
-static int x1000_ssi_dr_a_28_funcs[] = { 2, };
-static int x1000_ssi_dr_d_funcs[] = { 0, };
-static int x1000_ssi_clk_a_24_funcs[] = { 2, };
-static int x1000_ssi_clk_a_26_funcs[] = { 2, };
-static int x1000_ssi_clk_d_funcs[] = { 0, };
-static int x1000_ssi_gpc_a_20_funcs[] = { 2, };
-static int x1000_ssi_gpc_a_31_funcs[] = { 2, };
-static int x1000_ssi_ce0_a_25_funcs[] = { 2, };
-static int x1000_ssi_ce0_a_27_funcs[] = { 2, };
-static int x1000_ssi_ce0_d_funcs[] = { 0, };
-static int x1000_ssi_ce1_a_21_funcs[] = { 2, };
-static int x1000_ssi_ce1_a_30_funcs[] = { 2, };
-static int x1000_mmc0_1bit_funcs[] = { 1, 1, 1, };
-static int x1000_mmc0_4bit_funcs[] = { 1, 1, 1, };
-static int x1000_mmc0_8bit_funcs[] = { 1, 1, 1, 1, 1, };
-static int x1000_mmc1_1bit_funcs[] = { 0, 0, 0, };
-static int x1000_mmc1_4bit_funcs[] = { 0, 0, 0, };
-static int x1000_emc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int x1000_emc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int x1000_emc_addr_funcs[] = {
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-};
-static int x1000_emc_rd_we_funcs[] = { 0, 0, };
-static int x1000_emc_wait_funcs[] = { 0, };
-static int x1000_emc_cs1_funcs[] = { 0, };
-static int x1000_emc_cs2_funcs[] = { 0, };
-static int x1000_i2c0_funcs[] = { 0, 0, };
-static int x1000_i2c1_a_funcs[] = { 2, 2, };
-static int x1000_i2c1_c_funcs[] = { 0, 0, };
-static int x1000_i2c2_funcs[] = { 1, 1, };
-static int x1000_i2s_data_tx_funcs[] = { 1, };
-static int x1000_i2s_data_rx_funcs[] = { 1, };
-static int x1000_i2s_clk_txrx_funcs[] = { 1, 1, };
-static int x1000_i2s_sysclk_funcs[] = { 1, };
-static int x1000_cim_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
-static int x1000_lcd_8bit_funcs[] = {
-	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-};
-static int x1000_lcd_16bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, };
-static int x1000_pwm_pwm0_funcs[] = { 0, };
-static int x1000_pwm_pwm1_funcs[] = { 1, };
-static int x1000_pwm_pwm2_funcs[] = { 1, };
-static int x1000_pwm_pwm3_funcs[] = { 2, };
-static int x1000_pwm_pwm4_funcs[] = { 0, };
-static int x1000_mac_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, };
-
 static const struct group_desc x1000_groups[] = {
-	INGENIC_PIN_GROUP("uart0-data", x1000_uart0_data),
-	INGENIC_PIN_GROUP("uart0-hwflow", x1000_uart0_hwflow),
-	INGENIC_PIN_GROUP("uart1-data-a", x1000_uart1_data_a),
-	INGENIC_PIN_GROUP("uart1-data-d", x1000_uart1_data_d),
-	INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow),
-	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a),
-	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d),
-	INGENIC_PIN_GROUP("sfc", x1000_sfc),
-	INGENIC_PIN_GROUP("ssi-dt-a-22", x1000_ssi_dt_a_22),
-	INGENIC_PIN_GROUP("ssi-dt-a-29", x1000_ssi_dt_a_29),
-	INGENIC_PIN_GROUP("ssi-dt-d", x1000_ssi_dt_d),
-	INGENIC_PIN_GROUP("ssi-dr-a-23", x1000_ssi_dr_a_23),
-	INGENIC_PIN_GROUP("ssi-dr-a-28", x1000_ssi_dr_a_28),
-	INGENIC_PIN_GROUP("ssi-dr-d", x1000_ssi_dr_d),
-	INGENIC_PIN_GROUP("ssi-clk-a-24", x1000_ssi_clk_a_24),
-	INGENIC_PIN_GROUP("ssi-clk-a-26", x1000_ssi_clk_a_26),
-	INGENIC_PIN_GROUP("ssi-clk-d", x1000_ssi_clk_d),
-	INGENIC_PIN_GROUP("ssi-gpc-a-20", x1000_ssi_gpc_a_20),
-	INGENIC_PIN_GROUP("ssi-gpc-a-31", x1000_ssi_gpc_a_31),
-	INGENIC_PIN_GROUP("ssi-ce0-a-25", x1000_ssi_ce0_a_25),
-	INGENIC_PIN_GROUP("ssi-ce0-a-27", x1000_ssi_ce0_a_27),
-	INGENIC_PIN_GROUP("ssi-ce0-d", x1000_ssi_ce0_d),
-	INGENIC_PIN_GROUP("ssi-ce1-a-21", x1000_ssi_ce1_a_21),
-	INGENIC_PIN_GROUP("ssi-ce1-a-30", x1000_ssi_ce1_a_30),
-	INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit),
-	INGENIC_PIN_GROUP("mmc0-4bit", x1000_mmc0_4bit),
-	INGENIC_PIN_GROUP("mmc0-8bit", x1000_mmc0_8bit),
-	INGENIC_PIN_GROUP("mmc1-1bit", x1000_mmc1_1bit),
-	INGENIC_PIN_GROUP("mmc1-4bit", x1000_mmc1_4bit),
-	INGENIC_PIN_GROUP("emc-8bit-data", x1000_emc_8bit_data),
-	INGENIC_PIN_GROUP("emc-16bit-data", x1000_emc_16bit_data),
-	INGENIC_PIN_GROUP("emc-addr", x1000_emc_addr),
-	INGENIC_PIN_GROUP("emc-rd-we", x1000_emc_rd_we),
-	INGENIC_PIN_GROUP("emc-wait", x1000_emc_wait),
-	INGENIC_PIN_GROUP("emc-cs1", x1000_emc_cs1),
-	INGENIC_PIN_GROUP("emc-cs2", x1000_emc_cs2),
-	INGENIC_PIN_GROUP("i2c0-data", x1000_i2c0),
-	INGENIC_PIN_GROUP("i2c1-data-a", x1000_i2c1_a),
-	INGENIC_PIN_GROUP("i2c1-data-c", x1000_i2c1_c),
-	INGENIC_PIN_GROUP("i2c2-data", x1000_i2c2),
-	INGENIC_PIN_GROUP("i2s-data-tx", x1000_i2s_data_tx),
-	INGENIC_PIN_GROUP("i2s-data-rx", x1000_i2s_data_rx),
-	INGENIC_PIN_GROUP("i2s-clk-txrx", x1000_i2s_clk_txrx),
-	INGENIC_PIN_GROUP("i2s-sysclk", x1000_i2s_sysclk),
-	INGENIC_PIN_GROUP("cim-data", x1000_cim),
-	INGENIC_PIN_GROUP("lcd-8bit", x1000_lcd_8bit),
-	INGENIC_PIN_GROUP("lcd-16bit", x1000_lcd_16bit),
+	INGENIC_PIN_GROUP("uart0-data", x1000_uart0_data, 0),
+	INGENIC_PIN_GROUP("uart0-hwflow", x1000_uart0_hwflow, 0),
+	INGENIC_PIN_GROUP("uart1-data-a", x1000_uart1_data_a, 2),
+	INGENIC_PIN_GROUP("uart1-data-d", x1000_uart1_data_d, 1),
+	INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow, 1),
+	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a, 2),
+	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d, 0),
+	INGENIC_PIN_GROUP("sfc", x1000_sfc, 1),
+	INGENIC_PIN_GROUP("ssi-dt-a-22", x1000_ssi_dt_a_22, 2),
+	INGENIC_PIN_GROUP("ssi-dt-a-29", x1000_ssi_dt_a_29, 2),
+	INGENIC_PIN_GROUP("ssi-dt-d", x1000_ssi_dt_d, 0),
+	INGENIC_PIN_GROUP("ssi-dr-a-23", x1000_ssi_dr_a_23, 2),
+	INGENIC_PIN_GROUP("ssi-dr-a-28", x1000_ssi_dr_a_28, 2),
+	INGENIC_PIN_GROUP("ssi-dr-d", x1000_ssi_dr_d, 0),
+	INGENIC_PIN_GROUP("ssi-clk-a-24", x1000_ssi_clk_a_24, 2),
+	INGENIC_PIN_GROUP("ssi-clk-a-26", x1000_ssi_clk_a_26, 2),
+	INGENIC_PIN_GROUP("ssi-clk-d", x1000_ssi_clk_d, 0),
+	INGENIC_PIN_GROUP("ssi-gpc-a-20", x1000_ssi_gpc_a_20, 2),
+	INGENIC_PIN_GROUP("ssi-gpc-a-31", x1000_ssi_gpc_a_31, 2),
+	INGENIC_PIN_GROUP("ssi-ce0-a-25", x1000_ssi_ce0_a_25, 2),
+	INGENIC_PIN_GROUP("ssi-ce0-a-27", x1000_ssi_ce0_a_27, 2),
+	INGENIC_PIN_GROUP("ssi-ce0-d", x1000_ssi_ce0_d, 0),
+	INGENIC_PIN_GROUP("ssi-ce1-a-21", x1000_ssi_ce1_a_21, 2),
+	INGENIC_PIN_GROUP("ssi-ce1-a-30", x1000_ssi_ce1_a_30, 2),
+	INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit, 1),
+	INGENIC_PIN_GROUP("mmc0-4bit", x1000_mmc0_4bit, 1),
+	INGENIC_PIN_GROUP("mmc0-8bit", x1000_mmc0_8bit, 1),
+	INGENIC_PIN_GROUP("mmc1-1bit", x1000_mmc1_1bit, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit", x1000_mmc1_4bit, 0),
+	INGENIC_PIN_GROUP("emc-8bit-data", x1000_emc_8bit_data, 0),
+	INGENIC_PIN_GROUP("emc-16bit-data", x1000_emc_16bit_data, 0),
+	INGENIC_PIN_GROUP("emc-addr", x1000_emc_addr, 0),
+	INGENIC_PIN_GROUP("emc-rd-we", x1000_emc_rd_we, 0),
+	INGENIC_PIN_GROUP("emc-wait", x1000_emc_wait, 0),
+	INGENIC_PIN_GROUP("emc-cs1", x1000_emc_cs1, 0),
+	INGENIC_PIN_GROUP("emc-cs2", x1000_emc_cs2, 0),
+	INGENIC_PIN_GROUP("i2c0-data", x1000_i2c0, 0),
+	INGENIC_PIN_GROUP("i2c1-data-a", x1000_i2c1_a, 2),
+	INGENIC_PIN_GROUP("i2c1-data-c", x1000_i2c1_c, 0),
+	INGENIC_PIN_GROUP("i2c2-data", x1000_i2c2, 1),
+	INGENIC_PIN_GROUP("i2s-data-tx", x1000_i2s_data_tx, 1),
+	INGENIC_PIN_GROUP("i2s-data-rx", x1000_i2s_data_rx, 1),
+	INGENIC_PIN_GROUP("i2s-clk-txrx", x1000_i2s_clk_txrx, 1),
+	INGENIC_PIN_GROUP("i2s-sysclk", x1000_i2s_sysclk, 1),
+	INGENIC_PIN_GROUP("cim-data", x1000_cim, 2),
+	INGENIC_PIN_GROUP("lcd-8bit", x1000_lcd_8bit, 1),
+	INGENIC_PIN_GROUP("lcd-16bit", x1000_lcd_16bit, 1),
 	{ "lcd-no-pins", },
-	INGENIC_PIN_GROUP("pwm0", x1000_pwm_pwm0),
-	INGENIC_PIN_GROUP("pwm1", x1000_pwm_pwm1),
-	INGENIC_PIN_GROUP("pwm2", x1000_pwm_pwm2),
-	INGENIC_PIN_GROUP("pwm3", x1000_pwm_pwm3),
-	INGENIC_PIN_GROUP("pwm4", x1000_pwm_pwm4),
-	INGENIC_PIN_GROUP("mac", x1000_mac),
+	INGENIC_PIN_GROUP("pwm0", x1000_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", x1000_pwm_pwm1, 1),
+	INGENIC_PIN_GROUP("pwm2", x1000_pwm_pwm2, 1),
+	INGENIC_PIN_GROUP("pwm3", x1000_pwm_pwm3, 2),
+	INGENIC_PIN_GROUP("pwm4", x1000_pwm_pwm4, 0),
+	INGENIC_PIN_GROUP("mac", x1000_mac, 1),
 };
 
 static const char *x1000_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -1633,56 +1348,32 @@ static int x1500_pwm_pwm2_pins[] = { 0x5b, };
 static int x1500_pwm_pwm3_pins[] = { 0x26, };
 static int x1500_pwm_pwm4_pins[] = { 0x58, };
 
-static int x1500_uart0_data_funcs[] = { 0, 0, };
-static int x1500_uart0_hwflow_funcs[] = { 0, 0, };
-static int x1500_uart1_data_a_funcs[] = { 2, 2, };
-static int x1500_uart1_data_d_funcs[] = { 1, 1, };
-static int x1500_uart1_hwflow_funcs[] = { 1, 1, };
-static int x1500_uart2_data_a_funcs[] = { 2, 2, };
-static int x1500_uart2_data_d_funcs[] = { 0, 0, };
-static int x1500_mmc_1bit_funcs[] = { 1, 1, 1, };
-static int x1500_mmc_4bit_funcs[] = { 1, 1, 1, };
-static int x1500_i2c0_funcs[] = { 0, 0, };
-static int x1500_i2c1_a_funcs[] = { 2, 2, };
-static int x1500_i2c1_c_funcs[] = { 0, 0, };
-static int x1500_i2c2_funcs[] = { 1, 1, };
-static int x1500_i2s_data_tx_funcs[] = { 1, };
-static int x1500_i2s_data_rx_funcs[] = { 1, };
-static int x1500_i2s_clk_txrx_funcs[] = { 1, 1, };
-static int x1500_i2s_sysclk_funcs[] = { 1, };
-static int x1500_cim_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
-static int x1500_pwm_pwm0_funcs[] = { 0, };
-static int x1500_pwm_pwm1_funcs[] = { 1, };
-static int x1500_pwm_pwm2_funcs[] = { 1, };
-static int x1500_pwm_pwm3_funcs[] = { 2, };
-static int x1500_pwm_pwm4_funcs[] = { 0, };
-
 static const struct group_desc x1500_groups[] = {
-	INGENIC_PIN_GROUP("uart0-data", x1500_uart0_data),
-	INGENIC_PIN_GROUP("uart0-hwflow", x1500_uart0_hwflow),
-	INGENIC_PIN_GROUP("uart1-data-a", x1500_uart1_data_a),
-	INGENIC_PIN_GROUP("uart1-data-d", x1500_uart1_data_d),
-	INGENIC_PIN_GROUP("uart1-hwflow", x1500_uart1_hwflow),
-	INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a),
-	INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d),
-	INGENIC_PIN_GROUP("sfc", x1000_sfc),
-	INGENIC_PIN_GROUP("mmc-1bit", x1500_mmc_1bit),
-	INGENIC_PIN_GROUP("mmc-4bit", x1500_mmc_4bit),
-	INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0),
-	INGENIC_PIN_GROUP("i2c1-data-a", x1500_i2c1_a),
-	INGENIC_PIN_GROUP("i2c1-data-c", x1500_i2c1_c),
-	INGENIC_PIN_GROUP("i2c2-data", x1500_i2c2),
-	INGENIC_PIN_GROUP("i2s-data-tx", x1500_i2s_data_tx),
-	INGENIC_PIN_GROUP("i2s-data-rx", x1500_i2s_data_rx),
-	INGENIC_PIN_GROUP("i2s-clk-txrx", x1500_i2s_clk_txrx),
-	INGENIC_PIN_GROUP("i2s-sysclk", x1500_i2s_sysclk),
-	INGENIC_PIN_GROUP("cim-data", x1500_cim),
+	INGENIC_PIN_GROUP("uart0-data", x1500_uart0_data, 0),
+	INGENIC_PIN_GROUP("uart0-hwflow", x1500_uart0_hwflow, 0),
+	INGENIC_PIN_GROUP("uart1-data-a", x1500_uart1_data_a, 2),
+	INGENIC_PIN_GROUP("uart1-data-d", x1500_uart1_data_d, 1),
+	INGENIC_PIN_GROUP("uart1-hwflow", x1500_uart1_hwflow, 1),
+	INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a, 2),
+	INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d, 0),
+	INGENIC_PIN_GROUP("sfc", x1000_sfc, 1),
+	INGENIC_PIN_GROUP("mmc-1bit", x1500_mmc_1bit, 1),
+	INGENIC_PIN_GROUP("mmc-4bit", x1500_mmc_4bit, 1),
+	INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0, 0),
+	INGENIC_PIN_GROUP("i2c1-data-a", x1500_i2c1_a, 2),
+	INGENIC_PIN_GROUP("i2c1-data-c", x1500_i2c1_c, 0),
+	INGENIC_PIN_GROUP("i2c2-data", x1500_i2c2, 1),
+	INGENIC_PIN_GROUP("i2s-data-tx", x1500_i2s_data_tx, 1),
+	INGENIC_PIN_GROUP("i2s-data-rx", x1500_i2s_data_rx, 1),
+	INGENIC_PIN_GROUP("i2s-clk-txrx", x1500_i2s_clk_txrx, 1),
+	INGENIC_PIN_GROUP("i2s-sysclk", x1500_i2s_sysclk, 1),
+	INGENIC_PIN_GROUP("cim-data", x1500_cim, 2),
 	{ "lcd-no-pins", },
-	INGENIC_PIN_GROUP("pwm0", x1500_pwm_pwm0),
-	INGENIC_PIN_GROUP("pwm1", x1500_pwm_pwm1),
-	INGENIC_PIN_GROUP("pwm2", x1500_pwm_pwm2),
-	INGENIC_PIN_GROUP("pwm3", x1500_pwm_pwm3),
-	INGENIC_PIN_GROUP("pwm4", x1500_pwm_pwm4),
+	INGENIC_PIN_GROUP("pwm0", x1500_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", x1500_pwm_pwm1, 1),
+	INGENIC_PIN_GROUP("pwm2", x1500_pwm_pwm2, 1),
+	INGENIC_PIN_GROUP("pwm3", x1500_pwm_pwm3, 2),
+	INGENIC_PIN_GROUP("pwm4", x1500_pwm_pwm4, 0),
 };
 
 static const char *x1500_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -1811,124 +1502,62 @@ static int x1830_mac_pins[] = {
 	0x29, 0x30, 0x2f, 0x28, 0x2e, 0x2d, 0x2a, 0x2b, 0x26, 0x27,
 };
 
-static int x1830_uart0_data_funcs[] = { 0, 0, };
-static int x1830_uart0_hwflow_funcs[] = { 0, 0, };
-static int x1830_uart1_data_funcs[] = { 0, 0, };
-static int x1830_sfc_funcs[] = { 1, 1, 1, 1, 1, 1, };
-static int x1830_ssi0_dt_funcs[] = { 0, };
-static int x1830_ssi0_dr_funcs[] = { 0, };
-static int x1830_ssi0_clk_funcs[] = { 0, };
-static int x1830_ssi0_gpc_funcs[] = { 0, };
-static int x1830_ssi0_ce0_funcs[] = { 0, };
-static int x1830_ssi0_ce1_funcs[] = { 0, };
-static int x1830_ssi1_dt_c_funcs[] = { 1, };
-static int x1830_ssi1_dr_c_funcs[] = { 1, };
-static int x1830_ssi1_clk_c_funcs[] = { 1, };
-static int x1830_ssi1_gpc_c_funcs[] = { 1, };
-static int x1830_ssi1_ce0_c_funcs[] = { 1, };
-static int x1830_ssi1_ce1_c_funcs[] = { 1, };
-static int x1830_ssi1_dt_d_funcs[] = { 2, };
-static int x1830_ssi1_dr_d_funcs[] = { 2, };
-static int x1830_ssi1_clk_d_funcs[] = { 2, };
-static int x1830_ssi1_gpc_d_funcs[] = { 2, };
-static int x1830_ssi1_ce0_d_funcs[] = { 2, };
-static int x1830_ssi1_ce1_d_funcs[] = { 2, };
-static int x1830_mmc0_1bit_funcs[] = { 0, 0, 0, };
-static int x1830_mmc0_4bit_funcs[] = { 0, 0, 0, };
-static int x1830_mmc1_1bit_funcs[] = { 0, 0, 0, };
-static int x1830_mmc1_4bit_funcs[] = { 0, 0, 0, };
-static int x1830_i2c0_funcs[] = { 1, 1, };
-static int x1830_i2c1_funcs[] = { 0, 0, };
-static int x1830_i2c2_funcs[] = { 1, 1, };
-static int x1830_i2s_data_tx_funcs[] = { 0, };
-static int x1830_i2s_data_rx_funcs[] = { 0, };
-static int x1830_i2s_clk_txrx_funcs[] = { 0, 0, };
-static int x1830_i2s_clk_rx_funcs[] = { 0, 0, };
-static int x1830_i2s_sysclk_funcs[] = { 0, };
-static int x1830_lcd_rgb_18bit_funcs[] = {
-	0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0,
-};
-static int x1830_lcd_slcd_8bit_funcs[] = {
-	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-};
-static int x1830_lcd_slcd_16bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, };
-static int x1830_pwm_pwm0_b_funcs[] = { 0, };
-static int x1830_pwm_pwm0_c_funcs[] = { 1, };
-static int x1830_pwm_pwm1_b_funcs[] = { 0, };
-static int x1830_pwm_pwm1_c_funcs[] = { 1, };
-static int x1830_pwm_pwm2_c_8_funcs[] = { 0, };
-static int x1830_pwm_pwm2_c_13_funcs[] = { 1, };
-static int x1830_pwm_pwm3_c_9_funcs[] = { 0, };
-static int x1830_pwm_pwm3_c_14_funcs[] = { 1, };
-static int x1830_pwm_pwm4_c_15_funcs[] = { 1, };
-static int x1830_pwm_pwm4_c_25_funcs[] = { 0, };
-static int x1830_pwm_pwm5_c_16_funcs[] = { 1, };
-static int x1830_pwm_pwm5_c_26_funcs[] = { 0, };
-static int x1830_pwm_pwm6_c_17_funcs[] = { 1, };
-static int x1830_pwm_pwm6_c_27_funcs[] = { 0, };
-static int x1830_pwm_pwm7_c_18_funcs[] = { 1, };
-static int x1830_pwm_pwm7_c_28_funcs[] = { 0, };
-static int x1830_mac_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
-
 static const struct group_desc x1830_groups[] = {
-	INGENIC_PIN_GROUP("uart0-data", x1830_uart0_data),
-	INGENIC_PIN_GROUP("uart0-hwflow", x1830_uart0_hwflow),
-	INGENIC_PIN_GROUP("uart1-data", x1830_uart1_data),
-	INGENIC_PIN_GROUP("sfc", x1830_sfc),
-	INGENIC_PIN_GROUP("ssi0-dt", x1830_ssi0_dt),
-	INGENIC_PIN_GROUP("ssi0-dr", x1830_ssi0_dr),
-	INGENIC_PIN_GROUP("ssi0-clk", x1830_ssi0_clk),
-	INGENIC_PIN_GROUP("ssi0-gpc", x1830_ssi0_gpc),
-	INGENIC_PIN_GROUP("ssi0-ce0", x1830_ssi0_ce0),
-	INGENIC_PIN_GROUP("ssi0-ce1", x1830_ssi0_ce1),
-	INGENIC_PIN_GROUP("ssi1-dt-c", x1830_ssi1_dt_c),
-	INGENIC_PIN_GROUP("ssi1-dr-c", x1830_ssi1_dr_c),
-	INGENIC_PIN_GROUP("ssi1-clk-c", x1830_ssi1_clk_c),
-	INGENIC_PIN_GROUP("ssi1-gpc-c", x1830_ssi1_gpc_c),
-	INGENIC_PIN_GROUP("ssi1-ce0-c", x1830_ssi1_ce0_c),
-	INGENIC_PIN_GROUP("ssi1-ce1-c", x1830_ssi1_ce1_c),
-	INGENIC_PIN_GROUP("ssi1-dt-d", x1830_ssi1_dt_d),
-	INGENIC_PIN_GROUP("ssi1-dr-d", x1830_ssi1_dr_d),
-	INGENIC_PIN_GROUP("ssi1-clk-d", x1830_ssi1_clk_d),
-	INGENIC_PIN_GROUP("ssi1-gpc-d", x1830_ssi1_gpc_d),
-	INGENIC_PIN_GROUP("ssi1-ce0-d", x1830_ssi1_ce0_d),
-	INGENIC_PIN_GROUP("ssi1-ce1-d", x1830_ssi1_ce1_d),
-	INGENIC_PIN_GROUP("mmc0-1bit", x1830_mmc0_1bit),
-	INGENIC_PIN_GROUP("mmc0-4bit", x1830_mmc0_4bit),
-	INGENIC_PIN_GROUP("mmc1-1bit", x1830_mmc1_1bit),
-	INGENIC_PIN_GROUP("mmc1-4bit", x1830_mmc1_4bit),
-	INGENIC_PIN_GROUP("i2c0-data", x1830_i2c0),
-	INGENIC_PIN_GROUP("i2c1-data", x1830_i2c1),
-	INGENIC_PIN_GROUP("i2c2-data", x1830_i2c2),
-	INGENIC_PIN_GROUP("i2s-data-tx", x1830_i2s_data_tx),
-	INGENIC_PIN_GROUP("i2s-data-rx", x1830_i2s_data_rx),
-	INGENIC_PIN_GROUP("i2s-clk-txrx", x1830_i2s_clk_txrx),
-	INGENIC_PIN_GROUP("i2s-clk-rx", x1830_i2s_clk_rx),
-	INGENIC_PIN_GROUP("i2s-sysclk", x1830_i2s_sysclk),
-	INGENIC_PIN_GROUP("lcd-rgb-18bit", x1830_lcd_rgb_18bit),
-	INGENIC_PIN_GROUP("lcd-slcd-8bit", x1830_lcd_slcd_8bit),
-	INGENIC_PIN_GROUP("lcd-slcd-16bit", x1830_lcd_slcd_16bit),
+	INGENIC_PIN_GROUP("uart0-data", x1830_uart0_data, 0),
+	INGENIC_PIN_GROUP("uart0-hwflow", x1830_uart0_hwflow, 0),
+	INGENIC_PIN_GROUP("uart1-data", x1830_uart1_data, 0),
+	INGENIC_PIN_GROUP("sfc", x1830_sfc, 1),
+	INGENIC_PIN_GROUP("ssi0-dt", x1830_ssi0_dt, 0),
+	INGENIC_PIN_GROUP("ssi0-dr", x1830_ssi0_dr, 0),
+	INGENIC_PIN_GROUP("ssi0-clk", x1830_ssi0_clk, 0),
+	INGENIC_PIN_GROUP("ssi0-gpc", x1830_ssi0_gpc, 0),
+	INGENIC_PIN_GROUP("ssi0-ce0", x1830_ssi0_ce0, 0),
+	INGENIC_PIN_GROUP("ssi0-ce1", x1830_ssi0_ce1, 0),
+	INGENIC_PIN_GROUP("ssi1-dt-c", x1830_ssi1_dt_c, 1),
+	INGENIC_PIN_GROUP("ssi1-dr-c", x1830_ssi1_dr_c, 1),
+	INGENIC_PIN_GROUP("ssi1-clk-c", x1830_ssi1_clk_c, 1),
+	INGENIC_PIN_GROUP("ssi1-gpc-c", x1830_ssi1_gpc_c, 1),
+	INGENIC_PIN_GROUP("ssi1-ce0-c", x1830_ssi1_ce0_c, 1),
+	INGENIC_PIN_GROUP("ssi1-ce1-c", x1830_ssi1_ce1_c, 1),
+	INGENIC_PIN_GROUP("ssi1-dt-d", x1830_ssi1_dt_d, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-d", x1830_ssi1_dr_d, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-d", x1830_ssi1_clk_d, 2),
+	INGENIC_PIN_GROUP("ssi1-gpc-d", x1830_ssi1_gpc_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-d", x1830_ssi1_ce0_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce1-d", x1830_ssi1_ce1_d, 2),
+	INGENIC_PIN_GROUP("mmc0-1bit", x1830_mmc0_1bit, 0),
+	INGENIC_PIN_GROUP("mmc0-4bit", x1830_mmc0_4bit, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit", x1830_mmc1_1bit, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit", x1830_mmc1_4bit, 0),
+	INGENIC_PIN_GROUP("i2c0-data", x1830_i2c0, 1),
+	INGENIC_PIN_GROUP("i2c1-data", x1830_i2c1, 0),
+	INGENIC_PIN_GROUP("i2c2-data", x1830_i2c2, 1),
+	INGENIC_PIN_GROUP("i2s-data-tx", x1830_i2s_data_tx, 0),
+	INGENIC_PIN_GROUP("i2s-data-rx", x1830_i2s_data_rx, 0),
+	INGENIC_PIN_GROUP("i2s-clk-txrx", x1830_i2s_clk_txrx, 0),
+	INGENIC_PIN_GROUP("i2s-clk-rx", x1830_i2s_clk_rx, 0),
+	INGENIC_PIN_GROUP("i2s-sysclk", x1830_i2s_sysclk, 0),
+	INGENIC_PIN_GROUP("lcd-rgb-18bit", x1830_lcd_rgb_18bit, 0),
+	INGENIC_PIN_GROUP("lcd-slcd-8bit", x1830_lcd_slcd_8bit, 1),
+	INGENIC_PIN_GROUP("lcd-slcd-16bit", x1830_lcd_slcd_16bit, 1),
 	{ "lcd-no-pins", },
-	INGENIC_PIN_GROUP("pwm0-b", x1830_pwm_pwm0_b),
-	INGENIC_PIN_GROUP("pwm0-c", x1830_pwm_pwm0_c),
-	INGENIC_PIN_GROUP("pwm1-b", x1830_pwm_pwm1_b),
-	INGENIC_PIN_GROUP("pwm1-c", x1830_pwm_pwm1_c),
-	INGENIC_PIN_GROUP("pwm2-c-8", x1830_pwm_pwm2_c_8),
-	INGENIC_PIN_GROUP("pwm2-c-13", x1830_pwm_pwm2_c_13),
-	INGENIC_PIN_GROUP("pwm3-c-9", x1830_pwm_pwm3_c_9),
-	INGENIC_PIN_GROUP("pwm3-c-14", x1830_pwm_pwm3_c_14),
-	INGENIC_PIN_GROUP("pwm4-c-15", x1830_pwm_pwm4_c_15),
-	INGENIC_PIN_GROUP("pwm4-c-25", x1830_pwm_pwm4_c_25),
-	INGENIC_PIN_GROUP("pwm5-c-16", x1830_pwm_pwm5_c_16),
-	INGENIC_PIN_GROUP("pwm5-c-26", x1830_pwm_pwm5_c_26),
-	INGENIC_PIN_GROUP("pwm6-c-17", x1830_pwm_pwm6_c_17),
-	INGENIC_PIN_GROUP("pwm6-c-27", x1830_pwm_pwm6_c_27),
-	INGENIC_PIN_GROUP("pwm7-c-18", x1830_pwm_pwm7_c_18),
-	INGENIC_PIN_GROUP("pwm7-c-28", x1830_pwm_pwm7_c_28),
-	INGENIC_PIN_GROUP("mac", x1830_mac),
+	INGENIC_PIN_GROUP("pwm0-b", x1830_pwm_pwm0_b, 0),
+	INGENIC_PIN_GROUP("pwm0-c", x1830_pwm_pwm0_c, 1),
+	INGENIC_PIN_GROUP("pwm1-b", x1830_pwm_pwm1_b, 0),
+	INGENIC_PIN_GROUP("pwm1-c", x1830_pwm_pwm1_c, 1),
+	INGENIC_PIN_GROUP("pwm2-c-8", x1830_pwm_pwm2_c_8, 0),
+	INGENIC_PIN_GROUP("pwm2-c-13", x1830_pwm_pwm2_c_13, 1),
+	INGENIC_PIN_GROUP("pwm3-c-9", x1830_pwm_pwm3_c_9, 0),
+	INGENIC_PIN_GROUP("pwm3-c-14", x1830_pwm_pwm3_c_14, 1),
+	INGENIC_PIN_GROUP("pwm4-c-15", x1830_pwm_pwm4_c_15, 1),
+	INGENIC_PIN_GROUP("pwm4-c-25", x1830_pwm_pwm4_c_25, 0),
+	INGENIC_PIN_GROUP("pwm5-c-16", x1830_pwm_pwm5_c_16, 1),
+	INGENIC_PIN_GROUP("pwm5-c-26", x1830_pwm_pwm5_c_26, 0),
+	INGENIC_PIN_GROUP("pwm6-c-17", x1830_pwm_pwm6_c_17, 1),
+	INGENIC_PIN_GROUP("pwm6-c-27", x1830_pwm_pwm6_c_27, 0),
+	INGENIC_PIN_GROUP("pwm7-c-18", x1830_pwm_pwm7_c_18, 1),
+	INGENIC_PIN_GROUP("pwm7-c-28", x1830_pwm_pwm7_c_28, 0),
+	INGENIC_PIN_GROUP("mac", x1830_mac, 0),
 };
 
 static const char *x1830_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -2381,6 +2010,8 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int i;
+	uintptr_t mode;
+	u8 *pin_modes;
 
 	func = pinmux_generic_get_function(pctldev, selector);
 	if (!func)
@@ -2393,10 +2024,15 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
 		func->name, grp->name);
 
-	for (i = 0; i < grp->num_pins; i++) {
-		int *pin_modes = grp->data;
+	mode = (uintptr_t)grp->data;
+	if (mode <= 3) {
+		for (i = 0; i < grp->num_pins; i++)
+			ingenic_pinmux_set_pin_fn(jzpc, grp->pins[i], mode);
+	} else {
+		pin_modes = grp->data;
 
-		ingenic_pinmux_set_pin_fn(jzpc, grp->pins[i], pin_modes[i]);
+		for (i = 0; i < grp->num_pins; i++)
+			ingenic_pinmux_set_pin_fn(jzpc, grp->pins[i], pin_modes[i]);
 	}
 
 	return 0;
-- 
2.28.0

