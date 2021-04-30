Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55AA36FA3B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhD3McL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhD3McH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:07 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4787C061348
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id z0XG2400F4p6Y38010XGJL; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-001ecK-Qw; Fri, 30 Apr 2021 14:31:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-00BdvH-5Z; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/12] pinctrl: renesas: r8a7792: Add bias pinconf support
Date:   Fri, 30 Apr 2021 14:31:07 +0200
Message-Id: <48d2abdd63ee43ed99cb32ed4a5f4d76ba563162.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement support for pull-up (most pins) and pull-down (EDBGREQ)
handling for the R-Car V2H SoC, using the common R-Car bias handling.

Note that the R-Car V2H Hardware User's Manual Rev. 1.00 says that
the LSI Pin Pull-Up Control Register 11 (PUPR11) controls pull-ups for
the {SCK,WS,SDATA}[01] pins.  These are assumed to be typos, as R-Car
V2H has only Serial Sound Interface channels 3 and 4.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7792.c | 533 +++++++++++++++++++++++++-
 1 file changed, 521 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
index f54a7c81005d0a78..3ab56dc768de76d4 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7792.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7792.c
@@ -11,18 +11,29 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)						\
-	PORT_GP_29(0, fn, sfx),						\
-	PORT_GP_23(1, fn, sfx),						\
-	PORT_GP_32(2, fn, sfx),						\
-	PORT_GP_28(3, fn, sfx),						\
-	PORT_GP_17(4, fn, sfx),						\
-	PORT_GP_17(5, fn, sfx),						\
-	PORT_GP_17(6, fn, sfx),						\
-	PORT_GP_17(7, fn, sfx),						\
-	PORT_GP_17(8, fn, sfx),						\
-	PORT_GP_17(9, fn, sfx),						\
-	PORT_GP_32(10, fn, sfx),					\
-	PORT_GP_30(11, fn, sfx)
+	PORT_GP_CFG_29(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_23(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_28(3, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_17(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_17(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_17(6, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_17(7, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_17(8, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_17(9, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_32(10, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_30(11, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
+
+#define CPU_ALL_NOGP(fn)						\
+	PIN_NOGP_CFG(DU0_DOTCLKIN, "DU0_DOTCLKIN", fn, SH_PFC_PIN_CFG_PULL_UP),	\
+	PIN_NOGP_CFG(DU0_DOTCLKOUT, "DU0_DOTCLKOUT", fn, SH_PFC_PIN_CFG_PULL_UP),	\
+	PIN_NOGP_CFG(DU1_DOTCLKIN, "DU1_DOTCLKIN", fn, SH_PFC_PIN_CFG_PULL_UP),	\
+	PIN_NOGP_CFG(DU1_DOTCLKOUT, "DU1_DOTCLKOUT", fn, SH_PFC_PIN_CFG_PULL_UP),	\
+	PIN_NOGP_CFG(EDBGREQ, "EDBGREQ", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
+	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
 
 enum {
 	PINMUX_RESERVED = 0,
@@ -723,8 +734,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP7_20, AUDIO_CLKB),
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
@@ -2779,8 +2799,496 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
+static const struct pinmux_bias_reg pinmux_bias_regs[] = {
+	{ PINMUX_BIAS_REG("PUPR0", 0xe6060100, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(0, 0),	/* DU0_DR0_DATA0 */
+		[ 1] = RCAR_GP_PIN(0, 1),	/* DU0_DR1_DATA1 */
+		[ 2] = RCAR_GP_PIN(0, 2),	/* DU0_DR2_Y4_DATA2 */
+		[ 3] = RCAR_GP_PIN(0, 3),	/* DU0_DR3_Y5_DATA3 */
+		[ 4] = RCAR_GP_PIN(0, 4),	/* DU0_DR4_Y6_DATA4 */
+		[ 5] = RCAR_GP_PIN(0, 5),	/* DU0_DR5_Y7_DATA5 */
+		[ 6] = RCAR_GP_PIN(0, 6),	/* DU0_DR6_Y8_DATA6 */
+		[ 7] = RCAR_GP_PIN(0, 7),	/* DU0_DR7_Y9_DATA7 */
+		[ 8] = RCAR_GP_PIN(0, 8),	/* DU0_DG0_DATA8 */
+		[ 9] = RCAR_GP_PIN(0, 9),	/* DU0_DG1_DATA9 */
+		[10] = RCAR_GP_PIN(0, 10),	/* DU0_DG2_C6_DATA10 */
+		[11] = RCAR_GP_PIN(0, 11),	/* DU0_DG3_C7_DATA11 */
+		[12] = RCAR_GP_PIN(0, 12),	/* DU0_DG4_Y0_DATA12 */
+		[13] = RCAR_GP_PIN(0, 13),	/* DU0_DG5_Y1_DATA13 */
+		[14] = RCAR_GP_PIN(0, 14),	/* DU0_DG6_Y2_DATA14 */
+		[15] = RCAR_GP_PIN(0, 15),	/* DU0_DG7_Y3_DATA15 */
+		[16] = RCAR_GP_PIN(0, 16),	/* DU0_DB0 */
+		[17] = RCAR_GP_PIN(0, 17),	/* DU0_DB1 */
+		[18] = RCAR_GP_PIN(0, 18),	/* DU0_DB2_C0 */
+		[19] = RCAR_GP_PIN(0, 19),	/* DU0_DB3_C1 */
+		[20] = RCAR_GP_PIN(0, 20),	/* DU0_DB4_C2 */
+		[21] = RCAR_GP_PIN(0, 21),	/* DU0_DB5_C3 */
+		[22] = RCAR_GP_PIN(0, 22),	/* DU0_DB6_C4 */
+		[23] = RCAR_GP_PIN(0, 23),	/* DU0_DB7_C5 */
+		[24] = RCAR_GP_PIN(0, 24),	/* DU0_EXHSYNC/DU0_HSYNC */
+		[25] = RCAR_GP_PIN(0, 25),	/* DU0_EXVSYNC/DU0_VSYNC */
+		[26] = RCAR_GP_PIN(0, 26),	/* DU0_EXODDF/DU0_ODDF_DISP_CDE */
+		[27] = RCAR_GP_PIN(0, 27),	/* DU0_DISP */
+		[28] = RCAR_GP_PIN(0, 28),	/* DU0_CDE */
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("PUPR1", 0xe6060104, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(1, 0),	/* DU1_DR2_Y4_DATA0 */
+		[ 1] = RCAR_GP_PIN(1, 1),	/* DU1_DR3_Y5_DATA1 */
+		[ 2] = RCAR_GP_PIN(1, 2),	/* DU1_DR4_Y6_DATA2 */
+		[ 3] = RCAR_GP_PIN(1, 3),	/* DU1_DR5_Y7_DATA3 */
+		[ 4] = RCAR_GP_PIN(1, 4),	/* DU1_DR6_DATA4 */
+		[ 5] = RCAR_GP_PIN(1, 5),	/* DU1_DR7_DATA5 */
+		[ 6] = RCAR_GP_PIN(1, 6),	/* DU1_DG2_C6_DATA6 */
+		[ 7] = RCAR_GP_PIN(1, 7),	/* DU1_DG3_C7_DATA7 */
+		[ 8] = RCAR_GP_PIN(1, 8),	/* DU1_DG4_Y0_DATA8 */
+		[ 9] = RCAR_GP_PIN(1, 9),	/* DU1_DG5_Y1_DATA9 */
+		[10] = RCAR_GP_PIN(1, 10),	/* DU1_DG6_Y2_DATA10 */
+		[11] = RCAR_GP_PIN(1, 11),	/* DU1_DG7_Y3_DATA11 */
+		[12] = RCAR_GP_PIN(1, 12),	/* DU1_DB2_C0_DATA12 */
+		[13] = RCAR_GP_PIN(1, 13),	/* DU1_DB3_C1_DATA13 */
+		[14] = RCAR_GP_PIN(1, 14),	/* DU1_DB4_C2_DATA14 */
+		[15] = RCAR_GP_PIN(1, 15),	/* DU1_DB5_C3_DATA15 */
+		[16] = RCAR_GP_PIN(1, 16),	/* DU1_DB6_C4 */
+		[17] = RCAR_GP_PIN(1, 17),	/* DU1_DB7_C5 */
+		[18] = RCAR_GP_PIN(1, 18),	/* DU1_EXHSYNC/DU1_HSYNC */
+		[19] = RCAR_GP_PIN(1, 19),	/* DU1_EXVSYNC/DU1_VSYNC */
+		[20] = RCAR_GP_PIN(1, 20),	/* DU1_EXODDF/DU1_ODDF_DISP_CDE */
+		[21] = RCAR_GP_PIN(1, 21),	/* DU1_DISP */
+		[22] = RCAR_GP_PIN(1, 22),	/* DU1_CDE */
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
+	{ PINMUX_BIAS_REG("PUPR2", 0xe6060108, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(2, 0),	/* D0 */
+		[ 1] = RCAR_GP_PIN(2, 1),	/* D1 */
+		[ 2] = RCAR_GP_PIN(2, 2),	/* D2 */
+		[ 3] = RCAR_GP_PIN(2, 3),	/* D3 */
+		[ 4] = RCAR_GP_PIN(2, 4),	/* D4 */
+		[ 5] = RCAR_GP_PIN(2, 5),	/* D5 */
+		[ 6] = RCAR_GP_PIN(2, 6),	/* D6 */
+		[ 7] = RCAR_GP_PIN(2, 7),	/* D7 */
+		[ 8] = RCAR_GP_PIN(2, 8),	/* D8 */
+		[ 9] = RCAR_GP_PIN(2, 9),	/* D9 */
+		[10] = RCAR_GP_PIN(2, 10),	/* D10 */
+		[11] = RCAR_GP_PIN(2, 11),	/* D11 */
+		[12] = RCAR_GP_PIN(2, 12),	/* D12 */
+		[13] = RCAR_GP_PIN(2, 13),	/* D13 */
+		[14] = RCAR_GP_PIN(2, 14),	/* D14 */
+		[15] = RCAR_GP_PIN(2, 15),	/* D15 */
+		[16] = RCAR_GP_PIN(2, 16),	/* A0 */
+		[17] = RCAR_GP_PIN(2, 17),	/* A1 */
+		[18] = RCAR_GP_PIN(2, 18),	/* A2 */
+		[19] = RCAR_GP_PIN(2, 19),	/* A3 */
+		[20] = RCAR_GP_PIN(2, 20),	/* A4 */
+		[21] = RCAR_GP_PIN(2, 21),	/* A5 */
+		[22] = RCAR_GP_PIN(2, 22),	/* A6 */
+		[23] = RCAR_GP_PIN(2, 23),	/* A7 */
+		[24] = RCAR_GP_PIN(2, 24),	/* A8 */
+		[25] = RCAR_GP_PIN(2, 25),	/* A9 */
+		[26] = RCAR_GP_PIN(2, 26),	/* A10 */
+		[27] = RCAR_GP_PIN(2, 27),	/* A11 */
+		[28] = RCAR_GP_PIN(2, 28),	/* A12 */
+		[29] = RCAR_GP_PIN(2, 29),	/* A13 */
+		[30] = RCAR_GP_PIN(2, 30),	/* A14 */
+		[31] = RCAR_GP_PIN(2, 31),	/* A15 */
+	} },
+	{ PINMUX_BIAS_REG("PUPR3", 0xe606010c, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(3, 0),	/* A16 */
+		[ 1] = RCAR_GP_PIN(3, 1),	/* A17 */
+		[ 2] = RCAR_GP_PIN(3, 2),	/* A18 */
+		[ 3] = RCAR_GP_PIN(3, 3),	/* A19 */
+		[ 4] = RCAR_GP_PIN(3, 4),	/* A20 */
+		[ 5] = RCAR_GP_PIN(3, 5),	/* A21 */
+		[ 6] = RCAR_GP_PIN(3, 6),	/* CS1#/A26 */
+		[ 7] = RCAR_GP_PIN(3, 7),	/* EX_CS0# */
+		[ 8] = RCAR_GP_PIN(3, 8),	/* EX_CS1# */
+		[ 9] = RCAR_GP_PIN(3, 9),	/* EX_CS2# */
+		[10] = RCAR_GP_PIN(3, 10),	/* EX_CS3# */
+		[11] = RCAR_GP_PIN(3, 11),	/* EX_CS4# */
+		[12] = RCAR_GP_PIN(3, 12),	/* EX_CS5# */
+		[13] = RCAR_GP_PIN(3, 13),	/* BS# */
+		[14] = RCAR_GP_PIN(3, 14),	/* RD# */
+		[15] = RCAR_GP_PIN(3, 15),	/* RD/WR# */
+		[16] = RCAR_GP_PIN(3, 16),	/* WE0# */
+		[17] = RCAR_GP_PIN(3, 17),	/* WE1# */
+		[18] = RCAR_GP_PIN(3, 18),	/* EX_WAIT0 */
+		[19] = RCAR_GP_PIN(3, 19),	/* IRQ0 */
+		[20] = RCAR_GP_PIN(3, 20),	/* IRQ1 */
+		[21] = RCAR_GP_PIN(3, 21),	/* IRQ2 */
+		[22] = RCAR_GP_PIN(3, 22),	/* IRQ3 */
+		[23] = RCAR_GP_PIN(3, 23),	/* A22 */
+		[24] = RCAR_GP_PIN(3, 24),	/* A23 */
+		[25] = RCAR_GP_PIN(3, 25),	/* A24 */
+		[26] = RCAR_GP_PIN(3, 26),	/* A25 */
+		[27] = RCAR_GP_PIN(3, 27),	/* CS0# */
+		[28] = SH_PFC_PIN_NONE,
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("PUPR4", 0xe6060110, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(4, 0),	/* VI0_CLK */
+		[ 1] = RCAR_GP_PIN(4, 1),	/* VI0_CLKENB */
+		[ 2] = RCAR_GP_PIN(4, 2),	/* VI0_HSYNC# */
+		[ 3] = RCAR_GP_PIN(4, 3),	/* VI0_VSYNC# */
+		[ 4] = RCAR_GP_PIN(4, 4),	/* VI0_D0_B0_C0 */
+		[ 5] = RCAR_GP_PIN(4, 5),	/* VI0_D1_B1_C1 */
+		[ 6] = RCAR_GP_PIN(4, 6),	/* VI0_D2_B2_C2 */
+		[ 7] = RCAR_GP_PIN(4, 7),	/* VI0_D3_B3_C3 */
+		[ 8] = RCAR_GP_PIN(4, 8),	/* VI0_D4_B4_C4 */
+		[ 9] = RCAR_GP_PIN(4, 9),	/* VI0_D5_B5_C5 */
+		[10] = RCAR_GP_PIN(4, 10),	/* VI0_D6_B6_C6 */
+		[11] = RCAR_GP_PIN(4, 11),	/* VI0_D7_B7_C7 */
+		[12] = RCAR_GP_PIN(4, 12),	/* VI0_D8_G0_Y0 */
+		[13] = RCAR_GP_PIN(4, 13),	/* VI0_D9_G1_Y1 */
+		[14] = RCAR_GP_PIN(4, 14),	/* VI0_D10_G2_Y2 */
+		[15] = RCAR_GP_PIN(4, 15),	/* VI0_D11_G3_Y3 */
+		[16] = RCAR_GP_PIN(4, 16),	/* VI0_FIELD */
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
+	{ PINMUX_BIAS_REG("PUPR5", 0xe6060114, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(5, 0),	/* VI1_CLK */
+		[ 1] = RCAR_GP_PIN(5, 1),	/* VI1_CLKENB */
+		[ 2] = RCAR_GP_PIN(5, 2),	/* VI1_HSYNC# */
+		[ 3] = RCAR_GP_PIN(5, 3),	/* VI1_VSYNC# */
+		[ 4] = RCAR_GP_PIN(5, 4),	/* VI1_D0_B0_C0 */
+		[ 5] = RCAR_GP_PIN(5, 5),	/* VI1_D1_B1_C1 */
+		[ 6] = RCAR_GP_PIN(5, 6),	/* VI1_D2_B2_C2 */
+		[ 7] = RCAR_GP_PIN(5, 7),	/* VI1_D3_B3_C3 */
+		[ 8] = RCAR_GP_PIN(5, 8),	/* VI1_D4_B4_C4 */
+		[ 9] = RCAR_GP_PIN(5, 9),	/* VI1_D5_B5_C5 */
+		[10] = RCAR_GP_PIN(5, 10),	/* VI1_D6_B6_C6 */
+		[11] = RCAR_GP_PIN(5, 11),	/* VI1_D7_B7_C7 */
+		[12] = RCAR_GP_PIN(5, 12),	/* VI1_D8_G0_Y0 */
+		[13] = RCAR_GP_PIN(5, 13),	/* VI1_D9_G1_Y1 */
+		[14] = RCAR_GP_PIN(5, 14),	/* VI1_D10_G2_Y2 */
+		[15] = RCAR_GP_PIN(5, 15),	/* VI1_D11_G3_Y3 */
+		[16] = RCAR_GP_PIN(5, 16),	/* VI1_FIELD */
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
+	{ PINMUX_BIAS_REG("PUPR6", 0xe6060118, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(6, 0),	/* VI2_CLK */
+		[ 1] = RCAR_GP_PIN(6, 1),	/* VI2_CLKENB */
+		[ 2] = RCAR_GP_PIN(6, 2),	/* VI2_HSYNC# */
+		[ 3] = RCAR_GP_PIN(6, 3),	/* VI2_VSYNC# */
+		[ 4] = RCAR_GP_PIN(6, 4),	/* VI2_D0_C0 */
+		[ 5] = RCAR_GP_PIN(6, 5),	/* VI2_D1_C1 */
+		[ 6] = RCAR_GP_PIN(6, 6),	/* VI2_D2_C2 */
+		[ 7] = RCAR_GP_PIN(6, 7),	/* VI2_D3_C3 */
+		[ 8] = RCAR_GP_PIN(6, 8),	/* VI2_D4_C4 */
+		[ 9] = RCAR_GP_PIN(6, 9),	/* VI2_D5_C5 */
+		[10] = RCAR_GP_PIN(6, 10),	/* VI2_D6_C6 */
+		[11] = RCAR_GP_PIN(6, 11),	/* VI2_D7_C7 */
+		[12] = RCAR_GP_PIN(6, 12),	/* VI2_D8_Y0 */
+		[13] = RCAR_GP_PIN(6, 13),	/* VI2_D9_Y1 */
+		[14] = RCAR_GP_PIN(6, 14),	/* VI2_D10_Y2 */
+		[15] = RCAR_GP_PIN(6, 15),	/* VI2_D11_Y3 */
+		[16] = RCAR_GP_PIN(6, 16),	/* VI2_FIELD */
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
+	{ PINMUX_BIAS_REG("PUPR7", 0xe606011c, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(7, 0),	/* VI3_CLK */
+		[ 1] = RCAR_GP_PIN(7, 1),	/* VI3_CLKENB */
+		[ 2] = RCAR_GP_PIN(7, 2),	/* VI3_HSYNC# */
+		[ 3] = RCAR_GP_PIN(7, 3),	/* VI3_VSYNC# */
+		[ 4] = RCAR_GP_PIN(7, 4),	/* VI3_D0_C0 */
+		[ 5] = RCAR_GP_PIN(7, 5),	/* VI3_D1_C1 */
+		[ 6] = RCAR_GP_PIN(7, 6),	/* VI3_D2_C2 */
+		[ 7] = RCAR_GP_PIN(7, 7),	/* VI3_D3_C3 */
+		[ 8] = RCAR_GP_PIN(7, 8),	/* VI3_D4_C4 */
+		[ 9] = RCAR_GP_PIN(7, 9),	/* VI3_D5_C5 */
+		[10] = RCAR_GP_PIN(7, 10),	/* VI3_D6_C6 */
+		[11] = RCAR_GP_PIN(7, 11),	/* VI3_D7_C7 */
+		[12] = RCAR_GP_PIN(7, 12),	/* VI3_D8_Y0 */
+		[13] = RCAR_GP_PIN(7, 13),	/* VI3_D9_Y1 */
+		[14] = RCAR_GP_PIN(7, 14),	/* VI3_D10_Y2 */
+		[15] = RCAR_GP_PIN(7, 15),	/* VI3_D11_Y3 */
+		[16] = RCAR_GP_PIN(7, 16),	/* VI3_FIELD */
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
+	{ PINMUX_BIAS_REG("PUPR8", 0xe6060120, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(8, 0),	/* VI4_CLK */
+		[ 1] = RCAR_GP_PIN(8, 1),	/* VI4_CLKENB */
+		[ 2] = RCAR_GP_PIN(8, 2),	/* VI4_HSYNC# */
+		[ 3] = RCAR_GP_PIN(8, 3),	/* VI4_VSYNC# */
+		[ 4] = RCAR_GP_PIN(8, 4),	/* VI4_D0_C0 */
+		[ 5] = RCAR_GP_PIN(8, 5),	/* VI4_D1_C1 */
+		[ 6] = RCAR_GP_PIN(8, 6),	/* VI4_D2_C2 */
+		[ 7] = RCAR_GP_PIN(8, 7),	/* VI4_D3_C3 */
+		[ 8] = RCAR_GP_PIN(8, 8),	/* VI4_D4_C4 */
+		[ 9] = RCAR_GP_PIN(8, 9),	/* VI4_D5_C5 */
+		[10] = RCAR_GP_PIN(8, 10),	/* VI4_D6_C6 */
+		[11] = RCAR_GP_PIN(8, 11),	/* VI4_D7_C7 */
+		[12] = RCAR_GP_PIN(8, 12),	/* VI4_D8_Y0 */
+		[13] = RCAR_GP_PIN(8, 13),	/* VI4_D9_Y1 */
+		[14] = RCAR_GP_PIN(8, 14),	/* VI4_D10_Y2 */
+		[15] = RCAR_GP_PIN(8, 15),	/* VI4_D11_Y3 */
+		[16] = RCAR_GP_PIN(8, 16),	/* VI4_FIELD */
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
+	{ PINMUX_BIAS_REG("PUPR9", 0xe6060124, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(9, 0),	/* VI5_CLK */
+		[ 1] = RCAR_GP_PIN(9, 1),	/* VI5_CLKENB */
+		[ 2] = RCAR_GP_PIN(9, 2),	/* VI5_HSYNC# */
+		[ 3] = RCAR_GP_PIN(9, 3),	/* VI5_VSYNC# */
+		[ 4] = RCAR_GP_PIN(9, 4),	/* VI5_D0_C0 */
+		[ 5] = RCAR_GP_PIN(9, 5),	/* VI5_D1_C1 */
+		[ 6] = RCAR_GP_PIN(9, 6),	/* VI5_D2_C2 */
+		[ 7] = RCAR_GP_PIN(9, 7),	/* VI5_D3_C3 */
+		[ 8] = RCAR_GP_PIN(9, 8),	/* VI5_D4_C4 */
+		[ 9] = RCAR_GP_PIN(9, 9),	/* VI5_D5_C5 */
+		[10] = RCAR_GP_PIN(9, 10),	/* VI5_D6_C6 */
+		[11] = RCAR_GP_PIN(9, 11),	/* VI5_D7_C7 */
+		[12] = RCAR_GP_PIN(9, 12),	/* VI5_D8_Y0 */
+		[13] = RCAR_GP_PIN(9, 13),	/* VI5_D9_Y1 */
+		[14] = RCAR_GP_PIN(9, 14),	/* VI5_D10_Y2 */
+		[15] = RCAR_GP_PIN(9, 15),	/* VI5_D11_Y3 */
+		[16] = RCAR_GP_PIN(9, 16),	/* VI5_FIELD */
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
+	{ PINMUX_BIAS_REG("PUPR10", 0xe6060128, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(10, 0),	/* HSCK0 */
+		[ 1] = RCAR_GP_PIN(10, 1),	/* HCTS0# */
+		[ 2] = RCAR_GP_PIN(10, 2),	/* HRTS0# */
+		[ 3] = RCAR_GP_PIN(10, 3),	/* HTX0 */
+		[ 4] = RCAR_GP_PIN(10, 4),	/* HRX0 */
+		[ 5] = RCAR_GP_PIN(10, 5),	/* HSCK1 */
+		[ 6] = RCAR_GP_PIN(10, 6),	/* HRTS1# */
+		[ 7] = RCAR_GP_PIN(10, 7),	/* HCTS1# */
+		[ 8] = RCAR_GP_PIN(10, 8),	/* HTX1 */
+		[ 9] = RCAR_GP_PIN(10, 9),	/* HRX1 */
+		[10] = RCAR_GP_PIN(10, 10),	/* SCK0 */
+		[11] = RCAR_GP_PIN(10, 11),	/* CTS0# */
+		[12] = RCAR_GP_PIN(10, 12),	/* RTS0# */
+		[13] = RCAR_GP_PIN(10, 13),	/* TX0 */
+		[14] = RCAR_GP_PIN(10, 14),	/* RX0 */
+		[15] = RCAR_GP_PIN(10, 15),	/* SCK1 */
+		[16] = RCAR_GP_PIN(10, 16),	/* CTS1# */
+		[17] = RCAR_GP_PIN(10, 17),	/* RTS1# */
+		[18] = RCAR_GP_PIN(10, 18),	/* TX1 */
+		[19] = RCAR_GP_PIN(10, 19),	/* RX1 */
+		[20] = RCAR_GP_PIN(10, 20),	/* SCK2 */
+		[21] = RCAR_GP_PIN(10, 21),	/* TX2 */
+		[22] = RCAR_GP_PIN(10, 22),	/* RX2 */
+		[23] = RCAR_GP_PIN(10, 23),	/* SCK3 */
+		[24] = RCAR_GP_PIN(10, 24),	/* TX3 */
+		[25] = RCAR_GP_PIN(10, 25),	/* RX3 */
+		[26] = RCAR_GP_PIN(10, 26),	/* SCIF_CLK */
+		[27] = RCAR_GP_PIN(10, 27),	/* CAN0_TX */
+		[28] = RCAR_GP_PIN(10, 28),	/* CAN0_RX */
+		[29] = RCAR_GP_PIN(10, 29),	/* CAN_CLK */
+		[30] = RCAR_GP_PIN(10, 30),	/* CAN1_TX */
+		[31] = RCAR_GP_PIN(10, 31),	/* CAN1_RX */
+	} },
+	{ PINMUX_BIAS_REG("PUPR11", 0xe606012c, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(11, 0),	/* PWM0 */
+		[ 1] = RCAR_GP_PIN(11, 1),	/* PWM1 */
+		[ 2] = RCAR_GP_PIN(11, 2),	/* PWM2 */
+		[ 3] = RCAR_GP_PIN(11, 3),	/* PWM3 */
+		[ 4] = RCAR_GP_PIN(11, 4),	/* PWM4 */
+		[ 5] = RCAR_GP_PIN(11, 5),	/* SD0_CLK */
+		[ 6] = RCAR_GP_PIN(11, 6),	/* SD0_CMD */
+		[ 7] = RCAR_GP_PIN(11, 7),	/* SD0_DAT0 */
+		[ 8] = RCAR_GP_PIN(11, 8),	/* SD0_DAT1 */
+		[ 9] = RCAR_GP_PIN(11, 9),	/* SD0_DAT2 */
+		[10] = RCAR_GP_PIN(11, 10),	/* SD0_DAT3 */
+		[11] = RCAR_GP_PIN(11, 11),	/* SD0_CD */
+		[12] = RCAR_GP_PIN(11, 12),	/* SD0_WP */
+		[13] = RCAR_GP_PIN(11, 13),	/* SSI_SCK3 */
+		[14] = RCAR_GP_PIN(11, 14),	/* SSI_WS3 */
+		[15] = RCAR_GP_PIN(11, 15),	/* SSI_SDATA3 */
+		[16] = RCAR_GP_PIN(11, 16),	/* SSI_SCK4 */
+		[17] = RCAR_GP_PIN(11, 17),	/* SSI_WS4 */
+		[18] = RCAR_GP_PIN(11, 18),	/* SSI_SDATA4 */
+		[19] = RCAR_GP_PIN(11, 19),	/* AUDIO_CLKOUT */
+		[20] = RCAR_GP_PIN(11, 20),	/* AUDIO_CLKA */
+		[21] = RCAR_GP_PIN(11, 21),	/* AUDIO_CLKB */
+		[22] = RCAR_GP_PIN(11, 22),	/* ADICLK */
+		[23] = RCAR_GP_PIN(11, 23),	/* ADICS_SAMP */
+		[24] = RCAR_GP_PIN(11, 24),	/* ADIDATA */
+		[25] = RCAR_GP_PIN(11, 25),	/* ADICHS0 */
+		[26] = RCAR_GP_PIN(11, 26),	/* ADICHS1 */
+		[27] = RCAR_GP_PIN(11, 27),	/* ADICHS2 */
+		[28] = RCAR_GP_PIN(11, 28),	/* AVS1 */
+		[29] = RCAR_GP_PIN(11, 29),	/* AVS2 */
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("PUPR12", 0xe6060130, "N/A", 0) {
+		/* PUPR12 pull-up pins */
+		[ 0] = PIN_DU0_DOTCLKIN,	/* DU0_DOTCLKIN */
+		[ 1] = PIN_DU0_DOTCLKOUT,	/* DU0_DOTCLKOUT */
+		[ 2] = PIN_DU1_DOTCLKIN,	/* DU1_DOTCLKIN */
+		[ 3] = PIN_DU1_DOTCLKOUT,	/* DU1_DOTCLKOUT */
+		[ 4] = PIN_TRST_N,		/* TRST# */
+		[ 5] = PIN_TCK,			/* TCK */
+		[ 6] = PIN_TMS,			/* TMS */
+		[ 7] = PIN_TDI,			/* TDI */
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
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("N/A", 0, "PUPR12", 0xe6060130) {
+		/* PUPR12 pull-down pins */
+		[ 0] = SH_PFC_PIN_NONE,
+		[ 1] = SH_PFC_PIN_NONE,
+		[ 2] = SH_PFC_PIN_NONE,
+		[ 3] = SH_PFC_PIN_NONE,
+		[ 4] = SH_PFC_PIN_NONE,
+		[ 5] = SH_PFC_PIN_NONE,
+		[ 6] = SH_PFC_PIN_NONE,
+		[ 7] = SH_PFC_PIN_NONE,
+		[ 8] = PIN_EDBGREQ,		/* EDBGREQ */
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
+		[29] = SH_PFC_PIN_NONE,
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ /* sentinel */ }
+};
+
+static const struct sh_pfc_soc_operations r8a7792_pinmux_ops = {
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
+};
+
 const struct sh_pfc_soc_info r8a7792_pinmux_info = {
 	.name = "r8a77920_pfc",
+	.ops = &r8a7792_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -2793,6 +3301,7 @@ const struct sh_pfc_soc_info r8a7792_pinmux_info = {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
-- 
2.25.1

