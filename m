Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FFE47E4EE
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348868AbhLWOmd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:33 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:45184 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348931AbhLWOmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:18 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4JKXw7292jzMqpBD
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 15:42:15 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqiF260071rdBcm01qiFN6; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a8x-LS; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rhG-Ex; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 52/60] pinctrl: renesas: r8a77990: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:42:02 +0100
Message-Id: <2f702b6c6114458a43a77ae04089e7f9e20482e5.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups sdhi[01]_data1 are subsets of sdhi[01]_data4.
Pin groups sdhi3_data[14] are subsets of sdhi3_data8.

This reduces kernel size by 56 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77990.c | 64 ++++++--------------------
 1 file changed, 13 insertions(+), 51 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index a4dd983aca7e1cbe..37db292b649a700b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -3124,22 +3124,13 @@ static const unsigned int scif_clk_b_mux[] = {
 };
 
 /* - SDHI0 ------------------------------------------------------------------ */
-static const unsigned int sdhi0_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 2),
-};
-
-static const unsigned int sdhi0_data1_mux[] = {
-	SD0_DAT0_MARK,
-};
-
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
@@ -3172,22 +3163,13 @@ static const unsigned int sdhi0_wp_mux[] = {
 };
 
 /* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 8),
-};
-
-static const unsigned int sdhi1_data1_mux[] = {
-	SD1_DAT0_MARK,
-};
-
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
@@ -3220,27 +3202,7 @@ static const unsigned int sdhi1_wp_mux[] = {
 };
 
 /* - SDHI3 ------------------------------------------------------------------ */
-static const unsigned int sdhi3_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(4, 2),
-};
-
-static const unsigned int sdhi3_data1_mux[] = {
-	SD3_DAT0_MARK,
-};
-
-static const unsigned int sdhi3_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
-	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
-};
-
-static const unsigned int sdhi3_data4_mux[] = {
-	SD3_DAT0_MARK, SD3_DAT1_MARK,
-	SD3_DAT2_MARK, SD3_DAT3_MARK,
-};
-
-static const unsigned int sdhi3_data8_pins[] = {
+static const unsigned int sdhi3_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 3),
 	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
@@ -3248,7 +3210,7 @@ static const unsigned int sdhi3_data8_pins[] = {
 	RCAR_GP_PIN(4, 8), RCAR_GP_PIN(4, 9),
 };
 
-static const unsigned int sdhi3_data8_mux[] = {
+static const unsigned int sdhi3_data_mux[] = {
 	SD3_DAT0_MARK, SD3_DAT1_MARK,
 	SD3_DAT2_MARK, SD3_DAT3_MARK,
 	SD3_DAT4_MARK, SD3_DAT5_MARK,
@@ -3998,19 +3960,19 @@ static const struct {
 		SH_PFC_PIN_GROUP(scif5_data_c),
 		SH_PFC_PIN_GROUP(scif_clk_a),
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
-		SH_PFC_PIN_GROUP(sdhi3_data1),
-		SH_PFC_PIN_GROUP(sdhi3_data4),
-		SH_PFC_PIN_GROUP(sdhi3_data8),
+		BUS_DATA_PIN_GROUP(sdhi3_data, 1),
+		BUS_DATA_PIN_GROUP(sdhi3_data, 4),
+		BUS_DATA_PIN_GROUP(sdhi3_data, 8),
 		SH_PFC_PIN_GROUP(sdhi3_ctrl),
 		SH_PFC_PIN_GROUP(sdhi3_cd),
 		SH_PFC_PIN_GROUP(sdhi3_wp),
-- 
2.25.1

