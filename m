Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAF61BA0F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731352AbfEMP3M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:12 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:33964 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731355AbfEMP3L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:11 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id BrV22000W3XaVaC01rV2De; Mon, 13 May 2019 17:29:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001eF-DU; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003Qz-CF; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/11] pinctrl: sh-pfc: r8a77965: Use new macros for non-GPIO pins
Date:   Mon, 13 May 2019 17:28:54 +0200
Message-Id: <20190513152857.13122-9-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
References: <20190513152857.13122-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the R-Car M3-N pin control driver to use the new macros for
describing pins without GPIO functionality.  This replaces the use of
physical pin numbers on the R-Car M3-N SiP (in 39x39 BGA package) by
symbolic enum values, referring to signal names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 307 +++++++++++++-------------
 1 file changed, 151 insertions(+), 156 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 2c0c3480e45a8ab1..697c77a4ea95938a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -33,6 +33,51 @@
 	PORT_GP_CFG_26(5, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_32(6, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_4(7, fn, sfx, CFG_FLAGS)
+
+#define CPU_ALL_NOGP(fn)						\
+	PIN_NOGP_CFG(ASEBRK, "ASEBRK", fn, CFG_FLAGS),			\
+	PIN_NOGP_CFG(AVB_MDIO, "AVB_MDIO", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_RD0, "AVB_RD0", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_RD1, "AVB_RD1", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_RD2, "AVB_RD2", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_RD3, "AVB_RD3", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_RXC, "AVB_RXC", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_RX_CTL, "AVB_RX_CTL", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TD0, "AVB_TD0", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TD1, "AVB_TD1", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TD2, "AVB_TD2", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TD3, "AVB_TD3", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TXC, "AVB_TXC", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(AVB_TXCREFCLK, "AVB_TXCREFCLK", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(AVB_TX_CTL, "AVB_TX_CTL", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(DU_DOTCLKIN0, "DU_DOTCLKIN0", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(DU_DOTCLKIN1, "DU_DOTCLKIN1", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(DU_DOTCLKIN3, "DU_DOTCLKIN3", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(EXTALR, "EXTALR", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),\
+	PIN_NOGP_CFG(FSCLKST, "FSCLKST", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(MLB_REF, "MLB_REF", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT#", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(QSPI0_IO2, "QSPI0_IO2", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(QSPI0_IO3, "QSPI0_IO3", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(QSPI0_MISO_IO1, "QSPI0_MISO_IO1", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(QSPI0_MOSI_IO0, "QSPI0_MOSI_IO0", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(QSPI0_SPCLK, "QSPI0_SPCLK", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(QSPI0_SSL, "QSPI0_SSL", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(QSPI1_IO2, "QSPI1_IO2", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(QSPI1_IO3, "QSPI1_IO3", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(QSPI1_MISO_IO1, "QSPI1_MISO_IO1", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(QSPI1_MOSI_IO0, "QSPI1_MOSI_IO0", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(QSPI1_SPCLK, "QSPI1_SPCLK", fn, CFG_FLAGS),	\
+	PIN_NOGP_CFG(QSPI1_SSL, "QSPI1_SSL", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(RPC_INT_N, "RPC_INT#", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(RPC_RESET_N, "RPC_RESET#", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(RPC_WP_N, "RPC_WP#", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(TDO, "TDO", fn, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
+	PIN_NOGP_CFG(TMS, "TMS", fn, CFG_FLAGS),			\
+	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN)
+
 /*
  * F_() : just information
  * FM() : macro for FN_xxx / xxx_MARK
@@ -1515,66 +1560,16 @@ static const u16 pinmux_data[] = {
 };
 
 /*
- * R8A77965 has 8 banks with 32 GPIOs in each => 256 GPIOs.
- * Physical layout rows: A - AW, cols: 1 - 39.
+ * Pins not associated with a GPIO port.
  */
-#define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
-#define PIN_NUMBER(r, c) (((r) - 'A') * 39 + (c) + 300)
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
-	 * The pin positions are different between different r8a77965
-	 * packages, all that is needed for the pfc driver is a unique
-	 * number for each pin. To this end use the pin layout from
-	 * R-Car M3SiP to calculate a unique number for each pin.
-	 */
-	SH_PFC_PIN_NAMED_CFG('A',  8, AVB_TX_CTL, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A',  9, AVB_MDIO, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 12, AVB_TXCREFCLK, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 13, AVB_RD0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 14, AVB_RD2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 16, AVB_RX_CTL, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 17, AVB_TD2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 18, AVB_TD0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('A', 19, AVB_TXC, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 13, AVB_RD1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 14, AVB_RD3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 17, AVB_TD3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 18, AVB_TD1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('B', 19, AVB_RXC, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('C',  1, PRESETOUT#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('H', 37, MLB_REF, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('V',  3, QSPI1_SPCLK, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('V',  5, QSPI1_SSL, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('V',  6, RPC_WP#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('V',  7, RPC_RESET#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('W',  3, QSPI0_SPCLK, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('Y',  3, QSPI0_SSL, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('Y',  6, QSPI0_IO2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG('Y',  7, RPC_INT#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  4, QSPI0_MISO_IO1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  6, QSPI0_IO3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  3, QSPI1_IO3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5, QSPI0_MOSI_IO0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7, QSPI1_MOSI_IO0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4, QSPI1_IO2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5, QSPI1_MISO_IO1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7, DU_DOTCLKIN0, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8, DU_DOTCLKIN1, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, TMS, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, TDO, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, CFG_FLAGS),
+	PINMUX_NOGP_ALL(),
 };
 
 /* - AUDIO CLOCK ------------------------------------------------------------ */
@@ -1723,7 +1718,7 @@ static const unsigned int avb_phy_int_mux[] = {
 };
 static const unsigned int avb_mdio_pins[] = {
 	/* AVB_MDC, AVB_MDIO */
-	RCAR_GP_PIN(2, 9), PIN_NUMBER('A', 9),
+	RCAR_GP_PIN(2, 9), PIN_AVB_MDIO,
 };
 static const unsigned int avb_mdio_mux[] = {
 	AVB_MDC_MARK, AVB_MDIO_MARK,
@@ -1736,11 +1731,11 @@ static const unsigned int avb_mii_pins[] = {
 	 * AVB_RD1, AVB_RD2, AVB_RD3,
 	 * AVB_TXCREFCLK
 	 */
-	PIN_NUMBER('A', 8), PIN_NUMBER('A', 19), PIN_NUMBER('A', 18),
-	PIN_NUMBER('B', 18), PIN_NUMBER('A', 17), PIN_NUMBER('B', 17),
-	PIN_NUMBER('A', 16), PIN_NUMBER('B', 19), PIN_NUMBER('A', 13),
-	PIN_NUMBER('B', 13), PIN_NUMBER('A', 14), PIN_NUMBER('B', 14),
-	PIN_NUMBER('A', 12),
+	PIN_AVB_TX_CTL, PIN_AVB_TXC, PIN_AVB_TD0,
+	PIN_AVB_TD1, PIN_AVB_TD2, PIN_AVB_TD3,
+	PIN_AVB_RX_CTL, PIN_AVB_RXC, PIN_AVB_RD0,
+	PIN_AVB_RD1, PIN_AVB_RD2, PIN_AVB_RD3,
+	PIN_AVB_TXCREFCLK,
 
 };
 static const unsigned int avb_mii_mux[] = {
@@ -5869,44 +5864,44 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 
 static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 	{ PINMUX_DRIVE_REG("DRVCTRL0", 0xe6060300) {
-		{ PIN_NUMBER('W', 3),   28, 2 },	/* QSPI0_SPCLK */
-		{ PIN_A_NUMBER('C', 5), 24, 2 },	/* QSPI0_MOSI_IO0 */
-		{ PIN_A_NUMBER('B', 4), 20, 2 },	/* QSPI0_MISO_IO1 */
-		{ PIN_NUMBER('Y', 6),   16, 2 },	/* QSPI0_IO2 */
-		{ PIN_A_NUMBER('B', 6), 12, 2 },	/* QSPI0_IO3 */
-		{ PIN_NUMBER('Y', 3),    8, 2 },	/* QSPI0_SSL */
-		{ PIN_NUMBER('V', 3),    4, 2 },	/* QSPI1_SPCLK */
-		{ PIN_A_NUMBER('C', 7),  0, 2 },	/* QSPI1_MOSI_IO0 */
+		{ PIN_QSPI0_SPCLK,    28, 2 },	/* QSPI0_SPCLK */
+		{ PIN_QSPI0_MOSI_IO0, 24, 2 },	/* QSPI0_MOSI_IO0 */
+		{ PIN_QSPI0_MISO_IO1, 20, 2 },	/* QSPI0_MISO_IO1 */
+		{ PIN_QSPI0_IO2,      16, 2 },	/* QSPI0_IO2 */
+		{ PIN_QSPI0_IO3,      12, 2 },	/* QSPI0_IO3 */
+		{ PIN_QSPI0_SSL,       8, 2 },	/* QSPI0_SSL */
+		{ PIN_QSPI1_SPCLK,     4, 2 },	/* QSPI1_SPCLK */
+		{ PIN_QSPI1_MOSI_IO0,  0, 2 },	/* QSPI1_MOSI_IO0 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL1", 0xe6060304) {
-		{ PIN_A_NUMBER('E', 5), 28, 2 },	/* QSPI1_MISO_IO1 */
-		{ PIN_A_NUMBER('E', 4), 24, 2 },	/* QSPI1_IO2 */
-		{ PIN_A_NUMBER('C', 3), 20, 2 },	/* QSPI1_IO3 */
-		{ PIN_NUMBER('V', 5),   16, 2 },	/* QSPI1_SSL */
-		{ PIN_NUMBER('Y', 7),   12, 2 },	/* RPC_INT# */
-		{ PIN_NUMBER('V', 6),    8, 2 },	/* RPC_WP# */
-		{ PIN_NUMBER('V', 7),    4, 2 },	/* RPC_RESET# */
-		{ PIN_NUMBER('A', 16),   0, 3 },	/* AVB_RX_CTL */
+		{ PIN_QSPI1_MISO_IO1, 28, 2 },	/* QSPI1_MISO_IO1 */
+		{ PIN_QSPI1_IO2,      24, 2 },	/* QSPI1_IO2 */
+		{ PIN_QSPI1_IO3,      20, 2 },	/* QSPI1_IO3 */
+		{ PIN_QSPI1_SSL,      16, 2 },	/* QSPI1_SSL */
+		{ PIN_RPC_INT_N,      12, 2 },	/* RPC_INT# */
+		{ PIN_RPC_WP_N,        8, 2 },	/* RPC_WP# */
+		{ PIN_RPC_RESET_N,     4, 2 },	/* RPC_RESET# */
+		{ PIN_AVB_RX_CTL,      0, 3 },	/* AVB_RX_CTL */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL2", 0xe6060308) {
-		{ PIN_NUMBER('B', 19),  28, 3 },	/* AVB_RXC */
-		{ PIN_NUMBER('A', 13),  24, 3 },	/* AVB_RD0 */
-		{ PIN_NUMBER('B', 13),  20, 3 },	/* AVB_RD1 */
-		{ PIN_NUMBER('A', 14),  16, 3 },	/* AVB_RD2 */
-		{ PIN_NUMBER('B', 14),  12, 3 },	/* AVB_RD3 */
-		{ PIN_NUMBER('A', 8),    8, 3 },	/* AVB_TX_CTL */
-		{ PIN_NUMBER('A', 19),   4, 3 },	/* AVB_TXC */
-		{ PIN_NUMBER('A', 18),   0, 3 },	/* AVB_TD0 */
+		{ PIN_AVB_RXC,        28, 3 },	/* AVB_RXC */
+		{ PIN_AVB_RD0,        24, 3 },	/* AVB_RD0 */
+		{ PIN_AVB_RD1,        20, 3 },	/* AVB_RD1 */
+		{ PIN_AVB_RD2,        16, 3 },	/* AVB_RD2 */
+		{ PIN_AVB_RD3,        12, 3 },	/* AVB_RD3 */
+		{ PIN_AVB_TX_CTL,      8, 3 },	/* AVB_TX_CTL */
+		{ PIN_AVB_TXC,         4, 3 },	/* AVB_TXC */
+		{ PIN_AVB_TD0,         0, 3 },	/* AVB_TD0 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL3", 0xe606030c) {
-		{ PIN_NUMBER('B', 18),  28, 3 },	/* AVB_TD1 */
-		{ PIN_NUMBER('A', 17),  24, 3 },	/* AVB_TD2 */
-		{ PIN_NUMBER('B', 17),  20, 3 },	/* AVB_TD3 */
-		{ PIN_NUMBER('A', 12),  16, 3 },	/* AVB_TXCREFCLK */
-		{ PIN_NUMBER('A', 9),   12, 3 },	/* AVB_MDIO */
-		{ RCAR_GP_PIN(2,  9),    8, 3 },	/* AVB_MDC */
-		{ RCAR_GP_PIN(2, 10),    4, 3 },	/* AVB_MAGIC */
-		{ RCAR_GP_PIN(2, 11),    0, 3 },	/* AVB_PHY_INT */
+		{ PIN_AVB_TD1,        28, 3 },	/* AVB_TD1 */
+		{ PIN_AVB_TD2,        24, 3 },	/* AVB_TD2 */
+		{ PIN_AVB_TD3,        20, 3 },	/* AVB_TD3 */
+		{ PIN_AVB_TXCREFCLK,  16, 3 },	/* AVB_TXCREFCLK */
+		{ PIN_AVB_MDIO,       12, 3 },	/* AVB_MDIO */
+		{ RCAR_GP_PIN(2,  9),  8, 3 },	/* AVB_MDC */
+		{ RCAR_GP_PIN(2, 10),  4, 3 },	/* AVB_MAGIC */
+		{ RCAR_GP_PIN(2, 11),  0, 3 },	/* AVB_PHY_INT */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL4", 0xe6060310) {
 		{ RCAR_GP_PIN(2, 12), 28, 3 },	/* AVB_LINK */
@@ -5960,7 +5955,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL9", 0xe6060324) {
 		{ RCAR_GP_PIN(1, 27), 28, 3 },	/* EX_WAIT0 */
-		{ PIN_NUMBER('C', 1), 24, 3 },	/* PRESETOUT# */
+		{ PIN_PRESETOUT_N,    24, 3 },	/* PRESETOUT# */
 		{ RCAR_GP_PIN(0,  0), 20, 3 },	/* D0 */
 		{ RCAR_GP_PIN(0,  1), 16, 3 },	/* D1 */
 		{ RCAR_GP_PIN(0,  2), 12, 3 },	/* D2 */
@@ -5979,29 +5974,29 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(0, 13),  0, 3 },	/* D13 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL11", 0xe606032c) {
-		{ RCAR_GP_PIN(0, 14),   28, 3 },	/* D14 */
-		{ RCAR_GP_PIN(0, 15),   24, 3 },	/* D15 */
-		{ RCAR_GP_PIN(7,  0),   20, 3 },	/* AVS1 */
-		{ RCAR_GP_PIN(7,  1),   16, 3 },	/* AVS2 */
-		{ RCAR_GP_PIN(7,  2),   12, 3 },	/* GP7_02 */
-		{ RCAR_GP_PIN(7,  3),    8, 3 },	/* GP7_03 */
-		{ PIN_A_NUMBER('P', 7),  4, 2 },	/* DU_DOTCLKIN0 */
-		{ PIN_A_NUMBER('P', 8),  0, 2 },	/* DU_DOTCLKIN1 */
+		{ RCAR_GP_PIN(0, 14), 28, 3 },	/* D14 */
+		{ RCAR_GP_PIN(0, 15), 24, 3 },	/* D15 */
+		{ RCAR_GP_PIN(7,  0), 20, 3 },	/* AVS1 */
+		{ RCAR_GP_PIN(7,  1), 16, 3 },	/* AVS2 */
+		{ RCAR_GP_PIN(7,  2), 12, 3 },	/* GP7_02 */
+		{ RCAR_GP_PIN(7,  3),  8, 3 },	/* GP7_03 */
+		{ PIN_DU_DOTCLKIN0,    4, 2 },	/* DU_DOTCLKIN0 */
+		{ PIN_DU_DOTCLKIN1,    0, 2 },	/* DU_DOTCLKIN1 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL12", 0xe6060330) {
-		{ PIN_A_NUMBER('R', 8),  28, 2 },	/* DU_DOTCLKIN3 */
-		{ PIN_A_NUMBER('D', 38), 20, 2 },	/* FSCLKST */
-		{ PIN_A_NUMBER('R', 30),  4, 2 },	/* TMS */
+		{ PIN_DU_DOTCLKIN3,   28, 2 },	/* DU_DOTCLKIN3 */
+		{ PIN_FSCLKST,        20, 2 },	/* FSCLKST */
+		{ PIN_TMS,             4, 2 },	/* TMS */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL13", 0xe6060334) {
-		{ PIN_A_NUMBER('T', 28), 28, 2 },	/* TDO */
-		{ PIN_A_NUMBER('T', 30), 24, 2 },	/* ASEBRK */
-		{ RCAR_GP_PIN(3,  0),    20, 3 },	/* SD0_CLK */
-		{ RCAR_GP_PIN(3,  1),    16, 3 },	/* SD0_CMD */
-		{ RCAR_GP_PIN(3,  2),    12, 3 },	/* SD0_DAT0 */
-		{ RCAR_GP_PIN(3,  3),     8, 3 },	/* SD0_DAT1 */
-		{ RCAR_GP_PIN(3,  4),     4, 3 },	/* SD0_DAT2 */
-		{ RCAR_GP_PIN(3,  5),     0, 3 },	/* SD0_DAT3 */
+		{ PIN_TDO,            28, 2 },	/* TDO */
+		{ PIN_ASEBRK,         24, 2 },	/* ASEBRK */
+		{ RCAR_GP_PIN(3,  0), 20, 3 },	/* SD0_CLK */
+		{ RCAR_GP_PIN(3,  1), 16, 3 },	/* SD0_CMD */
+		{ RCAR_GP_PIN(3,  2), 12, 3 },	/* SD0_DAT0 */
+		{ RCAR_GP_PIN(3,  3),  8, 3 },	/* SD0_DAT1 */
+		{ RCAR_GP_PIN(3,  4),  4, 3 },	/* SD0_DAT2 */
+		{ RCAR_GP_PIN(3,  5),  0, 3 },	/* SD0_DAT3 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL14", 0xe6060338) {
 		{ RCAR_GP_PIN(3,  6), 28, 3 },	/* SD1_CLK */
@@ -6070,7 +6065,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(5, 23), 16, 3 },	/* MLB_CLK */
 		{ RCAR_GP_PIN(5, 24), 12, 3 },	/* MLB_SIG */
 		{ RCAR_GP_PIN(5, 25),  8, 3 },	/* MLB_DAT */
-		{ PIN_NUMBER('H', 37),  4, 3 },	/* MLB_REF */
+		{ PIN_MLB_REF,         4, 3 },	/* MLB_REF */
 		{ RCAR_GP_PIN(6,  0),  0, 3 },	/* SSI_SCK01239 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL21", 0xe6060354) {
@@ -6143,35 +6138,35 @@ static int r8a77965_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *po
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
-		[ 0] = PIN_NUMBER('W', 3),	/* QSPI0_SPCLK */
-		[ 1] = PIN_A_NUMBER('C', 5),	/* QSPI0_MOSI_IO0 */
-		[ 2] = PIN_A_NUMBER('B', 4),	/* QSPI0_MISO_IO1 */
-		[ 3] = PIN_NUMBER('Y', 6),	/* QSPI0_IO2 */
-		[ 4] = PIN_A_NUMBER('B', 6),	/* QSPI0_IO3 */
-		[ 5] = PIN_NUMBER('Y', 3),	/* QSPI0_SSL */
-		[ 6] = PIN_NUMBER('V', 3),	/* QSPI1_SPCLK */
-		[ 7] = PIN_A_NUMBER('C', 7),	/* QSPI1_MOSI_IO0 */
-		[ 8] = PIN_A_NUMBER('E', 5),	/* QSPI1_MISO_IO1 */
-		[ 9] = PIN_A_NUMBER('E', 4),	/* QSPI1_IO2 */
-		[10] = PIN_A_NUMBER('C', 3),	/* QSPI1_IO3 */
-		[11] = PIN_NUMBER('V', 5),	/* QSPI1_SSL */
-		[12] = PIN_NUMBER('Y', 7),	/* RPC_INT# */
-		[13] = PIN_NUMBER('V', 6),	/* RPC_WP# */
-		[14] = PIN_NUMBER('V', 7),	/* RPC_RESET# */
-		[15] = PIN_NUMBER('A', 16),	/* AVB_RX_CTL */
-		[16] = PIN_NUMBER('B', 19),	/* AVB_RXC */
-		[17] = PIN_NUMBER('A', 13),	/* AVB_RD0 */
-		[18] = PIN_NUMBER('B', 13),	/* AVB_RD1 */
-		[19] = PIN_NUMBER('A', 14),	/* AVB_RD2 */
-		[20] = PIN_NUMBER('B', 14),	/* AVB_RD3 */
-		[21] = PIN_NUMBER('A', 8),	/* AVB_TX_CTL */
-		[22] = PIN_NUMBER('A', 19),	/* AVB_TXC */
-		[23] = PIN_NUMBER('A', 18),	/* AVB_TD0 */
-		[24] = PIN_NUMBER('B', 18),	/* AVB_TD1 */
-		[25] = PIN_NUMBER('A', 17),	/* AVB_TD2 */
-		[26] = PIN_NUMBER('B', 17),	/* AVB_TD3 */
-		[27] = PIN_NUMBER('A', 12),	/* AVB_TXCREFCLK */
-		[28] = PIN_NUMBER('A', 9),	/* AVB_MDIO */
+		[ 0] = PIN_QSPI0_SPCLK,		/* QSPI0_SPCLK */
+		[ 1] = PIN_QSPI0_MOSI_IO0,	/* QSPI0_MOSI_IO0 */
+		[ 2] = PIN_QSPI0_MISO_IO1,	/* QSPI0_MISO_IO1 */
+		[ 3] = PIN_QSPI0_IO2,		/* QSPI0_IO2 */
+		[ 4] = PIN_QSPI0_IO3,		/* QSPI0_IO3 */
+		[ 5] = PIN_QSPI0_SSL,		/* QSPI0_SSL */
+		[ 6] = PIN_QSPI1_SPCLK,		/* QSPI1_SPCLK */
+		[ 7] = PIN_QSPI1_MOSI_IO0,	/* QSPI1_MOSI_IO0 */
+		[ 8] = PIN_QSPI1_MISO_IO1,	/* QSPI1_MISO_IO1 */
+		[ 9] = PIN_QSPI1_IO2,		/* QSPI1_IO2 */
+		[10] = PIN_QSPI1_IO3,		/* QSPI1_IO3 */
+		[11] = PIN_QSPI1_SSL,		/* QSPI1_SSL */
+		[12] = PIN_RPC_INT_N,		/* RPC_INT# */
+		[13] = PIN_RPC_WP_N,		/* RPC_WP# */
+		[14] = PIN_RPC_RESET_N,		/* RPC_RESET# */
+		[15] = PIN_AVB_RX_CTL,		/* AVB_RX_CTL */
+		[16] = PIN_AVB_RXC,		/* AVB_RXC */
+		[17] = PIN_AVB_RD0,		/* AVB_RD0 */
+		[18] = PIN_AVB_RD1,		/* AVB_RD1 */
+		[19] = PIN_AVB_RD2,		/* AVB_RD2 */
+		[20] = PIN_AVB_RD3,		/* AVB_RD3 */
+		[21] = PIN_AVB_TX_CTL,		/* AVB_TX_CTL */
+		[22] = PIN_AVB_TXC,		/* AVB_TXC */
+		[23] = PIN_AVB_TD0,		/* AVB_TD0 */
+		[24] = PIN_AVB_TD1,		/* AVB_TD1 */
+		[25] = PIN_AVB_TD2,		/* AVB_TD2 */
+		[26] = PIN_AVB_TD3,		/* AVB_TD3 */
+		[27] = PIN_AVB_TXCREFCLK,	/* AVB_TXCREFCLK */
+		[28] = PIN_AVB_MDIO,		/* AVB_MDIO */
 		[29] = RCAR_GP_PIN(2,  9),	/* AVB_MDC */
 		[30] = RCAR_GP_PIN(2, 10),	/* AVB_MAGIC */
 		[31] = RCAR_GP_PIN(2, 11),	/* AVB_PHY_INT */
@@ -6220,7 +6215,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 6] = RCAR_GP_PIN(1, 25),	/* WE0_N */
 		[ 7] = RCAR_GP_PIN(1, 26),	/* WE1_N */
 		[ 8] = RCAR_GP_PIN(1, 27),	/* EX_WAIT0_A */
-		[ 9] = PIN_NUMBER('C', 1),	/* PRESETOUT# */
+		[ 9] = PIN_PRESETOUT_N,		/* PRESETOUT# */
 		[10] = RCAR_GP_PIN(0,  0),	/* D0 */
 		[11] = RCAR_GP_PIN(0,  1),	/* D1 */
 		[12] = RCAR_GP_PIN(0,  2),	/* D2 */
@@ -6241,20 +6236,20 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[27] = RCAR_GP_PIN(7,  1),	/* AVS2 */
 		[28] = RCAR_GP_PIN(7,  2),	/* GP7_02 */
 		[29] = RCAR_GP_PIN(7,  3),	/* GP7_03 */
-		[30] = PIN_A_NUMBER('P', 7),	/* DU_DOTCLKIN0 */
-		[31] = PIN_A_NUMBER('P', 8),	/* DU_DOTCLKIN1 */
+		[30] = PIN_DU_DOTCLKIN0,	/* DU_DOTCLKIN0 */
+		[31] = PIN_DU_DOTCLKIN1,	/* DU_DOTCLKIN1 */
 	} },
 	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
-		[ 0] = PIN_A_NUMBER('R', 8),	/* DU_DOTCLKIN3 */
+		[ 0] = PIN_DU_DOTCLKIN3,	/* DU_DOTCLKIN3 */
 		[ 1] = SH_PFC_PIN_NONE,
-		[ 2] = PIN_A_NUMBER('D', 38),	/* FSCLKST */
-		[ 3] = PIN_A_NUMBER('D', 39),	/* EXTALR*/
-		[ 4] = PIN_A_NUMBER('R', 26),	/* TRST# */
-		[ 5] = PIN_A_NUMBER('T', 27),	/* TCK */
-		[ 6] = PIN_A_NUMBER('R', 30),	/* TMS */
-		[ 7] = PIN_A_NUMBER('R', 29),	/* TDI */
+		[ 2] = PIN_FSCLKST,		/* FSCLKST */
+		[ 3] = PIN_EXTALR,		/* EXTALR*/
+		[ 4] = PIN_TRST_N,		/* TRST# */
+		[ 5] = PIN_TCK,			/* TCK */
+		[ 6] = PIN_TMS,			/* TMS */
+		[ 7] = PIN_TDI,			/* TDI */
 		[ 8] = SH_PFC_PIN_NONE,
-		[ 9] = PIN_A_NUMBER('T', 30),	/* ASEBRK */
+		[ 9] = PIN_ASEBRK,		/* ASEBRK */
 		[10] = RCAR_GP_PIN(3,  0),	/* SD0_CLK */
 		[11] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
 		[12] = RCAR_GP_PIN(3,  2),	/* SD0_DAT0 */
@@ -6319,7 +6314,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 3] = RCAR_GP_PIN(5, 23),	/* MLB_CLK */
 		[ 4] = RCAR_GP_PIN(5, 24),	/* MLB_SIG */
 		[ 5] = RCAR_GP_PIN(5, 25),	/* MLB_DAT */
-		[ 6] = PIN_NUMBER('H', 37),	/* MLB_REF */
+		[ 6] = PIN_MLB_REF,		/* MLB_REF */
 		[ 7] = RCAR_GP_PIN(6,  0),	/* SSI_SCK01239 */
 		[ 8] = RCAR_GP_PIN(6,  1),	/* SSI_WS01239 */
 		[ 9] = RCAR_GP_PIN(6,  2),	/* SSI_SDATA0 */
-- 
2.17.1

