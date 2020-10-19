Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CE7292794
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 14:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbgJSMnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 08:43:12 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6248 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726336AbgJSMnM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 08:43:12 -0400
X-IronPort-AV: E=Sophos;i="5.77,394,1596466800"; 
   d="scan'208";a="60189684"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Oct 2020 21:43:11 +0900
Received: from localhost.localdomain (unknown [172.29.53.218])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DD18942DFC82;
        Mon, 19 Oct 2020 21:43:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] pinctrl: renesas: r8a77990: Optimize pinctrl image size for R8A774C0
Date:   Mon, 19 Oct 2020 13:42:56 +0100
Message-Id: <20201019124258.4574-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver supports both RZ/G2E and R-Car E3(R8A774C0) SoC's.
Optimize pinctrl image size for RZ/G2E, when R-Car E3(R8A774C0) SoC is
disabled in the defconfig.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a77990.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index aed04a4c6116..47d57cf88011 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -1593,6 +1593,7 @@ static const unsigned int canfd1_data_mux[] = {
 	CANFD1_TX_MARK, CANFD1_RX_MARK,
 };
 
+#ifdef CONFIG_PINCTRL_PFC_R8A77990
 /* - DRIF0 --------------------------------------------------------------- */
 static const unsigned int drif0_ctrl_a_pins[] = {
 	/* CLK, SYNC */
@@ -1785,6 +1786,7 @@ static const unsigned int drif3_data1_b_pins[] = {
 static const unsigned int drif3_data1_b_mux[] = {
 	RIF3_D1_B_MARK,
 };
+#endif
 
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
@@ -3761,7 +3763,9 @@ static const unsigned int vin5_clk_b_mux[] = {
 
 static const struct {
 	struct sh_pfc_pin_group common[247];
+#ifdef CONFIG_PINCTRL_PFC_R8A77990
 	struct sh_pfc_pin_group automotive[21];
+#endif
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(audio_clk_a),
@@ -4012,6 +4016,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin5_clk_a),
 		SH_PFC_PIN_GROUP(vin5_clk_b),
 	},
+#ifdef CONFIG_PINCTRL_PFC_R8A77990
 	.automotive = {
 		SH_PFC_PIN_GROUP(drif0_ctrl_a),
 		SH_PFC_PIN_GROUP(drif0_data0_a),
@@ -4035,6 +4040,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(drif3_data0_b),
 		SH_PFC_PIN_GROUP(drif3_data1_b),
 	}
+#endif
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4088,6 +4094,7 @@ static const char * const canfd1_groups[] = {
 	"canfd1_data",
 };
 
+#ifdef CONFIG_PINCTRL_PFC_R8A77990
 static const char * const drif0_groups[] = {
 	"drif0_ctrl_a",
 	"drif0_data0_a",
@@ -4120,6 +4127,7 @@ static const char * const drif3_groups[] = {
 	"drif3_data0_b",
 	"drif3_data1_b",
 };
+#endif
 
 static const char * const du_groups[] = {
 	"du_rgb666",
@@ -4460,7 +4468,9 @@ static const char * const vin5_groups[] = {
 
 static const struct {
 	struct sh_pfc_function common[47];
+#ifdef CONFIG_PINCTRL_PFC_R8A77990
 	struct sh_pfc_function automotive[4];
+#endif
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
@@ -4511,12 +4521,14 @@ static const struct {
 		SH_PFC_FUNCTION(vin4),
 		SH_PFC_FUNCTION(vin5),
 	},
+#ifdef CONFIG_PINCTRL_PFC_R8A77990
 	.automotive = {
 		SH_PFC_FUNCTION(drif0),
 		SH_PFC_FUNCTION(drif1),
 		SH_PFC_FUNCTION(drif2),
 		SH_PFC_FUNCTION(drif3),
 	}
+#endif
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.17.1

