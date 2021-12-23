Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDED47E4DB
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348917AbhLWOm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348924AbhLWOmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:18 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BA4C061397
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by andre.telenet-ops.be with bizsmtp
        id ZqiE2600Q1rdBcm01qiEPq; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9K-JZ; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rgR-Ad; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 48/60] pinctrl: renesas: r8a77950: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:41:58 +0100
Message-Id: <4a479a1126bb405dbc853f328d483f649d43c61e.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups sdhi[01]_data1 are subsets of sdhi[01]_data4.
Pin groups sdhi[23]_data[14] are subsets of sdhi[23]_data8.

This reduces kernel size by 96 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77950.c | 82 ++++++--------------------
 1 file changed, 18 insertions(+), 64 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index b6646e74be60a502..ae3dd734c724bebf 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -3381,19 +3381,12 @@ static const unsigned int scif_clk_b_mux[] = {
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
 	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
 	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
 };
-static const unsigned int sdhi0_data4_mux[] = {
+static const unsigned int sdhi0_data_mux[] = {
 	SD0_DAT0_MARK, SD0_DAT1_MARK,
 	SD0_DAT2_MARK, SD0_DAT3_MARK,
 };
@@ -3419,19 +3412,12 @@ static const unsigned int sdhi0_wp_mux[] = {
 	SD0_WP_MARK,
 };
 /* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 8),
-};
-static const unsigned int sdhi1_data1_mux[] = {
-	SD1_DAT0_MARK,
-};
-static const unsigned int sdhi1_data4_pins[] = {
+static const unsigned int sdhi1_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(3, 8),  RCAR_GP_PIN(3, 9),
 	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
 };
-static const unsigned int sdhi1_data4_mux[] = {
+static const unsigned int sdhi1_data_mux[] = {
 	SD1_DAT0_MARK, SD1_DAT1_MARK,
 	SD1_DAT2_MARK, SD1_DAT3_MARK,
 };
@@ -3457,30 +3443,14 @@ static const unsigned int sdhi1_wp_mux[] = {
 	SD1_WP_MARK,
 };
 /* - SDHI2 ------------------------------------------------------------------ */
-static const unsigned int sdhi2_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(4, 2),
-};
-static const unsigned int sdhi2_data1_mux[] = {
-	SD2_DAT0_MARK,
-};
-static const unsigned int sdhi2_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
-	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
-};
-static const unsigned int sdhi2_data4_mux[] = {
-	SD2_DAT0_MARK, SD2_DAT1_MARK,
-	SD2_DAT2_MARK, SD2_DAT3_MARK,
-};
-static const unsigned int sdhi2_data8_pins[] = {
+static const unsigned int sdhi2_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(4, 2),  RCAR_GP_PIN(4, 3),
 	RCAR_GP_PIN(4, 4),  RCAR_GP_PIN(4, 5),
 	RCAR_GP_PIN(3, 8),  RCAR_GP_PIN(3, 9),
 	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 11),
 };
-static const unsigned int sdhi2_data8_mux[] = {
+static const unsigned int sdhi2_data_mux[] = {
 	SD2_DAT0_MARK, SD2_DAT1_MARK,
 	SD2_DAT2_MARK, SD2_DAT3_MARK,
 	SD2_DAT4_MARK, SD2_DAT5_MARK,
@@ -3529,30 +3499,14 @@ static const unsigned int sdhi2_ds_mux[] = {
 	SD2_DS_MARK,
 };
 /* - SDHI3 ------------------------------------------------------------------ */
-static const unsigned int sdhi3_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(4, 9),
-};
-static const unsigned int sdhi3_data1_mux[] = {
-	SD3_DAT0_MARK,
-};
-static const unsigned int sdhi3_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(4, 9),  RCAR_GP_PIN(4, 10),
-	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 12),
-};
-static const unsigned int sdhi3_data4_mux[] = {
-	SD3_DAT0_MARK, SD3_DAT1_MARK,
-	SD3_DAT2_MARK, SD3_DAT3_MARK,
-};
-static const unsigned int sdhi3_data8_pins[] = {
+static const unsigned int sdhi3_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(4, 9),  RCAR_GP_PIN(4, 10),
 	RCAR_GP_PIN(4, 11), RCAR_GP_PIN(4, 12),
 	RCAR_GP_PIN(4, 13), RCAR_GP_PIN(4, 14),
 	RCAR_GP_PIN(4, 15), RCAR_GP_PIN(4, 16),
 };
-static const unsigned int sdhi3_data8_mux[] = {
+static const unsigned int sdhi3_data_mux[] = {
 	SD3_DAT0_MARK, SD3_DAT1_MARK,
 	SD3_DAT2_MARK, SD3_DAT3_MARK,
 	SD3_DAT4_MARK, SD3_DAT5_MARK,
@@ -4123,28 +4077,28 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif5_clk),
 	SH_PFC_PIN_GROUP(scif_clk_a),
 	SH_PFC_PIN_GROUP(scif_clk_b),
-	SH_PFC_PIN_GROUP(sdhi0_data1),
-	SH_PFC_PIN_GROUP(sdhi0_data4),
+	BUS_DATA_PIN_GROUP(sdhi0_data, 1),
+	BUS_DATA_PIN_GROUP(sdhi0_data, 4),
 	SH_PFC_PIN_GROUP(sdhi0_ctrl),
 	SH_PFC_PIN_GROUP(sdhi0_cd),
 	SH_PFC_PIN_GROUP(sdhi0_wp),
-	SH_PFC_PIN_GROUP(sdhi1_data1),
-	SH_PFC_PIN_GROUP(sdhi1_data4),
+	BUS_DATA_PIN_GROUP(sdhi1_data, 1),
+	BUS_DATA_PIN_GROUP(sdhi1_data, 4),
 	SH_PFC_PIN_GROUP(sdhi1_ctrl),
 	SH_PFC_PIN_GROUP(sdhi1_cd),
 	SH_PFC_PIN_GROUP(sdhi1_wp),
-	SH_PFC_PIN_GROUP(sdhi2_data1),
-	SH_PFC_PIN_GROUP(sdhi2_data4),
-	SH_PFC_PIN_GROUP(sdhi2_data8),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 1),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 4),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 8),
 	SH_PFC_PIN_GROUP(sdhi2_ctrl),
 	SH_PFC_PIN_GROUP(sdhi2_cd_a),
 	SH_PFC_PIN_GROUP(sdhi2_wp_a),
 	SH_PFC_PIN_GROUP(sdhi2_cd_b),
 	SH_PFC_PIN_GROUP(sdhi2_wp_b),
 	SH_PFC_PIN_GROUP(sdhi2_ds),
-	SH_PFC_PIN_GROUP(sdhi3_data1),
-	SH_PFC_PIN_GROUP(sdhi3_data4),
-	SH_PFC_PIN_GROUP(sdhi3_data8),
+	BUS_DATA_PIN_GROUP(sdhi3_data, 1),
+	BUS_DATA_PIN_GROUP(sdhi3_data, 4),
+	BUS_DATA_PIN_GROUP(sdhi3_data, 8),
 	SH_PFC_PIN_GROUP(sdhi3_ctrl),
 	SH_PFC_PIN_GROUP(sdhi3_cd),
 	SH_PFC_PIN_GROUP(sdhi3_wp),
-- 
2.25.1

