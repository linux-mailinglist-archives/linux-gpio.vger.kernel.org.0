Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3894BE333
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379520AbiBUPpM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:45:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379511AbiBUPo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:44:58 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B8D23BFF
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:43:56 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by baptiste.telenet-ops.be with bizsmtp
        id xrjs2600E3YJRAw01rjsET; Mon, 21 Feb 2022 16:43:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqt-001TU1-Gr; Mon, 21 Feb 2022 16:43:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqs-006Eij-KR; Mon, 21 Feb 2022 16:43:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 12/12] pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions
Date:   Mon, 21 Feb 2022 16:43:47 +0100
Message-Id: <e0a1dc7d2435d28811e3acb361dae050eb3aabc9.1645457792.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645457792.git.geert+renesas@glider.be>
References: <cover.1645457792.git.geert+renesas@glider.be>
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

Add pins, groups, and functions for the Ethernet Time-Sensitive
Networking (TSN) interfaces on the Renesas R-Car S4-8 (R8A779F0) SoC.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.

Changes compared to the BSP:
  - Add B-suffixes to groups that can appear on multiple sets of pins,
  - Add missing A groups.
---
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 288 +++++++++++++++++++++++++
 1 file changed, 288 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index 79377ce951359c1e..7c689be979545eb8 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -1054,6 +1054,222 @@ static const unsigned int scif_clk_mux[] = {
 	SCIF_CLK_MARK,
 };
 
+/* - TSN0 ------------------------------------------------ */
+static const unsigned int tsn0_link_a_pins[] = {
+	/* TSN0_LINK_A */
+	RCAR_GP_PIN(0, 11),
+};
+static const unsigned int tsn0_link_a_mux[] = {
+	TSN0_LINK_A_MARK,
+};
+static const unsigned int tsn0_magic_a_pins[] = {
+	/* TSN0_MAGIC_A */
+	RCAR_GP_PIN(0, 17),
+};
+static const unsigned int tsn0_magic_a_mux[] = {
+	TSN0_MAGIC_A_MARK,
+};
+static const unsigned int tsn0_phy_int_a_pins[] = {
+	/* TSN0_PHY_INT_A */
+	RCAR_GP_PIN(0, 18),
+};
+static const unsigned int tsn0_phy_int_a_mux[] = {
+	TSN0_PHY_INT_A_MARK,
+};
+static const unsigned int tsn0_mdio_a_pins[] = {
+	/* TSN0_MDC_A, TSN0_MDIO_A */
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+};
+static const unsigned int tsn0_mdio_a_mux[] = {
+	TSN0_MDC_A_MARK, TSN0_MDIO_A_MARK,
+};
+static const unsigned int tsn0_link_b_pins[] = {
+	/* TSN0_LINK_B */
+	RCAR_GP_PIN(3, 8),
+};
+static const unsigned int tsn0_link_b_mux[] = {
+	TSN0_LINK_B_MARK,
+};
+static const unsigned int tsn0_magic_b_pins[] = {
+	/* TSN0_MAGIC_B */
+	RCAR_GP_PIN(3, 12),
+};
+static const unsigned int tsn0_magic_b_mux[] = {
+	TSN0_MAGIC_B_MARK,
+};
+static const unsigned int tsn0_phy_int_b_pins[] = {
+	/* TSN0_PHY_INT_B */
+	RCAR_GP_PIN(3, 10),
+};
+static const unsigned int tsn0_phy_int_b_mux[] = {
+	TSN0_PHY_INT_B_MARK,
+};
+static const unsigned int tsn0_mdio_b_pins[] = {
+	/* TSN0_MDC_B, TSN0_MDIO_B */
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 2),
+};
+static const unsigned int tsn0_mdio_b_mux[] = {
+	TSN0_MDC_B_MARK, TSN0_MDIO_B_MARK,
+};
+static const unsigned int tsn0_avtp_pps_pins[] = {
+	/* TSN0_AVTP_PPS */
+	RCAR_GP_PIN(3, 16),
+};
+static const unsigned int tsn0_avtp_pps_mux[] = {
+	TSN0_AVTP_PPS_MARK,
+};
+static const unsigned int tsn0_avtp_capture_a_pins[] = {
+	/* TSN0_AVTP_CAPTURE_A */
+	RCAR_GP_PIN(0, 1),
+};
+static const unsigned int tsn0_avtp_capture_a_mux[] = {
+	TSN0_AVTP_CAPTURE_A_MARK,
+};
+static const unsigned int tsn0_avtp_match_a_pins[] = {
+	/* TSN0_AVTP_MATCH_A */
+	RCAR_GP_PIN(0, 2),
+};
+static const unsigned int tsn0_avtp_match_a_mux[] = {
+	TSN0_AVTP_MATCH_A_MARK,
+};
+static const unsigned int tsn0_avtp_capture_b_pins[] = {
+	/* TSN0_AVTP_CAPTURE_B */
+	RCAR_GP_PIN(3, 18),
+};
+static const unsigned int tsn0_avtp_capture_b_mux[] = {
+	TSN0_AVTP_CAPTURE_B_MARK,
+};
+static const unsigned int tsn0_avtp_match_b_pins[] = {
+	/* TSN0_AVTP_MATCH_B */
+	RCAR_GP_PIN(3, 17),
+};
+static const unsigned int tsn0_avtp_match_b_mux[] = {
+	TSN0_AVTP_MATCH_B_MARK,
+};
+
+/* - TSN1 ------------------------------------------------ */
+static const unsigned int tsn1_link_a_pins[] = {
+	/* TSN1_LINK_A */
+	RCAR_GP_PIN(0, 15),
+};
+static const unsigned int tsn1_link_a_mux[] = {
+	TSN1_LINK_A_MARK,
+};
+static const unsigned int tsn1_phy_int_a_pins[] = {
+	/* TSN1_PHY_INT_A */
+	RCAR_GP_PIN(0, 19),
+};
+static const unsigned int tsn1_phy_int_a_mux[] = {
+	TSN1_PHY_INT_A_MARK,
+};
+static const unsigned int tsn1_mdio_a_pins[] = {
+	/* TSN1_MDC_A, TSN1_MDIO_A */
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 9),
+};
+static const unsigned int tsn1_mdio_a_mux[] = {
+	TSN1_MDC_A_MARK, TSN1_MDIO_A_MARK,
+};
+static const unsigned int tsn1_link_b_pins[] = {
+	/* TSN1_LINK_B */
+	RCAR_GP_PIN(3, 6),
+};
+static const unsigned int tsn1_link_b_mux[] = {
+	TSN1_LINK_B_MARK,
+};
+static const unsigned int tsn1_phy_int_b_pins[] = {
+	/* TSN1_PHY_INT_B */
+	RCAR_GP_PIN(3, 11),
+};
+static const unsigned int tsn1_phy_int_b_mux[] = {
+	TSN1_PHY_INT_B_MARK,
+};
+static const unsigned int tsn1_mdio_b_pins[] = {
+	/* TSN1_MDC_B, TSN1_MDIO_B */
+	RCAR_GP_PIN(3, 5), RCAR_GP_PIN(3, 0),
+};
+static const unsigned int tsn1_mdio_b_mux[] = {
+	TSN1_MDC_B_MARK, TSN1_MDIO_B_MARK,
+};
+static const unsigned int tsn1_avtp_pps_pins[] = {
+	/* TSN1_AVTP_PPS */
+	RCAR_GP_PIN(3, 13),
+};
+static const unsigned int tsn1_avtp_pps_mux[] = {
+	TSN0_AVTP_PPS_MARK,
+};
+static const unsigned int tsn1_avtp_capture_a_pins[] = {
+	/* TSN1_AVTP_CAPTURE_A */
+	RCAR_GP_PIN(0, 7),
+};
+static const unsigned int tsn1_avtp_capture_a_mux[] = {
+	TSN1_AVTP_CAPTURE_A_MARK,
+};
+static const unsigned int tsn1_avtp_match_a_pins[] = {
+	/* TSN1_AVTP_MATCH_A */
+	RCAR_GP_PIN(0, 6),
+};
+static const unsigned int tsn1_avtp_match_a_mux[] = {
+	TSN1_AVTP_MATCH_A_MARK,
+};
+static const unsigned int tsn1_avtp_capture_b_pins[] = {
+	/* TSN1_AVTP_CAPTURE_B */
+	RCAR_GP_PIN(3, 15),
+};
+static const unsigned int tsn1_avtp_capture_b_mux[] = {
+	TSN1_AVTP_CAPTURE_B_MARK,
+};
+static const unsigned int tsn1_avtp_match_b_pins[] = {
+	/* TSN1_AVTP_MATCH_B */
+	RCAR_GP_PIN(3, 14),
+};
+static const unsigned int tsn1_avtp_match_b_mux[] = {
+	TSN1_AVTP_MATCH_B_MARK,
+};
+
+/* - TSN2 ------------------------------------------------ */
+static const unsigned int tsn2_link_a_pins[] = {
+	/* TSN2_LINK_A */
+	RCAR_GP_PIN(0, 16),
+};
+static const unsigned int tsn2_link_a_mux[] = {
+	TSN2_LINK_A_MARK,
+};
+static const unsigned int tsn2_phy_int_a_pins[] = {
+	/* TSN2_PHY_INT_A */
+	RCAR_GP_PIN(0, 20),
+};
+static const unsigned int tsn2_phy_int_a_mux[] = {
+	TSN2_PHY_INT_A_MARK,
+};
+static const unsigned int tsn2_mdio_a_pins[] = {
+	/* TSN2_MDC_A, TSN2_MDIO_A */
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+};
+static const unsigned int tsn2_mdio_a_mux[] = {
+	TSN2_MDC_A_MARK, TSN2_MDIO_A_MARK,
+};
+static const unsigned int tsn2_link_b_pins[] = {
+	/* TSN2_LINK_B */
+	RCAR_GP_PIN(3, 7),
+};
+static const unsigned int tsn2_link_b_mux[] = {
+	TSN2_LINK_B_MARK,
+};
+static const unsigned int tsn2_phy_int_b_pins[] = {
+	/* TSN2_PHY_INT_B */
+	RCAR_GP_PIN(3, 9),
+};
+static const unsigned int tsn2_phy_int_b_mux[] = {
+	TSN2_PHY_INT_B_MARK,
+};
+static const unsigned int tsn2_mdio_b_pins[] = {
+	/* TSN2_MDC_B, TSN2_MDIO_B */
+	RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 1),
+};
+static const unsigned int tsn2_mdio_b_mux[] = {
+	TSN2_MDC_B_MARK, TSN2_MDIO_B_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
@@ -1131,6 +1347,36 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif4_clk),
 	SH_PFC_PIN_GROUP(scif4_ctrl),
 	SH_PFC_PIN_GROUP(scif_clk),
+	SH_PFC_PIN_GROUP(tsn0_link_a),
+	SH_PFC_PIN_GROUP(tsn0_magic_a),
+	SH_PFC_PIN_GROUP(tsn0_phy_int_a),
+	SH_PFC_PIN_GROUP(tsn0_mdio_a),
+	SH_PFC_PIN_GROUP(tsn0_link_b),
+	SH_PFC_PIN_GROUP(tsn0_magic_b),
+	SH_PFC_PIN_GROUP(tsn0_phy_int_b),
+	SH_PFC_PIN_GROUP(tsn0_mdio_b),
+	SH_PFC_PIN_GROUP(tsn0_avtp_pps),
+	SH_PFC_PIN_GROUP(tsn0_avtp_capture_a),
+	SH_PFC_PIN_GROUP(tsn0_avtp_match_a),
+	SH_PFC_PIN_GROUP(tsn0_avtp_capture_b),
+	SH_PFC_PIN_GROUP(tsn0_avtp_match_b),
+	SH_PFC_PIN_GROUP(tsn1_link_a),
+	SH_PFC_PIN_GROUP(tsn1_phy_int_a),
+	SH_PFC_PIN_GROUP(tsn1_mdio_a),
+	SH_PFC_PIN_GROUP(tsn1_link_b),
+	SH_PFC_PIN_GROUP(tsn1_phy_int_b),
+	SH_PFC_PIN_GROUP(tsn1_mdio_b),
+	SH_PFC_PIN_GROUP(tsn1_avtp_pps),
+	SH_PFC_PIN_GROUP(tsn1_avtp_capture_a),
+	SH_PFC_PIN_GROUP(tsn1_avtp_match_a),
+	SH_PFC_PIN_GROUP(tsn1_avtp_capture_b),
+	SH_PFC_PIN_GROUP(tsn1_avtp_match_b),
+	SH_PFC_PIN_GROUP(tsn2_link_a),
+	SH_PFC_PIN_GROUP(tsn2_phy_int_a),
+	SH_PFC_PIN_GROUP(tsn2_mdio_a),
+	SH_PFC_PIN_GROUP(tsn2_link_b),
+	SH_PFC_PIN_GROUP(tsn2_phy_int_b),
+	SH_PFC_PIN_GROUP(tsn2_mdio_b),
 };
 
 static const char * const hscif0_groups[] = {
@@ -1281,6 +1527,45 @@ static const char * const scif_clk_groups[] = {
 	"scif_clk",
 };
 
+static const char * const tsn0_groups[] = {
+	"tsn0_link_a",
+	"tsn0_magic_a",
+	"tsn0_phy_int_a",
+	"tsn0_mdio_a",
+	"tsn0_link_b",
+	"tsn0_magic_b",
+	"tsn0_phy_int_b",
+	"tsn0_mdio_b",
+	"tsn0_avtp_pps",
+	"tsn0_avtp_capture_a",
+	"tsn0_avtp_match_a",
+	"tsn0_avtp_capture_b",
+	"tsn0_avtp_match_b",
+};
+
+static const char * const tsn1_groups[] = {
+	"tsn1_link_a",
+	"tsn1_phy_int_a",
+	"tsn1_mdio_a",
+	"tsn1_link_b",
+	"tsn1_phy_int_b",
+	"tsn1_mdio_b",
+	"tsn1_avtp_pps",
+	"tsn1_avtp_capture_a",
+	"tsn1_avtp_match_a",
+	"tsn1_avtp_capture_b",
+	"tsn1_avtp_match_b",
+};
+
+static const char * const tsn2_groups[] = {
+	"tsn2_link_a",
+	"tsn2_phy_int_a",
+	"tsn2_mdio_a",
+	"tsn2_link_b",
+	"tsn2_phy_int_b",
+	"tsn2_mdio_b",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
@@ -1306,6 +1591,9 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif_clk),
+	SH_PFC_FUNCTION(tsn0),
+	SH_PFC_FUNCTION(tsn1),
+	SH_PFC_FUNCTION(tsn2),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.25.1

