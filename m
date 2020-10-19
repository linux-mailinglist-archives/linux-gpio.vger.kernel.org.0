Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6BC292796
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 14:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgJSMnP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 08:43:15 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:43001 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726336AbgJSMnO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 08:43:14 -0400
X-IronPort-AV: E=Sophos;i="5.77,394,1596466800"; 
   d="scan'208";a="59974426"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Oct 2020 21:43:13 +0900
Received: from localhost.localdomain (unknown [172.29.53.218])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 29E2542DFC88;
        Mon, 19 Oct 2020 21:43:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/6] pinctrl: renesas: r8a7790: Optimize pinctrl image size for R8A7742
Date:   Mon, 19 Oct 2020 13:42:57 +0100
Message-Id: <20201019124258.4574-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver supports both RZ/G1H and R-Car H2(R8A7790) SoC's.
Optimize pinctrl image size for RZ/G1H, when R-Car H2(R8A7790) SoC is
disabled in the shmobile_defconfig.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a7790.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 3f48d3d879f7..8943ca695ff0 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -2393,6 +2393,7 @@ static const unsigned int intc_irq3_pins[] = {
 static const unsigned int intc_irq3_mux[] = {
 	IRQ3_MARK,
 };
+#ifdef CONFIG_PINCTRL_PFC_R8A7790
 /* - MLB+ ------------------------------------------------------------------- */
 static const unsigned int mlb_3pin_pins[] = {
 	RCAR_GP_PIN(4, 0), RCAR_GP_PIN(4, 1), RCAR_GP_PIN(4, 2),
@@ -2400,6 +2401,7 @@ static const unsigned int mlb_3pin_pins[] = {
 static const unsigned int mlb_3pin_mux[] = {
 	MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
 };
+#endif
 /* - MMCIF0 ----------------------------------------------------------------- */
 static const unsigned int mmc0_data1_pins[] = {
 	/* D[0] */
@@ -4131,7 +4133,9 @@ static const unsigned int vin3_clk_mux[] = {
 
 static const struct {
 	struct sh_pfc_pin_group common[311];
+#ifdef CONFIG_PINCTRL_PFC_R8A7790
 	struct sh_pfc_pin_group automotive[1];
+#endif
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(audio_clk_a),
@@ -4446,9 +4450,11 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin3_clkenb),
 		SH_PFC_PIN_GROUP(vin3_clk),
 	},
+#ifdef CONFIG_PINCTRL_PFC_R8A7790
 	.automotive = {
 		SH_PFC_PIN_GROUP(mlb_3pin),
 	}
+#endif
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4592,9 +4598,11 @@ static const char * const intc_groups[] = {
 	"intc_irq3",
 };
 
+#ifdef CONFIG_PINCTRL_PFC_R8A7790
 static const char * const mlb_groups[] = {
 	"mlb_3pin",
 };
+#endif
 
 static const char * const mmc0_groups[] = {
 	"mmc0_data1",
@@ -4942,7 +4950,9 @@ static const char * const vin3_groups[] = {
 
 static const struct {
 	struct sh_pfc_function common[58];
+#ifdef CONFIG_PINCTRL_PFC_R8A7790
 	struct sh_pfc_function automotive[1];
+#endif
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
@@ -5004,9 +5014,11 @@ static const struct {
 		SH_PFC_FUNCTION(vin2),
 		SH_PFC_FUNCTION(vin3),
 	},
+#ifdef CONFIG_PINCTRL_PFC_R8A7790
 	.automotive = {
 		SH_PFC_FUNCTION(mlb),
 	}
+#endif
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.17.1

