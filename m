Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7F14FFC4D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbiDMR0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235737AbiDMR0m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:42 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7C52EA
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JHQF2700F2t8Arn01HQFPY; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-000TqI-RT; Wed, 13 Apr 2022 19:24:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfSi-8z; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/50] pinctrl: renesas: r8a7792: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:32 +0200
Message-Id: <d39a52cf972a450ef5a0989ba7e448115a8147ba.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 784 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7792.c | 90 +++++----------------------
 1 file changed, 16 insertions(+), 74 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
index 3e101f63014825fe..282ff1dd58a7493e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7792.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7792.c
@@ -2374,15 +2374,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_11_0_FN, FN_IP7_1_0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR0", 0xE6060040, 32,
-			     GROUP(4, 4,
+			     GROUP(-8,
 				   1, 1, 1, 1, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
-		/* IP0_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP0_27_24 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP0_31_24 [8] RESERVED */
 		/* IP0_23 [1] */
 		FN_DU0_DB7_C5, 0,
 		/* IP0_22 [1] */
@@ -2433,17 +2430,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DU0_DR0_DATA0, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR1", 0xE6060044, 32,
-			     GROUP(4, 4,
-				   1, 1, 1, 1, 1, 1, 1, 1,
+			     GROUP(-9, 1, 1, 1, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
-		/* IP1_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP1_27_24 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP1_23 [1] */
-		0, 0,
+		/* IP1_31_23 [9] RESERVED */
 		/* IP1_22 [1] */
 		FN_A25, FN_SSL,
 		/* IP1_21 [1] */
@@ -2492,19 +2483,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DU0_EXHSYNC_DU0_HSYNC, 0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR2", 0xE6060048, 32,
-			     GROUP(4, 4,
-				   4, 3, 1,
+			     GROUP(-15, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
-		/* IP2_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP2_27_24 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP2_23_20 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP2_19_17 [3] */
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP2_31_17 [15] RESERVED */
 		/* IP2_16 [1] */
 		FN_VI2_FIELD, FN_AVB_TXD2,
 		/* IP2_15 [1] */
@@ -2541,21 +2524,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI2_CLK, FN_AVB_RX_CLK ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR3", 0xE606004C, 32,
-			     GROUP(4, 4,
-				   4, 4,
-				   1, 1, 1, 1, 1, 1, 1, 1,
+			     GROUP(-17, 1, 1, 1, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
-		/* IP3_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP3_27_24 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP3_23_20 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP3_19_16 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP3_15 [1] */
-		0, 0,
+		/* IP3_31_15 [17] RESERVED */
 		/* IP3_14 [1] */
 		FN_VI3_D11_Y3, FN_AVB_AVTP_MATCH,
 		/* IP3_13 [1] */
@@ -2588,14 +2560,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI3_CLK, FN_AVB_TX_CLK ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR4", 0xE6060050, 32,
-			     GROUP(4, 3, 1,
-				   1, 1, 1, 2, 2, 2,
+			     GROUP(-7, 1, 1, 1, 1, 2, 2, 2,
 				   2, 2, 2, 2, 2, 1, 2, 1, 1),
 			     GROUP(
-		/* IP4_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP4_27_25 [3] */
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP4_31_25 [7] RESERVED */
 		/* IP4_24 [1] */
 		FN_VI4_FIELD, FN_VI3_D15_Y7,
 		/* IP4_23 [1] */
@@ -2630,21 +2598,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI4_CLKENB, FN_VI0_D12_G4_Y4 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR5", 0xE6060054, 32,
-			     GROUP(4, 4,
-				   4, 4,
-				   4, 1, 1, 1, 1,
+			     GROUP(-20, 1, 1, 1, 1,
 				   1, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
-		/* IP5_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP5_27_24 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP5_23_20 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP5_19_16 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP5_15_12 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP5_31_12 [20] RESERVED */
 		/* IP5_11 [1] */
 		FN_VI5_D8_Y0, FN_VI1_D23_R7,
 		/* IP5_10 [1] */
@@ -2671,19 +2628,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI5_CLKENB, FN_VI1_D12_G4_Y4_B ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR6", 0xE6060058, 32,
-			     GROUP(4, 4,
-				   4, 1, 2, 1,
-				   2, 2, 2, 2,
+			     GROUP(-13, 2, 1, 2, 2, 2, 2,
 				   1, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
-		/* IP6_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP6_27_24 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP6_23_20 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP6_19 [1] */
-		0, 0,
+		/* IP6_31_19 [13] RESERVED */
 		/* IP6_18_17 [2] */
 		FN_DREQ1_N, FN_RX3, 0, 0,
 		/* IP6_16 [1] */
@@ -2714,17 +2662,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_MSIOF0_SCK, FN_HSCK0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR7", 0xE606005C, 32,
-			     GROUP(4, 4,
-				   3, 1, 1, 1, 1, 1,
+			     GROUP(-11, 1, 1, 1, 1, 1,
 				   2, 2, 2, 2,
 				   1, 1, 2, 2, 2),
 			     GROUP(
-		/* IP7_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP7_27_24 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP7_23_21 [3] */
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP7_31_21 [11] RESERVED */
 		/* IP7_20 [1] */
 		FN_AUDIO_CLKB, 0,
 		/* IP7_19 [1] */
-- 
2.25.1

