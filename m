Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175BD4FFC81
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiDMR1E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237287AbiDMR0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:44 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35ABAC08
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JHQF2700n2t8Arn01HQGtM; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqD-Cy; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfW4-5y; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 34/50] pinctrl: renesas: r8a77990: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:56 +0200
Message-Id: <924ba4505e33180e078ca72a1db8db13c193cbea.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 226 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77990.c | 121 ++++++-------------------
 1 file changed, 29 insertions(+), 92 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index d31b7c1d6606bd21..b0936962fad709f1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -4603,21 +4603,11 @@ static const struct {
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 #define F_(x, y)	FN_##y
 #define FM(x)		FN_##x
-	{ PINMUX_CFG_REG("GPSR0", 0xe6060100, 32, 1, GROUP(
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
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR0", 0xe6060100, 32,
+			     GROUP(-14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP0_31_18 RESERVED */
 		GP_0_17_FN,	GPSR0_17,
 		GP_0_16_FN,	GPSR0_16,
 		GP_0_15_FN,	GPSR0_15,
@@ -4637,16 +4627,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_0_1_FN,	GPSR0_1,
 		GP_0_0_FN,	GPSR0_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR1", 0xe6060104, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR1", 0xe6060104, 32,
+			     GROUP(-9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP1_31_23 RESERVED */
 		GP_1_22_FN,	GPSR1_22,
 		GP_1_21_FN,	GPSR1_21,
 		GP_1_20_FN,	GPSR1_20,
@@ -4705,23 +4690,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_2_1_FN,	GPSR2_1,
 		GP_2_0_FN,	GPSR2_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR3", 0xe606010c, 32, 1, GROUP(
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
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR3", 0xe606010c, 32,
+			     GROUP(-16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP3_31_16 RESERVED */
 		GP_3_15_FN,	GPSR3_15,
 		GP_3_14_FN,	GPSR3_14,
 		GP_3_13_FN,	GPSR3_13,
@@ -4739,28 +4712,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_3_1_FN,	GPSR3_1,
 		GP_3_0_FN,	GPSR3_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR4", 0xe6060110, 32, 1, GROUP(
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
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR4", 0xe6060110, 32,
+			     GROUP(-21, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP4_31_11 RESERVED */
 		GP_4_10_FN,	GPSR4_10,
 		GP_4_9_FN,	GPSR4_9,
 		GP_4_8_FN,	GPSR4_8,
@@ -4773,19 +4728,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_4_1_FN,	GPSR4_1,
 		GP_4_0_FN,	GPSR4_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR5", 0xe6060114, 32, 1, GROUP(
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
+	{ PINMUX_CFG_REG_VAR("GPSR5", 0xe6060114, 32,
+			     GROUP(-12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP5_31_20 RESERVED */
 		GP_5_19_FN,	GPSR5_19,
 		GP_5_18_FN,	GPSR5_18,
 		GP_5_17_FN,	GPSR5_17,
@@ -4807,21 +4754,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_5_1_FN,	GPSR5_1,
 		GP_5_0_FN,	GPSR5_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR6", 0xe6060118, 32, 1, GROUP(
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
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR6", 0xe6060118, 32,
+			     GROUP(-14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP6_31_18 RESERVED */
 		GP_6_17_FN,	GPSR6_17,
 		GP_6_16_FN,	GPSR6_16,
 		GP_6_15_FN,	GPSR6_15,
-- 
2.25.1

