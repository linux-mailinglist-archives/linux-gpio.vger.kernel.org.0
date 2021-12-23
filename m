Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E0E47E4B1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348880AbhLWOmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348895AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039FFC061397
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by andre.telenet-ops.be with bizsmtp
        id ZqiD2600M1rdBcm01qiDPQ; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a90-Se; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rbO-J8; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 27/60] pinctrl: renesas: r8a7790: Share QSPI pin group data
Date:   Thu, 23 Dec 2021 15:41:37 +0100
Message-Id: <5bf6a5bd35e619c5d5da4a49878a88f48bb62a30.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin group qspi_data2 is a subset of qspi_data4.

This reduces kernel size by 16 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7790.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 6f7e710b393a259e..f24894071d78ac8c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -2778,19 +2778,12 @@ static const unsigned int qspi_ctrl_pins[] = {
 static const unsigned int qspi_ctrl_mux[] = {
 	SPCLK_MARK, SSL_MARK,
 };
-static const unsigned int qspi_data2_pins[] = {
-	/* MOSI_IO0, MISO_IO1 */
-	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
-};
-static const unsigned int qspi_data2_mux[] = {
-	MOSI_IO0_MARK, MISO_IO1_MARK,
-};
-static const unsigned int qspi_data4_pins[] = {
+static const unsigned int qspi_data_pins[] = {
 	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
 	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
 	RCAR_GP_PIN(1, 8),
 };
-static const unsigned int qspi_data4_mux[] = {
+static const unsigned int qspi_data_mux[] = {
 	MOSI_IO0_MARK, MISO_IO1_MARK, IO2_MARK, IO3_MARK,
 };
 /* - SCIF0 ------------------------------------------------------------------ */
@@ -4228,8 +4221,8 @@ static const struct {
 		SH_PFC_PIN_GROUP(pwm5),
 		SH_PFC_PIN_GROUP(pwm6),
 		SH_PFC_PIN_GROUP(qspi_ctrl),
-		SH_PFC_PIN_GROUP(qspi_data2),
-		SH_PFC_PIN_GROUP(qspi_data4),
+		BUS_DATA_PIN_GROUP(qspi_data, 2),
+		BUS_DATA_PIN_GROUP(qspi_data, 4),
 		SH_PFC_PIN_GROUP(scif0_data),
 		SH_PFC_PIN_GROUP(scif0_clk),
 		SH_PFC_PIN_GROUP(scif0_ctrl),
-- 
2.25.1

