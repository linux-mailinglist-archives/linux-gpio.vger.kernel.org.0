Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9468A47E4FC
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243933AbhLWOmg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348967AbhLWOmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:20 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD16C061A32
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id ZqiF2600J4C55Sk06qiFbf; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006aCs-SL; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rka-O1; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 59/60] pinctrl: renesas: r8a77965: Share more VIN pin group data
Date:   Thu, 23 Dec 2021 15:42:09 +0100
Message-Id: <fd8779f5c7a397e8e4dc3604fe2af55e250a9f40.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin group vin4_g8 is a subset of vin4_data24_a.
Pin group vin5_high8 is a subset of vin5_data16.

This reduces kernel size by 128 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77965.c | 32 ++------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index e865220bdbd28046..75e7b02337b2efea 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -4266,20 +4266,6 @@ static const unsigned int vin4_data_b_mux[] = {
 	VI4_DATA22_MARK,  VI4_DATA23_MARK,
 };
 
-static const unsigned int vin4_g8_pins[] = {
-	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
-	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
-	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
-};
-
-static const unsigned int vin4_g8_mux[] = {
-	VI4_DATA8_MARK,  VI4_DATA9_MARK,
-	VI4_DATA10_MARK, VI4_DATA11_MARK,
-	VI4_DATA12_MARK, VI4_DATA13_MARK,
-	VI4_DATA14_MARK, VI4_DATA15_MARK,
-};
-
 static const unsigned int vin4_sync_pins[] = {
 	/* VSYNC_N, HSYNC_N */
 	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
@@ -4336,20 +4322,6 @@ static const unsigned int vin5_data_mux[] = {
 	VI5_DATA14_MARK, VI5_DATA15_MARK,
 };
 
-static const unsigned int vin5_high8_pins[] = {
-	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
-	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
-	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
-};
-
-static const unsigned int vin5_high8_mux[] = {
-	VI5_DATA8_MARK,  VI5_DATA9_MARK,
-	VI5_DATA10_MARK, VI5_DATA11_MARK,
-	VI5_DATA12_MARK, VI5_DATA13_MARK,
-	VI5_DATA14_MARK, VI5_DATA15_MARK,
-};
-
 static const unsigned int vin5_sync_pins[] = {
 	/* VSYNC_N, HSYNC_N */
 	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 10),
@@ -4702,7 +4674,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin4_data18_b),
 		BUS_DATA_PIN_GROUP(vin4_data, 20, _b),
 		BUS_DATA_PIN_GROUP(vin4_data, 24, _b),
-		SH_PFC_PIN_GROUP(vin4_g8),
+		SH_PFC_PIN_GROUP_SUBSET(vin4_g8, vin4_data_a, 8, 8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
@@ -4711,7 +4683,7 @@ static const struct {
 		BUS_DATA_PIN_GROUP(vin5_data, 10),
 		BUS_DATA_PIN_GROUP(vin5_data, 12),
 		BUS_DATA_PIN_GROUP(vin5_data, 16),
-		SH_PFC_PIN_GROUP(vin5_high8),
+		SH_PFC_PIN_GROUP_SUBSET(vin5_high8, vin5_data, 8, 8),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
 		SH_PFC_PIN_GROUP(vin5_clkenb),
-- 
2.25.1

