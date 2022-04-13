Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55DC4FFC55
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbiDMR0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235756AbiDMR0m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:42 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F175DC
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JHQF2700H2t8Arn01HQFt1; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-000TqK-Vp; Wed, 13 Apr 2022 19:24:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfSw-C5; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 12/50] pinctrl: renesas: r8a77950: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:34 +0200
Message-Id: <1866c399e94408439a469c12dc53557b55a00f3a.1649865241.git.geert+renesas@glider.be>
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

Replace the full descriptions of reserved register fields by shorthands
with a negative field width, and merge adjacent reserved fields.

This reduces kernel size by 232 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77950.c | 39 ++++++--------------------
 1 file changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index 63c9f6d6468b3869..b573da6475c2c211 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -5164,10 +5164,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 #define F_(x, y)	x,
 #define FM(x)		FN_##x,
 	{ PINMUX_CFG_REG_VAR("MOD_SEL0", 0xe6060500, 32,
-			     GROUP(1, 2, 2, 3, 1, 1, 2, 1, 1, 1, 2, 1,
-				   1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 1),
+			     GROUP(-1, 2, 2, 3, 1, 1, 2, 1, 1, 1, 2, 1,
+				   1, 1, 1, 1, 1, 1, 2, 2, 1, 2, -1),
 			     GROUP(
-		0, 0, /* RESERVED 31 */
+		/* RESERVED 31 */
 		MOD_SEL0_30_29
 		MOD_SEL0_28_27
 		MOD_SEL0_26_25_24
@@ -5189,11 +5189,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_5_4
 		MOD_SEL0_3
 		MOD_SEL0_2_1
-		0, 0, /* RESERVED 0 */ ))
+		/* RESERVED 0 */ ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6060504, 32,
 			     GROUP(2, 3, 1, 2, 3, 1, 1, 2, 1, 2, 1, 1,
-				   1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1),
+				   1, 1, 1, -2, 1, 1, 1, 1, 1, 1, 1),
 			     GROUP(
 		MOD_SEL1_31_30
 		MOD_SEL1_29_28_27
@@ -5210,7 +5210,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_11
 		MOD_SEL1_10
 		MOD_SEL1_9
-		0, 0, 0, 0, /* RESERVED 8, 7 */
+		/* RESERVED 8, 7 */
 		MOD_SEL1_6
 		MOD_SEL1_5
 		MOD_SEL1_4
@@ -5220,35 +5220,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL2", 0xe6060508, 32,
-			     GROUP(1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 1, 2, 1),
+			     GROUP(1, 1, 1, -28, 1),
 			     GROUP(
 		MOD_SEL2_31
 		MOD_SEL2_30
 		MOD_SEL2_29
-		/* RESERVED 28 */
-		0, 0,
-		/* RESERVED 27, 26, 25, 24 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 23, 22, 21, 20 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 19, 18, 17, 16 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 15, 14, 13, 12 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 11, 10, 9, 8 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 7, 6, 5, 4 */
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 3 */
-		0, 0,
-		/* RESERVED 2, 1 */
-		0, 0, 0, 0,
+		/* RESERVED 28-1 */
 		MOD_SEL2_0 ))
 	},
 	{ },
-- 
2.25.1

