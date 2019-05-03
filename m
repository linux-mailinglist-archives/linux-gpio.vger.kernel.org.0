Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5D712C96
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2019 13:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfECLnI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 May 2019 07:43:08 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:60008 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfECLnI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 May 2019 07:43:08 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id 7nj6200073XaVaC06nj6Ur; Fri, 03 May 2019 13:43:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hMWan-0004Sg-UF; Fri, 03 May 2019 13:43:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hMWan-0005K0-S9; Fri, 03 May 2019 13:43:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77970: Remove MMC_{CD,WP}
Date:   Fri,  3 May 2019 13:43:04 +0200
Message-Id: <20190503114304.20412-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hardware Manual Errata for rev. 15.0 of March 26, 2019 removed the bit
definitions for MMC_CD and MMC_WP in the documentation for the IPSR6
register, as these pin functionalities do not exist on R-Car V3M.

Remove the definitions, and the corrresponding pins and groups.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.3.

 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index 8473a83bd4ca6570..25e27b6bee89366f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -205,8 +205,8 @@
 #define IP6_19_16	FM(VI1_DATA8)			F_(0, 0)		FM(CTS4_N)	FM(D11)		FM(MMC_D5)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_23_20	FM(VI1_DATA9)			F_(0, 0)		FM(RTS4_N)	FM(D12)		FM(MMC_D6)		FM(SCL3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_27_24	FM(VI1_DATA10)			F_(0, 0)		F_(0, 0)	FM(D13)		FM(MMC_D7)		FM(SDA3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_31_28	FM(VI1_DATA11)			FM(SCL4)		FM(IRQ4)	FM(D14)		FM(MMC_WP)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP7_3_0		FM(VI1_FIELD)			FM(SDA4)		FM(IRQ5)	FM(D15)		FM(MMC_CD)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_31_28	FM(VI1_DATA11)			FM(SCL4)		FM(IRQ4)	FM(D14)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP7_3_0		FM(VI1_FIELD)			FM(SDA4)		FM(IRQ5)	FM(D15)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_7_4		FM(SCL0)			FM(DU_DR0)		FM(TPU0TO0)	FM(CLKOUT)	F_(0, 0)		FM(MSIOF0_RXD)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_11_8	FM(SDA0)			FM(DU_DR1)		FM(TPU0TO1)	FM(BS_N)	FM(SCK0)		FM(MSIOF0_TXD)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_15_12	FM(SCL1)			FM(DU_DG0)		FM(TPU0TO2)	FM(RD_N)	FM(CTS0_N)		FM(MSIOF0_SCK)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -631,14 +631,12 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP6_31_28,	SCL4),
 	PINMUX_IPSR_GPSR(IP6_31_28,	IRQ4),
 	PINMUX_IPSR_GPSR(IP6_31_28,	D14),
-	PINMUX_IPSR_GPSR(IP6_31_28,	MMC_WP),
 
 	/* IPSR7 */
 	PINMUX_IPSR_GPSR(IP7_3_0,	VI1_FIELD),
 	PINMUX_IPSR_GPSR(IP7_3_0,	SDA4),
 	PINMUX_IPSR_GPSR(IP7_3_0,	IRQ5),
 	PINMUX_IPSR_GPSR(IP7_3_0,	D15),
-	PINMUX_IPSR_GPSR(IP7_3_0,	MMC_CD),
 
 	PINMUX_IPSR_GPSR(IP7_7_4,	SCL0),
 	PINMUX_IPSR_GPSR(IP7_7_4,	DU_DR0),
@@ -1121,20 +1119,6 @@ static const unsigned int mmc_ctrl_pins[] = {
 static const unsigned int mmc_ctrl_mux[] = {
 	MMC_CLK_MARK, MMC_CMD_MARK,
 };
-static const unsigned int mmc_cd_pins[] = {
-	/* CD */
-	RCAR_GP_PIN(3, 16),
-};
-static const unsigned int mmc_cd_mux[] = {
-	MMC_CD_MARK,
-};
-static const unsigned int mmc_wp_pins[] = {
-	/* WP */
-	RCAR_GP_PIN(3, 15),
-};
-static const unsigned int mmc_wp_mux[] = {
-	MMC_WP_MARK,
-};
 
 /* - MSIOF0 ----------------------------------------------------------------- */
 static const unsigned int msiof0_clk_pins[] = {
@@ -1726,8 +1710,6 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(mmc_data4),
 	SH_PFC_PIN_GROUP(mmc_data8),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
-	SH_PFC_PIN_GROUP(mmc_cd),
-	SH_PFC_PIN_GROUP(mmc_wp),
 	SH_PFC_PIN_GROUP(msiof0_clk),
 	SH_PFC_PIN_GROUP(msiof0_sync),
 	SH_PFC_PIN_GROUP(msiof0_ss1),
@@ -1897,8 +1879,6 @@ static const char * const mmc_groups[] = {
 	"mmc_data4",
 	"mmc_data8",
 	"mmc_ctrl",
-	"mmc_cd",
-	"mmc_wp",
 };
 
 static const char * const msiof0_groups[] = {
-- 
2.17.1

