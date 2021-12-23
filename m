Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856DF47E4E0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243918AbhLWOma (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348928AbhLWOmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:18 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7FDC061373
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:17 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by xavier.telenet-ops.be with bizsmtp
        id ZqiF2600F1rdBcm01qiFd7; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006aAi-T7; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rf7-0Q; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 38/60] pinctrl: renesas: r8a77980: Share RPC pin group data
Date:   Thu, 23 Dec 2021 15:41:48 +0100
Message-Id: <6da6ef4184939a0793ca5fd805e9f6bc6c07a095.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-r8a77980.c | 54 ++++----------------------
 1 file changed, 8 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index 72e2ceaf7e664a08..df15d9a2007e4828 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -1671,22 +1671,6 @@ static const unsigned int qspi0_ctrl_pins[] = {
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
@@ -1696,36 +1680,14 @@ static const unsigned int qspi1_ctrl_pins[] = {
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
@@ -2174,13 +2136,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
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

