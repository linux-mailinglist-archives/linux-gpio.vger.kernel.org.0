Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885224FFC71
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237292AbiDMR06 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237302AbiDMR0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:45 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A34A2BC2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG270062t8Arn01HQGXR; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqE-Fb; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfUi-SM; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 26/50] pinctrl: renesas: r8a7779: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:48 +0200
Message-Id: <ecc7377d2992694226dcf055bed0b617701a3d71.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 81 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7779.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7779.c b/drivers/pinctrl/renesas/pfc-r8a7779.c
index e674549193250b3b..fcc8ea48881fb961 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7779.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7779.c
@@ -3300,13 +3300,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_5_1_FN, FN_A2,
 		GP_5_0_FN, FN_A1 ))
 	},
-	{ PINMUX_CFG_REG("GPSR6", 0xfffc001c, 32, 1, GROUP(
-		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR6", 0xfffc001c, 32,
+			     GROUP(-23, 1, 1, 1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP6_31_9 RESERVED */
 		GP_6_8_FN, FN_IP3_20,
 		GP_6_7_FN, FN_IP3_19,
 		GP_6_6_FN, FN_IP3_18,
-- 
2.25.1

