Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE57C4FFAB5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 17:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbiDMP4N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 11:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbiDMP4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 11:56:12 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8853E65486
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 08:53:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JFtl270092t8Arn01Ftlsi; Wed, 13 Apr 2022 17:53:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nefJR-000TJl-CT; Wed, 13 Apr 2022 17:53:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nefJQ-00Dero-UL; Wed, 13 Apr 2022 17:53:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: checker: Fix for drive reg field increase
Date:   Wed, 13 Apr 2022 17:53:43 +0200
Message-Id: <e44426a99b20e5f5681ede894d08e36870bcb47f.1649865163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

With CONFIG_DEBUG_PINCTRL=y:

    r8a774c0_pfc: pin GP_4_3: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but not in drive_regs
    r8a774c0_pfc: pin GP_4_4: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but not in drive_regs
    ...
    r8a77990_pfc: pin GP_4_3: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but not in drive_regs
    r8a77990_pfc: pin GP_4_4: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but not in drive_regs

This happens because the checker still uses the old number of fields.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be folded into commit d5c9688095d29a6c ("pinctrl: renesas: Allow up
to 10 fields for drive_regs") in renesas-pinctrl-for-v5.19.

Ideally, some iterator or index helper should be introduced.
---
 drivers/pinctrl/renesas/core.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index d0d4714731c14cf5..dae2201a62dc8f8b 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1076,17 +1076,17 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 			if (!drive_regs) {
 				sh_pfc_err_once(drive, "SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but drive_regs missing\n");
 			} else {
-				for (j = 0; drive_regs[j / 8].reg; j++) {
-					if (!drive_regs[j / 8].fields[j % 8].pin &&
-					    !drive_regs[j / 8].fields[j % 8].offset &&
-					    !drive_regs[j / 8].fields[j % 8].size)
+				for (j = 0; drive_regs[j / 10].reg; j++) {
+					if (!drive_regs[j / 10].fields[j % 10].pin &&
+					    !drive_regs[j / 10].fields[j % 10].offset &&
+					    !drive_regs[j / 10].fields[j % 10].size)
 						continue;
 
-					if (drive_regs[j / 8].fields[j % 8].pin == pin->pin)
+					if (drive_regs[j / 10].fields[j % 10].pin == pin->pin)
 						break;
 				}
 
-				if (!drive_regs[j / 8].reg)
+				if (!drive_regs[j / 10].reg)
 					sh_pfc_err("pin %s: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but not in drive_regs\n",
 						   pin->name);
 			}
@@ -1164,20 +1164,20 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	for (i = 0; drive_regs && drive_regs[i].reg; i++)
 		sh_pfc_check_drive_reg(info, &drive_regs[i]);
 
-	for (i = 0; drive_regs && drive_regs[i / 8].reg; i++) {
-		if (!drive_regs[i / 8].fields[i % 8].pin &&
-		    !drive_regs[i / 8].fields[i % 8].offset &&
-		    !drive_regs[i / 8].fields[i % 8].size)
+	for (i = 0; drive_regs && drive_regs[i / 10].reg; i++) {
+		if (!drive_regs[i / 10].fields[i % 10].pin &&
+		    !drive_regs[i / 10].fields[i % 10].offset &&
+		    !drive_regs[i / 10].fields[i % 10].size)
 			continue;
 
 		for (j = 0; j < i; j++) {
-			if (drive_regs[i / 8].fields[i % 8].pin ==
-			    drive_regs[j / 8].fields[j % 8].pin &&
-			    drive_regs[j / 8].fields[j % 8].offset &&
-			    drive_regs[j / 8].fields[j % 8].size) {
+			if (drive_regs[i / 10].fields[i % 10].pin ==
+			    drive_regs[j / 10].fields[j % 10].pin &&
+			    drive_regs[j / 10].fields[j % 10].offset &&
+			    drive_regs[j / 10].fields[j % 10].size) {
 				sh_pfc_err("drive_reg 0x%x:%u/0x%x:%u: pin conflict\n",
-					   drive_regs[i / 8].reg, i % 8,
-					   drive_regs[j / 8].reg, j % 8);
+					   drive_regs[i / 10].reg, i % 10,
+					   drive_regs[j / 10].reg, j % 10);
 			}
 		}
 	}
-- 
2.25.1

