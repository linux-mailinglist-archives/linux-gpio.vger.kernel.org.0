Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FCD47E4EF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348931AbhLWOme (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348956AbhLWOmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:19 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F724C06137F
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id ZqiF2600D4C55Sk06qiFba; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006a9E-2l; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rZu-6r; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 15/60] pinctrl: renesas: r8a77470: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:25 +0100
Message-Id: <e3d19e19f7666dbcefeec351a5096a86348404ae.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups mmc_data[14] and sdhi1_data[14] are subsets of mmc_data8.
Pin group sdhi1_ctrl can be an alias for mmc_ctrl.

This reduces kernel size by 96 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 55 ++++----------------------
 1 file changed, 8 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index d7f9daa3a02e01fe..deaeaa5a467cae46 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -1595,30 +1595,14 @@ static const unsigned int i2c4_e_mux[] = {
 	SCL4_E_MARK, SDA4_E_MARK,
 };
 /* - MMC -------------------------------------------------------------------- */
-static const unsigned int mmc_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(0, 15),
-};
-static const unsigned int mmc_data1_mux[] = {
-	MMC0_D0_SDHI1_D0_MARK,
-};
-static const unsigned int mmc_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 16),
-	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 18),
-};
-static const unsigned int mmc_data4_mux[] = {
-	MMC0_D0_SDHI1_D0_MARK, MMC0_D1_SDHI1_D1_MARK,
-	MMC0_D2_SDHI1_D2_MARK, MMC0_D3_SDHI1_D3_MARK,
-};
-static const unsigned int mmc_data8_pins[] = {
+static const unsigned int mmc_data_pins[] = {
 	/* D[0:3] */
 	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 16),
 	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 18),
 	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20),
 	RCAR_GP_PIN(0, 21), RCAR_GP_PIN(0, 22),
 };
-static const unsigned int mmc_data8_mux[] = {
+static const unsigned int mmc_data_mux[] = {
 	MMC0_D0_SDHI1_D0_MARK, MMC0_D1_SDHI1_D1_MARK,
 	MMC0_D2_SDHI1_D2_MARK, MMC0_D3_SDHI1_D3_MARK,
 	MMC0_D4_MARK, MMC0_D5_MARK,
@@ -1954,29 +1938,6 @@ static const unsigned int sdhi0_wp_mux[] = {
 	SD0_WP_MARK,
 };
 /* - SDHI1 ------------------------------------------------------------------ */
-static const unsigned int sdhi1_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(0, 15),
-};
-static const unsigned int sdhi1_data1_mux[] = {
-	MMC0_D0_SDHI1_D0_MARK,
-};
-static const unsigned int sdhi1_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 16),
-	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 18),
-};
-static const unsigned int sdhi1_data4_mux[] = {
-	MMC0_D0_SDHI1_D0_MARK, MMC0_D1_SDHI1_D1_MARK,
-	MMC0_D2_SDHI1_D2_MARK, MMC0_D3_SDHI1_D3_MARK,
-};
-static const unsigned int sdhi1_ctrl_pins[] = {
-	/* CLK, CMD */
-	RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 14),
-};
-static const unsigned int sdhi1_ctrl_mux[] = {
-	MMC0_CLK_SDHI1_CLK_MARK, MMC0_CMD_SDHI1_CMD_MARK,
-};
 static const unsigned int sdhi1_cd_pins[] = {
 	/* CD */
 	RCAR_GP_PIN(0, 19),
@@ -2235,9 +2196,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c4_c),
 	SH_PFC_PIN_GROUP(i2c4_d),
 	SH_PFC_PIN_GROUP(i2c4_e),
-	SH_PFC_PIN_GROUP(mmc_data1),
-	SH_PFC_PIN_GROUP(mmc_data4),
-	SH_PFC_PIN_GROUP(mmc_data8),
+	BUS_DATA_PIN_GROUP(mmc_data, 1),
+	BUS_DATA_PIN_GROUP(mmc_data, 4),
+	BUS_DATA_PIN_GROUP(mmc_data, 8),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
 	SH_PFC_PIN_GROUP(qspi0_data2),
@@ -2283,9 +2244,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(sdhi0_ctrl),
 	SH_PFC_PIN_GROUP(sdhi0_cd),
 	SH_PFC_PIN_GROUP(sdhi0_wp),
-	SH_PFC_PIN_GROUP(sdhi1_data1),
-	SH_PFC_PIN_GROUP(sdhi1_data4),
-	SH_PFC_PIN_GROUP(sdhi1_ctrl),
+	SH_PFC_PIN_GROUP_SUBSET(sdhi1_data1, mmc_data, 0, 1),
+	SH_PFC_PIN_GROUP_SUBSET(sdhi1_data4, mmc_data, 0, 4),
+	SH_PFC_PIN_GROUP_ALIAS(sdhi1_ctrl, mmc_ctrl),
 	SH_PFC_PIN_GROUP(sdhi1_cd),
 	SH_PFC_PIN_GROUP(sdhi1_wp),
 	SH_PFC_PIN_GROUP(sdhi2_data1),
-- 
2.25.1

