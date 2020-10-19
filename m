Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9FA292798
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 14:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgJSMnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 08:43:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:43001 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727202AbgJSMnR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 08:43:17 -0400
X-IronPort-AV: E=Sophos;i="5.77,394,1596466800"; 
   d="scan'208";a="59974433"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Oct 2020 21:43:16 +0900
Received: from localhost.localdomain (unknown [172.29.53.218])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 66E2642DFC85;
        Mon, 19 Oct 2020 21:43:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] pinctrl: renesas: r8a7791: Optimize pinctrl image size for R8A774[3|4]
Date:   Mon, 19 Oct 2020 13:42:58 +0100
Message-Id: <20201019124258.4574-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver supports both RZ/G1[M|N] and R-Car M2-W/M2-N(R8A779[1|3])
SoC's. Optimize pinctrl image size for RZ/G1[M|N], when R-Car M2-W/M2-N
(R8A779[1|3]) SoC's are disabled in the shmobile_defconfig.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a7791.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index bc9caf812fc1..f16004e9f263 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -1700,6 +1700,7 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
 /* - ADI -------------------------------------------------------------------- */
 static const unsigned int adi_common_pins[] = {
 	/* ADIDATA, ADICS/SAMP, ADICLK */
@@ -1765,7 +1766,7 @@ static const unsigned int adi_chsel2_b_mux[] = {
 	/* ADICHS B 2 */
 	ADICHS2_B_MARK,
 };
-
+#endif
 /* - Audio Clock ------------------------------------------------------------ */
 static const unsigned int audio_clk_a_pins[] = {
 	/* CLK */
@@ -2553,6 +2554,7 @@ static const unsigned int intc_irq3_pins[] = {
 static const unsigned int intc_irq3_mux[] = {
 	IRQ3_MARK,
 };
+#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
 /* - MLB+ ------------------------------------------------------------------- */
 static const unsigned int mlb_3pin_pins[] = {
 	RCAR_GP_PIN(7, 7), RCAR_GP_PIN(7, 8), RCAR_GP_PIN(7, 9),
@@ -2560,6 +2562,7 @@ static const unsigned int mlb_3pin_pins[] = {
 static const unsigned int mlb_3pin_mux[] = {
 	MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
 };
+#endif
 /* - MMCIF ------------------------------------------------------------------ */
 static const unsigned int mmc_data1_pins[] = {
 	/* D[0] */
@@ -4452,7 +4455,9 @@ static const unsigned int vin2_clk_mux[] = {
 
 static const struct {
 	struct sh_pfc_pin_group common[346];
+#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
 	struct sh_pfc_pin_group automotive[9];
+#endif
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(audio_clk_a),
@@ -4802,6 +4807,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin2_clkenb),
 		SH_PFC_PIN_GROUP(vin2_clk),
 	},
+#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
 	.automotive = {
 		SH_PFC_PIN_GROUP(adi_common),
 		SH_PFC_PIN_GROUP(adi_chsel0),
@@ -4813,8 +4819,10 @@ static const struct {
 		SH_PFC_PIN_GROUP(adi_chsel2_b),
 		SH_PFC_PIN_GROUP(mlb_3pin),
 	}
+#endif
 };
 
+#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
 static const char * const adi_groups[] = {
 	"adi_common",
 	"adi_chsel0",
@@ -4825,6 +4833,7 @@ static const char * const adi_groups[] = {
 	"adi_chsel1_b",
 	"adi_chsel2_b",
 };
+#endif
 
 static const char * const audio_clk_groups[] = {
 	"audio_clk_a",
@@ -5002,9 +5011,11 @@ static const char * const intc_groups[] = {
 	"intc_irq3",
 };
 
+#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
 static const char * const mlb_groups[] = {
 	"mlb_3pin",
 };
+#endif
 
 static const char * const mmc_groups[] = {
 	"mmc_data1",
@@ -5359,7 +5370,9 @@ static const char * const vin2_groups[] = {
 
 static const struct {
 	struct sh_pfc_function common[58];
+#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
 	struct sh_pfc_function automotive[2];
+#endif
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
@@ -5421,10 +5434,12 @@ static const struct {
 		SH_PFC_FUNCTION(vin1),
 		SH_PFC_FUNCTION(vin2),
 	},
+#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
 	.automotive = {
 		SH_PFC_FUNCTION(adi),
 		SH_PFC_FUNCTION(mlb),
 	}
+#endif
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.17.1

