Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEDA47E4CD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348897AbhLWOm0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348909AbhLWOmR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:17 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137F0C06139B
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id ZqiF2600G4C55Sk06qiFqo; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006a8z-9P; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rYv-Sj; Thu, 23 Dec 2021 15:42:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/60] pinctrl: renesas: Add generic support for resizable buses
Date:   Thu, 23 Dec 2021 15:41:16 +0100
Message-Id: <cccfcfd01eb8ab7a587b084c4ddbf97293bd7291.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The VIN_DATA_PIN_GROUP() macro and vin_data{12,16,} unions are used to
define multiple VIN data groups with different numbers of lanes, while
referring to a single array of data pins, thus saving memory.

However, the same feature would be useful for other resizable buses,
like MMC, SDHI, QSPI, LCD, BSC, ...

Rework the mechanism for generic use:
  - Use the new SH_PFC_PIN_GROUP_SUBSET() helper to remove the need for
    bus-specific unions,
  - Rename VIN_DATA_PIN_GROUP() to BUS_DATA_PIN_GROUP(),
  - Rename the macro parameters to better reflect their purposes,
  - Move the macro up, where it belongs.

Update all individual pin control drivers for the above changes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 118 ++++---
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 322 +++++++++----------
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 160 +++++-----
 drivers/pinctrl/renesas/pfc-r8a7792.c  | 412 ++++++++++++-------------
 drivers/pinctrl/renesas/pfc-r8a7794.c  | 118 ++++---
 drivers/pinctrl/renesas/pfc-r8a77951.c | 184 ++++++-----
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 184 ++++++-----
 drivers/pinctrl/renesas/pfc-r8a77965.c | 184 ++++++-----
 drivers/pinctrl/renesas/pfc-r8a77970.c |  78 +++--
 drivers/pinctrl/renesas/pfc-r8a77980.c | 106 +++----
 drivers/pinctrl/renesas/pfc-r8a77990.c | 184 ++++++-----
 drivers/pinctrl/renesas/pfc-r8a77995.c |  68 ++--
 drivers/pinctrl/renesas/sh_pfc.h       |  44 +--
 13 files changed, 999 insertions(+), 1163 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index 0d5b603b870fb079..d7f9daa3a02e01fe 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -2047,43 +2047,39 @@ static const unsigned int usb1_mux[] = {
 	USB1_OVC_MARK,
 };
 /* - VIN0 ------------------------------------------------------------------- */
-static const union vin_data vin0_data_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(5, 20), RCAR_GP_PIN(5, 21),
-		RCAR_GP_PIN(5, 22), RCAR_GP_PIN(5, 23),
-		RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
-		RCAR_GP_PIN(5, 26), RCAR_GP_PIN(5, 27),
-		/* G */
-		RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
-		RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
-		RCAR_GP_PIN(4, 6), RCAR_GP_PIN(5, 8),
-		RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 10),
-		/* R */
-		RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 12),
-		RCAR_GP_PIN(5, 13), RCAR_GP_PIN(5, 14),
-		RCAR_GP_PIN(5, 15), RCAR_GP_PIN(5, 16),
-		RCAR_GP_PIN(5, 17), RCAR_GP_PIN(5, 19),
-	},
+static const unsigned int vin0_data_pins[] = {
+	/* B */
+	RCAR_GP_PIN(5, 20), RCAR_GP_PIN(5, 21),
+	RCAR_GP_PIN(5, 22), RCAR_GP_PIN(5, 23),
+	RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
+	RCAR_GP_PIN(5, 26), RCAR_GP_PIN(5, 27),
+	/* G */
+	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
+	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
+	RCAR_GP_PIN(4, 6), RCAR_GP_PIN(5, 8),
+	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 10),
+	/* R */
+	RCAR_GP_PIN(5, 11), RCAR_GP_PIN(5, 12),
+	RCAR_GP_PIN(5, 13), RCAR_GP_PIN(5, 14),
+	RCAR_GP_PIN(5, 15), RCAR_GP_PIN(5, 16),
+	RCAR_GP_PIN(5, 17), RCAR_GP_PIN(5, 19),
 };
-static const union vin_data vin0_data_mux = {
-	.data24 = {
-		/* B */
-		VI0_DATA0_VI0_B0_MARK, VI0_DATA1_VI0_B1_MARK,
-		VI0_DATA2_VI0_B2_MARK, VI0_DATA3_VI0_B3_MARK,
-		VI0_DATA4_VI0_B4_MARK, VI0_DATA5_VI0_B5_MARK,
-		VI0_DATA6_VI0_B6_MARK, VI0_DATA7_VI0_B7_MARK,
-		/* G */
-		VI0_G0_MARK, VI0_G1_MARK,
-		VI0_G2_MARK, VI0_G3_MARK,
-		VI0_G4_MARK, VI0_G5_MARK,
-		VI0_G6_MARK, VI0_G7_MARK,
-		/* R */
-		VI0_R0_MARK, VI0_R1_MARK,
-		VI0_R2_MARK, VI0_R3_MARK,
-		VI0_R4_MARK, VI0_R5_MARK,
-		VI0_R6_MARK, VI0_R7_MARK,
-	},
+static const unsigned int vin0_data_mux[] = {
+	/* B */
+	VI0_DATA0_VI0_B0_MARK, VI0_DATA1_VI0_B1_MARK,
+	VI0_DATA2_VI0_B2_MARK, VI0_DATA3_VI0_B3_MARK,
+	VI0_DATA4_VI0_B4_MARK, VI0_DATA5_VI0_B5_MARK,
+	VI0_DATA6_VI0_B6_MARK, VI0_DATA7_VI0_B7_MARK,
+	/* G */
+	VI0_G0_MARK, VI0_G1_MARK,
+	VI0_G2_MARK, VI0_G3_MARK,
+	VI0_G4_MARK, VI0_G5_MARK,
+	VI0_G6_MARK, VI0_G7_MARK,
+	/* R */
+	VI0_R0_MARK, VI0_R1_MARK,
+	VI0_R2_MARK, VI0_R3_MARK,
+	VI0_R4_MARK, VI0_R5_MARK,
+	VI0_R6_MARK, VI0_R7_MARK,
 };
 static const unsigned int vin0_data18_pins[] = {
 	/* B */
@@ -2140,25 +2136,21 @@ static const unsigned int vin0_clk_mux[] = {
 	VI0_CLK_MARK,
 };
 /* - VIN1 ------------------------------------------------------------------- */
-static const union vin_data12 vin1_data_pins = {
-	.data12 = {
-		RCAR_GP_PIN(3,  1), RCAR_GP_PIN(3, 2),
-		RCAR_GP_PIN(3,  3), RCAR_GP_PIN(3, 4),
-		RCAR_GP_PIN(3,  5), RCAR_GP_PIN(3, 6),
-		RCAR_GP_PIN(3,  7), RCAR_GP_PIN(3, 8),
-		RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 14),
-		RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
-	},
+static const unsigned int vin1_data_pins[] = {
+	RCAR_GP_PIN(3,  1), RCAR_GP_PIN(3, 2),
+	RCAR_GP_PIN(3,  3), RCAR_GP_PIN(3, 4),
+	RCAR_GP_PIN(3,  5), RCAR_GP_PIN(3, 6),
+	RCAR_GP_PIN(3,  7), RCAR_GP_PIN(3, 8),
+	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 14),
+	RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
 };
-static const union vin_data12 vin1_data_mux = {
-	.data12 = {
-		VI1_DATA0_MARK, VI1_DATA1_MARK,
-		VI1_DATA2_MARK, VI1_DATA3_MARK,
-		VI1_DATA4_MARK, VI1_DATA5_MARK,
-		VI1_DATA6_MARK, VI1_DATA7_MARK,
-		VI1_DATA8_MARK, VI1_DATA9_MARK,
-		VI1_DATA10_MARK, VI1_DATA11_MARK,
-	},
+static const unsigned int vin1_data_mux[] = {
+	VI1_DATA0_MARK, VI1_DATA1_MARK,
+	VI1_DATA2_MARK, VI1_DATA3_MARK,
+	VI1_DATA4_MARK, VI1_DATA5_MARK,
+	VI1_DATA6_MARK, VI1_DATA7_MARK,
+	VI1_DATA8_MARK, VI1_DATA9_MARK,
+	VI1_DATA10_MARK, VI1_DATA11_MARK,
 };
 static const unsigned int vin1_sync_pins[] = {
 	RCAR_GP_PIN(3, 11), /* HSYNC */
@@ -2303,20 +2295,20 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(sdhi2_wp),
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
-	VIN_DATA_PIN_GROUP(vin0_data, 24),
-	VIN_DATA_PIN_GROUP(vin0_data, 20),
+	BUS_DATA_PIN_GROUP(vin0_data, 24),
+	BUS_DATA_PIN_GROUP(vin0_data, 20),
 	SH_PFC_PIN_GROUP(vin0_data18),
-	VIN_DATA_PIN_GROUP(vin0_data, 16),
-	VIN_DATA_PIN_GROUP(vin0_data, 12),
-	VIN_DATA_PIN_GROUP(vin0_data, 10),
-	VIN_DATA_PIN_GROUP(vin0_data, 8),
+	BUS_DATA_PIN_GROUP(vin0_data, 16),
+	BUS_DATA_PIN_GROUP(vin0_data, 12),
+	BUS_DATA_PIN_GROUP(vin0_data, 10),
+	BUS_DATA_PIN_GROUP(vin0_data, 8),
 	SH_PFC_PIN_GROUP(vin0_sync),
 	SH_PFC_PIN_GROUP(vin0_field),
 	SH_PFC_PIN_GROUP(vin0_clkenb),
 	SH_PFC_PIN_GROUP(vin0_clk),
-	VIN_DATA_PIN_GROUP(vin1_data, 12),
-	VIN_DATA_PIN_GROUP(vin1_data, 10),
-	VIN_DATA_PIN_GROUP(vin1_data, 8),
+	BUS_DATA_PIN_GROUP(vin1_data, 12),
+	BUS_DATA_PIN_GROUP(vin1_data, 10),
+	BUS_DATA_PIN_GROUP(vin1_data, 8),
 	SH_PFC_PIN_GROUP(vin1_sync),
 	SH_PFC_PIN_GROUP(vin1_field),
 	SH_PFC_PIN_GROUP(vin1_clkenb),
diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 936fec3d715bb1bf..44aad3b80bbc19e6 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -3711,43 +3711,39 @@ static const unsigned int usb2_mux[] = {
 	USB2_PWEN_MARK, USB2_OVC_MARK,
 };
 /* - VIN0 ------------------------------------------------------------------- */
-static const union vin_data vin0_data_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-		RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-		RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
-		RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-		/* G */
-		RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-		RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		/* R */
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-		RCAR_GP_PIN(0, 24), RCAR_GP_PIN(0, 25),
-		RCAR_GP_PIN(0, 26), RCAR_GP_PIN(1, 11),
-	},
+static const unsigned int vin0_data_pins[] = {
+	/* B */
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+	/* G */
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	/* R */
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(0, 24), RCAR_GP_PIN(0, 25),
+	RCAR_GP_PIN(0, 26), RCAR_GP_PIN(1, 11),
 };
-static const union vin_data vin0_data_mux = {
-	.data24 = {
-		/* B */
-		VI0_DATA0_VI0_B0_MARK, VI0_DATA1_VI0_B1_MARK,
-		VI0_DATA2_VI0_B2_MARK, VI0_DATA3_VI0_B3_MARK,
-		VI0_DATA4_VI0_B4_MARK, VI0_DATA5_VI0_B5_MARK,
-		VI0_DATA6_VI0_B6_MARK, VI0_DATA7_VI0_B7_MARK,
-		/* G */
-		VI0_G0_MARK, VI0_G1_MARK,
-		VI0_G2_MARK, VI0_G3_MARK,
-		VI0_G4_MARK, VI0_G5_MARK,
-		VI0_G6_MARK, VI0_G7_MARK,
-		/* R */
-		VI0_R0_MARK, VI0_R1_MARK,
-		VI0_R2_MARK, VI0_R3_MARK,
-		VI0_R4_MARK, VI0_R5_MARK,
-		VI0_R6_MARK, VI0_R7_MARK,
-	},
+static const unsigned int vin0_data_mux[] = {
+	/* B */
+	VI0_DATA0_VI0_B0_MARK, VI0_DATA1_VI0_B1_MARK,
+	VI0_DATA2_VI0_B2_MARK, VI0_DATA3_VI0_B3_MARK,
+	VI0_DATA4_VI0_B4_MARK, VI0_DATA5_VI0_B5_MARK,
+	VI0_DATA6_VI0_B6_MARK, VI0_DATA7_VI0_B7_MARK,
+	/* G */
+	VI0_G0_MARK, VI0_G1_MARK,
+	VI0_G2_MARK, VI0_G3_MARK,
+	VI0_G4_MARK, VI0_G5_MARK,
+	VI0_G6_MARK, VI0_G7_MARK,
+	/* R */
+	VI0_R0_MARK, VI0_R1_MARK,
+	VI0_R2_MARK, VI0_R3_MARK,
+	VI0_R4_MARK, VI0_R5_MARK,
+	VI0_R6_MARK, VI0_R7_MARK,
 };
 static const unsigned int vin0_data18_pins[] = {
 	/* B */
@@ -3804,43 +3800,39 @@ static const unsigned int vin0_clk_mux[] = {
 	VI0_CLK_MARK,
 };
 /* - VIN1 ------------------------------------------------------------------- */
-static const union vin_data vin1_data_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
-		RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
-		RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
-		RCAR_GP_PIN(2, 16), RCAR_GP_PIN(2, 17),
-		/* G */
-		RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 20),
-		RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 12),
-		RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 7),
-		/* R */
-		RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
-		RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 4),
-		RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
-		RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 8),
-	},
+static const unsigned int vin1_data_pins[] = {
+	/* B */
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
+	RCAR_GP_PIN(2, 16), RCAR_GP_PIN(2, 17),
+	/* G */
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 20),
+	RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 7),
+	/* R */
+	RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
+	RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 4),
+	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
+	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 8),
 };
-static const union vin_data vin1_data_mux = {
-	.data24 = {
-		/* B */
-		VI1_DATA0_VI1_B0_MARK, VI1_DATA1_VI1_B1_MARK,
-		VI1_DATA2_VI1_B2_MARK, VI1_DATA3_VI1_B3_MARK,
-		VI1_DATA4_VI1_B4_MARK, VI1_DATA5_VI1_B5_MARK,
-		VI1_DATA6_VI1_B6_MARK, VI1_DATA7_VI1_B7_MARK,
-		/* G */
-		VI1_G0_MARK, VI1_G1_MARK,
-		VI1_G2_MARK, VI1_G3_MARK,
-		VI1_G4_MARK, VI1_G5_MARK,
-		VI1_G6_MARK, VI1_G7_MARK,
-		/* R */
-		VI1_R0_MARK, VI1_R1_MARK,
-		VI1_R2_MARK, VI1_R3_MARK,
-		VI1_R4_MARK, VI1_R5_MARK,
-		VI1_R6_MARK, VI1_R7_MARK,
-	},
+static const unsigned int vin1_data_mux[] = {
+	/* B */
+	VI1_DATA0_VI1_B0_MARK, VI1_DATA1_VI1_B1_MARK,
+	VI1_DATA2_VI1_B2_MARK, VI1_DATA3_VI1_B3_MARK,
+	VI1_DATA4_VI1_B4_MARK, VI1_DATA5_VI1_B5_MARK,
+	VI1_DATA6_VI1_B6_MARK, VI1_DATA7_VI1_B7_MARK,
+	/* G */
+	VI1_G0_MARK, VI1_G1_MARK,
+	VI1_G2_MARK, VI1_G3_MARK,
+	VI1_G4_MARK, VI1_G5_MARK,
+	VI1_G6_MARK, VI1_G7_MARK,
+	/* R */
+	VI1_R0_MARK, VI1_R1_MARK,
+	VI1_R2_MARK, VI1_R3_MARK,
+	VI1_R4_MARK, VI1_R5_MARK,
+	VI1_R6_MARK, VI1_R7_MARK,
 };
 static const unsigned int vin1_data18_pins[] = {
 	/* B */
@@ -3870,43 +3862,39 @@ static const unsigned int vin1_data18_mux[] = {
 	VI1_R4_MARK, VI1_R5_MARK,
 	VI1_R6_MARK, VI1_R7_MARK,
 };
-static const union vin_data vin1_data_b_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
-		RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
-		RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
-		RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
-		/* G */
-		RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 20),
-		RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 12),
-		RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 7),
-		/* R */
-		RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
-		RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 4),
-		RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
-		RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 8),
-	},
+static const unsigned int vin1_data_b_pins[] = {
+	/* B */
+	RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
+	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+	/* G */
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 20),
+	RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 7),
+	/* R */
+	RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
+	RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 4),
+	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
+	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 8),
 };
-static const union vin_data vin1_data_b_mux = {
-	.data24 = {
-		/* B */
-		VI1_DATA0_VI1_B0_B_MARK, VI1_DATA1_VI1_B1_B_MARK,
-		VI1_DATA2_VI1_B2_B_MARK, VI1_DATA3_VI1_B3_B_MARK,
-		VI1_DATA4_VI1_B4_B_MARK, VI1_DATA5_VI1_B5_B_MARK,
-		VI1_DATA6_VI1_B6_B_MARK, VI1_DATA7_VI1_B7_B_MARK,
-		/* G */
-		VI1_G0_B_MARK, VI1_G1_B_MARK,
-		VI1_G2_B_MARK, VI1_G3_B_MARK,
-		VI1_G4_B_MARK, VI1_G5_B_MARK,
-		VI1_G6_B_MARK, VI1_G7_B_MARK,
-		/* R */
-		VI1_R0_B_MARK, VI1_R1_B_MARK,
-		VI1_R2_B_MARK, VI1_R3_B_MARK,
-		VI1_R4_B_MARK, VI1_R5_B_MARK,
-		VI1_R6_B_MARK, VI1_R7_B_MARK,
-	},
+static const unsigned int vin1_data_b_mux[] = {
+	/* B */
+	VI1_DATA0_VI1_B0_B_MARK, VI1_DATA1_VI1_B1_B_MARK,
+	VI1_DATA2_VI1_B2_B_MARK, VI1_DATA3_VI1_B3_B_MARK,
+	VI1_DATA4_VI1_B4_B_MARK, VI1_DATA5_VI1_B5_B_MARK,
+	VI1_DATA6_VI1_B6_B_MARK, VI1_DATA7_VI1_B7_B_MARK,
+	/* G */
+	VI1_G0_B_MARK, VI1_G1_B_MARK,
+	VI1_G2_B_MARK, VI1_G3_B_MARK,
+	VI1_G4_B_MARK, VI1_G5_B_MARK,
+	VI1_G6_B_MARK, VI1_G7_B_MARK,
+	/* R */
+	VI1_R0_B_MARK, VI1_R1_B_MARK,
+	VI1_R2_B_MARK, VI1_R3_B_MARK,
+	VI1_R4_B_MARK, VI1_R5_B_MARK,
+	VI1_R6_B_MARK, VI1_R7_B_MARK,
 };
 static const unsigned int vin1_data18_b_pins[] = {
 	/* B */
@@ -3989,43 +3977,39 @@ static const unsigned int vin1_clk_b_mux[] = {
 	VI1_CLK_B_MARK,
 };
 /* - VIN2 ----------------------------------------------------------------- */
-static const union vin_data vin2_data_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-		RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-		RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-		RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-		/* G */
-		RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
-		RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
-		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-		/* R */
-		RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-		RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 20),
-		RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 24),
-	},
+static const unsigned int vin2_data_pins[] = {
+	/* B */
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	/* G */
+	RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
+	RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	/* R */
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 20),
+	RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 24),
 };
-static const union vin_data vin2_data_mux = {
-	.data24 = {
-		/* B */
-		VI2_DATA0_VI2_B0_MARK, VI2_DATA1_VI2_B1_MARK,
-		VI2_DATA2_VI2_B2_MARK, VI2_DATA3_VI2_B3_MARK,
-		VI2_DATA4_VI2_B4_MARK, VI2_DATA5_VI2_B5_MARK,
-		VI2_DATA6_VI2_B6_MARK, VI2_DATA7_VI2_B7_MARK,
-		/* G */
-		VI2_G0_MARK, VI2_G1_MARK,
-		VI2_G2_MARK, VI2_G3_MARK,
-		VI2_G4_MARK, VI2_G5_MARK,
-		VI2_G6_MARK, VI2_G7_MARK,
-		/* R */
-		VI2_R0_MARK, VI2_R1_MARK,
-		VI2_R2_MARK, VI2_R3_MARK,
-		VI2_R4_MARK, VI2_R5_MARK,
-		VI2_R6_MARK, VI2_R7_MARK,
-	},
+static const unsigned int vin2_data_mux[] = {
+	/* B */
+	VI2_DATA0_VI2_B0_MARK, VI2_DATA1_VI2_B1_MARK,
+	VI2_DATA2_VI2_B2_MARK, VI2_DATA3_VI2_B3_MARK,
+	VI2_DATA4_VI2_B4_MARK, VI2_DATA5_VI2_B5_MARK,
+	VI2_DATA6_VI2_B6_MARK, VI2_DATA7_VI2_B7_MARK,
+	/* G */
+	VI2_G0_MARK, VI2_G1_MARK,
+	VI2_G2_MARK, VI2_G3_MARK,
+	VI2_G4_MARK, VI2_G5_MARK,
+	VI2_G6_MARK, VI2_G7_MARK,
+	/* R */
+	VI2_R0_MARK, VI2_R1_MARK,
+	VI2_R2_MARK, VI2_R3_MARK,
+	VI2_R4_MARK, VI2_R5_MARK,
+	VI2_R6_MARK, VI2_R7_MARK,
 };
 static const unsigned int vin2_data18_pins[] = {
 	/* B */
@@ -4400,34 +4384,34 @@ static const struct {
 		SH_PFC_PIN_GROUP(usb1),
 		SH_PFC_PIN_GROUP(usb1_pwen),
 		SH_PFC_PIN_GROUP(usb2),
-		VIN_DATA_PIN_GROUP(vin0_data, 24),
-		VIN_DATA_PIN_GROUP(vin0_data, 20),
+		BUS_DATA_PIN_GROUP(vin0_data, 24),
+		BUS_DATA_PIN_GROUP(vin0_data, 20),
 		SH_PFC_PIN_GROUP(vin0_data18),
-		VIN_DATA_PIN_GROUP(vin0_data, 16),
-		VIN_DATA_PIN_GROUP(vin0_data, 12),
-		VIN_DATA_PIN_GROUP(vin0_data, 10),
-		VIN_DATA_PIN_GROUP(vin0_data, 8),
-		VIN_DATA_PIN_GROUP(vin0_data, 4),
+		BUS_DATA_PIN_GROUP(vin0_data, 16),
+		BUS_DATA_PIN_GROUP(vin0_data, 12),
+		BUS_DATA_PIN_GROUP(vin0_data, 10),
+		BUS_DATA_PIN_GROUP(vin0_data, 8),
+		BUS_DATA_PIN_GROUP(vin0_data, 4),
 		SH_PFC_PIN_GROUP(vin0_sync),
 		SH_PFC_PIN_GROUP(vin0_field),
 		SH_PFC_PIN_GROUP(vin0_clkenb),
 		SH_PFC_PIN_GROUP(vin0_clk),
-		VIN_DATA_PIN_GROUP(vin1_data, 24),
-		VIN_DATA_PIN_GROUP(vin1_data, 20),
+		BUS_DATA_PIN_GROUP(vin1_data, 24),
+		BUS_DATA_PIN_GROUP(vin1_data, 20),
 		SH_PFC_PIN_GROUP(vin1_data18),
-		VIN_DATA_PIN_GROUP(vin1_data, 16),
-		VIN_DATA_PIN_GROUP(vin1_data, 12),
-		VIN_DATA_PIN_GROUP(vin1_data, 10),
-		VIN_DATA_PIN_GROUP(vin1_data, 8),
-		VIN_DATA_PIN_GROUP(vin1_data, 4),
-		VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 16),
+		BUS_DATA_PIN_GROUP(vin1_data, 12),
+		BUS_DATA_PIN_GROUP(vin1_data, 10),
+		BUS_DATA_PIN_GROUP(vin1_data, 8),
+		BUS_DATA_PIN_GROUP(vin1_data, 4),
+		BUS_DATA_PIN_GROUP(vin1_data, 24, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 20, _b),
 		SH_PFC_PIN_GROUP(vin1_data18_b),
-		VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 12, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 10, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 8, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 4, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 16, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 12, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 10, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 8, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 4, _b),
 		SH_PFC_PIN_GROUP(vin1_sync),
 		SH_PFC_PIN_GROUP(vin1_sync_b),
 		SH_PFC_PIN_GROUP(vin1_field),
@@ -4436,11 +4420,11 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin1_clkenb_b),
 		SH_PFC_PIN_GROUP(vin1_clk),
 		SH_PFC_PIN_GROUP(vin1_clk_b),
-		VIN_DATA_PIN_GROUP(vin2_data, 24),
+		BUS_DATA_PIN_GROUP(vin2_data, 24),
 		SH_PFC_PIN_GROUP(vin2_data18),
-		VIN_DATA_PIN_GROUP(vin2_data, 16),
-		VIN_DATA_PIN_GROUP(vin2_data, 8),
-		VIN_DATA_PIN_GROUP(vin2_data, 4),
+		BUS_DATA_PIN_GROUP(vin2_data, 16),
+		BUS_DATA_PIN_GROUP(vin2_data, 8),
+		BUS_DATA_PIN_GROUP(vin2_data, 4),
 		SH_PFC_PIN_GROUP(vin2_g8),
 		SH_PFC_PIN_GROUP(vin2_sync),
 		SH_PFC_PIN_GROUP(vin2_field),
diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index e636e1b9bc79b341..cdc5408e792b49fa 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -4225,43 +4225,39 @@ static const unsigned int usb1_mux[] = {
 	USB1_OVC_MARK,
 };
 /* - VIN0 ------------------------------------------------------------------- */
-static const union vin_data vin0_data_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(4, 5), RCAR_GP_PIN(4, 6),
-		RCAR_GP_PIN(4, 7), RCAR_GP_PIN(4, 8),
-		RCAR_GP_PIN(4, 9), RCAR_GP_PIN(4, 10),
-		RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 12),
-		/* G */
-		RCAR_GP_PIN(4, 13), RCAR_GP_PIN(4, 14),
-		RCAR_GP_PIN(4, 15), RCAR_GP_PIN(4, 16),
-		RCAR_GP_PIN(4, 17), RCAR_GP_PIN(4, 18),
-		RCAR_GP_PIN(4, 19), RCAR_GP_PIN(4, 20),
-		/* R */
-		RCAR_GP_PIN(4, 21), RCAR_GP_PIN(4, 22),
-		RCAR_GP_PIN(4, 23), RCAR_GP_PIN(4, 24),
-		RCAR_GP_PIN(4, 25), RCAR_GP_PIN(4, 26),
-		RCAR_GP_PIN(4, 27), RCAR_GP_PIN(4, 28),
-	},
+static const unsigned int vin0_data_pins[] = {
+	/* B */
+	RCAR_GP_PIN(4, 5), RCAR_GP_PIN(4, 6),
+	RCAR_GP_PIN(4, 7), RCAR_GP_PIN(4, 8),
+	RCAR_GP_PIN(4, 9), RCAR_GP_PIN(4, 10),
+	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 12),
+	/* G */
+	RCAR_GP_PIN(4, 13), RCAR_GP_PIN(4, 14),
+	RCAR_GP_PIN(4, 15), RCAR_GP_PIN(4, 16),
+	RCAR_GP_PIN(4, 17), RCAR_GP_PIN(4, 18),
+	RCAR_GP_PIN(4, 19), RCAR_GP_PIN(4, 20),
+	/* R */
+	RCAR_GP_PIN(4, 21), RCAR_GP_PIN(4, 22),
+	RCAR_GP_PIN(4, 23), RCAR_GP_PIN(4, 24),
+	RCAR_GP_PIN(4, 25), RCAR_GP_PIN(4, 26),
+	RCAR_GP_PIN(4, 27), RCAR_GP_PIN(4, 28),
 };
-static const union vin_data vin0_data_mux = {
-	.data24 = {
-		/* B */
-		VI0_DATA0_VI0_B0_MARK, VI0_DATA1_VI0_B1_MARK,
-		VI0_DATA2_VI0_B2_MARK, VI0_DATA3_VI0_B3_MARK,
-		VI0_DATA4_VI0_B4_MARK, VI0_DATA5_VI0_B5_MARK,
-		VI0_DATA6_VI0_B6_MARK, VI0_DATA7_VI0_B7_MARK,
-		/* G */
-		VI0_G0_MARK, VI0_G1_MARK,
-		VI0_G2_MARK, VI0_G3_MARK,
-		VI0_G4_MARK, VI0_G5_MARK,
-		VI0_G6_MARK, VI0_G7_MARK,
-		/* R */
-		VI0_R0_MARK, VI0_R1_MARK,
-		VI0_R2_MARK, VI0_R3_MARK,
-		VI0_R4_MARK, VI0_R5_MARK,
-		VI0_R6_MARK, VI0_R7_MARK,
-	},
+static const unsigned int vin0_data_mux[] = {
+	/* B */
+	VI0_DATA0_VI0_B0_MARK, VI0_DATA1_VI0_B1_MARK,
+	VI0_DATA2_VI0_B2_MARK, VI0_DATA3_VI0_B3_MARK,
+	VI0_DATA4_VI0_B4_MARK, VI0_DATA5_VI0_B5_MARK,
+	VI0_DATA6_VI0_B6_MARK, VI0_DATA7_VI0_B7_MARK,
+	/* G */
+	VI0_G0_MARK, VI0_G1_MARK,
+	VI0_G2_MARK, VI0_G3_MARK,
+	VI0_G4_MARK, VI0_G5_MARK,
+	VI0_G6_MARK, VI0_G7_MARK,
+	/* R */
+	VI0_R0_MARK, VI0_R1_MARK,
+	VI0_R2_MARK, VI0_R3_MARK,
+	VI0_R4_MARK, VI0_R5_MARK,
+	VI0_R6_MARK, VI0_R7_MARK,
 };
 static const unsigned int vin0_data18_pins[] = {
 	/* B */
@@ -4356,43 +4352,39 @@ static const unsigned int vin1_clk_pins[] = {
 static const unsigned int vin1_clk_mux[] = {
 	VI1_CLK_MARK,
 };
-static const union vin_data vin1_data_b_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
-		RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
-		RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
-		RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
-		/* G */
-		RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
-		RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
-		RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
-		RCAR_GP_PIN(7, 21), RCAR_GP_PIN(7, 22),
-		/* R */
-		RCAR_GP_PIN(7, 5), RCAR_GP_PIN(7, 6),
-		RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
-		RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
-		RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
-	},
+static const unsigned int vin1_data_b_pins[] = {
+	/* B */
+	RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
+	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
+	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
+	RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
+	/* G */
+	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
+	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
+	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
+	RCAR_GP_PIN(7, 21), RCAR_GP_PIN(7, 22),
+	/* R */
+	RCAR_GP_PIN(7, 5), RCAR_GP_PIN(7, 6),
+	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
+	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
+	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
 };
-static const union vin_data vin1_data_b_mux = {
-	.data24 = {
-		/* B */
-		VI1_DATA0_B_MARK, VI1_DATA1_B_MARK,
-		VI1_DATA2_B_MARK, VI1_DATA3_B_MARK,
-		VI1_DATA4_B_MARK, VI1_DATA5_B_MARK,
-		VI1_DATA6_B_MARK, VI1_DATA7_B_MARK,
-		/* G */
-		VI1_G0_B_MARK, VI1_G1_B_MARK,
-		VI1_G2_B_MARK, VI1_G3_B_MARK,
-		VI1_G4_B_MARK, VI1_G5_B_MARK,
-		VI1_G6_B_MARK, VI1_G7_B_MARK,
-		/* R */
-		VI1_R0_B_MARK, VI1_R1_B_MARK,
-		VI1_R2_B_MARK, VI1_R3_B_MARK,
-		VI1_R4_B_MARK, VI1_R5_B_MARK,
-		VI1_R6_B_MARK, VI1_R7_B_MARK,
-	},
+static const unsigned int vin1_data_b_mux[] = {
+	/* B */
+	VI1_DATA0_B_MARK, VI1_DATA1_B_MARK,
+	VI1_DATA2_B_MARK, VI1_DATA3_B_MARK,
+	VI1_DATA4_B_MARK, VI1_DATA5_B_MARK,
+	VI1_DATA6_B_MARK, VI1_DATA7_B_MARK,
+	/* G */
+	VI1_G0_B_MARK, VI1_G1_B_MARK,
+	VI1_G2_B_MARK, VI1_G3_B_MARK,
+	VI1_G4_B_MARK, VI1_G5_B_MARK,
+	VI1_G6_B_MARK, VI1_G7_B_MARK,
+	/* R */
+	VI1_R0_B_MARK, VI1_R1_B_MARK,
+	VI1_R2_B_MARK, VI1_R3_B_MARK,
+	VI1_R4_B_MARK, VI1_R5_B_MARK,
+	VI1_R6_B_MARK, VI1_R7_B_MARK,
 };
 static const unsigned int vin1_data18_b_pins[] = {
 	/* B */
@@ -4809,13 +4801,13 @@ static const struct {
 		SH_PFC_PIN_GROUP(tpu_to3),
 		SH_PFC_PIN_GROUP(usb0),
 		SH_PFC_PIN_GROUP(usb1),
-		VIN_DATA_PIN_GROUP(vin0_data, 24),
-		VIN_DATA_PIN_GROUP(vin0_data, 20),
+		BUS_DATA_PIN_GROUP(vin0_data, 24),
+		BUS_DATA_PIN_GROUP(vin0_data, 20),
 		SH_PFC_PIN_GROUP(vin0_data18),
-		VIN_DATA_PIN_GROUP(vin0_data, 16),
-		VIN_DATA_PIN_GROUP(vin0_data, 12),
-		VIN_DATA_PIN_GROUP(vin0_data, 10),
-		VIN_DATA_PIN_GROUP(vin0_data, 8),
+		BUS_DATA_PIN_GROUP(vin0_data, 16),
+		BUS_DATA_PIN_GROUP(vin0_data, 12),
+		BUS_DATA_PIN_GROUP(vin0_data, 10),
+		BUS_DATA_PIN_GROUP(vin0_data, 8),
 		SH_PFC_PIN_GROUP(vin0_sync),
 		SH_PFC_PIN_GROUP(vin0_field),
 		SH_PFC_PIN_GROUP(vin0_clkenb),
@@ -4825,13 +4817,13 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin1_field),
 		SH_PFC_PIN_GROUP(vin1_clkenb),
 		SH_PFC_PIN_GROUP(vin1_clk),
-		VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 24, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 20, _b),
 		SH_PFC_PIN_GROUP(vin1_data18_b),
-		VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 12, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 10, _b),
-		VIN_DATA_PIN_GROUP(vin1_data, 8, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 16, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 12, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 10, _b),
+		BUS_DATA_PIN_GROUP(vin1_data, 8, _b),
 		SH_PFC_PIN_GROUP(vin1_sync_b),
 		SH_PFC_PIN_GROUP(vin1_field_b),
 		SH_PFC_PIN_GROUP(vin1_clkenb_b),
diff --git a/drivers/pinctrl/renesas/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
index bba34609b57f680c..15f4f4209f1dc846 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7792.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7792.c
@@ -1243,43 +1243,39 @@ static const unsigned int sdhi0_wp_mux[] = {
 	SD0_WP_MARK,
 };
 /* - VIN0 ------------------------------------------------------------------- */
-static const union vin_data vin0_data_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
-		RCAR_GP_PIN(4, 6), RCAR_GP_PIN(4, 7),
-		RCAR_GP_PIN(4, 8), RCAR_GP_PIN(4, 9),
-		RCAR_GP_PIN(4, 10), RCAR_GP_PIN(4, 11),
-		/* G */
-		RCAR_GP_PIN(4, 12), RCAR_GP_PIN(4, 13),
-		RCAR_GP_PIN(4, 14), RCAR_GP_PIN(4, 15),
-		RCAR_GP_PIN(8, 1), RCAR_GP_PIN(8, 2),
-		RCAR_GP_PIN(8, 3), RCAR_GP_PIN(8, 4),
-		/* R */
-		RCAR_GP_PIN(8, 5), RCAR_GP_PIN(8, 6),
-		RCAR_GP_PIN(8, 7), RCAR_GP_PIN(8, 8),
-		RCAR_GP_PIN(8, 9), RCAR_GP_PIN(8, 10),
-		RCAR_GP_PIN(8, 11), RCAR_GP_PIN(8, 12),
-	},
+static const unsigned int vin0_data_pins[] = {
+	/* B */
+	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
+	RCAR_GP_PIN(4, 6), RCAR_GP_PIN(4, 7),
+	RCAR_GP_PIN(4, 8), RCAR_GP_PIN(4, 9),
+	RCAR_GP_PIN(4, 10), RCAR_GP_PIN(4, 11),
+	/* G */
+	RCAR_GP_PIN(4, 12), RCAR_GP_PIN(4, 13),
+	RCAR_GP_PIN(4, 14), RCAR_GP_PIN(4, 15),
+	RCAR_GP_PIN(8, 1), RCAR_GP_PIN(8, 2),
+	RCAR_GP_PIN(8, 3), RCAR_GP_PIN(8, 4),
+	/* R */
+	RCAR_GP_PIN(8, 5), RCAR_GP_PIN(8, 6),
+	RCAR_GP_PIN(8, 7), RCAR_GP_PIN(8, 8),
+	RCAR_GP_PIN(8, 9), RCAR_GP_PIN(8, 10),
+	RCAR_GP_PIN(8, 11), RCAR_GP_PIN(8, 12),
 };
-static const union vin_data vin0_data_mux = {
-	.data24 = {
-		/* B */
-		VI0_D0_B0_C0_MARK, VI0_D1_B1_C1_MARK,
-		VI0_D2_B2_C2_MARK, VI0_D3_B3_C3_MARK,
-		VI0_D4_B4_C4_MARK, VI0_D5_B5_C5_MARK,
-		VI0_D6_B6_C6_MARK, VI0_D7_B7_C7_MARK,
-		/* G */
-		VI0_D8_G0_Y0_MARK, VI0_D9_G1_Y1_MARK,
-		VI0_D10_G2_Y2_MARK, VI0_D11_G3_Y3_MARK,
-		VI0_D12_G4_Y4_MARK, VI0_D13_G5_Y5_MARK,
-		VI0_D14_G6_Y6_MARK, VI0_D15_G7_Y7_MARK,
-		/* R */
-		VI0_D16_R0_MARK, VI0_D17_R1_MARK,
-		VI0_D18_R2_MARK, VI0_D19_R3_MARK,
-		VI0_D20_R4_MARK, VI0_D21_R5_MARK,
-		VI0_D22_R6_MARK, VI0_D23_R7_MARK,
-	},
+static const unsigned int vin0_data_mux[] = {
+	/* B */
+	VI0_D0_B0_C0_MARK, VI0_D1_B1_C1_MARK,
+	VI0_D2_B2_C2_MARK, VI0_D3_B3_C3_MARK,
+	VI0_D4_B4_C4_MARK, VI0_D5_B5_C5_MARK,
+	VI0_D6_B6_C6_MARK, VI0_D7_B7_C7_MARK,
+	/* G */
+	VI0_D8_G0_Y0_MARK, VI0_D9_G1_Y1_MARK,
+	VI0_D10_G2_Y2_MARK, VI0_D11_G3_Y3_MARK,
+	VI0_D12_G4_Y4_MARK, VI0_D13_G5_Y5_MARK,
+	VI0_D14_G6_Y6_MARK, VI0_D15_G7_Y7_MARK,
+	/* R */
+	VI0_D16_R0_MARK, VI0_D17_R1_MARK,
+	VI0_D18_R2_MARK, VI0_D19_R3_MARK,
+	VI0_D20_R4_MARK, VI0_D21_R5_MARK,
+	VI0_D22_R6_MARK, VI0_D23_R7_MARK,
 };
 static const unsigned int vin0_data18_pins[] = {
 	/* B */
@@ -1335,43 +1331,39 @@ static const unsigned int vin0_clk_mux[] = {
 	VI0_CLK_MARK,
 };
 /* - VIN1 ------------------------------------------------------------------- */
-static const union vin_data vin1_data_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 5),
-		RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 7),
-		RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 9),
-		RCAR_GP_PIN(5, 10), RCAR_GP_PIN(5, 11),
-		/* G */
-		RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
-		RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
-		RCAR_GP_PIN(8, 5), RCAR_GP_PIN(8, 6),
-		RCAR_GP_PIN(8, 7), RCAR_GP_PIN(8, 8),
-		/* R */
-		RCAR_GP_PIN(9, 5), RCAR_GP_PIN(9, 6),
-		RCAR_GP_PIN(9, 7), RCAR_GP_PIN(9, 8),
-		RCAR_GP_PIN(9, 9), RCAR_GP_PIN(9, 10),
-		RCAR_GP_PIN(9, 11), RCAR_GP_PIN(9, 12),
-	},
+static const unsigned int vin1_data_pins[] = {
+	/* B */
+	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 5),
+	RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 7),
+	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 9),
+	RCAR_GP_PIN(5, 10), RCAR_GP_PIN(5, 11),
+	/* G */
+	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
+	RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
+	RCAR_GP_PIN(8, 5), RCAR_GP_PIN(8, 6),
+	RCAR_GP_PIN(8, 7), RCAR_GP_PIN(8, 8),
+	/* R */
+	RCAR_GP_PIN(9, 5), RCAR_GP_PIN(9, 6),
+	RCAR_GP_PIN(9, 7), RCAR_GP_PIN(9, 8),
+	RCAR_GP_PIN(9, 9), RCAR_GP_PIN(9, 10),
+	RCAR_GP_PIN(9, 11), RCAR_GP_PIN(9, 12),
 };
-static const union vin_data vin1_data_mux = {
-	.data24 = {
-		/* B */
-		VI1_D0_B0_C0_MARK, VI1_D1_B1_C1_MARK,
-		VI1_D2_B2_C2_MARK, VI1_D3_B3_C3_MARK,
-		VI1_D4_B4_C4_MARK, VI1_D5_B5_C5_MARK,
-		VI1_D6_B6_C6_MARK, VI1_D7_B7_C7_MARK,
-		/* G */
-		VI1_D8_G0_Y0_MARK, VI1_D9_G1_Y1_MARK,
-		VI1_D10_G2_Y2_MARK, VI1_D11_G3_Y3_MARK,
-		VI1_D12_G4_Y4_MARK, VI1_D13_G5_Y5_MARK,
-		VI1_D14_G6_Y6_MARK, VI1_D15_G7_Y7_MARK,
-		/* R */
-		VI1_D16_R0_MARK, VI1_D17_R1_MARK,
-		VI1_D18_R2_MARK, VI1_D19_R3_MARK,
-		VI1_D20_R4_MARK, VI1_D21_R5_MARK,
-		VI1_D22_R6_MARK, VI1_D23_R7_MARK,
-	},
+static const unsigned int vin1_data_mux[] = {
+	/* B */
+	VI1_D0_B0_C0_MARK, VI1_D1_B1_C1_MARK,
+	VI1_D2_B2_C2_MARK, VI1_D3_B3_C3_MARK,
+	VI1_D4_B4_C4_MARK, VI1_D5_B5_C5_MARK,
+	VI1_D6_B6_C6_MARK, VI1_D7_B7_C7_MARK,
+	/* G */
+	VI1_D8_G0_Y0_MARK, VI1_D9_G1_Y1_MARK,
+	VI1_D10_G2_Y2_MARK, VI1_D11_G3_Y3_MARK,
+	VI1_D12_G4_Y4_MARK, VI1_D13_G5_Y5_MARK,
+	VI1_D14_G6_Y6_MARK, VI1_D15_G7_Y7_MARK,
+	/* R */
+	VI1_D16_R0_MARK, VI1_D17_R1_MARK,
+	VI1_D18_R2_MARK, VI1_D19_R3_MARK,
+	VI1_D20_R4_MARK, VI1_D21_R5_MARK,
+	VI1_D22_R6_MARK, VI1_D23_R7_MARK,
 };
 static const unsigned int vin1_data18_pins[] = {
 	/* B */
@@ -1401,43 +1393,39 @@ static const unsigned int vin1_data18_mux[] = {
 	VI1_D20_R4_MARK, VI1_D21_R5_MARK,
 	VI1_D22_R6_MARK, VI1_D23_R7_MARK,
 };
-static const union vin_data vin1_data_b_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 5),
-		RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 7),
-		RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 9),
-		RCAR_GP_PIN(5, 10), RCAR_GP_PIN(5, 11),
-		/* G */
-		RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
-		RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
-		RCAR_GP_PIN(9, 1), RCAR_GP_PIN(9, 2),
-		RCAR_GP_PIN(9, 3), RCAR_GP_PIN(9, 4),
-		/* R */
-		RCAR_GP_PIN(9, 5), RCAR_GP_PIN(9, 6),
-		RCAR_GP_PIN(9, 7), RCAR_GP_PIN(9, 8),
-		RCAR_GP_PIN(9, 9), RCAR_GP_PIN(9, 10),
-		RCAR_GP_PIN(9, 11), RCAR_GP_PIN(9, 12),
-	},
+static const unsigned int vin1_data_b_pins[] = {
+	/* B */
+	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 5),
+	RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 7),
+	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 9),
+	RCAR_GP_PIN(5, 10), RCAR_GP_PIN(5, 11),
+	/* G */
+	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
+	RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
+	RCAR_GP_PIN(9, 1), RCAR_GP_PIN(9, 2),
+	RCAR_GP_PIN(9, 3), RCAR_GP_PIN(9, 4),
+	/* R */
+	RCAR_GP_PIN(9, 5), RCAR_GP_PIN(9, 6),
+	RCAR_GP_PIN(9, 7), RCAR_GP_PIN(9, 8),
+	RCAR_GP_PIN(9, 9), RCAR_GP_PIN(9, 10),
+	RCAR_GP_PIN(9, 11), RCAR_GP_PIN(9, 12),
 };
-static const union vin_data vin1_data_b_mux = {
-	.data24 = {
-		/* B */
-		VI1_D0_B0_C0_MARK, VI1_D1_B1_C1_MARK,
-		VI1_D2_B2_C2_MARK, VI1_D3_B3_C3_MARK,
-		VI1_D4_B4_C4_MARK, VI1_D5_B5_C5_MARK,
-		VI1_D6_B6_C6_MARK, VI1_D7_B7_C7_MARK,
-		/* G */
-		VI1_D8_G0_Y0_MARK, VI1_D9_G1_Y1_MARK,
-		VI1_D10_G2_Y2_MARK, VI1_D11_G3_Y3_MARK,
-		VI1_D12_G4_Y4_B_MARK, VI1_D13_G5_Y5_B_MARK,
-		VI1_D14_G6_Y6_B_MARK, VI1_D15_G7_Y7_B_MARK,
-		/* R */
-		VI1_D16_R0_MARK, VI1_D17_R1_MARK,
-		VI1_D18_R2_MARK, VI1_D19_R3_MARK,
-		VI1_D20_R4_MARK, VI1_D21_R5_MARK,
-		VI1_D22_R6_MARK, VI1_D23_R7_MARK,
-	},
+static const unsigned int vin1_data_b_mux[] = {
+	/* B */
+	VI1_D0_B0_C0_MARK, VI1_D1_B1_C1_MARK,
+	VI1_D2_B2_C2_MARK, VI1_D3_B3_C3_MARK,
+	VI1_D4_B4_C4_MARK, VI1_D5_B5_C5_MARK,
+	VI1_D6_B6_C6_MARK, VI1_D7_B7_C7_MARK,
+	/* G */
+	VI1_D8_G0_Y0_MARK, VI1_D9_G1_Y1_MARK,
+	VI1_D10_G2_Y2_MARK, VI1_D11_G3_Y3_MARK,
+	VI1_D12_G4_Y4_B_MARK, VI1_D13_G5_Y5_B_MARK,
+	VI1_D14_G6_Y6_B_MARK, VI1_D15_G7_Y7_B_MARK,
+	/* R */
+	VI1_D16_R0_MARK, VI1_D17_R1_MARK,
+	VI1_D18_R2_MARK, VI1_D19_R3_MARK,
+	VI1_D20_R4_MARK, VI1_D21_R5_MARK,
+	VI1_D22_R6_MARK, VI1_D23_R7_MARK,
 };
 static const unsigned int vin1_data18_b_pins[] = {
 	/* B */
@@ -1493,29 +1481,25 @@ static const unsigned int vin1_clk_mux[] = {
 	VI1_CLK_MARK,
 };
 /* - VIN2 ------------------------------------------------------------------- */
-static const union vin_data16 vin2_data_pins = {
-	.data16 = {
-		RCAR_GP_PIN(6, 4), RCAR_GP_PIN(6, 5),
-		RCAR_GP_PIN(6, 6), RCAR_GP_PIN(6, 7),
-		RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
-		RCAR_GP_PIN(6, 10), RCAR_GP_PIN(6, 11),
-		RCAR_GP_PIN(6, 12), RCAR_GP_PIN(6, 13),
-		RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 15),
-		RCAR_GP_PIN(8, 9), RCAR_GP_PIN(8, 10),
-		RCAR_GP_PIN(8, 11), RCAR_GP_PIN(8, 12),
-	},
+static const unsigned int vin2_data_pins[] = {
+	RCAR_GP_PIN(6, 4), RCAR_GP_PIN(6, 5),
+	RCAR_GP_PIN(6, 6), RCAR_GP_PIN(6, 7),
+	RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
+	RCAR_GP_PIN(6, 10), RCAR_GP_PIN(6, 11),
+	RCAR_GP_PIN(6, 12), RCAR_GP_PIN(6, 13),
+	RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 15),
+	RCAR_GP_PIN(8, 9), RCAR_GP_PIN(8, 10),
+	RCAR_GP_PIN(8, 11), RCAR_GP_PIN(8, 12),
 };
-static const union vin_data16 vin2_data_mux = {
-	.data16 = {
-		VI2_D0_C0_MARK, VI2_D1_C1_MARK,
-		VI2_D2_C2_MARK,	VI2_D3_C3_MARK,
-		VI2_D4_C4_MARK, VI2_D5_C5_MARK,
-		VI2_D6_C6_MARK, VI2_D7_C7_MARK,
-		VI2_D8_Y0_MARK,	VI2_D9_Y1_MARK,
-		VI2_D10_Y2_MARK, VI2_D11_Y3_MARK,
-		VI2_D12_Y4_MARK, VI2_D13_Y5_MARK,
-		VI2_D14_Y6_MARK, VI2_D15_Y7_MARK,
-	},
+static const unsigned int vin2_data_mux[] = {
+	VI2_D0_C0_MARK, VI2_D1_C1_MARK,
+	VI2_D2_C2_MARK,	VI2_D3_C3_MARK,
+	VI2_D4_C4_MARK, VI2_D5_C5_MARK,
+	VI2_D6_C6_MARK, VI2_D7_C7_MARK,
+	VI2_D8_Y0_MARK,	VI2_D9_Y1_MARK,
+	VI2_D10_Y2_MARK, VI2_D11_Y3_MARK,
+	VI2_D12_Y4_MARK, VI2_D13_Y5_MARK,
+	VI2_D14_Y6_MARK, VI2_D15_Y7_MARK,
 };
 static const unsigned int vin2_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -1543,29 +1527,25 @@ static const unsigned int vin2_clk_mux[] = {
 	VI2_CLK_MARK,
 };
 /* - VIN3 ------------------------------------------------------------------- */
-static const union vin_data16 vin3_data_pins = {
-	.data16 = {
-		RCAR_GP_PIN(7, 4), RCAR_GP_PIN(7, 5),
-		RCAR_GP_PIN(7, 6), RCAR_GP_PIN(7, 7),
-		RCAR_GP_PIN(7, 8), RCAR_GP_PIN(7, 9),
-		RCAR_GP_PIN(7, 10), RCAR_GP_PIN(7, 11),
-		RCAR_GP_PIN(7, 12), RCAR_GP_PIN(7, 13),
-		RCAR_GP_PIN(7, 14), RCAR_GP_PIN(7, 15),
-		RCAR_GP_PIN(8, 13), RCAR_GP_PIN(8, 14),
-		RCAR_GP_PIN(8, 15), RCAR_GP_PIN(8, 16),
-	},
-};
-static const union vin_data16 vin3_data_mux = {
-	.data16 = {
-		VI3_D0_C0_MARK, VI3_D1_C1_MARK,
-		VI3_D2_C2_MARK,	VI3_D3_C3_MARK,
-		VI3_D4_C4_MARK, VI3_D5_C5_MARK,
-		VI3_D6_C6_MARK, VI3_D7_C7_MARK,
-		VI3_D8_Y0_MARK, VI3_D9_Y1_MARK,
-		VI3_D10_Y2_MARK, VI3_D11_Y3_MARK,
-		VI3_D12_Y4_MARK, VI3_D13_Y5_MARK,
-		VI3_D14_Y6_MARK, VI3_D15_Y7_MARK,
-	},
+static const unsigned int vin3_data_pins[] = {
+	RCAR_GP_PIN(7, 4), RCAR_GP_PIN(7, 5),
+	RCAR_GP_PIN(7, 6), RCAR_GP_PIN(7, 7),
+	RCAR_GP_PIN(7, 8), RCAR_GP_PIN(7, 9),
+	RCAR_GP_PIN(7, 10), RCAR_GP_PIN(7, 11),
+	RCAR_GP_PIN(7, 12), RCAR_GP_PIN(7, 13),
+	RCAR_GP_PIN(7, 14), RCAR_GP_PIN(7, 15),
+	RCAR_GP_PIN(8, 13), RCAR_GP_PIN(8, 14),
+	RCAR_GP_PIN(8, 15), RCAR_GP_PIN(8, 16),
+};
+static const unsigned int vin3_data_mux[] = {
+	VI3_D0_C0_MARK, VI3_D1_C1_MARK,
+	VI3_D2_C2_MARK,	VI3_D3_C3_MARK,
+	VI3_D4_C4_MARK, VI3_D5_C5_MARK,
+	VI3_D6_C6_MARK, VI3_D7_C7_MARK,
+	VI3_D8_Y0_MARK, VI3_D9_Y1_MARK,
+	VI3_D10_Y2_MARK, VI3_D11_Y3_MARK,
+	VI3_D12_Y4_MARK, VI3_D13_Y5_MARK,
+	VI3_D14_Y6_MARK, VI3_D15_Y7_MARK,
 };
 static const unsigned int vin3_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -1593,25 +1573,21 @@ static const unsigned int vin3_clk_mux[] = {
 	VI3_CLK_MARK,
 };
 /* - VIN4 ------------------------------------------------------------------- */
-static const union vin_data12 vin4_data_pins = {
-	.data12 = {
-		RCAR_GP_PIN(8, 4), RCAR_GP_PIN(8, 5),
-		RCAR_GP_PIN(8, 6), RCAR_GP_PIN(8, 7),
-		RCAR_GP_PIN(8, 8), RCAR_GP_PIN(8, 9),
-		RCAR_GP_PIN(8, 10), RCAR_GP_PIN(8, 11),
-		RCAR_GP_PIN(8, 12), RCAR_GP_PIN(8, 13),
-		RCAR_GP_PIN(8, 14), RCAR_GP_PIN(8, 15),
-	},
-};
-static const union vin_data12 vin4_data_mux = {
-	.data12 = {
-		VI4_D0_C0_MARK, VI4_D1_C1_MARK,
-		VI4_D2_C2_MARK, VI4_D3_C3_MARK,
-		VI4_D4_C4_MARK, VI4_D5_C5_MARK,
-		VI4_D6_C6_MARK, VI4_D7_C7_MARK,
-		VI4_D8_Y0_MARK,	VI4_D9_Y1_MARK,
-		VI4_D10_Y2_MARK, VI4_D11_Y3_MARK,
-	},
+static const unsigned int vin4_data_pins[] = {
+	RCAR_GP_PIN(8, 4), RCAR_GP_PIN(8, 5),
+	RCAR_GP_PIN(8, 6), RCAR_GP_PIN(8, 7),
+	RCAR_GP_PIN(8, 8), RCAR_GP_PIN(8, 9),
+	RCAR_GP_PIN(8, 10), RCAR_GP_PIN(8, 11),
+	RCAR_GP_PIN(8, 12), RCAR_GP_PIN(8, 13),
+	RCAR_GP_PIN(8, 14), RCAR_GP_PIN(8, 15),
+};
+static const unsigned int vin4_data_mux[] = {
+	VI4_D0_C0_MARK, VI4_D1_C1_MARK,
+	VI4_D2_C2_MARK, VI4_D3_C3_MARK,
+	VI4_D4_C4_MARK, VI4_D5_C5_MARK,
+	VI4_D6_C6_MARK, VI4_D7_C7_MARK,
+	VI4_D8_Y0_MARK,	VI4_D9_Y1_MARK,
+	VI4_D10_Y2_MARK, VI4_D11_Y3_MARK,
 };
 static const unsigned int vin4_sync_pins[] = {
 	 /* HSYNC#, VSYNC# */
@@ -1639,25 +1615,21 @@ static const unsigned int vin4_clk_mux[] = {
 	VI4_CLK_MARK,
 };
 /* - VIN5 ------------------------------------------------------------------- */
-static const union vin_data12 vin5_data_pins = {
-	.data12 = {
-		RCAR_GP_PIN(9, 4), RCAR_GP_PIN(9, 5),
-		RCAR_GP_PIN(9, 6), RCAR_GP_PIN(9, 7),
-		RCAR_GP_PIN(9, 8), RCAR_GP_PIN(9, 9),
-		RCAR_GP_PIN(9, 10), RCAR_GP_PIN(9, 11),
-		RCAR_GP_PIN(9, 12), RCAR_GP_PIN(9, 13),
-		RCAR_GP_PIN(9, 14), RCAR_GP_PIN(9, 15),
-	},
-};
-static const union vin_data12 vin5_data_mux = {
-	.data12 = {
-		VI5_D0_C0_MARK, VI5_D1_C1_MARK,
-		VI5_D2_C2_MARK, VI5_D3_C3_MARK,
-		VI5_D4_C4_MARK, VI5_D5_C5_MARK,
-		VI5_D6_C6_MARK, VI5_D7_C7_MARK,
-		VI5_D8_Y0_MARK, VI5_D9_Y1_MARK,
-		VI5_D10_Y2_MARK, VI5_D11_Y3_MARK,
-	},
+static const unsigned int vin5_data_pins[] = {
+	RCAR_GP_PIN(9, 4), RCAR_GP_PIN(9, 5),
+	RCAR_GP_PIN(9, 6), RCAR_GP_PIN(9, 7),
+	RCAR_GP_PIN(9, 8), RCAR_GP_PIN(9, 9),
+	RCAR_GP_PIN(9, 10), RCAR_GP_PIN(9, 11),
+	RCAR_GP_PIN(9, 12), RCAR_GP_PIN(9, 13),
+	RCAR_GP_PIN(9, 14), RCAR_GP_PIN(9, 15),
+};
+static const unsigned int vin5_data_mux[] = {
+	VI5_D0_C0_MARK, VI5_D1_C1_MARK,
+	VI5_D2_C2_MARK, VI5_D3_C3_MARK,
+	VI5_D4_C4_MARK, VI5_D5_C5_MARK,
+	VI5_D6_C6_MARK, VI5_D7_C7_MARK,
+	VI5_D8_Y0_MARK, VI5_D9_Y1_MARK,
+	VI5_D10_Y2_MARK, VI5_D11_Y3_MARK,
 };
 static const unsigned int vin5_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -1745,58 +1717,58 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(sdhi0_ctrl),
 	SH_PFC_PIN_GROUP(sdhi0_cd),
 	SH_PFC_PIN_GROUP(sdhi0_wp),
-	VIN_DATA_PIN_GROUP(vin0_data, 24),
-	VIN_DATA_PIN_GROUP(vin0_data, 20),
+	BUS_DATA_PIN_GROUP(vin0_data, 24),
+	BUS_DATA_PIN_GROUP(vin0_data, 20),
 	SH_PFC_PIN_GROUP(vin0_data18),
-	VIN_DATA_PIN_GROUP(vin0_data, 16),
-	VIN_DATA_PIN_GROUP(vin0_data, 12),
-	VIN_DATA_PIN_GROUP(vin0_data, 10),
-	VIN_DATA_PIN_GROUP(vin0_data, 8),
+	BUS_DATA_PIN_GROUP(vin0_data, 16),
+	BUS_DATA_PIN_GROUP(vin0_data, 12),
+	BUS_DATA_PIN_GROUP(vin0_data, 10),
+	BUS_DATA_PIN_GROUP(vin0_data, 8),
 	SH_PFC_PIN_GROUP(vin0_sync),
 	SH_PFC_PIN_GROUP(vin0_field),
 	SH_PFC_PIN_GROUP(vin0_clkenb),
 	SH_PFC_PIN_GROUP(vin0_clk),
-	VIN_DATA_PIN_GROUP(vin1_data, 24),
-	VIN_DATA_PIN_GROUP(vin1_data, 20),
+	BUS_DATA_PIN_GROUP(vin1_data, 24),
+	BUS_DATA_PIN_GROUP(vin1_data, 20),
 	SH_PFC_PIN_GROUP(vin1_data18),
-	VIN_DATA_PIN_GROUP(vin1_data, 16),
-	VIN_DATA_PIN_GROUP(vin1_data, 12),
-	VIN_DATA_PIN_GROUP(vin1_data, 10),
-	VIN_DATA_PIN_GROUP(vin1_data, 8),
-	VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
-	VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
+	BUS_DATA_PIN_GROUP(vin1_data, 16),
+	BUS_DATA_PIN_GROUP(vin1_data, 12),
+	BUS_DATA_PIN_GROUP(vin1_data, 10),
+	BUS_DATA_PIN_GROUP(vin1_data, 8),
+	BUS_DATA_PIN_GROUP(vin1_data, 24, _b),
+	BUS_DATA_PIN_GROUP(vin1_data, 20, _b),
 	SH_PFC_PIN_GROUP(vin1_data18_b),
-	VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
+	BUS_DATA_PIN_GROUP(vin1_data, 16, _b),
 	SH_PFC_PIN_GROUP(vin1_sync),
 	SH_PFC_PIN_GROUP(vin1_field),
 	SH_PFC_PIN_GROUP(vin1_clkenb),
 	SH_PFC_PIN_GROUP(vin1_clk),
-	VIN_DATA_PIN_GROUP(vin2_data, 16),
-	VIN_DATA_PIN_GROUP(vin2_data, 12),
-	VIN_DATA_PIN_GROUP(vin2_data, 10),
-	VIN_DATA_PIN_GROUP(vin2_data, 8),
+	BUS_DATA_PIN_GROUP(vin2_data, 16),
+	BUS_DATA_PIN_GROUP(vin2_data, 12),
+	BUS_DATA_PIN_GROUP(vin2_data, 10),
+	BUS_DATA_PIN_GROUP(vin2_data, 8),
 	SH_PFC_PIN_GROUP(vin2_sync),
 	SH_PFC_PIN_GROUP(vin2_field),
 	SH_PFC_PIN_GROUP(vin2_clkenb),
 	SH_PFC_PIN_GROUP(vin2_clk),
-	VIN_DATA_PIN_GROUP(vin3_data, 16),
-	VIN_DATA_PIN_GROUP(vin3_data, 12),
-	VIN_DATA_PIN_GROUP(vin3_data, 10),
-	VIN_DATA_PIN_GROUP(vin3_data, 8),
+	BUS_DATA_PIN_GROUP(vin3_data, 16),
+	BUS_DATA_PIN_GROUP(vin3_data, 12),
+	BUS_DATA_PIN_GROUP(vin3_data, 10),
+	BUS_DATA_PIN_GROUP(vin3_data, 8),
 	SH_PFC_PIN_GROUP(vin3_sync),
 	SH_PFC_PIN_GROUP(vin3_field),
 	SH_PFC_PIN_GROUP(vin3_clkenb),
 	SH_PFC_PIN_GROUP(vin3_clk),
-	VIN_DATA_PIN_GROUP(vin4_data, 12),
-	VIN_DATA_PIN_GROUP(vin4_data, 10),
-	VIN_DATA_PIN_GROUP(vin4_data, 8),
+	BUS_DATA_PIN_GROUP(vin4_data, 12),
+	BUS_DATA_PIN_GROUP(vin4_data, 10),
+	BUS_DATA_PIN_GROUP(vin4_data, 8),
 	SH_PFC_PIN_GROUP(vin4_sync),
 	SH_PFC_PIN_GROUP(vin4_field),
 	SH_PFC_PIN_GROUP(vin4_clkenb),
 	SH_PFC_PIN_GROUP(vin4_clk),
-	VIN_DATA_PIN_GROUP(vin5_data, 12),
-	VIN_DATA_PIN_GROUP(vin5_data, 10),
-	VIN_DATA_PIN_GROUP(vin5_data, 8),
+	BUS_DATA_PIN_GROUP(vin5_data, 12),
+	BUS_DATA_PIN_GROUP(vin5_data, 10),
+	BUS_DATA_PIN_GROUP(vin5_data, 8),
 	SH_PFC_PIN_GROUP(vin5_sync),
 	SH_PFC_PIN_GROUP(vin5_field),
 	SH_PFC_PIN_GROUP(vin5_clkenb),
diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index d3c23e7f3132a27d..b70f45a2e3e455f1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -3673,43 +3673,39 @@ static const unsigned int usb1_mux[] = {
 	USB1_OVC_MARK,
 };
 /* - VIN0 ------------------------------------------------------------------- */
-static const union vin_data vin0_data_pins = {
-	.data24 = {
-		/* B */
-		RCAR_GP_PIN(3, 1), RCAR_GP_PIN(3, 2),
-		RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4),
-		RCAR_GP_PIN(3, 5), RCAR_GP_PIN(3, 6),
-		RCAR_GP_PIN(3, 7), RCAR_GP_PIN(3, 8),
-		/* G */
-		RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 14),
-		RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
-		RCAR_GP_PIN(3, 17), RCAR_GP_PIN(3, 18),
-		RCAR_GP_PIN(3, 19), RCAR_GP_PIN(3, 20),
-		/* R */
-		RCAR_GP_PIN(3, 21), RCAR_GP_PIN(3, 22),
-		RCAR_GP_PIN(3, 23), RCAR_GP_PIN(3, 24),
-		RCAR_GP_PIN(3, 25), RCAR_GP_PIN(3, 26),
-		RCAR_GP_PIN(3, 27), RCAR_GP_PIN(3, 28),
-	},
+static const unsigned int vin0_data_pins[] = {
+	/* B */
+	RCAR_GP_PIN(3, 1), RCAR_GP_PIN(3, 2),
+	RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4),
+	RCAR_GP_PIN(3, 5), RCAR_GP_PIN(3, 6),
+	RCAR_GP_PIN(3, 7), RCAR_GP_PIN(3, 8),
+	/* G */
+	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 14),
+	RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
+	RCAR_GP_PIN(3, 17), RCAR_GP_PIN(3, 18),
+	RCAR_GP_PIN(3, 19), RCAR_GP_PIN(3, 20),
+	/* R */
+	RCAR_GP_PIN(3, 21), RCAR_GP_PIN(3, 22),
+	RCAR_GP_PIN(3, 23), RCAR_GP_PIN(3, 24),
+	RCAR_GP_PIN(3, 25), RCAR_GP_PIN(3, 26),
+	RCAR_GP_PIN(3, 27), RCAR_GP_PIN(3, 28),
 };
-static const union vin_data vin0_data_mux = {
-	.data24 = {
-		/* B */
-		VI0_DATA0_VI0_B0_MARK, VI0_DATA1_VI0_B1_MARK,
-		VI0_DATA2_VI0_B2_MARK, VI0_DATA3_VI0_B3_MARK,
-		VI0_DATA4_VI0_B4_MARK, VI0_DATA5_VI0_B5_MARK,
-		VI0_DATA6_VI0_B6_MARK, VI0_DATA7_VI0_B7_MARK,
-		/* G */
-		VI0_G0_MARK, VI0_G1_MARK,
-		VI0_G2_MARK, VI0_G3_MARK,
-		VI0_G4_MARK, VI0_G5_MARK,
-		VI0_G6_MARK, VI0_G7_MARK,
-		/* R */
-		VI0_R0_MARK, VI0_R1_MARK,
-		VI0_R2_MARK, VI0_R3_MARK,
-		VI0_R4_MARK, VI0_R5_MARK,
-		VI0_R6_MARK, VI0_R7_MARK,
-	},
+static const unsigned int vin0_data_mux[] = {
+	/* B */
+	VI0_DATA0_VI0_B0_MARK, VI0_DATA1_VI0_B1_MARK,
+	VI0_DATA2_VI0_B2_MARK, VI0_DATA3_VI0_B3_MARK,
+	VI0_DATA4_VI0_B4_MARK, VI0_DATA5_VI0_B5_MARK,
+	VI0_DATA6_VI0_B6_MARK, VI0_DATA7_VI0_B7_MARK,
+	/* G */
+	VI0_G0_MARK, VI0_G1_MARK,
+	VI0_G2_MARK, VI0_G3_MARK,
+	VI0_G4_MARK, VI0_G5_MARK,
+	VI0_G6_MARK, VI0_G7_MARK,
+	/* R */
+	VI0_R0_MARK, VI0_R1_MARK,
+	VI0_R2_MARK, VI0_R3_MARK,
+	VI0_R4_MARK, VI0_R5_MARK,
+	VI0_R6_MARK, VI0_R7_MARK,
 };
 static const unsigned int vin0_data18_pins[] = {
 	/* B */
@@ -3766,25 +3762,21 @@ static const unsigned int vin0_clk_mux[] = {
 	VI0_CLK_MARK,
 };
 /* - VIN1 ------------------------------------------------------------------- */
-static const union vin_data12 vin1_data_pins = {
-	.data12 = {
-		RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
-		RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
-		RCAR_GP_PIN(5, 16), RCAR_GP_PIN(5, 17),
-		RCAR_GP_PIN(5, 18), RCAR_GP_PIN(5, 19),
-		RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 11),
-		RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-	},
+static const unsigned int vin1_data_pins[] = {
+	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
+	RCAR_GP_PIN(5, 14), RCAR_GP_PIN(5, 15),
+	RCAR_GP_PIN(5, 16), RCAR_GP_PIN(5, 17),
+	RCAR_GP_PIN(5, 18), RCAR_GP_PIN(5, 19),
+	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 11),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
 };
-static const union vin_data12 vin1_data_mux = {
-	.data12 = {
-		VI1_DATA0_MARK, VI1_DATA1_MARK,
-		VI1_DATA2_MARK, VI1_DATA3_MARK,
-		VI1_DATA4_MARK, VI1_DATA5_MARK,
-		VI1_DATA6_MARK, VI1_DATA7_MARK,
-		VI1_DATA8_MARK, VI1_DATA9_MARK,
-		VI1_DATA10_MARK, VI1_DATA11_MARK,
-	},
+static const unsigned int vin1_data_mux[] = {
+	VI1_DATA0_MARK, VI1_DATA1_MARK,
+	VI1_DATA2_MARK, VI1_DATA3_MARK,
+	VI1_DATA4_MARK, VI1_DATA5_MARK,
+	VI1_DATA6_MARK, VI1_DATA7_MARK,
+	VI1_DATA8_MARK, VI1_DATA9_MARK,
+	VI1_DATA10_MARK, VI1_DATA11_MARK,
 };
 static const unsigned int vin1_sync_pins[] = {
 	RCAR_GP_PIN(5, 22), /* HSYNC */
@@ -4105,20 +4097,20 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(tpu_to3_c),
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
-	VIN_DATA_PIN_GROUP(vin0_data, 24),
-	VIN_DATA_PIN_GROUP(vin0_data, 20),
+	BUS_DATA_PIN_GROUP(vin0_data, 24),
+	BUS_DATA_PIN_GROUP(vin0_data, 20),
 	SH_PFC_PIN_GROUP(vin0_data18),
-	VIN_DATA_PIN_GROUP(vin0_data, 16),
-	VIN_DATA_PIN_GROUP(vin0_data, 12),
-	VIN_DATA_PIN_GROUP(vin0_data, 10),
-	VIN_DATA_PIN_GROUP(vin0_data, 8),
+	BUS_DATA_PIN_GROUP(vin0_data, 16),
+	BUS_DATA_PIN_GROUP(vin0_data, 12),
+	BUS_DATA_PIN_GROUP(vin0_data, 10),
+	BUS_DATA_PIN_GROUP(vin0_data, 8),
 	SH_PFC_PIN_GROUP(vin0_sync),
 	SH_PFC_PIN_GROUP(vin0_field),
 	SH_PFC_PIN_GROUP(vin0_clkenb),
 	SH_PFC_PIN_GROUP(vin0_clk),
-	VIN_DATA_PIN_GROUP(vin1_data, 12),
-	VIN_DATA_PIN_GROUP(vin1_data, 10),
-	VIN_DATA_PIN_GROUP(vin1_data, 8),
+	BUS_DATA_PIN_GROUP(vin1_data, 12),
+	BUS_DATA_PIN_GROUP(vin1_data, 10),
+	BUS_DATA_PIN_GROUP(vin1_data, 8),
 	SH_PFC_PIN_GROUP(vin1_sync),
 	SH_PFC_PIN_GROUP(vin1_field),
 	SH_PFC_PIN_GROUP(vin1_clkenb),
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index 9408ac0108a97588..a06368f6c3caaf0e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -4071,69 +4071,61 @@ static const unsigned int vin4_data18_b_mux[] = {
 	VI4_DATA20_MARK, VI4_DATA21_MARK,
 	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
-static const union vin_data vin4_data_a_pins = {
-	.data24 = {
-		RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-		RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-		RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-		RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-		RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-		RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-	},
+static const unsigned int vin4_data_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
 };
-static const union vin_data vin4_data_a_mux = {
-	.data24 = {
-		VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-		VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-		VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-		VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-		VI4_DATA8_MARK,  VI4_DATA9_MARK,
-		VI4_DATA10_MARK, VI4_DATA11_MARK,
-		VI4_DATA12_MARK, VI4_DATA13_MARK,
-		VI4_DATA14_MARK, VI4_DATA15_MARK,
-		VI4_DATA16_MARK, VI4_DATA17_MARK,
-		VI4_DATA18_MARK, VI4_DATA19_MARK,
-		VI4_DATA20_MARK, VI4_DATA21_MARK,
-		VI4_DATA22_MARK, VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
-static const union vin_data vin4_data_b_pins = {
-	.data24 = {
-		RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-		RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-		RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-		RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-		RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-		RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-	},
+static const unsigned int vin4_data_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
 };
-static const union vin_data vin4_data_b_mux = {
-	.data24 = {
-		VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-		VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-		VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-		VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-		VI4_DATA8_MARK,  VI4_DATA9_MARK,
-		VI4_DATA10_MARK, VI4_DATA11_MARK,
-		VI4_DATA12_MARK, VI4_DATA13_MARK,
-		VI4_DATA14_MARK, VI4_DATA15_MARK,
-		VI4_DATA16_MARK, VI4_DATA17_MARK,
-		VI4_DATA18_MARK, VI4_DATA19_MARK,
-		VI4_DATA20_MARK, VI4_DATA21_MARK,
-		VI4_DATA22_MARK, VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 static const unsigned int vin4_g8_pins[] = {
 	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
@@ -4177,29 +4169,25 @@ static const unsigned int vin4_clk_mux[] = {
 };
 
 /* - VIN5 ------------------------------------------------------------------- */
-static const union vin_data16 vin5_data_pins = {
-	.data16 = {
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-		RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-		RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-	},
+static const unsigned int vin5_data_pins[] = {
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
 };
-static const union vin_data16 vin5_data_mux = {
-	.data16 = {
-		VI5_DATA0_MARK, VI5_DATA1_MARK,
-		VI5_DATA2_MARK, VI5_DATA3_MARK,
-		VI5_DATA4_MARK, VI5_DATA5_MARK,
-		VI5_DATA6_MARK, VI5_DATA7_MARK,
-		VI5_DATA8_MARK,  VI5_DATA9_MARK,
-		VI5_DATA10_MARK, VI5_DATA11_MARK,
-		VI5_DATA12_MARK, VI5_DATA13_MARK,
-		VI5_DATA14_MARK, VI5_DATA15_MARK,
-	},
+static const unsigned int vin5_data_mux[] = {
+	VI5_DATA0_MARK, VI5_DATA1_MARK,
+	VI5_DATA2_MARK, VI5_DATA3_MARK,
+	VI5_DATA4_MARK, VI5_DATA5_MARK,
+	VI5_DATA6_MARK, VI5_DATA7_MARK,
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
 };
 static const unsigned int vin5_high8_pins[] = {
 	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
@@ -4549,29 +4537,29 @@ static const struct {
 		SH_PFC_PIN_GROUP(usb2),
 		SH_PFC_PIN_GROUP(usb2_ch3),
 		SH_PFC_PIN_GROUP(usb30),
-		VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 10, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 12, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 8, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 10, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 12, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 16, _a),
 		SH_PFC_PIN_GROUP(vin4_data18_a),
-		VIN_DATA_PIN_GROUP(vin4_data, 20, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 10, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 12, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 20, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 24, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 8, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 10, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 12, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 16, _b),
 		SH_PFC_PIN_GROUP(vin4_data18_b),
-		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 20, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 24, _b),
 		SH_PFC_PIN_GROUP(vin4_g8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
 		SH_PFC_PIN_GROUP(vin4_clk),
-		VIN_DATA_PIN_GROUP(vin5_data, 8),
-		VIN_DATA_PIN_GROUP(vin5_data, 10),
-		VIN_DATA_PIN_GROUP(vin5_data, 12),
-		VIN_DATA_PIN_GROUP(vin5_data, 16),
+		BUS_DATA_PIN_GROUP(vin5_data, 8),
+		BUS_DATA_PIN_GROUP(vin5_data, 10),
+		BUS_DATA_PIN_GROUP(vin5_data, 12),
+		BUS_DATA_PIN_GROUP(vin5_data, 16),
 		SH_PFC_PIN_GROUP(vin5_high8),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 929a67e84f88b3b2..8cfe3c1487c83c78 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -4046,69 +4046,61 @@ static const unsigned int vin4_data18_b_mux[] = {
 	VI4_DATA20_MARK, VI4_DATA21_MARK,
 	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
-static const union vin_data vin4_data_a_pins = {
-	.data24 = {
-		RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
-		RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-		RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-		RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-		RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-		RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-	},
+static const unsigned int vin4_data_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
 };
-static const union vin_data vin4_data_a_mux = {
-	.data24 = {
-		VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-		VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-		VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-		VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-		VI4_DATA8_MARK,  VI4_DATA9_MARK,
-		VI4_DATA10_MARK, VI4_DATA11_MARK,
-		VI4_DATA12_MARK, VI4_DATA13_MARK,
-		VI4_DATA14_MARK, VI4_DATA15_MARK,
-		VI4_DATA16_MARK, VI4_DATA17_MARK,
-		VI4_DATA18_MARK, VI4_DATA19_MARK,
-		VI4_DATA20_MARK, VI4_DATA21_MARK,
-		VI4_DATA22_MARK, VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
-static const union vin_data vin4_data_b_pins = {
-	.data24 = {
-		RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-		RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-		RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-		RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-		RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-		RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-	},
+static const unsigned int vin4_data_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
 };
-static const union vin_data vin4_data_b_mux = {
-	.data24 = {
-		VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-		VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-		VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-		VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-		VI4_DATA8_MARK,  VI4_DATA9_MARK,
-		VI4_DATA10_MARK, VI4_DATA11_MARK,
-		VI4_DATA12_MARK, VI4_DATA13_MARK,
-		VI4_DATA14_MARK, VI4_DATA15_MARK,
-		VI4_DATA16_MARK, VI4_DATA17_MARK,
-		VI4_DATA18_MARK, VI4_DATA19_MARK,
-		VI4_DATA20_MARK, VI4_DATA21_MARK,
-		VI4_DATA22_MARK, VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 static const unsigned int vin4_g8_pins[] = {
 	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
@@ -4152,29 +4144,25 @@ static const unsigned int vin4_clk_mux[] = {
 };
 
 /* - VIN5 ------------------------------------------------------------------- */
-static const union vin_data16 vin5_data_pins = {
-	.data16 = {
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-		RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-		RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-	},
+static const unsigned int vin5_data_pins[] = {
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
 };
-static const union vin_data16 vin5_data_mux = {
-	.data16 = {
-		VI5_DATA0_MARK, VI5_DATA1_MARK,
-		VI5_DATA2_MARK, VI5_DATA3_MARK,
-		VI5_DATA4_MARK, VI5_DATA5_MARK,
-		VI5_DATA6_MARK, VI5_DATA7_MARK,
-		VI5_DATA8_MARK,  VI5_DATA9_MARK,
-		VI5_DATA10_MARK, VI5_DATA11_MARK,
-		VI5_DATA12_MARK, VI5_DATA13_MARK,
-		VI5_DATA14_MARK, VI5_DATA15_MARK,
-	},
+static const unsigned int vin5_data_mux[] = {
+	VI5_DATA0_MARK, VI5_DATA1_MARK,
+	VI5_DATA2_MARK, VI5_DATA3_MARK,
+	VI5_DATA4_MARK, VI5_DATA5_MARK,
+	VI5_DATA6_MARK, VI5_DATA7_MARK,
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
 };
 static const unsigned int vin5_high8_pins[] = {
 	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
@@ -4520,29 +4508,29 @@ static const struct {
 		SH_PFC_PIN_GROUP(usb0),
 		SH_PFC_PIN_GROUP(usb1),
 		SH_PFC_PIN_GROUP(usb30),
-		VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 10, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 12, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 8, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 10, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 12, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 16, _a),
 		SH_PFC_PIN_GROUP(vin4_data18_a),
-		VIN_DATA_PIN_GROUP(vin4_data, 20, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 10, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 12, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 20, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 24, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 8, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 10, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 12, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 16, _b),
 		SH_PFC_PIN_GROUP(vin4_data18_b),
-		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 20, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 24, _b),
 		SH_PFC_PIN_GROUP(vin4_g8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
 		SH_PFC_PIN_GROUP(vin4_clk),
-		VIN_DATA_PIN_GROUP(vin5_data, 8),
-		VIN_DATA_PIN_GROUP(vin5_data, 10),
-		VIN_DATA_PIN_GROUP(vin5_data, 12),
-		VIN_DATA_PIN_GROUP(vin5_data, 16),
+		BUS_DATA_PIN_GROUP(vin5_data, 8),
+		BUS_DATA_PIN_GROUP(vin5_data, 10),
+		BUS_DATA_PIN_GROUP(vin5_data, 12),
+		BUS_DATA_PIN_GROUP(vin5_data, 16),
 		SH_PFC_PIN_GROUP(vin5_high8),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index fbce972366a36af3..b70bf9217cec9cd0 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -4254,38 +4254,34 @@ static const unsigned int vin4_data18_a_mux[] = {
 	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 
-static const union vin_data vin4_data_a_pins = {
-	.data24 = {
-		RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 9),
-		RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
-		RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-		RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
-		RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
-		RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
-		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
-		RCAR_GP_PIN(0, 0),  RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4),  RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6),  RCAR_GP_PIN(0, 7),
-	},
+static const unsigned int vin4_data_a_pins[] = {
+	RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0),  RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4),  RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6),  RCAR_GP_PIN(0, 7),
 };
 
-static const union vin_data vin4_data_a_mux = {
-	.data24 = {
-		VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-		VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-		VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-		VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-		VI4_DATA8_MARK,   VI4_DATA9_MARK,
-		VI4_DATA10_MARK,  VI4_DATA11_MARK,
-		VI4_DATA12_MARK,  VI4_DATA13_MARK,
-		VI4_DATA14_MARK,  VI4_DATA15_MARK,
-		VI4_DATA16_MARK,  VI4_DATA17_MARK,
-		VI4_DATA18_MARK,  VI4_DATA19_MARK,
-		VI4_DATA20_MARK,  VI4_DATA21_MARK,
-		VI4_DATA22_MARK,  VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+	VI4_DATA16_MARK,  VI4_DATA17_MARK,
+	VI4_DATA18_MARK,  VI4_DATA19_MARK,
+	VI4_DATA20_MARK,  VI4_DATA21_MARK,
+	VI4_DATA22_MARK,  VI4_DATA23_MARK,
 };
 
 static const unsigned int vin4_data18_b_pins[] = {
@@ -4312,38 +4308,34 @@ static const unsigned int vin4_data18_b_mux[] = {
 	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 
-static const union vin_data vin4_data_b_pins = {
-	.data24 = {
-		RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
-		RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
-		RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-		RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-		RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
-		RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
-		RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-	},
+static const unsigned int vin4_data_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
 };
 
-static const union vin_data vin4_data_b_mux = {
-	.data24 = {
-		VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-		VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-		VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-		VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-		VI4_DATA8_MARK,   VI4_DATA9_MARK,
-		VI4_DATA10_MARK,  VI4_DATA11_MARK,
-		VI4_DATA12_MARK,  VI4_DATA13_MARK,
-		VI4_DATA14_MARK,  VI4_DATA15_MARK,
-		VI4_DATA16_MARK,  VI4_DATA17_MARK,
-		VI4_DATA18_MARK,  VI4_DATA19_MARK,
-		VI4_DATA20_MARK,  VI4_DATA21_MARK,
-		VI4_DATA22_MARK,  VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+	VI4_DATA16_MARK,  VI4_DATA17_MARK,
+	VI4_DATA18_MARK,  VI4_DATA19_MARK,
+	VI4_DATA20_MARK,  VI4_DATA21_MARK,
+	VI4_DATA22_MARK,  VI4_DATA23_MARK,
 };
 
 static const unsigned int vin4_g8_pins[] = {
@@ -4394,30 +4386,26 @@ static const unsigned int vin4_clk_mux[] = {
 };
 
 /* - VIN5 ------------------------------------------------------------------- */
-static const union vin_data16 vin5_data_pins = {
-	.data16 = {
-		RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
-		RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
-		RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
-		RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
-		RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-		RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
-	},
+static const unsigned int vin5_data_pins[] = {
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
 };
 
-static const union vin_data16 vin5_data_mux = {
-	.data16 = {
-		VI5_DATA0_MARK, VI5_DATA1_MARK,
-		VI5_DATA2_MARK, VI5_DATA3_MARK,
-		VI5_DATA4_MARK, VI5_DATA5_MARK,
-		VI5_DATA6_MARK, VI5_DATA7_MARK,
-		VI5_DATA8_MARK,  VI5_DATA9_MARK,
-		VI5_DATA10_MARK, VI5_DATA11_MARK,
-		VI5_DATA12_MARK, VI5_DATA13_MARK,
-		VI5_DATA14_MARK, VI5_DATA15_MARK,
-	},
+static const unsigned int vin5_data_mux[] = {
+	VI5_DATA0_MARK, VI5_DATA1_MARK,
+	VI5_DATA2_MARK, VI5_DATA3_MARK,
+	VI5_DATA4_MARK, VI5_DATA5_MARK,
+	VI5_DATA6_MARK, VI5_DATA7_MARK,
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
 };
 
 static const unsigned int vin5_high8_pins[] = {
@@ -4772,29 +4760,29 @@ static const struct {
 		SH_PFC_PIN_GROUP(usb0),
 		SH_PFC_PIN_GROUP(usb1),
 		SH_PFC_PIN_GROUP(usb30),
-		VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 10, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 12, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 8, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 10, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 12, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 16, _a),
 		SH_PFC_PIN_GROUP(vin4_data18_a),
-		VIN_DATA_PIN_GROUP(vin4_data, 20, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 10, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 12, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 20, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 24, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 8, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 10, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 12, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 16, _b),
 		SH_PFC_PIN_GROUP(vin4_data18_b),
-		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 20, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 24, _b),
 		SH_PFC_PIN_GROUP(vin4_g8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
 		SH_PFC_PIN_GROUP(vin4_clk),
-		VIN_DATA_PIN_GROUP(vin5_data, 8),
-		VIN_DATA_PIN_GROUP(vin5_data, 10),
-		VIN_DATA_PIN_GROUP(vin5_data, 12),
-		VIN_DATA_PIN_GROUP(vin5_data, 16),
+		BUS_DATA_PIN_GROUP(vin5_data, 8),
+		BUS_DATA_PIN_GROUP(vin5_data, 10),
+		BUS_DATA_PIN_GROUP(vin5_data, 12),
+		BUS_DATA_PIN_GROUP(vin5_data, 16),
 		SH_PFC_PIN_GROUP(vin5_high8),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index bf24c39b3597d530..35370d2d2c7269fb 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -1639,25 +1639,21 @@ static const unsigned int tmu_tclk2_b_mux[] = {
 };
 
 /* - VIN0 ------------------------------------------------------------------- */
-static const union vin_data12 vin0_data_pins = {
-	.data12 = {
-		RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-		RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-		RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
-		RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
-		RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
-		RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
-	},
-};
-static const union vin_data12 vin0_data_mux = {
-	.data12 = {
-		VI0_DATA0_MARK, VI0_DATA1_MARK,
-		VI0_DATA2_MARK, VI0_DATA3_MARK,
-		VI0_DATA4_MARK, VI0_DATA5_MARK,
-		VI0_DATA6_MARK, VI0_DATA7_MARK,
-		VI0_DATA8_MARK,  VI0_DATA9_MARK,
-		VI0_DATA10_MARK, VI0_DATA11_MARK,
-	},
+static const unsigned int vin0_data_pins[] = {
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
+};
+static const unsigned int vin0_data_mux[] = {
+	VI0_DATA0_MARK, VI0_DATA1_MARK,
+	VI0_DATA2_MARK, VI0_DATA3_MARK,
+	VI0_DATA4_MARK, VI0_DATA5_MARK,
+	VI0_DATA6_MARK, VI0_DATA7_MARK,
+	VI0_DATA8_MARK,  VI0_DATA9_MARK,
+	VI0_DATA10_MARK, VI0_DATA11_MARK,
 };
 static const unsigned int vin0_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -1689,25 +1685,21 @@ static const unsigned int vin0_clk_mux[] = {
 };
 
 /* - VIN1 ------------------------------------------------------------------- */
-static const union vin_data12 vin1_data_pins = {
-	.data12 = {
-		RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
-		RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
-		RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
-		RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
-		RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
-		RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15),
-	},
+static const unsigned int vin1_data_pins[] = {
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
+	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
+	RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
+	RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15),
 };
-static const union vin_data12 vin1_data_mux = {
-	.data12 = {
-		VI1_DATA0_MARK, VI1_DATA1_MARK,
-		VI1_DATA2_MARK, VI1_DATA3_MARK,
-		VI1_DATA4_MARK, VI1_DATA5_MARK,
-		VI1_DATA6_MARK, VI1_DATA7_MARK,
-		VI1_DATA8_MARK,  VI1_DATA9_MARK,
-		VI1_DATA10_MARK, VI1_DATA11_MARK,
-	},
+static const unsigned int vin1_data_mux[] = {
+	VI1_DATA0_MARK, VI1_DATA1_MARK,
+	VI1_DATA2_MARK, VI1_DATA3_MARK,
+	VI1_DATA4_MARK, VI1_DATA5_MARK,
+	VI1_DATA6_MARK, VI1_DATA7_MARK,
+	VI1_DATA8_MARK,  VI1_DATA9_MARK,
+	VI1_DATA10_MARK, VI1_DATA11_MARK,
 };
 static const unsigned int vin1_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -1853,16 +1845,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(tmu_tclk1_b),
 	SH_PFC_PIN_GROUP(tmu_tclk2_a),
 	SH_PFC_PIN_GROUP(tmu_tclk2_b),
-	VIN_DATA_PIN_GROUP(vin0_data, 8),
-	VIN_DATA_PIN_GROUP(vin0_data, 10),
-	VIN_DATA_PIN_GROUP(vin0_data, 12),
+	BUS_DATA_PIN_GROUP(vin0_data, 8),
+	BUS_DATA_PIN_GROUP(vin0_data, 10),
+	BUS_DATA_PIN_GROUP(vin0_data, 12),
 	SH_PFC_PIN_GROUP(vin0_sync),
 	SH_PFC_PIN_GROUP(vin0_field),
 	SH_PFC_PIN_GROUP(vin0_clkenb),
 	SH_PFC_PIN_GROUP(vin0_clk),
-	VIN_DATA_PIN_GROUP(vin1_data, 8),
-	VIN_DATA_PIN_GROUP(vin1_data, 10),
-	VIN_DATA_PIN_GROUP(vin1_data, 12),
+	BUS_DATA_PIN_GROUP(vin1_data, 8),
+	BUS_DATA_PIN_GROUP(vin1_data, 10),
+	BUS_DATA_PIN_GROUP(vin1_data, 12),
 	SH_PFC_PIN_GROUP(vin1_sync),
 	SH_PFC_PIN_GROUP(vin1_field),
 	SH_PFC_PIN_GROUP(vin1_clkenb),
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index f80b327530b580d9..36c072c7f9f5aff7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -1963,37 +1963,33 @@ static const unsigned int tpu_to3_mux[] = {
 };
 
 /* - VIN0 ------------------------------------------------------------------- */
-static const union vin_data vin0_data_pins = {
-	.data24 = {
-		RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
-		RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
-		RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
-		RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
-		RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
-		RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
-		RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
-		RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
-		RCAR_GP_PIN(2, 21), RCAR_GP_PIN(2, 22),
-		RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 24),
-		RCAR_GP_PIN(2, 25), RCAR_GP_PIN(2, 26),
-		RCAR_GP_PIN(2, 27), RCAR_GP_PIN(2, 28),
-	},
+static const unsigned int vin0_data_pins[] = {
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15),
+	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
+	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
+	RCAR_GP_PIN(2, 21), RCAR_GP_PIN(2, 22),
+	RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 24),
+	RCAR_GP_PIN(2, 25), RCAR_GP_PIN(2, 26),
+	RCAR_GP_PIN(2, 27), RCAR_GP_PIN(2, 28),
 };
-static const union vin_data vin0_data_mux = {
-	.data24 = {
-		VI0_DATA0_MARK, VI0_DATA1_MARK,
-		VI0_DATA2_MARK, VI0_DATA3_MARK,
-		VI0_DATA4_MARK, VI0_DATA5_MARK,
-		VI0_DATA6_MARK, VI0_DATA7_MARK,
-		VI0_DATA8_MARK, VI0_DATA9_MARK,
-		VI0_DATA10_MARK, VI0_DATA11_MARK,
-		VI0_DATA12_MARK, VI0_DATA13_MARK,
-		VI0_DATA14_MARK, VI0_DATA15_MARK,
-		VI0_DATA16_MARK, VI0_DATA17_MARK,
-		VI0_DATA18_MARK, VI0_DATA19_MARK,
-		VI0_DATA20_MARK, VI0_DATA21_MARK,
-		VI0_DATA22_MARK, VI0_DATA23_MARK,
-	},
+static const unsigned int vin0_data_mux[] = {
+	VI0_DATA0_MARK, VI0_DATA1_MARK,
+	VI0_DATA2_MARK, VI0_DATA3_MARK,
+	VI0_DATA4_MARK, VI0_DATA5_MARK,
+	VI0_DATA6_MARK, VI0_DATA7_MARK,
+	VI0_DATA8_MARK, VI0_DATA9_MARK,
+	VI0_DATA10_MARK, VI0_DATA11_MARK,
+	VI0_DATA12_MARK, VI0_DATA13_MARK,
+	VI0_DATA14_MARK, VI0_DATA15_MARK,
+	VI0_DATA16_MARK, VI0_DATA17_MARK,
+	VI0_DATA18_MARK, VI0_DATA19_MARK,
+	VI0_DATA20_MARK, VI0_DATA21_MARK,
+	VI0_DATA22_MARK, VI0_DATA23_MARK,
 };
 static const unsigned int vin0_data18_pins[] = {
 	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
@@ -2047,25 +2043,21 @@ static const unsigned int vin0_clk_mux[] = {
 };
 
 /* - VIN1 ------------------------------------------------------------------- */
-static const union vin_data12 vin1_data_pins = {
-	.data12 = {
-		RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
-		RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
-		RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
-		RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
-		RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
-		RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15),
-	},
+static const unsigned int vin1_data_pins[] = {
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
+	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
+	RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
+	RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15),
 };
-static const union vin_data12 vin1_data_mux = {
-	.data12 = {
-		VI1_DATA0_MARK, VI1_DATA1_MARK,
-		VI1_DATA2_MARK, VI1_DATA3_MARK,
-		VI1_DATA4_MARK, VI1_DATA5_MARK,
-		VI1_DATA6_MARK, VI1_DATA7_MARK,
-		VI1_DATA8_MARK,  VI1_DATA9_MARK,
-		VI1_DATA10_MARK, VI1_DATA11_MARK,
-	},
+static const unsigned int vin1_data_mux[] = {
+	VI1_DATA0_MARK, VI1_DATA1_MARK,
+	VI1_DATA2_MARK, VI1_DATA3_MARK,
+	VI1_DATA4_MARK, VI1_DATA5_MARK,
+	VI1_DATA6_MARK, VI1_DATA7_MARK,
+	VI1_DATA8_MARK,  VI1_DATA9_MARK,
+	VI1_DATA10_MARK, VI1_DATA11_MARK,
 };
 static const unsigned int vin1_sync_pins[] = {
 	/* VI1_VSYNC#, VI1_HSYNC# */
@@ -2233,20 +2225,20 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(tpu_to1),
 	SH_PFC_PIN_GROUP(tpu_to2),
 	SH_PFC_PIN_GROUP(tpu_to3),
-	VIN_DATA_PIN_GROUP(vin0_data, 8),
-	VIN_DATA_PIN_GROUP(vin0_data, 10),
-	VIN_DATA_PIN_GROUP(vin0_data, 12),
-	VIN_DATA_PIN_GROUP(vin0_data, 16),
+	BUS_DATA_PIN_GROUP(vin0_data, 8),
+	BUS_DATA_PIN_GROUP(vin0_data, 10),
+	BUS_DATA_PIN_GROUP(vin0_data, 12),
+	BUS_DATA_PIN_GROUP(vin0_data, 16),
 	SH_PFC_PIN_GROUP(vin0_data18),
-	VIN_DATA_PIN_GROUP(vin0_data, 20),
-	VIN_DATA_PIN_GROUP(vin0_data, 24),
+	BUS_DATA_PIN_GROUP(vin0_data, 20),
+	BUS_DATA_PIN_GROUP(vin0_data, 24),
 	SH_PFC_PIN_GROUP(vin0_sync),
 	SH_PFC_PIN_GROUP(vin0_field),
 	SH_PFC_PIN_GROUP(vin0_clkenb),
 	SH_PFC_PIN_GROUP(vin0_clk),
-	VIN_DATA_PIN_GROUP(vin1_data, 8),
-	VIN_DATA_PIN_GROUP(vin1_data, 10),
-	VIN_DATA_PIN_GROUP(vin1_data, 12),
+	BUS_DATA_PIN_GROUP(vin1_data, 8),
+	BUS_DATA_PIN_GROUP(vin1_data, 10),
+	BUS_DATA_PIN_GROUP(vin1_data, 12),
 	SH_PFC_PIN_GROUP(vin1_sync),
 	SH_PFC_PIN_GROUP(vin1_field),
 	SH_PFC_PIN_GROUP(vin1_clkenb),
diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index c7f0db09937ee489..6fe53331ae626b0e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -3604,38 +3604,34 @@ static const unsigned int vin4_data18_a_mux[] = {
 	VI4_DATA22_MARK,  VI4_DATA23_MARK,
 };
 
-static const union vin_data vin4_data_a_pins = {
-	.data24 = {
-		RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
-		RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
-		RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
-		RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
-		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
-		RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
-		RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
-		RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
-		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
-		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
-		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
-	},
+static const unsigned int vin4_data_a_pins[] = {
+	RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
 };
 
-static const union vin_data vin4_data_a_mux = {
-	.data24 = {
-		VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
-		VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
-		VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
-		VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
-		VI4_DATA8_MARK,   VI4_DATA9_MARK,
-		VI4_DATA10_MARK,  VI4_DATA11_MARK,
-		VI4_DATA12_MARK,  VI4_DATA13_MARK,
-		VI4_DATA14_MARK,  VI4_DATA15_MARK,
-		VI4_DATA16_MARK,  VI4_DATA17_MARK,
-		VI4_DATA18_MARK,  VI4_DATA19_MARK,
-		VI4_DATA20_MARK,  VI4_DATA21_MARK,
-		VI4_DATA22_MARK,  VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+	VI4_DATA16_MARK,  VI4_DATA17_MARK,
+	VI4_DATA18_MARK,  VI4_DATA19_MARK,
+	VI4_DATA20_MARK,  VI4_DATA21_MARK,
+	VI4_DATA22_MARK,  VI4_DATA23_MARK,
 };
 
 static const unsigned int vin4_data18_b_pins[] = {
@@ -3662,38 +3658,34 @@ static const unsigned int vin4_data18_b_mux[] = {
 	VI4_DATA22_MARK,  VI4_DATA23_MARK,
 };
 
-static const union vin_data vin4_data_b_pins = {
-	.data24 = {
-		RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
-		RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
-		RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
-		RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
-		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
-		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
-		RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
-		RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
-		RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
-		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
-		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
-		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
-	},
+static const unsigned int vin4_data_b_pins[] = {
+	RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+	RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
 };
 
-static const union vin_data vin4_data_b_mux = {
-	.data24 = {
-		VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
-		VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
-		VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
-		VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
-		VI4_DATA8_MARK,   VI4_DATA9_MARK,
-		VI4_DATA10_MARK,  VI4_DATA11_MARK,
-		VI4_DATA12_MARK,  VI4_DATA13_MARK,
-		VI4_DATA14_MARK,  VI4_DATA15_MARK,
-		VI4_DATA16_MARK,  VI4_DATA17_MARK,
-		VI4_DATA18_MARK,  VI4_DATA19_MARK,
-		VI4_DATA20_MARK,  VI4_DATA21_MARK,
-		VI4_DATA22_MARK,  VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+	VI4_DATA16_MARK,  VI4_DATA17_MARK,
+	VI4_DATA18_MARK,  VI4_DATA19_MARK,
+	VI4_DATA20_MARK,  VI4_DATA21_MARK,
+	VI4_DATA22_MARK,  VI4_DATA23_MARK,
 };
 
 static const unsigned int vin4_g8_pins[] = {
@@ -3744,30 +3736,26 @@ static const unsigned int vin4_clk_mux[] = {
 };
 
 /* - VIN5 ------------------------------------------------------------------- */
-static const union vin_data16 vin5_data_a_pins = {
-	.data16 = {
-		RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
-		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
-		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
-		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
-		RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
-		RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
-		RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
-		RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
-	},
+static const unsigned int vin5_data_a_pins[] = {
+	RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
+	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
 };
 
-static const union vin_data16 vin5_data_a_mux = {
-	.data16 = {
-		VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
-		VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
-		VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
-		VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
-		VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
-		VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
-		VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
-		VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
-	},
+static const unsigned int vin5_data_a_mux[] = {
+	VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
+	VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
+	VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
+	VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
+	VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
+	VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
+	VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
+	VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
 };
 
 static const unsigned int vin5_data8_b_pins[] = {
@@ -4071,29 +4059,29 @@ static const struct {
 		SH_PFC_PIN_GROUP(usb0_id),
 		SH_PFC_PIN_GROUP(usb30),
 		SH_PFC_PIN_GROUP(usb30_id),
-		VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 10, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 12, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 8, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 10, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 12, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 16, _a),
 		SH_PFC_PIN_GROUP(vin4_data18_a),
-		VIN_DATA_PIN_GROUP(vin4_data, 20, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
-		VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 10, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 12, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 20, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 24, _a),
+		BUS_DATA_PIN_GROUP(vin4_data, 8, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 10, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 12, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 16, _b),
 		SH_PFC_PIN_GROUP(vin4_data18_b),
-		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
-		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 20, _b),
+		BUS_DATA_PIN_GROUP(vin4_data, 24, _b),
 		SH_PFC_PIN_GROUP(vin4_g8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
 		SH_PFC_PIN_GROUP(vin4_clk),
-		VIN_DATA_PIN_GROUP(vin5_data, 8, _a),
-		VIN_DATA_PIN_GROUP(vin5_data, 10, _a),
-		VIN_DATA_PIN_GROUP(vin5_data, 12, _a),
-		VIN_DATA_PIN_GROUP(vin5_data, 16, _a),
+		BUS_DATA_PIN_GROUP(vin5_data, 8, _a),
+		BUS_DATA_PIN_GROUP(vin5_data, 10, _a),
+		BUS_DATA_PIN_GROUP(vin5_data, 12, _a),
+		BUS_DATA_PIN_GROUP(vin5_data, 16, _a),
 		SH_PFC_PIN_GROUP(vin5_data8_b),
 		SH_PFC_PIN_GROUP(vin5_high8),
 		SH_PFC_PIN_GROUP(vin5_sync_a),
diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index e522e15769b91299..b086c7501472afa2 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -1950,37 +1950,33 @@ static const unsigned int vin4_data18_mux[] = {
 	VI4_DATA20_MARK, VI4_DATA21_MARK,
 	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
-static const union vin_data vin4_data_pins = {
-	.data24 = {
-		RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-		RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-		RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
-		RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-		RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
-		RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
-		RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
-		RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
-		RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
-		RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
-		RCAR_GP_PIN(2, 21), RCAR_GP_PIN(2, 22),
-		RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 24),
-	},
+static const unsigned int vin4_data_pins[] = {
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 6),
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12),
+	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 14),
+	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
+	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18),
+	RCAR_GP_PIN(2, 19), RCAR_GP_PIN(2, 20),
+	RCAR_GP_PIN(2, 21), RCAR_GP_PIN(2, 22),
+	RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 24),
 };
-static const union vin_data vin4_data_mux = {
-	.data24 = {
-		VI4_DATA0_MARK, VI4_DATA1_MARK,
-		VI4_DATA2_MARK, VI4_DATA3_MARK,
-		VI4_DATA4_MARK, VI4_DATA5_MARK,
-		VI4_DATA6_MARK, VI4_DATA7_MARK,
-		VI4_DATA8_MARK,  VI4_DATA9_MARK,
-		VI4_DATA10_MARK, VI4_DATA11_MARK,
-		VI4_DATA12_MARK, VI4_DATA13_MARK,
-		VI4_DATA14_MARK, VI4_DATA15_MARK,
-		VI4_DATA16_MARK, VI4_DATA17_MARK,
-		VI4_DATA18_MARK, VI4_DATA19_MARK,
-		VI4_DATA20_MARK, VI4_DATA21_MARK,
-		VI4_DATA22_MARK, VI4_DATA23_MARK,
-	},
+static const unsigned int vin4_data_mux[] = {
+	VI4_DATA0_MARK, VI4_DATA1_MARK,
+	VI4_DATA2_MARK, VI4_DATA3_MARK,
+	VI4_DATA4_MARK, VI4_DATA5_MARK,
+	VI4_DATA6_MARK, VI4_DATA7_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
 };
 static const unsigned int vin4_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
@@ -2128,13 +2124,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(ssi4_ctrl_b),
 	SH_PFC_PIN_GROUP(ssi4_data_b),
 	SH_PFC_PIN_GROUP(usb0),
-	VIN_DATA_PIN_GROUP(vin4_data, 8),
-	VIN_DATA_PIN_GROUP(vin4_data, 10),
-	VIN_DATA_PIN_GROUP(vin4_data, 12),
-	VIN_DATA_PIN_GROUP(vin4_data, 16),
+	BUS_DATA_PIN_GROUP(vin4_data, 8),
+	BUS_DATA_PIN_GROUP(vin4_data, 10),
+	BUS_DATA_PIN_GROUP(vin4_data, 12),
+	BUS_DATA_PIN_GROUP(vin4_data, 16),
 	SH_PFC_PIN_GROUP(vin4_data18),
-	VIN_DATA_PIN_GROUP(vin4_data, 20),
-	VIN_DATA_PIN_GROUP(vin4_data, 24),
+	BUS_DATA_PIN_GROUP(vin4_data, 20),
+	BUS_DATA_PIN_GROUP(vin4_data, 24),
 	SH_PFC_PIN_GROUP(vin4_sync),
 	SH_PFC_PIN_GROUP(vin4_field),
 	SH_PFC_PIN_GROUP(vin4_clkenb),
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 6f7fe21c982e5f48..4124e3b46c16c8de 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -70,6 +70,14 @@ struct sh_pfc_pin {
 	BUILD_BUG_ON_ZERO(first + n > ARRAY_SIZE(data##_mux)),		\
 }
 
+/*
+ * Define a pin group for the data pins of a resizable bus.
+ * An optional 'suffix' argument is accepted, to be used when the same group
+ * can appear on a different set of pins.
+ */
+#define BUS_DATA_PIN_GROUP(base, n, ...)				\
+	SH_PFC_PIN_GROUP_SUBSET(base##n##__VA_ARGS__, base##__VA_ARGS__, 0, n)
+
 struct sh_pfc_pin_group {
 	const char *name;
 	const unsigned int *pins;
@@ -77,42 +85,6 @@ struct sh_pfc_pin_group {
 	unsigned int nr_pins;
 };
 
-/*
- * Using union vin_data{,12,16} saves memory occupied by the VIN data pins.
- * VIN_DATA_PIN_GROUP() is a macro used to describe the VIN pin groups
- * in this case. It accepts an optional 'version' argument used when the
- * same group can appear on a different set of pins.
- */
-#define VIN_DATA_PIN_GROUP(n, s, ...) {					\
-	.name = #n#s#__VA_ARGS__,					\
-	.pins = n##__VA_ARGS__##_pins.data##s,				\
-	.mux = n##__VA_ARGS__##_mux.data##s,				\
-	.nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),		\
-}
-
-union vin_data12 {
-	unsigned int data12[12];
-	unsigned int data10[10];
-	unsigned int data8[8];
-};
-
-union vin_data16 {
-	unsigned int data16[16];
-	unsigned int data12[12];
-	unsigned int data10[10];
-	unsigned int data8[8];
-};
-
-union vin_data {
-	unsigned int data24[24];
-	unsigned int data20[20];
-	unsigned int data16[16];
-	unsigned int data12[12];
-	unsigned int data10[10];
-	unsigned int data8[8];
-	unsigned int data4[4];
-};
-
 #define SH_PFC_FUNCTION(n) {						\
 	.name = #n,							\
 	.groups = n##_groups,						\
-- 
2.25.1

