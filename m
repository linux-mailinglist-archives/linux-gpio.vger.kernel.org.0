Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6B136FA42
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbhD3McN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhD3McI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:08 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5700AC061350
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by andre.telenet-ops.be with bizsmtp
        id z0XG2400d4p6Y38010XGUu; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSIe-001ecM-0T; Fri, 30 Apr 2021 14:31:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-00BdvW-7z; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/12] pinctrl: renesas: r8a77970: Add bias pinconf support
Date:   Fri, 30 Apr 2021 14:31:09 +0200
Message-Id: <bcfad447624d874258a45a92554574b8fe9f712f.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement support for pull-up (most pins, excl. DU_DOTCLKIN and EXTALR)
and pull-down (most pins, excl. JTAG) handling for the R-Car V3M SoC,
using the common R-Car bias handling.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77970.c | 175 ++++++++++++++++++++++++-
 1 file changed, 169 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index 7935826cfae7c9a3..45b0b235c5cc0138 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -19,12 +19,23 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)						\
-	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
-	PORT_GP_28(1, fn, sfx),						\
-	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
-	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
-	PORT_GP_6(4,  fn, sfx),						\
-	PORT_GP_15(5, fn, sfx)
+	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_6(4,  fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PORT_GP_CFG_15(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP_DOWN)
+
+#define CPU_ALL_NOGP(fn)						\
+	PIN_NOGP_CFG(DU_DOTCLKIN, "DU_DOTCLKIN", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
+	PIN_NOGP_CFG(EXTALR, "EXTALR", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
+	PIN_NOGP_CFG(FSCLKST_N, "FSCLKST#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
+	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
+
 /*
  * F_() : just information
  * FM() : macro for FN_xxx / xxx_MARK
@@ -718,8 +729,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP8_27_24,	DIGRF_CLKEN_OUT),
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
 
 /* - AVB0 ------------------------------------------------------------------- */
@@ -2496,8 +2516,150 @@ static int r8a77970_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
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
+		[22] = PIN_DU_DOTCLKIN,		/* DU_DOTCLKIN */
+		[23] = PIN_PRESETOUT_N,		/* PRESETOUT# */
+		[24] = PIN_EXTALR,		/* EXTALR */
+		[25] = PIN_FSCLKST_N,		/* FSCLKST# */
+		[26] = RCAR_GP_PIN(1, 0),	/* IRQ0 */
+		[27] = PIN_TRST_N,		/* TRST# */
+		[28] = PIN_TCK,			/* TCK */
+		[29] = PIN_TMS,			/* TMS */
+		[30] = PIN_TDI,			/* TDI */
+		[31] = RCAR_GP_PIN(2, 0),	/* VI0_CLK */
+	} },
+	{ PINMUX_BIAS_REG("PUEN1", 0xe6060404, "PUD1", 0xe6060444) {
+		[ 0] = RCAR_GP_PIN(2, 1),	/* VI0_CLKENB */
+		[ 1] = RCAR_GP_PIN(2, 2),	/* VI0_HSYNC# */
+		[ 2] = RCAR_GP_PIN(2, 3),	/* VI0_VSYNC# */
+		[ 3] = RCAR_GP_PIN(2, 4),	/* VI0_DATA0 */
+		[ 4] = RCAR_GP_PIN(2, 5),	/* VI0_DATA1 */
+		[ 5] = RCAR_GP_PIN(2, 6),	/* VI0_DATA2 */
+		[ 6] = RCAR_GP_PIN(2, 7),	/* VI0_DATA3 */
+		[ 7] = RCAR_GP_PIN(2, 8),	/* VI0_DATA4 */
+		[ 8] = RCAR_GP_PIN(2, 9),	/* VI0_DATA5 */
+		[ 9] = RCAR_GP_PIN(2, 10),	/* VI0_DATA6 */
+		[10] = RCAR_GP_PIN(2, 11),	/* VI0_DATA7 */
+		[11] = RCAR_GP_PIN(2, 12),	/* VI0_DATA8 */
+		[12] = RCAR_GP_PIN(2, 13),	/* VI0_DATA9 */
+		[13] = RCAR_GP_PIN(2, 14),	/* VI0_DATA10 */
+		[14] = RCAR_GP_PIN(2, 15),	/* VI0_DATA11 */
+		[15] = RCAR_GP_PIN(2, 16),	/* VI0_FIELD */
+		[16] = RCAR_GP_PIN(3, 0),	/* VI1_CLK */
+		[17] = RCAR_GP_PIN(3, 1),	/* VI1_CLKENB */
+		[18] = RCAR_GP_PIN(3, 2),	/* VI1_HSYNC# */
+		[19] = RCAR_GP_PIN(3, 3),	/* VI1_VSYNC# */
+		[20] = RCAR_GP_PIN(3, 4),	/* VI1_DATA0 */
+		[21] = RCAR_GP_PIN(3, 5),	/* VI1_DATA1 */
+		[22] = RCAR_GP_PIN(3, 6),	/* VI1_DATA2 */
+		[23] = RCAR_GP_PIN(3, 7),	/* VI1_DATA3 */
+		[24] = RCAR_GP_PIN(3, 8),	/* VI1_DATA4 */
+		[25] = RCAR_GP_PIN(3, 9),	/* VI1_DATA5 */
+		[26] = RCAR_GP_PIN(3, 10),	/* VI1_DATA6 */
+		[27] = RCAR_GP_PIN(3, 11),	/* VI1_DATA7 */
+		[28] = RCAR_GP_PIN(3, 12),	/* VI1_DATA8 */
+		[29] = RCAR_GP_PIN(3, 13),	/* VI1_DATA9 */
+		[30] = RCAR_GP_PIN(3, 14),	/* VI1_DATA10 */
+		[31] = RCAR_GP_PIN(3, 15),	/* VI1_DATA11 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN2", 0xe6060408, "PUD2", 0xe6060448) {
+		[ 0] = RCAR_GP_PIN(3, 16),	/* VI1_FIELD */
+		[ 1] = RCAR_GP_PIN(4, 0),	/* SCL0 */
+		[ 2] = RCAR_GP_PIN(4, 1),	/* SDA0 */
+		[ 3] = RCAR_GP_PIN(4, 2),	/* SCL1 */
+		[ 4] = RCAR_GP_PIN(4, 3),	/* SDA1 */
+		[ 5] = RCAR_GP_PIN(4, 4),	/* SCL2 */
+		[ 6] = RCAR_GP_PIN(4, 5),	/* SDA2 */
+		[ 7] = RCAR_GP_PIN(1, 1),	/* AVB0_RX_CTL */
+		[ 8] = RCAR_GP_PIN(1, 2),	/* AVB0_RXC */
+		[ 9] = RCAR_GP_PIN(1, 3),	/* AVB0_RD0 */
+		[10] = RCAR_GP_PIN(1, 4),	/* AVB0_RD1 */
+		[11] = RCAR_GP_PIN(1, 5),	/* AVB0_RD2 */
+		[12] = RCAR_GP_PIN(1, 6),	/* AVB0_RD3 */
+		[13] = RCAR_GP_PIN(1, 7),	/* AVB0_TX_CTL */
+		[14] = RCAR_GP_PIN(1, 8),	/* AVB0_TXC */
+		[15] = RCAR_GP_PIN(1, 9),	/* AVB0_TD0 */
+		[16] = RCAR_GP_PIN(1, 10),	/* AVB0_TD1 */
+		[17] = RCAR_GP_PIN(1, 11),	/* AVB0_TD2 */
+		[18] = RCAR_GP_PIN(1, 12),	/* AVB0_TD3 */
+		[19] = RCAR_GP_PIN(1, 13),	/* AVB0_TXCREFCLK */
+		[20] = RCAR_GP_PIN(1, 14),	/* AVB0_MDIO */
+		[21] = RCAR_GP_PIN(1, 15),	/* AVB0_MDC */
+		[22] = RCAR_GP_PIN(1, 16),	/* AVB0_MAGIC */
+		[23] = RCAR_GP_PIN(1, 17),	/* AVB0_PHY_INT */
+		[24] = RCAR_GP_PIN(1, 18),	/* AVB0_LINK */
+		[25] = RCAR_GP_PIN(1, 19),	/* AVB0_AVTP_MATCH */
+		[26] = RCAR_GP_PIN(1, 20),	/* AVB0_AVTP_CAPTURE */
+		[27] = RCAR_GP_PIN(1, 21),	/* CANFD0_TX_A */
+		[28] = RCAR_GP_PIN(1, 22),	/* CANFD0_RX_A */
+		[29] = RCAR_GP_PIN(1, 23),	/* CANFD1_TX */
+		[30] = RCAR_GP_PIN(1, 24),	/* CANFD1_RX */
+		[31] = RCAR_GP_PIN(1, 25),	/* CANFD_CLK */
+	} },
+	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
+		[ 0] = RCAR_GP_PIN(5, 0),	/* QSPI0_SPCLK */
+		[ 1] = RCAR_GP_PIN(5, 1),	/* QSPI0_MOSI_IO0 */
+		[ 2] = RCAR_GP_PIN(5, 2),	/* QSPI0_MISO_IO1 */
+		[ 3] = RCAR_GP_PIN(5, 3),	/* QSPI0_IO2 */
+		[ 4] = RCAR_GP_PIN(5, 4),	/* QSPI0_IO3 */
+		[ 5] = RCAR_GP_PIN(5, 5),	/* QSPI0_SSL */
+		[ 6] = RCAR_GP_PIN(5, 6),	/* QSPI1_SPCLK */
+		[ 7] = RCAR_GP_PIN(5, 7),	/* QSPI1_MOSI_IO0 */
+		[ 8] = RCAR_GP_PIN(5, 8),	/* QSPI1_MISO_IO1 */
+		[ 9] = RCAR_GP_PIN(5, 9),	/* QSPI1_IO2 */
+		[10] = RCAR_GP_PIN(5, 10),	/* QSPI1_IO3 */
+		[11] = RCAR_GP_PIN(5, 11),	/* QSPI1_SSL */
+		[12] = RCAR_GP_PIN(5, 12),	/* RPC_RESET# */
+		[13] = RCAR_GP_PIN(5, 13),	/* RPC_WP# */
+		[14] = RCAR_GP_PIN(5, 14),	/* RPC_INT# */
+		[15] = RCAR_GP_PIN(1, 26),	/* DIGRF_CLKIN */
+		[16] = RCAR_GP_PIN(1, 27),	/* DIGRF_CLKOUT */
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
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ /* sentinel */ }
+};
+
 static const struct sh_pfc_soc_operations pinmux_ops = {
 	.pin_to_pocctrl = r8a77970_pin_to_pocctrl,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 const struct sh_pfc_soc_info r8a77970_pinmux_info = {
@@ -2515,6 +2677,7 @@ const struct sh_pfc_soc_info r8a77970_pinmux_info = {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
 
 	.pinmux_data = pinmux_data,
-- 
2.25.1

