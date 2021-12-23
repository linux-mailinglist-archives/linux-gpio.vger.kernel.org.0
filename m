Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A30F47E4BB
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348884AbhLWOmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348891AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEEAC061757
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id ZqiF2600F4C55Sk06qiFqn; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006a9I-IX; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003raF-9A; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 18/60] pinctrl: renesas: r8a7790: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:28 +0100
Message-Id: <0990a63016ab87d16c19097bc43d79595c0c8b87.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-r8a7790.c | 50 ++++++---------------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 44aad3b80bbc19e6..6f7e710b393a259e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -2405,29 +2405,14 @@ static const unsigned int mlb_3pin_mux[] = {
 #endif /* CONFIG_PINCTRL_PFC_R8A7790 */
 
 /* - MMCIF0 ----------------------------------------------------------------- */
-static const unsigned int mmc0_data1_pins[] = {
-	/* D[0] */
-	RCAR_GP_PIN(3, 18),
-};
-static const unsigned int mmc0_data1_mux[] = {
-	MMC0_D0_MARK,
-};
-static const unsigned int mmc0_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(3, 18), RCAR_GP_PIN(3, 19),
-	RCAR_GP_PIN(3, 20), RCAR_GP_PIN(3, 21),
-};
-static const unsigned int mmc0_data4_mux[] = {
-	MMC0_D0_MARK, MMC0_D1_MARK, MMC0_D2_MARK, MMC0_D3_MARK,
-};
-static const unsigned int mmc0_data8_pins[] = {
+static const unsigned int mmc0_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(3, 18), RCAR_GP_PIN(3, 19),
 	RCAR_GP_PIN(3, 20), RCAR_GP_PIN(3, 21),
 	RCAR_GP_PIN(3, 22), RCAR_GP_PIN(3, 23),
 	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
 };
-static const unsigned int mmc0_data8_mux[] = {
+static const unsigned int mmc0_data_mux[] = {
 	MMC0_D0_MARK, MMC0_D1_MARK, MMC0_D2_MARK, MMC0_D3_MARK,
 	MMC0_D4_MARK, MMC0_D5_MARK, MMC0_D6_MARK, MMC0_D7_MARK,
 };
@@ -2439,29 +2424,14 @@ static const unsigned int mmc0_ctrl_mux[] = {
 	MMC0_CLK_MARK, MMC0_CMD_MARK,
 };
 /* - MMCIF1 ----------------------------------------------------------------- */
-static const unsigned int mmc1_data1_pins[] = {
-	/* D[0] */
-	RCAR_GP_PIN(3, 26),
-};
-static const unsigned int mmc1_data1_mux[] = {
-	MMC1_D0_MARK,
-};
-static const unsigned int mmc1_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(3, 26), RCAR_GP_PIN(3, 27),
-	RCAR_GP_PIN(3, 28), RCAR_GP_PIN(3, 29),
-};
-static const unsigned int mmc1_data4_mux[] = {
-	MMC1_D0_MARK, MMC1_D1_MARK, MMC1_D2_MARK, MMC1_D3_MARK,
-};
-static const unsigned int mmc1_data8_pins[] = {
+static const unsigned int mmc1_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(3, 26), RCAR_GP_PIN(3, 27),
 	RCAR_GP_PIN(3, 28), RCAR_GP_PIN(3, 29),
 	RCAR_GP_PIN(3, 30), RCAR_GP_PIN(3, 31),
 	RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15),
 };
-static const unsigned int mmc1_data8_mux[] = {
+static const unsigned int mmc1_data_mux[] = {
 	MMC1_D0_MARK, MMC1_D1_MARK, MMC1_D2_MARK, MMC1_D3_MARK,
 	MMC1_D4_MARK, MMC1_D5_MARK, MMC1_D6_MARK, MMC1_D7_MARK,
 };
@@ -4202,13 +4172,13 @@ static const struct {
 		SH_PFC_PIN_GROUP(intc_irq1),
 		SH_PFC_PIN_GROUP(intc_irq2),
 		SH_PFC_PIN_GROUP(intc_irq3),
-		SH_PFC_PIN_GROUP(mmc0_data1),
-		SH_PFC_PIN_GROUP(mmc0_data4),
-		SH_PFC_PIN_GROUP(mmc0_data8),
+		BUS_DATA_PIN_GROUP(mmc0_data, 1),
+		BUS_DATA_PIN_GROUP(mmc0_data, 4),
+		BUS_DATA_PIN_GROUP(mmc0_data, 8),
 		SH_PFC_PIN_GROUP(mmc0_ctrl),
-		SH_PFC_PIN_GROUP(mmc1_data1),
-		SH_PFC_PIN_GROUP(mmc1_data4),
-		SH_PFC_PIN_GROUP(mmc1_data8),
+		BUS_DATA_PIN_GROUP(mmc1_data, 1),
+		BUS_DATA_PIN_GROUP(mmc1_data, 4),
+		BUS_DATA_PIN_GROUP(mmc1_data, 8),
 		SH_PFC_PIN_GROUP(mmc1_ctrl),
 		SH_PFC_PIN_GROUP(msiof0_clk),
 		SH_PFC_PIN_GROUP(msiof0_sync),
-- 
2.25.1

