Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23A04BE1B7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379514AbiBUPpJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:45:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379494AbiBUPo5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:44:57 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBD123BF4
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:43:54 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by albert.telenet-ops.be with bizsmtp
        id xrjs2600U3YJRAw06rjsdp; Mon, 21 Feb 2022 16:43:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqt-001TTw-M2; Mon, 21 Feb 2022 16:43:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqs-006EiU-Hk; Mon, 21 Feb 2022 16:43:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 10/12] pinctrl: renesas: r8a779f0: Add PCIe pins, groups, and function
Date:   Mon, 21 Feb 2022 16:43:45 +0100
Message-Id: <b2f95db490d13e8cb7d97a63d58d47933317e28a.1645457792.git.geert+renesas@glider.be>
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

Add pins, groups, and function for the PCIe Controllers on the Renesas
R-Car S4-8 (R8A779F0) SoC.

Extracted from a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index 88c5ef3431fc19bb..c8d9ce60d6992e98 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -898,6 +898,25 @@ static const unsigned int msiof3_rxd_mux[] = {
 	MSIOF3_RXD_MARK,
 };
 
+/* - PCIE ------------------------------------------------------------------- */
+static const unsigned int pcie0_clkreq_n_pins[] = {
+	/* PCIE0_CLKREQ# */
+	RCAR_GP_PIN(2, 15),
+};
+
+static const unsigned int pcie0_clkreq_n_mux[] = {
+	PCIE0_CLKREQ_N_MARK,
+};
+
+static const unsigned int pcie1_clkreq_n_pins[] = {
+	/* PCIE1_CLKREQ# */
+	RCAR_GP_PIN(2, 16),
+};
+
+static const unsigned int pcie1_clkreq_n_mux[] = {
+	PCIE1_CLKREQ_N_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -1055,6 +1074,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(msiof3_ss2),
 	SH_PFC_PIN_GROUP(msiof3_txd),
 	SH_PFC_PIN_GROUP(msiof3_rxd),
+	SH_PFC_PIN_GROUP(pcie0_clkreq_n),
+	SH_PFC_PIN_GROUP(pcie1_clkreq_n),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1173,6 +1194,11 @@ static const char * const msiof3_groups[] = {
 	"msiof3_rxd",
 };
 
+static const char * const pcie_groups[] = {
+	"pcie0_clkreq_n",
+	"pcie1_clkreq_n",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -1218,6 +1244,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(msiof1),
 	SH_PFC_FUNCTION(msiof2),
 	SH_PFC_FUNCTION(msiof3),
+	SH_PFC_FUNCTION(pcie),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.25.1

