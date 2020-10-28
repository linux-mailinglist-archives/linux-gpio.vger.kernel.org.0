Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E28F29DADE
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390555AbgJ1Xgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390550AbgJ1XfT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:35:19 -0400
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B83C0613D2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:35:19 -0700 (PDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4CLsc8695GzMwkhT
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:16:40 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id lTGg230074C55Sk01TGglK; Wed, 28 Oct 2020 16:16:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-000pDh-Si; Wed, 28 Oct 2020 16:16:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-007H9H-CG; Wed, 28 Oct 2020 16:16:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/8] pinctrl: renesas: r8a7778: Use common R-Car bias handling
Date:   Wed, 28 Oct 2020 16:16:36 +0100
Message-Id: <20201028151637.1734130-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
References: <20201028151637.1734130-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, the rcar_pinmux_[gs]et_bias() helpers handle only SoCs that
have separate LSI Pin Pull-Enable (PUEN) and Pull-Up/Down Control (PUD)
registers, like R-Car Gen3 and RZ/G2.  Update the function to handle
SoCs that have only LSI Pin Pull-Up Control Register (PUPR), like R-Car
Gen1/Gen2 and RZ/G1.

Reduce code duplication by converting the R-Car M1A pin control driver
to use the common handler.

Note that this changes behavior in case the (invalid!) option
"bias-pull-down" is used in an R-Car M1A DTS: before, it was ignored
silently; after this change, it is considered the same as
"bias-pull-up".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7778.c | 37 ++-------------------------
 drivers/pinctrl/renesas/pinctrl.c     | 13 ++++++----
 2 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index debf0c9a281cee31..75f52b1798c3c5c9 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -3116,42 +3116,9 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static unsigned int r8a7778_pinmux_get_bias(struct sh_pfc *pfc,
-					    unsigned int pin)
-{
-	const struct pinmux_bias_reg *reg;
-	unsigned int bit;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return PIN_CONFIG_BIAS_DISABLE;
-
-	if (sh_pfc_read(pfc, reg->puen) & BIT(bit))
-		return PIN_CONFIG_BIAS_PULL_UP;
-	else
-		return PIN_CONFIG_BIAS_DISABLE;
-}
-
-static void r8a7778_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				   unsigned int bias)
-{
-	const struct pinmux_bias_reg *reg;
-	unsigned int bit;
-	u32 value;
-
-	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
-	if (!reg)
-		return;
-
-	value = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
-	if (bias == PIN_CONFIG_BIAS_PULL_UP)
-		value |= BIT(bit);
-	sh_pfc_write(pfc, reg->puen, value);
-}
-
 static const struct sh_pfc_soc_operations r8a7778_pfc_ops = {
-	.get_bias = r8a7778_pinmux_get_bias,
-	.set_bias = r8a7778_pinmux_set_bias,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 const struct sh_pfc_soc_info r8a7778_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 4a030600f4fd0dd0..d5c798e98c18abee 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -835,7 +835,7 @@ unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
 
 	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
 		return PIN_CONFIG_BIAS_DISABLE;
-	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
+	else if (!reg->pud || (sh_pfc_read(pfc, reg->pud) & BIT(bit)))
 		return PIN_CONFIG_BIAS_PULL_UP;
 	else
 		return PIN_CONFIG_BIAS_PULL_DOWN;
@@ -856,10 +856,13 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	if (bias != PIN_CONFIG_BIAS_DISABLE)
 		enable |= BIT(bit);
 
-	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-	if (bias == PIN_CONFIG_BIAS_PULL_UP)
-		updown |= BIT(bit);
+	if (reg->pud) {
+		updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
+		if (bias == PIN_CONFIG_BIAS_PULL_UP)
+			updown |= BIT(bit);
+
+		sh_pfc_write(pfc, reg->pud, updown);
+	}
 
-	sh_pfc_write(pfc, reg->pud, updown);
 	sh_pfc_write(pfc, reg->puen, enable);
 }
-- 
2.25.1

