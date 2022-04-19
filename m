Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7225B506686
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 10:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244107AbiDSILU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 04:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243633AbiDSILT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 04:11:19 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD3A2558F
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 01:08:36 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:4e4:402f:1025:9028])
        by laurent.telenet-ops.be with bizsmtp
        id LY8a2700G14lGwr01Y8akJ; Tue, 19 Apr 2022 10:08:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ngiuY-001Gnj-EZ; Tue, 19 Apr 2022 10:08:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ngiuX-0038mI-Po; Tue, 19 Apr 2022 10:08:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] pinctrl: renesas: checker: Rework drive and bias pin iteration
Date:   Tue, 19 Apr 2022 10:08:32 +0200
Message-Id: <5051ae56a1388ccf2d283dfc9624de2991cce914.1650355619.git.geert+renesas@glider.be>
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

The checker code to iterate over all drive strength and bias register
description items is cumbersome, due to the repeated calculation of
indices, and the use of hardcoded array sizes.  The latter was done
under the assumption they would never need to be changed, which turned
out to be false.

Increase readability by introducing helper macros to access drive
strength and bias register description items.
Increase maintainability by replacing hardcoded numbers by array sizes
calculated at compile-time.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Add and use drive_ofs() and bias_ofs() helpers, as suggested by
    Wolfram,

v2:
  - Replace "pinctrl: renesas: checker: Fix for drive reg field
    increase" by independent proper solution.

To be inserted into renesas-pinctrl-for-v5.19 before commit
d5c9688095d29a6c ("pinctrl: renesas: Allow up to 10 fields for
drive_regs") in renesas-pinctrl-for-v5.19.
---
 drivers/pinctrl/renesas/core.c | 61 ++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index d0d4714731c14cf5..d3515d09a0818422 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1007,7 +1007,18 @@ static void __init sh_pfc_compare_groups(const char *drvname,
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 {
 	const struct pinmux_drive_reg *drive_regs = info->drive_regs;
+#define drive_nfields	ARRAY_SIZE(drive_regs->fields)
+#define drive_ofs(i)	drive_regs[(i) / drive_nfields]
+#define drive_reg(i)	drive_ofs(i).reg
+#define drive_bit(i)	((i) % drive_nfields)
+#define drive_field(i)	drive_ofs(i).fields[drive_bit(i)]
 	const struct pinmux_bias_reg *bias_regs = info->bias_regs;
+#define bias_npins	ARRAY_SIZE(bias_regs->pins)
+#define bias_ofs(i)	bias_regs[(i) / bias_npins]
+#define bias_puen(i)	bias_ofs(i).puen
+#define bias_pud(i)	bias_ofs(i).pud
+#define bias_bit(i)	((i) % bias_npins)
+#define bias_pin(i)	bias_ofs(i).pins[bias_bit(i)]
 	const char *drvname = info->name;
 	unsigned int *refcnts;
 	unsigned int i, j, k;
@@ -1076,17 +1087,17 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 			if (!drive_regs) {
 				sh_pfc_err_once(drive, "SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but drive_regs missing\n");
 			} else {
-				for (j = 0; drive_regs[j / 8].reg; j++) {
-					if (!drive_regs[j / 8].fields[j % 8].pin &&
-					    !drive_regs[j / 8].fields[j % 8].offset &&
-					    !drive_regs[j / 8].fields[j % 8].size)
+				for (j = 0; drive_reg(j); j++) {
+					if (!drive_field(j).pin &&
+					    !drive_field(j).offset &&
+					    !drive_field(j).size)
 						continue;
 
-					if (drive_regs[j / 8].fields[j % 8].pin == pin->pin)
+					if (drive_field(j).pin == pin->pin)
 						break;
 				}
 
-				if (!drive_regs[j / 8].reg)
+				if (!drive_reg(j))
 					sh_pfc_err("pin %s: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but not in drive_regs\n",
 						   pin->name);
 			}
@@ -1164,20 +1175,17 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	for (i = 0; drive_regs && drive_regs[i].reg; i++)
 		sh_pfc_check_drive_reg(info, &drive_regs[i]);
 
-	for (i = 0; drive_regs && drive_regs[i / 8].reg; i++) {
-		if (!drive_regs[i / 8].fields[i % 8].pin &&
-		    !drive_regs[i / 8].fields[i % 8].offset &&
-		    !drive_regs[i / 8].fields[i % 8].size)
+	for (i = 0; drive_regs && drive_reg(i); i++) {
+		if (!drive_field(i).pin && !drive_field(i).offset &&
+		    !drive_field(i).size)
 			continue;
 
 		for (j = 0; j < i; j++) {
-			if (drive_regs[i / 8].fields[i % 8].pin ==
-			    drive_regs[j / 8].fields[j % 8].pin &&
-			    drive_regs[j / 8].fields[j % 8].offset &&
-			    drive_regs[j / 8].fields[j % 8].size) {
+			if (drive_field(i).pin == drive_field(j).pin &&
+			    drive_field(j).offset && drive_field(j).size) {
 				sh_pfc_err("drive_reg 0x%x:%u/0x%x:%u: pin conflict\n",
-					   drive_regs[i / 8].reg, i % 8,
-					   drive_regs[j / 8].reg, j % 8);
+					   drive_reg(i), drive_bit(i),
+					   drive_reg(j), drive_bit(j));
 			}
 		}
 	}
@@ -1186,26 +1194,23 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	for (i = 0; bias_regs && (bias_regs[i].puen || bias_regs[i].pud); i++)
 		sh_pfc_check_bias_reg(info, &bias_regs[i]);
 
-	for (i = 0; bias_regs &&
-		    (bias_regs[i / 32].puen || bias_regs[i / 32].pud); i++) {
-		if (bias_regs[i / 32].pins[i % 32] == SH_PFC_PIN_NONE)
+	for (i = 0; bias_regs && (bias_puen(i) || bias_pud(i)); i++) {
+		if (bias_pin(i) == SH_PFC_PIN_NONE)
 			continue;
 
 		for (j = 0; j < i; j++) {
-			if (bias_regs[i / 32].pins[i % 32] !=
-			    bias_regs[j / 32].pins[j % 32])
+			if (bias_pin(i) != bias_pin(j))
 				continue;
 
-			if (bias_regs[i / 32].puen && bias_regs[j / 32].puen)
+			if (bias_puen(i) && bias_puen(j))
 				sh_pfc_err("bias_reg 0x%x:%u/0x%x:%u: pin conflict\n",
-					   bias_regs[i / 32].puen, i % 32,
-					   bias_regs[j / 32].puen, j % 32);
-			if (bias_regs[i / 32].pud && bias_regs[j / 32].pud)
+					   bias_puen(i), bias_bit(i),
+					   bias_puen(j), bias_bit(j));
+			if (bias_pud(i) && bias_pud(j))
 				sh_pfc_err("bias_reg 0x%x:%u/0x%x:%u: pin conflict\n",
-					   bias_regs[i / 32].pud, i % 32,
-					   bias_regs[j / 32].pud, j % 32);
+					   bias_pud(i), bias_bit(i),
+					   bias_pud(j), bias_bit(j));
 		}
-
 	}
 
 	/* Check ioctrl registers */
-- 
2.25.1

