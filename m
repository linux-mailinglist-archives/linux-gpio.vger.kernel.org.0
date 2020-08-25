Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929082515C0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 11:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgHYJzK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 05:55:10 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:1287 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729534AbgHYJzK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Aug 2020 05:55:10 -0400
X-IronPort-AV: E=Sophos;i="5.76,351,1592838000"; 
   d="scan'208";a="55473398"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2020 18:55:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BF50740083E6;
        Tue, 25 Aug 2020 18:55:05 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.or, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] pinctrl: sh-pfc: r8a7790: Add CAN pins, groups and functions
Date:   Tue, 25 Aug 2020 10:54:48 +0100
Message-Id: <20200825095448.13093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups and functions for the CAN{0,1} interface.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
Hi All,
This patch is part of series [1], since rest of the patches have been
acked, I am resending patch 1/3 from the series.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=333191

v1->v2
* Added CAN clk pins
---
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 112 ++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index 39ba1e7cc1c3..60f973c5dffe 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -1871,6 +1871,86 @@ static const unsigned int avb_gmii_mux[] = {
 	AVB_TX_EN_MARK, AVB_TX_ER_MARK, AVB_TX_CLK_MARK,
 	AVB_COL_MARK,
 };
+/* - CAN0 ----------------------------------------------------------------- */
+static const unsigned int can0_data_pins[] = {
+	/* CAN0 RX */
+	RCAR_GP_PIN(1, 17),
+	/* CAN0 TX */
+	RCAR_GP_PIN(1, 19),
+};
+static const unsigned int can0_data_mux[] = {
+	CAN0_RX_MARK,
+	CAN0_TX_MARK,
+};
+static const unsigned int can0_data_b_pins[] = {
+	/* CAN0 RXB */
+	RCAR_GP_PIN(4, 5),
+	/* CAN0 TXB */
+	RCAR_GP_PIN(4, 4),
+};
+static const unsigned int can0_data_b_mux[] = {
+	CAN0_RX_B_MARK,
+	CAN0_TX_B_MARK,
+};
+static const unsigned int can0_data_c_pins[] = {
+	/* CAN0 RXC */
+	RCAR_GP_PIN(4, 26),
+	/* CAN0 TXC */
+	RCAR_GP_PIN(4, 23),
+};
+static const unsigned int can0_data_c_mux[] = {
+	CAN0_RX_C_MARK,
+	CAN0_TX_C_MARK,
+};
+static const unsigned int can0_data_d_pins[] = {
+	/* CAN0 RXD */
+	RCAR_GP_PIN(4, 26),
+	/* CAN0 TXD */
+	RCAR_GP_PIN(4, 18),
+};
+static const unsigned int can0_data_d_mux[] = {
+	CAN0_RX_D_MARK,
+	CAN0_TX_D_MARK,
+};
+/* - CAN1 ----------------------------------------------------------------- */
+static const unsigned int can1_data_pins[] = {
+	/* CAN1 RX */
+	RCAR_GP_PIN(1, 22),
+	/* CAN1 TX */
+	RCAR_GP_PIN(1, 18),
+};
+static const unsigned int can1_data_mux[] = {
+	CAN1_RX_MARK,
+	CAN1_TX_MARK,
+};
+static const unsigned int can1_data_b_pins[] = {
+	/* CAN1 RXB */
+	RCAR_GP_PIN(4, 7),
+	/* CAN1 TXB */
+	RCAR_GP_PIN(4, 6),
+};
+static const unsigned int can1_data_b_mux[] = {
+	CAN1_RX_B_MARK,
+	CAN1_TX_B_MARK,
+};
+/* - CAN Clock -------------------------------------------------------------- */
+static const unsigned int can_clk_pins[] = {
+	/* CLK */
+	RCAR_GP_PIN(1, 21),
+};
+
+static const unsigned int can_clk_mux[] = {
+	CAN_CLK_MARK,
+};
+
+static const unsigned int can_clk_b_pins[] = {
+	/* CLK */
+	RCAR_GP_PIN(4, 3),
+};
+
+static const unsigned int can_clk_b_mux[] = {
+	CAN_CLK_B_MARK,
+};
 /* - DU RGB ----------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
 	/* R[7:2], G[7:2], B[7:2] */
@@ -3946,7 +4026,7 @@ static const unsigned int vin3_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[290];
+	struct sh_pfc_pin_group common[298];
 	struct sh_pfc_pin_group automotive[1];
 } pinmux_groups = {
 	.common = {
@@ -3963,6 +4043,14 @@ static const struct {
 		SH_PFC_PIN_GROUP(avb_mdio),
 		SH_PFC_PIN_GROUP(avb_mii),
 		SH_PFC_PIN_GROUP(avb_gmii),
+		SH_PFC_PIN_GROUP(can0_data),
+		SH_PFC_PIN_GROUP(can0_data_b),
+		SH_PFC_PIN_GROUP(can0_data_c),
+		SH_PFC_PIN_GROUP(can0_data_d),
+		SH_PFC_PIN_GROUP(can1_data),
+		SH_PFC_PIN_GROUP(can1_data_b),
+		SH_PFC_PIN_GROUP(can_clk),
+		SH_PFC_PIN_GROUP(can_clk_b),
 		SH_PFC_PIN_GROUP(du_rgb666),
 		SH_PFC_PIN_GROUP(du_rgb888),
 		SH_PFC_PIN_GROUP(du_clk_out_0),
@@ -4265,6 +4353,23 @@ static const char * const avb_groups[] = {
 	"avb_gmii",
 };
 
+static const char * const can0_groups[] = {
+	"can0_data",
+	"can0_data_b",
+	"can0_data_c",
+	"can0_data_d",
+};
+
+static const char * const can1_groups[] = {
+	"can1_data",
+	"can1_data_b",
+};
+
+static const char * const can_clk_groups[] = {
+	"can_clk",
+	"can_clk_b",
+};
+
 static const char * const du_groups[] = {
 	"du_rgb666",
 	"du_rgb888",
@@ -4706,13 +4811,16 @@ static const char * const vin3_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[55];
+	struct sh_pfc_function common[58];
 	struct sh_pfc_function automotive[1];
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
 		SH_PFC_FUNCTION(avb),
 		SH_PFC_FUNCTION(du),
+		SH_PFC_FUNCTION(can0),
+		SH_PFC_FUNCTION(can1),
+		SH_PFC_FUNCTION(can_clk),
 		SH_PFC_FUNCTION(du0),
 		SH_PFC_FUNCTION(du1),
 		SH_PFC_FUNCTION(du2),
-- 
2.17.1

