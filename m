Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23924FFC92
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237333AbiDMR1J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237335AbiDMR05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:57 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B0D205DA
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by laurent.telenet-ops.be with bizsmtp
        id JHQH2700a2t8Arn01HQHgM; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj3-000Ts1-5G; Wed, 13 Apr 2022 19:24:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfXf-BB; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 39/50] pinctrl: renesas: sh7264: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:01 +0200
Message-Id: <434c274f626b2eab3539fe2ab80c6eda164e07fa.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 572 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7264.c | 104 +++++++++++++--------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7264.c b/drivers/pinctrl/renesas/pfc-sh7264.c
index 7476b982101d6518..30096925a70c5d88 100644
--- a/drivers/pinctrl/renesas/pfc-sh7264.c
+++ b/drivers/pinctrl/renesas/pfc-sh7264.c
@@ -1464,19 +1464,20 @@ static const struct pinmux_func pinmux_func_gpios[] = {
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-	{ PINMUX_CFG_REG("PAIOR0", 0xfffe3812, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PAIOR0", 0xfffe3812, 16,
+			     GROUP(-12, 1, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [12] */
 		PA3_IN, PA3_OUT,
 		PA2_IN, PA2_OUT,
 		PA1_IN, PA1_OUT,
 		PA0_IN,	PA0_OUT ))
 	},
 
-	{ PINMUX_CFG_REG("PBCR5", 0xfffe3824, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PBCR5", 0xfffe3824, 16,
+			     GROUP(-4, 4, 4, 4),
+			     GROUP(
+		/* RESERVED [4] */
 		PB22MD_00, PB22MD_01, PB22MD_10, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 		PB21MD_0, PB21MD_1, 0, 0, 0, 0, 0, 0,
@@ -1525,21 +1526,22 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, PB4MD_01, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PBCR0", 0xfffe382e, 16, 4, GROUP(
+	{ PINMUX_CFG_REG_VAR("PBCR0", 0xfffe382e, 16,
+			     GROUP(4, 4, 4, -4),
+			     GROUP(
 		0, PB3MD_1, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 		0, PB2MD_1, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 		0, PB1MD_1, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0 ))
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
@@ -1568,9 +1570,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0 ))
 	},
 
-	{ PINMUX_CFG_REG("PCCR2", 0xfffe384a, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PCCR2", 0xfffe384a, 16,
+			     GROUP(-4, 4, 4, 4),
+			     GROUP(
+		/* RESERVED [4] */
 		PC10MD_0, PC10MD_1, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 		PC9MD_0, PC9MD_1, 0, 0, 0, 0, 0, 0,
@@ -1599,8 +1602,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
 
-	{ PINMUX_CFG_REG("PCIOR0", 0xfffe3852, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PCIOR0", 0xfffe3852, 16,
+			     GROUP(-5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [5] */
 		PC10_IN, PC10_OUT,
 		PC9_IN, PC9_OUT,
 		PC8_IN, PC8_OUT,
@@ -1675,11 +1680,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PD0_IN, PD0_OUT ))
 	},
 
-	{ PINMUX_CFG_REG("PECR1", 0xfffe388c, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PECR1", 0xfffe388c, 16,
+			     GROUP(-8, 4, 4),
+			     GROUP(
+		/* RESERVED [8] */
 		PE5MD_00, PE5MD_01, 0, PE5MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 		PE4MD_00, PE4MD_01, 0, PE4MD_11, 0, 0, 0, 0,
@@ -1698,10 +1702,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
 
-	{ PINMUX_CFG_REG("PEIOR0", 0xfffe3892, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PEIOR0", 0xfffe3892, 16,
+			     GROUP(-10, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [10] */
 		PE5_IN, PE5_OUT,
 		PE4_IN, PE4_OUT,
 		PE3_IN, PE3_OUT,
@@ -1710,10 +1714,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PE0_IN, PE0_OUT ))
 	},
 
-	{ PINMUX_CFG_REG("PFCR3", 0xfffe38a8, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PFCR3", 0xfffe38a8, 16,
+			     GROUP(-12, 4),
+			     GROUP(
+		/* RESERVED [12] */
 		PF12MD_000, PF12MD_001, 0, PF12MD_011,
 		PF12MD_100, PF12MD_101, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
@@ -1780,25 +1784,19 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PF0_IN, PF0_OUT ))
 	},
 
-	{ PINMUX_CFG_REG("PGCR7", 0xfffe38c0, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PGCR7", 0xfffe38c0, 16,
+			     GROUP(-12, 4),
+			     GROUP(
+		/* RESERVED [12] */
 		PG0MD_000, PG0MD_001, PG0MD_010, PG0MD_011,
 		PG0MD_100, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
 
-	{ PINMUX_CFG_REG("PGCR6", 0xfffe38c2, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PGCR6", 0xfffe38c2, 16,
+			     GROUP(-12, 4),
+			     GROUP(
+		/* RESERVED [12] */
 		PG24MD_00, PG24MD_01, PG24MD_10, PG24MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
@@ -1869,19 +1867,21 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PG4MD_00, PG4MD_01, PG4MD_10, PG4MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PGCR0", 0xfffe38ce, 16, 4, GROUP(
+	{ PINMUX_CFG_REG_VAR("PGCR0", 0xfffe38ce, 16,
+			     GROUP(4, 4, 4, -4),
+			     GROUP(
 		PG3MD_00, PG3MD_01, PG3MD_10, PG3MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 		PG2MD_00, PG2MD_01, PG2MD_10, PG2MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
 		PG1MD_00, PG1MD_01, PG1MD_10, PG1MD_11, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0 ))
+		/* RESERVED [4] */ ))
 	},
-	{ PINMUX_CFG_REG("PGIOR1", 0xfffe38d0, 16, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PGIOR1", 0xfffe38d0, 16,
+			     GROUP(-7, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [7] */
 		PG24_IN, PG24_OUT,
 		PG23_IN, PG23_OUT,
 		PG22_IN, PG22_OUT,
-- 
2.25.1

