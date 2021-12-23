Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF36047E4AF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbhLWOmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348880AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D1BC061799
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by laurent.telenet-ops.be with bizsmtp
        id ZqiD260071rdBcm01qiD0x; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a90-OB; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rZ0-Vc; Thu, 23 Dec 2021 15:42:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/60] pinctrl: renesas: r8a7740: Share BSC pin group data
Date:   Thu, 23 Dec 2021 15:41:17 +0100
Message-Id: <556873f8392b1a7d1a2cf9c10abb5e6c283f11cc.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups bsc_data{8,16} are subsets of bsc_data32.
Pin groups bsc_rd_we{8,16} are subsets of bsc_rd_we32.

This reduces kernel size by 232 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7740.c | 53 +++++----------------------
 1 file changed, 10 insertions(+), 43 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
index 4eac3899d69bc488..0e20a0f0bb717f46 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7740.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7740.c
@@ -1638,33 +1638,14 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 };
 
 /* - BSC -------------------------------------------------------------------- */
-static const unsigned int bsc_data8_pins[] = {
-	/* D[0:7] */
-	157, 156, 155, 154, 153, 152, 151, 150,
-};
-static const unsigned int bsc_data8_mux[] = {
-	D0_NAF0_MARK, D1_NAF1_MARK, D2_NAF2_MARK, D3_NAF3_MARK,
-	D4_NAF4_MARK, D5_NAF5_MARK, D6_NAF6_MARK, D7_NAF7_MARK,
-};
-static const unsigned int bsc_data16_pins[] = {
-	/* D[0:15] */
-	157, 156, 155, 154, 153, 152, 151, 150,
-	149, 148, 147, 146, 145, 144, 143, 142,
-};
-static const unsigned int bsc_data16_mux[] = {
-	D0_NAF0_MARK, D1_NAF1_MARK, D2_NAF2_MARK, D3_NAF3_MARK,
-	D4_NAF4_MARK, D5_NAF5_MARK, D6_NAF6_MARK, D7_NAF7_MARK,
-	D8_NAF8_MARK, D9_NAF9_MARK, D10_NAF10_MARK, D11_NAF11_MARK,
-	D12_NAF12_MARK, D13_NAF13_MARK, D14_NAF14_MARK, D15_NAF15_MARK,
-};
-static const unsigned int bsc_data32_pins[] = {
+static const unsigned int bsc_data_pins[] = {
 	/* D[0:31] */
 	157, 156, 155, 154, 153, 152, 151, 150,
 	149, 148, 147, 146, 145, 144, 143, 142,
 	171, 170, 169, 168, 167, 166, 173, 172,
 	165, 164, 163, 162, 161, 160, 159, 158,
 };
-static const unsigned int bsc_data32_mux[] = {
+static const unsigned int bsc_data_mux[] = {
 	D0_NAF0_MARK, D1_NAF1_MARK, D2_NAF2_MARK, D3_NAF3_MARK,
 	D4_NAF4_MARK, D5_NAF5_MARK, D6_NAF6_MARK, D7_NAF7_MARK,
 	D8_NAF8_MARK, D9_NAF9_MARK, D10_NAF10_MARK, D11_NAF11_MARK,
@@ -1723,25 +1704,11 @@ static const unsigned int bsc_cs6a_pins[] = {
 static const unsigned int bsc_cs6a_mux[] = {
 	CS6A_MARK,
 };
-static const unsigned int bsc_rd_we8_pins[] = {
-	/* RD, WE[0] */
-	115, 113,
-};
-static const unsigned int bsc_rd_we8_mux[] = {
-	RD_FSC_MARK, WE0_FWE_MARK,
-};
-static const unsigned int bsc_rd_we16_pins[] = {
-	/* RD, WE[0:1] */
-	115, 113, 112,
-};
-static const unsigned int bsc_rd_we16_mux[] = {
-	RD_FSC_MARK, WE0_FWE_MARK, WE1_MARK,
-};
-static const unsigned int bsc_rd_we32_pins[] = {
+static const unsigned int bsc_rd_we_pins[] = {
 	/* RD, WE[0:3] */
 	115, 113, 112, 108, 107,
 };
-static const unsigned int bsc_rd_we32_mux[] = {
+static const unsigned int bsc_rd_we_mux[] = {
 	RD_FSC_MARK, WE0_FWE_MARK, WE1_MARK, WE2_ICIORD_MARK, WE3_ICIOWR_MARK,
 };
 static const unsigned int bsc_bs_pins[] = {
@@ -2750,9 +2717,9 @@ static const unsigned int tpu0_to3_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
-	SH_PFC_PIN_GROUP(bsc_data8),
-	SH_PFC_PIN_GROUP(bsc_data16),
-	SH_PFC_PIN_GROUP(bsc_data32),
+	BUS_DATA_PIN_GROUP(bsc_data, 8),
+	BUS_DATA_PIN_GROUP(bsc_data, 16),
+	BUS_DATA_PIN_GROUP(bsc_data, 32),
 	SH_PFC_PIN_GROUP(bsc_cs0),
 	SH_PFC_PIN_GROUP(bsc_cs2),
 	SH_PFC_PIN_GROUP(bsc_cs4),
@@ -2760,9 +2727,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(bsc_cs5a_1),
 	SH_PFC_PIN_GROUP(bsc_cs5b),
 	SH_PFC_PIN_GROUP(bsc_cs6a),
-	SH_PFC_PIN_GROUP(bsc_rd_we8),
-	SH_PFC_PIN_GROUP(bsc_rd_we16),
-	SH_PFC_PIN_GROUP(bsc_rd_we32),
+	SH_PFC_PIN_GROUP_SUBSET(bsc_rd_we8, bsc_rd_we, 0, 2),
+	SH_PFC_PIN_GROUP_SUBSET(bsc_rd_we16, bsc_rd_we, 0, 3),
+	SH_PFC_PIN_GROUP_SUBSET(bsc_rd_we32, bsc_rd_we, 0, 5),
 	SH_PFC_PIN_GROUP(bsc_bs),
 	SH_PFC_PIN_GROUP(bsc_rdwr),
 	SH_PFC_PIN_GROUP(ceu0_data_0_7),
-- 
2.25.1

