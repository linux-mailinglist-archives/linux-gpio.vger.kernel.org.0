Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A594FFC91
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237356AbiDMR1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237310AbiDMR0y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:54 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061AF205E4
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by laurent.telenet-ops.be with bizsmtp
        id JHQH270052t8Arn01HQHg2; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000Tqh-LZ; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfUN-PE; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 23/50] pinctrl: renesas: r8a73a4: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:45 +0200
Message-Id: <f835c2ff5bb07e541f6377b16f0a32c5aad2a47f.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 126 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a73a4.c | 58 ++++++++-------------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a73a4.c b/drivers/pinctrl/renesas/pfc-r8a73a4.c
index ba3a1857f80a08c4..dbfc46fe2f277092 100644
--- a/drivers/pinctrl/renesas/pfc-r8a73a4.c
+++ b/drivers/pinctrl/renesas/pfc-r8a73a4.c
@@ -2270,15 +2270,17 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			MSEL1CR_00_0, MSEL1CR_00_1,
 		))
 	},
-	{ PINMUX_CFG_REG("MSEL3CR", 0xe6058020, 32, 1, GROUP(
+	{ PINMUX_CFG_REG_VAR("MSEL3CR", 0xe6058020, 32,
+			     GROUP(1, -2, 1, 1, 1, -2, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, -2, 1, 1, 1, 1, -2, 1, -2, 1,
+				   -1, 1, 1),
+			     GROUP(
 			MSEL3CR_31_0, MSEL3CR_31_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 			MSEL3CR_28_0, MSEL3CR_28_1,
 			MSEL3CR_27_0, MSEL3CR_27_1,
 			MSEL3CR_26_0, MSEL3CR_26_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 			MSEL3CR_23_0, MSEL3CR_23_1,
 			MSEL3CR_22_0, MSEL3CR_22_1,
 			MSEL3CR_21_0, MSEL3CR_21_1,
@@ -2288,19 +2290,16 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			MSEL3CR_17_0, MSEL3CR_17_1,
 			MSEL3CR_16_0, MSEL3CR_16_1,
 			MSEL3CR_15_0, MSEL3CR_15_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 			MSEL3CR_12_0, MSEL3CR_12_1,
 			MSEL3CR_11_0, MSEL3CR_11_1,
 			MSEL3CR_10_0, MSEL3CR_10_1,
 			MSEL3CR_09_0, MSEL3CR_09_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 			MSEL3CR_06_0, MSEL3CR_06_1,
-			0, 0,
-			0, 0,
+			/* RESERVED [2] */
 			MSEL3CR_03_0, MSEL3CR_03_1,
-			0, 0,
+			/* RESERVED [1] */
 			MSEL3CR_01_0, MSEL3CR_01_1,
 			MSEL3CR_00_0, MSEL3CR_00_1,
 			))
@@ -2375,37 +2374,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			0, 0,
 		))
 	},
-	{ PINMUX_CFG_REG("MSEL8CR", 0xe6058034, 32, 1, GROUP(
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
-			0, 0,
-			0, 0,
-			0, 0,
+	{ PINMUX_CFG_REG_VAR("MSEL8CR", 0xe6058034, 32,
+			     GROUP(-15, 1, -14, 1, 1),
+			     GROUP(
+			/* RESERVED [15] */
 			MSEL8CR_16_0, MSEL8CR_16_1,
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
-			0, 0,
-			0, 0,
+			/* RESERVED [14] */
 			MSEL8CR_01_0, MSEL8CR_01_1,
 			MSEL8CR_00_0, MSEL8CR_00_1,
 		))
-- 
2.25.1

