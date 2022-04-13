Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48ED64FFC51
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbiDMR0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbiDMR0m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:42 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D96B0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JHQF2700W2t8Arn01HQFt7; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000Tq7-78; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfVW-3e; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 32/50] pinctrl: renesas: r8a77970: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:54 +0200
Message-Id: <33dd9bc41df888f132e2e6921d2ff38225b68105.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 268 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77970.c | 122 ++++++-------------------
 1 file changed, 29 insertions(+), 93 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index 6c8b1e797b0822cb..4a7803eaafaa8abf 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -231,7 +231,6 @@
 #define IP8_19_16	FM(CANFD_CLK_A)			FM(CLK_EXTFXR)		FM(PWM4_B)	FM(SPEEDIN_B)	FM(SCIF_CLK_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_23_20	FM(DIGRF_CLKIN)			FM(DIGRF_CLKEN_IN)	F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_27_24	FM(DIGRF_CLKOUT)		FM(DIGRF_CLKEN_OUT)	F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP8_31_28	F_(0, 0)			F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0)
 
 #define PINMUX_GPSR	\
 \
@@ -290,8 +289,7 @@ FM(IP8_11_8)	IP8_11_8 \
 FM(IP8_15_12)	IP8_15_12 \
 FM(IP8_19_16)	IP8_19_16 \
 FM(IP8_23_20)	IP8_23_20 \
-FM(IP8_27_24)	IP8_27_24 \
-FM(IP8_31_28)	IP8_31_28
+FM(IP8_27_24)	IP8_27_24
 
 /* MOD_SEL0 */		/* 0 */			/* 1 */
 #define MOD_SEL0_11	FM(SEL_I2C3_0)		FM(SEL_I2C3_1)
@@ -2085,17 +2083,11 @@ static const struct sh_pfc_function pinmux_functions[] = {
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
+	{ PINMUX_CFG_REG_VAR("GPSR0", 0xe6060100, 32,
+			     GROUP(-10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP0_31_22 RESERVED */
 		GP_0_21_FN,	GPSR0_21,
 		GP_0_20_FN,	GPSR0_20,
 		GP_0_19_FN,	GPSR0_19,
@@ -2153,22 +2145,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_1_1_FN,	GPSR1_1,
 		GP_1_0_FN,	GPSR1_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR2", 0xe6060108, 32, 1, GROUP(
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
+	{ PINMUX_CFG_REG_VAR("GPSR2", 0xe6060108, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP2_31_17 RESERVED */
 		GP_2_16_FN,	GPSR2_16,
 		GP_2_15_FN,	GPSR2_15,
 		GP_2_14_FN,	GPSR2_14,
@@ -2187,22 +2168,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
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
+	{ PINMUX_CFG_REG_VAR("GPSR3", 0xe606010c, 32,
+			     GROUP(-15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP3_31_17 RESERVED */
 		GP_3_16_FN,	GPSR3_16,
 		GP_3_15_FN,	GPSR3_15,
 		GP_3_14_FN,	GPSR3_14,
@@ -2221,33 +2191,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
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
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR4", 0xe6060110, 32,
+			     GROUP(-26, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP4_31_6 RESERVED */
 		GP_4_5_FN,	GPSR4_5,
 		GP_4_4_FN,	GPSR4_4,
 		GP_4_3_FN,	GPSR4_3,
@@ -2255,24 +2202,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
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
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR5", 0xe6060114, 32,
+			     GROUP(-17, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1),
+			     GROUP(
+		/* GP5_31_15 RESERVED */
 		GP_5_14_FN,	GPSR5_14,
 		GP_5_13_FN,	GPSR5_13,
 		GP_5_12_FN,	GPSR5_12,
@@ -2374,8 +2308,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP7_7_4
 		IP7_3_0 ))
 	},
-	{ PINMUX_CFG_REG("IPSR8", 0xe6060220, 32, 4, GROUP(
-		IP8_31_28
+	{ PINMUX_CFG_REG_VAR("IPSR8", 0xe6060220, 32,
+			      GROUP(-4, 4, 4, 4, 4, 4, 4, 4),
+			      GROUP(
+		/* IP8_31_28 RESERVED */
 		IP8_27_24
 		IP8_23_20
 		IP8_19_16
-- 
2.25.1

