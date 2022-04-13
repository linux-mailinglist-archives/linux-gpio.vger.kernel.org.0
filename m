Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101034FFC67
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbiDMR0y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236974AbiDMR0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:45 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F293B6
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JHQG270012t8Arn01HQGPz; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqE-Co; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfSN-6H; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/50] pinctrl: renesas: r8a7779: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:29 +0200
Message-Id: <4b468118e0da681c860ed750976a990a0930dcba.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 197 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7779.c | 71 +++++++++------------------
 1 file changed, 23 insertions(+), 48 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7779.c b/drivers/pinctrl/renesas/pfc-r8a7779.c
index 296b5fb0f3490255..e674549193250b3b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7779.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7779.c
@@ -3319,10 +3319,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	},
 
 	{ PINMUX_CFG_REG_VAR("IPSR0", 0xfffc0020, 32,
-			     GROUP(1, 3, 2, 1, 2, 4, 3, 2, 2, 2, 2, 2, 3, 3),
+			     GROUP(-1, 3, 2, 1, 2, 4, 3, 2, 2, 2, 2, 2, 3, 3),
 			     GROUP(
-		/* IP0_31 [1] */
-		0, 0,
+		/* IP0_31 [1] RESERVED */
 		/* IP0_30_28 [3] */
 		FN_RD_WR, FN_FWE, FN_ATAG0, FN_VI1_R7,
 		FN_HRTS1, FN_RX4_C, 0, 0,
@@ -3358,10 +3357,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SCIF_CLK, FN_TCLK0_C, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR1", 0xfffc0024, 32,
-			     GROUP(3, 4, 2, 2, 2, 4, 4, 4, 3, 2, 2),
+			     GROUP(-3, 4, 2, 2, 2, 4, 4, 4, 3, 2, 2),
 			     GROUP(
-		/* IP1_31_29 [3] */
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP1_31_29 [3] RESERVED */
 		/* IP1_28_25 [4] */
 		FN_HTX0, FN_TX1, FN_SDATA, FN_CTS0_C,
 		FN_SUB_TCK, FN_CC5_STATE2, FN_CC5_STATE10, FN_CC5_STATE18,
@@ -3397,10 +3395,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_EX_CS0, FN_RX3_C_IRDA_RX_C, FN_MMC0_D6, FN_FD6 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR2", 0xfffc0028, 32,
-			     GROUP(1, 3, 1, 1, 1, 1, 1, 1, 3, 3, 4, 4, 4, 4),
+			     GROUP(-1, 3, 1, 1, 1, 1, 1, 1, 3, 3, 4, 4, 4, 4),
 			     GROUP(
-		/* IP2_31 [1] */
-		0, 0,
+		/* IP2_31 [1] RESERVED */
 		/* IP2_30_28 [3] */
 		FN_DU0_DG0, FN_LCDOUT8, FN_DREQ1, FN_SCL2,
 		FN_AUDATA2, 0, 0, 0,
@@ -3545,11 +3542,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    FN_DU0_DISP, FN_QPOLA, FN_CAN_CLK_C, FN_SCK2_C ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR5", 0xfffc0034, 32,
-			     GROUP(1, 2, 1, 4, 3, 4, 2, 2, 2, 2, 1, 1,
+			     GROUP(-1, 2, 1, 4, 3, 4, 2, 2, 2, 2, 1, 1,
 				   1, 1, 1, 1, 3),
 			     GROUP(
-	    /* IP5_31 [1] */
-	    0, 0,
+	    /* IP5_31 [1] RESERVED */
 	    /* IP5_30_29 [2] */
 	    FN_AUDIO_CLKB, FN_USB_OVC2, FN_CAN_DEBUGOUT0, FN_MOUT0,
 	    /* IP5_28 [1] */
@@ -3592,15 +3588,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    FN_RX5, FN_RTS0_D_TANS_D, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR6", 0xfffc0038, 32,
-			     GROUP(1, 2, 2, 2, 2, 3, 2, 3, 3, 3, 1, 2,
+			     GROUP(-1, 2, -2, 2, 2, 3, 2, 3, 3, 3, 1, 2,
 				   2, 2, 2),
 			     GROUP(
-	    /* IP6_31 [1] */
-	    0, 0,
+	    /* IP6_31 [1] RESERVED */
 	    /* IP6_30_29 [2] */
 	    FN_SSI_SCK6, FN_ADICHS0, FN_CAN0_TX, FN_IERX_B,
-	    /* IP_28_27 [2] */
-	    0, 0, 0, 0,
+	    /* IP_28_27 [2] RESERVED */
 	    /* IP6_26_25 [2] */
 	    FN_SSI_SDATA5, FN_ADIDATA, FN_CAN_DEBUGOUT12, FN_RX3_IRDA_RX,
 	    /* IP6_24_23 [2] */
@@ -3631,11 +3625,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    FN_SSI_SCK0129, FN_CAN_DEBUGOUT1, FN_MOUT1, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR7", 0xfffc003c, 32,
-			     GROUP(1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3,
+			     GROUP(-1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3,
 				   3, 2, 2),
 			     GROUP(
-	    /* IP7_31 [1] */
-	    0, 0,
+	    /* IP7_31 [1] RESERVED */
 	    /* IP7_30_29 [2] */
 	    FN_SD0_WP, FN_DACK2, FN_CTS1_B, 0,
 	    /* IP7_28_27 [2] */
@@ -3669,10 +3662,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    FN_SSI_WS6, FN_ADICHS1, FN_CAN0_RX, FN_IETX_B ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR8", 0xfffc0040, 32,
-			     GROUP(1, 3, 3, 2, 2, 1, 1, 1, 2, 4, 4, 4, 4),
+			     GROUP(-1, 3, 3, 2, 2, 1, 1, 1, 2, 4, 4, 4, 4),
 			     GROUP(
-	    /* IP8_31 [1] */
-	    0, 0,
+	    /* IP8_31 [1] RESERVED */
 	    /* IP8_30_28 [3] */
 	    FN_VI0_VSYNC, FN_VI0_DATA1_B_VI0_B1_B, FN_RTS1_C_TANS_C, FN_RX4_D,
 	    FN_PWMFSW0_C, 0, 0, 0,
@@ -3713,11 +3705,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    0, 0, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR9", 0xfffc0044, 32,
-			     GROUP(2, 2, 2, 2, 2, 3, 3, 2, 2, 2, 2, 1,
+			     GROUP(-2, 2, 2, 2, 2, 3, 3, 2, 2, 2, 2, 1,
 				   1, 1, 1, 2, 2),
 			     GROUP(
-	    /* IP9_31_30 [2] */
-	    0, 0, 0, 0,
+	    /* IP9_31_30 [2] RESERVED */
 	    /* IP9_29_28 [2] */
 	    FN_VI0_G7, FN_ETH_RXD1, FN_SD2_DAT3_B, FN_ARM_TRACEDATA_9,
 	    /* IP9_27_26 [2] */
@@ -3790,10 +3781,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    FN_ARM_TRACEDATA_10, FN_DREQ0_C, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR11", 0xfffc004c, 32,
-			     GROUP(2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
+			     GROUP(-2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-	    /* IP11_31_30 [2] */
-	    0, 0, 0, 0,
+	    /* IP11_31_30 [2] RESERVED */
 	    /* IP11_29_27 [3] */
 	    FN_VI1_G1, FN_VI3_DATA1, FN_SSI_SCK1, FN_TS_SDEN1,
 	    FN_DACK2_B, FN_RX2, FN_HRTS0_B, 0,
@@ -3826,19 +3816,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    FN_ADICLK_B, 0, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR12", 0xfffc0050, 32,
-			     GROUP(4, 4, 4, 2, 3, 3, 3, 3, 3, 3),
+			     GROUP(-14, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-	    /* IP12_31_28 [4] */
-	    0, 0, 0, 0, 0, 0, 0, 0,
-	    0, 0, 0, 0, 0, 0, 0, 0,
-	    /* IP12_27_24 [4] */
-	    0, 0, 0, 0, 0, 0, 0, 0,
-	    0, 0, 0, 0, 0, 0, 0, 0,
-	    /* IP12_23_20 [4] */
-	    0, 0, 0, 0, 0, 0, 0, 0,
-	    0, 0, 0, 0, 0, 0, 0, 0,
-	    /* IP12_19_18 [2] */
-	    0, 0, 0, 0,
+	    /* IP12_31_18 [14] RESERVED */
 	    /* IP12_17_15 [3] */
 	    FN_VI1_G7, FN_VI3_DATA7, FN_GPS_MAG, FN_FCE,
 	    FN_SCK4_B, 0, 0, 0,
@@ -3904,7 +3884,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    FN_SEL_EXBUS0_0, FN_SEL_EXBUS0_1, FN_SEL_EXBUS0_2, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xfffc0094, 32,
-			     GROUP(2, 2, 2, 2, 1, 1, 1, 3, 1, 2, 2, 2,
+			     GROUP(2, 2, 2, 2, 1, 1, 1, 3, 1, -6,
 				   2, 1, 1, 2, 1, 2, 2),
 			     GROUP(
 	    /* SEL_TMU1 [2] */
@@ -3926,12 +3906,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    FN_SEL_PWMFSW_3, FN_SEL_PWMFSW_4, 0, 0, 0,
 	    /* SEL_ADI [1] */
 	    FN_SEL_ADI_0, FN_SEL_ADI_1,
-	    /* [2] */
-	    0, 0, 0, 0,
-	    /* [2] */
-	    0, 0, 0, 0,
-	    /* [2] */
-	    0, 0, 0, 0,
+	    /* [6] RESERVED */
 	    /* SEL_GPS [2] */
 	    FN_SEL_GPS_0, FN_SEL_GPS_1, FN_SEL_GPS_2, FN_SEL_GPS_3,
 	    /* SEL_SIM [1] */
-- 
2.25.1

