Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0AA74FFCDF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbiDMRhJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234946AbiDMRhJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:37:09 -0400
X-Greylist: delayed 611 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Apr 2022 10:34:47 PDT
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85427BC89
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:34:47 -0700 (PDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by cantor.telenet-ops.be (Postfix) with ESMTPS id 4KdqFs0QMxz4x4pH
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:17 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JHQG2701g2t8Arn01HQGuC; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000TtF-Dn; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfbH-Oh; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 48/50] pinctrl: renesas: sh7785: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:10 +0200
Message-Id: <07a238f13f80674d86719a5e869c65a2e0b8c1c1.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe registers with fixed-width register fields and many reserved
fields using the PINMUX_CFG_REG_VAR() macro, as the latter supports a
shorthand not requiring dummy values.

This reduces kernel size by 150 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7785.c | 60 +++++++++++-----------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7785.c b/drivers/pinctrl/renesas/pfc-sh7785.c
index 62389f7a1de14aec..126b663bb6eb3abe 100644
--- a/drivers/pinctrl/renesas/pfc-sh7785.c
+++ b/drivers/pinctrl/renesas/pfc-sh7785.c
@@ -1024,9 +1024,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PD1_FN, PD1_OUT, PD1_IN, 0,
 		PD0_FN, PD0_OUT, PD0_IN, 0 ))
 	},
-	{ PINMUX_CFG_REG("PECR", 0xffe70008, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PECR", 0xffe70008, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [4] */
 		PE5_FN, PE5_OUT, PE5_IN, 0,
 		PE4_FN, PE4_OUT, PE4_IN, 0,
 		PE3_FN, PE3_OUT, PE3_IN, 0,
@@ -1094,13 +1095,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PL1_FN, PL1_OUT, PL1_IN, 0,
 		PL0_FN, PL0_OUT, PL0_IN, 0 ))
 	},
-	{ PINMUX_CFG_REG("PMCR", 0xffe70016, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PMCR", 0xffe70016, 16,
+			     GROUP(-12, 2, 2),
+			     GROUP(
+		/* RESERVED [12] */
 		PM1_FN, PM1_OUT, PM1_IN, 0,
 		PM0_FN, PM0_OUT, PM0_IN, 0 ))
 	},
@@ -1114,9 +1112,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PN1_FN, PN1_OUT, PN1_IN, 0,
 		PN0_FN, PN0_OUT, PN0_IN, 0 ))
 	},
-	{ PINMUX_CFG_REG("PPCR", 0xffe7001a, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PPCR", 0xffe7001a, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [4] */
 		PP5_FN, PP5_OUT, PP5_IN, 0,
 		PP4_FN, PP4_OUT, PP4_IN, 0,
 		PP3_FN, PP3_OUT, PP3_IN, 0,
@@ -1124,21 +1123,20 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PP1_FN, PP1_OUT, PP1_IN, 0,
 		PP0_FN, PP0_OUT, PP0_IN, 0 ))
 	},
-	{ PINMUX_CFG_REG("PQCR", 0xffe7001c, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PQCR", 0xffe7001c, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		PQ4_FN, PQ4_OUT, PQ4_IN, 0,
 		PQ3_FN, PQ3_OUT, PQ3_IN, 0,
 		PQ2_FN, PQ2_OUT, PQ2_IN, 0,
 		PQ1_FN, PQ1_OUT, PQ1_IN, 0,
 		PQ0_FN, PQ0_OUT, PQ0_IN, 0 ))
 	},
-	{ PINMUX_CFG_REG("PRCR", 0xffe7001e, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PRCR", 0xffe7001e, 16,
+			     GROUP(-8, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [8] */
 		PR3_FN, PR3_OUT, PR3_IN, 0,
 		PR2_FN, PR2_OUT, PR2_IN, 0,
 		PR1_FN, PR1_OUT, PR1_IN, 0,
@@ -1162,20 +1160,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		P1MSEL1_0, P1MSEL1_1,
 		P1MSEL0_0, P1MSEL0_1 ))
 	},
-	{ PINMUX_CFG_REG("P2MSELR", 0xffe70082, 16, 1, GROUP(
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
+	{ PINMUX_CFG_REG_VAR("P2MSELR", 0xffe70082, 16,
+			     GROUP(-13, 1, 1, 1),
+			     GROUP(
+		/* RESERVED [13] */
 		P2MSEL2_0, P2MSEL2_1,
 		P2MSEL1_0, P2MSEL1_1,
 		P2MSEL0_0, P2MSEL0_1 ))
-- 
2.25.1

