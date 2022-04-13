Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBEF4FFC76
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237312AbiDMR05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237305AbiDMR0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:45 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8250E2BDA
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG270022t8Arn01HQGXP; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000Tq7-FQ; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfUt-TL; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 27/50] pinctrl: renesas: r8a7792: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:49 +0200
Message-Id: <0f211d493a0cfbcd96d84a709d21bea51c7385ae.1649865241.git.geert+renesas@glider.be>
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

Describe registers with fixed-width register fields and many reserved
fields using the PINMUX_CFG_REG_VAR() macro, as the latter supports a
shorthand not requiring dummy values.

This reduces kernel size by 257 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7792.c | 141 +++++++-------------------
 1 file changed, 35 insertions(+), 106 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
index 282ff1dd58a7493e..808a85d62415399f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7792.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7792.c
@@ -1999,16 +1999,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_0_1_FN, FN_IP0_1,
 		GP_0_0_FN, FN_IP0_0 ))
 	},
-	{ PINMUX_CFG_REG("GPSR1", 0xE6060008, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR1", 0xE6060008, 32,
+			     GROUP(-9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP1_31_23 RESERVED */
 		GP_1_22_FN, FN_DU1_CDE,
 		GP_1_21_FN, FN_DU1_DISP,
 		GP_1_20_FN, FN_DU1_EXODDF_DU1_ODDF_DISP_CDE,
@@ -2101,22 +2096,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_3_1_FN, FN_A17,
 		GP_3_0_FN, FN_A16 ))
 	},
-	{ PINMUX_CFG_REG("GPSR4", 0xE6060014, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR4", 0xE6060014, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP4_31_17 RESERVED */
 		GP_4_16_FN, FN_VI0_FIELD,
 		GP_4_15_FN, FN_VI0_D11_G3_Y3,
 		GP_4_14_FN, FN_VI0_D10_G2_Y2,
@@ -2135,22 +2119,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_4_1_FN, FN_VI0_CLKENB,
 		GP_4_0_FN, FN_VI0_CLK ))
 	},
-	{ PINMUX_CFG_REG("GPSR5", 0xE6060018, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR5", 0xE6060018, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP5_31_17 RESERVED */
 		GP_5_16_FN, FN_VI1_FIELD,
 		GP_5_15_FN, FN_VI1_D11_G3_Y3,
 		GP_5_14_FN, FN_VI1_D10_G2_Y2,
@@ -2169,22 +2142,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_5_1_FN, FN_VI1_CLKENB,
 		GP_5_0_FN, FN_VI1_CLK ))
 	},
-	{ PINMUX_CFG_REG("GPSR6", 0xE606001C, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR6", 0xE606001C, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP6_31_17 RESERVED */
 		GP_6_16_FN, FN_IP2_16,
 		GP_6_15_FN, FN_IP2_15,
 		GP_6_14_FN, FN_IP2_14,
@@ -2203,22 +2165,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_6_1_FN, FN_IP2_1,
 		GP_6_0_FN, FN_IP2_0 ))
 	},
-	{ PINMUX_CFG_REG("GPSR7", 0xE6060020, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR7", 0xE6060020, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP7_31_17 RESERVED */
 		GP_7_16_FN, FN_VI3_FIELD,
 		GP_7_15_FN, FN_IP3_14,
 		GP_7_14_FN, FN_VI3_D10_Y2,
@@ -2237,22 +2188,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_7_1_FN, FN_IP3_1,
 		GP_7_0_FN, FN_IP3_0 ))
 	},
-	{ PINMUX_CFG_REG("GPSR8", 0xE6060024, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR8", 0xE6060024, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP8_31_17 RESERVED */
 		GP_8_16_FN, FN_IP4_24,
 		GP_8_15_FN, FN_IP4_23,
 		GP_8_14_FN, FN_IP4_22,
@@ -2271,22 +2211,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_8_1_FN, FN_IP4_0,
 		GP_8_0_FN, FN_VI4_CLK ))
 	},
-	{ PINMUX_CFG_REG("GPSR9", 0xE6060028, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR9", 0xE6060028, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP9_31_17 RESERVED */
 		GP_9_16_FN, FN_VI5_FIELD,
 		GP_9_15_FN, FN_VI5_D11_Y3,
 		GP_9_14_FN, FN_VI5_D10_Y2,
-- 
2.25.1

