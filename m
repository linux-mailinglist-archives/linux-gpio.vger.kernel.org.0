Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCDE47E4C6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348872AbhLWOmZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348904AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7BCC0613A5
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by andre.telenet-ops.be with bizsmtp
        id ZqiE260041rdBcm01qiEPf; Thu, 23 Dec 2021 15:42:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a99-5K; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rZg-4i; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/60] pinctrl: renesas: r8a73a4: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:23 +0100
Message-Id: <ad30961d71631577c2bdbf8dfa4874c9585caba9.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups mmc[01]_data[14] are subsets of mmc[01]_data8.

This reduces kernel size by 80 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a73a4.c | 48 ++++++---------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a73a4.c b/drivers/pinctrl/renesas/pfc-r8a73a4.c
index b26ff9d6ead4bb6c..87442a1e17791917 100644
--- a/drivers/pinctrl/renesas/pfc-r8a73a4.c
+++ b/drivers/pinctrl/renesas/pfc-r8a73a4.c
@@ -1449,25 +1449,11 @@ IRQC_PINS_MUX(327, 55);
 IRQC_PINS_MUX(328, 56);
 IRQC_PINS_MUX(329, 57);
 /* - MMCIF0 ----------------------------------------------------------------- */
-static const unsigned int mmc0_data1_pins[] = {
-	/* D[0] */
-	164,
-};
-static const unsigned int mmc0_data1_mux[] = {
-	MMCD0_0_MARK,
-};
-static const unsigned int mmc0_data4_pins[] = {
-	/* D[0:3] */
-	164, 165, 166, 167,
-};
-static const unsigned int mmc0_data4_mux[] = {
-	MMCD0_0_MARK, MMCD0_1_MARK, MMCD0_2_MARK, MMCD0_3_MARK,
-};
-static const unsigned int mmc0_data8_pins[] = {
+static const unsigned int mmc0_data_pins[] = {
 	/* D[0:7] */
 	164, 165, 166, 167, 168, 169, 170, 171,
 };
-static const unsigned int mmc0_data8_mux[] = {
+static const unsigned int mmc0_data_mux[] = {
 	MMCD0_0_MARK, MMCD0_1_MARK, MMCD0_2_MARK, MMCD0_3_MARK,
 	MMCD0_4_MARK, MMCD0_5_MARK, MMCD0_6_MARK, MMCD0_7_MARK,
 };
@@ -1479,25 +1465,11 @@ static const unsigned int mmc0_ctrl_mux[] = {
 	MMCCMD0_MARK, MMCCLK0_MARK,
 };
 /* - MMCIF1 ----------------------------------------------------------------- */
-static const unsigned int mmc1_data1_pins[] = {
-	/* D[0] */
-	199,
-};
-static const unsigned int mmc1_data1_mux[] = {
-	MMCD1_0_MARK,
-};
-static const unsigned int mmc1_data4_pins[] = {
-	/* D[0:3] */
-	199, 198, 197, 196,
-};
-static const unsigned int mmc1_data4_mux[] = {
-	MMCD1_0_MARK, MMCD1_1_MARK, MMCD1_2_MARK, MMCD1_3_MARK,
-};
-static const unsigned int mmc1_data8_pins[] = {
+static const unsigned int mmc1_data_pins[] = {
 	/* D[0:7] */
 	199, 198, 197, 196, 195, 194, 193, 192,
 };
-static const unsigned int mmc1_data8_mux[] = {
+static const unsigned int mmc1_data_mux[] = {
 	MMCD1_0_MARK, MMCD1_1_MARK, MMCD1_2_MARK, MMCD1_3_MARK,
 	MMCD1_4_MARK, MMCD1_5_MARK, MMCD1_6_MARK, MMCD1_7_MARK,
 };
@@ -1843,13 +1815,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(irqc_irq55),
 	SH_PFC_PIN_GROUP(irqc_irq56),
 	SH_PFC_PIN_GROUP(irqc_irq57),
-	SH_PFC_PIN_GROUP(mmc0_data1),
-	SH_PFC_PIN_GROUP(mmc0_data4),
-	SH_PFC_PIN_GROUP(mmc0_data8),
+	BUS_DATA_PIN_GROUP(mmc0_data, 1),
+	BUS_DATA_PIN_GROUP(mmc0_data, 4),
+	BUS_DATA_PIN_GROUP(mmc0_data, 8),
 	SH_PFC_PIN_GROUP(mmc0_ctrl),
-	SH_PFC_PIN_GROUP(mmc1_data1),
-	SH_PFC_PIN_GROUP(mmc1_data4),
-	SH_PFC_PIN_GROUP(mmc1_data8),
+	BUS_DATA_PIN_GROUP(mmc1_data, 1),
+	BUS_DATA_PIN_GROUP(mmc1_data, 4),
+	BUS_DATA_PIN_GROUP(mmc1_data, 8),
 	SH_PFC_PIN_GROUP(mmc1_ctrl),
 	SH_PFC_PIN_GROUP(scifa0_data),
 	SH_PFC_PIN_GROUP(scifa0_clk),
-- 
2.25.1

