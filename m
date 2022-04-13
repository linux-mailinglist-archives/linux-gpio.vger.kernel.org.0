Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715FD4FFCB7
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbiDMRcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237047AbiDMRcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:32:04 -0400
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC0E58384
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:29:41 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4KdqFr5DhTz4xDSx
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG2700v2t8Arn01HQGXy; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000TqM-3j; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfTE-E1; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 14/50] pinctrl: renesas: r8a7796: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:36 +0200
Message-Id: <433f5ddcc2dba7352825cba007b99b8e654d4c61.1649865241.git.geert+renesas@glider.be>
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

Replace the full descriptions of reserved register fields by shorthands
with a negative field width, and merge adjacent reserved fields.

This reduces kernel size by 148 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7796.c | 29 ++++++++-------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 75ea36829a70e024..ece673f0af5d5caa 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -5567,8 +5567,8 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 #define F_(x, y)	x,
 #define FM(x)		FN_##x,
 	{ PINMUX_CFG_REG_VAR("MOD_SEL0", 0xe6060500, 32,
-			     GROUP(3, 2, 3, 1, 1, 1, 1, 1, 2, 1, 1, 2,
-				   1, 1, 1, 2, 2, 1, 2, 3),
+			     GROUP(3, 2, 3, 1, 1, 1, 1, 1, 2, 1, -1, 2,
+				   1, 1, 1, 2, 2, 1, 2, -3),
 			     GROUP(
 		MOD_SEL0_31_30_29
 		MOD_SEL0_28_27
@@ -5580,7 +5580,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_19
 		MOD_SEL0_18_17
 		MOD_SEL0_16
-		0, 0, /* RESERVED 15 */
+		/* RESERVED 15 */
 		MOD_SEL0_14_13
 		MOD_SEL0_12
 		MOD_SEL0_11
@@ -5589,12 +5589,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_7_6
 		MOD_SEL0_5
 		MOD_SEL0_4_3
-		/* RESERVED 2, 1, 0 */
-		0, 0, 0, 0, 0, 0, 0, 0 ))
+		/* RESERVED 2, 1, 0 */ ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6060504, 32,
 			     GROUP(2, 3, 1, 2, 3, 1, 1, 2, 1, 2, 1, 1,
-				   1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1),
+				   1, 1, 1, -2, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
 		MOD_SEL1_31_30
 		MOD_SEL1_29_28_27
@@ -5611,7 +5610,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_11
 		MOD_SEL1_10
 		MOD_SEL1_9
-		0, 0, 0, 0, /* RESERVED 8, 7 */
+		/* RESERVED 8, 7 */
 		MOD_SEL1_6
 		MOD_SEL1_5
 		MOD_SEL1_4
@@ -5622,7 +5621,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xe6060508, 32,
 			     GROUP(1, 1, 1, 2, 1, 3, 1, 1, 1, 1, 1, 1,
-				   1, 4, 4, 4, 3, 1),
+				   -16, 1),
 			     GROUP(
 		MOD_SEL2_31
 		MOD_SEL2_30
@@ -5636,19 +5635,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL2_19
 		MOD_SEL2_18
 		MOD_SEL2_17
-		/* RESERVED 16 */
-		0, 0,
-		/* RESERVED 15, 14, 13, 12 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 11, 10, 9, 8 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 7, 6, 5, 4 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 3, 2, 1 */
-		0, 0, 0, 0, 0, 0, 0, 0,
+		/* RESERVED 16-1 */
 		MOD_SEL2_0 ))
 	},
 	{ },
-- 
2.25.1

