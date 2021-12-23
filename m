Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E73447E538
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239978AbhLWO4f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243954AbhLWO4c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:32 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A69C061799
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id ZqwV2600Z4C55Sk01qwV2n; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW9-006aMI-9o; Thu, 23 Dec 2021 15:56:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-003rxC-4R; Thu, 23 Dec 2021 15:56:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/10] pinctrl: renesas: checker: Validate drive strength configs consistency
Date:   Thu, 23 Dec 2021 15:56:23 +0100
Message-Id: <0d5de01b5fe2c5fd23c3bea41077dc57ad105b9e.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Validate consistency of the pin control tables for pins with drive
strength capabilities.  If a pin has drive strength register bits
declarations in drive_regs[], the SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
should be set in the pin's configs, and vice versa.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index dce511a22b31de3d..1789c96ad2aa2c79 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -746,6 +746,7 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 static unsigned int sh_pfc_errors __initdata;
 static unsigned int sh_pfc_warnings __initdata;
 static bool sh_pfc_bias_done __initdata;
+static bool sh_pfc_drive_done __initdata;
 static struct {
 	u32 reg;
 	u32 bits;
@@ -901,6 +902,8 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 static void __init sh_pfc_check_drive_reg(const struct sh_pfc_soc_info *info,
 					  const struct pinmux_drive_reg *drive)
 {
+	const char *drvname = info->name;
+	const struct sh_pfc_pin *pin;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(drive->fields); i++) {
@@ -913,7 +916,10 @@ static void __init sh_pfc_check_drive_reg(const struct sh_pfc_soc_info *info,
 				 GENMASK(field->offset + field->size - 1,
 					 field->offset));
 
-		sh_pfc_find_pin(info, drive->reg, field->pin);
+		pin = sh_pfc_find_pin(info, drive->reg, field->pin);
+		if (pin && !(pin->configs & SH_PFC_PIN_CFG_DRIVE_STRENGTH))
+			sh_pfc_err("drive_reg 0x%x: field %u: pin %s lacks SH_PFC_PIN_CFG_DRIVE_STRENGTH flag\n",
+				   drive->reg, i, pin->name);
 	}
 }
 
@@ -992,6 +998,7 @@ static void __init sh_pfc_compare_groups(const char *drvname,
 
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 {
+	const struct pinmux_drive_reg *drive_regs = info->drive_regs;
 	const struct pinmux_bias_reg *bias_regs = info->bias_regs;
 	const char *drvname = info->name;
 	unsigned int *refcnts;
@@ -1001,6 +1008,7 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	sh_pfc_num_regs = 0;
 	sh_pfc_num_enums = 0;
 	sh_pfc_bias_done = false;
+	sh_pfc_drive_done = false;
 
 	/* Check pins */
 	for (i = 0; i < info->nr_pins; i++) {
@@ -1054,6 +1062,26 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 				sh_pfc_err("pin %s: SH_PFC_PIN_CFG_PULL_DOWN flag set but pin not in bias_regs\n",
 					   pin->name);
 		}
+
+		if (pin->configs & SH_PFC_PIN_CFG_DRIVE_STRENGTH) {
+			if (!drive_regs) {
+				sh_pfc_err_once(drive, "SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but drive_regs missing\n");
+			} else {
+				for (j = 0; drive_regs[j / 8].reg; j++) {
+					if (!drive_regs[j / 8].fields[j % 8].pin &&
+					    !drive_regs[j / 8].fields[j % 8].offset &&
+					    !drive_regs[j / 8].fields[j % 8].size)
+						continue;
+
+					if (drive_regs[j / 8].fields[j % 8].pin == pin->pin)
+						break;
+				}
+
+				if (!drive_regs[j / 8].reg)
+					sh_pfc_err("pin %s: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set but not in drive_regs\n",
+						   pin->name);
+			}
+		}
 	}
 
 	/* Check groups and functions */
-- 
2.25.1

