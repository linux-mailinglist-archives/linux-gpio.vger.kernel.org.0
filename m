Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2231F136DB7
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgAJNTd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:33 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:40262 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727500AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id odKU2100H5USYZQ01dKUaq; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007XM-IY; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000Ie-Hf; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/13] pinctrl: sh-pfc: checker: Add function GPIO checks
Date:   Fri, 10 Jan 2020 14:19:27 +0100
Message-Id: <20200110131927.1029-14-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add checks for legacy function GPIO descriptors:
  1. Function GPIOs must have a name,
  2. Names must be unique,
  3. Enum ID values must be unique.

This exposes bugs like those fixed in
  - commit 884caadad128efad ("pinctrl: sh-pfc: sh7734: Fix duplicate
    TCLK1_B"),
  - commit 55b1cb1f03ad5eea ("pinctrl: sh-pfc: sh7264: Fix CAN function
    GPIOs"),
  - commit 02aeb2f21530c98f ("pinctrl: sh-pfc: sh7269: Fix CAN function
    GPIOs"),
  - commit db9c07272c8245a2 ("sh: sh7264: Remove bogus SSU GPIO function
    definitions"),
  - commit b4fba344a2930769 ("sh: sh7269: Remove bogus SSU GPIO function
    definitions").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 34d3d210c7347336..5343729574849531 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -802,6 +802,13 @@ static int __init __sh_pfc_check_enum(const char *drvname, u16 enum_id)
 	return 0;
 }
 
+static void __init sh_pfc_check_enum(const char *drvname, const char *name,
+				     u16 enum_id)
+{
+	if (__sh_pfc_check_enum(drvname, enum_id))
+		sh_pfc_err("%s enum_id %u conflict\n", name, enum_id);
+}
+
 static void __init sh_pfc_check_reg_enums(const char *drvname, u32 reg,
 					  const u16 *enums, unsigned int n)
 {
@@ -1012,6 +1019,24 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 				       info->data_regs[i].enum_ids,
 				       info->data_regs[i].reg_width);
 	}
+
+#ifdef CONFIG_PINCTRL_SH_FUNC_GPIO
+	/* Check function GPIOs */
+	for (i = 0; i < info->nr_func_gpios; i++) {
+		const struct pinmux_func *func = &info->func_gpios[i];
+
+		if (!func->name) {
+			sh_pfc_err("empty function gpio %u\n", i);
+			continue;
+		}
+		for (j = 0; j < i; j++) {
+			if (same_name(func->name, info->func_gpios[j].name))
+				sh_pfc_err("func_gpio %s: name conflict\n",
+					   func->name);
+		}
+		sh_pfc_check_enum(drvname, func->name, func->enum_id);
+	}
+#endif
 }
 
 static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
-- 
2.17.1

