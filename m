Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAD436FA3C
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhD3McL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbhD3McH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:07 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CE5C061349
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by xavier.telenet-ops.be with bizsmtp
        id z0XF2400a4p6Y38010XGu7; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-001ecI-Jj; Fri, 30 Apr 2021 14:31:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-00Bdv7-3S; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/12] pinctrl: renesas: r8a77470: Add bias pinconf support
Date:   Fri, 30 Apr 2021 14:31:05 +0200
Message-Id: <18c8ebf9fa9e239253a723857e9dffeec775db7e.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement support for pull-up (most pins) and pull-down (ASEBRK#/ACK)
handling for the RZ/G1C SoC, using the common R-Car bias handling.

Note that on RZ/G1C, the "ASEBRK#/ACK" pin is called "ACK", but the code
doesn't handle that naming difference.  Hence users should use the R-Car
naming in DTS files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 346 ++++++++++++++++++++++---
 1 file changed, 306 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index b3b116da1bb0dd35..e6e5487691c16f35 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -11,46 +11,56 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)						\
-	PORT_GP_4(0, fn, sfx),						\
-	PORT_GP_1(0, 4, fn, sfx),					\
-	PORT_GP_CFG_1(0,  5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0,  6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0,  7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0,  8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0,  9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_1(0, 11, fn, sfx),					\
-	PORT_GP_1(0, 12, fn, sfx),					\
-	PORT_GP_CFG_1(0, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(0, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_23(1, fn, sfx),						\
-	PORT_GP_32(2, fn, sfx),						\
-	PORT_GP_17(3, fn, sfx),						\
-	PORT_GP_1(3, 27, fn, sfx),					\
-	PORT_GP_1(3, 28, fn, sfx),					\
-	PORT_GP_1(3, 29, fn, sfx),					\
-	PORT_GP_14(4, fn, sfx),						\
-	PORT_GP_CFG_1(4, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(4, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(4, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(4, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(4, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_CFG_1(4, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
-	PORT_GP_1(4, 20, fn, sfx),					\
-	PORT_GP_1(4, 21, fn, sfx),					\
-	PORT_GP_1(4, 22, fn, sfx),					\
-	PORT_GP_1(4, 23, fn, sfx),					\
-	PORT_GP_1(4, 24, fn, sfx),					\
-	PORT_GP_1(4, 25, fn, sfx),					\
-	PORT_GP_32(5, fn, sfx)
+	PORT_GP_CFG_4(0,  fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(0,  4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(0,  5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0,  9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 11, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(0, 12, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(0, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(0, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_23(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(3, 27, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(3, 28, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(3, 29, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_14(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(4, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(4, 20, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(4, 21, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(4, 22, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(4, 23, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(4, 24, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(4, 25, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_32(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
+
+#define CPU_ALL_NOGP(fn)						\
+	PIN_NOGP_CFG(ASEBRK_N_ACK, "ASEBRK#/ACK", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
+	PIN_NOGP_CFG(NMI, "NMI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT#", fn, SH_PFC_PIN_CFG_PULL_UP),	\
+	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TDO, "TDO", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
 
 enum {
 	PINMUX_RESERVED = 0,
@@ -1121,8 +1131,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP17_27_24, VI0_VSYNC_N),
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
@@ -3420,8 +3439,254 @@ static int r8a77470_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 	return bit;
 }
 
+static const struct pinmux_bias_reg pinmux_bias_regs[] = {
+	{ PINMUX_BIAS_REG("PUPR0", 0xe6060100, "N/A", 0) {
+		/* PUPR0 pull-up pins */
+		[ 0] = RCAR_GP_PIN(1, 0),	/* D0 */
+		[ 1] = RCAR_GP_PIN(0, 22),	/* MMC0_D7 */
+		[ 2] = RCAR_GP_PIN(0, 21),	/* MMC0_D6 */
+		[ 3] = RCAR_GP_PIN(0, 20),	/* MMC0_D5 */
+		[ 4] = RCAR_GP_PIN(0, 19),	/* MMC0_D4 */
+		[ 5] = RCAR_GP_PIN(0, 18),	/* MMC0_D3 */
+		[ 6] = RCAR_GP_PIN(0, 17),	/* MMC0_D2 */
+		[ 7] = RCAR_GP_PIN(0, 16),	/* MMC0_D1 */
+		[ 8] = RCAR_GP_PIN(0, 15),	/* MMC0_D0 */
+		[ 9] = RCAR_GP_PIN(0, 14),	/* MMC0_CMD */
+		[10] = RCAR_GP_PIN(0, 13),	/* MMC0_CLK */
+		[11] = RCAR_GP_PIN(0, 12),	/* SD0_WP */
+		[12] = RCAR_GP_PIN(0, 11),	/* SD0_CD */
+		[13] = RCAR_GP_PIN(0, 10),	/* SD0_DAT3 */
+		[14] = RCAR_GP_PIN(0, 9),	/* SD0_DAT2 */
+		[15] = RCAR_GP_PIN(0, 8),	/* SD0_DAT1 */
+		[16] = RCAR_GP_PIN(0, 7),	/* SD0_DAT0 */
+		[17] = RCAR_GP_PIN(0, 6),	/* SD0_CMD */
+		[18] = RCAR_GP_PIN(0, 5),	/* SD0_CLK */
+		[19] = RCAR_GP_PIN(0, 4),	/* CLKOUT */
+		[20] = PIN_NMI,			/* NMI */
+		[21] = RCAR_GP_PIN(0, 3),	/* USB1_OVC */
+		[22] = RCAR_GP_PIN(0, 2),	/* USB1_PWEN */
+		[23] = RCAR_GP_PIN(0, 1),	/* USB0_OVC */
+		[24] = RCAR_GP_PIN(0, 0),	/* USB0_PWEN */
+		[25] = SH_PFC_PIN_NONE,
+		[26] = PIN_TDO,			/* TDO */
+		[27] = PIN_TDI,			/* TDI */
+		[28] = PIN_TMS,			/* TMS */
+		[29] = PIN_TCK,			/* TCK */
+		[30] = PIN_TRST_N,		/* TRST# */
+		[31] = PIN_PRESETOUT_N,		/* PRESETOUT# */
+	} },
+	{ PINMUX_BIAS_REG("N/A", 0, "PUPR0", 0xe6060100) {
+		/* PUPR0 pull-down pins */
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
+		[25] = PIN_ASEBRK_N_ACK,	/* ASEBRK#/ACK */
+		[26] = SH_PFC_PIN_NONE,
+		[27] = SH_PFC_PIN_NONE,
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("PUPR1", 0xe6060104, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(2, 9),	/* DU0_DG1 */
+		[ 1] = RCAR_GP_PIN(2, 8),	/* DU0_DG0 */
+		[ 2] = RCAR_GP_PIN(2, 7),	/* DU0_DR7 */
+		[ 3] = RCAR_GP_PIN(2, 6),	/* DU0_DR6 */
+		[ 4] = RCAR_GP_PIN(2, 5),	/* DU0_DR5 */
+		[ 5] = RCAR_GP_PIN(2, 4),	/* DU0_DR4 */
+		[ 6] = RCAR_GP_PIN(2, 3),	/* DU0_DR3 */
+		[ 7] = RCAR_GP_PIN(2, 2),	/* DU0_DR2 */
+		[ 8] = RCAR_GP_PIN(2, 1),	/* DU0_DR1 */
+		[ 9] = RCAR_GP_PIN(2, 0),	/* DU0_DR0 */
+		[10] = RCAR_GP_PIN(1, 22),	/* EX_WAIT0 */
+		[11] = RCAR_GP_PIN(1, 21),	/* QSPI0_SSL */
+		[12] = RCAR_GP_PIN(1, 20),	/* QSPI0_IO3 */
+		[13] = RCAR_GP_PIN(1, 19),	/* QSPI0_IO2 */
+		[14] = RCAR_GP_PIN(1, 18),	/* QSPI0_MISO/QSPI0_IO1 */
+		[15] = RCAR_GP_PIN(1, 17),	/* QSPI0_MOSI/QSPI0_IO0 */
+		[16] = RCAR_GP_PIN(1, 16),	/* QSPI0_SPCLK */
+		[17] = RCAR_GP_PIN(1, 15),	/* D15 */
+		[18] = RCAR_GP_PIN(1, 14),	/* D14 */
+		[19] = RCAR_GP_PIN(1, 13),	/* D13 */
+		[20] = RCAR_GP_PIN(1, 12),	/* D12 */
+		[21] = RCAR_GP_PIN(1, 11),	/* D11 */
+		[22] = RCAR_GP_PIN(1, 10),	/* D10 */
+		[23] = RCAR_GP_PIN(1, 9),	/* D9 */
+		[24] = RCAR_GP_PIN(1, 8),	/* D8 */
+		[25] = RCAR_GP_PIN(1, 7),	/* D7 */
+		[26] = RCAR_GP_PIN(1, 6),	/* D6 */
+		[27] = RCAR_GP_PIN(1, 5),	/* D5 */
+		[28] = RCAR_GP_PIN(1, 4),	/* D4 */
+		[29] = RCAR_GP_PIN(1, 3),	/* D3 */
+		[30] = RCAR_GP_PIN(1, 2),	/* D2 */
+		[31] = RCAR_GP_PIN(1, 1),	/* D1 */
+	} },
+	{ PINMUX_BIAS_REG("PUPR2", 0xe6060108, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(3, 9),	/* VI1_CLKENB */
+		[ 1] = RCAR_GP_PIN(3, 8),	/* VI1_DATA7 */
+		[ 2] = RCAR_GP_PIN(3, 7),	/* VI1_DATA6 */
+		[ 3] = RCAR_GP_PIN(3, 6),	/* VI1_DATA5 */
+		[ 4] = RCAR_GP_PIN(3, 5),	/* VI1_DATA4 */
+		[ 5] = RCAR_GP_PIN(3, 4),	/* VI1_DATA3 */
+		[ 6] = RCAR_GP_PIN(3, 3),	/* VI1_DATA2 */
+		[ 7] = RCAR_GP_PIN(3, 2),	/* VI1_DATA1 */
+		[ 8] = RCAR_GP_PIN(3, 1),	/* VI1_DATA0 */
+		[ 9] = RCAR_GP_PIN(3, 0),	/* VI1_CLK */
+		[10] = RCAR_GP_PIN(2, 31),	/* DU0_CDE */
+		[11] = RCAR_GP_PIN(2, 30),	/* DU0_DISP */
+		[12] = RCAR_GP_PIN(2, 29),	/* DU0_EXODDF/DU0_ODDF_DISP_CDE */
+		[13] = RCAR_GP_PIN(2, 28),	/* DU0_EXVSYNC/DU0_VSYNC */
+		[14] = RCAR_GP_PIN(2, 27),	/* DU0_EXHSYNC/DU0_HSYNC */
+		[15] = RCAR_GP_PIN(2, 26),	/* DU0_DOTCLKOUT1 */
+		[16] = RCAR_GP_PIN(2, 25),	/* DU0_DOTCLKOUT0 */
+		[17] = RCAR_GP_PIN(2, 24),	/* DU0_DOTCLKIN */
+		[18] = RCAR_GP_PIN(2, 23),	/* DU0_DB7 */
+		[19] = RCAR_GP_PIN(2, 22),	/* DU0_DB6 */
+		[20] = RCAR_GP_PIN(2, 21),	/* DU0_DB5 */
+		[21] = RCAR_GP_PIN(2, 20),	/* DU0_DB4 */
+		[22] = RCAR_GP_PIN(2, 19),	/* DU0_DB3 */
+		[23] = RCAR_GP_PIN(2, 18),	/* DU0_DB2 */
+		[24] = RCAR_GP_PIN(2, 17),	/* DU0_DB1 */
+		[25] = RCAR_GP_PIN(2, 16),	/* DU0_DB0 */
+		[26] = RCAR_GP_PIN(2, 15),	/* DU0_DG7 */
+		[27] = RCAR_GP_PIN(2, 14),	/* DU0_DG6 */
+		[28] = RCAR_GP_PIN(2, 13),	/* DU0_DG5 */
+		[29] = RCAR_GP_PIN(2, 12),	/* DU0_DG4 */
+		[30] = RCAR_GP_PIN(2, 11),	/* DU0_DG3 */
+		[31] = RCAR_GP_PIN(2, 10),	/* DU0_DG2 */
+	} },
+	{ PINMUX_BIAS_REG("PUPR3", 0xe606010c, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(4, 21),	/* SD2_WP */
+		[ 1] = RCAR_GP_PIN(4, 20),	/* SD2_CD */
+		[ 2] = RCAR_GP_PIN(4, 19),	/* SD2_DAT3 */
+		[ 3] = RCAR_GP_PIN(4, 18),	/* SD2_DAT2 */
+		[ 4] = RCAR_GP_PIN(4, 17),	/* SD2_DAT1 */
+		[ 5] = RCAR_GP_PIN(4, 16),	/* SD2_DAT0 */
+		[ 6] = RCAR_GP_PIN(4, 15),	/* SD2_CMD */
+		[ 7] = RCAR_GP_PIN(4, 14),	/* SD2_CLK */
+		[ 8] = RCAR_GP_PIN(4, 13),	/* HRTS1#_A */
+		[ 9] = RCAR_GP_PIN(4, 12),	/* HCTS1#_A */
+		[10] = RCAR_GP_PIN(4, 11),	/* HTX1_A */
+		[11] = RCAR_GP_PIN(4, 10),	/* HRX1_A */
+		[12] = RCAR_GP_PIN(4, 9),	/* MSIOF0_SS2_A */
+		[13] = RCAR_GP_PIN(4, 8),	/* MSIOF0_SS1_A */
+		[14] = RCAR_GP_PIN(4, 7),	/* MSIOF0_SYNC_A */
+		[15] = RCAR_GP_PIN(4, 6),	/* MSIOF0_SCK_A */
+		[16] = RCAR_GP_PIN(4, 5),	/* MSIOF0_TXD_A */
+		[17] = RCAR_GP_PIN(4, 4),	/* MSIOF0_RXD_A */
+		[18] = RCAR_GP_PIN(4, 3),	/* SDA1_A */
+		[19] = RCAR_GP_PIN(4, 2),	/* SCL1_A */
+		[20] = RCAR_GP_PIN(4, 1),	/* SDA0_A */
+		[21] = RCAR_GP_PIN(4, 0),	/* SCL0_A */
+		[22] = RCAR_GP_PIN(3, 29),	/* AVB_TXD5 */
+		[23] = RCAR_GP_PIN(3, 28),	/* AVB_TXD4 */
+		[24] = RCAR_GP_PIN(3, 27),	/* AVB_TXD3 */
+		[25] = RCAR_GP_PIN(3, 16),	/* VI1_DATA11 */
+		[26] = RCAR_GP_PIN(3, 15),	/* VI1_DATA10 */
+		[27] = RCAR_GP_PIN(3, 14),	/* VI1_DATA9 */
+		[28] = RCAR_GP_PIN(3, 13),	/* VI1_DATA8 */
+		[29] = RCAR_GP_PIN(3, 12),	/* VI1_VSYNC# */
+		[30] = RCAR_GP_PIN(3, 11),	/* VI1_HSYNC# */
+		[31] = RCAR_GP_PIN(3, 10),	/* VI1_FIELD */
+	} },
+	{ PINMUX_BIAS_REG("PUPR4", 0xe6060110, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(5, 27),	/* SSI_SDATA9_A */
+		[ 1] = RCAR_GP_PIN(5, 26),	/* SSI_WS9_A */
+		[ 2] = RCAR_GP_PIN(5, 25),	/* SSI_SCK9_A */
+		[ 3] = RCAR_GP_PIN(5, 24),	/* SSI_SDATA2_A */
+		[ 4] = RCAR_GP_PIN(5, 23),	/* SSI_WS2_A */
+		[ 5] = RCAR_GP_PIN(5, 22),	/* SSI_SCK2_A */
+		[ 6] = RCAR_GP_PIN(5, 21),	/* SSI_SDATA1_A */
+		[ 7] = RCAR_GP_PIN(5, 20),	/* SSI_WS1_A */
+		[ 8] = RCAR_GP_PIN(5, 19),	/* SSI_SDATA8_A */
+		[ 9] = RCAR_GP_PIN(5, 18),	/* SSI_SCK1_A */
+		[10] = RCAR_GP_PIN(5, 17),	/* SSI_SDATA4_A */
+		[11] = RCAR_GP_PIN(5, 16),	/* SSI_WS4_A */
+		[12] = RCAR_GP_PIN(5, 15),	/* SSI_SCK4_A */
+		[13] = RCAR_GP_PIN(5, 14),	/* SSI_SDATA3 */
+		[14] = RCAR_GP_PIN(5, 13),	/* SSI_WS34 */
+		[15] = RCAR_GP_PIN(5, 12),	/* SSI_SCK34 */
+		[16] = RCAR_GP_PIN(5, 11),	/* SSI_SDATA0_A */
+		[17] = RCAR_GP_PIN(5, 10),	/* SSI_WS0129_A */
+		[18] = RCAR_GP_PIN(5, 9),	/* SSI_SCK0129_A */
+		[19] = RCAR_GP_PIN(5, 8),	/* SSI_SDATA7_A */
+		[20] = RCAR_GP_PIN(5, 7),	/* SSI_WS78_A */
+		[21] = RCAR_GP_PIN(5, 6),	/* SSI_SCK78_A */
+		[22] = RCAR_GP_PIN(5, 5),	/* SSI_SDATA6_A */
+		[23] = RCAR_GP_PIN(5, 4),	/* SSI_WS6_A */
+		[24] = RCAR_GP_PIN(5, 3),	/* SSI_SCK6_A */
+		[25] = RCAR_GP_PIN(5, 2),	/* SSI_SDATA5_A */
+		[26] = RCAR_GP_PIN(5, 1),	/* SSI_WS5_A */
+		[27] = RCAR_GP_PIN(5, 0),	/* SSI_SCK5_A */
+		[28] = RCAR_GP_PIN(4, 25),	/* SDA2_A */
+		[29] = RCAR_GP_PIN(4, 24),	/* SCL2_A */
+		[30] = RCAR_GP_PIN(4, 23),	/* TX3_A */
+		[31] = RCAR_GP_PIN(4, 22),	/* RX3_A */
+	} },
+	{ PINMUX_BIAS_REG("PUPR5", 0xe6060114, "N/A", 0) {
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
+		[28] = RCAR_GP_PIN(5, 31),	/* AUDIO_CLKOUT_A */
+		[29] = RCAR_GP_PIN(5, 30),	/* AUDIO_CLKC_A */
+		[30] = RCAR_GP_PIN(5, 29),	/* AUDIO_CLKB_A */
+		[31] = RCAR_GP_PIN(5, 28),	/* AUDIO_CLKA_A */
+	} },
+	{ /* sentinel */ }
+};
+
 static const struct sh_pfc_soc_operations r8a77470_pinmux_ops = {
 	.pin_to_pocctrl = r8a77470_pin_to_pocctrl,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 #ifdef CONFIG_PINCTRL_PFC_R8A77470
@@ -3440,6 +3705,7 @@ const struct sh_pfc_soc_info r8a77470_pinmux_info = {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
-- 
2.25.1

