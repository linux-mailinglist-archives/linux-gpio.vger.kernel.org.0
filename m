Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECD1136DAB
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgAJNTb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:31 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:41202 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727763AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id odKU2100C5USYZQ06dKU8Z; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007Wn-9O; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000Hm-8c; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/13] pinctrl: sh-pfc: checker: Add helpers for reporting
Date:   Fri, 10 Jan 2020 14:19:16 +0100
Message-Id: <20200110131927.1029-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add helpers to report errors and warnings, and to increase the
corresponding counters.  This simplifies callers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 96 ++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 52 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index a565effbff12f5a9..45bdaf88819fa498 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -729,6 +729,17 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 static unsigned int sh_pfc_errors __initdata = 0;
 static unsigned int sh_pfc_warnings __initdata = 0;
 
+#define sh_pfc_err(fmt, ...)					 \
+	do {							 \
+		pr_err("%s: " fmt, drvname, ##__VA_ARGS__);	\
+		sh_pfc_errors++;				\
+	} while (0)
+#define sh_pfc_warn(fmt, ...)					 \
+	do {							 \
+		pr_warn("%s: " fmt, drvname, ##__VA_ARGS__);	\
+		sh_pfc_warnings++;				\
+	} while (0)
+
 static bool __init is0s(const u16 *enum_ids, unsigned int n)
 {
 	unsigned int i;
@@ -751,26 +762,20 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 	}
 
 	for (i = 0, n = 0, rw = 0; (fw = cfg_reg->var_field_width[i]); i++) {
-		if (fw > 3 && is0s(&cfg_reg->enum_ids[n], 1 << fw)) {
-			pr_warn("%s: reg 0x%x: reserved field [%u:%u] can be split to reduce table size\n",
-				drvname, cfg_reg->reg, rw, rw + fw - 1);
-			sh_pfc_warnings++;
-		}
+		if (fw > 3 && is0s(&cfg_reg->enum_ids[n], 1 << fw))
+			sh_pfc_warn("reg 0x%x: reserved field [%u:%u] can be split to reduce table size\n",
+				    cfg_reg->reg, rw, rw + fw - 1);
 		n += 1 << fw;
 		rw += fw;
 	}
 
-	if (rw != cfg_reg->reg_width) {
-		pr_err("%s: reg 0x%x: var_field_width declares %u instead of %u bits\n",
-		       drvname, cfg_reg->reg, rw, cfg_reg->reg_width);
-		sh_pfc_errors++;
-	}
+	if (rw != cfg_reg->reg_width)
+		sh_pfc_err("reg 0x%x: var_field_width declares %u instead of %u bits\n",
+			   cfg_reg->reg, rw, cfg_reg->reg_width);
 
-	if (n != cfg_reg->nr_enum_ids) {
-		pr_err("%s: reg 0x%x: enum_ids[] has %u instead of %u values\n",
-		       drvname, cfg_reg->reg, cfg_reg->nr_enum_ids, n);
-		sh_pfc_errors++;
-	}
+	if (n != cfg_reg->nr_enum_ids)
+		sh_pfc_err("reg 0x%x: enum_ids[] has %u instead of %u values\n",
+			   cfg_reg->reg, cfg_reg->nr_enum_ids, n);
 }
 
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
@@ -785,29 +790,24 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	/* Check pins */
 	for (i = 0; i < info->nr_pins; i++) {
 		for (j = 0; j < i; j++) {
-			if (!strcmp(info->pins[i].name, info->pins[j].name)) {
-				pr_err("%s: pin %s/%s: name conflict\n",
-				       drvname, info->pins[i].name,
-				       info->pins[j].name);
-				sh_pfc_errors++;
-			}
+			if (!strcmp(info->pins[i].name, info->pins[j].name))
+				sh_pfc_err("pin %s/%s: name conflict\n",
+					   info->pins[i].name,
+					   info->pins[j].name);
 
 			if (info->pins[i].pin != (u16)-1 &&
-			    info->pins[i].pin == info->pins[j].pin) {
-				pr_err("%s: pin %s/%s: pin %u conflict\n",
-				       drvname, info->pins[i].name,
-				       info->pins[j].name, info->pins[i].pin);
-				sh_pfc_errors++;
-			}
+			    info->pins[i].pin == info->pins[j].pin)
+				sh_pfc_err("pin %s/%s: pin %u conflict\n",
+					   info->pins[i].name,
+					   info->pins[j].name,
+					   info->pins[i].pin);
 
 			if (info->pins[i].enum_id &&
-			    info->pins[i].enum_id == info->pins[j].enum_id) {
-				pr_err("%s: pin %s/%s: enum_id %u conflict\n",
-				       drvname, info->pins[i].name,
-				       info->pins[j].name,
-				       info->pins[i].enum_id);
-				sh_pfc_errors++;
-			}
+			    info->pins[i].enum_id == info->pins[j].enum_id)
+				sh_pfc_err("pin %s/%s: enum_id %u conflict\n",
+					   info->pins[i].name,
+					   info->pins[j].name,
+					   info->pins[i].enum_id);
 		}
 	}
 
@@ -819,8 +819,7 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	for (i = 0; i < info->nr_functions; i++) {
 		func = &info->functions[i];
 		if (!func->name) {
-			pr_err("%s: empty function %u\n", drvname, i);
-			sh_pfc_errors++;
+			sh_pfc_err("empty function %u\n", i);
 			continue;
 		}
 		for (j = 0; j < func->nr_groups; j++) {
@@ -833,29 +832,22 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 				}
 			}
 
-			if (k == info->nr_groups) {
-				pr_err("%s: function %s: group %s not found\n",
-				       drvname, func->name, func->groups[j]);
-				sh_pfc_errors++;
-			}
+			if (k == info->nr_groups)
+				sh_pfc_err("function %s: group %s not found\n",
+					   func->name, func->groups[j]);
 		}
 	}
 
 	for (i = 0; i < info->nr_groups; i++) {
 		if (!info->groups[i].name) {
-			pr_err("%s: empty group %u\n", drvname, i);
-			sh_pfc_errors++;
+			sh_pfc_err("empty group %u\n", i);
 			continue;
 		}
-		if (!refcnts[i]) {
-			pr_err("%s: orphan group %s\n", drvname,
-			       info->groups[i].name);
-			sh_pfc_errors++;
-		} else if (refcnts[i] > 1) {
-			pr_warn("%s: group %s referenced by %u functions\n",
-				drvname, info->groups[i].name, refcnts[i]);
-			sh_pfc_warnings++;
-		}
+		if (!refcnts[i])
+			sh_pfc_err("orphan group %s\n", info->groups[i].name);
+		else if (refcnts[i] > 1)
+			sh_pfc_warn("group %s referenced by %u functions\n",
+				    info->groups[i].name, refcnts[i]);
 	}
 
 	kfree(refcnts);
-- 
2.17.1

