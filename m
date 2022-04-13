Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D974FFC6F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbiDMR05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237308AbiDMR0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:45 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED68E28
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JHQG270092t8Arn01HQGtS; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000Tq8-Ex; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfS2-2a; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/50] pinctrl: renesas: emev2: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:26 +0200
Message-Id: <616afe67d3b4d2cbf5f43876f9aa7b258862ceaa.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 769 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-emev2.c | 59 +++++++----------------------
 1 file changed, 13 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-emev2.c b/drivers/pinctrl/renesas/pfc-emev2.c
index b3f50853d66ebcd7..1d8b540110f23e4c 100644
--- a/drivers/pinctrl/renesas/pfc-emev2.c
+++ b/drivers/pinctrl/renesas/pfc-emev2.c
@@ -1569,61 +1569,39 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("CHG_PINSEL_LCD3", 0xe0140284, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2,
-				   2, 2),
+			     GROUP(-20, 2, 2, -6, 2),
 			     GROUP(
-		/* 31 - 12 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* 31 - 12 RESERVED */
 		/* 11 - 10 */
 		FN_SEL_LCD3_11_10_00, FN_SEL_LCD3_11_10_01,
 		FN_SEL_LCD3_11_10_10, 0,
 		/* 9 - 8 */
 		FN_SEL_LCD3_9_8_00, 0, FN_SEL_LCD3_9_8_10, 0,
-		/* 7 - 2 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* 7 - 2 RESERVED */
 		/* 1 - 0 */
 		FN_SEL_LCD3_1_0_00, FN_SEL_LCD3_1_0_01, 0, 0,
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("CHG_PINSEL_UART", 0xe0140288, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 2),
+			     GROUP(-30, 2),
 			     GROUP(
-		/* 31 - 2 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* 31 - 2 RESERVED */
 		/* 1 - 0 */
 		FN_SEL_UART_1_0_00, FN_SEL_UART_1_0_01, 0, 0,
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("CHG_PINSEL_IIC", 0xe014028c, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 2),
+			     GROUP(-30, 2),
 			     GROUP(
-		/* 31 - 2 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* 31 - 2 RESERVED */
 		/* 1 - 0 */
 		FN_SEL_IIC_1_0_00, FN_SEL_IIC_1_0_01, 0, 0,
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("CHG_PINSEL_AB", 0xe0140294, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2),
+			     GROUP(-18, 2, 2, 2, 2, 2, 2, 2),
 			     GROUP(
-		/* 31 - 14 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0,
+		/* 31 - 14 RESERVED */
 		/* 13 - 12 */
 		FN_SEL_AB_13_12_00, 0, FN_SEL_AB_13_12_10, 0,
 		/* 11 - 10 */
@@ -1643,14 +1621,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("CHG_PINSEL_USI", 0xe0140298, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2,
-				   2, 2, 2),
+			     GROUP(-22, 2, 2, 2, 2, 2),
 			     GROUP(
-		/* 31 - 10 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* 31 - 10 RESERVED */
 		/* 9 - 8 */
 		FN_SEL_USI_9_8_00, FN_SEL_USI_9_8_01, 0, 0,
 		/* 7 - 6 */
@@ -1664,15 +1637,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		))
 	},
 	{ PINMUX_CFG_REG_VAR("CHG_PINSEL_HSI", 0xe01402a8, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
-				   1, 1, 1, 1, 1, 1, 2),
+			     GROUP(-30, 2),
 			     GROUP(
-		/* 31 - 2 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* 31 - 2 RESERVED */
 		/* 1 - 0 */
 		FN_SEL_HSI_1_0_00, FN_SEL_HSI_1_0_01, 0, 0,
 		))
-- 
2.25.1

