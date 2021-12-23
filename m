Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85B147E4B9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348862AbhLWOmW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348886AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D6CC061756
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id ZqiF2600C4C55Sk06qiFql; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9Q-My; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rfn-6t; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 44/60] pinctrl: renesas: r8a7790: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:41:54 +0100
Message-Id: <88a3c2b09d34f2a528ecaa1bd55b6a96e156f5b1.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups sdhi[0-3]_data1 are subsets of sdhi[0-3]_data4.

This reduces kernel size by 32 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7790.c | 60 +++++++--------------------
 1 file changed, 16 insertions(+), 44 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index f24894071d78ac8c..d8f99f0843d6a301 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -3280,18 +3280,11 @@ static const unsigned int scif_clk_b_mux[] = {
 	SCIF_CLK_B_MARK,
 };
 /* - SDHI0 ------------------------------------------------------------------ */
-static const unsigned int sdhi0_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 2),
-};
-static const unsigned int sdhi0_data1_mux[] = {
-	SD0_DAT0_MARK,
-};
-static const unsigned int sdhi0_data4_pins[] = {
+static const unsigned int sdhi0_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
 };
-static const unsigned int sdhi0_data4_mux[] = {
+static const unsigned int sdhi0_data_mux[] = {
 	SD0_DAT0_MARK, SD0_DAT1_MARK, SD0_DAT2_MARK, SD0_DAT3_MARK,
 };
 static const unsigned int sdhi0_ctrl_pins[] = {
@@ -3316,18 +3309,11 @@ static const unsigned int sdhi0_wp_mux[] = {
 	SD0_WP_MARK,
 };
 /* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 10),
-};
-static const unsigned int sdhi1_data1_mux[] = {
-	SD1_DAT0_MARK,
-};
-static const unsigned int sdhi1_data4_pins[] = {
+static const unsigned int sdhi1_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11), RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
 };
-static const unsigned int sdhi1_data4_mux[] = {
+static const unsigned int sdhi1_data_mux[] = {
 	SD1_DAT0_MARK, SD1_DAT1_MARK, SD1_DAT2_MARK, SD1_DAT3_MARK,
 };
 static const unsigned int sdhi1_ctrl_pins[] = {
@@ -3352,18 +3338,11 @@ static const unsigned int sdhi1_wp_mux[] = {
 	SD1_WP_MARK,
 };
 /* - SDHI2 ------------------------------------------------------------------ */
-static const unsigned int sdhi2_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 18),
-};
-static const unsigned int sdhi2_data1_mux[] = {
-	SD2_DAT0_MARK,
-};
-static const unsigned int sdhi2_data4_pins[] = {
+static const unsigned int sdhi2_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(3, 18), RCAR_GP_PIN(3, 19), RCAR_GP_PIN(3, 20), RCAR_GP_PIN(3, 21),
 };
-static const unsigned int sdhi2_data4_mux[] = {
+static const unsigned int sdhi2_data_mux[] = {
 	SD2_DAT0_MARK, SD2_DAT1_MARK, SD2_DAT2_MARK, SD2_DAT3_MARK,
 };
 static const unsigned int sdhi2_ctrl_pins[] = {
@@ -3388,18 +3367,11 @@ static const unsigned int sdhi2_wp_mux[] = {
 	SD2_WP_MARK,
 };
 /* - SDHI3 ------------------------------------------------------------------ */
-static const unsigned int sdhi3_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 26),
-};
-static const unsigned int sdhi3_data1_mux[] = {
-	SD3_DAT0_MARK,
-};
-static const unsigned int sdhi3_data4_pins[] = {
+static const unsigned int sdhi3_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(3, 26), RCAR_GP_PIN(3, 27), RCAR_GP_PIN(3, 28), RCAR_GP_PIN(3, 29),
 };
-static const unsigned int sdhi3_data4_mux[] = {
+static const unsigned int sdhi3_data_mux[] = {
 	SD3_DAT0_MARK, SD3_DAT1_MARK, SD3_DAT2_MARK, SD3_DAT3_MARK,
 };
 static const unsigned int sdhi3_ctrl_pins[] = {
@@ -4292,23 +4264,23 @@ static const struct {
 		SH_PFC_PIN_GROUP(scifb2_data_c),
 		SH_PFC_PIN_GROUP(scif_clk),
 		SH_PFC_PIN_GROUP(scif_clk_b),
-		SH_PFC_PIN_GROUP(sdhi0_data1),
-		SH_PFC_PIN_GROUP(sdhi0_data4),
+		BUS_DATA_PIN_GROUP(sdhi0_data, 1),
+		BUS_DATA_PIN_GROUP(sdhi0_data, 4),
 		SH_PFC_PIN_GROUP(sdhi0_ctrl),
 		SH_PFC_PIN_GROUP(sdhi0_cd),
 		SH_PFC_PIN_GROUP(sdhi0_wp),
-		SH_PFC_PIN_GROUP(sdhi1_data1),
-		SH_PFC_PIN_GROUP(sdhi1_data4),
+		BUS_DATA_PIN_GROUP(sdhi1_data, 1),
+		BUS_DATA_PIN_GROUP(sdhi1_data, 4),
 		SH_PFC_PIN_GROUP(sdhi1_ctrl),
 		SH_PFC_PIN_GROUP(sdhi1_cd),
 		SH_PFC_PIN_GROUP(sdhi1_wp),
-		SH_PFC_PIN_GROUP(sdhi2_data1),
-		SH_PFC_PIN_GROUP(sdhi2_data4),
+		BUS_DATA_PIN_GROUP(sdhi2_data, 1),
+		BUS_DATA_PIN_GROUP(sdhi2_data, 4),
 		SH_PFC_PIN_GROUP(sdhi2_ctrl),
 		SH_PFC_PIN_GROUP(sdhi2_cd),
 		SH_PFC_PIN_GROUP(sdhi2_wp),
-		SH_PFC_PIN_GROUP(sdhi3_data1),
-		SH_PFC_PIN_GROUP(sdhi3_data4),
+		BUS_DATA_PIN_GROUP(sdhi3_data, 1),
+		BUS_DATA_PIN_GROUP(sdhi3_data, 4),
 		SH_PFC_PIN_GROUP(sdhi3_ctrl),
 		SH_PFC_PIN_GROUP(sdhi3_cd),
 		SH_PFC_PIN_GROUP(sdhi3_wp),
-- 
2.25.1

