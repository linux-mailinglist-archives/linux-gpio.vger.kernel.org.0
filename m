Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7604FFCCA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235345AbiDMRdx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237367AbiDMRds (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:33:48 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCCD40E5D
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:31:25 -0700 (PDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4KdqFr2Sszz4xdyt
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JHQG2700h2t8Arn01HQGtr; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000Tq8-IP; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfYS-Dy; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 41/50] pinctrl: renesas: sh73a0: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:03 +0200
Message-Id: <e74738b403cc15b3407e7568d323fdae8e7b30dd.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 154 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh73a0.c | 87 ++++++++++------------------
 1 file changed, 30 insertions(+), 57 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index 5d8a0179fd60fee4..4f54dfd5a9674916 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -3798,24 +3798,16 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	PORTCR(308, 0xe6052134), /* PORT308CR */
 	PORTCR(309, 0xe6052135), /* PORT309CR */
 
-	{ PINMUX_CFG_REG("MSEL2CR", 0xe605801c, 32, 1, GROUP(
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
+	{ PINMUX_CFG_REG_VAR("MSEL2CR", 0xe605801c, 32,
+			     GROUP(-12, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+			/* RESERVED [12] */
 			MSEL2CR_MSEL19_0, MSEL2CR_MSEL19_1,
 			MSEL2CR_MSEL18_0, MSEL2CR_MSEL18_1,
 			MSEL2CR_MSEL17_0, MSEL2CR_MSEL17_1,
 			MSEL2CR_MSEL16_0, MSEL2CR_MSEL16_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL2CR_MSEL14_0, MSEL2CR_MSEL14_1,
 			MSEL2CR_MSEL13_0, MSEL2CR_MSEL13_1,
 			MSEL2CR_MSEL12_0, MSEL2CR_MSEL12_1,
@@ -3833,60 +3825,43 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			MSEL2CR_MSEL0_0, MSEL2CR_MSEL0_1,
 		))
 	},
-	{ PINMUX_CFG_REG("MSEL3CR", 0xe6058020, 32, 1, GROUP(
-			0, 0,
-			0, 0,
-			0, 0,
+	{ PINMUX_CFG_REG_VAR("MSEL3CR", 0xe6058020, 32,
+			     GROUP(-3, 1, -12, 1, -3, 1, -1, 1, -2, 1, -3, 1,
+				   -2),
+			     GROUP(
+			/* RESERVED [3] */
 			MSEL3CR_MSEL28_0, MSEL3CR_MSEL28_1,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
-			0, 0,
+			/* RESERVED [12] */
 			MSEL3CR_MSEL15_0, MSEL3CR_MSEL15_1,
-			0, 0,
-			0, 0,
-			0, 0,
+			/* RESERVED [3] */
 			MSEL3CR_MSEL11_0, MSEL3CR_MSEL11_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL3CR_MSEL9_0, MSEL3CR_MSEL9_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 			MSEL3CR_MSEL6_0, MSEL3CR_MSEL6_1,
-			0, 0,
-			0, 0,
-			0, 0,
+			/* RESERVED [3] */
 			MSEL3CR_MSEL2_0, MSEL3CR_MSEL2_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 		))
 	},
-	{ PINMUX_CFG_REG("MSEL4CR", 0xe6058024, 32, 1, GROUP(
-			0, 0,
-			0, 0,
+	{ PINMUX_CFG_REG_VAR("MSEL4CR", 0xe6058024, 32,
+			     GROUP(-2, 1, -1, 1, 1, -3, 1, 1, 1, 1, -3, 1,
+				   -1, 1, 1, 1, 1, 1, 1, 1, -2, 1, -2, 1,
+				   -1),
+			     GROUP(
+			/* RESERVED [2] */
 			MSEL4CR_MSEL29_0, MSEL4CR_MSEL29_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL4CR_MSEL27_0, MSEL4CR_MSEL27_1,
 			MSEL4CR_MSEL26_0, MSEL4CR_MSEL26_1,
-			0, 0,
-			0, 0,
-			0, 0,
+			/* RESERVED [3] */
 			MSEL4CR_MSEL22_0, MSEL4CR_MSEL22_1,
 			MSEL4CR_MSEL21_0, MSEL4CR_MSEL21_1,
 			MSEL4CR_MSEL20_0, MSEL4CR_MSEL20_1,
 			MSEL4CR_MSEL19_0, MSEL4CR_MSEL19_1,
-			0, 0,
-			0, 0,
-			0, 0,
+			/* RESERVED [3] */
 			MSEL4CR_MSEL15_0, MSEL4CR_MSEL15_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL4CR_MSEL13_0, MSEL4CR_MSEL13_1,
 			MSEL4CR_MSEL12_0, MSEL4CR_MSEL12_1,
 			MSEL4CR_MSEL11_0, MSEL4CR_MSEL11_1,
@@ -3894,13 +3869,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			MSEL4CR_MSEL9_0, MSEL4CR_MSEL9_1,
 			MSEL4CR_MSEL8_0, MSEL4CR_MSEL8_1,
 			MSEL4CR_MSEL7_0, MSEL4CR_MSEL7_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 			MSEL4CR_MSEL4_0, MSEL4CR_MSEL4_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 			MSEL4CR_MSEL1_0, MSEL4CR_MSEL1_1,
-			0, 0,
+			/* RESERVED [1] */
 		))
 	},
 	{ },
-- 
2.25.1

