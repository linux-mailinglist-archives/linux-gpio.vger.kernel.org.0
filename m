Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C151B4FFC97
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237310AbiDMR1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237328AbiDMR0y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:54 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CBA1FA77
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JHQG2700W2t8Arn01HQGQH; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000TsV-Br; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfZR-Fc; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 43/50] pinctrl: renesas: sh7722: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:05 +0200
Message-Id: <c3965b6f9ea603b185924136f859c6eca7d5d6f4.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe registers with fixed-width register fields and many reserved
fields using the PINMUX_CFG_REG_VAR() macro, as the latter supports a
shorthand not requiring dummy values.

This reduces kernel size by 396 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7722.c | 202 +++++++++++----------------
 1 file changed, 80 insertions(+), 122 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7722.c b/drivers/pinctrl/renesas/pfc-sh7722.c
index 635e3dca27038890..4b82ac2c5e91d787 100644
--- a/drivers/pinctrl/renesas/pfc-sh7722.c
+++ b/drivers/pinctrl/renesas/pfc-sh7722.c
@@ -1255,14 +1255,16 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		HPD49, PTB1_OUT, 0, PTB1_IN,
 		HPD48, PTB0_OUT, 0, PTB0_IN ))
 	},
-	{ PINMUX_CFG_REG("PCCR", 0xa4050104, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PCCR", 0xa4050104, 16,
+			     GROUP(2, -2, 2, 2, 2, 2, -2, 2),
+			     GROUP(
 		0, 0, 0, PTC7_IN,
-		0, 0, 0, 0,
+		/* RESERVED [2] */
 		IOIS16, 0, 0, PTC5_IN,
 		HPDQM7, PTC4_OUT, 0, PTC4_IN,
 		HPDQM6, PTC3_OUT, 0, PTC3_IN,
 		HPDQM5, PTC2_OUT, 0, PTC2_IN,
-		0, 0, 0, 0,
+		/* RESERVED [2] */
 		HPDQM4, PTC0_OUT, 0, PTC0_IN ))
 	},
 	{ PINMUX_CFG_REG("PDCR", 0xa4050106, 16, 2, GROUP(
@@ -1275,13 +1277,14 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		SDHICMD, PTD1_OUT, 0, PTD1_IN,
 		SDHICLK, PTD0_OUT, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PECR", 0xa4050108, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PECR", 0xa4050108, 16,
+			     GROUP(2, 2, 2, 2, -4, 2, 2),
+			     GROUP(
 		A25, PTE7_OUT, 0, PTE7_IN,
 		A24, PTE6_OUT, 0, PTE6_IN,
 		A23, PTE5_OUT, 0, PTE5_IN,
 		A22, PTE4_OUT, 0, PTE4_IN,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+		/* RESERVED [4] */
 		IRQ5, PTE1_OUT, 0, PTE1_IN,
 		IRQ4_BS, PTE0_OUT, 0, PTE0_IN ))
 	},
@@ -1295,10 +1298,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		SIORXD_SIUBISLD, 0, 0, PTF1_IN,
 		SIOTXD_SIUBOSLD, PTF0_OUT, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PGCR", 0xa405010c, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PGCR", 0xa405010c, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		AUDSYNC, PTG4_OUT, 0, 0,
 		AUDATA3, PTG3_OUT, 0, 0,
 		AUDATA2, PTG2_OUT, 0, 0,
@@ -1315,13 +1318,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		LCDD17_DV_HSYNC, PTH1_OUT, 0, PTH1_IN,
 		LCDD16_DV_VSYNC, PTH0_OUT, 0, PTH0_IN ))
 	},
-	{ PINMUX_CFG_REG("PJCR", 0xa4050110, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PJCR", 0xa4050110, 16,
+			     GROUP(2, 2, 2, -6, 2, 2),
+			     GROUP(
 		STATUS0, PTJ7_OUT, 0, 0,
 		0, PTJ6_OUT, 0, 0,
 		PDSTATUS, PTJ5_OUT, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+		/* RESERVED [6] */
 		IRQ1, PTJ1_OUT, 0, PTJ1_IN,
 		IRQ0, PTJ0_OUT, 0, PTJ0_IN ))
 	},
@@ -1375,50 +1378,50 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTQ1, PTQ1_OUT, 0, 0,
 		PTQ0, PTQ0_OUT, 0, PTQ0_IN ))
 	},
-	{ PINMUX_CFG_REG("PRCR", 0xa405011c, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PRCR", 0xa405011c, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		LCDRD, PTR4_OUT, 0, 0,
 		CS6B_CE1B_LCDCS2, PTR3_OUT, 0, 0,
 		WAIT, 0, 0, PTR2_IN,
 		LCDDCK_LCDWR, PTR1_OUT, 0, 0,
 		LCDVEPWC_LCDVEPWC2, PTR0_OUT, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PSCR", 0xa405011e, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PSCR", 0xa405011e, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		SCIF0_CTS_SIUAISPD, 0, 0, PTS4_IN,
 		SCIF0_RTS_SIUAOSPD, PTS3_OUT, 0, 0,
 		SCIF0_SCK_TPUTO, PTS2_OUT, 0, PTS2_IN,
 		SCIF0_RXD, 0, 0, PTS1_IN,
 		SCIF0_TXD, PTS0_OUT, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PTCR", 0xa4050140, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PTCR", 0xa4050140, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		FOE_VIO_VD2, PTT4_OUT, 0, PTT4_IN,
 		FWE, PTT3_OUT, 0, PTT3_IN,
 		FSC, PTT2_OUT, 0, PTT2_IN,
 		DREQ0, 0, 0, PTT1_IN,
 		FCDE, PTT0_OUT, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("PUCR", 0xa4050142, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PUCR", 0xa4050142, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		NAF2_VIO_D10, PTU4_OUT, 0, PTU4_IN,
 		NAF1_VIO_D9, PTU3_OUT, 0, PTU3_IN,
 		NAF0_VIO_D8, PTU2_OUT, 0, PTU2_IN,
 		FRB_VIO_CLK2, 0, 0, PTU1_IN,
 		FCE_VIO_HD2, PTU0_OUT, 0, PTU0_IN ))
 	},
-	{ PINMUX_CFG_REG("PVCR", 0xa4050144, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PVCR", 0xa4050144, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		NAF7_VIO_D15, PTV4_OUT, 0, PTV4_IN,
 		NAF6_VIO_D14, PTV3_OUT, 0, PTV3_IN,
 		NAF5_VIO_D13, PTV2_OUT, 0, PTV2_IN,
@@ -1445,9 +1448,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		LCDD19_DV_CLKI, PTX1_OUT, 0, PTX1_IN,
 		LCDD18_DV_CLK, PTX0_OUT, 0, PTX0_IN ))
 	},
-	{ PINMUX_CFG_REG("PYCR", 0xa405014a, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PYCR", 0xa405014a, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [4] */
 		KEYOUT5_IN5, PTY5_OUT, 0, PTY5_IN,
 		KEYOUT4_IN6, PTY4_OUT, 0, PTY4_IN,
 		KEYOUT3, PTY3_OUT, 0, PTY3_IN,
@@ -1455,33 +1459,27 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		KEYOUT1, PTY1_OUT, 0, 0,
 		KEYOUT0, PTY0_OUT, 0, PTY0_IN ))
 	},
-	{ PINMUX_CFG_REG("PZCR", 0xa405014c, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PZCR", 0xa405014c, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, -2),
+			     GROUP(
+		/* RESERVED [4] */
 		KEYIN4_IRQ7, 0, 0, PTZ5_IN,
 		KEYIN3, 0, 0, PTZ4_IN,
 		KEYIN2, 0, 0, PTZ3_IN,
 		KEYIN1, 0, 0, PTZ2_IN,
 		KEYIN0_IRQ6, 0, 0, PTZ1_IN,
-		0, 0, 0, 0 ))
+		/* RESERVED [2] */ ))
 	},
-	{ PINMUX_CFG_REG("PSELA", 0xa405014e, 16, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSELA", 0xa405014e, 16,
+			     GROUP(1, 1, -4, 1, -4, 1, -4),
+			     GROUP(
 		PSA15_KEYIN0, PSA15_IRQ6,
 		PSA14_KEYIN4, PSA14_IRQ7,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+		/* RESERVED [4] */
 		PSA9_IRQ4, PSA9_BS,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+		/* RESERVED [4] */
 		PSA4_IRQ2, PSA4_SDHID2,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0 ))
+		/* RESERVED [4] */ ))
 	},
 	{ PINMUX_CFG_REG("PSELB", 0xa4050150, 16, 1, GROUP(
 		PSB15_SIOTXD, PSB15_SIUBOSLD,
@@ -1501,22 +1499,15 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PSB1_SIUMCKA, PSB1_SIOF1_MCK,
 		PSB0_SIUAOSLD, PSB0_SIOF1_TXD ))
 	},
-	{ PINMUX_CFG_REG("PSELC", 0xa4050152, 16, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSELC", 0xa4050152, 16,
+			     GROUP(1, 1, 1, 1, 1, -10, 1),
+			     GROUP(
 		PSC15_SIUAISLD, PSC15_SIOF1_RXD,
 		PSC14_SIUAOBT, PSC14_SIOF1_SCK,
 		PSC13_SIUAOLR, PSC13_SIOF1_SYNC,
 		PSC12_SIUAIBT, PSC12_SIOF1_SS1,
 		PSC11_SIUAILR, PSC11_SIOF1_SS2,
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
+		/* RESERVED [10] */
 		PSC0_NAF, PSC0_VIO ))
 	},
 	{ PINMUX_CFG_REG("PSELD", 0xa4050154, 16, 1, GROUP(
@@ -1537,61 +1528,45 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, 0,
 		PSD0_LCDD19_LCDD0, PSD0_DV ))
 	},
-	{ PINMUX_CFG_REG("PSELE", 0xa4050156, 16, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("PSELE", 0xa4050156, 16,
+			     GROUP(1, 1, 1, 1, 1, -7, 1, 1, 1, 1),
+			     GROUP(
 		PSE15_SIOF0_MCK_IRQ3, PSE15_SIM_D,
 		PSE14_SIOF0_TXD_IRDA_OUT, PSE14_SIM_CLK,
 		PSE13_SIOF0_RXD_IRDA_IN, PSE13_TS_SDAT,
 		PSE12_LCDVSYN2, PSE12_DACK,
 		PSE11_SIUMCKA_SIOF1_MCK, PSE11_SIUFCKA,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+		/* RESERVED [7] */
 		PSE3_FLCTL, PSE3_VIO,
 		PSE2_NAF2, PSE2_VIO_D10,
 		PSE1_NAF1, PSE1_VIO_D9,
 		PSE0_NAF0, PSE0_VIO_D8 ))
 	},
-	{ PINMUX_CFG_REG("HIZCRA", 0xa4050158, 16, 1, GROUP(
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("HIZCRA", 0xa4050158, 16,
+			     GROUP(-1, 1, -3, 1, 1, 1, 1, 1, -6),
+			     GROUP(
+		/* RESERVED [1] */
 		HIZA14_KEYSC, HIZA14_HIZ,
-		0, 0,
-		0, 0,
-		0, 0,
+		/* RESERVED [3] */
 		HIZA10_NAF, HIZA10_HIZ,
 		HIZA9_VIO, HIZA9_HIZ,
 		HIZA8_LCDC, HIZA8_HIZ,
 		HIZA7_LCDC, HIZA7_HIZ,
 		HIZA6_LCDC, HIZA6_HIZ,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0 ))
+		/* RESERVED [6] */ ))
 	},
-	{ PINMUX_CFG_REG("HIZCRB", 0xa405015a, 16, 1, GROUP(
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
+	{ PINMUX_CFG_REG_VAR("HIZCRB", 0xa405015a, 16,
+			     GROUP(-11, 1, -2, 1, 1),
+			     GROUP(
+		/* RESERVED [11] */
 		HIZB4_SIUA, HIZB4_HIZ,
-		0, 0,
-		0, 0,
+		/* RESERVED [2] */
 		HIZB1_VIO, HIZB1_HIZ,
 		HIZB0_VIO, HIZB0_HIZ ))
 	},
-	{ PINMUX_CFG_REG("HIZCRC", 0xa405015c, 16, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("HIZCRC", 0xa405015c, 16,
+			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, -8),
+			     GROUP(
 		HIZC15_IRQ7, HIZC15_HIZ,
 		HIZC14_IRQ6, HIZC14_HIZ,
 		HIZC13_IRQ5, HIZC13_HIZ,
@@ -1600,32 +1575,15 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		HIZC10_IRQ2, HIZC10_HIZ,
 		HIZC9_IRQ1, HIZC9_HIZ,
 		HIZC8_IRQ0, HIZC8_HIZ,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0 ))
+		/* RESERVED [8] */ ))
 	},
-	{ PINMUX_CFG_REG("MSELCRB", 0xa4050182, 16, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("MSELCRB", 0xa4050182, 16,
+			     GROUP(-6, 1, 1, -8),
+			     GROUP(
+		/* RESERVED [6] */
 		MSELB9_VIO, MSELB9_VIO2,
 		MSELB8_RGB, MSELB8_SYS,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0 ))
+		/* RESERVED [8] */ ))
 	},
 	{}
 };
-- 
2.25.1

