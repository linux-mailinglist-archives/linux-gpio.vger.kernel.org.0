Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC42136DC1
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgAJNTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:35 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:37022 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id odKU2100H5USYZQ01dKUsW; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007Wv-Bl; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000I7-Am; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/13] pinctrl: sh-pfc: checker: Add check for enum ID conflicts
Date:   Fri, 10 Jan 2020 14:19:19 +0100
Message-Id: <20200110131927.1029-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a helper to verify that enum IDs are unique, and use it to validate
the enum ID arrays in config register descriptors.

This exposes bugs like those fixed in:
  - commit 805f635703b2562b ("pinctrl: sh-pfc: r8a7778: Fix duplicate
    SDSELF_B and SD1_CLK_B"),
  - commit 884caadad128efad ("pinctrl: sh-pfc: sh7734: Fix duplicate
    TCLK1_B"),
  - commit 2a069a92811fb35b ("pinctrl: sh-pfc: sh7264: Fix Port K I/O
    Register 0 definition").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 49 +++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 2edf6efe8dfe3fdf..f82f483b98a25da5 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -727,11 +727,14 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 
 #ifdef DEBUG
 #define SH_PFC_MAX_REGS		300
+#define SH_PFC_MAX_ENUMS	3000
 
 static unsigned int sh_pfc_errors __initdata = 0;
 static unsigned int sh_pfc_warnings __initdata = 0;
 static u32 *sh_pfc_regs __initdata = NULL;
 static u32 sh_pfc_num_regs __initdata = 0;
+static u16 *sh_pfc_enums __initdata = NULL;
+static u32 sh_pfc_num_enums __initdata = 0;
 
 #define sh_pfc_err(fmt, ...)					 \
 	do {							 \
@@ -781,6 +784,36 @@ static void __init sh_pfc_check_reg(const char *drvname, u32 reg)
 	sh_pfc_regs[sh_pfc_num_regs++] = reg;
 }
 
+static int __init __sh_pfc_check_enum(const char *drvname, u16 enum_id)
+{
+	unsigned int i;
+
+	for (i = 0; i < sh_pfc_num_enums; i++) {
+		if (enum_id == sh_pfc_enums[i])
+			return -EINVAL;
+	}
+
+	if (sh_pfc_num_enums == SH_PFC_MAX_ENUMS) {
+		pr_warn_once("%s: Please increase SH_PFC_MAX_ENUMS\n", drvname);
+		return 0;
+	}
+
+	sh_pfc_enums[sh_pfc_num_enums++] = enum_id;
+	return 0;
+}
+
+static void __init sh_pfc_check_reg_enums(const char *drvname, u32 reg,
+					  const u16 *enums, unsigned int n)
+{
+	unsigned int i;
+
+	for (i = 0; i < n; i++) {
+		if (enums[i] && __sh_pfc_check_enum(drvname, enums[i]))
+			sh_pfc_err("reg 0x%x enum_id %u conflict\n", reg,
+				   enums[i]);
+	}
+}
+
 static void __init sh_pfc_check_cfg_reg(const char *drvname,
 					const struct pinmux_cfg_reg *cfg_reg)
 {
@@ -789,8 +822,9 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 	sh_pfc_check_reg(drvname, cfg_reg->reg);
 
 	if (cfg_reg->field_width) {
-		/* Checked at build time */
-		return;
+		n = cfg_reg->reg_width / cfg_reg->field_width;
+		/* Skip field checks (done at build time) */
+		goto check_enum_ids;
 	}
 
 	for (i = 0, n = 0, rw = 0; (fw = cfg_reg->var_field_width[i]); i++) {
@@ -808,6 +842,9 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 	if (n != cfg_reg->nr_enum_ids)
 		sh_pfc_err("reg 0x%x: enum_ids[] has %u instead of %u values\n",
 			   cfg_reg->reg, cfg_reg->nr_enum_ids, n);
+
+check_enum_ids:
+	sh_pfc_check_reg_enums(drvname, cfg_reg->reg, cfg_reg->enum_ids, n);
 }
 
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
@@ -819,6 +856,7 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 
 	pr_info("Checking %s\n", drvname);
 	sh_pfc_num_regs = 0;
+	sh_pfc_num_enums = 0;
 
 	/* Check pins */
 	for (i = 0; i < info->nr_pins; i++) {
@@ -898,6 +936,11 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 	if (!sh_pfc_regs)
 		return;
 
+	sh_pfc_enums = kcalloc(SH_PFC_MAX_ENUMS, sizeof(*sh_pfc_enums),
+			      GFP_KERNEL);
+	if (!sh_pfc_enums)
+		goto free_regs;
+
 	pr_warn("Checking builtin pinmux tables\n");
 
 	for (i = 0; pdrv->id_table[i].name[0]; i++)
@@ -911,6 +954,8 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 	pr_warn("Detected %u errors and %u warnings\n", sh_pfc_errors,
 		sh_pfc_warnings);
 
+	kfree(sh_pfc_enums);
+free_regs:
 	kfree(sh_pfc_regs);
 }
 
-- 
2.17.1

