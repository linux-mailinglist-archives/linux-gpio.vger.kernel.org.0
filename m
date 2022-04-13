Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58D564FFC60
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237319AbiDMR0v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237288AbiDMR0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:44 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEF3B3F
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JHQF2700g2t8Arn01HQFtD; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqD-BV; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfSG-56; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/50] pinctrl: renesas: r8a7778: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:28 +0200
Message-Id: <1af5225c81ac871a461f7d824619275e2e0ed8df.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 142 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7778.c | 98 +++++++--------------------
 1 file changed, 24 insertions(+), 74 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index a24672ca3c01babe..35bdb9af81607566 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -2240,11 +2240,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	},
 
 	{ PINMUX_CFG_REG_VAR("IPSR0", 0xfffc0020, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+			     GROUP(-1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 3, 4, 3, 3, 2),
 			     GROUP(
-		/* IP0_31 [1] */
-		0,	0,
+		/* IP0_31 [1] RESERVED */
 		/* IP0_30 [1] */
 		FN_A19,	0,
 		/* IP0_29 [1] */
@@ -2296,13 +2295,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR1", 0xfffc0024, 32,
-			     GROUP(1, 1, 2, 3, 1, 3, 3, 1, 2, 4, 3, 3,
+			     GROUP(-2, 2, 3, 1, 3, 3, 1, 2, 4, 3, 3,
 				   3, 1, 1),
 			     GROUP(
-		/* IP1_31 [1] */
-		0,	0,
-		/* IP1_30 [1] */
-		0,	0,
+		/* IP1_31_30 [2] RESERVED */
 		/* IP1_29_28 [2] */
 		FN_EX_CS1,	FN_MMC_D4,	0,	0,
 		/* IP1_27_25 [3] */
@@ -2437,11 +2433,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR4", 0xfffc0030, 32,
-			     GROUP(1, 2, 2, 2, 4, 4, 2, 2, 2, 2, 1, 1,
+			     GROUP(-1, 2, 2, 2, 4, 4, 2, 2, 2, 2, 1, 1,
 				   3, 3, 1),
 			     GROUP(
-		/* IP4_31 [1] */
-		0,	0,
+		/* IP4_31 [1] RESERVED */
 		/* IP4_30_29 [2] */
 		FN_VI0_R4_B,	FN_DU0_DB4,	FN_LCDOUT20,	0,
 		/* IP4_28_27 [2] */
@@ -2481,12 +2476,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR5", 0xfffc0034, 32,
-			     GROUP(1, 2, 3, 3, 2, 3, 3, 2, 1, 2, 2, 1,
+			     GROUP(-1, 2, 3, 3, 2, 3, 3, 2, 1, 2, 2, 1,
 				   1, 2, 2, 2),
 			     GROUP(
 
-		/* IP5_31 [1] */
-		0, 0,
+		/* IP5_31 [1] RESERVED */
 		/* IP5_30_29 [2] */
 		FN_SSI_SDATA7,	FN_HSPI_TX0_B,	FN_RX2_A,	FN_CAN0_RX_B,
 		/* IP5_28_26 [3] */
@@ -2619,12 +2613,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR8", 0xfffc0040, 32,
-			     GROUP(1, 1, 3, 3, 2, 3, 3, 2, 3, 2, 3, 3, 3),
+			     GROUP(-2, 3, 3, 2, 3, 3, 2, 3, 2, 3, 3, 3),
 			     GROUP(
-		/* IP8_31 [1] */
-		0, 0,
-		/* IP8_30 [1] */
-		0, 0,
+		/* IP8_31_30 [2] RESERVED */
 		/* IP8_29_27 [3] */
 		FN_VI0_G3,	FN_SD2_CMD_B,	FN_VI1_DATA5,	FN_DU1_DR5,
 		0,		FN_HRX1_B,	0,		0,
@@ -2660,12 +2651,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR9", 0xfffc0044, 32,
-			     GROUP(1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
+			     GROUP(-2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-		/* IP9_31 [1] */
-		0, 0,
-		/* IP9_30 [1] */
-		0, 0,
+		/* IP9_31_30 [2] RESERVED */
 		/* IP9_29_27 [3] */
 		FN_VI1_DATA11_A,	FN_DU1_EXHSYNC_DU1_HSYNC,
 		FN_ETH_RXD1,		FN_FMIN_C,
@@ -2703,24 +2691,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR10", 0xfffc0048, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 4,
-				   3, 3, 3),
+			     GROUP(-7, 3, 3, 3, 3, 4, 3, 3, 3),
 			     GROUP(
 
-		/* IP10_31 [1] */
-		0, 0,
-		/* IP10_30 [1] */
-		0, 0,
-		/* IP10_29 [1] */
-		0, 0,
-		/* IP10_28 [1] */
-		0, 0,
-		/* IP10_27 [1] */
-		0, 0,
-		/* IP10_26 [1] */
-		0, 0,
-		/* IP10_25 [1] */
-		0, 0,
+		/* IP10_31_25 [7] RESERVED */
 		/* IP10_24_22 [3] */
 		FN_SD2_WP_A,	FN_VI1_DATA15,	FN_EX_WAIT2_B,	FN_DACK0_B,
 		FN_HSPI_TX2_B,	FN_CAN_CLK_C,	0,		0,
@@ -2754,12 +2728,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL0", 0xfffc0050, 32,
-			     GROUP(1, 1, 2, 2, 3, 2, 2, 1, 1, 1, 1, 2,
-				   1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(-1, 1, 2, 2, 3, 2, 2, -1, 1, 1, 1, 2,
+				   -1, 1, 1, 1, 2, 1, -1, 1, 1, 1, 1, 1),
 			     GROUP(
 
-		/* SEL 31  [1] */
-		0, 0,
+		/* SEL 31  [1] RESERVED */
 		/* SEL_30 (SCIF5) [1] */
 		FN_SEL_SCIF5_A,		FN_SEL_SCIF5_B,
 		/* SEL_29_28 (SCIF4) [2] */
@@ -2779,8 +2752,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_20_19 (SCIF0) [2] */
 		FN_SEL_SCIF0_A,		FN_SEL_SCIF0_B,
 		FN_SEL_SCIF0_C,		FN_SEL_SCIF0_D,
-		/* SEL_18 [1] */
-		0, 0,
+		/* SEL_18 [1] RESERVED */
 		/* SEL_17 (SSI2) [1] */
 		FN_SEL_SSI2_A,		FN_SEL_SSI2_B,
 		/* SEL_16 (SSI1) [1] */
@@ -2790,8 +2762,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_14_13 (VI0) [2] */
 		FN_SEL_VI0_A,		FN_SEL_VI0_B,
 		FN_SEL_VI0_C,		FN_SEL_VI0_D,
-		/* SEL_12 [1] */
-		0, 0,
+		/* SEL_12 [1] RESERVED */
 		/* SEL_11 (SD2) [1] */
 		FN_SEL_SD2_A,		FN_SEL_SD2_B,
 		/* SEL_10 (SD1) [1] */
@@ -2803,8 +2774,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_IRQ2_C,		0,
 		/* SEL_6 (IRQ1) [1] */
 		FN_SEL_IRQ1_A,		FN_SEL_IRQ1_B,
-		/* SEL_5 [1] */
-		0, 0,
+		/* SEL_5 [1] RESERVED */
 		/* SEL_4 (DREQ2) [1] */
 		FN_SEL_DREQ2_A,		FN_SEL_DREQ2_B,
 		/* SEL_3 (DREQ1) [1] */
@@ -2818,18 +2788,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xfffc0054, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 2, 2, 1),
+			     GROUP(-4, 1, 1, 2, 1, 1, -7,
+				   2, 2, 2, 1, 1, 1, 1, 2, 2, 1),
 			     GROUP(
 
-		/* SEL_31 [1] */
-		0, 0,
-		/* SEL_30 [1] */
-		0, 0,
-		/* SEL_29 [1] */
-		0, 0,
-		/* SEL_28 [1] */
-		0, 0,
+		/* SEL_31_28 [4] RESERVED */
 		/* SEL_27 (CAN1) [1] */
 		FN_SEL_CAN1_A,		FN_SEL_CAN1_B,
 		/* SEL_26 (CAN0) [1] */
@@ -2841,20 +2804,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_HSCIF1_A,	FN_SEL_HSCIF1_B,
 		/* SEL_22 (HSCIF0) [1] */
 		FN_SEL_HSCIF0_A,	FN_SEL_HSCIF0_B,
-		/* SEL_21 [1] */
-		0, 0,
-		/* SEL_20 [1] */
-		0, 0,
-		/* SEL_19 [1] */
-		0, 0,
-		/* SEL_18 [1] */
-		0, 0,
-		/* SEL_17 [1] */
-		0, 0,
-		/* SEL_16 [1] */
-		0, 0,
-		/* SEL_15 [1] */
-		0, 0,
+		/* SEL_21_15 [7] RESERVED */
 		/* SEL_14_13 (REMOCON) [2] */
 		FN_SEL_REMOCON_A,	FN_SEL_REMOCON_B,
 		FN_SEL_REMOCON_C,	0,
-- 
2.25.1

