Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512814FFCC7
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237041AbiDMRdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235818AbiDMRdq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:33:46 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641A06C484
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:31:23 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4KdqFr2ccQz4xlW4
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG2700T2t8Arn01HQGXg; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000Tqc-IO; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfWQ-6v; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 35/50] pinctrl: renesas: r8a77995: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:57 +0200
Message-Id: <d74af80fdb7b6d78b10634238a88e55a139e5c22.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 422 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77995.c | 107 +++++--------------------
 1 file changed, 22 insertions(+), 85 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 71f6a4a79e3db95f..d949ae59c757924d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -2486,30 +2486,10 @@ static const struct sh_pfc_function pinmux_functions[] = {
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
+			     GROUP(-23, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP0_31_9 RESERVED */
 		GP_0_8_FN,	GPSR0_8,
 		GP_0_7_FN,	GPSR0_7,
 		GP_0_6_FN,	GPSR0_6,
@@ -2588,29 +2568,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
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
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR3", 0xe606010c, 32,
+			     GROUP(-22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP3_31_10 RESERVED */
 		GP_3_9_FN,	GPSR3_9,
 		GP_3_8_FN,	GPSR3_8,
 		GP_3_7_FN,	GPSR3_7,
@@ -2656,18 +2617,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
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
+	{ PINMUX_CFG_REG_VAR("GPSR5", 0xe6060114, 32,
+			     GROUP(-11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP5_31_21 RESERVED */
 		GP_5_20_FN,	GPSR5_20,
 		GP_5_19_FN,	GPSR5_19,
 		GP_5_18_FN,	GPSR5_18,
@@ -2690,25 +2644,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
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
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR6", 0xe6060118, 32,
+			     GROUP(-18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1),
+			     GROUP(
+		/* GP6_31_14 RESERVED */
 		GP_6_13_FN,	GPSR6_13,
 		GP_6_12_FN,	GPSR6_12,
 		GP_6_11_FN,	GPSR6_11,
@@ -2859,13 +2799,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP12_7_4
 		IP12_3_0 ))
 	},
-	{ PINMUX_CFG_REG("IPSR13", 0xe6060234, 32, 4, GROUP(
-		/* IP13_31_28 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP13_27_24 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP13_23_20 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP13_19_16 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP13_15_12 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP13_11_8  */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("IPSR13", 0xe6060234, 32,
+			     GROUP(-24, 4, 4),
+			     GROUP(
+		/* IP13_31_8 RESERVED */
 		IP13_7_4
 		IP13_3_0 ))
 	},
-- 
2.25.1

