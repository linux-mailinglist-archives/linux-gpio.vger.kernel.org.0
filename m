Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2AC1BA03
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731343AbfEMP3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:07 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:51264 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731295AbfEMP3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:06 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id BrV32000S3XaVaC01rV3Ql; Mon, 13 May 2019 17:29:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001eI-ER; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003R2-DC; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/11] pinctrl: sh-pfc: r8a77990: Use new macros for non-GPIO pins
Date:   Mon, 13 May 2019 17:28:55 +0200
Message-Id: <20190513152857.13122-10-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
References: <20190513152857.13122-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the R-Car E3 pin control driver to use the new macros for
describing pins without GPIO functionality.  This replaces the use of
physical pin numbers on the R-Car E3 SoC (in 25x25 FCBGA package) by
symbolic enum values, referring to signal names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 87 +++++++++++++--------------
 1 file changed, 41 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 1055ab94accf5780..2dfb8d9cfda126e4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -40,6 +40,25 @@
 	PORT_GP_CFG_1(6, 15, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(6, 16, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(6, 17, fn, sfx, CFG_FLAGS)
+
+#define CPU_ALL_NOGP(fn)						\
+	PIN_NOGP_CFG(ASEBRK, "ASEBRK", fn, CFG_FLAGS),			\
+	PIN_NOGP_CFG(AVB_MDC, "AVB_MDC", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_MDIO, "AVB_MDIO", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TD0, "AVB_TD0", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TD1, "AVB_TD1", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TD2, "AVB_TD2", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TD3, "AVB_TD3", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TXC, "AVB_TXC", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TX_CTL, "AVB_TX_CTL", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(FSCLKST_N, "FSCLKST_N", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(MLB_REF, "MLB_REF", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT_N", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(TCK, "TCK", fn, CFG_FLAGS),			\
+	PIN_NOGP_CFG(TDI, "TDI", fn, CFG_FLAGS),			\
+	PIN_NOGP_CFG(TMS, "TMS", fn, CFG_FLAGS),			\
+	PIN_NOGP_CFG(TRST_N, "TRST_N", fn, CFG_FLAGS)
+
 /*
  * F_() : just information
  * FM() : macro for FN_xxx / xxx_MARK
@@ -1276,40 +1295,16 @@ static const u16 pinmux_data[] = {
 };
 
 /*
- * R8A77990 has 7 banks with 32 GPIOs in each => 224 GPIOs.
- * Physical layout rows: A - AE, cols: 1 - 25.
+ * Pins not associated with a GPIO port.
  */
-#define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
-#define PIN_NUMBER(r, c) (((r) - 'A') * 25 + (c) + 300)
-#define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
+enum {
+	GP_ASSIGN_LAST(),
+	NOGP_ALL(),
+};
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
-
-	/*
-	 * Pins not associated with a GPIO port.
-	 *
-	 * The pin positions are different between different R8A77990
-	 * packages, all that is needed for the pfc driver is a unique
-	 * number for each pin. To this end use the pin layout from
-	 * R8A77990 to calculate a unique number for each pin.
-	 */
-	SH_PFC_PIN_NAMED_CFG('F',  1, TRST_N,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('F',  3, TMS,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('F',  4, TCK,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('G',  2, TDI,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('G',  3, FSCLKST_N,	CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('H',  1, ASEBRK,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('N',  1, AVB_TXC,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('N',  2, AVB_TD0,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('N',  3, AVB_TD1,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('N',  5, AVB_TD2,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('N',  6, AVB_TD3,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('P',  3, AVB_TX_CTL,	CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('P',  4, AVB_MDIO,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('P',  5, AVB_MDC,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('T', 21, MLB_REF,		CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 3, PRESETOUT_N, CFG_FLAGS),
+	PINMUX_NOGP_ALL(),
 };
 
 /* - AUDIO CLOCK ------------------------------------------------------------ */
@@ -5024,15 +5019,15 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		 [0] = RCAR_GP_PIN(2, 23),	/* RD# */
 		 [1] = RCAR_GP_PIN(2, 22),	/* BS# */
 		 [2] = RCAR_GP_PIN(2, 21),	/* AVB_PHY_INT */
-		 [3] = PIN_NUMBER('P', 5),	/* AVB_MDC */
-		 [4] = PIN_NUMBER('P', 4),	/* AVB_MDIO */
+		 [3] = PIN_AVB_MDC,		/* AVB_MDC */
+		 [4] = PIN_AVB_MDIO,		/* AVB_MDIO */
 		 [5] = RCAR_GP_PIN(2, 20),	/* AVB_TXCREFCLK */
-		 [6] = PIN_NUMBER('N', 6),	/* AVB_TD3 */
-		 [7] = PIN_NUMBER('N', 5),	/* AVB_TD2 */
-		 [8] = PIN_NUMBER('N', 3),	/* AVB_TD1 */
-		 [9] = PIN_NUMBER('N', 2),	/* AVB_TD0 */
-		[10] = PIN_NUMBER('N', 1),	/* AVB_TXC */
-		[11] = PIN_NUMBER('P', 3),	/* AVB_TX_CTL */
+		 [6] = PIN_AVB_TD3,		/* AVB_TD3 */
+		 [7] = PIN_AVB_TD2,		/* AVB_TD2 */
+		 [8] = PIN_AVB_TD1,		/* AVB_TD1 */
+		 [9] = PIN_AVB_TD0,		/* AVB_TD0 */
+		[10] = PIN_AVB_TXC,		/* AVB_TXC */
+		[11] = PIN_AVB_TX_CTL,		/* AVB_TX_CTL */
 		[12] = RCAR_GP_PIN(2, 19),	/* AVB_RD3 */
 		[13] = RCAR_GP_PIN(2, 18),	/* AVB_RD2 */
 		[14] = RCAR_GP_PIN(2, 17),	/* AVB_RD1 */
@@ -5091,12 +5086,12 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ PINMUX_BIAS_REG("PUEN2", 0xe6060408, "PUD2", 0xe6060448) {
 		 [0] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
 		 [1] = RCAR_GP_PIN(3,  0),	/* SD0_CLK */
-		 [2] = PIN_NUMBER('H', 1),	/* ASEBRK */
+		 [2] = PIN_ASEBRK,		/* ASEBRK */
 		 [3] = SH_PFC_PIN_NONE,
-		 [4] = PIN_NUMBER('G', 2),	/* TDI */
-		 [5] = PIN_NUMBER('F', 3),	/* TMS */
-		 [6] = PIN_NUMBER('F', 4),	/* TCK */
-		 [7] = PIN_NUMBER('F', 1),	/* TRST# */
+		 [4] = PIN_TDI,			/* TDI */
+		 [5] = PIN_TMS,			/* TMS */
+		 [6] = PIN_TCK,			/* TCK */
+		 [7] = PIN_TRST_N,		/* TRST# */
 		 [8] = SH_PFC_PIN_NONE,
 		 [9] = SH_PFC_PIN_NONE,
 		[10] = SH_PFC_PIN_NONE,
@@ -5104,12 +5099,12 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[12] = SH_PFC_PIN_NONE,
 		[13] = SH_PFC_PIN_NONE,
 		[14] = SH_PFC_PIN_NONE,
-		[15] = PIN_NUMBER('G', 3),	/* FSCLKST# */
+		[15] = PIN_FSCLKST_N,		/* FSCLKST# */
 		[16] = RCAR_GP_PIN(0, 17),	/* SDA4 */
 		[17] = RCAR_GP_PIN(0, 16),	/* SCL4 */
 		[18] = SH_PFC_PIN_NONE,
 		[19] = SH_PFC_PIN_NONE,
-		[20] = PIN_A_NUMBER('D', 3),	/* PRESETOUT# */
+		[20] = PIN_PRESETOUT_N,		/* PRESETOUT# */
 		[21] = RCAR_GP_PIN(0, 15),	/* D15 */
 		[22] = RCAR_GP_PIN(0, 14),	/* D14 */
 		[23] = RCAR_GP_PIN(0, 13),	/* D13 */
@@ -5173,7 +5168,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[13] = RCAR_GP_PIN(6,  2),	/* SSI_SDATA0 */
 		[14] = RCAR_GP_PIN(6,  1),	/* SSI_WS01239 */
 		[15] = RCAR_GP_PIN(6,  0),	/* SSI_SCK01239 */
-		[16] = PIN_NUMBER('T', 21),	/* MLB_REF */
+		[16] = PIN_MLB_REF,		/* MLB_REF */
 		[17] = RCAR_GP_PIN(5, 19),	/* MLB_DAT */
 		[18] = RCAR_GP_PIN(5, 18),	/* MLB_SIG */
 		[19] = RCAR_GP_PIN(5, 17),	/* MLB_CLK */
-- 
2.17.1

