Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8BE47E4DF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348924AbhLWOm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236856AbhLWOmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:18 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CB9C061353
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:17 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by xavier.telenet-ops.be with bizsmtp
        id ZqiF2600E1rdBcm01qiFd5; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9Q-Jg; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rgK-9o; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 47/60] pinctrl: renesas: r8a7794: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:41:57 +0100
Message-Id: <e4d831e163010d2b62ecc20f8e4b79fd298b2172.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups sdhi[012]_data1 are subsets of sdhi[012]_data4.

This reduces kernel size by 24 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7794.c | 45 +++++++--------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index fdb6597a978c6788..3835c3956bd1f017 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -3210,19 +3210,12 @@ static const unsigned int scif_clk_b_mux[] = {
 	SCIF_CLK_B_MARK,
 };
 /* - SDHI0 ------------------------------------------------------------------ */
-static const unsigned int sdhi0_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 2),
-};
-static const unsigned int sdhi0_data1_mux[] = {
-	SD0_DATA0_MARK,
-};
-static const unsigned int sdhi0_data4_pins[] = {
+static const unsigned int sdhi0_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(6, 2), RCAR_GP_PIN(6, 3),
 	RCAR_GP_PIN(6, 4), RCAR_GP_PIN(6, 5),
 };
-static const unsigned int sdhi0_data4_mux[] = {
+static const unsigned int sdhi0_data_mux[] = {
 	SD0_DATA0_MARK, SD0_DATA1_MARK, SD0_DATA2_MARK, SD0_DATA3_MARK,
 };
 static const unsigned int sdhi0_ctrl_pins[] = {
@@ -3247,19 +3240,12 @@ static const unsigned int sdhi0_wp_mux[] = {
 	SD0_WP_MARK,
 };
 /* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 10),
-};
-static const unsigned int sdhi1_data1_mux[] = {
-	SD1_DATA0_MARK,
-};
-static const unsigned int sdhi1_data4_pins[] = {
+static const unsigned int sdhi1_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(6, 10), RCAR_GP_PIN(6, 11),
 	RCAR_GP_PIN(6, 12), RCAR_GP_PIN(6, 13),
 };
-static const unsigned int sdhi1_data4_mux[] = {
+static const unsigned int sdhi1_data_mux[] = {
 	SD1_DATA0_MARK, SD1_DATA1_MARK, SD1_DATA2_MARK, SD1_DATA3_MARK,
 };
 static const unsigned int sdhi1_ctrl_pins[] = {
@@ -3284,19 +3270,12 @@ static const unsigned int sdhi1_wp_mux[] = {
 	SD1_WP_MARK,
 };
 /* - SDHI2 ------------------------------------------------------------------ */
-static const unsigned int sdhi2_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(6, 18),
-};
-static const unsigned int sdhi2_data1_mux[] = {
-	SD2_DATA0_MARK,
-};
-static const unsigned int sdhi2_data4_pins[] = {
+static const unsigned int sdhi2_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
 	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
 };
-static const unsigned int sdhi2_data4_mux[] = {
+static const unsigned int sdhi2_data_mux[] = {
 	SD2_DATA0_MARK, SD2_DATA1_MARK, SD2_DATA2_MARK, SD2_DATA3_MARK,
 };
 static const unsigned int sdhi2_ctrl_pins[] = {
@@ -4012,18 +3991,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scifb2_ctrl),
 	SH_PFC_PIN_GROUP(scif_clk),
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
+	BUS_DATA_PIN_GROUP(sdhi2_data, 1),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 4),
 	SH_PFC_PIN_GROUP(sdhi2_ctrl),
 	SH_PFC_PIN_GROUP(sdhi2_cd),
 	SH_PFC_PIN_GROUP(sdhi2_wp),
-- 
2.25.1

