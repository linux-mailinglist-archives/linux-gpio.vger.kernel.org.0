Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1989B4EAABE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 11:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbiC2Jun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 05:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbiC2Jum (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 05:50:42 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DBE4985BF
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 02:48:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by andre.telenet-ops.be with bizsmtp
        id C9ox2700K49QC44019oxtP; Tue, 29 Mar 2022 11:48:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8TA-007EoM-Qm; Tue, 29 Mar 2022 11:48:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8TA-00CCDk-7E; Tue, 29 Mar 2022 11:48:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] pinctrl: renesas: r8a77995: Add QSPI and RPC pins, groups, and functions
Date:   Tue, 29 Mar 2022 11:48:51 +0200
Message-Id: <19a3bccd0ec830846578a38b4c80dccb195109a0.1648547080.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648547080.git.geert+renesas@glider.be>
References: <cover.1648547080.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups, and functions for the SPI Multi I/O Bus Controller
(RPC-IF) to the R8A77995 PFC driver.  They are to be used when a QSPI
Flash, Octal-SPI Flash, or HyperFlash is connected.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77995.c | 98 ++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 445c903a121acedd..0cdf70dd9dea3c9c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -1682,6 +1682,68 @@ static const unsigned int pwm3_c_mux[] = {
 	PWM3_C_MARK,
 };
 
+/* - QSPI0 ------------------------------------------------------------------ */
+static const unsigned int qspi0_ctrl_pins[] = {
+	/* QSPI0_SPCLK, QSPI0_SSL */
+	RCAR_GP_PIN(6, 0), RCAR_GP_PIN(6, 5),
+};
+static const unsigned int qspi0_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+/* - QSPI1 ------------------------------------------------------------------ */
+static const unsigned int qspi1_ctrl_pins[] = {
+	/* QSPI1_SPCLK, QSPI1_SSL */
+	RCAR_GP_PIN(6, 6), RCAR_GP_PIN(6, 11),
+};
+static const unsigned int qspi1_ctrl_mux[] = {
+	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
+};
+
+/* - RPC -------------------------------------------------------------------- */
+static const unsigned int rpc_clk_pins[] = {
+	/* Octal-SPI flash: C/SCLK */
+	/* HyperFlash: CK, CK# */
+	RCAR_GP_PIN(6, 0), RCAR_GP_PIN(6, 6),
+};
+static const unsigned int rpc_clk_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI1_SPCLK_MARK,
+};
+static const unsigned int rpc_ctrl_pins[] = {
+	/* Octal-SPI flash: S#/CS, DQS */
+	/* HyperFlash: CS#, RDS */
+	RCAR_GP_PIN(6, 5), RCAR_GP_PIN(6, 11),
+};
+static const unsigned int rpc_ctrl_mux[] = {
+	QSPI0_SSL_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int rpc_data_pins[] = {
+	/* DQ[0:7] */
+	RCAR_GP_PIN(6, 1), RCAR_GP_PIN(6, 2),
+	RCAR_GP_PIN(6, 3), RCAR_GP_PIN(6, 4),
+	RCAR_GP_PIN(6, 7), RCAR_GP_PIN(6, 8),
+	RCAR_GP_PIN(6, 9), RCAR_GP_PIN(6, 10),
+};
+static const unsigned int rpc_data_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
+};
+static const unsigned int rpc_reset_pins[] = {
+	/* RPC_RESET# */
+	RCAR_GP_PIN(6, 12),
+};
+static const unsigned int rpc_reset_mux[] = {
+	RPC_RESET_N_MARK,
+};
+static const unsigned int rpc_int_pins[] = {
+	/* RPC_INT# */
+	RCAR_GP_PIN(6, 13),
+};
+static const unsigned int rpc_int_mux[] = {
+	RPC_INT_N_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_a_pins[] = {
 	/* RX, TX */
@@ -2085,6 +2147,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(pwm3_a),
 	SH_PFC_PIN_GROUP(pwm3_b),
 	SH_PFC_PIN_GROUP(pwm3_c),
+	SH_PFC_PIN_GROUP(qspi0_ctrl),
+	SH_PFC_PIN_GROUP_SUBSET(qspi0_data2, rpc_data, 0, 2),
+	SH_PFC_PIN_GROUP_SUBSET(qspi0_data4, rpc_data, 0, 4),
+	SH_PFC_PIN_GROUP(qspi1_ctrl),
+	SH_PFC_PIN_GROUP_SUBSET(qspi1_data2, rpc_data, 4, 2),
+	SH_PFC_PIN_GROUP_SUBSET(qspi1_data4, rpc_data, 4, 4),
+	BUS_DATA_PIN_GROUP(rpc_clk, 1),
+	BUS_DATA_PIN_GROUP(rpc_clk, 2),
+	SH_PFC_PIN_GROUP(rpc_ctrl),
+	SH_PFC_PIN_GROUP(rpc_data),
+	SH_PFC_PIN_GROUP(rpc_reset),
+	SH_PFC_PIN_GROUP(rpc_int),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_clk_a),
 	SH_PFC_PIN_GROUP(scif0_data_b),
@@ -2277,6 +2351,27 @@ static const char * const pwm3_groups[] = {
 	"pwm3_c",
 };
 
+static const char * const qspi0_groups[] = {
+	"qspi0_ctrl",
+	"qspi0_data2",
+	"qspi0_data4",
+};
+
+static const char * const qspi1_groups[] = {
+	"qspi1_ctrl",
+	"qspi1_data2",
+	"qspi1_data4",
+};
+
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
@@ -2373,6 +2468,9 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(pwm1),
 	SH_PFC_FUNCTION(pwm2),
 	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(qspi0),
+	SH_PFC_FUNCTION(qspi1),
+	SH_PFC_FUNCTION(rpc),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.25.1

