Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1920847E4CA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348898AbhLWOm0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348906AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A25C061759
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqiE2600G1rdBcm01qiEMo; Thu, 23 Dec 2021 15:42:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9H-7V; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003ra8-8R; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 17/60] pinctrl: renesas: r8a7779: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:27 +0100
Message-Id: <3484b3cd6b4ca19788fafc01f5ead4e067275e8d.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups mmc[01]_data[14] are subsets of mmc[01]_data8.

This reduces kernel size by 80 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7779.c | 50 ++++++---------------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7779.c b/drivers/pinctrl/renesas/pfc-r8a7779.c
index 3e47cdc1411d507f..98fe20b6dabaec8c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7779.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7779.c
@@ -1928,28 +1928,13 @@ static const unsigned int lbsc_ex_cs5_mux[] = {
 	EX_CS5_MARK,
 };
 /* - MMCIF ------------------------------------------------------------------ */
-static const unsigned int mmc0_data1_pins[] = {
-	/* D[0] */
-	RCAR_GP_PIN(0, 19),
-};
-static const unsigned int mmc0_data1_mux[] = {
-	MMC0_D0_MARK,
-};
-static const unsigned int mmc0_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20), RCAR_GP_PIN(0, 21),
-	RCAR_GP_PIN(0, 2),
-};
-static const unsigned int mmc0_data4_mux[] = {
-	MMC0_D0_MARK, MMC0_D1_MARK, MMC0_D2_MARK, MMC0_D3_MARK,
-};
-static const unsigned int mmc0_data8_pins[] = {
+static const unsigned int mmc0_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20), RCAR_GP_PIN(0, 21),
 	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
 	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 16),
 };
-static const unsigned int mmc0_data8_mux[] = {
+static const unsigned int mmc0_data_mux[] = {
 	MMC0_D0_MARK, MMC0_D1_MARK, MMC0_D2_MARK, MMC0_D3_MARK,
 	MMC0_D4_MARK, MMC0_D5_MARK, MMC0_D6_MARK, MMC0_D7_MARK,
 };
@@ -1960,28 +1945,13 @@ static const unsigned int mmc0_ctrl_pins[] = {
 static const unsigned int mmc0_ctrl_mux[] = {
 	MMC0_CMD_MARK, MMC0_CLK_MARK,
 };
-static const unsigned int mmc1_data1_pins[] = {
-	/* D[0] */
-	RCAR_GP_PIN(2, 8),
-};
-static const unsigned int mmc1_data1_mux[] = {
-	MMC1_D0_MARK,
-};
-static const unsigned int mmc1_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
-	RCAR_GP_PIN(2, 11),
-};
-static const unsigned int mmc1_data4_mux[] = {
-	MMC1_D0_MARK, MMC1_D1_MARK, MMC1_D2_MARK, MMC1_D3_MARK,
-};
-static const unsigned int mmc1_data8_pins[] = {
+static const unsigned int mmc1_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),  RCAR_GP_PIN(2, 10),
 	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
 	RCAR_GP_PIN(2, 16), RCAR_GP_PIN(2, 17),
 };
-static const unsigned int mmc1_data8_mux[] = {
+static const unsigned int mmc1_data_mux[] = {
 	MMC1_D0_MARK, MMC1_D1_MARK, MMC1_D2_MARK, MMC1_D3_MARK,
 	MMC1_D4_MARK, MMC1_D5_MARK, MMC1_D6_MARK, MMC1_D7_MARK,
 };
@@ -2749,13 +2719,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(lbsc_ex_cs3),
 	SH_PFC_PIN_GROUP(lbsc_ex_cs4),
 	SH_PFC_PIN_GROUP(lbsc_ex_cs5),
-	SH_PFC_PIN_GROUP(mmc0_data1),
-	SH_PFC_PIN_GROUP(mmc0_data4),
-	SH_PFC_PIN_GROUP(mmc0_data8),
+	BUS_DATA_PIN_GROUP(mmc0_data, 1),
+	BUS_DATA_PIN_GROUP(mmc0_data, 4),
+	BUS_DATA_PIN_GROUP(mmc0_data, 8),
 	SH_PFC_PIN_GROUP(mmc0_ctrl),
-	SH_PFC_PIN_GROUP(mmc1_data1),
-	SH_PFC_PIN_GROUP(mmc1_data4),
-	SH_PFC_PIN_GROUP(mmc1_data8),
+	BUS_DATA_PIN_GROUP(mmc1_data, 1),
+	BUS_DATA_PIN_GROUP(mmc1_data, 4),
+	BUS_DATA_PIN_GROUP(mmc1_data, 8),
 	SH_PFC_PIN_GROUP(mmc1_ctrl),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
-- 
2.25.1

