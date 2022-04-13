Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5E74FFCC2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237360AbiDMRdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237379AbiDMRcj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:32:39 -0400
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B9853A40
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:30:17 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by cantor.telenet-ops.be (Postfix) with ESMTPS id 4KdqFr5msCz4x4fK
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG2700x2t8Arn01HQGY2; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000TqZ-6Q; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfTn-KF; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 19/50] pinctrl: renesas: r8a77995: Use shorthands for reserved fields
Date:   Wed, 13 Apr 2022 19:23:41 +0200
Message-Id: <7098704f89bb702c28036c567d3222521ff60f86.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 246 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77995.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 0cdf70dd9dea3c9c..71f6a4a79e3db95f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -2875,11 +2875,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 #define F_(x, y)	x,
 #define FM(x)		FN_##x,
 	{ PINMUX_CFG_REG_VAR("MOD_SEL0", 0xe6060500, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1,
-				   1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1),
+			     GROUP(-1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, -1,
+				   1, 1, 1, 1, 1, 1, -4, 1, 1, 1, 1, 1, 1),
 			     GROUP(
 		/* RESERVED 31 */
-		0, 0,
 		MOD_SEL0_30
 		MOD_SEL0_29
 		MOD_SEL0_28
@@ -2891,7 +2890,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_20_19
 		MOD_SEL0_18_17
 		/* RESERVED 16 */
-		0, 0,
 		MOD_SEL0_15
 		MOD_SEL0_14
 		MOD_SEL0_13
@@ -2899,7 +2897,6 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_11
 		MOD_SEL0_10
 		/* RESERVED 9, 8, 7, 6 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 		MOD_SEL0_5
 		MOD_SEL0_4
 		MOD_SEL0_3
@@ -2908,7 +2905,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6060504, 32,
-			     GROUP(1, 1, 1, 1, 1, 1, 2, 4, 4, 4, 4, 4, 4),
+			     GROUP(1, 1, 1, 1, 1, 1, -26),
 			     GROUP(
 		MOD_SEL1_31
 		MOD_SEL1_30
@@ -2916,20 +2913,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_28
 		MOD_SEL1_27
 		MOD_SEL1_26
-		/* RESERVED 25, 24 */
-		0, 0, 0, 0,
-		/* RESERVED 23, 22, 21, 20 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 19, 18, 17, 16 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 15, 14, 13, 12 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 11, 10, 9, 8  */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 7, 6, 5, 4  */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* RESERVED 3, 2, 1, 0  */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ))
+		/* RESERVED 25-0 */ ))
 	},
 	{ },
 };
-- 
2.25.1

