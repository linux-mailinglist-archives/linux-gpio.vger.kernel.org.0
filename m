Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EB047E4BC
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348969AbhLWOmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348894AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03701C061396
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id ZqiF2600K4C55Sk06qiFqp; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006aCl-Mx; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rj5-L8; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 56/60] pinctrl: renesas: r8a7790: Share more VIN pin group data
Date:   Thu, 23 Dec 2021 15:42:06 +0100
Message-Id: <a4f6a70344654456abea1f15539219d1e02a74fe.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin group vin2_g8 is a subset of vin2_data24.

This reduces kernel size by 64 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7790.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 26a696b5335c184d..9c264dee03dfa906 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -3960,18 +3960,6 @@ static const unsigned int vin2_data18_mux[] = {
 	VI2_R4_MARK, VI2_R5_MARK,
 	VI2_R6_MARK, VI2_R7_MARK,
 };
-static const unsigned int vin2_g8_pins[] = {
-	RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
-	RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
-	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
-	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
-};
-static const unsigned int vin2_g8_mux[] = {
-	VI2_G0_MARK, VI2_G1_MARK,
-	VI2_G2_MARK, VI2_G3_MARK,
-	VI2_G4_MARK, VI2_G5_MARK,
-	VI2_G6_MARK, VI2_G7_MARK,
-};
 static const unsigned int vin2_sync_pins[] = {
 	RCAR_GP_PIN(1, 16), /* HSYNC */
 	RCAR_GP_PIN(1, 21), /* VSYNC */
@@ -4346,7 +4334,7 @@ static const struct {
 		BUS_DATA_PIN_GROUP(vin2_data, 16),
 		BUS_DATA_PIN_GROUP(vin2_data, 8),
 		BUS_DATA_PIN_GROUP(vin2_data, 4),
-		SH_PFC_PIN_GROUP(vin2_g8),
+		SH_PFC_PIN_GROUP_SUBSET(vin2_g8, vin2_data, 8, 8),
 		SH_PFC_PIN_GROUP(vin2_sync),
 		SH_PFC_PIN_GROUP(vin2_field),
 		SH_PFC_PIN_GROUP(vin2_clkenb),
-- 
2.25.1

