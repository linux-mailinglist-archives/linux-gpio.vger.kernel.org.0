Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE024FFC90
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237332AbiDMR1J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237337AbiDMR05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:57 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7780E9F
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by albert.telenet-ops.be with bizsmtp
        id JHQH270092t8Arn06HQHfd; Wed, 13 Apr 2022 19:24:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj3-000TtT-3O; Wed, 13 Apr 2022 19:24:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-00DfbZ-Rm; Wed, 13 Apr 2022 19:24:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 50/50] pinctrl: renesas: checker: Add reserved field checks
Date:   Wed, 13 Apr 2022 19:24:12 +0200
Message-Id: <f5a5159ba7b396e6f09dd3f23c864a74ed8e342d.1649865241.git.geert+renesas@glider.be>
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

Add checks for discovering registers with reserved fields that could
benefit from being described using variable-width reserved field
shorthands, reducing kernel size.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 356325df9c18f2ea..340835551466235f 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -878,7 +878,7 @@ static const struct sh_pfc_pin __init *sh_pfc_find_pin(
 static void __init sh_pfc_check_cfg_reg(const char *drvname,
 					const struct pinmux_cfg_reg *cfg_reg)
 {
-	unsigned int i, n, rw;
+	unsigned int i, n, rw, r;
 	int fw;
 
 	sh_pfc_check_reg(drvname, cfg_reg->reg,
@@ -887,6 +887,15 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 	if (cfg_reg->field_width) {
 		fw = cfg_reg->field_width;
 		n = (cfg_reg->reg_width / fw) << fw;
+		for (i = 0, r = 0; i < n; i += 1 << fw) {
+			if (is0s(&cfg_reg->enum_ids[i], 1 << fw))
+				r++;
+		}
+
+		if ((r << fw) * sizeof(u16) > cfg_reg->reg_width / fw)
+			sh_pfc_warn("reg 0x%x can be described with variable-width reserved fields\n",
+				    cfg_reg->reg);
+
 		/* Skip field checks (done at build time) */
 		goto check_enum_ids;
 	}
-- 
2.25.1

