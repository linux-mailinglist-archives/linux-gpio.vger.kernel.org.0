Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FFB47E507
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348956AbhLWOmj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348963AbhLWOmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:20 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672E6C06139E
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id ZqiF2600C4C55Sk06qiFbZ; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006a9t-3D; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rbZ-Kc; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 28/60] pinctrl: renesas: r8a7791: Share QSPI pin group data
Date:   Thu, 23 Dec 2021 15:41:38 +0100
Message-Id: <fbfd27a143e87fdb94acec2e3fa8db9029e2c99c.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups qspi_data2{,_b} are subsets of qspi_data4{,_b}.

This reduces kernel size by 32 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7791.c | 30 +++++++--------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index 38900f07738a878f..30193108c6805456 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -3198,19 +3198,12 @@ static const unsigned int qspi_ctrl_pins[] = {
 static const unsigned int qspi_ctrl_mux[] = {
 	SPCLK_MARK, SSL_MARK,
 };
-static const unsigned int qspi_data2_pins[] = {
-	/* MOSI_IO0, MISO_IO1 */
-	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
-};
-static const unsigned int qspi_data2_mux[] = {
-	MOSI_IO0_MARK, MISO_IO1_MARK,
-};
-static const unsigned int qspi_data4_pins[] = {
+static const unsigned int qspi_data_pins[] = {
 	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
 	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
 	RCAR_GP_PIN(1, 8),
 };
-static const unsigned int qspi_data4_mux[] = {
+static const unsigned int qspi_data_mux[] = {
 	MOSI_IO0_MARK, MISO_IO1_MARK, IO2_MARK, IO3_MARK,
 };
 
@@ -3221,19 +3214,12 @@ static const unsigned int qspi_ctrl_b_pins[] = {
 static const unsigned int qspi_ctrl_b_mux[] = {
 	SPCLK_B_MARK, SSL_B_MARK,
 };
-static const unsigned int qspi_data2_b_pins[] = {
-	/* MOSI_IO0, MISO_IO1 */
-	RCAR_GP_PIN(6, 1), RCAR_GP_PIN(6, 2),
-};
-static const unsigned int qspi_data2_b_mux[] = {
-	MOSI_IO0_B_MARK, MISO_IO1_B_MARK,
-};
-static const unsigned int qspi_data4_b_pins[] = {
+static const unsigned int qspi_data_b_pins[] = {
 	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
 	RCAR_GP_PIN(6, 1), RCAR_GP_PIN(6, 2), RCAR_GP_PIN(6, 3),
 	RCAR_GP_PIN(6, 4),
 };
-static const unsigned int qspi_data4_b_mux[] = {
+static const unsigned int qspi_data_b_mux[] = {
 	MOSI_IO0_B_MARK, MISO_IO1_B_MARK, IO2_B_MARK, IO3_B_MARK,
 };
 /* - SCIF0 ------------------------------------------------------------------ */
@@ -4648,11 +4634,11 @@ static const struct {
 		SH_PFC_PIN_GROUP(pwm5_b),
 		SH_PFC_PIN_GROUP(pwm6),
 		SH_PFC_PIN_GROUP(qspi_ctrl),
-		SH_PFC_PIN_GROUP(qspi_data2),
-		SH_PFC_PIN_GROUP(qspi_data4),
+		BUS_DATA_PIN_GROUP(qspi_data, 2),
+		BUS_DATA_PIN_GROUP(qspi_data, 4),
 		SH_PFC_PIN_GROUP(qspi_ctrl_b),
-		SH_PFC_PIN_GROUP(qspi_data2_b),
-		SH_PFC_PIN_GROUP(qspi_data4_b),
+		BUS_DATA_PIN_GROUP(qspi_data, 2, _b),
+		BUS_DATA_PIN_GROUP(qspi_data, 4, _b),
 		SH_PFC_PIN_GROUP(scif0_data),
 		SH_PFC_PIN_GROUP(scif0_data_b),
 		SH_PFC_PIN_GROUP(scif0_data_c),
-- 
2.25.1

