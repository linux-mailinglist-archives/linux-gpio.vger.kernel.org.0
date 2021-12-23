Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88F847E4B4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348930AbhLWOmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348882AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2A1C0617A0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by laurent.telenet-ops.be with bizsmtp
        id ZqiD2600A1rdBcm01qiD10; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a90-RD; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rbH-IN; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 26/60] pinctrl: renesas: r8a77470: Share QSPI pin group data
Date:   Thu, 23 Dec 2021 15:41:36 +0100
Message-Id: <2d877878bda39109a1a5caf5c01c798c771d3fda.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups qspi[01]_data2 are subsets of qspi[01]_data4.

This reduces kernel size by 32 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 30 +++++++-------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index deaeaa5a467cae46..ef44c27417be9802 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -1623,19 +1623,12 @@ static const unsigned int qspi0_ctrl_pins[] = {
 static const unsigned int qspi0_ctrl_mux[] = {
 	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
 };
-static const unsigned int qspi0_data2_pins[] = {
-	/* MOSI_IO0, MISO_IO1 */
-	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
-};
-static const unsigned int qspi0_data2_mux[] = {
-	QSPI0_MOSI_QSPI0_IO0_MARK, QSPI0_MISO_QSPI0_IO1_MARK,
-};
-static const unsigned int qspi0_data4_pins[] = {
+static const unsigned int qspi0_data_pins[] = {
 	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
 	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 19),
 	RCAR_GP_PIN(1, 20),
 };
-static const unsigned int qspi0_data4_mux[] = {
+static const unsigned int qspi0_data_mux[] = {
 	QSPI0_MOSI_QSPI0_IO0_MARK, QSPI0_MISO_QSPI0_IO1_MARK,
 	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
 };
@@ -1646,19 +1639,12 @@ static const unsigned int qspi1_ctrl_pins[] = {
 static const unsigned int qspi1_ctrl_mux[] = {
 	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
 };
-static const unsigned int qspi1_data2_pins[] = {
-	/* MOSI_IO0, MISO_IO1 */
-	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5),
-};
-static const unsigned int qspi1_data2_mux[] = {
-	QSPI1_MOSI_QSPI1_IO0_MARK, QSPI1_MISO_QSPI1_IO1_MARK,
-};
-static const unsigned int qspi1_data4_pins[] = {
+static const unsigned int qspi1_data_pins[] = {
 	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
 	RCAR_GP_PIN(4, 4), RCAR_GP_PIN(4, 5), RCAR_GP_PIN(4, 7),
 	RCAR_GP_PIN(4, 8),
 };
-static const unsigned int qspi1_data4_mux[] = {
+static const unsigned int qspi1_data_mux[] = {
 	QSPI1_MOSI_QSPI1_IO0_MARK, QSPI1_MISO_QSPI1_IO1_MARK,
 	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
 };
@@ -2201,11 +2187,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	BUS_DATA_PIN_GROUP(mmc_data, 8),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
-	SH_PFC_PIN_GROUP(qspi0_data2),
-	SH_PFC_PIN_GROUP(qspi0_data4),
+	BUS_DATA_PIN_GROUP(qspi0_data, 2),
+	BUS_DATA_PIN_GROUP(qspi0_data, 4),
 	SH_PFC_PIN_GROUP(qspi1_ctrl),
-	SH_PFC_PIN_GROUP(qspi1_data2),
-	SH_PFC_PIN_GROUP(qspi1_data4),
+	BUS_DATA_PIN_GROUP(qspi1_data, 2),
+	BUS_DATA_PIN_GROUP(qspi1_data, 4),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_data_b),
 	SH_PFC_PIN_GROUP(scif0_data_c),
-- 
2.25.1

