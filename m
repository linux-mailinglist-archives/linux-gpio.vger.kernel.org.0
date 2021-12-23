Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7020947E4AB
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348958AbhLWOmT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348878AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9ABC061792
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by laurent.telenet-ops.be with bizsmtp
        id ZqiD260091rdBcm01qiD0z; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a95-Qo; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rZS-1l; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/60] pinctrl: renesas: r8a7740: Share LCD pin group data
Date:   Thu, 23 Dec 2021 15:41:21 +0100
Message-Id: <2018113779b3084c4175b04bb32acf2de0557a37.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups lcd0_data{8,9,12,16,18} are subsets of lcd0_data24_0.
Pin groups lcd1_data{8,9,12,16,18} are subsets of lcd1_data24.

This reduces kernel size by 1008 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7740.c | 130 +++-----------------------
 1 file changed, 13 insertions(+), 117 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
index 0e20a0f0bb717f46..8534e0799527d243 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7740.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7740.c
@@ -2031,58 +2031,6 @@ IRQC_PINS_MUX(31, 0, 41);
 IRQC_PINS_MUX(31, 1, 167);
 
 /* - LCD0 ------------------------------------------------------------------- */
-static const unsigned int lcd0_data8_pins[] = {
-	/* D[0:7] */
-	58, 57, 56, 55, 54, 53, 52, 51,
-};
-static const unsigned int lcd0_data8_mux[] = {
-	LCD0_D0_MARK, LCD0_D1_MARK, LCD0_D2_MARK, LCD0_D3_MARK,
-	LCD0_D4_MARK, LCD0_D5_MARK, LCD0_D6_MARK, LCD0_D7_MARK,
-};
-static const unsigned int lcd0_data9_pins[] = {
-	/* D[0:8] */
-	58, 57, 56, 55, 54, 53, 52, 51,
-	50,
-};
-static const unsigned int lcd0_data9_mux[] = {
-	LCD0_D0_MARK, LCD0_D1_MARK, LCD0_D2_MARK, LCD0_D3_MARK,
-	LCD0_D4_MARK, LCD0_D5_MARK, LCD0_D6_MARK, LCD0_D7_MARK,
-	LCD0_D8_MARK,
-};
-static const unsigned int lcd0_data12_pins[] = {
-	/* D[0:11] */
-	58, 57, 56, 55, 54, 53, 52, 51,
-	50, 49, 48, 47,
-};
-static const unsigned int lcd0_data12_mux[] = {
-	LCD0_D0_MARK, LCD0_D1_MARK, LCD0_D2_MARK, LCD0_D3_MARK,
-	LCD0_D4_MARK, LCD0_D5_MARK, LCD0_D6_MARK, LCD0_D7_MARK,
-	LCD0_D8_MARK, LCD0_D9_MARK, LCD0_D10_MARK, LCD0_D11_MARK,
-};
-static const unsigned int lcd0_data16_pins[] = {
-	/* D[0:15] */
-	58, 57, 56, 55, 54, 53, 52, 51,
-	50, 49, 48, 47, 46, 45, 44, 43,
-};
-static const unsigned int lcd0_data16_mux[] = {
-	LCD0_D0_MARK, LCD0_D1_MARK, LCD0_D2_MARK, LCD0_D3_MARK,
-	LCD0_D4_MARK, LCD0_D5_MARK, LCD0_D6_MARK, LCD0_D7_MARK,
-	LCD0_D8_MARK, LCD0_D9_MARK, LCD0_D10_MARK, LCD0_D11_MARK,
-	LCD0_D12_MARK, LCD0_D13_MARK, LCD0_D14_MARK, LCD0_D15_MARK,
-};
-static const unsigned int lcd0_data18_pins[] = {
-	/* D[0:17] */
-	58, 57, 56, 55, 54, 53, 52, 51,
-	50, 49, 48, 47, 46, 45, 44, 43,
-	42, 41,
-};
-static const unsigned int lcd0_data18_mux[] = {
-	LCD0_D0_MARK, LCD0_D1_MARK, LCD0_D2_MARK, LCD0_D3_MARK,
-	LCD0_D4_MARK, LCD0_D5_MARK, LCD0_D6_MARK, LCD0_D7_MARK,
-	LCD0_D8_MARK, LCD0_D9_MARK, LCD0_D10_MARK, LCD0_D11_MARK,
-	LCD0_D12_MARK, LCD0_D13_MARK, LCD0_D14_MARK, LCD0_D15_MARK,
-	LCD0_D16_MARK, LCD0_D17_MARK,
-};
 static const unsigned int lcd0_data24_0_pins[] = {
 	/* D[0:23] */
 	58, 57, 56, 55, 54, 53, 52, 51,
@@ -2149,65 +2097,13 @@ static const unsigned int lcd0_sys_mux[] = {
 	LCD0_CS_MARK, LCD0_WR_MARK, LCD0_RD_MARK, LCD0_RS_MARK,
 };
 /* - LCD1 ------------------------------------------------------------------- */
-static const unsigned int lcd1_data8_pins[] = {
-	/* D[0:7] */
-	4, 3, 2, 1, 0, 91, 92, 23,
-};
-static const unsigned int lcd1_data8_mux[] = {
-	LCD1_D0_MARK, LCD1_D1_MARK, LCD1_D2_MARK, LCD1_D3_MARK,
-	LCD1_D4_MARK, LCD1_D5_MARK, LCD1_D6_MARK, LCD1_D7_MARK,
-};
-static const unsigned int lcd1_data9_pins[] = {
-	/* D[0:8] */
-	4, 3, 2, 1, 0, 91, 92, 23,
-	93,
-};
-static const unsigned int lcd1_data9_mux[] = {
-	LCD1_D0_MARK, LCD1_D1_MARK, LCD1_D2_MARK, LCD1_D3_MARK,
-	LCD1_D4_MARK, LCD1_D5_MARK, LCD1_D6_MARK, LCD1_D7_MARK,
-	LCD1_D8_MARK,
-};
-static const unsigned int lcd1_data12_pins[] = {
-	/* D[0:11] */
-	4, 3, 2, 1, 0, 91, 92, 23,
-	93, 94, 21, 201,
-};
-static const unsigned int lcd1_data12_mux[] = {
-	LCD1_D0_MARK, LCD1_D1_MARK, LCD1_D2_MARK, LCD1_D3_MARK,
-	LCD1_D4_MARK, LCD1_D5_MARK, LCD1_D6_MARK, LCD1_D7_MARK,
-	LCD1_D8_MARK, LCD1_D9_MARK, LCD1_D10_MARK, LCD1_D11_MARK,
-};
-static const unsigned int lcd1_data16_pins[] = {
-	/* D[0:15] */
-	4, 3, 2, 1, 0, 91, 92, 23,
-	93, 94, 21, 201, 200, 199, 196, 195,
-};
-static const unsigned int lcd1_data16_mux[] = {
-	LCD1_D0_MARK, LCD1_D1_MARK, LCD1_D2_MARK, LCD1_D3_MARK,
-	LCD1_D4_MARK, LCD1_D5_MARK, LCD1_D6_MARK, LCD1_D7_MARK,
-	LCD1_D8_MARK, LCD1_D9_MARK, LCD1_D10_MARK, LCD1_D11_MARK,
-	LCD1_D12_MARK, LCD1_D13_MARK, LCD1_D14_MARK, LCD1_D15_MARK,
-};
-static const unsigned int lcd1_data18_pins[] = {
-	/* D[0:17] */
-	4, 3, 2, 1, 0, 91, 92, 23,
-	93, 94, 21, 201, 200, 199, 196, 195,
-	194, 193,
-};
-static const unsigned int lcd1_data18_mux[] = {
-	LCD1_D0_MARK, LCD1_D1_MARK, LCD1_D2_MARK, LCD1_D3_MARK,
-	LCD1_D4_MARK, LCD1_D5_MARK, LCD1_D6_MARK, LCD1_D7_MARK,
-	LCD1_D8_MARK, LCD1_D9_MARK, LCD1_D10_MARK, LCD1_D11_MARK,
-	LCD1_D12_MARK, LCD1_D13_MARK, LCD1_D14_MARK, LCD1_D15_MARK,
-	LCD1_D16_MARK, LCD1_D17_MARK,
-};
-static const unsigned int lcd1_data24_pins[] = {
+static const unsigned int lcd1_data_pins[] = {
 	/* D[0:23] */
 	4, 3, 2, 1, 0, 91, 92, 23,
 	93, 94, 21, 201, 200, 199, 196, 195,
 	194, 193, 198, 197, 75, 74, 15, 14,
 };
-static const unsigned int lcd1_data24_mux[] = {
+static const unsigned int lcd1_data_mux[] = {
 	LCD1_D0_MARK, LCD1_D1_MARK, LCD1_D2_MARK, LCD1_D3_MARK,
 	LCD1_D4_MARK, LCD1_D5_MARK, LCD1_D6_MARK, LCD1_D7_MARK,
 	LCD1_D8_MARK, LCD1_D9_MARK, LCD1_D10_MARK, LCD1_D11_MARK,
@@ -2814,11 +2710,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(intc_irq30_1),
 	SH_PFC_PIN_GROUP(intc_irq31_0),
 	SH_PFC_PIN_GROUP(intc_irq31_1),
-	SH_PFC_PIN_GROUP(lcd0_data8),
-	SH_PFC_PIN_GROUP(lcd0_data9),
-	SH_PFC_PIN_GROUP(lcd0_data12),
-	SH_PFC_PIN_GROUP(lcd0_data16),
-	SH_PFC_PIN_GROUP(lcd0_data18),
+	SH_PFC_PIN_GROUP_SUBSET(lcd0_data8, lcd0_data24_0, 0, 8),
+	SH_PFC_PIN_GROUP_SUBSET(lcd0_data9, lcd0_data24_0, 0, 9),
+	SH_PFC_PIN_GROUP_SUBSET(lcd0_data12, lcd0_data24_0, 0, 12),
+	SH_PFC_PIN_GROUP_SUBSET(lcd0_data16, lcd0_data24_0, 0, 16),
+	SH_PFC_PIN_GROUP_SUBSET(lcd0_data18, lcd0_data24_0, 0, 18),
 	SH_PFC_PIN_GROUP(lcd0_data24_0),
 	SH_PFC_PIN_GROUP(lcd0_data24_1),
 	SH_PFC_PIN_GROUP(lcd0_display),
@@ -2826,12 +2722,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(lcd0_lclk_1),
 	SH_PFC_PIN_GROUP(lcd0_sync),
 	SH_PFC_PIN_GROUP(lcd0_sys),
-	SH_PFC_PIN_GROUP(lcd1_data8),
-	SH_PFC_PIN_GROUP(lcd1_data9),
-	SH_PFC_PIN_GROUP(lcd1_data12),
-	SH_PFC_PIN_GROUP(lcd1_data16),
-	SH_PFC_PIN_GROUP(lcd1_data18),
-	SH_PFC_PIN_GROUP(lcd1_data24),
+	BUS_DATA_PIN_GROUP(lcd1_data, 8),
+	BUS_DATA_PIN_GROUP(lcd1_data, 9),
+	BUS_DATA_PIN_GROUP(lcd1_data, 12),
+	BUS_DATA_PIN_GROUP(lcd1_data, 16),
+	BUS_DATA_PIN_GROUP(lcd1_data, 18),
+	BUS_DATA_PIN_GROUP(lcd1_data, 24),
 	SH_PFC_PIN_GROUP(lcd1_display),
 	SH_PFC_PIN_GROUP(lcd1_lclk),
 	SH_PFC_PIN_GROUP(lcd1_sync),
-- 
2.25.1

