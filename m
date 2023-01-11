Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5C26655E6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jan 2023 09:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjAKIVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 03:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjAKIVu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 03:21:50 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFDB2738
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 00:21:48 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d992:2e67:38c1:3ab7])
        by andre.telenet-ops.be with bizsmtp
        id 7LMm2900722nSWd01LMmeY; Wed, 11 Jan 2023 09:21:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pFWMi-001YSM-JV;
        Wed, 11 Jan 2023 09:21:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pFWMk-003Bm7-Dz;
        Wed, 11 Jan 2023 09:21:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a77950: Add VIN[45] pins, groups, and functions
Date:   Wed, 11 Jan 2023 09:21:38 +0100
Message-Id: <92c9b3b535d27ea7fcc0aa73d298783d710c214a.1673425207.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups, and functions for channels 4 and 5 of the Video Input
Module (VIN) on the Renesas R-Car H3 ES1.x (R8A77950) SoC, based on
the version for the R-Car H3 ES2.0+ (R8A77951) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
To be queued in renesas-pinctrl for v6.3.
---
 drivers/pinctrl/renesas/pfc-r8a77950.c | 244 +++++++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index 4c543ec3a8639393..cc66c6de045c5299 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -3820,6 +3820,186 @@ static const unsigned int usb31_mux[] = {
 	USB31_PWEN_MARK, USB31_OVC_MARK,
 };
 
+/* - VIN4 ------------------------------------------------------------------- */
+static const unsigned int vin4_data18_a_pins[] = {
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+};
+static const unsigned int vin4_data18_a_mux[] = {
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
+};
+static const unsigned int vin4_data18_b_pins[] = {
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+};
+static const unsigned int vin4_data18_b_mux[] = {
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
+};
+static const unsigned int vin4_data_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+};
+static const unsigned int vin4_data_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
+};
+static const unsigned int vin4_data_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+};
+static const unsigned int vin4_data_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
+};
+static const unsigned int vin4_sync_pins[] = {
+	/* HSYNC#, VSYNC# */
+	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
+};
+static const unsigned int vin4_sync_mux[] = {
+	VI4_HSYNC_N_MARK, VI4_VSYNC_N_MARK,
+};
+static const unsigned int vin4_field_pins[] = {
+	/* FIELD */
+	RCAR_GP_PIN(1, 16),
+};
+static const unsigned int vin4_field_mux[] = {
+	VI4_FIELD_MARK,
+};
+static const unsigned int vin4_clkenb_pins[] = {
+	/* CLKENB */
+	RCAR_GP_PIN(1, 19),
+};
+static const unsigned int vin4_clkenb_mux[] = {
+	VI4_CLKENB_MARK,
+};
+static const unsigned int vin4_clk_pins[] = {
+	/* CLK */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int vin4_clk_mux[] = {
+	VI4_CLK_MARK,
+};
+
+/* - VIN5 ------------------------------------------------------------------- */
+static const unsigned int vin5_data_pins[] = {
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin5_data_mux[] = {
+	VI5_DATA0_MARK, VI5_DATA1_MARK,
+	VI5_DATA2_MARK, VI5_DATA3_MARK,
+	VI5_DATA4_MARK, VI5_DATA5_MARK,
+	VI5_DATA6_MARK, VI5_DATA7_MARK,
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
+};
+static const unsigned int vin5_sync_pins[] = {
+	/* HSYNC#, VSYNC# */
+	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
+};
+static const unsigned int vin5_sync_mux[] = {
+	VI5_HSYNC_N_MARK, VI5_VSYNC_N_MARK,
+};
+static const unsigned int vin5_field_pins[] = {
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int vin5_field_mux[] = {
+	/* FIELD */
+	VI5_FIELD_MARK,
+};
+static const unsigned int vin5_clkenb_pins[] = {
+	RCAR_GP_PIN(1, 20),
+};
+static const unsigned int vin5_clkenb_mux[] = {
+	/* CLKENB */
+	VI5_CLKENB_MARK,
+};
+static const unsigned int vin5_clk_pins[] = {
+	RCAR_GP_PIN(1, 21),
+};
+static const unsigned int vin5_clk_mux[] = {
+	/* CLK */
+	VI5_CLK_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(audio_clk_a_a),
 	SH_PFC_PIN_GROUP(audio_clk_a_b),
@@ -4141,6 +4321,34 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(usb2),
 	SH_PFC_PIN_GROUP(usb30),
 	SH_PFC_PIN_GROUP(usb31),
+	BUS_DATA_PIN_GROUP(vin4_data, 8, _a),
+	BUS_DATA_PIN_GROUP(vin4_data, 10, _a),
+	BUS_DATA_PIN_GROUP(vin4_data, 12, _a),
+	BUS_DATA_PIN_GROUP(vin4_data, 16, _a),
+	SH_PFC_PIN_GROUP(vin4_data18_a),
+	BUS_DATA_PIN_GROUP(vin4_data, 20, _a),
+	BUS_DATA_PIN_GROUP(vin4_data, 24, _a),
+	BUS_DATA_PIN_GROUP(vin4_data, 8, _b),
+	BUS_DATA_PIN_GROUP(vin4_data, 10, _b),
+	BUS_DATA_PIN_GROUP(vin4_data, 12, _b),
+	BUS_DATA_PIN_GROUP(vin4_data, 16, _b),
+	SH_PFC_PIN_GROUP(vin4_data18_b),
+	BUS_DATA_PIN_GROUP(vin4_data, 20, _b),
+	BUS_DATA_PIN_GROUP(vin4_data, 24, _b),
+	SH_PFC_PIN_GROUP_SUBSET(vin4_g8, vin4_data_a, 8, 8),
+	SH_PFC_PIN_GROUP(vin4_sync),
+	SH_PFC_PIN_GROUP(vin4_field),
+	SH_PFC_PIN_GROUP(vin4_clkenb),
+	SH_PFC_PIN_GROUP(vin4_clk),
+	BUS_DATA_PIN_GROUP(vin5_data, 8),
+	BUS_DATA_PIN_GROUP(vin5_data, 10),
+	BUS_DATA_PIN_GROUP(vin5_data, 12),
+	BUS_DATA_PIN_GROUP(vin5_data, 16),
+	SH_PFC_PIN_GROUP_SUBSET(vin5_high8, vin5_data, 8, 8),
+	SH_PFC_PIN_GROUP(vin5_sync),
+	SH_PFC_PIN_GROUP(vin5_field),
+	SH_PFC_PIN_GROUP(vin5_clkenb),
+	SH_PFC_PIN_GROUP(vin5_clk),
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4637,6 +4845,40 @@ static const char * const usb31_groups[] = {
 	"usb31",
 };
 
+static const char * const vin4_groups[] = {
+	"vin4_data8_a",
+	"vin4_data10_a",
+	"vin4_data12_a",
+	"vin4_data16_a",
+	"vin4_data18_a",
+	"vin4_data20_a",
+	"vin4_data24_a",
+	"vin4_data8_b",
+	"vin4_data10_b",
+	"vin4_data12_b",
+	"vin4_data16_b",
+	"vin4_data18_b",
+	"vin4_data20_b",
+	"vin4_data24_b",
+	"vin4_g8",
+	"vin4_sync",
+	"vin4_field",
+	"vin4_clkenb",
+	"vin4_clk",
+};
+
+static const char * const vin5_groups[] = {
+	"vin5_data8",
+	"vin5_data10",
+	"vin5_data12",
+	"vin5_data16",
+	"vin5_high8",
+	"vin5_sync",
+	"vin5_field",
+	"vin5_clkenb",
+	"vin5_clk",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
@@ -4696,6 +4938,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(usb2),
 	SH_PFC_FUNCTION(usb30),
 	SH_PFC_FUNCTION(usb31),
+	SH_PFC_FUNCTION(vin4),
+	SH_PFC_FUNCTION(vin5),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.34.1

