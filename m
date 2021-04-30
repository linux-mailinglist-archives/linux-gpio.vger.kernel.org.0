Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD8536FA2D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhD3McF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhD3McF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:05 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7F3C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:16 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id z0XG2400A4p6Y38010XGJJ; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-001ecN-NK; Fri, 30 Apr 2021 14:31:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-00Bdvb-8s; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/12] pinctrl: renesas: r8a77980: Add bias pinconf support
Date:   Fri, 30 Apr 2021 14:31:10 +0200
Message-Id: <448f47ccd89d9bc8621c7fda8c81508deb05cb82.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement support for pull-up and pull-down handling for the R-Car V3H
SoC, using the common R-Car bias handling.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77980.c | 209 ++++++++++++++++++++++++-
 1 file changed, 203 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index 20cff93a2a13ca17..c4825b01449e9e3e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -19,12 +19,23 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)	\
-	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_28(1, fn, sfx),	\
-	PORT_GP_CFG_30(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE), \
-	PORT_GP_25(4, fn, sfx),	\
-	PORT_GP_15(5, fn, sfx)
+	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_30(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN), \
+	PORT_GP_CFG_25(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_15(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN)
+
+#define CPU_ALL_NOGP(fn)	\
+	PIN_NOGP_CFG(DCUTCK_LPDCLK, "DCUTCK_LPDCLK", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(DCUTDI_LPDI, "DCUTDI_LPDI", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(DCUTMS, "DCUTMS", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(DCUTRST_N, "DCUTRST#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(DU_DOTCLKIN, "DU_DOTCLKIN", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(EXTALR, "EXTALR", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(FSCLKST, "FSCLKST", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(FSCLKST_N, "FSCLKST#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 /*
  * F_() : just information
@@ -830,8 +841,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP10_19_16,	FSO_TOE_N),
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
 
 /* - AVB -------------------------------------------------------------------- */
@@ -2945,8 +2965,184 @@ static int r8a77980_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 	return -EINVAL;
 }
 
+static const struct pinmux_bias_reg pinmux_bias_regs[] = {
+	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
+		[ 0] = RCAR_GP_PIN(0, 0),	/* DU_DR2 */
+		[ 1] = RCAR_GP_PIN(0, 1),	/* DU_DR3 */
+		[ 2] = RCAR_GP_PIN(0, 2),	/* DU_DR4 */
+		[ 3] = RCAR_GP_PIN(0, 3),	/* DU_DR5 */
+		[ 4] = RCAR_GP_PIN(0, 4),	/* DU_DR6 */
+		[ 5] = RCAR_GP_PIN(0, 5),	/* DU_DR7 */
+		[ 6] = RCAR_GP_PIN(0, 6),	/* DU_DG2 */
+		[ 7] = RCAR_GP_PIN(0, 7),	/* DU_DG3 */
+		[ 8] = RCAR_GP_PIN(0, 8),	/* DU_DG4 */
+		[ 9] = RCAR_GP_PIN(0, 9),	/* DU_DG5 */
+		[10] = RCAR_GP_PIN(0, 10),	/* DU_DG6 */
+		[11] = RCAR_GP_PIN(0, 11),	/* DU_DG7 */
+		[12] = RCAR_GP_PIN(0, 12),	/* DU_DB2 */
+		[13] = RCAR_GP_PIN(0, 13),	/* DU_DB3 */
+		[14] = RCAR_GP_PIN(0, 14),	/* DU_DB4 */
+		[15] = RCAR_GP_PIN(0, 15),	/* DU_DB5 */
+		[16] = RCAR_GP_PIN(0, 16),	/* DU_DB6 */
+		[17] = RCAR_GP_PIN(0, 17),	/* DU_DB7 */
+		[18] = RCAR_GP_PIN(0, 18),	/* DU_DOTCLKOUT */
+		[19] = RCAR_GP_PIN(0, 19),	/* DU_EXHSYNC/DU_HSYNC */
+		[20] = RCAR_GP_PIN(0, 20),	/* DU_EXVSYNC/DU_VSYNC */
+		[21] = RCAR_GP_PIN(0, 21),	/* DU_EXODDF/DU_ODDF/DISP/CDE */
+		[22] = SH_PFC_PIN_NONE,
+		[23] = SH_PFC_PIN_NONE,
+		[24] = PIN_DU_DOTCLKIN,		/* DU_DOTCLKIN */
+		[25] = SH_PFC_PIN_NONE,
+		[26] = PIN_PRESETOUT_N,		/* PRESETOUT# */
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = PIN_EXTALR,		/* EXTALR */
+		[31] = PIN_FSCLKST_N,		/* FSCLKST# */
+	} },
+	{ PINMUX_BIAS_REG("PUEN1", 0xe6060404, "PUD1", 0xe6060444) {
+		[ 0] = PIN_FSCLKST,		/* FSCLKST */
+		[ 1] = SH_PFC_PIN_NONE,
+		[ 2] = RCAR_GP_PIN(1, 0),	/* IRQ0 */
+		[ 3] = PIN_DCUTRST_N,		/* DCUTRST# */
+		[ 4] = PIN_DCUTCK_LPDCLK,	/* DCUTCK_LPDCLK */
+		[ 5] = PIN_DCUTMS,		/* DCUTMS */
+		[ 6] = PIN_DCUTDI_LPDI,		/* DCUTDI_LPDI */
+		[ 7] = SH_PFC_PIN_NONE,
+		[ 8] = RCAR_GP_PIN(2, 0),	/* VI0_CLK */
+		[ 9] = RCAR_GP_PIN(2, 1),	/* VI0_CLKENB */
+		[10] = RCAR_GP_PIN(2, 2),	/* VI0_HSYNC# */
+		[11] = RCAR_GP_PIN(2, 3),	/* VI0_VSYNC# */
+		[12] = RCAR_GP_PIN(2, 4),	/* VI0_DATA0 */
+		[13] = RCAR_GP_PIN(2, 5),	/* VI0_DATA1 */
+		[14] = RCAR_GP_PIN(2, 6),	/* VI0_DATA2 */
+		[15] = RCAR_GP_PIN(2, 7),	/* VI0_DATA3 */
+		[16] = RCAR_GP_PIN(2, 8),	/* VI0_DATA4 */
+		[17] = RCAR_GP_PIN(2, 9),	/* VI0_DATA5 */
+		[18] = RCAR_GP_PIN(2, 10),	/* VI0_DATA6 */
+		[19] = RCAR_GP_PIN(2, 11),	/* VI0_DATA7 */
+		[20] = RCAR_GP_PIN(2, 12),	/* VI0_DATA8 */
+		[21] = RCAR_GP_PIN(2, 13),	/* VI0_DATA9 */
+		[22] = RCAR_GP_PIN(2, 14),	/* VI0_DATA10 */
+		[23] = RCAR_GP_PIN(2, 15),	/* VI0_DATA11 */
+		[24] = RCAR_GP_PIN(2, 16),	/* VI0_FIELD */
+		[25] = RCAR_GP_PIN(3, 0),	/* VI1_CLK */
+		[26] = RCAR_GP_PIN(3, 1),	/* VI1_CLKENB */
+		[27] = RCAR_GP_PIN(3, 2),	/* VI1_HSYNC# */
+		[28] = RCAR_GP_PIN(3, 3),	/* VI1_VSYNC# */
+		[29] = RCAR_GP_PIN(3, 4),	/* VI1_DATA0 */
+		[30] = RCAR_GP_PIN(3, 5),	/* VI1_DATA1 */
+		[31] = RCAR_GP_PIN(3, 6),	/* VI1_DATA2 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN2", 0xe6060408, "PUD2", 0xe6060448) {
+		[ 0] = RCAR_GP_PIN(3, 7),	/* VI1_DATA3 */
+		[ 1] = RCAR_GP_PIN(3, 8),	/* VI1_DATA4 */
+		[ 2] = RCAR_GP_PIN(3, 9),	/* VI1_DATA5 */
+		[ 3] = RCAR_GP_PIN(3, 10),	/* VI1_DATA6 */
+		[ 4] = RCAR_GP_PIN(3, 11),	/* VI1_DATA7 */
+		[ 5] = RCAR_GP_PIN(3, 12),	/* VI1_DATA8 */
+		[ 6] = RCAR_GP_PIN(3, 13),	/* VI1_DATA9 */
+		[ 7] = RCAR_GP_PIN(3, 14),	/* VI1_DATA10 */
+		[ 8] = RCAR_GP_PIN(3, 15),	/* VI1_DATA11 */
+		[ 9] = RCAR_GP_PIN(3, 16),	/* VI1_FIELD */
+		[10] = RCAR_GP_PIN(4, 0),	/* SCL0 */
+		[11] = RCAR_GP_PIN(4, 1),	/* SDA0 */
+		[12] = RCAR_GP_PIN(4, 2),	/* SCL1 */
+		[13] = RCAR_GP_PIN(4, 3),	/* SDA1 */
+		[14] = RCAR_GP_PIN(4, 4),	/* SCL2 */
+		[15] = RCAR_GP_PIN(4, 5),	/* SDA2 */
+		[16] = RCAR_GP_PIN(1, 1),	/* AVB_RX_CTL */
+		[17] = RCAR_GP_PIN(1, 2),	/* AVB_RXC */
+		[18] = RCAR_GP_PIN(1, 3),	/* AVB_RD0 */
+		[19] = RCAR_GP_PIN(1, 4),	/* AVB_RD1 */
+		[20] = RCAR_GP_PIN(1, 5),	/* AVB_RD2 */
+		[21] = RCAR_GP_PIN(1, 6),	/* AVB_RD3 */
+		[22] = RCAR_GP_PIN(1, 7),	/* AVB_TX_CTL */
+		[23] = RCAR_GP_PIN(1, 8),	/* AVB_TXC */
+		[24] = RCAR_GP_PIN(1, 9),	/* AVB_TD0 */
+		[25] = RCAR_GP_PIN(1, 10),	/* AVB_TD1 */
+		[26] = RCAR_GP_PIN(1, 11),	/* AVB_TD2 */
+		[27] = RCAR_GP_PIN(1, 12),	/* AVB_TD3 */
+		[28] = RCAR_GP_PIN(1, 13),	/* AVB_TXCREFCLK */
+		[29] = RCAR_GP_PIN(1, 14),	/* AVB_MDIO */
+		[30] = RCAR_GP_PIN(1, 15),	/* AVB_MDC */
+		[31] = RCAR_GP_PIN(1, 16),	/* AVB_MAGIC */
+	} },
+	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
+		[ 0] = RCAR_GP_PIN(1, 17),	/* AVB_PHY_INT */
+		[ 1] = RCAR_GP_PIN(1, 18),	/* AVB_LINK */
+		[ 2] = RCAR_GP_PIN(1, 19),	/* AVB_AVTP_MATCH */
+		[ 3] = RCAR_GP_PIN(1, 20),	/* AVTP_CAPTURE */
+		[ 4] = RCAR_GP_PIN(4, 6),	/* GETHER_RX_CTL */
+		[ 5] = RCAR_GP_PIN(4, 7),	/* GETHER_RXC */
+		[ 6] = RCAR_GP_PIN(4, 8),	/* GETHER_RD0 */
+		[ 7] = RCAR_GP_PIN(4, 9),	/* GETHER_RD1 */
+		[ 8] = RCAR_GP_PIN(4, 10),	/* GETHER_RD2 */
+		[ 9] = RCAR_GP_PIN(4, 11),	/* GETHER_RD3 */
+		[10] = RCAR_GP_PIN(4, 12),	/* GETHER_TX_CTL */
+		[11] = RCAR_GP_PIN(4, 13),	/* GETHER_TXC */
+		[12] = RCAR_GP_PIN(4, 14),	/* GETHER_TD0 */
+		[13] = RCAR_GP_PIN(4, 15),	/* GETHER_TD1 */
+		[14] = RCAR_GP_PIN(4, 16),	/* GETHER_TD2 */
+		[15] = RCAR_GP_PIN(4, 17),	/* GETHER_TD3 */
+		[16] = RCAR_GP_PIN(4, 18),	/* GETHER_TXCREFCLK */
+		[17] = RCAR_GP_PIN(4, 19),	/* GETHER_TXCREFCLK_MEGA */
+		[18] = RCAR_GP_PIN(4, 20),	/* GETHER_MDIO_A */
+		[19] = RCAR_GP_PIN(4, 21),	/* GETHER_MDC_A */
+		[20] = RCAR_GP_PIN(4, 22),	/* GETHER_MAGIC */
+		[21] = RCAR_GP_PIN(4, 23),	/* GETHER_PHY_INT_A */
+		[22] = RCAR_GP_PIN(4, 24),	/* GETHER_LINK_A */
+		[23] = RCAR_GP_PIN(1, 21),	/* CANFD0_TX_A */
+		[24] = RCAR_GP_PIN(1, 22),	/* CANFD0_RX_A */
+		[25] = RCAR_GP_PIN(1, 23),	/* CANFD1_TX */
+		[26] = RCAR_GP_PIN(1, 24),	/* CANFD1_RX */
+		[27] = RCAR_GP_PIN(1, 25),	/* CAN_CLK_A */
+		[28] = RCAR_GP_PIN(5, 0),	/* QSPI0_SPCLK */
+		[29] = RCAR_GP_PIN(5, 1),	/* QSPI0_MOSI_IO0 */
+		[30] = RCAR_GP_PIN(5, 2),	/* QSPI0_MISO_IO1 */
+		[31] = RCAR_GP_PIN(5, 3),	/* QSPI0_IO2 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN4", 0xe6060410, "PUD4", 0xe6060450) {
+		[ 0] = RCAR_GP_PIN(5, 4),	/* QSPI0_IO3 */
+		[ 1] = RCAR_GP_PIN(5, 5),	/* QSPI0_SSL */
+		[ 2] = RCAR_GP_PIN(5, 6),	/* QSPI1_SPCLK */
+		[ 3] = RCAR_GP_PIN(5, 7),	/* QSPI1_MOSI_IO0 */
+		[ 4] = RCAR_GP_PIN(5, 8),	/* QSPI1_MISO_IO1 */
+		[ 5] = RCAR_GP_PIN(5, 9),	/* QSPI1_IO2 */
+		[ 6] = RCAR_GP_PIN(5, 10),	/* QSPI1_IO3 */
+		[ 7] = RCAR_GP_PIN(5, 11),	/* QSPI1_SSL */
+		[ 8] = RCAR_GP_PIN(5, 12),	/* RPC_RESET# */
+		[ 9] = RCAR_GP_PIN(5, 13),	/* RPC_WP# */
+		[10] = RCAR_GP_PIN(5, 14),	/* RPC_INT# */
+		[11] = RCAR_GP_PIN(1, 26),	/* DIGRF_CLKIN */
+		[12] = RCAR_GP_PIN(1, 27),	/* DIGRF_CLKOUT */
+		[13] = RCAR_GP_PIN(2, 17),	/* IRQ4 */
+		[14] = RCAR_GP_PIN(2, 18),	/* IRQ5 */
+		[15] = RCAR_GP_PIN(2, 25),	/* SCL3 */
+		[16] = RCAR_GP_PIN(2, 26),	/* SDA3 */
+		[17] = RCAR_GP_PIN(2, 19),	/* MSIOF0_RXD */
+		[18] = RCAR_GP_PIN(2, 20),	/* MSIOF0_TXD */
+		[19] = RCAR_GP_PIN(2, 21),	/* MSIOF0_SCK */
+		[20] = RCAR_GP_PIN(2, 22),	/* MSIOF0_SYNC */
+		[21] = RCAR_GP_PIN(2, 23),	/* MSIOF0_SS1 */
+		[22] = RCAR_GP_PIN(2, 24),	/* MSIOF0_SS2 */
+		[23] = RCAR_GP_PIN(2, 27),	/* FSO_CFE_0# */
+		[24] = RCAR_GP_PIN(2, 28),	/* FSO_CFE_1# */
+		[25] = RCAR_GP_PIN(2, 29),	/* FSO_TOE# */
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ /* sentinel */ }
+};
+
 static const struct sh_pfc_soc_operations pinmux_ops = {
 	.pin_to_pocctrl = r8a77980_pin_to_pocctrl,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 const struct sh_pfc_soc_info r8a77980_pinmux_info = {
@@ -2964,6 +3160,7 @@ const struct sh_pfc_soc_info r8a77980_pinmux_info = {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
 
 	.pinmux_data = pinmux_data,
-- 
2.25.1

