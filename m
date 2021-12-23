Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB1A47E501
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348865AbhLWOmi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348964AbhLWOmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:20 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87565C0619D9
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id ZqiF2600L4C55Sk01qiF1j; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006aAo-AQ; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rfE-1l; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 39/60] pinctrl: renesas: r8a73a4: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:41:49 +0100
Message-Id: <fca0b9c7cc5a1b4dd8d9bf4eff35d88d37eeab21.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-r8a73a4.c | 45 +++++++--------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a73a4.c b/drivers/pinctrl/renesas/pfc-r8a73a4.c
index 87442a1e17791917..1e569f6a03bf13e0 100644
--- a/drivers/pinctrl/renesas/pfc-r8a73a4.c
+++ b/drivers/pinctrl/renesas/pfc-r8a73a4.c
@@ -1676,18 +1676,11 @@ static const unsigned int scifb3_ctrl_b_mux[] = {
 	SCIFB3_RTS_38_MARK, SCIFB3_CTS_39_MARK,
 };
 /* - SDHI0 ------------------------------------------------------------------ */
-static const unsigned int sdhi0_data1_pins[] = {
-	/* D0 */
-	302,
-};
-static const unsigned int sdhi0_data1_mux[] = {
-	SDHID0_0_MARK,
-};
-static const unsigned int sdhi0_data4_pins[] = {
+static const unsigned int sdhi0_data_pins[] = {
 	/* D[0:3] */
 	302, 303, 304, 305,
 };
-static const unsigned int sdhi0_data4_mux[] = {
+static const unsigned int sdhi0_data_mux[] = {
 	SDHID0_0_MARK, SDHID0_1_MARK, SDHID0_2_MARK, SDHID0_3_MARK,
 };
 static const unsigned int sdhi0_ctrl_pins[] = {
@@ -1712,18 +1705,11 @@ static const unsigned int sdhi0_wp_mux[] = {
 	SDHIWP0_MARK,
 };
 /* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	289,
-};
-static const unsigned int sdhi1_data1_mux[] = {
-	SDHID1_0_MARK,
-};
-static const unsigned int sdhi1_data4_pins[] = {
+static const unsigned int sdhi1_data_pins[] = {
 	/* D[0:3] */
 	289, 290, 291, 292,
 };
-static const unsigned int sdhi1_data4_mux[] = {
+static const unsigned int sdhi1_data_mux[] = {
 	SDHID1_0_MARK, SDHID1_1_MARK, SDHID1_2_MARK, SDHID1_3_MARK,
 };
 static const unsigned int sdhi1_ctrl_pins[] = {
@@ -1734,18 +1720,11 @@ static const unsigned int sdhi1_ctrl_mux[] = {
 	SDHICLK1_MARK, SDHICMD1_MARK,
 };
 /* - SDHI2 ------------------------------------------------------------------ */
-static const unsigned int sdhi2_data1_pins[] = {
-	/* D0 */
-	295,
-};
-static const unsigned int sdhi2_data1_mux[] = {
-	SDHID2_0_MARK,
-};
-static const unsigned int sdhi2_data4_pins[] = {
+static const unsigned int sdhi2_data_pins[] = {
 	/* D[0:3] */
 	295, 296, 297, 298,
 };
-static const unsigned int sdhi2_data4_mux[] = {
+static const unsigned int sdhi2_data_mux[] = {
 	SDHID2_0_MARK, SDHID2_1_MARK, SDHID2_2_MARK, SDHID2_3_MARK,
 };
 static const unsigned int sdhi2_ctrl_pins[] = {
@@ -1850,16 +1829,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scifb3_data_b),
 	SH_PFC_PIN_GROUP(scifb3_clk_b),
 	SH_PFC_PIN_GROUP(scifb3_ctrl_b),
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
-	SH_PFC_PIN_GROUP(sdhi2_data1),
-	SH_PFC_PIN_GROUP(sdhi2_data4),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 1),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 4),
 	SH_PFC_PIN_GROUP(sdhi2_ctrl),
 };
 
-- 
2.25.1

