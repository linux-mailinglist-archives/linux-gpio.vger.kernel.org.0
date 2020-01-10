Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEA5136DCD
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgAJNTl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:41 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:37028 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id odKU2100Q5USYZQ01dKUsX; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007XB-Fi; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000IR-Eg; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/13] pinctrl: sh-pfc: checker: Add drive strength register checks
Date:   Fri, 10 Jan 2020 14:19:23 +0100
Message-Id: <20200110131927.1029-10-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add checks for drive strength register descriptors:
  1. Register addresses must be unique,
  2. Register fields must be non-overlapping,
  3. Referred pins must exist.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 45 +++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 4642959714f97102..a1667a29dd69c3ff 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -814,6 +814,23 @@ static void __init sh_pfc_check_reg_enums(const char *drvname, u32 reg,
 	}
 }
 
+static void __init sh_pfc_check_pin(const struct sh_pfc_soc_info *info,
+				    u32 reg, unsigned int pin)
+{
+	const char *drvname = info->name;
+	unsigned int i;
+
+	if (pin == SH_PFC_PIN_NONE)
+		return;
+
+	for (i = 0; i < info->nr_pins; i++) {
+		if (pin == info->pins[i].pin)
+			return;
+	}
+
+	sh_pfc_err("reg 0x%x: pin %u not found\n", reg, pin);
+}
+
 static void __init sh_pfc_check_cfg_reg(const char *drvname,
 					const struct pinmux_cfg_reg *cfg_reg)
 {
@@ -847,6 +864,30 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 	sh_pfc_check_reg_enums(drvname, cfg_reg->reg, cfg_reg->enum_ids, n);
 }
 
+static void __init sh_pfc_check_drive_reg(const struct sh_pfc_soc_info *info,
+					  const struct pinmux_drive_reg *drive)
+{
+	const char *drvname = info->name;
+	unsigned long seen = 0, mask;
+	unsigned int i;
+
+	sh_pfc_check_reg(info->name, drive->reg);
+	for (i = 0; i < ARRAY_SIZE(drive->fields); i++) {
+		const struct pinmux_drive_reg_field *field = &drive->fields[i];
+
+		if (!field->pin && !field->offset && !field->size)
+			continue;
+
+		mask = GENMASK(field->offset + field->size, field->offset);
+		if (mask & seen)
+			sh_pfc_err("drive_reg 0x%x: field %u overlap\n",
+				   drive->reg, i);
+		seen |= mask;
+
+		sh_pfc_check_pin(info, drive->reg, field->pin);
+	}
+}
+
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 {
 	const char *drvname = info->name;
@@ -939,6 +980,10 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	/* Check config register descriptions */
 	for (i = 0; info->cfg_regs && info->cfg_regs[i].reg; i++)
 		sh_pfc_check_cfg_reg(drvname, &info->cfg_regs[i]);
+
+	/* Check drive strength registers */
+	for (i = 0; info->drive_regs && info->drive_regs[i].reg; i++)
+		sh_pfc_check_drive_reg(info, &info->drive_regs[i]);
 }
 
 static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
-- 
2.17.1

