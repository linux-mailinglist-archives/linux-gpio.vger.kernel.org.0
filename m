Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907E94FFC8C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237301AbiDMR1I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237334AbiDMR04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:56 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9506421826
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by laurent.telenet-ops.be with bizsmtp
        id JHQH270082t8Arn01HQHg3; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000Tql-OB; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfUU-QI; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 24/50] pinctrl: renesas: r8a7740: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:46 +0200
Message-Id: <a18fb98a4eefe648a1b1c5b5913dbeee092674c4.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 230 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7740.c | 74 ++++++++++++++-------------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
index e8b9fb74a802ac03..6dcd39918daf96bc 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7740.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7740.c
@@ -3250,89 +3250,93 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	PORTCR(210,	0xe60530d2), /* PORT210CR */
 	PORTCR(211,	0xe60530d3), /* PORT211CR */
 
-	{ PINMUX_CFG_REG("MSEL1CR", 0xe605800c, 32, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("MSEL1CR", 0xe605800c, 32,
+			    GROUP(1, 1, 1, 1, 1, 1, -9, 1, 1, 1, 1, 1,
+				  -2, 1, -1, 1, 1, 1, 1, 1, 1, -1, 1),
+			    GROUP(
 			MSEL1CR_31_0,	MSEL1CR_31_1,
 			MSEL1CR_30_0,	MSEL1CR_30_1,
 			MSEL1CR_29_0,	MSEL1CR_29_1,
 			MSEL1CR_28_0,	MSEL1CR_28_1,
 			MSEL1CR_27_0,	MSEL1CR_27_1,
 			MSEL1CR_26_0,	MSEL1CR_26_1,
-			0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-			0, 0, 0, 0, 0, 0, 0, 0,
+			/* RESERVED [9] */
 			MSEL1CR_16_0,	MSEL1CR_16_1,
 			MSEL1CR_15_0,	MSEL1CR_15_1,
 			MSEL1CR_14_0,	MSEL1CR_14_1,
 			MSEL1CR_13_0,	MSEL1CR_13_1,
 			MSEL1CR_12_0,	MSEL1CR_12_1,
-			0, 0, 0, 0,
+			/* RESERVED [2] */
 			MSEL1CR_9_0,	MSEL1CR_9_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL1CR_7_0,	MSEL1CR_7_1,
 			MSEL1CR_6_0,	MSEL1CR_6_1,
 			MSEL1CR_5_0,	MSEL1CR_5_1,
 			MSEL1CR_4_0,	MSEL1CR_4_1,
 			MSEL1CR_3_0,	MSEL1CR_3_1,
 			MSEL1CR_2_0,	MSEL1CR_2_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL1CR_0_0,	MSEL1CR_0_1,
 		))
 	},
-	{ PINMUX_CFG_REG("MSEL3CR", 0xE6058020, 32, 1, GROUP(
-			0, 0, 0, 0, 0, 0, 0, 0,
-			0, 0, 0, 0, 0, 0, 0, 0,
-			0, 0, 0, 0, 0, 0, 0, 0,
-			0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("MSEL3CR", 0xE6058020, 32,
+			     GROUP(-16, 1, -8, 1, -6),
+			     GROUP(
+			/* RESERVED [16] */
 			MSEL3CR_15_0,	MSEL3CR_15_1,
-			0, 0, 0, 0, 0, 0, 0, 0,
-			0, 0, 0, 0, 0, 0, 0, 0,
+			/* RESERVED [8] */
 			MSEL3CR_6_0,	MSEL3CR_6_1,
-			0, 0, 0, 0, 0, 0, 0, 0,
-			0, 0, 0, 0,
+			/* RESERVED [6] */
 			))
 	},
-	{ PINMUX_CFG_REG("MSEL4CR", 0xE6058024, 32, 1, GROUP(
-			0, 0, 0, 0, 0, 0, 0, 0,
-			0, 0, 0, 0, 0, 0, 0, 0,
-			0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("MSEL4CR", 0xE6058024, 32,
+			     GROUP(-12, 1, 1, -2, 1, -4, 1, -3, 1, -1, 1, -2,
+				   1, -1),
+			     GROUP(
+			/* RESERVED [12] */
 			MSEL4CR_19_0,	MSEL4CR_19_1,
 			MSEL4CR_18_0,	MSEL4CR_18_1,
-			0, 0, 0, 0,
+			/* RESERVED [2] */
 			MSEL4CR_15_0,	MSEL4CR_15_1,
-			0, 0, 0, 0, 0, 0, 0, 0,
+			/* RESERVED [4] */
 			MSEL4CR_10_0,	MSEL4CR_10_1,
-			0, 0, 0, 0, 0, 0,
+			/* RESERVED [3] */
 			MSEL4CR_6_0,	MSEL4CR_6_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL4CR_4_0,	MSEL4CR_4_1,
-			0, 0, 0, 0,
+			/* RESERVED [2] */
 			MSEL4CR_1_0,	MSEL4CR_1_1,
-			0, 0,
+			/* RESERVED [1] */
 		))
 	},
-	{ PINMUX_CFG_REG("MSEL5CR", 0xE6058028, 32, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("MSEL5CR", 0xE6058028, 32,
+			     GROUP(1, 1, 1, -1, 1, -1, 1, -1, 1, -1, 1,
+				   -1, 1, -1, 1, -1, 1, 1, 1, 1, 1, 1,
+				   -1, 1, 1, 1, 1, 1, 1, 1, -1, 1),
+			     GROUP(
 			MSEL5CR_31_0,	MSEL5CR_31_1,
 			MSEL5CR_30_0,	MSEL5CR_30_1,
 			MSEL5CR_29_0,	MSEL5CR_29_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_27_0,	MSEL5CR_27_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_25_0,	MSEL5CR_25_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_23_0,	MSEL5CR_23_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_21_0,	MSEL5CR_21_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_19_0,	MSEL5CR_19_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_17_0,	MSEL5CR_17_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_15_0,	MSEL5CR_15_1,
 			MSEL5CR_14_0,	MSEL5CR_14_1,
 			MSEL5CR_13_0,	MSEL5CR_13_1,
 			MSEL5CR_12_0,	MSEL5CR_12_1,
 			MSEL5CR_11_0,	MSEL5CR_11_1,
 			MSEL5CR_10_0,	MSEL5CR_10_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_8_0,	MSEL5CR_8_1,
 			MSEL5CR_7_0,	MSEL5CR_7_1,
 			MSEL5CR_6_0,	MSEL5CR_6_1,
@@ -3340,7 +3344,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			MSEL5CR_4_0,	MSEL5CR_4_1,
 			MSEL5CR_3_0,	MSEL5CR_3_1,
 			MSEL5CR_2_0,	MSEL5CR_2_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL5CR_0_0,	MSEL5CR_0_1,
 		))
 	},
-- 
2.25.1

