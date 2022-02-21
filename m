Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3AF4BE9B6
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 19:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379569AbiBUPpI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:45:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344844AbiBUPo4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:44:56 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E43C23BE6
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:43:54 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by albert.telenet-ops.be with bizsmtp
        id xrjr2600X3YJRAw06rjrdP; Mon, 21 Feb 2022 16:43:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqt-001TTy-EM; Mon, 21 Feb 2022 16:43:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqs-006Eib-Ij; Mon, 21 Feb 2022 16:43:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 11/12] pinctrl: renesas: r8a779f0: Add QSPI pins, groups, and functions
Date:   Mon, 21 Feb 2022 16:43:46 +0100
Message-Id: <cd7f7feeabebf268adc9e050e348230e93b40829.1645457792.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645457792.git.geert+renesas@glider.be>
References: <cover.1645457792.git.geert+renesas@glider.be>
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

Add pins, groups, and functions for the Quad SPI Controllers on the
Renesas R-Car S4-8 (R8A779F0) SoC.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.

This depends on "[PATCH 00/60] pinctrl: renesas: Share more pin group
data"[1].

Changes compared to the BSP:
  - Share QSPI pin group data.

[1] https://lore.kernel.org/r/cover.1640269757.git.geert+renesas@glider.be
---
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index c8d9ce60d6992e98..79377ce951359c1e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -917,6 +917,42 @@ static const unsigned int pcie1_clkreq_n_mux[] = {
 	PCIE1_CLKREQ_N_MARK,
 };
 
+/* - QSPI0 ------------------------------------------------------------------ */
+static const unsigned int qspi0_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 13),
+};
+static const unsigned int qspi0_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+static const unsigned int qspi0_data_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 12),
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 14),
+};
+static const unsigned int qspi0_data_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK
+};
+
+/* - QSPI1 ------------------------------------------------------------------ */
+static const unsigned int qspi1_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 3),
+};
+static const unsigned int qspi1_ctrl_mux[] = {
+	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int qspi1_data_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 4),
+};
+static const unsigned int qspi1_data_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -1076,6 +1112,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(msiof3_rxd),
 	SH_PFC_PIN_GROUP(pcie0_clkreq_n),
 	SH_PFC_PIN_GROUP(pcie1_clkreq_n),
+	SH_PFC_PIN_GROUP(qspi0_ctrl),
+	BUS_DATA_PIN_GROUP(qspi0_data, 2),
+	BUS_DATA_PIN_GROUP(qspi0_data, 4),
+	SH_PFC_PIN_GROUP(qspi1_ctrl),
+	BUS_DATA_PIN_GROUP(qspi1_data, 2),
+	BUS_DATA_PIN_GROUP(qspi1_data, 4),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1199,6 +1241,18 @@ static const char * const pcie_groups[] = {
 	"pcie1_clkreq_n",
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
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -1245,6 +1299,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(msiof2),
 	SH_PFC_FUNCTION(msiof3),
 	SH_PFC_FUNCTION(pcie),
+	SH_PFC_FUNCTION(qspi0),
+	SH_PFC_FUNCTION(qspi1),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.25.1

