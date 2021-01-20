Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716CB2FD067
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 13:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbhATMiv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 07:38:51 -0500
Received: from aposti.net ([89.234.176.197]:52938 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730348AbhATLIM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 06:08:12 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] pinctrl: ingenic: Improve JZ4760 support
Date:   Wed, 20 Jan 2021 11:07:22 +0000
Message-Id: <20210120110722.20133-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- Add otg function and otg-vbus group.

- Add lcd-8bit, lcd-16bit, lcd-18bit, lcd-generic and lcd-special
  groups. Change the lcd-24bit group so that it only selects the pins
  that aren't in the lcd-18bit and lcd-generic groups (which breaks
  Device Tree in theory, but there is none out there for any JZ4760
  based board, yet). Remove the lcd-no-pins group which is just useless.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 38 +++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 76fec77c5b67..f2746125b077 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -376,12 +376,21 @@ static int jz4760_cim_pins[] = {
 	0x26, 0x27, 0x28, 0x29,
 	0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31,
 };
+static int jz4760_lcd_8bit_pins[] = {
+	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x4c,
+	0x4d, 0x52, 0x53,
+};
+static int jz4760_lcd_16bit_pins[] = {
+	0x4e, 0x4f, 0x50, 0x51, 0x56, 0x57, 0x58, 0x59,
+};
+static int jz4760_lcd_18bit_pins[] = {
+	0x5a, 0x5b,
+};
 static int jz4760_lcd_24bit_pins[] = {
-	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
-	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
-	0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
-	0x58, 0x59, 0x5a, 0x5b,
+	0x40, 0x41, 0x4a, 0x4b, 0x54, 0x55,
 };
+static int jz4760_lcd_special_pins[] = { 0x40, 0x41, 0x4a, 0x54 };
+static int jz4760_lcd_generic_pins[] = { 0x49, };
 static int jz4760_pwm_pwm0_pins[] = { 0x80, };
 static int jz4760_pwm_pwm1_pins[] = { 0x81, };
 static int jz4760_pwm_pwm2_pins[] = { 0x82, };
@@ -390,6 +399,7 @@ static int jz4760_pwm_pwm4_pins[] = { 0x84, };
 static int jz4760_pwm_pwm5_pins[] = { 0x85, };
 static int jz4760_pwm_pwm6_pins[] = { 0x6a, };
 static int jz4760_pwm_pwm7_pins[] = { 0x6b, };
+static int jz4760_otg_pins[] = { 0x8a, };
 
 static u8 jz4760_uart3_data_funcs[] = { 0, 1, };
 static u8 jz4760_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
@@ -436,8 +446,12 @@ static const struct group_desc jz4760_groups[] = {
 	INGENIC_PIN_GROUP("i2c0-data", jz4760_i2c0, 0),
 	INGENIC_PIN_GROUP("i2c1-data", jz4760_i2c1, 0),
 	INGENIC_PIN_GROUP("cim-data", jz4760_cim, 0),
+	INGENIC_PIN_GROUP("lcd-8bit", jz4760_lcd_8bit, 0),
+	INGENIC_PIN_GROUP("lcd-16bit", jz4760_lcd_16bit, 0),
+	INGENIC_PIN_GROUP("lcd-18bit", jz4760_lcd_18bit, 0),
 	INGENIC_PIN_GROUP("lcd-24bit", jz4760_lcd_24bit, 0),
-	{ "lcd-no-pins", },
+	INGENIC_PIN_GROUP("lcd-generic", jz4760_lcd_generic, 0),
+	INGENIC_PIN_GROUP("lcd-special", jz4760_lcd_special, 1),
 	INGENIC_PIN_GROUP("pwm0", jz4760_pwm_pwm0, 0),
 	INGENIC_PIN_GROUP("pwm1", jz4760_pwm_pwm1, 0),
 	INGENIC_PIN_GROUP("pwm2", jz4760_pwm_pwm2, 0),
@@ -446,6 +460,7 @@ static const struct group_desc jz4760_groups[] = {
 	INGENIC_PIN_GROUP("pwm5", jz4760_pwm_pwm5, 0),
 	INGENIC_PIN_GROUP("pwm6", jz4760_pwm_pwm6, 0),
 	INGENIC_PIN_GROUP("pwm7", jz4760_pwm_pwm7, 0),
+	INGENIC_PIN_GROUP("otg-vbus", jz4760_otg, 0),
 };
 
 static const char *jz4760_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -477,7 +492,10 @@ static const char *jz4760_cs6_groups[] = { "nemc-cs6", };
 static const char *jz4760_i2c0_groups[] = { "i2c0-data", };
 static const char *jz4760_i2c1_groups[] = { "i2c1-data", };
 static const char *jz4760_cim_groups[] = { "cim-data", };
-static const char *jz4760_lcd_groups[] = { "lcd-24bit", "lcd-no-pins", };
+static const char *jz4760_lcd_groups[] = {
+	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit",
+	"lcd-special", "lcd-generic",
+};
 static const char *jz4760_pwm0_groups[] = { "pwm0", };
 static const char *jz4760_pwm1_groups[] = { "pwm1", };
 static const char *jz4760_pwm2_groups[] = { "pwm2", };
@@ -486,6 +504,7 @@ static const char *jz4760_pwm4_groups[] = { "pwm4", };
 static const char *jz4760_pwm5_groups[] = { "pwm5", };
 static const char *jz4760_pwm6_groups[] = { "pwm6", };
 static const char *jz4760_pwm7_groups[] = { "pwm7", };
+static const char *jz4760_otg_groups[] = { "otg-vbus", };
 
 static const struct function_desc jz4760_functions[] = {
 	{ "uart0", jz4760_uart0_groups, ARRAY_SIZE(jz4760_uart0_groups), },
@@ -514,6 +533,7 @@ static const struct function_desc jz4760_functions[] = {
 	{ "pwm5", jz4760_pwm5_groups, ARRAY_SIZE(jz4760_pwm5_groups), },
 	{ "pwm6", jz4760_pwm6_groups, ARRAY_SIZE(jz4760_pwm6_groups), },
 	{ "pwm7", jz4760_pwm7_groups, ARRAY_SIZE(jz4760_pwm7_groups), },
+	{ "otg", jz4760_otg_groups, ARRAY_SIZE(jz4760_otg_groups), },
 };
 
 static const struct ingenic_chip_info jz4760_chip_info = {
@@ -648,7 +668,6 @@ static int jz4770_mac_rmii_pins[] = {
 	0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
 };
 static int jz4770_mac_mii_pins[] = { 0xa7, 0xaf, };
-static int jz4770_otg_pins[] = { 0x8a, };
 
 static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
@@ -747,7 +766,7 @@ static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7, 0),
 	INGENIC_PIN_GROUP("mac-rmii", jz4770_mac_rmii, 0),
 	INGENIC_PIN_GROUP("mac-mii", jz4770_mac_mii, 0),
-	INGENIC_PIN_GROUP("otg-vbus", jz4770_otg, 0),
+	INGENIC_PIN_GROUP("otg-vbus", jz4760_otg, 0),
 };
 
 static const char *jz4770_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -808,7 +827,6 @@ static const char *jz4770_pwm5_groups[] = { "pwm5", };
 static const char *jz4770_pwm6_groups[] = { "pwm6", };
 static const char *jz4770_pwm7_groups[] = { "pwm7", };
 static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
-static const char *jz4770_otg_groups[] = { "otg-vbus", };
 
 static const struct function_desc jz4770_functions[] = {
 	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), },
@@ -841,7 +859,7 @@ static const struct function_desc jz4770_functions[] = {
 	{ "pwm6", jz4770_pwm6_groups, ARRAY_SIZE(jz4770_pwm6_groups), },
 	{ "pwm7", jz4770_pwm7_groups, ARRAY_SIZE(jz4770_pwm7_groups), },
 	{ "mac", jz4770_mac_groups, ARRAY_SIZE(jz4770_mac_groups), },
-	{ "otg", jz4770_otg_groups, ARRAY_SIZE(jz4770_otg_groups), },
+	{ "otg", jz4760_otg_groups, ARRAY_SIZE(jz4760_otg_groups), },
 };
 
 static const struct ingenic_chip_info jz4770_chip_info = {
-- 
2.29.2

