Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93E34FFC85
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236491AbiDMR1F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237296AbiDMR0v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:51 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C1C20190
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by albert.telenet-ops.be with bizsmtp
        id JHQG2700M2t8Arn06HQGf0; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000Tq5-Fv; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfUb-RQ; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 25/50] pinctrl: renesas: r8a77470: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:47 +0200
Message-Id: <c5183fcb3dd417d57ced0f60d091e2c7d37e1c8c.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 70 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 56 +++++++++-----------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index 15a6dffdffcfd581..b5725c3ed2b60e88 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -2485,16 +2485,11 @@ static const struct sh_pfc_function pinmux_functions[] = {
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-	{ PINMUX_CFG_REG("GPSR0", 0xE6060004, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR0", 0xE6060004, 32,
+			     GROUP(-9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP0_31_23 RESERVED */
 		GP_0_22_FN, FN_MMC0_D7,
 		GP_0_21_FN, FN_MMC0_D6,
 		GP_0_20_FN, FN_IP1_7_4,
@@ -2519,16 +2514,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_0_1_FN, FN_USB0_OVC,
 		GP_0_0_FN, FN_USB0_PWEN, ))
 	},
-	{ PINMUX_CFG_REG("GPSR1", 0xE6060008, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR1", 0xE6060008, 32,
+			     GROUP(-9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP1_31_23 RESERVED */
 		GP_1_22_FN, FN_IP4_3_0,
 		GP_1_21_FN, FN_IP3_31_28,
 		GP_1_20_FN, FN_IP3_27_24,
@@ -2587,22 +2577,15 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_2_1_FN, FN_IP4_11_8,
 		GP_2_0_FN, FN_IP4_7_4, ))
 	},
-	{ PINMUX_CFG_REG("GPSR3", 0xE6060010, 32, 1, GROUP(
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR3", 0xE6060010, 32,
+			     GROUP(-2, 1, 1, -10, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP3_31_30 RESERVED */
 		GP_3_29_FN, FN_IP10_19_16,
 		GP_3_28_FN, FN_IP10_15_12,
 		GP_3_27_FN, FN_IP10_11_8,
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
+		/* GP3_26_17 RESERVED */
 		GP_3_16_FN, FN_IP10_7_4,
 		GP_3_15_FN, FN_IP10_3_0,
 		GP_3_14_FN, FN_IP9_31_28,
@@ -3139,9 +3122,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SSI_SDATA4_A, 0, FN_AVB_CRS, 0, 0, 0, FN_VI0_R6, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG("IPSR17", 0xE6060084, 32, 4, GROUP(
-		/* IP17_31_28 [4] */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("IPSR17", 0xE6060084, 32,
+			     GROUP(-4, 4, 4, 4, 4, 4, 4, 4),
+			     GROUP(
+		/* IP17_31_28 [4] RESERVED */
 		/* IP17_27_24 [4] */
 		FN_AUDIO_CLKOUT_A, FN_SDA4_B, 0, 0, 0, 0,
 		FN_VI0_VSYNC_N, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-- 
2.25.1

