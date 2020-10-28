Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2398929D72D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732595AbgJ1WV5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732588AbgJ1WV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:21:56 -0400
X-Greylist: delayed 1497 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 28 Oct 2020 15:21:55 PDT
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [IPv6:2a02:1800:110:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0073AC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:21:55 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLsc85xmxzMv7nZ
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:16:40 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id lTGg230054C55Sk01TGgH2; Wed, 28 Oct 2020 16:16:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-000pDd-PD; Wed, 28 Oct 2020 16:16:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-007H97-9X; Wed, 28 Oct 2020 16:16:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/8] pinctrl: renesas: Factor out common R-Car Gen3 bias handling
Date:   Wed, 28 Oct 2020 16:16:34 +0100
Message-Id: <20201028151637.1734130-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
References: <20201028151637.1734130-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All pin control drivers for R-Car Gen3 SoCs contain identical bias
handling.  Reduce code duplication by moving it to the common pinctrl.c
code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.h         |  4 +++
 drivers/pinctrl/renesas/pfc-r8a77950.c | 45 ++------------------------
 drivers/pinctrl/renesas/pfc-r8a77951.c | 45 ++------------------------
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 45 ++------------------------
 drivers/pinctrl/renesas/pfc-r8a77965.c | 45 ++------------------------
 drivers/pinctrl/renesas/pfc-r8a77990.c | 45 ++------------------------
 drivers/pinctrl/renesas/pinctrl.c      | 40 +++++++++++++++++++++++
 7 files changed, 54 insertions(+), 215 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.h b/drivers/pinctrl/renesas/core.h
index b5b1d163e98ab8d4..5ca7e0830ae9de38 100644
--- a/drivers/pinctrl/renesas/core.h
+++ b/drivers/pinctrl/renesas/core.h
@@ -33,4 +33,8 @@ const struct pinmux_bias_reg *
 sh_pfc_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
 		       unsigned int *bit);
 
+unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
+void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
+			  unsigned int bias);
+
 #endif /* __SH_PFC_CORE_H__ */
diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index 04812e62f3a476a8..32b66b9999b871eb 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -5820,51 +5820,10 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static unsigned int r8a77950_pinmux_get_bias(struct sh_pfc *pfc,
-					     unsigned int pin)
-{
-	const struct pinmux_bias_reg *reg;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return PIN_CONFIG_BIAS_DISABLE;
-
-	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
-		return PIN_CONFIG_BIAS_DISABLE;
-	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
-		return PIN_CONFIG_BIAS_PULL_UP;
-	else
-		return PIN_CONFIG_BIAS_PULL_DOWN;
-}
-
-static void r8a77950_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				     unsigned int bias)
-{
-	const struct pinmux_bias_reg *reg;
-	u32 enable, updown;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return;
-
-	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
-	if (bias != PIN_CONFIG_BIAS_DISABLE)
-		enable |= BIT(bit);
-
-	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-	if (bias == PIN_CONFIG_BIAS_PULL_UP)
-		updown |= BIT(bit);
-
-	sh_pfc_write(pfc, reg->pud, updown);
-	sh_pfc_write(pfc, reg->puen, enable);
-}
-
 static const struct sh_pfc_soc_operations r8a77950_pinmux_ops = {
 	.pin_to_pocctrl = r8a77950_pin_to_pocctrl,
-	.get_bias = r8a77950_pinmux_get_bias,
-	.set_bias = r8a77950_pinmux_set_bias,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 const struct sh_pfc_soc_info r8a77950_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index 8d1262c170af0085..72252fdcbc21b821 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -6201,51 +6201,10 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static unsigned int r8a77951_pinmux_get_bias(struct sh_pfc *pfc,
-					     unsigned int pin)
-{
-	const struct pinmux_bias_reg *reg;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return PIN_CONFIG_BIAS_DISABLE;
-
-	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
-		return PIN_CONFIG_BIAS_DISABLE;
-	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
-		return PIN_CONFIG_BIAS_PULL_UP;
-	else
-		return PIN_CONFIG_BIAS_PULL_DOWN;
-}
-
-static void r8a77951_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				     unsigned int bias)
-{
-	const struct pinmux_bias_reg *reg;
-	u32 enable, updown;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return;
-
-	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
-	if (bias != PIN_CONFIG_BIAS_DISABLE)
-		enable |= BIT(bit);
-
-	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-	if (bias == PIN_CONFIG_BIAS_PULL_UP)
-		updown |= BIT(bit);
-
-	sh_pfc_write(pfc, reg->pud, updown);
-	sh_pfc_write(pfc, reg->puen, enable);
-}
-
 static const struct sh_pfc_soc_operations r8a77951_pinmux_ops = {
 	.pin_to_pocctrl = r8a77951_pin_to_pocctrl,
-	.get_bias = r8a77951_pinmux_get_bias,
-	.set_bias = r8a77951_pinmux_set_bias,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 #ifdef CONFIG_PINCTRL_PFC_R8A774E1
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 88e9c46003d93327..6e8e023410c4c298 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -6150,51 +6150,10 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static unsigned int r8a7796_pinmux_get_bias(struct sh_pfc *pfc,
-					    unsigned int pin)
-{
-	const struct pinmux_bias_reg *reg;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return PIN_CONFIG_BIAS_DISABLE;
-
-	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
-		return PIN_CONFIG_BIAS_DISABLE;
-	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
-		return PIN_CONFIG_BIAS_PULL_UP;
-	else
-		return PIN_CONFIG_BIAS_PULL_DOWN;
-}
-
-static void r8a7796_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				   unsigned int bias)
-{
-	const struct pinmux_bias_reg *reg;
-	u32 enable, updown;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return;
-
-	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
-	if (bias != PIN_CONFIG_BIAS_DISABLE)
-		enable |= BIT(bit);
-
-	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-	if (bias == PIN_CONFIG_BIAS_PULL_UP)
-		updown |= BIT(bit);
-
-	sh_pfc_write(pfc, reg->pud, updown);
-	sh_pfc_write(pfc, reg->puen, enable);
-}
-
 static const struct sh_pfc_soc_operations r8a7796_pinmux_ops = {
 	.pin_to_pocctrl = r8a7796_pin_to_pocctrl,
-	.get_bias = r8a7796_pinmux_get_bias,
-	.set_bias = r8a7796_pinmux_set_bias,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 #ifdef CONFIG_PINCTRL_PFC_R8A774A1
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index 38b7b844abe9cc4a..590e5f8006d4c035 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -6404,51 +6404,10 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static unsigned int r8a77965_pinmux_get_bias(struct sh_pfc *pfc,
-					    unsigned int pin)
-{
-	const struct pinmux_bias_reg *reg;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return PIN_CONFIG_BIAS_DISABLE;
-
-	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
-		return PIN_CONFIG_BIAS_DISABLE;
-	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
-		return PIN_CONFIG_BIAS_PULL_UP;
-	else
-		return PIN_CONFIG_BIAS_PULL_DOWN;
-}
-
-static void r8a77965_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				   unsigned int bias)
-{
-	const struct pinmux_bias_reg *reg;
-	u32 enable, updown;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return;
-
-	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
-	if (bias != PIN_CONFIG_BIAS_DISABLE)
-		enable |= BIT(bit);
-
-	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-	if (bias == PIN_CONFIG_BIAS_PULL_UP)
-		updown |= BIT(bit);
-
-	sh_pfc_write(pfc, reg->pud, updown);
-	sh_pfc_write(pfc, reg->puen, enable);
-}
-
 static const struct sh_pfc_soc_operations r8a77965_pinmux_ops = {
 	.pin_to_pocctrl = r8a77965_pin_to_pocctrl,
-	.get_bias = r8a77965_pinmux_get_bias,
-	.set_bias = r8a77965_pinmux_set_bias,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 #ifdef CONFIG_PINCTRL_PFC_R8A774B1
diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 6f9f7638703dbf60..a51c1e684439106a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -5237,51 +5237,10 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static unsigned int r8a77990_pinmux_get_bias(struct sh_pfc *pfc,
-					     unsigned int pin)
-{
-	const struct pinmux_bias_reg *reg;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return PIN_CONFIG_BIAS_DISABLE;
-
-	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
-		return PIN_CONFIG_BIAS_DISABLE;
-	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
-		return PIN_CONFIG_BIAS_PULL_UP;
-	else
-		return PIN_CONFIG_BIAS_PULL_DOWN;
-}
-
-static void r8a77990_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				     unsigned int bias)
-{
-	const struct pinmux_bias_reg *reg;
-	u32 enable, updown;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return;
-
-	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
-	if (bias != PIN_CONFIG_BIAS_DISABLE)
-		enable |= BIT(bit);
-
-	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-	if (bias == PIN_CONFIG_BIAS_PULL_UP)
-		updown |= BIT(bit);
-
-	sh_pfc_write(pfc, reg->pud, updown);
-	sh_pfc_write(pfc, reg->puen, enable);
-}
-
 static const struct sh_pfc_soc_operations r8a77990_pinmux_ops = {
 	.pin_to_pocctrl = r8a77990_pin_to_pocctrl,
-	.get_bias = r8a77990_pinmux_get_bias,
-	.set_bias = r8a77990_pinmux_set_bias,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 #ifdef CONFIG_PINCTRL_PFC_R8A774C0
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index d34079726039c39d..4a030600f4fd0dd0 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -823,3 +823,43 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
 
 	return pinctrl_enable(pmx->pctl);
 }
+
+unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
+{
+	const struct pinmux_bias_reg *reg;
+	unsigned int bit;
+
+	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
+	if (!reg)
+		return PIN_CONFIG_BIAS_DISABLE;
+
+	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
+		return PIN_CONFIG_BIAS_DISABLE;
+	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
+		return PIN_CONFIG_BIAS_PULL_UP;
+	else
+		return PIN_CONFIG_BIAS_PULL_DOWN;
+}
+
+void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
+			  unsigned int bias)
+{
+	const struct pinmux_bias_reg *reg;
+	u32 enable, updown;
+	unsigned int bit;
+
+	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
+	if (!reg)
+		return;
+
+	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
+	if (bias != PIN_CONFIG_BIAS_DISABLE)
+		enable |= BIT(bit);
+
+	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
+	if (bias == PIN_CONFIG_BIAS_PULL_UP)
+		updown |= BIT(bit);
+
+	sh_pfc_write(pfc, reg->pud, updown);
+	sh_pfc_write(pfc, reg->puen, enable);
+}
-- 
2.25.1

