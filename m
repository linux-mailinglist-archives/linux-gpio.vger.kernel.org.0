Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5F847E4C2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348879AbhLWOmZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348898AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D96DC06139E
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by michel.telenet-ops.be with bizsmtp
        id ZqiD260081rdBcm06qiDaj; Thu, 23 Dec 2021 15:42:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a91-QB; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rb3-FL; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 24/60] pinctrl: renesas: r8a779a0: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:34 +0100
Message-Id: <cae71e970dbf49409673c2a7e2a74d549539a240.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 81c0baea36f19ca1..161f5e09163a26a3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -2009,30 +2009,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
 };
 
 /* - MMC -------------------------------------------------------------------- */
-static const unsigned int mmc_data1_pins[] = {
-	/* MMC_SD_D0 */
-	RCAR_GP_PIN(0, 19),
-};
-static const unsigned int mmc_data1_mux[] = {
-	MMC_SD_D0_MARK,
-};
-static const unsigned int mmc_data4_pins[] = {
-	/* MMC_SD_D[0:3] */
-	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20),
-	RCAR_GP_PIN(0, 21), RCAR_GP_PIN(0, 22),
-};
-static const unsigned int mmc_data4_mux[] = {
-	MMC_SD_D0_MARK, MMC_SD_D1_MARK,
-	MMC_SD_D2_MARK, MMC_SD_D3_MARK,
-};
-static const unsigned int mmc_data8_pins[] = {
+static const unsigned int mmc_data_pins[] = {
 	/* MMC_SD_D[0:3], MMC_D[4:7] */
 	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20),
 	RCAR_GP_PIN(0, 21), RCAR_GP_PIN(0, 22),
 	RCAR_GP_PIN(0, 24), RCAR_GP_PIN(0, 25),
 	RCAR_GP_PIN(0, 26), RCAR_GP_PIN(0, 27),
 };
-static const unsigned int mmc_data8_mux[] = {
+static const unsigned int mmc_data_mux[] = {
 	MMC_SD_D0_MARK, MMC_SD_D1_MARK,
 	MMC_SD_D2_MARK, MMC_SD_D3_MARK,
 	MMC_D4_MARK, MMC_D5_MARK,
@@ -2715,9 +2699,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(intc_ex_irq4),
 	SH_PFC_PIN_GROUP(intc_ex_irq5),
 
-	SH_PFC_PIN_GROUP(mmc_data1),
-	SH_PFC_PIN_GROUP(mmc_data4),
-	SH_PFC_PIN_GROUP(mmc_data8),
+	BUS_DATA_PIN_GROUP(mmc_data, 1),
+	BUS_DATA_PIN_GROUP(mmc_data, 4),
+	BUS_DATA_PIN_GROUP(mmc_data, 8),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
 	SH_PFC_PIN_GROUP(mmc_cd),
 	SH_PFC_PIN_GROUP(mmc_wp),
-- 
2.25.1

