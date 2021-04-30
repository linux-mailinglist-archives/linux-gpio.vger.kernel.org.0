Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C1336FA40
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbhD3McM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbhD3McH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:07 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6CFC06134E
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id z0XG2400P4p6Y38010XGJW; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-001ecL-Vn; Fri, 30 Apr 2021 14:31:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-00BdvP-6n; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/12] pinctrl: renesas: r8a7794: Add bias pinconf support
Date:   Fri, 30 Apr 2021 14:31:08 +0200
Message-Id: <f78da2ba937ce98ae9196f4ee54149a5214fd545.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement support for pull-up (most pins) and pull-down (ASEBRK#/ACK)
handling for R-Car E2 and RZ/G1E SoCs, using the common R-Car bias
handling.

Note that on RZ/G1E, the "ASEBRK#/ACK" pin is called "ACK", but the code
doesn't handle that naming difference.  Hence users should use the R-Car
naming in DTS files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7794.c | 360 +++++++++++++++++++++++++-
 1 file changed, 351 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index 34481b6c43280708..fbb5b3b68f349ac6 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -15,15 +15,66 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)						\
-	PORT_GP_32(0, fn, sfx),						\
-	PORT_GP_26(1, fn, sfx),						\
-	PORT_GP_32(2, fn, sfx),						\
-	PORT_GP_32(3, fn, sfx),						\
-	PORT_GP_32(4, fn, sfx),						\
-	PORT_GP_28(5, fn, sfx),						\
-	PORT_GP_CFG_24(6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
-	PORT_GP_1(6, 24, fn, sfx),					\
-	PORT_GP_1(6, 25, fn, sfx)
+	PORT_GP_CFG_32(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_26(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_32(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_7(5, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_1(5, 7, fn, sfx),					\
+	PORT_GP_1(5, 8, fn, sfx),					\
+	PORT_GP_1(5, 9, fn, sfx),					\
+	PORT_GP_CFG_1(5, 10, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 11, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 12, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 13, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 14, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 15, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 16, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 17, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 18, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 19, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 20, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 21, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 22, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(5, 23, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_1(5, 24, fn, sfx),					\
+	PORT_GP_1(5, 25, fn, sfx),					\
+	PORT_GP_1(5, 26, fn, sfx),					\
+	PORT_GP_1(5, 27, fn, sfx),					\
+	PORT_GP_CFG_1(6, 0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(6, 1, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 4, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(6, 9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 11, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 12, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(6, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 23, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_PULL_UP),	\
+	PORT_GP_CFG_1(6, 24, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
+	PORT_GP_CFG_1(6, 25, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
+
+#define CPU_ALL_NOGP(fn)						\
+	PIN_NOGP_CFG(ASEBRK_N_ACK, "ASEBRK#/ACK", fn, SH_PFC_PIN_CFG_PULL_DOWN),	\
+	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
+	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
 
 enum {
 	PINMUX_RESERVED = 0,
@@ -1436,8 +1487,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP13_26_24, FMIN_E, SEL_DARC_4),
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
 
 /* - Audio Clock ------------------------------------------------------------ */
@@ -5580,6 +5640,284 @@ static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	return -EINVAL;
 }
 
+static const struct pinmux_bias_reg pinmux_bias_regs[] = {
+	{ PINMUX_BIAS_REG("PUPR0", 0xe6060100, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(0, 0),	/* D0 */
+		[ 1] = RCAR_GP_PIN(0, 1),	/* D1 */
+		[ 2] = RCAR_GP_PIN(0, 2),	/* D2 */
+		[ 3] = RCAR_GP_PIN(0, 3),	/* D3 */
+		[ 4] = RCAR_GP_PIN(0, 4),	/* D4 */
+		[ 5] = RCAR_GP_PIN(0, 5),	/* D5 */
+		[ 6] = RCAR_GP_PIN(0, 6),	/* D6 */
+		[ 7] = RCAR_GP_PIN(0, 7),	/* D7 */
+		[ 8] = RCAR_GP_PIN(0, 8),	/* D8 */
+		[ 9] = RCAR_GP_PIN(0, 9),	/* D9 */
+		[10] = RCAR_GP_PIN(0, 10),	/* D10 */
+		[11] = RCAR_GP_PIN(0, 11),	/* D11 */
+		[12] = RCAR_GP_PIN(0, 12),	/* D12 */
+		[13] = RCAR_GP_PIN(0, 13),	/* D13 */
+		[14] = RCAR_GP_PIN(0, 14),	/* D14 */
+		[15] = RCAR_GP_PIN(0, 15),	/* D15 */
+		[16] = RCAR_GP_PIN(0, 16),	/* A0 */
+		[17] = RCAR_GP_PIN(0, 17),	/* A1 */
+		[18] = RCAR_GP_PIN(0, 18),	/* A2 */
+		[19] = RCAR_GP_PIN(0, 19),	/* A3 */
+		[20] = RCAR_GP_PIN(0, 20),	/* A4 */
+		[21] = RCAR_GP_PIN(0, 21),	/* A5 */
+		[22] = RCAR_GP_PIN(0, 22),	/* A6 */
+		[23] = RCAR_GP_PIN(0, 23),	/* A7 */
+		[24] = RCAR_GP_PIN(0, 24),	/* A8 */
+		[25] = RCAR_GP_PIN(0, 25),	/* A9 */
+		[26] = RCAR_GP_PIN(0, 26),	/* A10 */
+		[27] = RCAR_GP_PIN(0, 27),	/* A11 */
+		[28] = RCAR_GP_PIN(0, 28),	/* A12 */
+		[29] = RCAR_GP_PIN(0, 29),	/* A13 */
+		[30] = RCAR_GP_PIN(0, 30),	/* A14 */
+		[31] = RCAR_GP_PIN(0, 31),	/* A15 */
+	} },
+	{ PINMUX_BIAS_REG("PUPR1", 0xe6060104, "N/A", 0) {
+		/* PUPR1 pull-up pins */
+		[ 0] = RCAR_GP_PIN(1, 0),	/* A16 */
+		[ 1] = RCAR_GP_PIN(1, 1),	/* A17 */
+		[ 2] = RCAR_GP_PIN(1, 2),	/* A18 */
+		[ 3] = RCAR_GP_PIN(1, 3),	/* A19 */
+		[ 4] = RCAR_GP_PIN(1, 4),	/* A20 */
+		[ 5] = RCAR_GP_PIN(1, 5),	/* A21 */
+		[ 6] = RCAR_GP_PIN(1, 6),	/* A22 */
+		[ 7] = RCAR_GP_PIN(1, 7),	/* A23 */
+		[ 8] = RCAR_GP_PIN(1, 8),	/* A24 */
+		[ 9] = RCAR_GP_PIN(1, 9),	/* A25 */
+		[10] = RCAR_GP_PIN(1, 10),	/* CS0# */
+		[11] = RCAR_GP_PIN(1, 12),	/* EX_CS0# */
+		[12] = RCAR_GP_PIN(1, 14),	/* EX_CS2# */
+		[13] = RCAR_GP_PIN(1, 16),	/* EX_CS4# */
+		[14] = RCAR_GP_PIN(1, 18),	/* BS# */
+		[15] = RCAR_GP_PIN(1, 19),	/* RD# */
+		[16] = RCAR_GP_PIN(1, 20),	/* RD/WR# */
+		[17] = RCAR_GP_PIN(1, 21),	/* WE0# */
+		[18] = RCAR_GP_PIN(1, 22),	/* WE1# */
+		[19] = RCAR_GP_PIN(1, 23),	/* EX_WAIT0 */
+		[20] = RCAR_GP_PIN(1, 24),	/* DREQ0# */
+		[21] = RCAR_GP_PIN(1, 25),	/* DACK0 */
+		[22] = PIN_TRST_N,		/* TRST# */
+		[23] = PIN_TCK,			/* TCK */
+		[24] = PIN_TMS,			/* TMS */
+		[25] = PIN_TDI,			/* TDI */
+		[26] = RCAR_GP_PIN(1, 11),	/* CS1#/A26 */
+		[27] = RCAR_GP_PIN(1, 13),	/* EX_CS1# */
+		[28] = RCAR_GP_PIN(1, 15),	/* EX_CS3# */
+		[29] = RCAR_GP_PIN(1, 17),	/* EX_CS5# */
+		[30] = SH_PFC_PIN_NONE,
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("N/A", 0, "PUPR1", 0xe6060104) {
+		/* PUPR1 pull-down pins */
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
+		[29] = SH_PFC_PIN_NONE,
+		[30] = PIN_ASEBRK_N_ACK,	/* ASEBRK#/ACK */
+		[31] = SH_PFC_PIN_NONE,
+	} },
+	{ PINMUX_BIAS_REG("PUPR2", 0xe6060108, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(2, 0),	/* DU0_DR0 */
+		[ 1] = RCAR_GP_PIN(2, 1),	/* DU0_DR1 */
+		[ 2] = RCAR_GP_PIN(2, 2),	/* DU0_DR2 */
+		[ 3] = RCAR_GP_PIN(2, 3),	/* DU0_DR3 */
+		[ 4] = RCAR_GP_PIN(2, 4),	/* DU0_DR4 */
+		[ 5] = RCAR_GP_PIN(2, 5),	/* DU0_DR5 */
+		[ 6] = RCAR_GP_PIN(2, 6),	/* DU0_DR6 */
+		[ 7] = RCAR_GP_PIN(2, 7),	/* DU0_DR7 */
+		[ 8] = RCAR_GP_PIN(2, 8),	/* DU0_DG0 */
+		[ 9] = RCAR_GP_PIN(2, 9),	/* DU0_DG1 */
+		[10] = RCAR_GP_PIN(2, 10),	/* DU0_DG2 */
+		[11] = RCAR_GP_PIN(2, 11),	/* DU0_DG3 */
+		[12] = RCAR_GP_PIN(2, 12),	/* DU0_DG4 */
+		[13] = RCAR_GP_PIN(2, 13),	/* DU0_DG5 */
+		[14] = RCAR_GP_PIN(2, 14),	/* DU0_DG6 */
+		[15] = RCAR_GP_PIN(2, 15),	/* DU0_DG7 */
+		[16] = RCAR_GP_PIN(2, 16),	/* DU0_DB0 */
+		[17] = RCAR_GP_PIN(2, 17),	/* DU0_DB1 */
+		[18] = RCAR_GP_PIN(2, 18),	/* DU0_DB2 */
+		[19] = RCAR_GP_PIN(2, 19),	/* DU0_DB3 */
+		[20] = RCAR_GP_PIN(2, 20),	/* DU0_DB4 */
+		[21] = RCAR_GP_PIN(2, 21),	/* DU0_DB5 */
+		[22] = RCAR_GP_PIN(2, 22),	/* DU0_DB6 */
+		[23] = RCAR_GP_PIN(2, 23),	/* DU0_DB7 */
+		[24] = RCAR_GP_PIN(2, 24),	/* DU0_DOTCLKIN */
+		[25] = RCAR_GP_PIN(2, 25),	/* DU0_DOTCLKOUT0 */
+		[26] = RCAR_GP_PIN(2, 26),	/* DU0_DOTCLKOUT1 */
+		[27] = RCAR_GP_PIN(2, 27),	/* DU0_EXHSYNC/DU0_HSYNC */
+		[28] = RCAR_GP_PIN(2, 28),	/* DU0_EXVSYNC/DU0_VSYNC */
+		[29] = RCAR_GP_PIN(2, 29),	/* DU0_EXODDF/DU0_ODDF_DISP_CDE */
+		[30] = RCAR_GP_PIN(2, 30),	/* DU0_DISP */
+		[31] = RCAR_GP_PIN(2, 31),	/* DU0_CDE */
+	} },
+	{ PINMUX_BIAS_REG("PUPR3", 0xe606010c, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(3, 2),	/* VI0_DATA1_VI0_B1 */
+		[ 1] = RCAR_GP_PIN(3, 3),	/* VI0_DATA2_VI0_B2 */
+		[ 2] = RCAR_GP_PIN(3, 4),	/* VI0_DATA3_VI0_B3 */
+		[ 3] = RCAR_GP_PIN(3, 5),	/* VI0_DATA4_VI0_B4 */
+		[ 4] = RCAR_GP_PIN(3, 6),	/* VI0_DATA5_VI0_B5 */
+		[ 5] = RCAR_GP_PIN(3, 7),	/* VI0_DATA6_VI0_B6 */
+		[ 6] = RCAR_GP_PIN(3, 8),	/* VI0_DATA7_VI0_B7 */
+		[ 7] = RCAR_GP_PIN(3, 9),	/* VI0_CLKENB */
+		[ 8] = RCAR_GP_PIN(3, 10),	/* VI0_FIELD */
+		[ 9] = RCAR_GP_PIN(3, 11),	/* VI0_HSYNC# */
+		[10] = RCAR_GP_PIN(3, 12),	/* VI0_VSYNC# */
+		[11] = RCAR_GP_PIN(3, 13),	/* ETH_MDIO */
+		[12] = RCAR_GP_PIN(3, 14),	/* ETH_CRS_DV */
+		[13] = RCAR_GP_PIN(3, 15),	/* ETH_RX_ER */
+		[14] = RCAR_GP_PIN(3, 16),	/* ETH_RXD0 */
+		[15] = RCAR_GP_PIN(3, 17),	/* ETH_RXD1 */
+		[16] = RCAR_GP_PIN(3, 18),	/* ETH_LINK */
+		[17] = RCAR_GP_PIN(3, 19),	/* ETH_REF_CLK */
+		[18] = RCAR_GP_PIN(3, 20),	/* ETH_TXD1 */
+		[19] = RCAR_GP_PIN(3, 21),	/* ETH_TX_EN */
+		[20] = RCAR_GP_PIN(3, 22),	/* ETH_MAGIC */
+		[21] = RCAR_GP_PIN(3, 23),	/* ETH_TXD0 */
+		[22] = RCAR_GP_PIN(3, 24),	/* ETH_MDC */
+		[23] = RCAR_GP_PIN(3, 25),	/* HSCIF0_HRX */
+		[24] = RCAR_GP_PIN(3, 26),	/* HSCIF0_HTX */
+		[25] = RCAR_GP_PIN(3, 27),	/* HSCIF0_HCTS# */
+		[26] = RCAR_GP_PIN(3, 28),	/* HSCIF0_HRTS# */
+		[27] = RCAR_GP_PIN(3, 29),	/* HSCIF0_HSCK */
+		[28] = RCAR_GP_PIN(3, 30),	/* I2C0_SCL */
+		[29] = RCAR_GP_PIN(3, 31),	/* I2C0_SDA */
+		[30] = RCAR_GP_PIN(4, 0),	/* I2C1_SCL */
+		[31] = RCAR_GP_PIN(4, 1),	/* I2C1_SDA */
+	} },
+	{ PINMUX_BIAS_REG("PUPR4", 0xe6060110, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(4, 2),	/* MSIOF0_RXD */
+		[ 1] = RCAR_GP_PIN(4, 3),	/* MSIOF0_TXD */
+		[ 2] = RCAR_GP_PIN(4, 4),	/* MSIOF0_SCK */
+		[ 3] = RCAR_GP_PIN(4, 5),	/* MSIOF0_SYNC */
+		[ 4] = RCAR_GP_PIN(4, 6),	/* MSIOF0_SS1 */
+		[ 5] = RCAR_GP_PIN(4, 7),	/* MSIOF0_SS2 */
+		[ 6] = RCAR_GP_PIN(4, 8),	/* HSCIF1_HRX */
+		[ 7] = RCAR_GP_PIN(4, 9),	/* HSCIF1_HTX */
+		[ 8] = RCAR_GP_PIN(4, 10),	/* HSCIF1_HSCK */
+		[ 9] = RCAR_GP_PIN(4, 11),	/* HSCIF1_HCTS# */
+		[10] = RCAR_GP_PIN(4, 12),	/* HSCIF1_HRTS# */
+		[11] = RCAR_GP_PIN(4, 13),	/* SCIF1_SCK */
+		[12] = RCAR_GP_PIN(4, 14),	/* SCIF1_RXD */
+		[13] = RCAR_GP_PIN(4, 15),	/* SCIF1_TXD */
+		[14] = RCAR_GP_PIN(4, 16),	/* SCIF2_RXD */
+		[15] = RCAR_GP_PIN(4, 17),	/* SCIF2_TXD */
+		[16] = RCAR_GP_PIN(4, 18),	/* SCIF2_SCK */
+		[17] = RCAR_GP_PIN(4, 19),	/* SCIF3_SCK */
+		[18] = RCAR_GP_PIN(4, 20),	/* SCIF3_RXD */
+		[19] = RCAR_GP_PIN(4, 21),	/* SCIF3_TXD */
+		[20] = RCAR_GP_PIN(4, 22),	/* I2C2_SCL */
+		[21] = RCAR_GP_PIN(4, 23),	/* I2C2_SDA */
+		[22] = RCAR_GP_PIN(4, 24),	/* SSI_SCK5 */
+		[23] = RCAR_GP_PIN(4, 25),	/* SSI_WS5 */
+		[24] = RCAR_GP_PIN(4, 26),	/* SSI_SDATA5 */
+		[25] = RCAR_GP_PIN(4, 27),	/* SSI_SCK6 */
+		[26] = RCAR_GP_PIN(4, 28),	/* SSI_WS6 */
+		[27] = RCAR_GP_PIN(4, 29),	/* SSI_SDATA6 */
+		[28] = RCAR_GP_PIN(4, 30),	/* SSI_SCK78 */
+		[29] = RCAR_GP_PIN(4, 31),	/* SSI_WS78 */
+		[30] = RCAR_GP_PIN(5, 0),	/* SSI_SDATA7 */
+		[31] = RCAR_GP_PIN(5, 1),	/* SSI_SCK0129 */
+	} },
+	{ PINMUX_BIAS_REG("PUPR5", 0xe6060114, "N/A", 0) {
+		[ 0] = RCAR_GP_PIN(5, 2),	/* SSI_WS0129 */
+		[ 1] = RCAR_GP_PIN(5, 3),	/* SSI_SDATA0 */
+		[ 2] = RCAR_GP_PIN(5, 4),	/* SSI_SCK34 */
+		[ 3] = RCAR_GP_PIN(5, 5),	/* SSI_WS34 */
+		[ 4] = RCAR_GP_PIN(5, 6),	/* SSI_SDATA3 */
+		[ 5] = SH_PFC_PIN_NONE,
+		[ 6] = SH_PFC_PIN_NONE,
+		[ 7] = SH_PFC_PIN_NONE,
+		[ 8] = RCAR_GP_PIN(5, 10),	/* SSI_SDATA8 */
+		[ 9] = RCAR_GP_PIN(5, 11),	/* SSI_SCK1 */
+		[10] = RCAR_GP_PIN(5, 12),	/* SSI_WS1 */
+		[11] = RCAR_GP_PIN(5, 13),	/* SSI_SDATA1 */
+		[12] = RCAR_GP_PIN(5, 14),	/* SSI_SCK2 */
+		[13] = RCAR_GP_PIN(5, 15),	/* SSI_WS2 */
+		[14] = RCAR_GP_PIN(5, 16),	/* SSI_SDATA2 */
+		[15] = RCAR_GP_PIN(5, 17),	/* SSI_SCK9 */
+		[16] = RCAR_GP_PIN(5, 18),	/* SSI_WS9 */
+		[17] = RCAR_GP_PIN(5, 19),	/* SSI_SDATA9 */
+		[18] = RCAR_GP_PIN(5, 20),	/* AUDIO_CLKA */
+		[19] = RCAR_GP_PIN(5, 21),	/* AUDIO_CLKB */
+		[20] = RCAR_GP_PIN(5, 22),	/* AUDIO_CLKC */
+		[21] = RCAR_GP_PIN(5, 23),	/* AUDIO_CLKOUT */
+		[22] = RCAR_GP_PIN(3, 0),	/* VI0_CLK */
+		[23] = RCAR_GP_PIN(3, 1),	/* VI0_DATA0_VI0_B0 */
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
+		[ 0] = RCAR_GP_PIN(6, 1),	/* SD0_CMD */
+		[ 1] = RCAR_GP_PIN(6, 2),	/* SD0_DATA0 */
+		[ 2] = RCAR_GP_PIN(6, 3),	/* SD0_DATA1 */
+		[ 3] = RCAR_GP_PIN(6, 4),	/* SD0_DATA2 */
+		[ 4] = RCAR_GP_PIN(6, 5),	/* SD0_DATA3 */
+		[ 5] = RCAR_GP_PIN(6, 6),	/* SD0_CD */
+		[ 6] = RCAR_GP_PIN(6, 7),	/* SD0_WP */
+		[ 7] = RCAR_GP_PIN(6, 9),	/* SD1_CMD */
+		[ 8] = RCAR_GP_PIN(6, 10),	/* SD1_DATA0 */
+		[ 9] = RCAR_GP_PIN(6, 11),	/* SD1_DATA1 */
+		[10] = RCAR_GP_PIN(6, 12),	/* SD1_DATA2 */
+		[11] = RCAR_GP_PIN(6, 13),	/* SD1_DATA3 */
+		[12] = RCAR_GP_PIN(6, 14),	/* SD1_CD */
+		[13] = RCAR_GP_PIN(6, 15),	/* SD1_WP */
+		[14] = SH_PFC_PIN_NONE,
+		[15] = RCAR_GP_PIN(6, 17),	/* MMC_CMD */
+		[16] = RCAR_GP_PIN(6, 18),	/* MMC_D0 */
+		[17] = RCAR_GP_PIN(6, 19),	/* MMC_D1 */
+		[18] = RCAR_GP_PIN(6, 20),	/* MMC_D2 */
+		[19] = RCAR_GP_PIN(6, 21),	/* MMC_D3 */
+		[20] = RCAR_GP_PIN(6, 22),	/* MMC_D4 */
+		[21] = RCAR_GP_PIN(6, 23),	/* MMC_D5 */
+		[22] = RCAR_GP_PIN(6, 24),	/* MMC_D6 */
+		[23] = RCAR_GP_PIN(6, 25),	/* MMC_D7 */
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
 static const struct soc_device_attribute r8a7794_tdsel[] = {
 	{ .soc_id = "r8a7794", .revision = "ES1.0" },
 	{ /* sentinel */ }
@@ -5597,6 +5935,8 @@ static int r8a7794_pinmux_soc_init(struct sh_pfc *pfc)
 static const struct sh_pfc_soc_operations r8a7794_pinmux_ops = {
 	.init = r8a7794_pinmux_soc_init,
 	.pin_to_pocctrl = r8a7794_pin_to_pocctrl,
+	.get_bias = rcar_pinmux_get_bias,
+	.set_bias = rcar_pinmux_set_bias,
 };
 
 #ifdef CONFIG_PINCTRL_PFC_R8A7745
@@ -5615,6 +5955,7 @@ const struct sh_pfc_soc_info r8a7745_pinmux_info = {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
@@ -5637,6 +5978,7 @@ const struct sh_pfc_soc_info r8a7794_pinmux_info = {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
-- 
2.25.1

