Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609DF47E534
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239898AbhLWO4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240026AbhLWO4c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:32 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B54C06175F
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id ZqwV2600J4C55Sk01qwVZA; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-006aMG-UM; Thu, 23 Dec 2021 15:56:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-003rx5-3G; Thu, 23 Dec 2021 15:56:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/10] pinctrl: renesas: checker: Validate bias configs consistency
Date:   Thu, 23 Dec 2021 15:56:22 +0100
Message-Id: <19b3e0773fbb36c015a43db683f79e75b0fec3ee.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Validate consistency of the pin control tables for pins with pull-up
and/or pull-down capabilities.  If a pin has bias register bits
declarations in bias_regs[] or through .pin_to_portcr(), the
corresponding SH_PFC_PIN_CFG_PULL* flags should be set in the pin's
configs, and vice versa, and the .get_bias() and .set_bias() callbacks
should be implemented.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 80 +++++++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 57a06b5ea17444e2..dce511a22b31de3d 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -745,6 +745,7 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 
 static unsigned int sh_pfc_errors __initdata;
 static unsigned int sh_pfc_warnings __initdata;
+static bool sh_pfc_bias_done __initdata;
 static struct {
 	u32 reg;
 	u32 bits;
@@ -758,6 +759,15 @@ static u32 sh_pfc_num_enums __initdata;
 		pr_err("%s: " fmt, drvname, ##__VA_ARGS__);	\
 		sh_pfc_errors++;				\
 	} while (0)
+
+#define sh_pfc_err_once(type, fmt, ...)				\
+	do {							\
+		if (!sh_pfc_ ## type ## _done) {		\
+			sh_pfc_ ## type ## _done = true;	\
+			sh_pfc_err(fmt, ##__VA_ARGS__);		\
+		}						\
+	} while (0)
+
 #define sh_pfc_warn(fmt, ...)					\
 	do {							\
 		pr_warn("%s: " fmt, drvname, ##__VA_ARGS__);	\
@@ -836,21 +846,22 @@ static void __init sh_pfc_check_reg_enums(const char *drvname, u32 reg,
 	}
 }
 
-static void __init sh_pfc_check_pin(const struct sh_pfc_soc_info *info,
-				    u32 reg, unsigned int pin)
+static const struct sh_pfc_pin __init *sh_pfc_find_pin(
+	const struct sh_pfc_soc_info *info, u32 reg, unsigned int pin)
 {
 	const char *drvname = info->name;
 	unsigned int i;
 
 	if (pin == SH_PFC_PIN_NONE)
-		return;
+		return NULL;
 
 	for (i = 0; i < info->nr_pins; i++) {
 		if (pin == info->pins[i].pin)
-			return;
+			return &info->pins[i];
 	}
 
 	sh_pfc_err("reg 0x%x: pin %u not found\n", reg, pin);
+	return NULL;
 }
 
 static void __init sh_pfc_check_cfg_reg(const char *drvname,
@@ -902,13 +913,15 @@ static void __init sh_pfc_check_drive_reg(const struct sh_pfc_soc_info *info,
 				 GENMASK(field->offset + field->size - 1,
 					 field->offset));
 
-		sh_pfc_check_pin(info, drive->reg, field->pin);
+		sh_pfc_find_pin(info, drive->reg, field->pin);
 	}
 }
 
 static void __init sh_pfc_check_bias_reg(const struct sh_pfc_soc_info *info,
 					 const struct pinmux_bias_reg *bias)
 {
+	const char *drvname = info->name;
+	const struct sh_pfc_pin *pin;
 	unsigned int i;
 	u32 bits;
 
@@ -920,8 +933,32 @@ static void __init sh_pfc_check_bias_reg(const struct sh_pfc_soc_info *info,
 		sh_pfc_check_reg(info->name, bias->puen, bits);
 	if (bias->pud)
 		sh_pfc_check_reg(info->name, bias->pud, bits);
-	for (i = 0; i < ARRAY_SIZE(bias->pins); i++)
-		sh_pfc_check_pin(info, bias->puen, bias->pins[i]);
+	for (i = 0; i < ARRAY_SIZE(bias->pins); i++) {
+		pin = sh_pfc_find_pin(info, bias->puen, bias->pins[i]);
+		if (!pin)
+			continue;
+
+		if (bias->puen && bias->pud) {
+			/*
+			 * Pull-enable and pull-up/down control registers
+			 * As some SoCs have pins that support only pull-up
+			 * or pull-down, we just check for one of them
+			 */
+			if (!(pin->configs & SH_PFC_PIN_CFG_PULL_UP_DOWN))
+				sh_pfc_err("bias_reg 0x%x:%u: pin %s lacks one or more SH_PFC_PIN_CFG_PULL_* flags\n",
+					   bias->puen, i, pin->name);
+		} else if (bias->puen) {
+			/* Pull-up control register only */
+			if (!(pin->configs & SH_PFC_PIN_CFG_PULL_UP))
+				sh_pfc_err("bias_reg 0x%x:%u: pin %s lacks SH_PFC_PIN_CFG_PULL_UP flag\n",
+					   bias->puen, i, pin->name);
+		} else if (bias->pud) {
+			/* Pull-down control register only */
+			if (!(pin->configs & SH_PFC_PIN_CFG_PULL_DOWN))
+				sh_pfc_err("bias_reg 0x%x:%u: pin %s lacks SH_PFC_PIN_CFG_PULL_DOWN flag\n",
+					   bias->pud, i, pin->name);
+		}
+	}
 }
 
 static void __init sh_pfc_compare_groups(const char *drvname,
@@ -963,10 +1000,12 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	pr_info("sh_pfc: Checking %s\n", drvname);
 	sh_pfc_num_regs = 0;
 	sh_pfc_num_enums = 0;
+	sh_pfc_bias_done = false;
 
 	/* Check pins */
 	for (i = 0; i < info->nr_pins; i++) {
 		const struct sh_pfc_pin *pin = &info->pins[i];
+		unsigned int x;
 
 		if (!pin->name) {
 			sh_pfc_err("empty pin %u\n", i);
@@ -988,6 +1027,33 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 					   pin->name, pin2->name,
 					   pin->enum_id);
 		}
+
+		if (pin->configs & SH_PFC_PIN_CFG_PULL_UP_DOWN) {
+			if (!info->ops || !info->ops->get_bias ||
+			    !info->ops->set_bias)
+				sh_pfc_err_once(bias, "SH_PFC_PIN_CFG_PULL_* flag set but .[gs]et_bias() not implemented\n");
+
+			if (!bias_regs &&
+			     (!info->ops || !info->ops->pin_to_portcr))
+				sh_pfc_err_once(bias, "SH_PFC_PIN_CFG_PULL_UP flag set but no bias_regs defined and .pin_to_portcr() not implemented\n");
+		}
+
+		if ((pin->configs & SH_PFC_PIN_CFG_PULL_UP_DOWN) && bias_regs) {
+			const struct pinmux_bias_reg *bias_reg =
+				rcar_pin_to_bias_reg(info, pin->pin, &x);
+
+			if (!bias_reg ||
+			    ((pin->configs & SH_PFC_PIN_CFG_PULL_UP) &&
+			     !bias_reg->puen))
+				sh_pfc_err("pin %s: SH_PFC_PIN_CFG_PULL_UP flag set but pin not in bias_regs\n",
+					   pin->name);
+
+			if (!bias_reg ||
+			    ((pin->configs & SH_PFC_PIN_CFG_PULL_DOWN) &&
+			     !bias_reg->pud))
+				sh_pfc_err("pin %s: SH_PFC_PIN_CFG_PULL_DOWN flag set but pin not in bias_regs\n",
+					   pin->name);
+		}
 	}
 
 	/* Check groups and functions */
-- 
2.25.1

