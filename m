Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F3CA8237
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 14:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729727AbfIDMRC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 08:17:02 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:36962 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbfIDMRB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 08:17:01 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id xQGz2000P05gfCL01QGz5s; Wed, 04 Sep 2019 14:17:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5UDb-0001f4-I3; Wed, 04 Sep 2019 14:16:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5UDb-0000h7-GB; Wed, 04 Sep 2019 14:16:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when using SIM0_D"
Date:   Wed,  4 Sep 2019 14:16:58 +0200
Message-Id: <20190904121658.2617-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904121658.2617-1-geert+renesas@glider.be>
References: <20190904121658.2617-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit e167d723e1a472d252e5c4baf823b77ce5543b05.

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of Aug
24, 2018, the SEL_SIMCARD_{0,1} definition was to be deleted.  However,
this errata merely fixed an accidental double definition in the Hardware
User's Manual Rev. 1.00.  The real definition is still present in later
revisions of the manual (Rev. 1.50 and Rev. 2.00).

Hence revert the commit to recover the definition.

Based on a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 010fc0a6aba65428..c926a59dd21ceadc 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -448,6 +448,7 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 #define MOD_SEL0_1_0	   REV4(FM(SEL_SPEED_PULSE_IF_0),	FM(SEL_SPEED_PULSE_IF_1),	FM(SEL_SPEED_PULSE_IF_2),	F_(0, 0))
 
 /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */				/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
+#define MOD_SEL1_31		FM(SEL_SIMCARD_0)		FM(SEL_SIMCARD_1)
 #define MOD_SEL1_30		FM(SEL_SSI2_0)			FM(SEL_SSI2_1)
 #define MOD_SEL1_29		FM(SEL_TIMER_TMU_0)		FM(SEL_TIMER_TMU_1)
 #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
@@ -469,6 +470,7 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 
 #define PINMUX_MOD_SELS	\
 \
+			MOD_SEL1_31 \
 MOD_SEL0_30_29		MOD_SEL1_30 \
 			MOD_SEL1_29 \
 MOD_SEL0_28		MOD_SEL1_28 \
@@ -1197,7 +1199,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP13_19_16,		RIF0_D1_A,	SEL_DRIF0_0),
 	PINMUX_IPSR_MSEL(IP13_19_16,		SDA1_B,		SEL_I2C1_1),
 	PINMUX_IPSR_MSEL(IP13_19_16,		TCLK2_B,	SEL_TIMER_TMU_1),
-	PINMUX_IPSR_GPSR(IP13_19_16,		SIM0_D_A),
+	PINMUX_IPSR_MSEL(IP13_19_16,		SIM0_D_A,	SEL_SIMCARD_0),
 
 	PINMUX_IPSR_GPSR(IP13_23_20,		MLB_DAT),
 	PINMUX_IPSR_MSEL(IP13_23_20,		TX0_B,		SEL_SCIF0_1),
@@ -1265,7 +1267,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP15_15_12,		TPU0TO2),
 	PINMUX_IPSR_MSEL(IP15_15_12,		SDA1_D,		SEL_I2C1_3),
 	PINMUX_IPSR_MSEL(IP15_15_12,		FSO_CFE_1_N_B,	SEL_FSO_1),
-	PINMUX_IPSR_GPSR(IP15_15_12,		SIM0_D_B),
+	PINMUX_IPSR_MSEL(IP15_15_12,		SIM0_D_B,	SEL_SIMCARD_1),
 
 	PINMUX_IPSR_GPSR(IP15_19_16,		SSI_SDATA6),
 	PINMUX_IPSR_MSEL(IP15_19_16,		HRTS2_N_A,	SEL_HSCIF2_0),
@@ -4961,8 +4963,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			     GROUP(1, 1, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1,
 				   1, 2, 2, 2, 1, 1, 2, 1, 4),
 			     GROUP(
-		/* RESERVED 31 */
-		0, 0,
+		MOD_SEL1_31
 		MOD_SEL1_30
 		MOD_SEL1_29
 		MOD_SEL1_28
-- 
2.17.1

