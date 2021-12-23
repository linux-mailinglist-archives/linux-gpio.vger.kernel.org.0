Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E7C47E510
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348941AbhLWOmn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348975AbhLWOmV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:21 -0500
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07FBC06175D
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:20 -0800 (PST)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4JKXw73nQxzMqbHX
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 15:42:15 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqiF2600N1rdBcm01qiFNK; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006aAv-Uz; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rfZ-5F; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 42/60] pinctrl: renesas: r8a7778: Share SDHI pin group data
Date:   Thu, 23 Dec 2021 15:41:52 +0100
Message-Id: <997df5b8a01657ede685c0869d73e4d6b71dce26.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin group sdhi0_data1 is a subset of sdhi0_data4.
Pin groups sdhi[12]_data1_[ab] are subsets of sdhi[12]_data4_[ab].

This reduces kernel size by 40 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7778.c | 51 +++++++++++----------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index 3b9bdd27cab98cc6..a24672ca3c01babe 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -1522,7 +1522,6 @@ SCIF_PFC_DAT(scif5_data_b,	TX5_B,			RX5_B);
 
 /* - SDHI macro ------------------------------------------------------------- */
 #define SDHI_PFC_PINS(name, args...)		SH_PFC_PINS(name, args)
-#define SDHI_PFC_DAT1(name, d0)			SH_PFC_MUX1(name, d0)
 #define SDHI_PFC_DAT4(name, d0, d1, d2, d3)	SH_PFC_MUX4(name, d0, d1, d2, d3)
 #define SDHI_PFC_CTRL(name, clk, cmd)		SH_PFC_MUX2(name, clk, cmd)
 #define SDHI_PFC_CDPN(name, cd)			SH_PFC_MUX1(name, cd)
@@ -1533,11 +1532,9 @@ SDHI_PFC_PINS(sdhi0_cd,		RCAR_GP_PIN(3, 17));
 SDHI_PFC_CDPN(sdhi0_cd,		SD0_CD);
 SDHI_PFC_PINS(sdhi0_ctrl,	RCAR_GP_PIN(3, 11),	RCAR_GP_PIN(3, 12));
 SDHI_PFC_CTRL(sdhi0_ctrl,	SD0_CLK,		SD0_CMD);
-SDHI_PFC_PINS(sdhi0_data1,	RCAR_GP_PIN(3, 13));
-SDHI_PFC_DAT1(sdhi0_data1,	SD0_DAT0);
-SDHI_PFC_PINS(sdhi0_data4,	RCAR_GP_PIN(3, 13),	RCAR_GP_PIN(3, 14),
+SDHI_PFC_PINS(sdhi0_data,	RCAR_GP_PIN(3, 13),	RCAR_GP_PIN(3, 14),
 				RCAR_GP_PIN(3, 15),	RCAR_GP_PIN(3, 16));
-SDHI_PFC_DAT4(sdhi0_data4,	SD0_DAT0,		SD0_DAT1,
+SDHI_PFC_DAT4(sdhi0_data,	SD0_DAT0,		SD0_DAT1,
 				SD0_DAT2,		SD0_DAT3);
 SDHI_PFC_PINS(sdhi0_wp,		RCAR_GP_PIN(3, 18));
 SDHI_PFC_WPPN(sdhi0_wp,		SD0_WP);
@@ -1551,17 +1548,13 @@ SDHI_PFC_PINS(sdhi1_ctrl_a,	RCAR_GP_PIN(1, 5),	RCAR_GP_PIN(1, 6));
 SDHI_PFC_CTRL(sdhi1_ctrl_a,	SD1_CLK_A,		SD1_CMD_A);
 SDHI_PFC_PINS(sdhi1_ctrl_b,	RCAR_GP_PIN(1, 17),	RCAR_GP_PIN(1, 16));
 SDHI_PFC_CTRL(sdhi1_ctrl_b,	SD1_CLK_B,		SD1_CMD_B);
-SDHI_PFC_PINS(sdhi1_data1_a,	RCAR_GP_PIN(1, 7));
-SDHI_PFC_DAT1(sdhi1_data1_a,	SD1_DAT0_A);
-SDHI_PFC_PINS(sdhi1_data1_b,	RCAR_GP_PIN(1, 18));
-SDHI_PFC_DAT1(sdhi1_data1_b,	SD1_DAT0_B);
-SDHI_PFC_PINS(sdhi1_data4_a,	RCAR_GP_PIN(1, 7),	RCAR_GP_PIN(1, 8),
+SDHI_PFC_PINS(sdhi1_data_a,	RCAR_GP_PIN(1, 7),	RCAR_GP_PIN(1, 8),
 				RCAR_GP_PIN(0, 5),	RCAR_GP_PIN(0, 6));
-SDHI_PFC_DAT4(sdhi1_data4_a,	SD1_DAT0_A,		SD1_DAT1_A,
+SDHI_PFC_DAT4(sdhi1_data_a,	SD1_DAT0_A,		SD1_DAT1_A,
 				SD1_DAT2_A,		SD1_DAT3_A);
-SDHI_PFC_PINS(sdhi1_data4_b,	RCAR_GP_PIN(1, 18),	RCAR_GP_PIN(1, 19),
+SDHI_PFC_PINS(sdhi1_data_b,	RCAR_GP_PIN(1, 18),	RCAR_GP_PIN(1, 19),
 				RCAR_GP_PIN(1, 20),	RCAR_GP_PIN(1, 21));
-SDHI_PFC_DAT4(sdhi1_data4_b,	SD1_DAT0_B,		SD1_DAT1_B,
+SDHI_PFC_DAT4(sdhi1_data_b,	SD1_DAT0_B,		SD1_DAT1_B,
 				SD1_DAT2_B,		SD1_DAT3_B);
 SDHI_PFC_PINS(sdhi1_wp_a,	RCAR_GP_PIN(0, 31));
 SDHI_PFC_WPPN(sdhi1_wp_a,	SD1_WP_A);
@@ -1577,17 +1570,13 @@ SDHI_PFC_PINS(sdhi2_ctrl_a,	RCAR_GP_PIN(4, 17),	RCAR_GP_PIN(4, 18));
 SDHI_PFC_CTRL(sdhi2_ctrl_a,	SD2_CLK_A,		SD2_CMD_A);
 SDHI_PFC_PINS(sdhi2_ctrl_b,	RCAR_GP_PIN(4, 5),	RCAR_GP_PIN(4, 6));
 SDHI_PFC_CTRL(sdhi2_ctrl_b,	SD2_CLK_B,		SD2_CMD_B);
-SDHI_PFC_PINS(sdhi2_data1_a,	RCAR_GP_PIN(4, 19));
-SDHI_PFC_DAT1(sdhi2_data1_a,	SD2_DAT0_A);
-SDHI_PFC_PINS(sdhi2_data1_b,	RCAR_GP_PIN(4, 7));
-SDHI_PFC_DAT1(sdhi2_data1_b,	SD2_DAT0_B);
-SDHI_PFC_PINS(sdhi2_data4_a,	RCAR_GP_PIN(4, 19),	RCAR_GP_PIN(4, 20),
+SDHI_PFC_PINS(sdhi2_data_a,	RCAR_GP_PIN(4, 19),	RCAR_GP_PIN(4, 20),
 				RCAR_GP_PIN(4, 21),	RCAR_GP_PIN(4, 22));
-SDHI_PFC_DAT4(sdhi2_data4_a,	SD2_DAT0_A,		SD2_DAT1_A,
+SDHI_PFC_DAT4(sdhi2_data_a,	SD2_DAT0_A,		SD2_DAT1_A,
 				SD2_DAT2_A,		SD2_DAT3_A);
-SDHI_PFC_PINS(sdhi2_data4_b,	RCAR_GP_PIN(4, 7),	RCAR_GP_PIN(4, 8),
+SDHI_PFC_PINS(sdhi2_data_b,	RCAR_GP_PIN(4, 7),	RCAR_GP_PIN(4, 8),
 				RCAR_GP_PIN(3, 25),	RCAR_GP_PIN(3, 26));
-SDHI_PFC_DAT4(sdhi2_data4_b,	SD2_DAT0_B,		SD2_DAT1_B,
+SDHI_PFC_DAT4(sdhi2_data_b,	SD2_DAT0_B,		SD2_DAT1_B,
 				SD2_DAT2_B,		SD2_DAT3_B);
 SDHI_PFC_PINS(sdhi2_wp_a,	RCAR_GP_PIN(4, 24));
 SDHI_PFC_WPPN(sdhi2_wp_a,	SD2_WP_A);
@@ -1773,27 +1762,27 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif5_data_b),
 	SH_PFC_PIN_GROUP(sdhi0_cd),
 	SH_PFC_PIN_GROUP(sdhi0_ctrl),
-	SH_PFC_PIN_GROUP(sdhi0_data1),
-	SH_PFC_PIN_GROUP(sdhi0_data4),
+	BUS_DATA_PIN_GROUP(sdhi0_data, 1),
+	BUS_DATA_PIN_GROUP(sdhi0_data, 4),
 	SH_PFC_PIN_GROUP(sdhi0_wp),
 	SH_PFC_PIN_GROUP(sdhi1_cd_a),
 	SH_PFC_PIN_GROUP(sdhi1_cd_b),
 	SH_PFC_PIN_GROUP(sdhi1_ctrl_a),
 	SH_PFC_PIN_GROUP(sdhi1_ctrl_b),
-	SH_PFC_PIN_GROUP(sdhi1_data1_a),
-	SH_PFC_PIN_GROUP(sdhi1_data1_b),
-	SH_PFC_PIN_GROUP(sdhi1_data4_a),
-	SH_PFC_PIN_GROUP(sdhi1_data4_b),
+	BUS_DATA_PIN_GROUP(sdhi1_data, 1, _a),
+	BUS_DATA_PIN_GROUP(sdhi1_data, 1, _b),
+	BUS_DATA_PIN_GROUP(sdhi1_data, 4, _a),
+	BUS_DATA_PIN_GROUP(sdhi1_data, 4, _b),
 	SH_PFC_PIN_GROUP(sdhi1_wp_a),
 	SH_PFC_PIN_GROUP(sdhi1_wp_b),
 	SH_PFC_PIN_GROUP(sdhi2_cd_a),
 	SH_PFC_PIN_GROUP(sdhi2_cd_b),
 	SH_PFC_PIN_GROUP(sdhi2_ctrl_a),
 	SH_PFC_PIN_GROUP(sdhi2_ctrl_b),
-	SH_PFC_PIN_GROUP(sdhi2_data1_a),
-	SH_PFC_PIN_GROUP(sdhi2_data1_b),
-	SH_PFC_PIN_GROUP(sdhi2_data4_a),
-	SH_PFC_PIN_GROUP(sdhi2_data4_b),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 1, _a),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 1, _b),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 4, _a),
+	BUS_DATA_PIN_GROUP(sdhi2_data, 4, _b),
 	SH_PFC_PIN_GROUP(sdhi2_wp_a),
 	SH_PFC_PIN_GROUP(sdhi2_wp_b),
 	SH_PFC_PIN_GROUP(ssi012_ctrl),
-- 
2.25.1

