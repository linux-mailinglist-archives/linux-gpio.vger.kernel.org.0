Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C4447E47D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348810AbhLWOWk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhLWOWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:22:40 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B77C061401
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:22:39 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by albert.telenet-ops.be with bizsmtp
        id ZqNc2600e1rdBcm06qNcbZ; Thu, 23 Dec 2021 15:22:37 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0OzM-006a04-HJ; Thu, 23 Dec 2021 15:22:36 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0OzM-003rC5-2t; Thu, 23 Dec 2021 15:22:36 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a7790: Remove INTC_IRQx_N
Date:   Thu, 23 Dec 2021 15:22:34 +0100
Message-Id: <5b3fb0c025eaca037a53120fee811cf13e08b55f.1640269218.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The INTC_IRQx_N pin functions were only documented in preliminary
versions of the R-Car H2 Hardware User's Manual, and were never used.

This reduces kernel size by 40 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v5.18.

 drivers/pinctrl/renesas/pfc-r8a7790.c | 43 +++++++++++----------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 08c0a23edf680751..85b2ca9733214da1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -194,24 +194,24 @@ enum {
 	FN_CAN1_TX, FN_DRACK0, FN_IETX_C, FN_RD_N,
 	FN_CAN0_TX, FN_SCIFA0_SCK_B, FN_RD_WR_N, FN_VI1_G3,
 	FN_VI1_G3_B, FN_VI2_R5, FN_SCIFA0_RXD_B,
-	FN_INTC_IRQ4_N, FN_WE0_N, FN_IECLK, FN_CAN_CLK,
+	FN_WE0_N, FN_IECLK, FN_CAN_CLK,
 	FN_VI2_VSYNC_N, FN_SCIFA0_TXD_B, FN_VI2_VSYNC_N_B,
 	FN_WE1_N, FN_IERX, FN_CAN1_RX, FN_VI1_G4,
 	FN_VI1_G4_B, FN_VI2_R6, FN_SCIFA0_CTS_N_B,
-	FN_IERX_C, FN_EX_WAIT0, FN_IRQ3, FN_INTC_IRQ3_N,
+	FN_IERX_C, FN_EX_WAIT0, FN_IRQ3,
 	FN_VI3_CLK, FN_SCIFA0_RTS_N_B, FN_HRX0_B,
 	FN_MSIOF0_SCK_B, FN_DREQ0_N, FN_VI1_HSYNC_N,
 	FN_VI1_HSYNC_N_B, FN_VI2_R7, FN_SSI_SCK78_C,
 	FN_SSI_WS78_B,
 
 	/* IPSR6 */
-	FN_DACK0, FN_IRQ0, FN_INTC_IRQ0_N, FN_SSI_SCK6_B,
+	FN_DACK0, FN_IRQ0, FN_SSI_SCK6_B,
 	FN_VI1_VSYNC_N, FN_VI1_VSYNC_N_B, FN_SSI_WS78_C,
 	FN_DREQ1_N, FN_VI1_CLKENB, FN_VI1_CLKENB_B,
 	FN_SSI_SDATA7_C, FN_SSI_SCK78_B, FN_DACK1, FN_IRQ1,
-	FN_INTC_IRQ1_N, FN_SSI_WS6_B, FN_SSI_SDATA8_C,
+	FN_SSI_WS6_B, FN_SSI_SDATA8_C,
 	FN_DREQ2_N, FN_HSCK1_B, FN_HCTS0_N_B,
-	FN_MSIOF0_TXD_B, FN_DACK2, FN_IRQ2, FN_INTC_IRQ2_N,
+	FN_MSIOF0_TXD_B, FN_DACK2, FN_IRQ2,
 	FN_SSI_SDATA6_B, FN_HRTS0_N_B, FN_MSIOF0_RXD_B,
 	FN_ETH_CRS_DV, FN_STP_ISCLK_0_B,
 	FN_TS_SDEN0_D, FN_GLO_Q0_C, FN_IIC2_SCL_E,
@@ -568,23 +568,23 @@ enum {
 	CAN1_TX_MARK, DRACK0_MARK, IETX_C_MARK, RD_N_MARK,
 	CAN0_TX_MARK, SCIFA0_SCK_B_MARK, RD_WR_N_MARK, VI1_G3_MARK,
 	VI1_G3_B_MARK, VI2_R5_MARK, SCIFA0_RXD_B_MARK,
-	INTC_IRQ4_N_MARK, WE0_N_MARK, IECLK_MARK, CAN_CLK_MARK,
+	WE0_N_MARK, IECLK_MARK, CAN_CLK_MARK,
 	VI2_VSYNC_N_MARK, SCIFA0_TXD_B_MARK, VI2_VSYNC_N_B_MARK,
 	WE1_N_MARK, IERX_MARK, CAN1_RX_MARK, VI1_G4_MARK,
 	VI1_G4_B_MARK, VI2_R6_MARK, SCIFA0_CTS_N_B_MARK,
-	IERX_C_MARK, EX_WAIT0_MARK, IRQ3_MARK, INTC_IRQ3_N_MARK,
+	IERX_C_MARK, EX_WAIT0_MARK, IRQ3_MARK,
 	VI3_CLK_MARK, SCIFA0_RTS_N_B_MARK, HRX0_B_MARK,
 	MSIOF0_SCK_B_MARK, DREQ0_N_MARK, VI1_HSYNC_N_MARK,
 	VI1_HSYNC_N_B_MARK, VI2_R7_MARK, SSI_SCK78_C_MARK,
 	SSI_WS78_B_MARK,
 
-	DACK0_MARK, IRQ0_MARK, INTC_IRQ0_N_MARK, SSI_SCK6_B_MARK,
+	DACK0_MARK, IRQ0_MARK, SSI_SCK6_B_MARK,
 	VI1_VSYNC_N_MARK, VI1_VSYNC_N_B_MARK, SSI_WS78_C_MARK,
 	DREQ1_N_MARK, VI1_CLKENB_MARK, VI1_CLKENB_B_MARK,
 	SSI_SDATA7_C_MARK, SSI_SCK78_B_MARK, DACK1_MARK, IRQ1_MARK,
-	INTC_IRQ1_N_MARK, SSI_WS6_B_MARK, SSI_SDATA8_C_MARK,
+	SSI_WS6_B_MARK, SSI_SDATA8_C_MARK,
 	DREQ2_N_MARK, HSCK1_B_MARK, HCTS0_N_B_MARK,
-	MSIOF0_TXD_B_MARK, DACK2_MARK, IRQ2_MARK, INTC_IRQ2_N_MARK,
+	MSIOF0_TXD_B_MARK, DACK2_MARK, IRQ2_MARK,
 	SSI_SDATA6_B_MARK, HRTS0_N_B_MARK, MSIOF0_RXD_B_MARK,
 	ETH_CRS_DV_MARK, STP_ISCLK_0_B_MARK,
 	TS_SDEN0_D_MARK, GLO_Q0_C_MARK, IIC2_SCL_E_MARK,
@@ -1094,7 +1094,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP5_17_15, VI1_G3_B, SEL_VI1_1),
 	PINMUX_IPSR_GPSR(IP5_17_15, VI2_R5),
 	PINMUX_IPSR_MSEL(IP5_17_15, SCIFA0_RXD_B, SEL_SCFA_1),
-	PINMUX_IPSR_GPSR(IP5_17_15, INTC_IRQ4_N),
 	PINMUX_IPSR_GPSR(IP5_20_18, WE0_N),
 	PINMUX_IPSR_MSEL(IP5_20_18, IECLK, SEL_IEB_0),
 	PINMUX_IPSR_MSEL(IP5_20_18, CAN_CLK, SEL_CANCLK_0),
@@ -1111,7 +1110,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP5_23_21, IERX_C, SEL_IEB_2),
 	PINMUX_IPSR_MSEL(IP5_26_24, EX_WAIT0, SEL_LBS_0),
 	PINMUX_IPSR_GPSR(IP5_26_24, IRQ3),
-	PINMUX_IPSR_GPSR(IP5_26_24, INTC_IRQ3_N),
 	PINMUX_IPSR_MSEL(IP5_26_24, VI3_CLK, SEL_VI3_0),
 	PINMUX_IPSR_MSEL(IP5_26_24, SCIFA0_RTS_N_B, SEL_SCFA_1),
 	PINMUX_IPSR_MSEL(IP5_26_24, HRX0_B, SEL_HSCIF0_1),
@@ -1125,7 +1123,6 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP6_2_0, DACK0),
 	PINMUX_IPSR_GPSR(IP6_2_0, IRQ0),
-	PINMUX_IPSR_GPSR(IP6_2_0, INTC_IRQ0_N),
 	PINMUX_IPSR_MSEL(IP6_2_0, SSI_SCK6_B, SEL_SSI6_1),
 	PINMUX_IPSR_MSEL(IP6_2_0, VI1_VSYNC_N, SEL_VI1_0),
 	PINMUX_IPSR_MSEL(IP6_2_0, VI1_VSYNC_N_B, SEL_VI1_1),
@@ -1137,7 +1134,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP6_5_3, SSI_SCK78_B, SEL_SSI7_1),
 	PINMUX_IPSR_GPSR(IP6_8_6, DACK1),
 	PINMUX_IPSR_GPSR(IP6_8_6, IRQ1),
-	PINMUX_IPSR_GPSR(IP6_8_6, INTC_IRQ1_N),
 	PINMUX_IPSR_MSEL(IP6_8_6, SSI_WS6_B, SEL_SSI6_1),
 	PINMUX_IPSR_MSEL(IP6_8_6, SSI_SDATA8_C, SEL_SSI8_2),
 	PINMUX_IPSR_GPSR(IP6_10_9, DREQ2_N),
@@ -1146,7 +1142,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP6_10_9, MSIOF0_TXD_B, SEL_SOF0_1),
 	PINMUX_IPSR_GPSR(IP6_13_11, DACK2),
 	PINMUX_IPSR_GPSR(IP6_13_11, IRQ2),
-	PINMUX_IPSR_GPSR(IP6_13_11, INTC_IRQ2_N),
 	PINMUX_IPSR_MSEL(IP6_13_11, SSI_SDATA6_B, SEL_SSI6_1),
 	PINMUX_IPSR_MSEL(IP6_13_11, HRTS0_N_B, SEL_HSCIF0_1),
 	PINMUX_IPSR_MSEL(IP6_13_11, MSIOF0_RXD_B, SEL_SOF0_1),
@@ -5415,9 +5410,8 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DREQ0_N, FN_VI1_HSYNC_N, FN_VI1_HSYNC_N_B, FN_VI2_R7,
 		FN_SSI_SCK78_C, FN_SSI_WS78_B, 0, 0,
 		/* IP5_26_24 [3] */
-		FN_EX_WAIT0, FN_IRQ3, FN_INTC_IRQ3_N,
-		FN_VI3_CLK, FN_SCIFA0_RTS_N_B, FN_HRX0_B,
-		FN_MSIOF0_SCK_B, 0,
+		FN_EX_WAIT0, FN_IRQ3, 0, FN_VI3_CLK, FN_SCIFA0_RTS_N_B,
+		FN_HRX0_B, FN_MSIOF0_SCK_B, 0,
 		/* IP5_23_21 [3] */
 		FN_WE1_N, FN_IERX, FN_CAN1_RX, FN_VI1_G4,
 		FN_VI1_G4_B, FN_VI2_R6, FN_SCIFA0_CTS_N_B, FN_IERX_C,
@@ -5426,7 +5420,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI2_VSYNC_N, FN_SCIFA0_TXD_B, FN_VI2_VSYNC_N_B, 0, 0,
 		/* IP5_17_15 [3] */
 		FN_RD_WR_N, FN_VI1_G3, FN_VI1_G3_B, FN_VI2_R5, FN_SCIFA0_RXD_B,
-		FN_INTC_IRQ4_N, 0, 0,
+		0, 0, 0,
 		/* IP5_14_13 [2] */
 		FN_RD_N, FN_CAN0_TX, FN_SCIFA0_SCK_B, 0,
 		/* IP5_12_10 [3] */
@@ -5467,19 +5461,18 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_TS_SDEN0_D, FN_GLO_Q0_C, FN_IIC2_SCL_E,
 		FN_I2C2_SCL_E, 0,
 		/* IP6_13_11 [3] */
-		FN_DACK2, FN_IRQ2, FN_INTC_IRQ2_N,
-		FN_SSI_SDATA6_B, FN_HRTS0_N_B, FN_MSIOF0_RXD_B, 0, 0,
+		FN_DACK2, FN_IRQ2, 0, FN_SSI_SDATA6_B, FN_HRTS0_N_B,
+		FN_MSIOF0_RXD_B, 0, 0,
 		/* IP6_10_9 [2] */
 		FN_DREQ2_N, FN_HSCK1_B, FN_HCTS0_N_B, FN_MSIOF0_TXD_B,
 		/* IP6_8_6 [3] */
-		FN_DACK1, FN_IRQ1, FN_INTC_IRQ1_N, FN_SSI_WS6_B,
-		FN_SSI_SDATA8_C, 0, 0, 0,
+		FN_DACK1, FN_IRQ1, 0, FN_SSI_WS6_B, FN_SSI_SDATA8_C, 0, 0, 0,
 		/* IP6_5_3 [3] */
 		FN_DREQ1_N, FN_VI1_CLKENB, FN_VI1_CLKENB_B,
 		FN_SSI_SDATA7_C, FN_SSI_SCK78_B, 0, 0, 0,
 		/* IP6_2_0 [3] */
-		FN_DACK0, FN_IRQ0, FN_INTC_IRQ0_N, FN_SSI_SCK6_B,
-		FN_VI1_VSYNC_N, FN_VI1_VSYNC_N_B, FN_SSI_WS78_C, 0, ))
+		FN_DACK0, FN_IRQ0, 0, FN_SSI_SCK6_B, FN_VI1_VSYNC_N,
+		FN_VI1_VSYNC_N_B, FN_SSI_WS78_C, 0, ))
 	},
 	{ PINMUX_CFG_REG_VAR("IPSR7", 0xE606003C, 32,
 			     GROUP(1, 2, 2, 2, 3, 3, 3, 3, 3, 2, 2, 3, 3),
-- 
2.25.1

