Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36B047E4A1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348887AbhLWOmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348860AbhLWOmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:15 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000FFC06175C
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:14 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by albert.telenet-ops.be with bizsmtp
        id ZqiD2600E1rdBcm06qiDqJ; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a95-Rz; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003raw-EM; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 23/60] pinctrl: renesas: r8a77995: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:33 +0100
Message-Id: <8da25ab2d65c31d9300b59d28b80c326aae9e787.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups mmc_data[14] are subsets of mmc_data8.

This reduces kernel size by 40 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77995.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index b086c7501472afa2..c3106fd040d90ae4 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -1258,30 +1258,14 @@ static const unsigned int i2c3_b_mux[] = {
 };
 
 /* - MMC ------------------------------------------------------------------- */
-static const unsigned int mmc_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 2),
-};
-static const unsigned int mmc_data1_mux[] = {
-	MMC_D0_MARK,
-};
-static const unsigned int mmc_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
-	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
-};
-static const unsigned int mmc_data4_mux[] = {
-	MMC_D0_MARK, MMC_D1_MARK,
-	MMC_D2_MARK, MMC_D3_MARK,
-};
-static const unsigned int mmc_data8_pins[] = {
+static const unsigned int mmc_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
 	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
 	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
 	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
 };
-static const unsigned int mmc_data8_mux[] = {
+static const unsigned int mmc_data_mux[] = {
 	MMC_D0_MARK, MMC_D1_MARK,
 	MMC_D2_MARK, MMC_D3_MARK,
 	MMC_D4_MARK, MMC_D5_MARK,
@@ -2045,9 +2029,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c2_b),
 	SH_PFC_PIN_GROUP(i2c3_a),
 	SH_PFC_PIN_GROUP(i2c3_b),
-	SH_PFC_PIN_GROUP(mmc_data1),
-	SH_PFC_PIN_GROUP(mmc_data4),
-	SH_PFC_PIN_GROUP(mmc_data8),
+	BUS_DATA_PIN_GROUP(mmc_data, 1),
+	BUS_DATA_PIN_GROUP(mmc_data, 4),
+	BUS_DATA_PIN_GROUP(mmc_data, 8),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
 	SH_PFC_PIN_GROUP(msiof0_clk),
 	SH_PFC_PIN_GROUP(msiof0_sync),
-- 
2.25.1

