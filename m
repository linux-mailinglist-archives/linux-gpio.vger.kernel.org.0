Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AB947E4DD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348920AbhLWOm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348865AbhLWOmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:18 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38473C0613B5
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:17 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by xavier.telenet-ops.be with bizsmtp
        id ZqiF2600G1rdBcm01qiFd6; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a92-L3; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rZE-0Z; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/60] pinctrl: renesas: r8a7791: Share HSCIF1 pin group data
Date:   Thu, 23 Dec 2021 15:41:19 +0100
Message-Id: <5afdfcaa24d41ebc50af37ff5da055203744f8b5.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin group hscif1_data_e can be an alias for hscif1_data_c.

This reduces kernel size by 16 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7791.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index cdc5408e792b49fa..c3aa794a09e51b80 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -2298,13 +2298,6 @@ static const unsigned int hscif1_data_d_pins[] = {
 static const unsigned int hscif1_data_d_mux[] = {
 	HRX1_D_MARK, HTX1_D_MARK,
 };
-static const unsigned int hscif1_data_e_pins[] = {
-	/* RX, TX */
-	RCAR_GP_PIN(7, 14), RCAR_GP_PIN(7, 15),
-};
-static const unsigned int hscif1_data_e_mux[] = {
-	HRX1_C_MARK, HTX1_C_MARK,
-};
 static const unsigned int hscif1_clk_e_pins[] = {
 	/* SCK */
 	RCAR_GP_PIN(2, 6),
@@ -4543,7 +4536,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(hscif1_clk_c),
 		SH_PFC_PIN_GROUP(hscif1_ctrl_c),
 		SH_PFC_PIN_GROUP(hscif1_data_d),
-		SH_PFC_PIN_GROUP(hscif1_data_e),
+		SH_PFC_PIN_GROUP_ALIAS(hscif1_data_e, hscif1_data_c),
 		SH_PFC_PIN_GROUP(hscif1_clk_e),
 		SH_PFC_PIN_GROUP(hscif1_ctrl_e),
 		SH_PFC_PIN_GROUP(hscif2_data),
-- 
2.25.1

