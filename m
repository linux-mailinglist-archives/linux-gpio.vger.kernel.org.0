Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93B1D4FFCCB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235818AbiDMRdx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237368AbiDMRds (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:33:48 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0283674EB
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:31:25 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4KdqFs0Ggyz4xlWZ
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:17 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG2701A2t8Arn01HQGYC; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000Tsu-Da; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00Dfan-L6; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 46/50] pinctrl: renesas: sh7734: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:08 +0200
Message-Id: <18e476c0a9f0af5b5d511d1c4922c6e299d1847a.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 161 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7734.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7734.c b/drivers/pinctrl/renesas/pfc-sh7734.c
index 54f60b37c211e039..106a500ad13d160e 100644
--- a/drivers/pinctrl/renesas/pfc-sh7734.c
+++ b/drivers/pinctrl/renesas/pfc-sh7734.c
@@ -1805,16 +1805,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_4_1_FN, FN_IP9_21_20,
 		GP_4_0_FN, FN_IP9_19_18 ))
 	},
-	{ PINMUX_CFG_REG("GPSR5", 0xFFFC0018, 32, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, /* 31 - 28 */
-		0, 0, 0, 0, 0, 0, 0, 0, /* 27 - 24 */
-		0, 0, 0, 0, 0, 0, 0, 0, /* 23 - 20 */
-		0, 0, 0, 0, 0, 0, 0, 0, /* 19 - 16 */
-		0, 0, 0, 0, 0, 0, 0, 0, /* 15 - 12 */
+	{ PINMUX_CFG_REG_VAR("GPSR5", 0xFFFC0018, 32,
+			     GROUP(-20, 1, 1, -6, 1, 1, 1, 1),
+			     GROUP(
+		/* GP5_31_12 RESERVED */
 		GP_5_11_FN, FN_IP10_29_28,
 		GP_5_10_FN, FN_IP10_27_26,
-		0, 0, 0, 0, 0, 0, 0, 0, /* 9 - 6 */
-		0, 0, 0, 0, /* 5, 4 */
+		/* GP5_9_4 RESERVED */
 		GP_5_3_FN, FN_IRQ3_B,
 		GP_5_2_FN, FN_IRQ2_B,
 		GP_5_1_FN, FN_IP11_3,
@@ -2352,10 +2349,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	},
 	{ PINMUX_CFG_REG("INOUTSEL4", 0xFFC44004, 32, 1, GROUP(GP_INOUTSEL(4)))
 	},
-	{ PINMUX_CFG_REG("INOUTSEL5", 0xffc45004, 32, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 31 - 24 */
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 23 - 16 */
-		0, 0, 0, 0, 0, 0, 0, 0, /* 15 - 12 */
+	{ PINMUX_CFG_REG_VAR("INOUTSEL5", 0xffc45004, 32,
+			     GROUP(-20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP5_31_12 RESERVED */
 		GP_5_11_IN, GP_5_11_OUT,
 		GP_5_10_IN, GP_5_10_OUT,
 		GP_5_9_IN, GP_5_9_OUT,
-- 
2.25.1

