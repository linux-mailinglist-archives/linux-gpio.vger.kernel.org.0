Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFED47E4F5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243949AbhLWOmf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348946AbhLWOmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:19 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53649C061399
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:17 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by xavier.telenet-ops.be with bizsmtp
        id ZqiF2600K1rdBcm01qiFdB; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006aAs-2m; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rfL-34; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 40/60] pinctrl: renesas: r8a7740: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:41:50 +0100
Message-Id: <e07ae7b52efba55cc210d52de6a771129dd8a3b0.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-r8a7740.c | 45 +++++++--------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
index ba2d628defe030ac..3214331ba4e243cb 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7740.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7740.c
@@ -2426,18 +2426,11 @@ static const unsigned int scifb_ctrl_1_mux[] = {
 	SCIFB_RTS_PORT172_MARK, SCIFB_CTS_PORT173_MARK,
 };
 /* - SDHI0 ------------------------------------------------------------------ */
-static const unsigned int sdhi0_data1_pins[] = {
-	/* D0 */
-	77,
-};
-static const unsigned int sdhi0_data1_mux[] = {
-	SDHI0_D0_MARK,
-};
-static const unsigned int sdhi0_data4_pins[] = {
+static const unsigned int sdhi0_data_pins[] = {
 	/* D[0:3] */
 	77, 78, 79, 80,
 };
-static const unsigned int sdhi0_data4_mux[] = {
+static const unsigned int sdhi0_data_mux[] = {
 	SDHI0_D0_MARK, SDHI0_D1_MARK, SDHI0_D2_MARK, SDHI0_D3_MARK,
 };
 static const unsigned int sdhi0_ctrl_pins[] = {
@@ -2462,18 +2455,11 @@ static const unsigned int sdhi0_wp_mux[] = {
 	SDHI0_WP_MARK,
 };
 /* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	68,
-};
-static const unsigned int sdhi1_data1_mux[] = {
-	SDHI1_D0_MARK,
-};
-static const unsigned int sdhi1_data4_pins[] = {
+static const unsigned int sdhi1_data_pins[] = {
 	/* D[0:3] */
 	68, 69, 70, 71,
 };
-static const unsigned int sdhi1_data4_mux[] = {
+static const unsigned int sdhi1_data_mux[] = {
 	SDHI1_D0_MARK, SDHI1_D1_MARK, SDHI1_D2_MARK, SDHI1_D3_MARK,
 };
 static const unsigned int sdhi1_ctrl_pins[] = {
@@ -2498,18 +2484,11 @@ static const unsigned int sdhi1_wp_mux[] = {
 	SDHI1_WP_MARK,
 };
 /* - SDHI2 ------------------------------------------------------------------ */
-static const unsigned int sdhi2_data1_pins[] = {
-	/* D0 */
-	205,
-};
-static const unsigned int sdhi2_data1_mux[] = {
-	SDHI2_D0_MARK,
-};
-static const unsigned int sdhi2_data4_pins[] = {
+static const unsigned int sdhi2_data_pins[] = {
 	/* D[0:3] */
 	205, 206, 207, 208,
 };
-static const unsigned int sdhi2_data4_mux[] = {
+static const unsigned int sdhi2_data_mux[] = {
 	SDHI2_D0_MARK, SDHI2_D1_MARK, SDHI2_D2_MARK, SDHI2_D3_MARK,
 };
 static const unsigned int sdhi2_ctrl_pins[] = {
@@ -2747,18 +2726,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scifb_data_1),
 	SH_PFC_PIN_GROUP(scifb_clk_1),
 	SH_PFC_PIN_GROUP(scifb_ctrl_1),
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
 	SH_PFC_PIN_GROUP(sdhi2_cd_0),
 	SH_PFC_PIN_GROUP(sdhi2_wp_0),
-- 
2.25.1

