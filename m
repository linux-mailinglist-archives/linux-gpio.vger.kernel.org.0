Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4014EAABC
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 11:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbiC2Juk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 05:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233341AbiC2Juk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 05:50:40 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8535933E22
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 02:48:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by xavier.telenet-ops.be with bizsmtp
        id C9ov2700X49QC44019ovfT; Tue, 29 Mar 2022 11:48:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8T9-007EoC-J8; Tue, 29 Mar 2022 11:48:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8T8-00CCDZ-JV; Tue, 29 Mar 2022 11:48:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: renesas: r8a77990: Add RPC pins, groups, and functions
Date:   Tue, 29 Mar 2022 11:48:50 +0200
Message-Id: <ec9735bb3468225e04ac6cb95e11a0e237b2b9ed.1648547080.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648547080.git.geert+renesas@glider.be>
References: <cover.1648547080.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups, and functions for the SPI Multi I/O Bus Controller
(RPC-IF) to the R8A77990 PFC driver.  They are to be used when an
Octal-SPI Flash or HyperFlash is connected.

Redefine the QSPI[01] pin groups using the RPC DQ[0:7] pin data, to save
memory.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77990.c | 81 +++++++++++++++++++-------
 1 file changed, 61 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 6c4ba9e16058ff22..c9e995ed44b49127 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -2827,16 +2827,6 @@ static const unsigned int qspi0_ctrl_pins[] = {
 static const unsigned int qspi0_ctrl_mux[] = {
 	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
 };
-static const unsigned int qspi0_data_pins[] = {
-	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
-	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
-	/* QSPI0_IO2, QSPI0_IO3 */
-	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
-};
-static const unsigned int qspi0_data_mux[] = {
-	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
-	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
-};
 /* - QSPI1 ------------------------------------------------------------------ */
 static const unsigned int qspi1_ctrl_pins[] = {
 	/* QSPI1_SPCLK, QSPI1_SSL */
@@ -2845,16 +2835,51 @@ static const unsigned int qspi1_ctrl_pins[] = {
 static const unsigned int qspi1_ctrl_mux[] = {
 	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
 };
-static const unsigned int qspi1_data_pins[] = {
-	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
+
+/* - RPC -------------------------------------------------------------------- */
+static const unsigned int rpc_clk_pins[] = {
+	/* Octal-SPI flash: C/SCLK */
+	/* HyperFlash: CK, CK# */
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 6),
+};
+static const unsigned int rpc_clk_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI1_SPCLK_MARK,
+};
+static const unsigned int rpc_ctrl_pins[] = {
+	/* Octal-SPI flash: S#/CS, DQS */
+	/* HyperFlash: CS#, RDS */
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 11),
+};
+static const unsigned int rpc_ctrl_mux[] = {
+	QSPI0_SSL_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int rpc_data_pins[] = {
+	/* DQ[0:7] */
+	RCAR_GP_PIN(2, 1), RCAR_GP_PIN(2, 2),
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 4),
 	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8),
-	/* QSPI1_IO2, QSPI1_IO3 */
 	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 10),
 };
-static const unsigned int qspi1_data_mux[] = {
+static const unsigned int rpc_data_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
 	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
 	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
 };
+static const unsigned int rpc_reset_pins[] = {
+	/* RPC_RESET# */
+	RCAR_GP_PIN(2, 13),
+};
+static const unsigned int rpc_reset_mux[] = {
+	RPC_RESET_N_MARK,
+};
+static const unsigned int rpc_int_pins[] = {
+	/* RPC_INT# */
+	RCAR_GP_PIN(2, 12),
+};
+static const unsigned int rpc_int_mux[] = {
+	RPC_INT_N_MARK,
+};
 
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_a_pins[] = {
@@ -3758,7 +3783,7 @@ static const unsigned int vin5_clk_b_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[255];
+	struct sh_pfc_pin_group common[261];
 #ifdef CONFIG_PINCTRL_PFC_R8A77990
 	struct sh_pfc_pin_group automotive[22];
 #endif
@@ -3907,11 +3932,17 @@ static const struct {
 		SH_PFC_PIN_GROUP(pwm6_a),
 		SH_PFC_PIN_GROUP(pwm6_b),
 		SH_PFC_PIN_GROUP(qspi0_ctrl),
-		BUS_DATA_PIN_GROUP(qspi0_data, 2),
-		BUS_DATA_PIN_GROUP(qspi0_data, 4),
+		SH_PFC_PIN_GROUP_SUBSET(qspi0_data2, rpc_data, 0, 2),
+		SH_PFC_PIN_GROUP_SUBSET(qspi0_data4, rpc_data, 0, 4),
 		SH_PFC_PIN_GROUP(qspi1_ctrl),
-		BUS_DATA_PIN_GROUP(qspi1_data, 2),
-		BUS_DATA_PIN_GROUP(qspi1_data, 4),
+		SH_PFC_PIN_GROUP_SUBSET(qspi1_data2, rpc_data, 4, 2),
+		SH_PFC_PIN_GROUP_SUBSET(qspi1_data4, rpc_data, 4, 4),
+		BUS_DATA_PIN_GROUP(rpc_clk, 1),
+		BUS_DATA_PIN_GROUP(rpc_clk, 2),
+		SH_PFC_PIN_GROUP(rpc_ctrl),
+		SH_PFC_PIN_GROUP(rpc_data),
+		SH_PFC_PIN_GROUP(rpc_reset),
+		SH_PFC_PIN_GROUP(rpc_int),
 		SH_PFC_PIN_GROUP(scif0_data_a),
 		SH_PFC_PIN_GROUP(scif0_clk_a),
 		SH_PFC_PIN_GROUP(scif0_ctrl_a),
@@ -4336,6 +4367,15 @@ static const char * const qspi1_groups[] = {
 	"qspi1_data4",
 };
 
+static const char * const rpc_groups[] = {
+	"rpc_clk1",
+	"rpc_clk2",
+	"rpc_ctrl",
+	"rpc_data",
+	"rpc_reset",
+	"rpc_int",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data_a",
 	"scif0_clk_a",
@@ -4492,7 +4532,7 @@ static const char * const vin5_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[49];
+	struct sh_pfc_function common[50];
 #ifdef CONFIG_PINCTRL_PFC_R8A77990
 	struct sh_pfc_function automotive[5];
 #endif
@@ -4531,6 +4571,7 @@ static const struct {
 		SH_PFC_FUNCTION(pwm6),
 		SH_PFC_FUNCTION(qspi0),
 		SH_PFC_FUNCTION(qspi1),
+		SH_PFC_FUNCTION(rpc),
 		SH_PFC_FUNCTION(scif0),
 		SH_PFC_FUNCTION(scif1),
 		SH_PFC_FUNCTION(scif2),
-- 
2.25.1

