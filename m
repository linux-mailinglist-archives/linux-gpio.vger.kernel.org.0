Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E366425594
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242088AbhJGOky (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 10:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242097AbhJGOkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 10:40:51 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4557C061746
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 07:38:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cc6:af5d:7a02:2753])
        by michel.telenet-ops.be with bizsmtp
        id 32eu2600A1WYgkx062eucW; Thu, 07 Oct 2021 16:38:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXu-002n74-3D; Thu, 07 Oct 2021 16:38:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-006mJI-8y; Thu, 07 Oct 2021 16:38:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] pinctrl: renesas: checker: Move overlapping field check
Date:   Thu,  7 Oct 2021 16:38:48 +0200
Message-Id: <9d75057200890bbf31e226ffcc4514ecc5bc2c34.1633615652.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633615652.git.geert+renesas@glider.be>
References: <cover.1633615652.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the check for overlapping drive register fields from
sh_pfc_check_drive_reg() to sh_pfc_check_reg(), so it can be used for
other register types, too.  This requires passing the covered register
bits to sh_pfc_check_reg().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 55 +++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 464d07ead56879fc..ab8bdb81e8df5069 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -745,7 +745,10 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 
 static unsigned int sh_pfc_errors __initdata;
 static unsigned int sh_pfc_warnings __initdata;
-static u32 *sh_pfc_regs __initdata;
+static struct {
+	u32 reg;
+	u32 bits;
+} *sh_pfc_regs __initdata;
 static u32 sh_pfc_num_regs __initdata;
 static u16 *sh_pfc_enums __initdata;
 static u32 sh_pfc_num_enums __initdata;
@@ -780,22 +783,30 @@ static bool __init same_name(const char *a, const char *b)
 	return !strcmp(a, b);
 }
 
-static void __init sh_pfc_check_reg(const char *drvname, u32 reg)
+static void __init sh_pfc_check_reg(const char *drvname, u32 reg, u32 bits)
 {
 	unsigned int i;
 
-	for (i = 0; i < sh_pfc_num_regs; i++)
-		if (reg == sh_pfc_regs[i]) {
-			sh_pfc_err("reg 0x%x conflict\n", reg);
-			return;
-		}
+	for (i = 0; i < sh_pfc_num_regs; i++) {
+		if (reg != sh_pfc_regs[i].reg)
+			continue;
+
+		if (bits & sh_pfc_regs[i].bits)
+			sh_pfc_err("reg 0x%x: bits 0x%x conflict\n", reg,
+				   bits & sh_pfc_regs[i].bits);
+
+		sh_pfc_regs[i].bits |= bits;
+		return;
+	}
 
 	if (sh_pfc_num_regs == SH_PFC_MAX_REGS) {
 		pr_warn_once("%s: Please increase SH_PFC_MAX_REGS\n", drvname);
 		return;
 	}
 
-	sh_pfc_regs[sh_pfc_num_regs++] = reg;
+	sh_pfc_regs[sh_pfc_num_regs].reg = reg;
+	sh_pfc_regs[sh_pfc_num_regs].bits = bits;
+	sh_pfc_num_regs++;
 }
 
 static int __init sh_pfc_check_enum(const char *drvname, u16 enum_id)
@@ -850,7 +861,8 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 {
 	unsigned int i, n, rw, fw;
 
-	sh_pfc_check_reg(drvname, cfg_reg->reg);
+	sh_pfc_check_reg(drvname, cfg_reg->reg,
+			 GENMASK(cfg_reg->reg_width - 1, 0));
 
 	if (cfg_reg->field_width) {
 		n = cfg_reg->reg_width / cfg_reg->field_width;
@@ -881,22 +893,17 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 static void __init sh_pfc_check_drive_reg(const struct sh_pfc_soc_info *info,
 					  const struct pinmux_drive_reg *drive)
 {
-	const char *drvname = info->name;
-	unsigned long seen = 0, mask;
 	unsigned int i;
 
-	sh_pfc_check_reg(info->name, drive->reg);
 	for (i = 0; i < ARRAY_SIZE(drive->fields); i++) {
 		const struct pinmux_drive_reg_field *field = &drive->fields[i];
 
 		if (!field->pin && !field->offset && !field->size)
 			continue;
 
-		mask = GENMASK(field->offset + field->size - 1, field->offset);
-		if (mask & seen)
-			sh_pfc_err("drive_reg 0x%x: field %u overlap\n",
-				   drive->reg, i);
-		seen |= mask;
+		sh_pfc_check_reg(info->name, drive->reg,
+				 GENMASK(field->offset + field->size - 1,
+					 field->offset));
 
 		sh_pfc_check_pin(info, drive->reg, field->pin);
 	}
@@ -906,10 +913,15 @@ static void __init sh_pfc_check_bias_reg(const struct sh_pfc_soc_info *info,
 					 const struct pinmux_bias_reg *bias)
 {
 	unsigned int i;
+	u32 bits;
+
+	for (i = 0, bits = 0; i < ARRAY_SIZE(bias->pins); i++)
+		if (bias->pins[i] != SH_PFC_PIN_NONE)
+			bits |= BIT(i);
 
-	sh_pfc_check_reg(info->name, bias->puen);
+	sh_pfc_check_reg(info->name, bias->puen, bits);
 	if (bias->pud)
-		sh_pfc_check_reg(info->name, bias->pud);
+		sh_pfc_check_reg(info->name, bias->pud, bits);
 	for (i = 0; i < ARRAY_SIZE(bias->pins); i++)
 		sh_pfc_check_pin(info, bias->puen, bias->pins[i]);
 }
@@ -1017,11 +1029,12 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 
 	/* Check ioctrl registers */
 	for (i = 0; info->ioctrl_regs && info->ioctrl_regs[i].reg; i++)
-		sh_pfc_check_reg(drvname, info->ioctrl_regs[i].reg);
+		sh_pfc_check_reg(drvname, info->ioctrl_regs[i].reg, U32_MAX);
 
 	/* Check data registers */
 	for (i = 0; info->data_regs && info->data_regs[i].reg; i++) {
-		sh_pfc_check_reg(drvname, info->data_regs[i].reg);
+		sh_pfc_check_reg(drvname, info->data_regs[i].reg,
+				 GENMASK(info->data_regs[i].reg_width - 1, 0));
 		sh_pfc_check_reg_enums(drvname, info->data_regs[i].reg,
 				       info->data_regs[i].enum_ids,
 				       info->data_regs[i].reg_width);
-- 
2.25.1

