Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D3D4FFC84
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237328AbiDMR1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237307AbiDMR04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:56 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DE521825
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by laurent.telenet-ops.be with bizsmtp
        id JHQH270062t8Arn01HQHg1; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000TsD-Ko; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfY6-CI; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 40/50] pinctrl: renesas: sh7269: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:02 +0200
Message-Id: <feb1e865c2b6abbc0db24243143ea09ad143f6df.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 406 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7269.c | 82 +++++++++++++++-------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7269.c b/drivers/pinctrl/renesas/pfc-sh7269.c
index 733a2c114ca26ea0..f59f558d75ae253e 100644
--- a/drivers/pinctrl/renesas/pfc-sh7269.c
+++ b/drivers/pinctrl/renesas/pfc-sh7269.c
@@ -1966,15 +1966,18 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	 * mode registers and modes are described in assending order [0..15]
 	 */
 
-	{ PINMUX_CFG_REG("PAIOR0", 0xfffe3812, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, PA1_IN, PA1_OUT,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, PA0_IN, PA0_OUT ))
+	{ PINMUX_CFG_REG_VAR("PAIOR0", 0xfffe3812, 16,
+			     GROUP(-7, 1, -7, 1),
+			     GROUP(
+		/* RESERVED [7] */
+		PA1_IN, PA1_OUT,
+		/* RESERVED [7] */
+		PA0_IN, PA0_OUT ))
 	},
-	{ PINMUX_CFG_REG("PBCR5", 0xfffe3824, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
+	{ PINMUX_CFG_REG_VAR("PBCR5", 0xfffe3824, 16,
+			     GROUP(-4, 4, 4, 4),
+			     GROUP(
+		/* RESERVED [4] */
 		PB22MD_000, PB22MD_001, PB22MD_010, PB22MD_011,
 		PB22MD_100, PB22MD_101, PB22MD_110, PB22MD_111,
 		0, 0, 0, 0, 0, 0, 0, 0,
@@ -2045,7 +2048,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PB4MD_00, PB4MD_01, PB4MD_10, PB4MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PBCR0", 0xfffe382e, 16, 4, GROUP(
+	{ PINMUX_CFG_REG_VAR("PBCR0", 0xfffe382e, 16,
+			     GROUP(4, 4, 4, -4),
+			     GROUP(
 		PB3MD_00, PB3MD_01, PB3MD_10, PB3MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 
@@ -2055,13 +2060,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PB1MD_00, PB1MD_01, PB1MD_10, PB1MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ))
+		/* RESERVED [4] */ ))
 	},
 
-	{ PINMUX_CFG_REG("PBIOR1", 0xfffe3830, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("PBIOR1", 0xfffe3830, 16,
+			     GROUP(-9, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [9] */
 		PB22_IN, PB22_OUT,
 		PB21_IN, PB21_OUT,
 		PB20_IN, PB20_OUT,
@@ -2089,13 +2094,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0 ))
 	},
 
-	{ PINMUX_CFG_REG("PCCR2", 0xfffe384a, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
+	{ PINMUX_CFG_REG_VAR("PCCR2", 0xfffe384a, 16,
+			     GROUP(-12, 4),
+			     GROUP(
+		/* RESERVED [12] */
 		PC8MD_000, PC8MD_001, PC8MD_010, PC8MD_011,
 		PC8MD_100, PC8MD_101, PC8MD_110, PC8MD_111,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
@@ -2130,8 +2132,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
 
-	{ PINMUX_CFG_REG("PCIOR0", 0xfffe3852, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PCIOR0", 0xfffe3852, 16,
+			     GROUP(-7, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [7] */
 		PC8_IN, PC8_OUT,
 		PC7_IN, PC7_OUT,
 		PC6_IN, PC6_OUT,
@@ -2244,9 +2248,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PE0MD_00, PE0MD_01, PE0MD_10, PE0MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PEIOR0", 0xfffe3892, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PEIOR0", 0xfffe3892, 16,
+			     GROUP(-8, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [8] */
 		PE7_IN, PE7_OUT,
 		PE6_IN, PE6_OUT,
 		PE5_IN, PE5_OUT,
@@ -2291,20 +2296,18 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PF16MD_100, PF16MD_101, PF16MD_110, PF16MD_111,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PFCR4", 0xfffe38a6, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
+	{ PINMUX_CFG_REG_VAR("PFCR4", 0xfffe38a6, 16,
+			     GROUP(-12, 4),
+			     GROUP(
+		/* RESERVED [12] */
 		PF15MD_000, PF15MD_001, PF15MD_010, PF15MD_011,
 		PF15MD_100, PF15MD_101, PF15MD_110, PF15MD_111,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PFCR3", 0xfffe38a8, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
+	{ PINMUX_CFG_REG_VAR("PFCR3", 0xfffe38a8, 16,
+			     GROUP(-4, 4, 4, 4),
+			     GROUP(
+		/* RESERVED [4] */
 		PF14MD_000, PF14MD_001, PF14MD_010, PF14MD_011,
 		PF14MD_100, PF14MD_101, PF14MD_110, PF14MD_111,
 		0, 0, 0, 0, 0, 0, 0, 0,
@@ -2369,9 +2372,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
 
-	{ PINMUX_CFG_REG("PFIOR1", 0xfffe38b0, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PFIOR1", 0xfffe38b0, 16,
+			     GROUP(-8, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [8] */
 		PF23_IN, PF23_OUT,
 		PF22_IN, PF22_OUT,
 		PF21_IN, PF21_OUT,
-- 
2.25.1

