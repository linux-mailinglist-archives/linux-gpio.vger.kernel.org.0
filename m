Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 998A94FFCC8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235765AbiDMRdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237366AbiDMRdr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:33:47 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643E46C4A5
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:31:23 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4KdqFr21bRz4xGbf
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG2700F2t8Arn01HQGXY; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqJ-FT; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfSp-Aa; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/50] pinctrl: renesas: r8a7794: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:33 +0200
Message-Id: <2fa43bd38c5cf260e89ae1da38d1a217ab762589.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the full descriptions of reserved register fields by shorthands
with a negative field width, and merge adjacent reserved fields.

This reduces kernel size by 201 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7794.c | 97 ++++++---------------------
 1 file changed, 21 insertions(+), 76 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index d1b0e651738249ca..668643553a70a71a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -4867,7 +4867,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR0", 0xE6060020, 32,
 			     GROUP(2, 2, 2, 1, 1, 2, 2, 2, 1, 1, 1, 1,
-				   1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1),
+				   1, 1, 1, 1, 2, -7, 1),
 			     GROUP(
 		/* IP0_31_30 [2] */
 		FN_D5, FN_SCIF4_RXD_B, FN_I2C0_SCL_D, 0,
@@ -4903,25 +4903,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_MMC_CLK, FN_SD2_CLK,
 		/* IP0_9_8 [2] */
 		FN_SD1_WP, FN_IRQ7, FN_CAN0_TX, 0,
-		/* IP0_7 [1] */
-		0, 0,
-		/* IP0_6 [1] */
-		0, 0,
-		/* IP0_5 [1] */
-		0, 0,
-		/* IP0_4 [1] */
-		0, 0,
-		/* IP0_3 [1] */
-		0, 0,
-		/* IP0_2 [1] */
-		0, 0,
-		/* IP0_1 [1] */
-		0, 0,
+		/* IP0_7_1 [7] RESERVED */
 		/* IP0_0 [1] */
 		FN_SD1_CD, FN_CAN0_RX, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR1", 0xE6060024, 32,
-			     GROUP(2, 2, 1, 1, 1, 1, 2, 2, 2, 3, 2, 2,
+			     GROUP(2, 2, 1, 1, -1, 1, 2, 2, 2, 3, 2, 2,
 				   3, 2, 2, 2, 2),
 			     GROUP(
 		/* IP1_31_30 [2] */
@@ -4932,8 +4919,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_A4, FN_SCIFB0_TXD,
 		/* IP1_26 [1] */
 		FN_A3, FN_SCIFB0_SCK,
-		/* IP1_25 [1] */
-		0, 0,
+		/* IP1_25 [1] RESERVED */
 		/* IP1_24 [1] */
 		FN_A1, FN_SCIFB1_TXD,
 		/* IP1_23_22 [2] */
@@ -5160,12 +5146,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DU0_EXVSYNC_DU0_VSYNC, FN_QSTB_QHE, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR7", 0xE606003C, 32,
-			     GROUP(1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
+			     GROUP(1, -1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
 			     GROUP(
 		/* IP7_31 [1] */
 		FN_DREQ0_N, FN_SCIFB1_RXD,
-		/* IP7_30 [1] */
-		0, 0,
+		/* IP7_30 [1] RESERVED */
 		/* IP7_29_27 [3] */
 		FN_ETH_TXD0, FN_VI0_R2, FN_SCIF3_RXD_B, FN_I2C4_SCL_E,
 		FN_AVB_GTX_CLK, FN_SSI_WS6_B, 0, 0,
@@ -5234,10 +5219,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_AVB_MDC, FN_SSI_SDATA6_B, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR9", 0xE6060044, 32,
-			     GROUP(1, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3),
+			     GROUP(-1, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3),
 			     GROUP(
-		/* IP9_31 [1] */
-		0, 0,
+		/* IP9_31 [1] RESERVED */
 		/* IP9_30_28 [3] */
 		FN_SCIF1_SCK, FN_PWM3, FN_TCLK2, FN_DU1_DG5,
 		FN_SSI_SDATA1_B, 0, 0, 0,
@@ -5307,10 +5291,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR11", 0xE606004C, 32,
-			     GROUP(2, 3, 3, 3, 3, 2, 2, 3, 3, 2, 3, 3),
+			     GROUP(-2, 3, 3, 3, 3, 2, 2, 3, 3, 2, 3, 3),
 			     GROUP(
-		/* IP11_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP11_31_30 [2] RESERVED */
 		/* IP11_29_27 [3] */
 		FN_SSI_SDATA0, FN_MSIOF1_SCK_B, FN_PWM0_B, FN_ADICLK_B,
 		0, 0, 0, 0,
@@ -5343,10 +5326,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR12", 0xE6060050, 32,
-			     GROUP(2, 3, 3, 3, 3, 3, 2, 2, 2, 3, 3, 3),
+			     GROUP(-2, 3, 3, 3, 3, 3, 2, 2, 2, 3, 3, 3),
 			     GROUP(
-		/* IP12_31_30 [2] */
-		0, 0, 0, 0,
+		/* IP12_31_30 [2] RESERVED */
 		/* IP12_29_27 [3] */
 		FN_SSI_SCK2, FN_HSCIF1_HTX_B, FN_VI1_DATA2, 0,
 		FN_ATAG0_N, FN_ETH_RXD1_B, 0, 0,
@@ -5379,18 +5361,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, FN_DREQ1_N_B, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR13", 0xE6060054, 32,
-			     GROUP(1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3),
+			     GROUP(-5, 3, 3, 3, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-		/* IP13_31 [1] */
-		0, 0,
-		/* IP13_30 [1] */
-		0, 0,
-		/* IP13_29 [1] */
-		0, 0,
-		/* IP13_28 [1] */
-		0, 0,
-		/* IP13_27 [1] */
-		0, 0,
+		/* IP13_31_27 [5] RESERVED */
 		/* IP13_26_24 [3] */
 		FN_AUDIO_CLKOUT, FN_I2C4_SDA_B, FN_SCIFA5_TXD_D, FN_VI1_VSYNC_N,
 		FN_TS_SPSYNC_C, 0, FN_FMIN_E, 0,
@@ -5420,23 +5393,21 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, FN_ATACS00_N, FN_ETH_LINK_B, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL", 0xE6060090, 32,
-			     GROUP(2, 1, 2, 3, 4, 1, 1, 3, 3, 3, 3, 3, 2, 1),
+			     GROUP(2, -1, 2, 3, -4, 1, -1,
+				   3, 3, 3, 3, 3, 2, -1),
 			     GROUP(
 		/* SEL_ADG [2] */
 		FN_SEL_ADG_0, FN_SEL_ADG_1, FN_SEL_ADG_2, FN_SEL_ADG_3,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_CAN [2] */
 		FN_SEL_CAN_0, FN_SEL_CAN_1, FN_SEL_CAN_2, FN_SEL_CAN_3,
 		/* SEL_DARC [3] */
 		FN_SEL_DARC_0, FN_SEL_DARC_1, FN_SEL_DARC_2, FN_SEL_DARC_3,
 		FN_SEL_DARC_4, 0, 0, 0,
 		/* RESERVED [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
 		/* SEL_ETH [1] */
 		FN_SEL_ETH_0, FN_SEL_ETH_1,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_IC200 [3] */
 		FN_SEL_I2C00_0, FN_SEL_I2C00_1, FN_SEL_I2C00_2, FN_SEL_I2C00_3,
 		FN_SEL_I2C00_4, 0, 0, 0,
@@ -5454,12 +5425,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_I2C04_4, 0, 0, 0,
 		/* SEL_I2C05 [2] */
 		FN_SEL_I2C05_0, FN_SEL_I2C05_1, FN_SEL_I2C05_2, FN_SEL_I2C05_3,
-		/* RESERVED [1] */
-		0, 0, ))
+		/* RESERVED [1] */ ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xE6060094, 32,
 			     GROUP(2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1,
-				   2, 2, 1, 1, 2, 2, 2, 1, 1, 2),
+				   2, 2, -1, 1, 2, 2, 2, 1, 1, -2),
 			     GROUP(
 		/* SEL_IEB [2] */
 		FN_SEL_IEB_0, FN_SEL_IEB_1, FN_SEL_IEB_2, 0,
@@ -5493,7 +5463,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_SCIFA5_0, FN_SEL_SCIFA5_1, FN_SEL_SCIFA5_2,
 		FN_SEL_SCIFA5_3,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_TMU [1] */
 		FN_SEL_TMU_0, FN_SEL_TMU_1,
 		/* SEL_TSIF0 [2] */
@@ -5506,12 +5475,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_HSCIF0_0, FN_SEL_HSCIF0_1,
 		/* SEL_HSCIF1 [1] */
 		FN_SEL_HSCIF1_0, FN_SEL_HSCIF1_1,
-		/* RESERVED [2] */
-		0, 0, 0, 0, ))
+		/* RESERVED [2] */ ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL3", 0xE6060098, 32,
 			     GROUP(2, 2, 2, 1, 3, 2, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+				   1, 1, -12),
 			     GROUP(
 		/* SEL_SCIF0 [2] */
 		FN_SEL_SCIF0_0, FN_SEL_SCIF0_1, FN_SEL_SCIF0_2, FN_SEL_SCIF0_3,
@@ -5542,30 +5510,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_SSI8_0, FN_SEL_SSI8_1,
 		/* SEL_SSI9 [1] */
 		FN_SEL_SSI9_0, FN_SEL_SSI9_1,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0, ))
+		/* RESERVED [12] */ ))
 	},
 	{ },
 };
-- 
2.25.1

