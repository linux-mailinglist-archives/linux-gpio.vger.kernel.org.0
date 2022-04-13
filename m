Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A09A4FFC8F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237284AbiDMR1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237288AbiDMR0x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:53 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B431FA6D
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by michel.telenet-ops.be with bizsmtp
        id JHQG2700E2t8Arn06HQGDf; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqF-I2; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfSU-7J; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/50] pinctrl: renesas: r8a7790: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:30 +0200
Message-Id: <842d8060422a9b67dfac4af6d9325d0d99cf50dc.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the full descriptions of reserved register fields by shorthands
with a negative field width, and merge adjacent reserved fields.

This reduces kernel size by 445 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7790.c | 110 ++++++++------------------
 1 file changed, 32 insertions(+), 78 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 9db9e61d96bcca5a..ee21d650991bcec3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -5122,10 +5122,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_5_0_FN, FN_IP14_21_19 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR0", 0xE6060020, 32,
-			     GROUP(1, 4, 4, 3, 4, 4, 3, 3, 3, 3),
+			     GROUP(-1, 4, 4, 3, 4, 4, 3, 3, 3, 3),
 			     GROUP(
-		/* IP0_31 [1] */
-		0, 0,
+		/* IP0_31 [1] RESERVED */
 		/* IP0_30_27 [4] */
 		FN_D8, FN_SCIFA1_SCK_C, FN_AVB_TXD0, 0,
 		FN_VI0_G0, FN_VI0_G0_B, FN_VI2_DATA0_VI2_B0,
@@ -5159,10 +5158,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR1", 0xE6060024, 32,
-			     GROUP(2, 2, 2, 4, 4, 3, 3, 4, 4, 4),
+			     GROUP(-2, 2, 2, 4, 4, 3, 3, 4, 4, 4),
 			     GROUP(
-		/* IP1_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP1_31_30 [2] RESERVED */
 		/* IP1_29_28 [2] */
 		FN_A1, FN_PWM4, 0, 0,
 		/* IP1_27_26 [2] */
@@ -5197,10 +5195,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR2", 0xE6060028, 32,
-			     GROUP(3, 3, 4, 4, 3, 3, 3, 3, 3, 3),
+			     GROUP(-3, 3, 4, 4, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-		/* IP2_31_29 [3] */
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP2_31_29 [3] RESERVED */
 		/* IP2_28_26 [3] */
 		FN_A10, FN_SSI_SDATA5_B, FN_MSIOF2_SYNC, FN_VI0_R6,
 		FN_VI0_R6_B, FN_VI2_DATA2_VI2_B2_B, 0, 0,
@@ -5261,10 +5258,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR4", 0xE6060030, 32,
-			     GROUP(2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
+			     GROUP(-2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-		/* IP4_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP4_31_30 [2] RESERVED */
 		/* IP4_29_27 [3] */
 		FN_EX_CS2_N, FN_GPS_SIGN, FN_HRTS1_N_B,
 		FN_VI3_CLKENB, FN_VI1_G0, FN_VI1_G0_B, FN_VI2_R2, 0,
@@ -5295,10 +5291,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR5", 0xE6060034, 32,
-			     GROUP(2, 3, 3, 3, 3, 3, 2, 3, 4, 3, 3),
+			     GROUP(-2, 3, 3, 3, 3, 3, 2, 3, 4, 3, 3),
 			     GROUP(
-		/* IP5_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP5_31_30 [2] RESERVED */
 		/* IP5_29_27 [3] */
 		FN_DREQ0_N, FN_VI1_HSYNC_N, FN_VI1_HSYNC_N_B, FN_VI2_R7,
 		FN_SSI_SCK78_C, FN_SSI_WS78_B, 0, 0,
@@ -5368,10 +5363,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI1_VSYNC_N_B, FN_SSI_WS78_C, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR7", 0xE606003C, 32,
-			     GROUP(1, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 3, 3),
+			     GROUP(-1, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 3, 3),
 			     GROUP(
-		/* IP7_31 [1] */
-		0, 0,
+		/* IP7_31 [1] RESERVED */
 		/* IP7_30_29 [2] */
 		FN_VI0_DATA0_VI0_B0, FN_ATACS10_N, FN_AVB_RXD2, 0,
 		/* IP7_28_27 [2] */
@@ -5404,11 +5398,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SIM0_D_C, FN_HCTS0_N_F, 0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR8", 0xE6060040, 32,
-			     GROUP(1, 2, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2,
+			     GROUP(-1, 2, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2,
 				   2, 2, 2, 2, 2, 2),
 			     GROUP(
-		/* IP8_31 [1] */
-		0, 0,
+		/* IP8_31 [1] RESERVED */
 		/* IP8_30_29 [2] */
 		FN_SD0_CMD, FN_SCIFB1_SCK_B, FN_VI1_DATA1_VI1_B1_B, 0,
 		/* IP8_28 [1] */
@@ -5482,10 +5475,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SD0_DAT0, FN_SCIFB1_RXD_B, FN_VI1_DATA2_VI1_B2_B, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR10", 0xE6060048, 32,
-			     GROUP(2, 4, 3, 4, 4, 4, 4, 3, 4),
+			     GROUP(-2, 4, 3, 4, 4, 4, 4, 3, 4),
 			     GROUP(
-		/* IP10_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP10_31_30 [2] RESERVED */
 		/* IP10_29_26 [4] */
 		FN_SD2_CD, FN_MMC0_D4, FN_TS_SDAT0_B, FN_USB2_EXTP, FN_GLO_I0,
 		FN_VI0_DATA6_VI0_B6_B, FN_HCTS0_N_D, FN_TS_SDAT1_B,
@@ -5558,10 +5550,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_TS_SCK1_B, FN_GLO_I1_B, FN_VI3_DATA7_B, 0, 0, 0, 0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR12", 0xE6060050, 32,
-			     GROUP(1, 3, 3, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2),
+			     GROUP(-1, 3, 3, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2),
 			     GROUP(
-		/* IP12_31 [1] */
-		0, 0,
+		/* IP12_31 [1] RESERVED */
 		/* IP12_30_28 [3] */
 		FN_SSI_WS5, FN_SCIFB1_RXD, FN_IECLK_B,
 		FN_DU2_EXVSYNC_DU2_VSYNC, FN_QSTB_QHE,
@@ -5598,10 +5589,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SSI_WS0129, FN_CAN0_TX_B, FN_MOUT1, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR13", 0xE6060054, 32,
-			     GROUP(1, 2, 3, 3, 4, 3, 3, 3, 3, 4, 3),
+			     GROUP(-1, 2, 3, 3, 4, 3, 3, 3, 3, 4, 3),
 			     GROUP(
-		/* IP13_31 [1] */
-		0, 0,
+		/* IP13_31 [1] RESERVED */
 		/* IP13_30_29 [2] */
 		FN_AUDIO_CLKA, FN_SCIFB2_RTS_N, FN_CAN_DEBUGOUT14, 0,
 		/* IP13_28_26 [3] */
@@ -5635,10 +5625,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_LCDOUT2, FN_CAN_DEBUGOUT5, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR14", 0xE6060058, 32,
-			     GROUP(1, 3, 3, 3, 3, 3, 4, 3, 3, 3, 3),
+			     GROUP(-1, 3, 3, 3, 3, 3, 4, 3, 3, 3, 3),
 			     GROUP(
-		/* IP14_30 [1] */
-		0, 0,
+		/* IP14_30 [1] RESERVED */
 		/* IP14_30_28 [3] */
 		FN_SCIFA1_RTS_N, FN_AD_NCS_N, FN_RTS1_N,
 		FN_MSIOF3_TXD, FN_DU1_DOTCLKOUT, FN_QSTVB_QVE,
@@ -5674,10 +5663,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_REMOCON, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR15", 0xE606005C, 32,
-			     GROUP(2, 2, 2, 3, 3, 2, 2, 2, 2, 3, 3, 3, 3),
+			     GROUP(-2, 2, 2, 3, 3, 2, 2, 2, 2, 3, 3, 3, 3),
 			     GROUP(
-		/* IP15_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP15_31_30 [2] RESERVED */
 		/* IP15_29_28 [2] */
 		FN_MSIOF0_TXD, FN_ADICHS1, FN_DU2_DG6, FN_LCDOUT14,
 		/* IP15_27_26 [2] */
@@ -5710,26 +5698,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_LCDOUT15, FN_SCIF_CLK_B, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR16", 0xE6060160, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 1, 1, 3, 3),
+			     GROUP(-24, 1, 1, 3, 3),
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
-		/* IP16_11_8 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP16_31_8 [24] RESERVED */
 		/* IP16_7 [1] */
 		FN_USB1_OVC, FN_TCLK1_B,
 		/* IP16_6 [1] */
@@ -5743,7 +5714,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL", 0xE6060090, 32,
 			     GROUP(3, 2, 2, 3, 2, 1, 1, 1, 2, 1, 2, 1,
-				   1, 1, 1, 2, 1, 1, 2, 1, 1),
+				   1, 1, 1, 2, -1, 1, 2, 1, 1),
 			     GROUP(
 		/* SEL_SCIF1 [3] */
 		FN_SEL_SCIF1_0, FN_SEL_SCIF1_1, FN_SEL_SCIF1_2, FN_SEL_SCIF1_3,
@@ -5782,7 +5753,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_TSIF1 [2] */
 		FN_SEL_TSIF1_0, FN_SEL_TSIF1_1, FN_SEL_TSIF1_2, 0,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_LBS [1] */
 		FN_SEL_LBS_0, FN_SEL_LBS_1,
 		/* SEL_TSIF0 [2] */
@@ -5793,11 +5763,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_SOF0_0, FN_SEL_SOF0_1, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xE6060094, 32,
-			     GROUP(3, 1, 1, 1, 2, 1, 2, 1, 2, 1, 1, 1,
-				   3, 3, 2, 3, 2, 2),
+			     GROUP(-3, 1, 1, 1, 2, 1, 2, 1, -2, 1, 1, 1,
+				   3, 3, 2, -3, 2, 2),
 			     GROUP(
 		/* RESERVED [3] */
-		0, 0, 0, 0, 0, 0, 0, 0,
 		/* SEL_TMU1 [1] */
 		FN_SEL_TMU1_0, FN_SEL_TMU1_1,
 		/* SEL_HSCIF1 [1] */
@@ -5813,7 +5782,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_CAN1 [1] */
 		FN_SEL_CAN1_0, FN_SEL_CAN1_1,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* SEL_SCIF2 [1] */
 		FN_SEL_SCIF2_0, FN_SEL_SCIF2_1,
 		/* SEL_ADI [1] */
@@ -5829,36 +5797,22 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_GPS [2] */
 		FN_SEL_GPS_0, FN_SEL_GPS_1, FN_SEL_GPS_2, 0,
 		/* RESERVED [3] */
-		0, 0, 0, 0, 0, 0, 0, 0,
 		/* SEL_SIM [2] */
 		FN_SEL_SIM_0, FN_SEL_SIM_1, FN_SEL_SIM_2, 0,
 		/* SEL_SSI8 [2] */
 		FN_SEL_SSI8_0, FN_SEL_SSI8_1, FN_SEL_SSI8_2, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL3", 0xE6060098, 32,
-			     GROUP(1, 1, 2, 4, 4, 2, 2, 4, 2, 3, 2, 3, 2),
+			     GROUP(1, 1, -12, 2, -6, 3, 2, 3, 2),
 			     GROUP(
 		/* SEL_IICDVFS [1] */
 		FN_SEL_IICDVFS_0, FN_SEL_IICDVFS_1,
 		/* SEL_IIC0 [1] */
 		FN_SEL_IIC0_0, FN_SEL_IIC0_1,
-		/* RESERVED [2] */
-		0, 0, 0, 0,
-		/* RESERVED [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED [2] */
-		0, 0, 0, 0,
+		/* RESERVED [12] */
 		/* SEL_IEB [2] */
 		FN_SEL_IEB_0, FN_SEL_IEB_1, FN_SEL_IEB_2, 0,
-		/* RESERVED [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED [2] */
-		0, 0, 0, 0,
+		/* RESERVED [6] */
 		/* SEL_IIC2 [3] */
 		FN_SEL_IIC2_0, FN_SEL_IIC2_1, FN_SEL_IIC2_2, FN_SEL_IIC2_3,
 		FN_SEL_IIC2_4, 0, 0, 0,
-- 
2.25.1

