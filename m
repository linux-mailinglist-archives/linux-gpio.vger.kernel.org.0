Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBB632C79C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359089AbhCDAcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380325AbhCCN3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:29:09 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C730C061221
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:29 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by laurent.telenet-ops.be with bizsmtp
        id bpSR2400T4huzR801pSRhA; Wed, 03 Mar 2021 14:26:27 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWD-004Ps1-3U; Wed, 03 Mar 2021 14:26:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWC-00GWV6-Mi; Wed, 03 Mar 2021 14:26:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/6] pinctrl: renesas: Make sh_pfc_pin_to_bias_reg() static
Date:   Wed,  3 Mar 2021 14:26:14 +0100
Message-Id: <20210303132619.3938128-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303132619.3938128-1-geert+renesas@glider.be>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now all R-Car pin control drivers have been converted to the common
R-Car bias handling, sh_pfc_pin_to_bias_reg() is only called from a
single place.  Move it from core.c to pinctrl.c, make it static, and
rename it to rcar_pin_to_bias_reg(), as it is specific to R-Car SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c    | 20 --------------------
 drivers/pinctrl/renesas/core.h    |  4 ----
 drivers/pinctrl/renesas/pinctrl.c | 24 ++++++++++++++++++++++--
 3 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 2bfd3006f6fda445..5ccc49b387f17eb9 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -394,26 +394,6 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type)
 	return 0;
 }
 
-const struct pinmux_bias_reg *
-sh_pfc_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
-		       unsigned int *bit)
-{
-	unsigned int i, j;
-
-	for (i = 0; pfc->info->bias_regs[i].puen; i++) {
-		for (j = 0; j < ARRAY_SIZE(pfc->info->bias_regs[i].pins); j++) {
-			if (pfc->info->bias_regs[i].pins[j] == pin) {
-				*bit = j;
-				return &pfc->info->bias_regs[i];
-			}
-		}
-	}
-
-	WARN_ONCE(1, "Pin %u is not in bias info list\n", pin);
-
-	return NULL;
-}
-
 static int sh_pfc_init_ranges(struct sh_pfc *pfc)
 {
 	struct sh_pfc_pin_range *range;
diff --git a/drivers/pinctrl/renesas/core.h b/drivers/pinctrl/renesas/core.h
index 5ca7e0830ae9de38..19f7b4308fac7a8f 100644
--- a/drivers/pinctrl/renesas/core.h
+++ b/drivers/pinctrl/renesas/core.h
@@ -29,10 +29,6 @@ void sh_pfc_write(struct sh_pfc *pfc, u32 reg, u32 data);
 int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned int pin);
 int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type);
 
-const struct pinmux_bias_reg *
-sh_pfc_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
-		       unsigned int *bit);
-
 unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
 void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 			  unsigned int bias);
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index a49f74730272312e..963d217b940372b9 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -840,12 +840,32 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
 	return pinctrl_enable(pmx->pctl);
 }
 
+static const struct pinmux_bias_reg *
+rcar_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
+		     unsigned int *bit)
+{
+	unsigned int i, j;
+
+	for (i = 0; pfc->info->bias_regs[i].puen; i++) {
+		for (j = 0; j < ARRAY_SIZE(pfc->info->bias_regs[i].pins); j++) {
+			if (pfc->info->bias_regs[i].pins[j] == pin) {
+				*bit = j;
+				return &pfc->info->bias_regs[i];
+			}
+		}
+	}
+
+	WARN_ONCE(1, "Pin %u is not in bias info list\n", pin);
+
+	return NULL;
+}
+
 unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
 {
 	const struct pinmux_bias_reg *reg;
 	unsigned int bit;
 
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
+	reg = rcar_pin_to_bias_reg(pfc, pin, &bit);
 	if (!reg)
 		return PIN_CONFIG_BIAS_DISABLE;
 
@@ -864,7 +884,7 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	u32 enable, updown;
 	unsigned int bit;
 
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
+	reg = rcar_pin_to_bias_reg(pfc, pin, &bit);
 	if (!reg)
 		return;
 
-- 
2.25.1

