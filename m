Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B654E4BDE90
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380173AbiBUQWZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 11:22:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380102AbiBUQWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 11:22:25 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0EC1AF10
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 08:22:01 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by xavier.telenet-ops.be with bizsmtp
        id xsMz2600T3YJRAw01sMzr2; Mon, 21 Feb 2022 17:22:00 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBRn-001Tgz-Fl; Mon, 21 Feb 2022 17:21:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBRn-006Fs6-04; Mon, 21 Feb 2022 17:21:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: checker: Fix miscalculation of number of states
Date:   Mon, 21 Feb 2022 17:21:58 +0100
Message-Id: <6d8a6a05564f38f9d20464c1c17f96e52740cf6a.1645460429.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

The checker failed to validate all enum IDs in the description of a
register with fixed-width register fields, due to a miscalculation of
the number of described states: each register field of n bits can have
"1 << n" possible states, not "1".

Increase SH_PFC_MAX_ENUMS accordingly, now more enum IDs are checked
(SH-Mobile AG5 has more than 4000 enum IDs defined).

Fixes: 12d057bad683b1c6 ("pinctrl: sh-pfc: checker: Add check for enum ID conflicts")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v5.18.

 drivers/pinctrl/renesas/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 62b4c3145ba7c052..d0d4714731c14cf5 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -747,7 +747,7 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 
 #ifdef DEBUG
 #define SH_PFC_MAX_REGS		300
-#define SH_PFC_MAX_ENUMS	3000
+#define SH_PFC_MAX_ENUMS	5000
 
 static unsigned int sh_pfc_errors __initdata;
 static unsigned int sh_pfc_warnings __initdata;
@@ -881,7 +881,8 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 			 GENMASK(cfg_reg->reg_width - 1, 0));
 
 	if (cfg_reg->field_width) {
-		n = cfg_reg->reg_width / cfg_reg->field_width;
+		fw = cfg_reg->field_width;
+		n = (cfg_reg->reg_width / fw) << fw;
 		/* Skip field checks (done at build time) */
 		goto check_enum_ids;
 	}
-- 
2.25.1

