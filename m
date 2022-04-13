Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B55024FFC77
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbiDMR07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237290AbiDMR0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:47 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9769060D3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by michel.telenet-ops.be with bizsmtp
        id JHQH2700A2t8Arn06HQHDp; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000Tsn-TC; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00Dfag-JP; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 45/50] pinctrl: renesas: sh7724: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:07 +0200
Message-Id: <696dcad42a8b8395276301eb5dd5c5a895826f35.1649865241.git.geert+renesas@glider.be>
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

Describe registers with fixed-width register fields and many reserved
fields using the PINMUX_CFG_REG_VAR() macro, as the latter supports a
shorthand not requiring dummy values.

This reduces kernel size by 8 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7724.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7724.c b/drivers/pinctrl/renesas/pfc-sh7724.c
index 551da3113ce348b8..26517ad26a0fd1b8 100644
--- a/drivers/pinctrl/renesas/pfc-sh7724.c
+++ b/drivers/pinctrl/renesas/pfc-sh7724.c
@@ -1798,9 +1798,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTF1_FN, PTF1_OUT, 0, PTF1_IN,
 		PTF0_FN, PTF0_OUT, 0, PTF0_IN ))
 	},
-	{ PINMUX_CFG_REG("PGCR", 0xa405010c, 16, 2, GROUP(
-		0, 0, 0, 0,
-		0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("PGCR", 0xa405010c, 16,
+			     GROUP(-4, 2, 2, 2, 2, 2, 2),
+			     GROUP(
+		/* RESERVED [4] */
 		PTG5_FN, PTG5_OUT, 0, 0,
 		PTG4_FN, PTG4_OUT, 0, 0,
 		PTG3_FN, PTG3_OUT, 0, 0,
-- 
2.25.1

