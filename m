Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A0347E50E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348964AbhLWOmk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:40 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:45228 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348944AbhLWOmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:23 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4JKXw76CVzzMqqHj
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 15:42:15 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id ZqiF2600t4C55Sk01qiFQd; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006aAd-Kq; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rew-VB; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 37/60] pinctrl: renesas: r8a77970: Share RPC pin group data
Date:   Thu, 23 Dec 2021 15:41:47 +0100
Message-Id: <a71da3daa818a33c1e81bff07d643d3f30ff1b7d.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups qspi[01]_data[24] are subsets of rpc_data.
Pin group rpc_clk1 is a subset of rpc_clk2.

This reduces kernel size by 104 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77970.c | 54 ++++----------------------
 1 file changed, 8 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index c842a9b2bf25e9b7..bcbd5904451d2b79 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -1377,22 +1377,6 @@ static const unsigned int qspi0_ctrl_pins[] = {
 static const unsigned int qspi0_ctrl_mux[] = {
 	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
 };
-static const unsigned int qspi0_data2_pins[] = {
-	/* MOSI_IO0, MISO_IO1 */
-	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
-};
-static const unsigned int qspi0_data2_mux[] = {
-	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
-};
-static const unsigned int qspi0_data4_pins[] = {
-	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
-	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
-	RCAR_GP_PIN(5, 3), RCAR_GP_PIN(5, 4),
-};
-static const unsigned int qspi0_data4_mux[] = {
-	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
-	QSPI0_IO2_MARK, QSPI0_IO3_MARK
-};
 
 /* - QSPI1 ------------------------------------------------------------------ */
 static const unsigned int qspi1_ctrl_pins[] = {
@@ -1402,36 +1386,14 @@ static const unsigned int qspi1_ctrl_pins[] = {
 static const unsigned int qspi1_ctrl_mux[] = {
 	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
 };
-static const unsigned int qspi1_data2_pins[] = {
-	/* MOSI_IO0, MISO_IO1 */
-	RCAR_GP_PIN(5, 7), RCAR_GP_PIN(5, 8),
-};
-static const unsigned int qspi1_data2_mux[] = {
-	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
-};
-static const unsigned int qspi1_data4_pins[] = {
-	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
-	RCAR_GP_PIN(5, 7), RCAR_GP_PIN(5, 8),
-	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 10),
-};
-static const unsigned int qspi1_data4_mux[] = {
-	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
-	QSPI1_IO2_MARK, QSPI1_IO3_MARK
-};
 
 /* - RPC -------------------------------------------------------------------- */
-static const unsigned int rpc_clk1_pins[] = {
+static const unsigned int rpc_clk_pins[] = {
 	/* Octal-SPI flash: C/SCLK */
-	RCAR_GP_PIN(5, 0),
-};
-static const unsigned int rpc_clk1_mux[] = {
-	QSPI0_SPCLK_MARK,
-};
-static const unsigned int rpc_clk2_pins[] = {
 	/* HyperFlash: CK, CK# */
 	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 6),
 };
-static const unsigned int rpc_clk2_mux[] = {
+static const unsigned int rpc_clk_mux[] = {
 	QSPI0_SPCLK_MARK, QSPI1_SPCLK_MARK,
 };
 static const unsigned int rpc_ctrl_pins[] = {
@@ -1798,13 +1760,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(pwm4_a),
 	SH_PFC_PIN_GROUP(pwm4_b),
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
-	SH_PFC_PIN_GROUP(qspi0_data2),
-	SH_PFC_PIN_GROUP(qspi0_data4),
+	SH_PFC_PIN_GROUP_SUBSET(qspi0_data2, rpc_data, 0, 2),
+	SH_PFC_PIN_GROUP_SUBSET(qspi0_data4, rpc_data, 0, 4),
 	SH_PFC_PIN_GROUP(qspi1_ctrl),
-	SH_PFC_PIN_GROUP(qspi1_data2),
-	SH_PFC_PIN_GROUP(qspi1_data4),
-	SH_PFC_PIN_GROUP(rpc_clk1),
-	SH_PFC_PIN_GROUP(rpc_clk2),
+	SH_PFC_PIN_GROUP_SUBSET(qspi1_data2, rpc_data, 4, 2),
+	SH_PFC_PIN_GROUP_SUBSET(qspi1_data4, rpc_data, 4, 4),
+	BUS_DATA_PIN_GROUP(rpc_clk, 1),
+	BUS_DATA_PIN_GROUP(rpc_clk, 2),
 	SH_PFC_PIN_GROUP(rpc_ctrl),
 	SH_PFC_PIN_GROUP(rpc_data),
 	SH_PFC_PIN_GROUP(rpc_reset),
-- 
2.25.1

