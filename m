Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1D3A823B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 14:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbfIDMRD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 08:17:03 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:36956 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729635AbfIDMRD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 08:17:03 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id xQGz2000N05gfCL01QGz5q; Wed, 04 Sep 2019 14:17:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5UDb-0001f2-GT; Wed, 04 Sep 2019 14:16:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5UDb-0000h3-FZ; Wed, 04 Sep 2019 14:16:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when using SSI_SCK2 and SSI_WS2"
Date:   Wed,  4 Sep 2019 14:16:57 +0200
Message-Id: <20190904121658.2617-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904121658.2617-1-geert+renesas@glider.be>
References: <20190904121658.2617-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit e87882eb9be10b2b9e28156922c2a47d877f5db4.

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of Aug
24, 2018, the SEL_SSI2_{0,1} definition was to be deleted.  However,
this errata merely fixed an accidental double definition in the Hardware
User's Manual Rev. 1.00.  The real definition is still present in later
revisions of the manual (Rev. 1.50 and Rev. 2.00).

Hence revert the commit to recover the definition.

Based on a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 2a6de2125bbf38b3..010fc0a6aba65428 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -448,6 +448,7 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 #define MOD_SEL0_1_0	   REV4(FM(SEL_SPEED_PULSE_IF_0),	FM(SEL_SPEED_PULSE_IF_1),	FM(SEL_SPEED_PULSE_IF_2),	F_(0, 0))
 
 /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
+#define MOD_SEL1_30		FM(SEL_SSI2_0)			FM(SEL_SSI2_1)
 #define MOD_SEL1_29		FM(SEL_TIMER_TMU_0)		FM(SEL_TIMER_TMU_1)
 #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
 #define MOD_SEL1_26		FM(SEL_DRIF2_0)			FM(SEL_DRIF2_1)
@@ -468,7 +469,7 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 
 #define PINMUX_MOD_SELS	\
 \
-MOD_SEL0_30_29 \
+MOD_SEL0_30_29		MOD_SEL1_30 \
 			MOD_SEL1_29 \
 MOD_SEL0_28		MOD_SEL1_28 \
 MOD_SEL0_27_26 \
@@ -1058,7 +1059,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP10_27_24,		RIF0_CLK_B,	SEL_DRIF0_1),
 	PINMUX_IPSR_MSEL(IP10_27_24,		SCL2_B,		SEL_I2C2_1),
 	PINMUX_IPSR_MSEL(IP10_27_24,		TCLK1_A,	SEL_TIMER_TMU_0),
-	PINMUX_IPSR_GPSR(IP10_27_24,		SSI_SCK2_B),
+	PINMUX_IPSR_MSEL(IP10_27_24,		SSI_SCK2_B,	SEL_SSI2_1),
 	PINMUX_IPSR_GPSR(IP10_27_24,		TS_SCK0),
 
 	PINMUX_IPSR_GPSR(IP10_31_28,		SD0_WP),
@@ -1067,7 +1068,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP10_31_28,		RIF0_D0_B,	SEL_DRIF0_1),
 	PINMUX_IPSR_MSEL(IP10_31_28,		SDA2_B,		SEL_I2C2_1),
 	PINMUX_IPSR_MSEL(IP10_31_28,		TCLK2_A,	SEL_TIMER_TMU_0),
-	PINMUX_IPSR_GPSR(IP10_31_28,		SSI_WS2_B),
+	PINMUX_IPSR_MSEL(IP10_31_28,		SSI_WS2_B,	SEL_SSI2_1),
 	PINMUX_IPSR_GPSR(IP10_31_28,		TS_SDAT0),
 
 	/* IPSR11 */
@@ -1085,13 +1086,13 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_MSEL(IP11_11_8,		RX0_A,		SEL_SCIF0_0),
 	PINMUX_IPSR_MSEL(IP11_11_8,		HRX1_A,		SEL_HSCIF1_0),
-	PINMUX_IPSR_GPSR(IP11_11_8,		SSI_SCK2_A),
+	PINMUX_IPSR_MSEL(IP11_11_8,		SSI_SCK2_A,	SEL_SSI2_0),
 	PINMUX_IPSR_GPSR(IP11_11_8,		RIF1_SYNC),
 	PINMUX_IPSR_GPSR(IP11_11_8,		TS_SCK1),
 
 	PINMUX_IPSR_MSEL(IP11_15_12,		TX0_A,		SEL_SCIF0_0),
 	PINMUX_IPSR_GPSR(IP11_15_12,		HTX1_A),
-	PINMUX_IPSR_GPSR(IP11_15_12,		SSI_WS2_A),
+	PINMUX_IPSR_MSEL(IP11_15_12,		SSI_WS2_A,	SEL_SSI2_0),
 	PINMUX_IPSR_GPSR(IP11_15_12,		RIF1_D0),
 	PINMUX_IPSR_GPSR(IP11_15_12,		TS_SDAT1),
 
@@ -4957,11 +4958,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_1_0 ))
 	},
 	{ PINMUX_CFG_REG_VAR("MOD_SEL1", 0xe6060504, 32,
-			     GROUP(2, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1,
-				   2, 2, 2, 1, 1, 2, 1, 4),
+			     GROUP(1, 1, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1,
+				   1, 2, 2, 2, 1, 1, 2, 1, 4),
 			     GROUP(
-		/* RESERVED 31, 30 */
-		0, 0, 0, 0,
+		/* RESERVED 31 */
+		0, 0,
+		MOD_SEL1_30
 		MOD_SEL1_29
 		MOD_SEL1_28
 		/* RESERVED 27 */
-- 
2.17.1

