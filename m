Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE59747E4FD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239835AbhLWOmh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348965AbhLWOmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:20 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B167C0619DA
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id ZqiF2600P4C55Sk01qiF1k; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006a98-LS; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rZZ-3K; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 12/60] pinctrl: renesas: sh73a0: Share LCD pin group data
Date:   Thu, 23 Dec 2021 15:41:22 +0100
Message-Id: <32561ca31b590424f494351a737473200102bf8c.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups lcd{,2}_data{8,9,12,16,18} are subsets of lcd{,2}_data24.

This reduces kernel size by 1008 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh73a0.c | 136 ++++-----------------------
 1 file changed, 16 insertions(+), 120 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index 3d03854b9833a093..3d17d775247f18de 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -1912,65 +1912,13 @@ static const unsigned int keysc_out11_1_mux[] = {
 	PORT143_KEYOUT11_MARK,
 };
 /* - LCD -------------------------------------------------------------------- */
-static const unsigned int lcd_data8_pins[] = {
-	/* D[0:7] */
-	192, 193, 194, 195, 196, 197, 198, 199,
-};
-static const unsigned int lcd_data8_mux[] = {
-	LCDD0_MARK, LCDD1_MARK, LCDD2_MARK, LCDD3_MARK,
-	LCDD4_MARK, LCDD5_MARK, LCDD6_MARK, LCDD7_MARK,
-};
-static const unsigned int lcd_data9_pins[] = {
-	/* D[0:8] */
-	192, 193, 194, 195, 196, 197, 198, 199,
-	200,
-};
-static const unsigned int lcd_data9_mux[] = {
-	LCDD0_MARK, LCDD1_MARK, LCDD2_MARK, LCDD3_MARK,
-	LCDD4_MARK, LCDD5_MARK, LCDD6_MARK, LCDD7_MARK,
-	LCDD8_MARK,
-};
-static const unsigned int lcd_data12_pins[] = {
-	/* D[0:11] */
-	192, 193, 194, 195, 196, 197, 198, 199,
-	200, 201, 202, 203,
-};
-static const unsigned int lcd_data12_mux[] = {
-	LCDD0_MARK, LCDD1_MARK, LCDD2_MARK, LCDD3_MARK,
-	LCDD4_MARK, LCDD5_MARK, LCDD6_MARK, LCDD7_MARK,
-	LCDD8_MARK, LCDD9_MARK, LCDD10_MARK, LCDD11_MARK,
-};
-static const unsigned int lcd_data16_pins[] = {
-	/* D[0:15] */
-	192, 193, 194, 195, 196, 197, 198, 199,
-	200, 201, 202, 203, 204, 205, 206, 207,
-};
-static const unsigned int lcd_data16_mux[] = {
-	LCDD0_MARK, LCDD1_MARK, LCDD2_MARK, LCDD3_MARK,
-	LCDD4_MARK, LCDD5_MARK, LCDD6_MARK, LCDD7_MARK,
-	LCDD8_MARK, LCDD9_MARK, LCDD10_MARK, LCDD11_MARK,
-	LCDD12_MARK, LCDD13_MARK, LCDD14_MARK, LCDD15_MARK,
-};
-static const unsigned int lcd_data18_pins[] = {
-	/* D[0:17] */
-	192, 193, 194, 195, 196, 197, 198, 199,
-	200, 201, 202, 203, 204, 205, 206, 207,
-	208, 209,
-};
-static const unsigned int lcd_data18_mux[] = {
-	LCDD0_MARK, LCDD1_MARK, LCDD2_MARK, LCDD3_MARK,
-	LCDD4_MARK, LCDD5_MARK, LCDD6_MARK, LCDD7_MARK,
-	LCDD8_MARK, LCDD9_MARK, LCDD10_MARK, LCDD11_MARK,
-	LCDD12_MARK, LCDD13_MARK, LCDD14_MARK, LCDD15_MARK,
-	LCDD16_MARK, LCDD17_MARK,
-};
-static const unsigned int lcd_data24_pins[] = {
+static const unsigned int lcd_data_pins[] = {
 	/* D[0:23] */
 	192, 193, 194, 195, 196, 197, 198, 199,
 	200, 201, 202, 203, 204, 205, 206, 207,
 	208, 209, 210, 211, 212, 213, 214, 215
 };
-static const unsigned int lcd_data24_mux[] = {
+static const unsigned int lcd_data_mux[] = {
 	LCDD0_MARK, LCDD1_MARK, LCDD2_MARK, LCDD3_MARK,
 	LCDD4_MARK, LCDD5_MARK, LCDD6_MARK, LCDD7_MARK,
 	LCDD8_MARK, LCDD9_MARK, LCDD10_MARK, LCDD11_MARK,
@@ -2007,65 +1955,13 @@ static const unsigned int lcd_sys_mux[] = {
 	LCDCS__MARK, LCDWR__MARK, LCDRD__MARK, LCDRS_MARK,
 };
 /* - LCD2 ------------------------------------------------------------------- */
-static const unsigned int lcd2_data8_pins[] = {
-	/* D[0:7] */
-	128, 129, 142, 143, 144, 145, 138, 139,
-};
-static const unsigned int lcd2_data8_mux[] = {
-	LCD2D0_MARK, LCD2D1_MARK, LCD2D2_MARK, LCD2D3_MARK,
-	LCD2D4_MARK, LCD2D5_MARK, LCD2D6_MARK, LCD2D7_MARK,
-};
-static const unsigned int lcd2_data9_pins[] = {
-	/* D[0:8] */
-	128, 129, 142, 143, 144, 145, 138, 139,
-	140,
-};
-static const unsigned int lcd2_data9_mux[] = {
-	LCD2D0_MARK, LCD2D1_MARK, LCD2D2_MARK, LCD2D3_MARK,
-	LCD2D4_MARK, LCD2D5_MARK, LCD2D6_MARK, LCD2D7_MARK,
-	LCD2D8_MARK,
-};
-static const unsigned int lcd2_data12_pins[] = {
-	/* D[0:11] */
-	128, 129, 142, 143, 144, 145, 138, 139,
-	140, 141, 130, 131,
-};
-static const unsigned int lcd2_data12_mux[] = {
-	LCD2D0_MARK, LCD2D1_MARK, LCD2D2_MARK, LCD2D3_MARK,
-	LCD2D4_MARK, LCD2D5_MARK, LCD2D6_MARK, LCD2D7_MARK,
-	LCD2D8_MARK, LCD2D9_MARK, LCD2D10_MARK, LCD2D11_MARK,
-};
-static const unsigned int lcd2_data16_pins[] = {
-	/* D[0:15] */
-	128, 129, 142, 143, 144, 145, 138, 139,
-	140, 141, 130, 131, 132, 133, 134, 135,
-};
-static const unsigned int lcd2_data16_mux[] = {
-	LCD2D0_MARK, LCD2D1_MARK, LCD2D2_MARK, LCD2D3_MARK,
-	LCD2D4_MARK, LCD2D5_MARK, LCD2D6_MARK, LCD2D7_MARK,
-	LCD2D8_MARK, LCD2D9_MARK, LCD2D10_MARK, LCD2D11_MARK,
-	LCD2D12_MARK, LCD2D13_MARK, LCD2D14_MARK, LCD2D15_MARK,
-};
-static const unsigned int lcd2_data18_pins[] = {
-	/* D[0:17] */
-	128, 129, 142, 143, 144, 145, 138, 139,
-	140, 141, 130, 131, 132, 133, 134, 135,
-	136, 137,
-};
-static const unsigned int lcd2_data18_mux[] = {
-	LCD2D0_MARK, LCD2D1_MARK, LCD2D2_MARK, LCD2D3_MARK,
-	LCD2D4_MARK, LCD2D5_MARK, LCD2D6_MARK, LCD2D7_MARK,
-	LCD2D8_MARK, LCD2D9_MARK, LCD2D10_MARK, LCD2D11_MARK,
-	LCD2D12_MARK, LCD2D13_MARK, LCD2D14_MARK, LCD2D15_MARK,
-	LCD2D16_MARK, LCD2D17_MARK,
-};
-static const unsigned int lcd2_data24_pins[] = {
+static const unsigned int lcd2_data_pins[] = {
 	/* D[0:23] */
 	128, 129, 142, 143, 144, 145, 138, 139,
 	140, 141, 130, 131, 132, 133, 134, 135,
 	136, 137, 146, 147, 234, 235, 238, 239
 };
-static const unsigned int lcd2_data24_mux[] = {
+static const unsigned int lcd2_data_mux[] = {
 	LCD2D0_MARK, LCD2D1_MARK, LCD2D2_MARK, LCD2D3_MARK,
 	LCD2D4_MARK, LCD2D5_MARK, LCD2D6_MARK, LCD2D7_MARK,
 	LCD2D8_MARK, LCD2D9_MARK, LCD2D10_MARK, LCD2D11_MARK,
@@ -3136,22 +3032,22 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(keysc_out10_1),
 	SH_PFC_PIN_GROUP(keysc_out11_0),
 	SH_PFC_PIN_GROUP(keysc_out11_1),
-	SH_PFC_PIN_GROUP(lcd_data8),
-	SH_PFC_PIN_GROUP(lcd_data9),
-	SH_PFC_PIN_GROUP(lcd_data12),
-	SH_PFC_PIN_GROUP(lcd_data16),
-	SH_PFC_PIN_GROUP(lcd_data18),
-	SH_PFC_PIN_GROUP(lcd_data24),
+	BUS_DATA_PIN_GROUP(lcd_data, 8),
+	BUS_DATA_PIN_GROUP(lcd_data, 9),
+	BUS_DATA_PIN_GROUP(lcd_data, 12),
+	BUS_DATA_PIN_GROUP(lcd_data, 16),
+	BUS_DATA_PIN_GROUP(lcd_data, 18),
+	BUS_DATA_PIN_GROUP(lcd_data, 24),
 	SH_PFC_PIN_GROUP(lcd_display),
 	SH_PFC_PIN_GROUP(lcd_lclk),
 	SH_PFC_PIN_GROUP(lcd_sync),
 	SH_PFC_PIN_GROUP(lcd_sys),
-	SH_PFC_PIN_GROUP(lcd2_data8),
-	SH_PFC_PIN_GROUP(lcd2_data9),
-	SH_PFC_PIN_GROUP(lcd2_data12),
-	SH_PFC_PIN_GROUP(lcd2_data16),
-	SH_PFC_PIN_GROUP(lcd2_data18),
-	SH_PFC_PIN_GROUP(lcd2_data24),
+	BUS_DATA_PIN_GROUP(lcd2_data, 8),
+	BUS_DATA_PIN_GROUP(lcd2_data, 9),
+	BUS_DATA_PIN_GROUP(lcd2_data, 12),
+	BUS_DATA_PIN_GROUP(lcd2_data, 16),
+	BUS_DATA_PIN_GROUP(lcd2_data, 18),
+	BUS_DATA_PIN_GROUP(lcd2_data, 24),
 	SH_PFC_PIN_GROUP(lcd2_sync_0),
 	SH_PFC_PIN_GROUP(lcd2_sync_1),
 	SH_PFC_PIN_GROUP(lcd2_sys_0),
-- 
2.25.1

