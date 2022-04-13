Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733054FFC5B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237273AbiDMR0n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235470AbiDMR0l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:41 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561F16338A
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JHQF270042t8Arn01HQFPU; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-000TqB-MB; Wed, 13 Apr 2022 19:24:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfS9-3x; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/50] pinctrl: renesas: r8a77470: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:27 +0200
Message-Id: <bc8f9647bbf677ac67cbdb34cf0c8fbaf62fb7fc.1649865241.git.geert+renesas@glider.be>
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

Replace the full descriptions of reserved register fields by shorthands
with a negative field width, and merge adjacent reserved fields.

This reduces kernel size by 114 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 54 ++++----------------------
 1 file changed, 8 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index 63db71ebb7e955ec..15a6dffdffcfd581 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -3165,25 +3165,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI0_DATA5_VI0_B5, 0, 0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL0", 0xE60600C0, 32,
-			     GROUP(1, 1, 1, 1, 1, 2, 1, 1, 2, 2, 2, 1,
-				   3, 3, 1, 2, 3, 3, 1),
+			     GROUP(-5, 2, -2, 2, 2, 2, -1,
+				   3, 3, -1, 2, 3, 3, 1),
 			     GROUP(
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
+		/* RESERVED [5] */
 		/* SEL_ADGA [2] */
 		FN_SEL_ADGA_0, FN_SEL_ADGA_1, FN_SEL_ADGA_2, FN_SEL_ADGA_3,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
+		/* RESERVED [2] */
 		/* SEL_CANCLK [2] */
 		FN_SEL_CANCLK_0, FN_SEL_CANCLK_1, FN_SEL_CANCLK_2,
 		FN_SEL_CANCLK_3,
@@ -3192,7 +3180,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_CAN0 [2] */
 		FN_SEL_CAN0_0, FN_SEL_CAN0_1, FN_SEL_CAN0_2, FN_SEL_CAN0_3,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_I2C04 [3] */
 		FN_SEL_I2C04_0, FN_SEL_I2C04_1, FN_SEL_I2C04_2, FN_SEL_I2C04_3,
 		FN_SEL_I2C04_4, 0, 0, 0,
@@ -3200,7 +3187,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_I2C03_0, FN_SEL_I2C03_1, FN_SEL_I2C03_2, FN_SEL_I2C03_3,
 		FN_SEL_I2C03_4, 0, 0, 0,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_I2C02 [2] */
 		FN_SEL_I2C02_0, FN_SEL_I2C02_1, FN_SEL_I2C02_2, FN_SEL_I2C02_3,
 		/* SEL_I2C01 [3] */
@@ -3213,8 +3199,8 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_AVB_0, FN_SEL_AVB_1, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xE60600C4, 32,
-			     GROUP(1, 3, 3, 2, 2, 1, 2, 2, 2, 1, 1, 1,
-				   1, 1, 2, 1, 1, 2, 2, 1),
+			     GROUP(1, 3, 3, 2, 2, 1, 2, 2, 2, -1, 1, -1,
+				   1, 1, -2, 1, 1, -2, 2, 1),
 			     GROUP(
 		/* SEL_SCIFCLK [1] */
 		FN_SEL_SCIFCLK_0, FN_SEL_SCIFCLK_1,
@@ -3237,52 +3223,28 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_MSIOF2 [2] */
 		FN_SEL_MSIOF2_0, FN_SEL_MSIOF2_1, FN_SEL_MSIOF2_2, 0,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_MSIOF1 [1] */
 		FN_SEL_MSIOF1_0, FN_SEL_MSIOF1_1,
 		/* RESERVED [1] */
-		0, 0,
 		/* SEL_MSIOF0 [1] */
 		FN_SEL_MSIOF0_0, FN_SEL_MSIOF0_1,
 		/* SEL_RCN [1] */
 		FN_SEL_RCN_0, FN_SEL_RCN_1,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* SEL_TMU2 [1] */
 		FN_SEL_TMU2_0, FN_SEL_TMU2_1,
 		/* SEL_TMU1 [1] */
 		FN_SEL_TMU1_0, FN_SEL_TMU1_1,
 		/* RESERVED [2] */
-		0, 0, 0, 0,
 		/* SEL_HSCIF1 [2] */
 		FN_SEL_HSCIF1_0, FN_SEL_HSCIF1_1, FN_SEL_HSCIF1_2, 0,
 		/* SEL_HSCIF0 [1] */
 		FN_SEL_HSCIF0_0, FN_SEL_HSCIF0_1, ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xE60600C8, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2,
-				   2, 2, 2, 2, 2, 2, 2, 2, 2),
+			     GROUP(-10, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
 			     GROUP(
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
-		/* RESERVED [1] */
-		0, 0,
+		/* RESERVED [10] */
 		/* SEL_ADGB [2] */
 		FN_SEL_ADGB_0, FN_SEL_ADGB_1, FN_SEL_ADGB_2, 0,
 		/* SEL_ADGC [2] */
-- 
2.25.1

