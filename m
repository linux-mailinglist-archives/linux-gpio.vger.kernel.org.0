Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38CA129DADF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390425AbgJ1Xgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390548AbgJ1XfT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:35:19 -0400
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6977DC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:35:19 -0700 (PDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4CLsc869JwzMwkhV
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:16:40 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id lTGg2300M4C55Sk01TGg27; Wed, 28 Oct 2020 16:16:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBo-000pDf-43; Wed, 28 Oct 2020 16:16:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-007H9B-Ac; Wed, 28 Oct 2020 16:16:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/8] pinctrl: renesas: r8a7778: Use physical addresses for PUPR regs
Date:   Wed, 28 Oct 2020 16:16:35 +0100
Message-Id: <20201028151637.1734130-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
References: <20201028151637.1734130-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The handling of the LSI Pin Pull-Up Control Registers (PUPR) on R-Car
M1A uses register offsets instead of register physical addresses.
This is different from the handling on other R-Car parts.

Convert the bias handling from register offsets to physical addresses.
This increases uniformity, and prepares for consolidation of the bias
handling.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7778.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index a9875038ed9b664e..debf0c9a281cee31 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -2909,7 +2909,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 };
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
-	{ PINMUX_BIAS_REG("PUPR0", 0x100, "N/A", 0) {
+	{ PINMUX_BIAS_REG("PUPR0", 0xfffc0100, "N/A", 0) {
 		[ 0] = RCAR_GP_PIN(0,  6),	/* A0 */
 		[ 1] = RCAR_GP_PIN(0,  7),	/* A1 */
 		[ 2] = RCAR_GP_PIN(0,  8),	/* A2 */
@@ -2943,7 +2943,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = RCAR_GP_PIN(1,  7),	/* /EX_CS4 */
 		[31] = RCAR_GP_PIN(1,  8),	/* /EX_CS5 */
 	} },
-	{ PINMUX_BIAS_REG("PUPR1", 0x104, "N/A", 0) {
+	{ PINMUX_BIAS_REG("PUPR1", 0xfffc0104, "N/A", 0) {
 		[ 0] = RCAR_GP_PIN(0,  0),	/* /PRESETOUT	*/
 		[ 1] = RCAR_GP_PIN(0,  5),	/* /BS		*/
 		[ 2] = RCAR_GP_PIN(1,  0),	/* RD//WR	*/
@@ -2977,7 +2977,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ PINMUX_BIAS_REG("PUPR2", 0x108, "N/A", 0) {
+	{ PINMUX_BIAS_REG("PUPR2", 0xfffc0108, "N/A", 0) {
 		[ 0] = RCAR_GP_PIN(1, 22),	/* DU0_DR0	*/
 		[ 1] = RCAR_GP_PIN(1, 23),	/* DU0_DR1	*/
 		[ 2] = RCAR_GP_PIN(1, 24),	/* DU0_DR2	*/
@@ -3011,7 +3011,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = RCAR_GP_PIN(2, 21),	/* DU0_CDE	*/
 		[31] = RCAR_GP_PIN(2, 16),	/* DU0_DOTCLKOUT1 */
 	} },
-	{ PINMUX_BIAS_REG("PUPR3", 0x10c, "N/A", 0) {
+	{ PINMUX_BIAS_REG("PUPR3", 0xfffc010c, "N/A", 0) {
 		[ 0] = RCAR_GP_PIN(3, 24),	/* VI0_CLK	*/
 		[ 1] = RCAR_GP_PIN(3, 25),	/* VI0_CLKENB	*/
 		[ 2] = RCAR_GP_PIN(3, 26),	/* VI0_FIELD	*/
@@ -3045,7 +3045,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = RCAR_GP_PIN(4, 18),	/* ETH_MDIO	*/
 		[31] = RCAR_GP_PIN(4, 19),	/* ETH_LINK	*/
 	} },
-	{ PINMUX_BIAS_REG("PUPR4", 0x110, "N/A", 0) {
+	{ PINMUX_BIAS_REG("PUPR4", 0xfffc0110, "N/A", 0) {
 		[ 0] = RCAR_GP_PIN(3,  6),	/* SSI_SCK012	*/
 		[ 1] = RCAR_GP_PIN(3,  7),	/* SSI_WS012	*/
 		[ 2] = RCAR_GP_PIN(3, 10),	/* SSI_SDATA0	*/
@@ -3079,7 +3079,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = RCAR_GP_PIN(1, 14),	/* IRQ2		*/
 		[31] = RCAR_GP_PIN(1, 15),	/* IRQ3		*/
 	} },
-	{ PINMUX_BIAS_REG("PUPR5", 0x114, "N/A", 0) {
+	{ PINMUX_BIAS_REG("PUPR5", 0xfffc0114, "N/A", 0) {
 		[ 0] = RCAR_GP_PIN(0,  1),	/* PENC0	*/
 		[ 1] = RCAR_GP_PIN(0,  2),	/* PENC1	*/
 		[ 2] = RCAR_GP_PIN(0,  3),	/* USB_OVC0	*/
@@ -3120,16 +3120,13 @@ static unsigned int r8a7778_pinmux_get_bias(struct sh_pfc *pfc,
 					    unsigned int pin)
 {
 	const struct pinmux_bias_reg *reg;
-	void __iomem *addr;
 	unsigned int bit;
 
 	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
 	if (!reg)
 		return PIN_CONFIG_BIAS_DISABLE;
 
-	addr = pfc->windows->virt + reg->puen;
-
-	if (ioread32(addr) & BIT(bit))
+	if (sh_pfc_read(pfc, reg->puen) & BIT(bit))
 		return PIN_CONFIG_BIAS_PULL_UP;
 	else
 		return PIN_CONFIG_BIAS_DISABLE;
@@ -3139,7 +3136,6 @@ static void r8a7778_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 				   unsigned int bias)
 {
 	const struct pinmux_bias_reg *reg;
-	void __iomem *addr;
 	unsigned int bit;
 	u32 value;
 
@@ -3147,12 +3143,10 @@ static void r8a7778_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	if (!reg)
 		return;
 
-	addr = pfc->windows->virt + reg->puen;
-
-	value = ioread32(addr) & ~BIT(bit);
+	value = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
 	if (bias == PIN_CONFIG_BIAS_PULL_UP)
 		value |= BIT(bit);
-	iowrite32(value, addr);
+	sh_pfc_write(pfc, reg->puen, value);
 }
 
 static const struct sh_pfc_soc_operations r8a7778_pfc_ops = {
-- 
2.25.1

