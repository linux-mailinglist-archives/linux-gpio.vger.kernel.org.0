Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7AA4FFC75
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237290AbiDMR1A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237317AbiDMR0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:47 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976052667
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JHQG2700P2t8Arn01HQGQC; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000Tqf-08; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfU8-Nq; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 22/50] pinctrl: renesas: sh7734: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:44 +0200
Message-Id: <3ab96d28494b8c5a2d427ba25f31a04ca0cc7305.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 174 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7734.c | 94 +++++++---------------------
 1 file changed, 22 insertions(+), 72 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7734.c b/drivers/pinctrl/renesas/pfc-sh7734.c
index a4e02fc7ea34f1f5..54f60b37c211e039 100644
--- a/drivers/pinctrl/renesas/pfc-sh7734.c
+++ b/drivers/pinctrl/renesas/pfc-sh7734.c
@@ -1895,10 +1895,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_A16, FN_ST0_PWM, FN_LCD_DON_A, FN_TIOC4A_C ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR2", 0xFFFC0024, 32,
-			     GROUP(1, 3, 3, 2, 3, 3, 3, 3, 3, 3, 2, 3),
+			     GROUP(-1, 3, 3, 2, 3, 3, 3, 3, 3, 3, 2, 3),
 			     GROUP(
-		/* IP2_31 [1] */
-		0, 0,
+		/* IP2_31 [1] RESERVED */
 		/* IP2_30_28 [3] */
 		FN_D14, FN_TX2_B, 0, FN_FSE_A,
 			FN_ET0_TX_CLK_B, 0, 0, 0,
@@ -1932,10 +1931,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			FN_FD4_A, 0, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR3", 0xFFFC0028, 32,
-			     GROUP(2, 3, 3, 3, 1, 2, 3, 3, 3, 3, 3, 1, 2),
+			     GROUP(-2, 3, 3, 3, 1, 2, 3, 3, 3, 3, 3, 1, 2),
 			     GROUP(
-	    /* IP3_31_30 [2] */
-		0, 0, 0, 0,
+	    /* IP3_31_30 [2] RESERVED */
 	    /* IP3_29_27 [3] */
 		FN_DRACK0, FN_SD1_DAT2_A, FN_ATAG, FN_TCLK1_A,
 		FN_ET0_ETXD7, 0, 0, 0,
@@ -2006,19 +2004,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			FN_ET0_ERXD7, 0, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR5", 0xFFFC0030, 32,
-			     GROUP(1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3,
-				   3, 3, 3),
+			     GROUP(-5, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-	    /* IP5_31 [1] */
-	    0, 0,
-	    /* IP5_30 [1] */
-	    0, 0,
-	    /* IP5_29 [1] */
-	    0, 0,
-	    /* IP5_28 [1] */
-	    0, 0,
-	    /* IP5_27 [1] */
-	    0, 0,
+	    /* IP5_31_27 [5] RESERVED */
 	    /* IP5_26_25 [2] */
 		FN_REF50CK, FN_CTS1_E, FN_HCTS0_D, 0,
 	    /* IP5_24_23 [2] */
@@ -2048,25 +2036,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_ET0_RX_CLK_B, 0, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR6", 0xFFFC0034, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 2, 2,
-				   2, 2, 2, 2, 3, 3),
+			     GROUP(-8, 3, 3, 2, 2, 2, 2, 2, 2, 3, 3),
 			     GROUP(
-	    /* IP5_31 [1] */
-	    0, 0,
-	    /* IP6_30 [1] */
-	    0, 0,
-	    /* IP6_29 [1] */
-	    0, 0,
-	    /* IP6_28 [1] */
-	    0, 0,
-	    /* IP6_27 [1] */
-	    0, 0,
-	    /* IP6_26 [1] */
-	    0, 0,
-	    /* IP6_25 [1] */
-	    0, 0,
-	    /* IP6_24 [1] */
-	    0, 0,
+	    /* IP5_31_24 [8] RESERVED */
 	    /* IP6_23_21 [3] */
 		FN_DU0_DG1, FN_CTS1_C, FN_HRTS0_D, FN_TIOC1B_A,
 		FN_HIFD09, 0, 0, 0,
@@ -2093,10 +2065,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_TCLKA_A, FN_HIFD00, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR7", 0xFFFC0038, 32,
-			     GROUP(1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3),
+			     GROUP(-1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3),
 			     GROUP(
-	    /* IP7_31 [1] */
-	    0, 0,
+	    /* IP7_31 [1] RESERVED */
 	    /* IP7_30_29 [2] */
 		FN_DU0_DB4, 0, FN_HIFINT, 0,
 	    /* IP7_28_27 [2] */
@@ -2130,11 +2101,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_HIFD10, 0, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR8", 0xFFFC003C, 32,
-			     GROUP(2, 2, 2, 3, 3, 2, 2, 2, 2, 2, 2, 2,
+			     GROUP(-2, 2, 2, 3, 3, 2, 2, 2, 2, 2, 2, 2,
 				   2, 2, 2),
 			     GROUP(
-	    /* IP9_31_30 [2] */
-	    0, 0, 0, 0,
+	    /* IP9_31_30 [2] RESERVED */
 	    /* IP8_29_28 [2] */
 		FN_IRQ3_A, FN_RTS0_A, FN_HRTS0_B, FN_ET0_ERXD3_A,
 	    /* IP8_27_26 [2] */
@@ -2168,11 +2138,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DU0_DB5, 0, FN_HIFDREQ, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR9", 0xFFFC0040, 32,
-			     GROUP(2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			     GROUP(-2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
 				   2, 2, 2, 2),
 			     GROUP(
-	    /* IP9_31_30 [2] */
-	    0, 0, 0, 0,
+	    /* IP9_31_30 [2] RESERVED */
 	    /* IP9_29_28 [2] */
 		FN_SSI_SDATA1_A, FN_VI1_3_B, FN_LCD_DATA14_B, 0,
 	    /* IP9_27_26 [2] */
@@ -2205,10 +2174,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI1_CLK_A, 0, FN_FD0_B, FN_LCD_DATA0_B ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR10", 0xFFFC0044, 32,
-			     GROUP(2, 2, 2, 1, 2, 1, 3, 3, 1, 3, 3, 3, 3, 3),
+			     GROUP(-2, 2, 2, 1, 2, 1, 3, 3, 1, 3, 3, 3, 3, 3),
 			     GROUP(
-	    /* IP9_31_30 [2] */
-	    0, 0, 0, 0,
+	    /* IP9_31_30 [2] RESERVED */
 	    /* IP10_29_28 [2] */
 		FN_CAN1_TX_A, FN_TX5_C, FN_MLB_DAT, 0,
 	    /* IP10_27_26 [2] */
@@ -2244,11 +2212,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_LCD_DATA15_B, 0, 0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR11", 0xFFFC0048, 32,
-			     GROUP(3, 1, 2, 3, 2, 2, 3, 3, 1, 2, 3, 3,
+			     GROUP(-3, 1, 2, 3, 2, 2, 3, 3, 1, 2, 3, 3,
 				   1, 1, 1, 1),
 			     GROUP(
-	    /* IP11_31_29 [3] */
-	    0, 0, 0, 0, 0, 0, 0, 0,
+	    /* IP11_31_29 [3] RESERVED */
 	    /* IP11_28 [1] */
 		FN_PRESETOUT, FN_ST_CLKOUT,
 	    /* IP11_27_26 [2] */
@@ -2286,11 +2253,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SCL1, FN_SCIF_CLK_C ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xFFFC004C, 32,
-			     GROUP(3, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2,
+			     GROUP(-3, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2,
 				   2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
-		/* SEL1_31_29 [3] */
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* SEL1_31_29 [3] RESERVED */
 		/* SEL1_28 [1] */
 		FN_SEL_IEBUS_0, FN_SEL_IEBUS_1,
 		/* SEL1_27 [1] */
@@ -2343,25 +2309,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_INTC_0, FN_SEL_INTC_1 ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xFFFC0050, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
-				   2, 1, 2, 2, 3, 2, 3, 2, 2),
+			     GROUP(-8, 1, 1, 1, 2, 2, 1, 2, 2, 3, 2, 3, 2, 2),
 			     GROUP(
-		/* SEL2_31 [1] */
-		0, 0,
-		/* SEL2_30 [1] */
-		0, 0,
-		/* SEL2_29 [1] */
-		0, 0,
-		/* SEL2_28 [1] */
-		0, 0,
-		/* SEL2_27 [1] */
-		0, 0,
-		/* SEL2_26 [1] */
-		0, 0,
-		/* SEL2_25 [1] */
-		0, 0,
-		/* SEL2_24 [1] */
-		0, 0,
+		/* SEL2_31_24 [8] RESERVED */
 		/* SEL2_23 [1] */
 		FN_SEL_MTU2_CLK_0, FN_SEL_MTU2_CLK_1,
 		/* SEL2_22 [1] */
-- 
2.25.1

