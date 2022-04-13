Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389874FFC7C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237279AbiDMR1D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237314AbiDMR0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:47 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97ADF17E00
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by michel.telenet-ops.be with bizsmtp
        id JHQH270092t8Arn06HQHDo; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj2-000TtO-TJ; Wed, 13 Apr 2022 19:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfbO-QE; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 49/50] pinctrl: renesas: sh7786: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:24:11 +0200
Message-Id: <22487451ff7d8cce0182354c9553f3b171cc34d9.1649865241.git.geert+renesas@glider.be>
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

This reduces kernel size by 79 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh7786.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7786.c b/drivers/pinctrl/renesas/pfc-sh7786.c
index 4ed31d78fe30f35f..f09f4a76901088b4 100644
--- a/drivers/pinctrl/renesas/pfc-sh7786.c
+++ b/drivers/pinctrl/renesas/pfc-sh7786.c
@@ -666,15 +666,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PD1_FN, PD1_OUT, PD1_IN, 0,
 		PD0_FN, PD0_OUT, PD0_IN, 0 ))
 	},
-	{ PINMUX_CFG_REG("PECR", 0xffcc0008, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PECR", 0xffcc0008, 16,
+			     GROUP(2, 2, -12),
+			     GROUP(
 		PE7_FN, PE7_OUT, PE7_IN, 0,
 		PE6_FN, PE6_OUT, PE6_IN, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0, ))
+		/* RESERVED [12] */ ))
 	},
 	{ PINMUX_CFG_REG("PFCR", 0xffcc000a, 16, 2, GROUP(
 		PF7_FN, PF7_OUT, PF7_IN, 0,
@@ -686,15 +683,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PF1_FN, PF1_OUT, PF1_IN, 0,
 		PF0_FN, PF0_OUT, PF0_IN, 0 ))
 	},
-	{ PINMUX_CFG_REG("PGCR", 0xffcc000c, 16, 2, GROUP(
+	{ PINMUX_CFG_REG_VAR("PGCR", 0xffcc000c, 16,
+			     GROUP(2, 2, 2, -10),
+			     GROUP(
 		PG7_FN, PG7_OUT, PG7_IN, 0,
 		PG6_FN, PG6_OUT, PG6_IN, 0,
 		PG5_FN, PG5_OUT, PG5_IN, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0,
-		0, 0, 0, 0, ))
+		/* RESERVED [10] */ ))
 	},
 	{ PINMUX_CFG_REG("PHCR", 0xffcc000e, 16, 2, GROUP(
 		PH7_FN, PH7_OUT, PH7_IN, 0,
-- 
2.25.1

