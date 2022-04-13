Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E202C4FFCBE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237199AbiDMRdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237374AbiDMRci (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:32:38 -0400
X-Greylist: delayed 359 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Apr 2022 10:30:17 PDT
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470CE2BB07
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:30:17 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by cantor.telenet-ops.be (Postfix) with ESMTPS id 4KdqFr6kTCz4x0Vf
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG270112t8Arn01HQGYB; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000Trp-A7; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfXX-AF; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 38/50] pinctrl: renesas: sh7203: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:00 +0200
Message-Id: <c625b4eee298b88c2ee47ed80b0dea5d02ed56d1.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe registers with fixed-width register fields and many reserved
fields using the PINMUX_CFG_REG_VAR() macro, as the latter supports a
shorthand not requiring dummy values.

This reduces kernel size by 281 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7203.c | 53 +++++++++++-----------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7203.c b/drivers/pinctrl/renesas/pfc-sh7203.c
index 3986802b448a265c..19735746b1bb2157 100644
--- a/drivers/pinctrl/renesas/pfc-sh7203.c
+++ b/drivers/pinctrl/renesas/pfc-sh7203.c
@@ -1072,31 +1072,20 @@ static const struct pinmux_func pinmux_func_gpios[] = {
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-	{ PINMUX_CFG_REG("PBIORL", 0xfffe3886, 16, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("PBIORL", 0xfffe3886, 16,
+			     GROUP(-4, 1, 1, 1, 1, -8),
+			     GROUP(
+		/* RESERVED [4] */
 		PB11_IN, PB11_OUT,
 		PB10_IN, PB10_OUT,
 		PB9_IN, PB9_OUT,
 		PB8_IN, PB8_OUT,
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
-	{ PINMUX_CFG_REG("PBCRL4", 0xfffe3890, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
+	{ PINMUX_CFG_REG_VAR("PBCRL4", 0xfffe3890, 16,
+			     GROUP(-12, 4),
+			     GROUP(
+		/* RESERVED [12] */
 		PB12MD_00, PB12MD_01, PB12MD_10, PB12MD_11,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
@@ -1139,13 +1128,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PB0MD_00, PB0MD_01, PB0MD_10, PB0MD_11,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
-	{ PINMUX_CFG_REG("IFCR", 0xfffe38a2, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
+	{ PINMUX_CFG_REG_VAR("IFCR", 0xfffe38a2, 16,
+			     GROUP(-12, 4),
+			     GROUP(
+		/* RESERVED [12] */
 		PB12IRQ_00, PB12IRQ_01, PB12IRQ_10, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
@@ -1167,9 +1153,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PC1_IN, PC1_OUT,
 		PC0_IN, PC0_OUT ))
 	},
-	{ PINMUX_CFG_REG("PCCRL4", 0xfffe3910, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
+	{ PINMUX_CFG_REG_VAR("PCCRL4", 0xfffe3910, 16,
+			     GROUP(-4, 4, 4, 4),
+			     GROUP(
+		/* RESERVED [4] */
 		PC14MD_0, PC14MD_1,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 
@@ -1417,8 +1404,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PF1_IN, PF1_OUT,
 		PF0_IN, PF0_OUT ))
 	},
-	{ PINMUX_CFG_REG("PFCRH4", 0xfffe3a88, 16, 4, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PFCRH4", 0xfffe3a88, 16,
+			     GROUP(-4, 4, 4, 4),
+			     GROUP(
+		/* RESERVED [4] */
 
 		PF30MD_0, PF30MD_1,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-- 
2.25.1

