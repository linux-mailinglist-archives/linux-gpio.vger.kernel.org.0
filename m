Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0927132C7B2
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444019AbhCDAcj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348841AbhCCNgy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:36:54 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EDEC061356
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by michel.telenet-ops.be with bizsmtp
        id bpSR2400P4huzR806pSRhp; Wed, 03 Mar 2021 14:26:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWD-004Ps5-H9; Wed, 03 Mar 2021 14:26:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWC-00GWVQ-Pg; Wed, 03 Mar 2021 14:26:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/6] pinctrl: renesas: Add support for R-Car SoCs with pull-down only pins
Date:   Wed,  3 Mar 2021 14:26:18 +0100
Message-Id: <20210303132619.3938128-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303132619.3938128-1-geert+renesas@glider.be>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, the common R-Car bias handling supports pin controllers with
either:
  1. Separate pin Pull-Enable (PUEN) and pin Pull-Up/Down control (PUD)
     registers, for controlling both pin pull-up and pin pull-down,
  2. A single pin Pull-Up control register (PUPR), for controlling pin
     pull-up.

Add support for a variant of #2, where some bits in the single pin
Pull-Up control register (PUPR) control pin pull-down instead of pin
pull-up.  This is the case for the "ASEBRK#/ACK" pin on R-Car M2-W,
M2-N, and E2, and the "ACK" pin on RZ/G1M, RZ/G1N, RZ/G1E, and RZ/G1C.
To describe such a register, SoC-specific drivers need to provide two
instances of pinmux_bias_reg: a first one with the puen field filled in,
listing pins with pull-up functionality, and a second one with the pud
field filled in, listing pins with pull-down functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pinctrl.c | 49 ++++++++++++++++++++-----------
 drivers/pinctrl/renesas/sh_pfc.h  |  4 +--
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index b7ebbc877b544305..bb488af298623407 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -847,7 +847,7 @@ rcar_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
 {
 	unsigned int i, j;
 
-	for (i = 0; pfc->info->bias_regs[i].puen; i++) {
+	for (i = 0; pfc->info->bias_regs[i].puen || pfc->info->bias_regs[i].pud; i++) {
 		for (j = 0; j < ARRAY_SIZE(pfc->info->bias_regs[i].pins); j++) {
 			if (pfc->info->bias_regs[i].pins[j] == pin) {
 				*bit = j;
@@ -870,12 +870,19 @@ unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
 	if (!reg)
 		return PIN_CONFIG_BIAS_DISABLE;
 
-	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
-		return PIN_CONFIG_BIAS_DISABLE;
-	else if (!reg->pud || (sh_pfc_read(pfc, reg->pud) & BIT(bit)))
-		return PIN_CONFIG_BIAS_PULL_UP;
-	else
-		return PIN_CONFIG_BIAS_PULL_DOWN;
+	if (reg->puen) {
+		if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
+			return PIN_CONFIG_BIAS_DISABLE;
+		else if (!reg->pud || (sh_pfc_read(pfc, reg->pud) & BIT(bit)))
+			return PIN_CONFIG_BIAS_PULL_UP;
+		else
+			return PIN_CONFIG_BIAS_PULL_DOWN;
+	} else {
+		if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
+			return PIN_CONFIG_BIAS_PULL_DOWN;
+		else
+			return PIN_CONFIG_BIAS_DISABLE;
+	}
 }
 
 void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
@@ -889,19 +896,27 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	if (!reg)
 		return;
 
-	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
-	if (bias != PIN_CONFIG_BIAS_DISABLE)
-		enable |= BIT(bit);
+	if (reg->puen) {
+		enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
+		if (bias != PIN_CONFIG_BIAS_DISABLE)
+			enable |= BIT(bit);
 
-	if (reg->pud) {
-		updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-		if (bias == PIN_CONFIG_BIAS_PULL_UP)
-			updown |= BIT(bit);
+		if (reg->pud) {
+			updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
+			if (bias == PIN_CONFIG_BIAS_PULL_UP)
+				updown |= BIT(bit);
 
-		sh_pfc_write(pfc, reg->pud, updown);
-	}
+			sh_pfc_write(pfc, reg->pud, updown);
+		}
 
-	sh_pfc_write(pfc, reg->puen, enable);
+		sh_pfc_write(pfc, reg->puen, enable);
+	} else {
+		enable = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
+		if (bias == PIN_CONFIG_BIAS_PULL_DOWN)
+			enable |= BIT(bit);
+
+		sh_pfc_write(pfc, reg->pud, enable);
+	}
 }
 
 #define PORTnCR_PULMD_OFF	(0 << 6)
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index fc8391712af8cf4b..320898861c4b4c56 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -188,9 +188,9 @@ struct pinmux_drive_reg {
 	.reg = r, \
 	.fields =
 
-struct pinmux_bias_reg {
+struct pinmux_bias_reg {	/* At least one of puen/pud must exist */
 	u32 puen;		/* Pull-enable or pull-up control register */
-	u32 pud;		/* Pull-up/down control register (optional) */
+	u32 pud;		/* Pull-up/down or pull-down control register */
 	const u16 pins[32];
 };
 
-- 
2.25.1

