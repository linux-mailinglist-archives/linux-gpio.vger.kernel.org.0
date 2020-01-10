Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98A51136DC9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbgAJNTk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:40 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:41186 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727524AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id odKU2100B5USYZQ06dKU8Y; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007Wt-Av; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000Ht-9r; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/13] pinctrl: sh-pfc: checker: Add check for config register conflicts
Date:   Fri, 10 Jan 2020 14:19:18 +0100
Message-Id: <20200110131927.1029-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a helper to verify that register addresses are unique, and use it to
validate config register descriptors.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index fe11841e8ce81dbb..2edf6efe8dfe3fdf 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -726,8 +726,12 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
 
 #ifdef DEBUG
+#define SH_PFC_MAX_REGS		300
+
 static unsigned int sh_pfc_errors __initdata = 0;
 static unsigned int sh_pfc_warnings __initdata = 0;
+static u32 *sh_pfc_regs __initdata = NULL;
+static u32 sh_pfc_num_regs __initdata = 0;
 
 #define sh_pfc_err(fmt, ...)					 \
 	do {							 \
@@ -759,11 +763,31 @@ static bool __init same_name(const char *a, const char *b)
 	return !strcmp(a, b);
 }
 
+static void __init sh_pfc_check_reg(const char *drvname, u32 reg)
+{
+	unsigned int i;
+
+	for (i = 0; i < sh_pfc_num_regs; i++)
+		if (reg == sh_pfc_regs[i]) {
+			sh_pfc_err("reg 0x%x conflict\n", reg);
+			return;
+		}
+
+	if (sh_pfc_num_regs == SH_PFC_MAX_REGS) {
+		pr_warn_once("%s: Please increase SH_PFC_MAX_REGS\n", drvname);
+		return;
+	}
+
+	sh_pfc_regs[sh_pfc_num_regs++] = reg;
+}
+
 static void __init sh_pfc_check_cfg_reg(const char *drvname,
 					const struct pinmux_cfg_reg *cfg_reg)
 {
 	unsigned int i, n, rw, fw;
 
+	sh_pfc_check_reg(drvname, cfg_reg->reg);
+
 	if (cfg_reg->field_width) {
 		/* Checked at build time */
 		return;
@@ -794,6 +818,7 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	unsigned int i, j, k;
 
 	pr_info("Checking %s\n", drvname);
+	sh_pfc_num_regs = 0;
 
 	/* Check pins */
 	for (i = 0; i < info->nr_pins; i++) {
@@ -868,6 +893,11 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 {
 	unsigned int i;
 
+	sh_pfc_regs = kcalloc(SH_PFC_MAX_REGS, sizeof(*sh_pfc_regs),
+			      GFP_KERNEL);
+	if (!sh_pfc_regs)
+		return;
+
 	pr_warn("Checking builtin pinmux tables\n");
 
 	for (i = 0; pdrv->id_table[i].name[0]; i++)
@@ -880,6 +910,8 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 
 	pr_warn("Detected %u errors and %u warnings\n", sh_pfc_errors,
 		sh_pfc_warnings);
+
+	kfree(sh_pfc_regs);
 }
 
 #else /* !DEBUG */
-- 
2.17.1

