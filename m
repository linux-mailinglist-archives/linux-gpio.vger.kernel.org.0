Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6134D47E4D9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348952AbhLWOm2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbhLWOmR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:17 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6264C06179C
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by xavier.telenet-ops.be with bizsmtp
        id ZqiE2600i1rdBcm01qiEcy; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9C-Ao; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rZn-5Y; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 14/60] pinctrl: renesas: r8a7740: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:24 +0100
Message-Id: <4b15d28bb8ac24417be83b1defe0bbb908abc1e6.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups mmc0_data[14]_[01] are subsets of mmc0_data8_[01].

This reduces kernel size by 80 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7740.c | 48 ++++++---------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
index 8534e0799527d243..ba2d628defe030ac 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7740.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7740.c
@@ -2140,25 +2140,11 @@ static const unsigned int lcd1_sys_mux[] = {
 	LCD1_CS_MARK, LCD1_WR_MARK, LCD1_RD_MARK, LCD1_RS_MARK,
 };
 /* - MMCIF ------------------------------------------------------------------ */
-static const unsigned int mmc0_data1_0_pins[] = {
-	/* D[0] */
-	68,
-};
-static const unsigned int mmc0_data1_0_mux[] = {
-	MMC0_D0_PORT68_MARK,
-};
-static const unsigned int mmc0_data4_0_pins[] = {
-	/* D[0:3] */
-	68, 69, 70, 71,
-};
-static const unsigned int mmc0_data4_0_mux[] = {
-	MMC0_D0_PORT68_MARK, MMC0_D1_PORT69_MARK, MMC0_D2_PORT70_MARK, MMC0_D3_PORT71_MARK,
-};
-static const unsigned int mmc0_data8_0_pins[] = {
+static const unsigned int mmc0_data_0_pins[] = {
 	/* D[0:7] */
 	68, 69, 70, 71, 72, 73, 74, 75,
 };
-static const unsigned int mmc0_data8_0_mux[] = {
+static const unsigned int mmc0_data_0_mux[] = {
 	MMC0_D0_PORT68_MARK, MMC0_D1_PORT69_MARK, MMC0_D2_PORT70_MARK, MMC0_D3_PORT71_MARK,
 	MMC0_D4_PORT72_MARK, MMC0_D5_PORT73_MARK, MMC0_D6_PORT74_MARK, MMC0_D7_PORT75_MARK,
 };
@@ -2170,25 +2156,11 @@ static const unsigned int mmc0_ctrl_0_mux[] = {
 	MMC0_CMD_PORT67_MARK, MMC0_CLK_PORT66_MARK,
 };
 
-static const unsigned int mmc0_data1_1_pins[] = {
-	/* D[0] */
-	149,
-};
-static const unsigned int mmc0_data1_1_mux[] = {
-	MMC1_D0_PORT149_MARK,
-};
-static const unsigned int mmc0_data4_1_pins[] = {
-	/* D[0:3] */
-	149, 148, 147, 146,
-};
-static const unsigned int mmc0_data4_1_mux[] = {
-	MMC1_D0_PORT149_MARK, MMC1_D1_PORT148_MARK, MMC1_D2_PORT147_MARK, MMC1_D3_PORT146_MARK,
-};
-static const unsigned int mmc0_data8_1_pins[] = {
+static const unsigned int mmc0_data_1_pins[] = {
 	/* D[0:7] */
 	149, 148, 147, 146, 145, 144, 143, 142,
 };
-static const unsigned int mmc0_data8_1_mux[] = {
+static const unsigned int mmc0_data_1_mux[] = {
 	MMC1_D0_PORT149_MARK, MMC1_D1_PORT148_MARK, MMC1_D2_PORT147_MARK, MMC1_D3_PORT146_MARK,
 	MMC1_D4_PORT145_MARK, MMC1_D5_PORT144_MARK, MMC1_D6_PORT143_MARK, MMC1_D7_PORT142_MARK,
 };
@@ -2732,13 +2704,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(lcd1_lclk),
 	SH_PFC_PIN_GROUP(lcd1_sync),
 	SH_PFC_PIN_GROUP(lcd1_sys),
-	SH_PFC_PIN_GROUP(mmc0_data1_0),
-	SH_PFC_PIN_GROUP(mmc0_data4_0),
-	SH_PFC_PIN_GROUP(mmc0_data8_0),
+	BUS_DATA_PIN_GROUP(mmc0_data, 1, _0),
+	BUS_DATA_PIN_GROUP(mmc0_data, 4, _0),
+	BUS_DATA_PIN_GROUP(mmc0_data, 8, _0),
 	SH_PFC_PIN_GROUP(mmc0_ctrl_0),
-	SH_PFC_PIN_GROUP(mmc0_data1_1),
-	SH_PFC_PIN_GROUP(mmc0_data4_1),
-	SH_PFC_PIN_GROUP(mmc0_data8_1),
+	BUS_DATA_PIN_GROUP(mmc0_data, 1, _1),
+	BUS_DATA_PIN_GROUP(mmc0_data, 4, _1),
+	BUS_DATA_PIN_GROUP(mmc0_data, 8, _1),
 	SH_PFC_PIN_GROUP(mmc0_ctrl_1),
 	SH_PFC_PIN_GROUP(scifa0_data),
 	SH_PFC_PIN_GROUP(scifa0_clk),
-- 
2.25.1

