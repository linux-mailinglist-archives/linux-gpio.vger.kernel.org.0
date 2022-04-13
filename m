Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529AC4FFC79
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237317AbiDMR1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237295AbiDMR0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:47 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979DF17ABE
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by michel.telenet-ops.be with bizsmtp
        id JHQH270032t8Arn06HQHDm; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000Tt8-M5; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfbA-Mr; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 47/50] pinctrl: renesas: sh7757: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:09 +0200
Message-Id: <05c69ca8710134bb96ec8f7d18bafe42418f3510.1649865241.git.geert+renesas@glider.be>
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

Describe registers with fixed-width register fields and many reserved
fields using the PINMUX_CFG_REG_VAR() macro, as the latter supports a
shorthand not requiring dummy values.

This reduces kernel size by 115 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7757.c | 95 +++++++++++-----------------
 1 file changed, 38 insertions(+), 57 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7757.c b/drivers/pinctrl/renesas/pfc-sh7757.c
index 79cf7c42c35d87dd..0d7857d7efefb47b 100644
--- a/drivers/pinctrl/renesas/pfc-sh7757.c
+++ b/drivers/pinctrl/renesas/pfc-sh7757.c
@@ -1963,43 +1963,35 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0,
 		0, 0, ))
 	},
-	{ PINMUX_CFG_REG("PSEL1", 0xffec0072, 16, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("PSEL1", 0xffec0072, 16,
+			     GROUP(-5, 1, 1, 1, -5, 1, -2),
+			     GROUP(
+		/* RESERVED [5] */
 		PS1_10_FN1, PS1_10_FN2,
 		PS1_9_FN1, PS1_9_FN2,
 		PS1_8_FN1, PS1_8_FN2,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+		/* RESERVED [5] */
 		PS1_2_FN1, PS1_2_FN2,
-		0, 0,
-		0, 0, ))
+		/* RESERVED [2] */ ))
 	},
-	{ PINMUX_CFG_REG("PSEL2", 0xffec0074, 16, 1, GROUP(
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("PSEL2", 0xffec0074, 16,
+			     GROUP(-2, 1, 1, -4, 1, 1, 1, 1, -1, 1, -2),
+			     GROUP(
+		/* RESERVED [2] */
 		PS2_13_FN1, PS2_13_FN2,
 		PS2_12_FN1, PS2_12_FN2,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+		/* RESERVED [4] */
 		PS2_7_FN1, PS2_7_FN2,
 		PS2_6_FN1, PS2_6_FN2,
 		PS2_5_FN1, PS2_5_FN2,
 		PS2_4_FN1, PS2_4_FN2,
-		0, 0,
+		/* RESERVED [1] */
 		PS2_2_FN1, PS2_2_FN2,
-		0, 0,
-		0, 0, ))
+		/* RESERVED [2] */ ))
 	},
-	{ PINMUX_CFG_REG("PSEL3", 0xffec0076, 16, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSEL3", 0xffec0076, 16,
+			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, -4, 1, 1, -1),
+			     GROUP(
 		PS3_15_FN1, PS3_15_FN2,
 		PS3_14_FN1, PS3_14_FN2,
 		PS3_13_FN1, PS3_13_FN2,
@@ -2009,38 +2001,35 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PS3_9_FN1, PS3_9_FN2,
 		PS3_8_FN1, PS3_8_FN2,
 		PS3_7_FN1, PS3_7_FN2,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+		/* RESERVED [4] */
 		PS3_2_FN1, PS3_2_FN2,
 		PS3_1_FN1, PS3_1_FN2,
-		0, 0, ))
+		/* RESERVED [1] */ ))
 	},
 
-	{ PINMUX_CFG_REG("PSEL4", 0xffec0078, 16, 1, GROUP(
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("PSEL4", 0xffec0078, 16,
+			     GROUP(-1, 1, 1, 1, -1, 1, 1, 1, -3, 1, 1, 1,
+				   1, 1),
+			     GROUP(
+		/* RESERVED [1] */
 		PS4_14_FN1, PS4_14_FN2,
 		PS4_13_FN1, PS4_13_FN2,
 		PS4_12_FN1, PS4_12_FN2,
-		0, 0,
+		/* RESERVED [1] */
 		PS4_10_FN1, PS4_10_FN2,
 		PS4_9_FN1, PS4_9_FN2,
 		PS4_8_FN1, PS4_8_FN2,
-		0, 0,
-		0, 0,
-		0, 0,
+		/* RESERVED [3] */
 		PS4_4_FN1, PS4_4_FN2,
 		PS4_3_FN1, PS4_3_FN2,
 		PS4_2_FN1, PS4_2_FN2,
 		PS4_1_FN1, PS4_1_FN2,
 		PS4_0_FN1, PS4_0_FN2, ))
 	},
-	{ PINMUX_CFG_REG("PSEL5", 0xffec007a, 16, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("PSEL5", 0xffec007a, 16,
+			     GROUP(-4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -2),
+			     GROUP(
+		/* RESERVED [4] */
 		PS5_11_FN1, PS5_11_FN2,
 		PS5_10_FN1, PS5_10_FN2,
 		PS5_9_FN1, PS5_9_FN2,
@@ -2051,8 +2040,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PS5_4_FN1, PS5_4_FN2,
 		PS5_3_FN1, PS5_3_FN2,
 		PS5_2_FN1, PS5_2_FN2,
-		0, 0,
-		0, 0, ))
+		/* RESERVED [2] */ ))
 	},
 	{ PINMUX_CFG_REG("PSEL6", 0xffec007c, 16, 1, GROUP(
 		PS6_15_FN1, PS6_15_FN2,
@@ -2072,7 +2060,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PS6_1_FN1, PS6_1_FN2,
 		PS6_0_FN1, PS6_0_FN2, ))
 	},
-	{ PINMUX_CFG_REG("PSEL7", 0xffec0082, 16, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSEL7", 0xffec0082, 16,
+			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -5),
+			     GROUP(
 		PS7_15_FN1, PS7_15_FN2,
 		PS7_14_FN1, PS7_14_FN2,
 		PS7_13_FN1, PS7_13_FN2,
@@ -2084,13 +2074,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PS7_7_FN1, PS7_7_FN2,
 		PS7_6_FN1, PS7_6_FN2,
 		PS7_5_FN1, PS7_5_FN2,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0, ))
+		/* RESERVED [5] */ ))
 	},
-	{ PINMUX_CFG_REG("PSEL8", 0xffec0084, 16, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSEL8", 0xffec0084, 16,
+			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, -8),
+			     GROUP(
 		PS8_15_FN1, PS8_15_FN2,
 		PS8_14_FN1, PS8_14_FN2,
 		PS8_13_FN1, PS8_13_FN2,
@@ -2099,14 +2087,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PS8_10_FN1, PS8_10_FN2,
 		PS8_9_FN1, PS8_9_FN2,
 		PS8_8_FN1, PS8_8_FN2,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0, ))
+		/* RESERVED [8] */ ))
 	},
 	{}
 };
-- 
2.25.1

