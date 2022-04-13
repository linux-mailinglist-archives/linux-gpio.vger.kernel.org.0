Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F17B4FFC88
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237307AbiDMR1I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237301AbiDMR04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:56 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947E021820
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by michel.telenet-ops.be with bizsmtp
        id JHQH270082t8Arn06HQHDn; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000TsY-Rn; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfZn-Hf; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 44/50] pinctrl: renesas: sh7723: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:06 +0200
Message-Id: <5d7ef2fa02c2137d2d243fc183d18220c9aaf7b8.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 105 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7723.c | 70 ++++++++++++++++------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7723.c b/drivers/pinctrl/renesas/pfc-sh7723.c
index 94c7acf591d68a29..95344281966e6eb0 100644
--- a/drivers/pinctrl/renesas/pfc-sh7723.c
+++ b/drivers/pinctrl/renesas/pfc-sh7723.c
@@ -1546,9 +1546,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTD1_FN, PTD1_OUT, 0, PTD1_IN,
 		PTD0_FN, PTD0_OUT, 0, PTD0_IN ))
 	},
-	{ PINMUX_CFG_REG("PECR", 0xa4050108, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PECR", 0xa4050108, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [4] */
 		PTE5_FN, PTE5_OUT, 0, PTE5_IN,
 		PTE4_FN, PTE4_OUT, 0, PTE4_IN,
 		PTE3_FN, PTE3_OUT, 0, PTE3_IN,
@@ -1566,9 +1567,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTF1_FN, PTF1_OUT, 0, PTF1_IN,
 		PTF0_FN, PTF0_OUT, 0, PTF0_IN ))
 	},
-	{ PINMUX_CFG_REG("PGCR", 0xa405010c, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PGCR", 0xa405010c, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [4] */
 		PTG5_FN, PTG5_OUT, 0, 0,
 		PTG4_FN, PTG4_OUT, 0, 0,
 		PTG3_FN, PTG3_OUT, 0, 0,
@@ -1586,11 +1588,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTH1_FN, PTH1_OUT, 0, PTH1_IN,
 		PTH0_FN, PTH0_OUT, 0, PTH0_IN ))
 	},
-	{ PINMUX_CFG_REG("PJCR", 0xa4050110, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PJCR", 0xa4050110, 16,
+			     GROUP(2, -2, 2, -2, 2, 2, 2, 2),
+			     GROUP(
 		PTJ7_FN, PTJ7_OUT, 0, 0,
-		0, 0, 0, 0,
+		/* RESERVED [2] */
 		PTJ5_FN, PTJ5_OUT, 0, 0,
-		0, 0, 0, 0,
+		/* RESERVED [2] */
 		PTJ3_FN, PTJ3_OUT, 0, PTJ3_IN,
 		PTJ2_FN, PTJ2_OUT, 0, PTJ2_IN,
 		PTJ1_FN, PTJ1_OUT, 0, PTJ1_IN,
@@ -1636,11 +1640,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTN1_FN, PTN1_OUT, 0, PTN1_IN,
 		PTN0_FN, PTN0_OUT, 0, PTN0_IN ))
 	},
-	{ PINMUX_CFG_REG("PQCR", 0xa405011a, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PQCR", 0xa405011a, 16,
+			     GROUP(-8, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [8] */
 		PTQ3_FN, 0, 0, PTQ3_IN,
 		PTQ2_FN, 0, 0, PTQ2_IN,
 		PTQ1_FN, 0, 0, PTQ1_IN,
@@ -1666,9 +1669,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTS1_FN, PTS1_OUT, 0, PTS1_IN,
 		PTS0_FN, PTS0_OUT, 0, PTS0_IN ))
 	},
-	{ PINMUX_CFG_REG("PTCR", 0xa4050140, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PTCR", 0xa4050140, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [4] */
 		PTT5_FN, PTT5_OUT, 0, PTT5_IN,
 		PTT4_FN, PTT4_OUT, 0, PTT4_IN,
 		PTT3_FN, PTT3_OUT, 0, PTT3_IN,
@@ -1676,9 +1680,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTT1_FN, PTT1_OUT, 0, PTT1_IN,
 		PTT0_FN, PTT0_OUT, 0, PTT0_IN ))
 	},
-	{ PINMUX_CFG_REG("PUCR", 0xa4050142, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PUCR", 0xa4050142, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [4] */
 		PTU5_FN, PTU5_OUT, 0, PTU5_IN,
 		PTU4_FN, PTU4_OUT, 0, PTU4_IN,
 		PTU3_FN, PTU3_OUT, 0, PTU3_IN,
@@ -1736,35 +1741,38 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTZ1_FN, PTZ1_OUT, 0, PTZ1_IN,
 		PTZ0_FN, PTZ0_OUT, 0, PTZ0_IN ))
 	},
-	{ PINMUX_CFG_REG("PSELA", 0xa405014e, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSELA", 0xa405014e, 16,
+			     GROUP(2, 2, 2, -4, 2, 2, -2),
+			     GROUP(
 		PSA15_PSA14_FN1, PSA15_PSA14_FN2, 0, 0,
 		PSA13_PSA12_FN1, PSA13_PSA12_FN2, 0, 0,
 		PSA11_PSA10_FN1, PSA11_PSA10_FN2, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+		/* RESERVED [4] */
 		PSA5_PSA4_FN1, PSA5_PSA4_FN2, PSA5_PSA4_FN3, 0,
 		PSA3_PSA2_FN1, PSA3_PSA2_FN2, 0, 0,
-		0, 0, 0, 0 ))
+		/* RESERVED [2] */ ))
 	},
-	{ PINMUX_CFG_REG("PSELB", 0xa4050150, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSELB", 0xa4050150, 16,
+			     GROUP(2, 2, -2, 2, 2, 2, 2, -2),
+			     GROUP(
 		PSB15_PSB14_FN1, PSB15_PSB14_FN2, 0, 0,
 		PSB13_PSB12_LCDC_RGB, PSB13_PSB12_LCDC_SYS, 0, 0,
-		0, 0, 0, 0,
+		/* RESERVED [2] */
 		PSB9_PSB8_FN1, PSB9_PSB8_FN2, PSB9_PSB8_FN3, 0,
 		PSB7_PSB6_FN1, PSB7_PSB6_FN2, 0, 0,
 		PSB5_PSB4_FN1, PSB5_PSB4_FN2, 0, 0,
 		PSB3_PSB2_FN1, PSB3_PSB2_FN2, 0, 0,
-		0, 0, 0, 0 ))
+		/* RESERVED [2] */ ))
 	},
-	{ PINMUX_CFG_REG("PSELC", 0xa4050152, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSELC", 0xa4050152, 16,
+			     GROUP(2, 2, 2, 2, 2, -6),
+			     GROUP(
 		PSC15_PSC14_FN1, PSC15_PSC14_FN2, 0, 0,
 		PSC13_PSC12_FN1, PSC13_PSC12_FN2, 0, 0,
 		PSC11_PSC10_FN1, PSC11_PSC10_FN2, PSC11_PSC10_FN3, 0,
 		PSC9_PSC8_FN1, PSC9_PSC8_FN2, 0, 0,
 		PSC7_PSC6_FN1, PSC7_PSC6_FN2, PSC7_PSC6_FN3, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0 ))
+		/* RESERVED [3] */ ))
 	},
 	{ PINMUX_CFG_REG("PSELD", 0xa4050154, 16, 2, GROUP(
 		PSD15_PSD14_FN1, PSD15_PSD14_FN2, 0, 0,
-- 
2.25.1

