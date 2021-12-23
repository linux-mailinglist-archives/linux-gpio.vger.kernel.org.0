Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F7447E50F
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348954AbhLWOmm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:42 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:45230 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348949AbhLWOmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:23 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4JKXw76h0GzMqqJ3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 15:42:15 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqiF2600f4C55Sk01qiFNZ; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006a9P-Rd; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rae-CF; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 21/60] pinctrl: renesas: r8a77970: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:31 +0100
Message-Id: <9354645f58c12a275923046fe913cfc9602ca710.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-r8a77970.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index 35370d2d2c7269fb..c842a9b2bf25e9b7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -1102,30 +1102,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
 };
 
 /* - MMC -------------------------------------------------------------------- */
-static const unsigned int mmc_data1_pins[] = {
-	/* D0 */
-	RCAR_GP_PIN(3, 6),
-};
-static const unsigned int mmc_data1_mux[] = {
-	MMC_D0_MARK,
-};
-static const unsigned int mmc_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
-	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
-};
-static const unsigned int mmc_data4_mux[] = {
-	MMC_D0_MARK, MMC_D1_MARK,
-	MMC_D2_MARK, MMC_D3_MARK,
-};
-static const unsigned int mmc_data8_pins[] = {
+static const unsigned int mmc_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
 	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
 	RCAR_GP_PIN(3, 11), RCAR_GP_PIN(3, 12),
 	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 14),
 };
-static const unsigned int mmc_data8_mux[] = {
+static const unsigned int mmc_data_mux[] = {
 	MMC_D0_MARK, MMC_D1_MARK,
 	MMC_D2_MARK, MMC_D3_MARK,
 	MMC_D4_MARK, MMC_D5_MARK,
@@ -1775,9 +1759,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(intc_ex_irq3),
 	SH_PFC_PIN_GROUP(intc_ex_irq4),
 	SH_PFC_PIN_GROUP(intc_ex_irq5),
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

