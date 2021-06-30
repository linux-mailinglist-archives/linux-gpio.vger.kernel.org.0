Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440D63B8566
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 16:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbhF3OxU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 10:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235657AbhF3OxS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 10:53:18 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB44EC061756
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jun 2021 07:50:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7d95:f75f:5ece:4663])
        by baptiste.telenet-ops.be with bizsmtp
        id PSql2500D4F6zkK01Sql7T; Wed, 30 Jun 2021 16:50:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lybY5-0059dK-2C; Wed, 30 Jun 2021 16:50:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lybY4-005c68-Cl; Wed, 30 Jun 2021 16:50:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] pinctrl: renesas: r8a77995: Add bias pinconf support
Date:   Wed, 30 Jun 2021 16:50:43 +0200
Message-Id: <04aad2b0bf82a32fb08e5e21e4ac1fb03452724f.1625064076.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625064076.git.geert+renesas@glider.be>
References: <cover.1625064076.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement support for pull-up (most pins, excl. DU_DOTCLKIN0) and
pull-down (most pins, excl. JTAG) handling for the R-Car D3 SoC, using
some parts from the common R-Car bias handling, which requires making
rcar_pin_to_bias_reg() public.

R-Car D3 needs special handling for the NFRE# (GP_3_0) and NFWE#
(GP_3_1) pins.  Unlike all other pins, they are controlled by different
bits in the LSI pin pull-up/down control register (PUD2) than in the LSI
pin pull-enable register (PUEN2).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2:
  - Add Reviewed-by,
  - Fix NFRE# and NFWE# handling.
---
 drivers/pinctrl/renesas/pfc-r8a77995.c | 320 ++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pinctrl.c      |   2 +-
 drivers/pinctrl/renesas/sh_pfc.h       |   3 +
 3 files changed, 316 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index b479f87a3b23f0f1..c56e1e4c13b39cf3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -14,16 +14,27 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 
+#include "core.h"
 #include "sh_pfc.h"
 
-#define CPU_ALL_GP(fn, sfx)			\
-		PORT_GP_9(0,  fn, sfx),		\
-		PORT_GP_32(1, fn, sfx),		\
-		PORT_GP_32(2, fn, sfx),		\
-		PORT_GP_CFG_10(3,  fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-		PORT_GP_32(4, fn, sfx),		\
-		PORT_GP_21(5, fn, sfx),		\
-		PORT_GP_14(6, fn, sfx)
+#define CPU_ALL_GP(fn, sfx)						\
+	PORT_GP_CFG_9(0,  fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_32(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_10(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_32(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_21(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_14(6, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN)
+
+#define CPU_ALL_NOGP(fn)						\
+	PIN_NOGP_CFG(DU_DOTCLKIN0, "DU_DOTCLKIN0", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
+	PIN_NOGP_CFG(FSCLKST_N, "FSCLKST#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(MLB_REF, "MLB_REF", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
 
 /*
  * F_() : just information
@@ -930,8 +941,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP13_7_4,	TPU0TO3_A),
 };
 
+/*
+ * Pins not associated with a GPIO port.
+ */
+enum {
+	GP_ASSIGN_LAST(),
+	NOGP_ALL(),
+};
+
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
+	PINMUX_NOGP_ALL(),
 };
 
 /* - AUDIO CLOCK ------------------------------------------------------------- */
@@ -2834,6 +2854,214 @@ static int r8a77995_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *po
 	return bit;
 }
 
+static const struct pinmux_bias_reg pinmux_bias_regs[] = {
+	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
+		[ 0] = RCAR_GP_PIN(1, 9),	/* DU_DG1 */
+		[ 1] = RCAR_GP_PIN(1, 8),	/* DU_DG0 */
+		[ 2] = RCAR_GP_PIN(1, 7),	/* DU_DB7 */
+		[ 3] = RCAR_GP_PIN(1, 6),	/* DU_DB6 */
+		[ 4] = RCAR_GP_PIN(1, 5),	/* DU_DB5 */
+		[ 5] = RCAR_GP_PIN(1, 4),	/* DU_DB4 */
+		[ 6] = RCAR_GP_PIN(1, 3),	/* DU_DB3 */
+		[ 7] = RCAR_GP_PIN(1, 2),	/* DU_DB2 */
+		[ 8] = RCAR_GP_PIN(1, 1),	/* DU_DB1 */
+		[ 9] = RCAR_GP_PIN(1, 0),	/* DU_DB0 */
+		[10] = PIN_MLB_REF,		/* MLB_REF */
+		[11] = RCAR_GP_PIN(0, 8),	/* MLB_SIG */
+		[12] = RCAR_GP_PIN(0, 7),	/* MLB_DAT */
+		[13] = RCAR_GP_PIN(0, 6),	/* MLB_CLK */
+		[14] = RCAR_GP_PIN(0, 5),	/* MSIOF2_RXD */
+		[15] = RCAR_GP_PIN(0, 4),	/* MSIOF2_TXD */
+		[16] = RCAR_GP_PIN(0, 3),	/* MSIOF2_SCK */
+		[17] = RCAR_GP_PIN(0, 2),	/* IRQ0_A */
+		[18] = RCAR_GP_PIN(0, 1),	/* USB0_OVC */
+		[19] = RCAR_GP_PIN(0, 0),	/* USB0_PWEN */
+		[20] = PIN_PRESETOUT_N,		/* PRESETOUT# */
+		[21] = PIN_DU_DOTCLKIN0,	/* DU_DOTCLKIN0 */
+		[22] = PIN_FSCLKST_N,		/* FSCLKST# */
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = PIN_TDI,			/* TDI */
+		[29] = PIN_TMS,			/* TMS */
+		[30] = PIN_TCK,			/* TCK */
+		[31] = PIN_TRST_N,		/* TRST# */
+	} },
+	{ PINMUX_BIAS_REG("PUEN1", 0xe6060404, "PUD1", 0xe6060444) {
+		[ 0] = RCAR_GP_PIN(2, 9),	/* VI4_DATA8 */
+		[ 1] = RCAR_GP_PIN(2, 8),	/* VI4_DATA7 */
+		[ 2] = RCAR_GP_PIN(2, 7),	/* VI4_DATA6 */
+		[ 3] = RCAR_GP_PIN(2, 6),	/* VI4_DATA5 */
+		[ 4] = RCAR_GP_PIN(2, 5),	/* VI4_DATA4 */
+		[ 5] = RCAR_GP_PIN(2, 4),	/* VI4_DATA3 */
+		[ 6] = RCAR_GP_PIN(2, 3),	/* VI4_DATA2 */
+		[ 7] = RCAR_GP_PIN(2, 2),	/* VI4_DATA1 */
+		[ 8] = RCAR_GP_PIN(2, 1),	/* VI4_DATA0 */
+		[ 9] = RCAR_GP_PIN(2, 0),	/* VI4_CLK */
+		[10] = RCAR_GP_PIN(1, 31),	/* QPOLB */
+		[11] = RCAR_GP_PIN(1, 30),	/* QPOLA */
+		[12] = RCAR_GP_PIN(1, 29),	/* DU_CDE */
+		[13] = RCAR_GP_PIN(1, 28),	/* DU_DISP/CDE */
+		[14] = RCAR_GP_PIN(1, 27),	/* DU_DISP */
+		[15] = RCAR_GP_PIN(1, 26),	/* DU_VSYNC */
+		[16] = RCAR_GP_PIN(1, 25),	/* DU_HSYNC */
+		[17] = RCAR_GP_PIN(1, 24),	/* DU_DOTCLKOUT0 */
+		[18] = RCAR_GP_PIN(1, 23),	/* DU_DR7 */
+		[19] = RCAR_GP_PIN(1, 22),	/* DU_DR6 */
+		[20] = RCAR_GP_PIN(1, 21),	/* DU_DR5 */
+		[21] = RCAR_GP_PIN(1, 20),	/* DU_DR4 */
+		[22] = RCAR_GP_PIN(1, 19),	/* DU_DR3 */
+		[23] = RCAR_GP_PIN(1, 18),	/* DU_DR2 */
+		[24] = RCAR_GP_PIN(1, 17),	/* DU_DR1 */
+		[25] = RCAR_GP_PIN(1, 16),	/* DU_DR0 */
+		[26] = RCAR_GP_PIN(1, 15),	/* DU_DG7 */
+		[27] = RCAR_GP_PIN(1, 14),	/* DU_DG6 */
+		[28] = RCAR_GP_PIN(1, 13),	/* DU_DG5 */
+		[29] = RCAR_GP_PIN(1, 12),	/* DU_DG4 */
+		[30] = RCAR_GP_PIN(1, 11),	/* DU_DG3 */
+		[31] = RCAR_GP_PIN(1, 10),	/* DU_DG2 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN2", 0xe6060408, "PUD2", 0xe6060448) {
+		[ 0] = RCAR_GP_PIN(3, 8),	/* NFDATA6 */
+		[ 1] = RCAR_GP_PIN(3, 7),	/* NFDATA5 */
+		[ 2] = RCAR_GP_PIN(3, 6),	/* NFDATA4 */
+		[ 3] = RCAR_GP_PIN(3, 5),	/* NFDATA3 */
+		[ 4] = RCAR_GP_PIN(3, 4),	/* NFDATA2 */
+		[ 5] = RCAR_GP_PIN(3, 3),	/* NFDATA1 */
+		[ 6] = RCAR_GP_PIN(3, 2),	/* NFDATA0 */
+		[ 7] = RCAR_GP_PIN(3, 1),	/* NFWE# (PUEN) / NFRE# (PUD) */
+		[ 8] = RCAR_GP_PIN(3, 0),	/* NFRE# (PUEN) / NFWE# (PUD) */
+		[ 9] = RCAR_GP_PIN(4, 0),	/* NFRB# */
+		[10] = RCAR_GP_PIN(2, 31),	/* NFCE# */
+		[11] = RCAR_GP_PIN(2, 30),	/* NFCLE */
+		[12] = RCAR_GP_PIN(2, 29),	/* NFALE */
+		[13] = RCAR_GP_PIN(2, 28),	/* VI4_CLKENB */
+		[14] = RCAR_GP_PIN(2, 27),	/* VI4_FIELD */
+		[15] = RCAR_GP_PIN(2, 26),	/* VI4_HSYNC# */
+		[16] = RCAR_GP_PIN(2, 25),	/* VI4_VSYNC# */
+		[17] = RCAR_GP_PIN(2, 24),	/* VI4_DATA23 */
+		[18] = RCAR_GP_PIN(2, 23),	/* VI4_DATA22 */
+		[19] = RCAR_GP_PIN(2, 22),	/* VI4_DATA21 */
+		[20] = RCAR_GP_PIN(2, 21),	/* VI4_DATA20 */
+		[21] = RCAR_GP_PIN(2, 20),	/* VI4_DATA19 */
+		[22] = RCAR_GP_PIN(2, 19),	/* VI4_DATA18 */
+		[23] = RCAR_GP_PIN(2, 18),	/* VI4_DATA17 */
+		[24] = RCAR_GP_PIN(2, 17),	/* VI4_DATA16 */
+		[25] = RCAR_GP_PIN(2, 16),	/* VI4_DATA15 */
+		[26] = RCAR_GP_PIN(2, 15),	/* VI4_DATA14 */
+		[27] = RCAR_GP_PIN(2, 14),	/* VI4_DATA13 */
+		[28] = RCAR_GP_PIN(2, 13),	/* VI4_DATA12 */
+		[29] = RCAR_GP_PIN(2, 12),	/* VI4_DATA11 */
+		[30] = RCAR_GP_PIN(2, 11),	/* VI4_DATA10 */
+		[31] = RCAR_GP_PIN(2, 10),	/* VI4_DATA9 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
+		[ 0] = RCAR_GP_PIN(4, 31),	/* CAN0_RX_A */
+		[ 1] = RCAR_GP_PIN(5, 2),	/* CAN_CLK */
+		[ 2] = RCAR_GP_PIN(5, 1),	/* TPU0TO1_A */
+		[ 3] = RCAR_GP_PIN(5, 0),	/* TPU0TO0_A */
+		[ 4] = RCAR_GP_PIN(4, 27),	/* TX2 */
+		[ 5] = RCAR_GP_PIN(4, 26),	/* RX2 */
+		[ 6] = RCAR_GP_PIN(4, 25),	/* SCK2 */
+		[ 7] = RCAR_GP_PIN(4, 24),	/* TX1_A */
+		[ 8] = RCAR_GP_PIN(4, 23),	/* RX1_A */
+		[ 9] = RCAR_GP_PIN(4, 22),	/* SCK1_A */
+		[10] = RCAR_GP_PIN(4, 21),	/* TX0_A */
+		[11] = RCAR_GP_PIN(4, 20),	/* RX0_A */
+		[12] = RCAR_GP_PIN(4, 19),	/* SCK0_A */
+		[13] = RCAR_GP_PIN(4, 18),	/* MSIOF1_RXD */
+		[14] = RCAR_GP_PIN(4, 17),	/* MSIOF1_TXD */
+		[15] = RCAR_GP_PIN(4, 16),	/* MSIOF1_SCK */
+		[16] = RCAR_GP_PIN(4, 15),	/* MSIOF0_RXD */
+		[17] = RCAR_GP_PIN(4, 14),	/* MSIOF0_TXD */
+		[18] = RCAR_GP_PIN(4, 13),	/* MSIOF0_SYNC */
+		[19] = RCAR_GP_PIN(4, 12),	/* MSIOF0_SCK */
+		[20] = RCAR_GP_PIN(4, 11),	/* SDA1 */
+		[21] = RCAR_GP_PIN(4, 10),	/* SCL1 */
+		[22] = RCAR_GP_PIN(4, 9),	/* SDA0 */
+		[23] = RCAR_GP_PIN(4, 8),	/* SCL0 */
+		[24] = RCAR_GP_PIN(4, 7),	/* SSI_WS4_A */
+		[25] = RCAR_GP_PIN(4, 6),	/* SSI_SDATA4_A */
+		[26] = RCAR_GP_PIN(4, 5),	/* SSI_SCK4_A */
+		[27] = RCAR_GP_PIN(4, 4),	/* SSI_WS34 */
+		[28] = RCAR_GP_PIN(4, 3),	/* SSI_SDATA3 */
+		[29] = RCAR_GP_PIN(4, 2),	/* SSI_SCK34 */
+		[30] = RCAR_GP_PIN(4, 1),	/* AUDIO_CLKA */
+		[31] = RCAR_GP_PIN(3, 9),	/* NFDATA7 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN4", 0xe6060410, "PUD4", 0xe6060450) {
+		[ 0] = RCAR_GP_PIN(6, 10),	/* QSPI1_IO3 */
+		[ 1] = RCAR_GP_PIN(6, 9),	/* QSPI1_IO2 */
+		[ 2] = RCAR_GP_PIN(6, 8),	/* QSPI1_MISO_IO1 */
+		[ 3] = RCAR_GP_PIN(6, 7),	/* QSPI1_MOSI_IO0 */
+		[ 4] = RCAR_GP_PIN(6, 6),	/* QSPI1_SPCLK */
+		[ 5] = RCAR_GP_PIN(6, 5),	/* QSPI0_SSL */
+		[ 6] = RCAR_GP_PIN(6, 4),	/* QSPI0_IO3 */
+		[ 7] = RCAR_GP_PIN(6, 3),	/* QSPI0_IO2 */
+		[ 8] = RCAR_GP_PIN(6, 2),	/* QSPI0_MISO_IO1 */
+		[ 9] = RCAR_GP_PIN(6, 1),	/* QSPI0_MOSI_IO0 */
+		[10] = RCAR_GP_PIN(6, 0),	/* QSPI0_SPCLK */
+		[11] = RCAR_GP_PIN(5, 20),	/* AVB0_LINK */
+		[12] = RCAR_GP_PIN(5, 19),	/* AVB0_PHY_INT */
+		[13] = RCAR_GP_PIN(5, 18),	/* AVB0_MAGIC */
+		[14] = RCAR_GP_PIN(5, 17),	/* AVB0_MDC */
+		[15] = RCAR_GP_PIN(5, 16),	/* AVB0_MDIO */
+		[16] = RCAR_GP_PIN(5, 15),	/* AVB0_TXCREFCLK */
+		[17] = RCAR_GP_PIN(5, 14),	/* AVB0_TD3 */
+		[18] = RCAR_GP_PIN(5, 13),	/* AVB0_TD2 */
+		[19] = RCAR_GP_PIN(5, 12),	/* AVB0_TD1 */
+		[20] = RCAR_GP_PIN(5, 11),	/* AVB0_TD0 */
+		[21] = RCAR_GP_PIN(5, 10),	/* AVB0_TXC */
+		[22] = RCAR_GP_PIN(5, 9),	/* AVB0_TX_CTL */
+		[23] = RCAR_GP_PIN(5, 8),	/* AVB0_RD3 */
+		[24] = RCAR_GP_PIN(5, 7),	/* AVB0_RD2 */
+		[25] = RCAR_GP_PIN(5, 6),	/* AVB0_RD1 */
+		[26] = RCAR_GP_PIN(5, 5),	/* AVB0_RD0 */
+		[27] = RCAR_GP_PIN(5, 4),	/* AVB0_RXC */
+		[28] = RCAR_GP_PIN(5, 3),	/* AVB0_RX_CTL */
+		[29] = RCAR_GP_PIN(4, 30),	/* CAN1_TX_A */
+		[30] = RCAR_GP_PIN(4, 29),	/* CAN1_RX_A */
+		[31] = RCAR_GP_PIN(4, 28),	/* CAN0_TX_A */
+	} },
+	{ PINMUX_BIAS_REG("PUEN5", 0xe6060414, "PUD4", 0xe6060454) {
+		[ 0] = SH_PFC_PIN_NONE,
+		[ 1] = SH_PFC_PIN_NONE,
+		[ 2] = SH_PFC_PIN_NONE,
+		[ 3] = SH_PFC_PIN_NONE,
+		[ 4] = SH_PFC_PIN_NONE,
+		[ 5] = SH_PFC_PIN_NONE,
+		[ 6] = SH_PFC_PIN_NONE,
+		[ 7] = SH_PFC_PIN_NONE,
+		[ 8] = SH_PFC_PIN_NONE,
+		[ 9] = SH_PFC_PIN_NONE,
+		[10] = SH_PFC_PIN_NONE,
+		[11] = SH_PFC_PIN_NONE,
+		[12] = SH_PFC_PIN_NONE,
+		[13] = SH_PFC_PIN_NONE,
+		[14] = SH_PFC_PIN_NONE,
+		[15] = SH_PFC_PIN_NONE,
+		[16] = SH_PFC_PIN_NONE,
+		[17] = SH_PFC_PIN_NONE,
+		[18] = SH_PFC_PIN_NONE,
+		[19] = SH_PFC_PIN_NONE,
+		[20] = SH_PFC_PIN_NONE,
+		[21] = SH_PFC_PIN_NONE,
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = SH_PFC_PIN_NONE,
+		[25] = SH_PFC_PIN_NONE,
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = RCAR_GP_PIN(6, 13),	/* RPC_INT# */
+		[30] = RCAR_GP_PIN(6, 12),	/* RPC_RESET# */
+		[31] = RCAR_GP_PIN(6, 11),	/* QSPI1_SSL */
+	} },
+	{ /* sentinel */ }
+};
+
 enum ioctrl_regs {
 	TDSELCTRL,
 };
@@ -2843,8 +3071,83 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
+static const struct pinmux_bias_reg *
+r8a77995_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
+			 unsigned int *puen_bit, unsigned int *pud_bit)
+{
+	const struct pinmux_bias_reg *reg;
+	unsigned int bit;
+
+	reg = rcar_pin_to_bias_reg(pfc, pin, &bit);
+	if (!reg)
+		return reg;
+
+	*puen_bit = bit;
+
+	/* NFWE# and NFRE# use different bit positions in PUD2 */
+	switch (pin) {
+	case RCAR_GP_PIN(3, 0):	/* NFRE# */
+		*pud_bit = 7;
+		break;
+
+	case RCAR_GP_PIN(3, 1):	/* NFWE# */
+		*pud_bit = 8;
+		break;
+
+	default:
+		*pud_bit = bit;
+		break;
+	}
+
+	return reg;
+}
+
+static unsigned int r8a77995_pinmux_get_bias(struct sh_pfc *pfc,
+					     unsigned int pin)
+{
+	const struct pinmux_bias_reg *reg;
+	unsigned int puen_bit, pud_bit;
+
+	reg = r8a77995_pin_to_bias_reg(pfc, pin, &puen_bit, &pud_bit);
+	if (!reg)
+		return PIN_CONFIG_BIAS_DISABLE;
+
+	if (!(sh_pfc_read(pfc, reg->puen) & BIT(puen_bit)))
+		return PIN_CONFIG_BIAS_DISABLE;
+	else if (sh_pfc_read(pfc, reg->pud) & BIT(pud_bit))
+		return PIN_CONFIG_BIAS_PULL_UP;
+	else
+		return PIN_CONFIG_BIAS_PULL_DOWN;
+}
+
+static void r8a77995_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
+				     unsigned int bias)
+{
+	const struct pinmux_bias_reg *reg;
+	unsigned int puen_bit, pud_bit;
+	u32 enable, updown;
+
+	reg = r8a77995_pin_to_bias_reg(pfc, pin, &puen_bit, &pud_bit);
+	if (!reg)
+		return;
+
+	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(puen_bit);
+	if (bias != PIN_CONFIG_BIAS_DISABLE) {
+		enable |= BIT(puen_bit);
+
+		updown = sh_pfc_read(pfc, reg->pud) & ~BIT(pud_bit);
+		if (bias == PIN_CONFIG_BIAS_PULL_UP)
+			updown |= BIT(pud_bit);
+
+		sh_pfc_write(pfc, reg->pud, updown);
+	}
+	sh_pfc_write(pfc, reg->puen, enable);
+}
+
 static const struct sh_pfc_soc_operations r8a77995_pinmux_ops = {
 	.pin_to_pocctrl = r8a77995_pin_to_pocctrl,
+	.get_bias = r8a77995_pinmux_get_bias,
+	.set_bias = r8a77995_pinmux_set_bias,
 };
 
 const struct sh_pfc_soc_info r8a77995_pinmux_info = {
@@ -2862,6 +3165,7 @@ const struct sh_pfc_soc_info r8a77995_pinmux_info = {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
 
 	.pinmux_data = pinmux_data,
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 85cb78cfcfa6c37d..f3eecb20c0869a41 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -841,7 +841,7 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
 	return pinctrl_enable(pmx->pctl);
 }
 
-static const struct pinmux_bias_reg *
+const struct pinmux_bias_reg *
 rcar_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
 		     unsigned int *bit)
 {
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 320898861c4b4c56..bf9822ef7e8c67b6 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -781,6 +781,9 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 /*
  * Bias helpers
  */
+const struct pinmux_bias_reg *
+rcar_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
+		     unsigned int *bit);
 unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
 void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 			  unsigned int bias);
-- 
2.25.1

