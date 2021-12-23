Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B1847E49F
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348874AbhLWOmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348858AbhLWOmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:15 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63CCC06175A
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:14 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by albert.telenet-ops.be with bizsmtp
        id ZqiD260091rdBcm06qiDqE; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a8v-QR; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rbA-Gz; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 25/60] pinctrl: renesas: sh73a0: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:35 +0100
Message-Id: <ee424be388e8b5780630eb06532d20a4cf5132b1.1640269757.git.geert+renesas@glider.be>
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
 drivers/pinctrl/renesas/pfc-sh73a0.c | 48 ++++++----------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index 3d17d775247f18de..42710a8758192cf4 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -2002,25 +2002,11 @@ static const unsigned int lcd2_sys_1_mux[] = {
 	LCD2RD__MARK, PORT217_LCD2RS_MARK,
 };
 /* - MMCIF ------------------------------------------------------------------ */
-static const unsigned int mmc0_data1_0_pins[] = {
-	/* D[0] */
-	271,
-};
-static const unsigned int mmc0_data1_0_mux[] = {
-	MMCD0_0_MARK,
-};
-static const unsigned int mmc0_data4_0_pins[] = {
-	/* D[0:3] */
-	271, 272, 273, 274,
-};
-static const unsigned int mmc0_data4_0_mux[] = {
-	MMCD0_0_MARK, MMCD0_1_MARK, MMCD0_2_MARK, MMCD0_3_MARK,
-};
-static const unsigned int mmc0_data8_0_pins[] = {
+static const unsigned int mmc0_data_0_pins[] = {
 	/* D[0:7] */
 	271, 272, 273, 274, 275, 276, 277, 278,
 };
-static const unsigned int mmc0_data8_0_mux[] = {
+static const unsigned int mmc0_data_0_mux[] = {
 	MMCD0_0_MARK, MMCD0_1_MARK, MMCD0_2_MARK, MMCD0_3_MARK,
 	MMCD0_4_MARK, MMCD0_5_MARK, MMCD0_6_MARK, MMCD0_7_MARK,
 };
@@ -2032,25 +2018,11 @@ static const unsigned int mmc0_ctrl_0_mux[] = {
 	MMCCMD0_MARK, MMCCLK0_MARK,
 };
 
-static const unsigned int mmc0_data1_1_pins[] = {
-	/* D[0] */
-	305,
-};
-static const unsigned int mmc0_data1_1_mux[] = {
-	MMCD1_0_MARK,
-};
-static const unsigned int mmc0_data4_1_pins[] = {
-	/* D[0:3] */
-	305, 304, 303, 302,
-};
-static const unsigned int mmc0_data4_1_mux[] = {
-	MMCD1_0_MARK, MMCD1_1_MARK, MMCD1_2_MARK, MMCD1_3_MARK,
-};
-static const unsigned int mmc0_data8_1_pins[] = {
+static const unsigned int mmc0_data_1_pins[] = {
 	/* D[0:7] */
 	305, 304, 303, 302, 301, 300, 299, 298,
 };
-static const unsigned int mmc0_data8_1_mux[] = {
+static const unsigned int mmc0_data_1_mux[] = {
 	MMCD1_0_MARK, MMCD1_1_MARK, MMCD1_2_MARK, MMCD1_3_MARK,
 	MMCD1_4_MARK, MMCD1_5_MARK, MMCD1_6_MARK, MMCD1_7_MARK,
 };
@@ -3052,13 +3024,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(lcd2_sync_1),
 	SH_PFC_PIN_GROUP(lcd2_sys_0),
 	SH_PFC_PIN_GROUP(lcd2_sys_1),
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
 	SH_PFC_PIN_GROUP(msiof0_rsck),
 	SH_PFC_PIN_GROUP(msiof0_tsck),
-- 
2.25.1

