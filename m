Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E4347E52C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243992AbhLWO4c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239938AbhLWO4b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:31 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96595C061759
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqwU2600N4C55Sk01qwUoK; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-006aMD-Gk; Thu, 23 Dec 2021 15:56:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-003rwk-0N; Thu, 23 Dec 2021 15:56:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/10] pinctrl: renesas: Pass sh_pfc_soc_info to rcar_pin_to_bias_reg()
Date:   Thu, 23 Dec 2021 15:56:19 +0100
Message-Id: <3065a12dde606bacec9e5f14f10cabeaae75e265.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently rcar_pin_to_bias_reg() takes a struct sh_pfc pointer, which is
only available after the pin control driver has been initialized,
thus preventing the checker from calling this function for validating
consistency of the pin control tables.

Fix this by replacing the parameter by a struct sh_pfc_soc_info pointer.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77995.c |  2 +-
 drivers/pinctrl/renesas/pinctrl.c      | 14 +++++++-------
 drivers/pinctrl/renesas/sh_pfc.h       |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index e8c896f19f45e376..9fe6646bfafaf2b5 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -3058,7 +3058,7 @@ r8a77995_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
 	const struct pinmux_bias_reg *reg;
 	unsigned int bit;
 
-	reg = rcar_pin_to_bias_reg(pfc, pin, &bit);
+	reg = rcar_pin_to_bias_reg(pfc->info, pin, &bit);
 	if (!reg)
 		return reg;
 
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index f0c42c053f8e2460..1fa9431601fad209 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -835,16 +835,16 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
 }
 
 const struct pinmux_bias_reg *
-rcar_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
+rcar_pin_to_bias_reg(const struct sh_pfc_soc_info *info, unsigned int pin,
 		     unsigned int *bit)
 {
 	unsigned int i, j;
 
-	for (i = 0; pfc->info->bias_regs[i].puen || pfc->info->bias_regs[i].pud; i++) {
-		for (j = 0; j < ARRAY_SIZE(pfc->info->bias_regs[i].pins); j++) {
-			if (pfc->info->bias_regs[i].pins[j] == pin) {
+	for (i = 0; info->bias_regs[i].puen || info->bias_regs[i].pud; i++) {
+		for (j = 0; j < ARRAY_SIZE(info->bias_regs[i].pins); j++) {
+			if (info->bias_regs[i].pins[j] == pin) {
 				*bit = j;
-				return &pfc->info->bias_regs[i];
+				return &info->bias_regs[i];
 			}
 		}
 	}
@@ -859,7 +859,7 @@ unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
 	const struct pinmux_bias_reg *reg;
 	unsigned int bit;
 
-	reg = rcar_pin_to_bias_reg(pfc, pin, &bit);
+	reg = rcar_pin_to_bias_reg(pfc->info, pin, &bit);
 	if (!reg)
 		return PIN_CONFIG_BIAS_DISABLE;
 
@@ -885,7 +885,7 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	u32 enable, updown;
 	unsigned int bit;
 
-	reg = rcar_pin_to_bias_reg(pfc, pin, &bit);
+	reg = rcar_pin_to_bias_reg(pfc->info, pin, &bit);
 	if (!reg)
 		return;
 
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 7191c1c9ca959954..2bd96b28bb8b49c9 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -759,7 +759,7 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
  * Bias helpers
  */
 const struct pinmux_bias_reg *
-rcar_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
+rcar_pin_to_bias_reg(const struct sh_pfc_soc_info *info, unsigned int pin,
 		     unsigned int *bit);
 unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
 void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-- 
2.25.1

