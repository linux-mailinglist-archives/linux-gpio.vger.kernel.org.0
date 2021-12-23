Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0246747E4FA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348981AbhLWOmg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237852AbhLWOmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:19 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5B1C06137D
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id ZqiF2600K4C55Sk01qiF1h; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a92-Mk; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rfu-7h; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 45/60] pinctrl: renesas: r8a7791: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:41:55 +0100
Message-Id: <cb39cb8fe9152197df56f70b4b146d8fe96fb0b7.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-r8a7791.c | 45 +++++++--------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index 30193108c6805456..e4a284ae7cfaf59e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -3780,19 +3780,12 @@ static const unsigned int scif_clk_b_mux[] = {
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
@@ -3817,19 +3810,12 @@ static const unsigned int sdhi0_wp_mux[] = {
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
@@ -3854,19 +3840,12 @@ static const unsigned int sdhi1_wp_mux[] = {
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
@@ -4716,18 +4695,18 @@ static const struct {
 		SH_PFC_PIN_GROUP(scifb2_data_d),
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
-- 
2.25.1

