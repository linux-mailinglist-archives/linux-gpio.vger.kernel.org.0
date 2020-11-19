Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5916C2B9342
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 14:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgKSNJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 08:09:47 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:25940 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727520AbgKSNJq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 08:09:46 -0500
X-IronPort-AV: E=Sophos;i="5.77,490,1596466800"; 
   d="scan'208";a="63036289"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Nov 2020 22:09:45 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F3DF24005E1A;
        Thu, 19 Nov 2020 22:09:43 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] pinctrl: renesas: r8a77965: Add QSPI[01] pins, groups and functions
Date:   Thu, 19 Nov 2020 13:09:26 +0000
Message-Id: <20201119130926.25692-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups and functions for QSPIO[01].

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a77965.c | 75 +++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index 590e5f8006d4..92f231baff7d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -3408,6 +3408,57 @@ static const unsigned int pwm6_b_mux[] = {
 	PWM6_B_MARK,
 };
 
+/* - QSPI0 ------------------------------------------------------------------ */
+static const unsigned int qspi0_ctrl_pins[] = {
+	/* QSPI0_SPCLK, QSPI0_SSL */
+	PIN_QSPI0_SPCLK, PIN_QSPI0_SSL,
+};
+static const unsigned int qspi0_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+static const unsigned int qspi0_data2_pins[] = {
+	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
+	PIN_QSPI0_MOSI_IO0, PIN_QSPI0_MISO_IO1,
+};
+static const unsigned int qspi0_data2_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+};
+static const unsigned int qspi0_data4_pins[] = {
+	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
+	PIN_QSPI0_MOSI_IO0, PIN_QSPI0_MISO_IO1,
+	/* QSPI0_IO2, QSPI0_IO3 */
+	PIN_QSPI0_IO2, PIN_QSPI0_IO3,
+};
+static const unsigned int qspi0_data4_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
+};
+/* - QSPI1 ------------------------------------------------------------------ */
+static const unsigned int qspi1_ctrl_pins[] = {
+	/* QSPI1_SPCLK, QSPI1_SSL */
+	PIN_QSPI1_SPCLK, PIN_QSPI1_SSL,
+};
+static const unsigned int qspi1_ctrl_mux[] = {
+	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int qspi1_data2_pins[] = {
+	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
+	PIN_QSPI1_MOSI_IO0, PIN_QSPI1_MISO_IO1,
+};
+static const unsigned int qspi1_data2_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+};
+static const unsigned int qspi1_data4_pins[] = {
+	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
+	PIN_QSPI1_MOSI_IO0, PIN_QSPI1_MISO_IO1,
+	/* QSPI1_IO2, QSPI1_IO3 */
+	PIN_QSPI1_IO2, PIN_QSPI1_IO3,
+};
+static const unsigned int qspi1_data4_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
+};
+
 /* - SATA --------------------------------------------------------------------*/
 static const unsigned int sata0_devslp_a_pins[] = {
 	/* DEVSLP */
@@ -4381,7 +4432,7 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[318];
+	struct sh_pfc_pin_group common[324];
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
 	struct sh_pfc_pin_group automotive[30];
 #endif
@@ -4586,6 +4637,12 @@ static const struct {
 		SH_PFC_PIN_GROUP(pwm5_b),
 		SH_PFC_PIN_GROUP(pwm6_a),
 		SH_PFC_PIN_GROUP(pwm6_b),
+		SH_PFC_PIN_GROUP(qspi0_ctrl),
+		SH_PFC_PIN_GROUP(qspi0_data2),
+		SH_PFC_PIN_GROUP(qspi0_data4),
+		SH_PFC_PIN_GROUP(qspi1_ctrl),
+		SH_PFC_PIN_GROUP(qspi1_data2),
+		SH_PFC_PIN_GROUP(qspi1_data4),
 		SH_PFC_PIN_GROUP(sata0_devslp_a),
 		SH_PFC_PIN_GROUP(sata0_devslp_b),
 		SH_PFC_PIN_GROUP(scif0_data),
@@ -5078,6 +5135,18 @@ static const char * const pwm6_groups[] = {
 	"pwm6_b",
 };
 
+static const char * const qspi0_groups[] = {
+	"qspi0_ctrl",
+	"qspi0_data2",
+	"qspi0_data4",
+};
+
+static const char * const qspi1_groups[] = {
+	"qspi1_ctrl",
+	"qspi1_data2",
+	"qspi1_data4",
+};
+
 static const char * const sata0_groups[] = {
 	"sata0_devslp_a",
 	"sata0_devslp_b",
@@ -5257,7 +5326,7 @@ static const char * const vin5_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[51];
+	struct sh_pfc_function common[53];
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
 	struct sh_pfc_function automotive[4];
 #endif
@@ -5294,6 +5363,8 @@ static const struct {
 		SH_PFC_FUNCTION(pwm4),
 		SH_PFC_FUNCTION(pwm5),
 		SH_PFC_FUNCTION(pwm6),
+		SH_PFC_FUNCTION(qspi0),
+		SH_PFC_FUNCTION(qspi1),
 		SH_PFC_FUNCTION(sata0),
 		SH_PFC_FUNCTION(scif0),
 		SH_PFC_FUNCTION(scif1),
-- 
2.17.1

