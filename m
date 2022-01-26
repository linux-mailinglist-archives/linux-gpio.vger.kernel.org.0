Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB2249C9B3
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jan 2022 13:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241315AbiAZM3h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jan 2022 07:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234212AbiAZM3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jan 2022 07:29:35 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A52C061753
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jan 2022 04:29:35 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c4c8:1afa:4649:d034])
        by andre.telenet-ops.be with bizsmtp
        id nQVZ2600V2MCa5R01QVZ66; Wed, 26 Jan 2022 13:29:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nChQb-00BUGo-Ai; Wed, 26 Jan 2022 13:29:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nChQa-004bWu-N1; Wed, 26 Jan 2022 13:29:32 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] pinctrl: renesas: r8a77995: Restore pin group sort order
Date:   Wed, 26 Jan 2022 13:29:31 +0100
Message-Id: <da1018c56134b910121b085b736fe7f664b96df1.1643199959.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643199959.git.geert+renesas@glider.be>
References: <cover.1643199959.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the msiof* pin groups where they belong.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77995.c | 86 +++++++++++++-------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 52918dda6d5895f1..445c903a121acedd 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -2210,6 +2210,49 @@ static const char * const mmc_groups[] = {
 	"mmc_ctrl",
 };
 
+static const char * const msiof0_groups[] = {
+	"msiof0_clk",
+	"msiof0_sync",
+	"msiof0_ss1",
+	"msiof0_ss2",
+	"msiof0_txd",
+	"msiof0_rxd",
+};
+
+static const char * const msiof1_groups[] = {
+	"msiof1_clk",
+	"msiof1_sync",
+	"msiof1_ss1",
+	"msiof1_ss2",
+	"msiof1_txd",
+	"msiof1_rxd",
+};
+
+static const char * const msiof2_groups[] = {
+	"msiof2_clk",
+	"msiof2_sync_a",
+	"msiof2_sync_b",
+	"msiof2_ss1",
+	"msiof2_ss2",
+	"msiof2_txd",
+	"msiof2_rxd",
+};
+
+static const char * const msiof3_groups[] = {
+	"msiof3_clk_a",
+	"msiof3_sync_a",
+	"msiof3_ss1_a",
+	"msiof3_ss2_a",
+	"msiof3_txd_a",
+	"msiof3_rxd_a",
+	"msiof3_clk_b",
+	"msiof3_sync_b",
+	"msiof3_ss1_b",
+	"msiof3_ss2_b",
+	"msiof3_txd_b",
+	"msiof3_rxd_b",
+};
+
 static const char * const pwm0_groups[] = {
 	"pwm0_a",
 	"pwm0_b",
@@ -2307,49 +2350,6 @@ static const char * const vin4_groups[] = {
 	"vin4_clk",
 };
 
-static const char * const msiof0_groups[] = {
-	"msiof0_clk",
-	"msiof0_sync",
-	"msiof0_ss1",
-	"msiof0_ss2",
-	"msiof0_txd",
-	"msiof0_rxd",
-};
-
-static const char * const msiof1_groups[] = {
-	"msiof1_clk",
-	"msiof1_sync",
-	"msiof1_ss1",
-	"msiof1_ss2",
-	"msiof1_txd",
-	"msiof1_rxd",
-};
-
-static const char * const msiof2_groups[] = {
-	"msiof2_clk",
-	"msiof2_sync_a",
-	"msiof2_sync_b",
-	"msiof2_ss1",
-	"msiof2_ss2",
-	"msiof2_txd",
-	"msiof2_rxd",
-};
-
-static const char * const msiof3_groups[] = {
-	"msiof3_clk_a",
-	"msiof3_sync_a",
-	"msiof3_ss1_a",
-	"msiof3_ss2_a",
-	"msiof3_txd_a",
-	"msiof3_rxd_a",
-	"msiof3_clk_b",
-	"msiof3_sync_b",
-	"msiof3_ss1_b",
-	"msiof3_ss2_b",
-	"msiof3_txd_b",
-	"msiof3_rxd_b",
-};
-
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb0),
-- 
2.25.1

