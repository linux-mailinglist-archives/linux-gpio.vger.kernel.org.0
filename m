Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 188BD4FFC58
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237274AbiDMR0t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237284AbiDMR0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:44 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9FA6B08F
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JHQF2700a2t8Arn01HQFPi; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqG-83; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfSb-8A; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/50] pinctrl: renesas: r8a7791: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:31 +0200
Message-Id: <972808be595fd742afc6b7fc89751ca4788d6f62.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the full descriptions of reserved register fields by shorthands
with a negative field width, and merge adjacent reserved fields.

This reduces kernel size by 349 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7791.c | 111 ++++++++------------------
 1 file changed, 32 insertions(+), 79 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index 076a8b7d71de04d2..d57458504117daa3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -5686,11 +5686,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_7_0_FN, FN_IP15_17_15 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR0", 0xE6060020, 32,
-			     GROUP(1, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1,
+			     GROUP(-1, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
-		/* IP0_31 [1] */
-		0, 0,
+		/* IP0_31 [1] RESERVED */
 		/* IP0_30_29 [2] */
 		FN_A6, FN_MSIOF1_SCK,
 		0, 0,
@@ -5783,10 +5782,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR2", 0xE6060028, 32,
-			     GROUP(2, 3, 2, 2, 2, 2, 3, 3, 3, 3, 2, 2, 3),
+			     GROUP(-2, 3, 2, 2, 2, 2, 3, 3, 3, 3, 2, 2, 3),
 			     GROUP(
-		/* IP2_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP2_31_30 [2] RESERVED */
 		/* IP2_29_27 [3] */
 		FN_EX_CS3_N, FN_ATADIR0_N, FN_MSIOF2_TXD,
 		FN_ATAG0_N, 0, FN_EX_WAIT1,
@@ -5820,10 +5818,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SCIFB1_TXD_C, 0, FN_SCIFB1_SCK_B, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR3", 0xE606002C, 32,
-			     GROUP(1, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3),
+			     GROUP(-1, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 3, 3),
 			     GROUP(
-		/* IP3_31 [1] */
-		0, 0,
+		/* IP3_31 [1] RESERVED */
 		/* IP3_30_28 [3] */
 		FN_SSI_WS0129, FN_HTX0_C, FN_HTX2_C,
 		FN_SCIFB0_TXD_C, FN_SCIFB2_TXD_C,
@@ -5859,11 +5856,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR4", 0xE6060030, 32,
-			     GROUP(1, 3, 2, 2, 2, 1, 1, 1, 3, 3, 3, 2,
+			     GROUP(-1, 3, 2, 2, 2, 1, 1, 1, 3, 3, 3, 2,
 				   3, 3, 2),
 			     GROUP(
-		/* IP4_31 [1] */
-		0, 0,
+		/* IP4_31 [1] RESERVED */
 		/* IP4_30_28 [3] */
 		FN_SSI_SCK5, FN_MSIOF1_SCK_C, FN_TS_SDATA0, FN_GLO_I0,
 		FN_MSIOF2_SYNC_D, FN_VI1_R2_B,
@@ -5943,10 +5939,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR6", 0xE6060038, 32,
-			     GROUP(2, 3, 3, 3, 2, 3, 2, 2, 2, 2, 2, 3, 3),
+			     GROUP(-2, 3, 3, 3, 2, 3, 2, 2, 2, 2, 2, 3, 3),
 			     GROUP(
-		/* IP6_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP6_31_30 [2] RESERVED */
 		/* IP6_29_27 [3] */
 		FN_IRQ8, FN_HRTS1_N_C, FN_MSIOF1_RXD_B,
 		FN_GPS_SIGN_C, FN_GPS_SIGN_D,
@@ -5984,10 +5979,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR7", 0xE606003C, 32,
-			     GROUP(2, 3, 3, 3, 2, 2, 2, 2, 2, 2, 3, 3, 3),
+			     GROUP(-2, 3, 3, 3, 2, 2, 2, 2, 2, 2, 3, 3, 3),
 			     GROUP(
-		/* IP7_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP7_31_30 [2] RESERVED */
 		/* IP7_29_27 [3] */
 		FN_DU1_DG2, FN_LCDOUT10, FN_VI1_DATA4_B, FN_SCIF1_SCK_B,
 		FN_SCIFA1_SCK, FN_SSI_SCK78_B,
@@ -6026,10 +6020,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR8", 0xE6060040, 32,
-			     GROUP(1, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3),
+			     GROUP(-1, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-		/* IP8_31 [1] */
-		0, 0,
+		/* IP8_31 [1] RESERVED */
 		/* IP8_30_28 [3] */
 		FN_DU1_DB5, FN_LCDOUT21, FN_TX3, FN_SCIFA3_TXD, FN_CAN1_TX,
 		0, 0, 0,
@@ -6201,10 +6194,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_I2C1_SDA_D, 0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR12", 0xE6060050, 32,
-			     GROUP(2, 3, 3, 2, 2, 2, 2, 3, 3, 3, 3, 2, 2),
+			     GROUP(-2, 3, 3, 2, 2, 2, 2, 3, 3, 3, 3, 2, 2),
 			     GROUP(
-		/* IP12_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP12_31_30 [2] RESERVED */
 		/* IP12_29_27 [3] */
 		FN_STP_ISCLK_0, FN_AVB_TX_EN, FN_SCIFB2_RXD_D,
 		FN_ADICS_SAMP_B, FN_MSIOF0_SCK_C,
@@ -6243,11 +6235,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_ETH_RX_ER, FN_AVB_CRS, FN_I2C3_SCL, FN_IIC0_SCL, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR13", 0xE6060054, 32,
-			     GROUP(1, 3, 1, 1, 1, 2, 1, 3, 3, 1, 1, 1,
+			     GROUP(-1, 3, 1, 1, 1, 2, 1, 3, 3, 1, 1, 1,
 				   1, 1, 1, 3, 2, 2, 3),
 			     GROUP(
-		/* IP13_31 [1] */
-		0, 0,
+		/* IP13_31 [1] RESERVED */
 		/* IP13_30_28 [3] */
 		FN_SD1_CD, FN_PWM0, FN_TPU_TO0, FN_I2C1_SCL_C,
 		0, 0, 0, 0,
@@ -6340,10 +6331,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SD1_WP, FN_PWM1_B, FN_I2C1_SDA_C, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR15", 0xE606005C, 32,
-			     GROUP(2, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2),
+			     GROUP(-2, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2),
 			     GROUP(
-		/* IP15_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP15_31_30 [2] RESERVED */
 		/* IP15_29_27 [3] */
 		FN_HTX0, FN_SCIFB0_TXD, 0, FN_GLO_SCLK_C,
 		FN_CAN0_TX_B, FN_VI1_DATA5_C,
@@ -6382,23 +6372,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SIM0_RST, FN_IETX, FN_CAN1_TX_D, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR16", 0xE6060160, 32,
-			     GROUP(4, 4, 4, 4, 4, 2, 2, 2, 3, 3),
+			     GROUP(-20, 2, 2, 2, 3, 3),
 			     GROUP(
-		/* IP16_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP16_27_24 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP16_23_20 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP16_19_16 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP16_15_12 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* RESERVED [20] */
 		/* IP16_11_10 [2] */
 		FN_HRTS1_N, FN_SCIFB1_RTS_N, FN_MLB_DAT, FN_CAN1_RX_B,
 		/* IP16_9_8 [2] */
@@ -6415,11 +6391,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL", 0xE6060090, 32,
-			     GROUP(1, 2, 2, 2, 3, 2, 1, 1, 1, 1, 3, 2,
-				   2, 2, 1, 2, 2, 2),
+			     GROUP(-1, 2, 2, 2, 3, 2, 1, 1, 1, 1, 3, -2,
+				   2, -2, 1, 2, 2, 2),
 			     GROUP(
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_SCIF1 [2] */
 		FN_SEL_SCIF1_0, FN_SEL_SCIF1_1, FN_SEL_SCIF1_2, FN_SEL_SCIF1_3,
 		/* SEL_SCIFB [2] */
@@ -6446,11 +6421,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_HSCIF1_3, FN_SEL_HSCIF1_4,
 		0, 0, 0,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* SEL_VI1 [2] */
 		FN_SEL_VI1_0, FN_SEL_VI1_1, FN_SEL_VI1_2, 0,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* SEL_TMU [1] */
 		FN_SEL_TMU1_0, FN_SEL_TMU1_1,
 		/* SEL_LBS [2] */
@@ -6461,15 +6434,14 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_SOF0_0, FN_SEL_SOF0_1, FN_SEL_SOF0_2, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xE6060094, 32,
-			     GROUP(3, 1, 1, 3, 2, 1, 1, 2, 2, 1, 3, 2,
-				   1, 2, 2, 2, 1, 1, 1),
+			     GROUP(3, -1, 1, 3, 2, -1, 1, 2, -2, 1, 3, 2,
+				   -1, 2, 2, 2, 1, -1, 1),
 			     GROUP(
 		/* SEL_SCIF0 [3] */
 		FN_SEL_SCIF0_0, FN_SEL_SCIF0_1, FN_SEL_SCIF0_2,
 		FN_SEL_SCIF0_3, FN_SEL_SCIF0_4,
 		0, 0, 0,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_SCIF [1] */
 		FN_SEL_SCIF_0, FN_SEL_SCIF_1,
 		/* SEL_CAN0 [3] */
@@ -6479,13 +6451,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_CAN1 [2] */
 		FN_SEL_CAN1_0, FN_SEL_CAN1_1, FN_SEL_CAN1_2, FN_SEL_CAN1_3,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_SCIFA2 [1] */
 		FN_SEL_SCIFA2_0, FN_SEL_SCIFA2_1,
 		/* SEL_SCIF4 [2] */
 		FN_SEL_SCIF4_0, FN_SEL_SCIF4_1, FN_SEL_SCIF4_2, 0,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* SEL_ADG [1] */
 		FN_SEL_ADG_0, FN_SEL_ADG_1,
 		/* SEL_FM [3] */
@@ -6495,7 +6465,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_SCIFA5 [2] */
 		FN_SEL_SCIFA5_0, FN_SEL_SCIFA5_1, FN_SEL_SCIFA5_2, 0,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_GPS [2] */
 		FN_SEL_GPS_0, FN_SEL_GPS_1, FN_SEL_GPS_2, FN_SEL_GPS_3,
 		/* SEL_SCIFA4 [2] */
@@ -6505,13 +6474,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_SIM [1] */
 		FN_SEL_SIM_0, FN_SEL_SIM_1,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_SSI8 [1] */
 		FN_SEL_SSI8_0, FN_SEL_SSI8_1, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL3", 0xE6060098, 32,
-			     GROUP(2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 2, 2,
-				   3, 2, 2, 2, 1),
+			     GROUP(2, 2, 2, 2, 2, 2, 2, 2, 1, 1, -2, 2,
+				   3, 2, -5),
 			     GROUP(
 		/* SEL_HSCIF2 [2] */
 		FN_SEL_HSCIF2_0, FN_SEL_HSCIF2_1,
@@ -6536,7 +6504,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_SCIF5 [1] */
 		FN_SEL_SCIF5_0, FN_SEL_SCIF5_1,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* SEL_I2C2 [2] */
 		FN_SEL_I2C2_0, FN_SEL_I2C2_1, FN_SEL_I2C2_2, FN_SEL_I2C2_3,
 		/* SEL_I2C1 [3] */
@@ -6545,16 +6512,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0,
 		/* SEL_I2C0 [2] */
 		FN_SEL_I2C0_0, FN_SEL_I2C0_1, FN_SEL_I2C0_2, 0,
-		/* RESERVED [2] */
-		0, 0, 0, 0,
-		/* RESERVED [2] */
-		0, 0, 0, 0,
-		/* RESERVED [1] */
-		0, 0, ))
+		/* RESERVED [5] */ ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL4", 0xE606009C, 32,
-			     GROUP(3, 2, 2, 1, 1, 1, 1, 3, 2, 2, 3, 1,
-				   1, 1, 2, 2, 2, 2),
+			     GROUP(3, 2, 2, -1, 1, 1, 1, 3, -4, 3, -1,
+				   1, 1, 2, -6),
 			     GROUP(
 		/* SEL_SOF1 [3] */
 		FN_SEL_SOF1_0, FN_SEL_SOF1_1, FN_SEL_SOF1_2, FN_SEL_SOF1_3,
@@ -6565,7 +6527,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_DIS [2] */
 		FN_SEL_DIS_0, FN_SEL_DIS_1, FN_SEL_DIS_2, 0,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_RAD [1] */
 		FN_SEL_RAD_0, FN_SEL_RAD_1,
 		/* SEL_RCN [1] */
@@ -6577,27 +6538,19 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_SCIF2_3, FN_SEL_SCIF2_4,
 		0, 0, 0,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* SEL_SOF2 [3] */
 		FN_SEL_SOF2_0, FN_SEL_SOF2_1, FN_SEL_SOF2_2,
 		FN_SEL_SOF2_3, FN_SEL_SOF2_4,
 		0, 0, 0,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_SSI1 [1] */
 		FN_SEL_SSI1_0, FN_SEL_SSI1_1,
 		/* SEL_SSI0 [1] */
 		FN_SEL_SSI0_0, FN_SEL_SSI0_1,
 		/* SEL_SSP [2] */
 		FN_SEL_SSP_0, FN_SEL_SSP_1, FN_SEL_SSP_2, 0,
-		/* RESERVED [2] */
-		0, 0, 0, 0,
-		/* RESERVED [2] */
-		0, 0, 0, 0,
-		/* RESERVED [2] */
-		0, 0, 0, 0, ))
+		/* RESERVED [6] */ ))
 	},
 	{ },
 };
-- 
2.25.1

