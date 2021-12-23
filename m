Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BD647E4C4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348890AbhLWOmZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348901AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4F1C0613A1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by andre.telenet-ops.be with bizsmtp
        id ZqiE260051rdBcm01qiEPg; Thu, 23 Dec 2021 15:42:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9M-5u; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003raX-BG; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 20/60] pinctrl: renesas: r8a7794: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:30 +0100
Message-Id: <ebeda8834f00ff07799cd6dc36aebae17f378e31.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-r8a7794.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index b70f45a2e3e455f1..3f0c7cba2de4f8b3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -2388,29 +2388,14 @@ static const unsigned int intc_irq9_mux[] = {
 	IRQ9_MARK,
 };
 /* - MMCIF ------------------------------------------------------------------ */
-static const unsigned int mmc_data1_pins[] = {
-	/* D[0] */
-	RCAR_GP_PIN(6, 18),
-};
-static const unsigned int mmc_data1_mux[] = {
-	MMC_D0_MARK,
-};
-static const unsigned int mmc_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
-	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
-};
-static const unsigned int mmc_data4_mux[] = {
-	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
-};
-static const unsigned int mmc_data8_pins[] = {
+static const unsigned int mmc_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
 	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
 	RCAR_GP_PIN(6, 22), RCAR_GP_PIN(6, 23),
 	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
 };
-static const unsigned int mmc_data8_mux[] = {
+static const unsigned int mmc_data_mux[] = {
 	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
 	MMC_D4_MARK, MMC_D5_MARK, MMC_D6_MARK, MMC_D7_MARK,
 };
@@ -3915,9 +3900,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(intc_irq7),
 	SH_PFC_PIN_GROUP(intc_irq8),
 	SH_PFC_PIN_GROUP(intc_irq9),
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

