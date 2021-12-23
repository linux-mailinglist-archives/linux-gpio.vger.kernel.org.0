Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB4247E4E6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348929AbhLWOmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348934AbhLWOmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:18 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA8FC061377
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:17 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by andre.telenet-ops.be with bizsmtp
        id ZqiF2600E1rdBcm01qiFQD; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9Q-LP; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rhh-H2; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 53/60] pinctrl: renesas: sh73a0: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:42:03 +0100
Message-Id: <96a5be0c34c66b302e16e915a7cc6272783aa73c.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-sh73a0.c | 45 ++++++++--------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index 42710a8758192cf4..44cf1adaff13b02c 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -2695,18 +2695,11 @@ static const unsigned int scifb_ctrl_1_mux[] = {
 	PORT245_SCIFB_RTS__MARK, PORT244_SCIFB_CTS__MARK,
 };
 /* - SDHI0 ------------------------------------------------------------------ */
-static const unsigned int sdhi0_data1_pins[] = {
-	/* D0 */
-	252,
-};
-static const unsigned int sdhi0_data1_mux[] = {
-	SDHID0_0_MARK,
-};
-static const unsigned int sdhi0_data4_pins[] = {
+static const unsigned int sdhi0_data_pins[] = {
 	/* D[0:3] */
 	252, 253, 254, 255,
 };
-static const unsigned int sdhi0_data4_mux[] = {
+static const unsigned int sdhi0_data_mux[] = {
 	SDHID0_0_MARK, SDHID0_1_MARK, SDHID0_2_MARK, SDHID0_3_MARK,
 };
 static const unsigned int sdhi0_ctrl_pins[] = {
@@ -2731,18 +2724,11 @@ static const unsigned int sdhi0_wp_mux[] = {
 	SDHIWP0_MARK,
 };
 /* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	259,
-};
-static const unsigned int sdhi1_data1_mux[] = {
-	SDHID1_0_MARK,
-};
-static const unsigned int sdhi1_data4_pins[] = {
+static const unsigned int sdhi1_data_pins[] = {
 	/* D[0:3] */
 	259, 260, 261, 262,
 };
-static const unsigned int sdhi1_data4_mux[] = {
+static const unsigned int sdhi1_data_mux[] = {
 	SDHID1_0_MARK, SDHID1_1_MARK, SDHID1_2_MARK, SDHID1_3_MARK,
 };
 static const unsigned int sdhi1_ctrl_pins[] = {
@@ -2753,18 +2739,11 @@ static const unsigned int sdhi1_ctrl_mux[] = {
 	SDHICMD1_MARK, SDHICLK1_MARK,
 };
 /* - SDHI2 ------------------------------------------------------------------ */
-static const unsigned int sdhi2_data1_pins[] = {
-	/* D0 */
-	265,
-};
-static const unsigned int sdhi2_data1_mux[] = {
-	SDHID2_0_MARK,
-};
-static const unsigned int sdhi2_data4_pins[] = {
+static const unsigned int sdhi2_data_pins[] = {
 	/* D[0:3] */
 	265, 266, 267, 268,
 };
-static const unsigned int sdhi2_data4_mux[] = {
+static const unsigned int sdhi2_data_mux[] = {
 	SDHID2_0_MARK, SDHID2_1_MARK, SDHID2_2_MARK, SDHID2_3_MARK,
 };
 static const unsigned int sdhi2_ctrl_pins[] = {
@@ -3124,16 +3103,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
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
-	SH_PFC_PIN_GROUP(sdhi2_data1),
-	SH_PFC_PIN_GROUP(sdhi2_data4),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 1),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 4),
 	SH_PFC_PIN_GROUP(sdhi2_ctrl),
 	SH_PFC_PIN_GROUP(tpu0_to0),
 	SH_PFC_PIN_GROUP(tpu0_to1),
-- 
2.25.1

