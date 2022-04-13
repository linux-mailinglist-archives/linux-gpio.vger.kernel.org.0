Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2FE4FFC6D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237303AbiDMR04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237312AbiDMR0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:45 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1379F3D
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JHQG270072t8Arn01HQGQ3; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqG-IP; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfZ5-Er; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 42/50] pinctrl: renesas: sh7720: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:04 +0200
Message-Id: <4b290f93a7edb1f91c97da90e67b7f6f3df62951.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 128 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7720.c | 57 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7720.c b/drivers/pinctrl/renesas/pfc-sh7720.c
index 7071ef52449d6ccf..6eedcc5bbb4d6705 100644
--- a/drivers/pinctrl/renesas/pfc-sh7720.c
+++ b/drivers/pinctrl/renesas/pfc-sh7720.c
@@ -1014,25 +1014,24 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTJ1_FN, PTJ1_OUT, 0, PTJ1_IN,
 		PTJ0_FN, PTJ0_OUT, 0, PTJ0_IN ))
 	},
-	{ PINMUX_CFG_REG("PKCR", 0xa4050112, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PKCR", 0xa4050112, 16,
+			     GROUP(-8, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [8] */
 		PTK3_FN, PTK3_OUT, 0, PTK3_IN,
 		PTK2_FN, PTK2_OUT, 0, PTK2_IN,
 		PTK1_FN, PTK1_OUT, 0, PTK1_IN,
 		PTK0_FN, PTK0_OUT, 0, PTK0_IN ))
 	},
-	{ PINMUX_CFG_REG("PLCR", 0xa4050114, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PLCR", 0xa4050114, 16,
+			     GROUP(2, 2, 2, 2, 2, -6),
+			     GROUP(
 		PTL7_FN, PTL7_OUT, 0, PTL7_IN,
 		PTL6_FN, PTL6_OUT, 0, PTL6_IN,
 		PTL5_FN, PTL5_OUT, 0, PTL5_IN,
 		PTL4_FN, PTL4_OUT, 0, PTL4_IN,
 		PTL3_FN, PTL3_OUT, 0, PTL3_IN,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0 ))
+		/* RESERVED [6] */ ))
 	},
 	{ PINMUX_CFG_REG("PMCR", 0xa4050116, 16, 2, GROUP(
 		PTM7_FN, PTM7_OUT, 0, PTM7_IN,
@@ -1044,10 +1043,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTM1_FN, PTM1_OUT, 0, PTM1_IN,
 		PTM0_FN, PTM0_OUT, 0, PTM0_IN ))
 	},
-	{ PINMUX_CFG_REG("PPCR", 0xa4050118, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PPCR", 0xa4050118, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		PTP4_FN, PTP4_OUT, 0, PTP4_IN,
 		PTP3_FN, PTP3_OUT, 0, PTP3_IN,
 		PTP2_FN, PTP2_OUT, 0, PTP2_IN,
@@ -1064,40 +1063,40 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTR1_FN, PTR1_OUT, 0, PTR1_IN,
 		PTR0_FN, PTR0_OUT, 0, PTR0_IN ))
 	},
-	{ PINMUX_CFG_REG("PSCR", 0xa405011c, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PSCR", 0xa405011c, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		PTS4_FN, PTS4_OUT, 0, PTS4_IN,
 		PTS3_FN, PTS3_OUT, 0, PTS3_IN,
 		PTS2_FN, PTS2_OUT, 0, PTS2_IN,
 		PTS1_FN, PTS1_OUT, 0, PTS1_IN,
 		PTS0_FN, PTS0_OUT, 0, PTS0_IN ))
 	},
-	{ PINMUX_CFG_REG("PTCR", 0xa405011e, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PTCR", 0xa405011e, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		PTT4_FN, PTT4_OUT, 0, PTT4_IN,
 		PTT3_FN, PTT3_OUT, 0, PTT3_IN,
 		PTT2_FN, PTT2_OUT, 0, PTT2_IN,
 		PTT1_FN, PTT1_OUT, 0, PTT1_IN,
 		PTT0_FN, PTT0_OUT, 0, PTT0_IN ))
 	},
-	{ PINMUX_CFG_REG("PUCR", 0xa4050120, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PUCR", 0xa4050120, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		PTU4_FN, PTU4_OUT, 0, PTU4_IN,
 		PTU3_FN, PTU3_OUT, 0, PTU3_IN,
 		PTU2_FN, PTU2_OUT, 0, PTU2_IN,
 		PTU1_FN, PTU1_OUT, 0, PTU1_IN,
 		PTU0_FN, PTU0_OUT, 0, PTU0_IN ))
 	},
-	{ PINMUX_CFG_REG("PVCR", 0xa4050122, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PVCR", 0xa4050122, 16,
+			     GROUP(-6, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [6] */
 		PTV4_FN, PTV4_OUT, 0, PTV4_IN,
 		PTV3_FN, PTV3_OUT, 0, PTV3_IN,
 		PTV2_FN, PTV2_OUT, 0, PTV2_IN,
-- 
2.25.1

