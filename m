Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1002173CB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 18:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbgGGQTA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 12:19:00 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44391 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729115AbgGGQS6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 12:18:58 -0400
X-IronPort-AV: E=Sophos;i="5.75,324,1589209200"; 
   d="scan'208";a="51328935"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2020 01:18:56 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C4CE840164B2;
        Wed,  8 Jul 2020 01:18:53 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 14/14] pinctrl: sh-pfc: pfc-r8a77951: Add R8A774E1 PFC support
Date:   Tue,  7 Jul 2020 17:18:12 +0100
Message-Id: <1594138692-16816-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Renesas RZ/G2H (r8a774e1) is pin compatible with R-Car H3 (R8A77951),
however it doesn't have several automotive specific peripherals. Add
automotive-specific pin groups/functions along with common pin
groups/functions for supporting both r8a77951 and r8a774e1 SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/Kconfig        |   4 +
 drivers/pinctrl/sh-pfc/Makefile       |   1 +
 drivers/pinctrl/sh-pfc/core.c         |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77951.c | 877 ++++++++++++++------------
 drivers/pinctrl/sh-pfc/sh_pfc.h       |   1 +
 5 files changed, 474 insertions(+), 415 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index c461a2f1927a..7fdc7ed8bd2e 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -20,6 +20,7 @@ config PINCTRL_SH_PFC
 	select PINCTRL_PFC_R8A774A1 if ARCH_R8A774A1
 	select PINCTRL_PFC_R8A774B1 if ARCH_R8A774B1
 	select PINCTRL_PFC_R8A774C0 if ARCH_R8A774C0
+	select PINCTRL_PFC_R8A774E1 if ARCH_R8A774E1
 	select PINCTRL_PFC_R8A7778 if ARCH_R8A7778
 	select PINCTRL_PFC_R8A7779 if ARCH_R8A7779
 	select PINCTRL_PFC_R8A7790 if ARCH_R8A7790
@@ -99,6 +100,9 @@ config PINCTRL_PFC_R8A774B1
 config PINCTRL_PFC_R8A774C0
 	bool "RZ/G2E pin control support" if COMPILE_TEST
 
+config PINCTRL_PFC_R8A774E1
+	bool "RZ/G2H pin control support" if COMPILE_TEST
+
 config PINCTRL_PFC_R8A7778
 	bool "R-Car M1A pin control support" if COMPILE_TEST
 
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 3855d82069c9..7bb99187cd8e 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A77470)	+= pfc-r8a77470.o
 obj-$(CONFIG_PINCTRL_PFC_R8A774A1)	+= pfc-r8a7796.o
 obj-$(CONFIG_PINCTRL_PFC_R8A774B1)	+= pfc-r8a77965.o
 obj-$(CONFIG_PINCTRL_PFC_R8A774C0)	+= pfc-r8a77990.o
+obj-$(CONFIG_PINCTRL_PFC_R8A774E1)	+= pfc-r8a77951.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7778)	+= pfc-r8a7778.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7779)	+= pfc-r8a7779.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7790)	+= pfc-r8a7790.o
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f368383cba61..c528c124fb0e 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -533,6 +533,12 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &r8a774c0_pinmux_info,
 	},
 #endif
+#ifdef CONFIG_PINCTRL_PFC_R8A774E1
+	{
+		.compatible = "renesas,pfc-r8a774e1",
+		.data = &r8a774e1_pinmux_info,
+	},
+#endif
 #ifdef CONFIG_PINCTRL_PFC_R8A7778
 	{
 		.compatible = "renesas,pfc-r8a7778",
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77951.c b/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
index 256fab4b03d3..a94ebe0bf5d0 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
@@ -4157,357 +4157,365 @@ static const unsigned int vin5_clk_mux[] = {
 	VI5_CLK_MARK,
 };
 
-static const struct sh_pfc_pin_group pinmux_groups[] = {
-	SH_PFC_PIN_GROUP(audio_clk_a_a),
-	SH_PFC_PIN_GROUP(audio_clk_a_b),
-	SH_PFC_PIN_GROUP(audio_clk_a_c),
-	SH_PFC_PIN_GROUP(audio_clk_b_a),
-	SH_PFC_PIN_GROUP(audio_clk_b_b),
-	SH_PFC_PIN_GROUP(audio_clk_c_a),
-	SH_PFC_PIN_GROUP(audio_clk_c_b),
-	SH_PFC_PIN_GROUP(audio_clkout_a),
-	SH_PFC_PIN_GROUP(audio_clkout_b),
-	SH_PFC_PIN_GROUP(audio_clkout_c),
-	SH_PFC_PIN_GROUP(audio_clkout_d),
-	SH_PFC_PIN_GROUP(audio_clkout1_a),
-	SH_PFC_PIN_GROUP(audio_clkout1_b),
-	SH_PFC_PIN_GROUP(audio_clkout2_a),
-	SH_PFC_PIN_GROUP(audio_clkout2_b),
-	SH_PFC_PIN_GROUP(audio_clkout3_a),
-	SH_PFC_PIN_GROUP(audio_clkout3_b),
-	SH_PFC_PIN_GROUP(avb_link),
-	SH_PFC_PIN_GROUP(avb_magic),
-	SH_PFC_PIN_GROUP(avb_phy_int),
-	SH_PFC_PIN_GROUP_ALIAS(avb_mdc, avb_mdio),	/* Deprecated */
-	SH_PFC_PIN_GROUP(avb_mdio),
-	SH_PFC_PIN_GROUP(avb_mii),
-	SH_PFC_PIN_GROUP(avb_avtp_pps),
-	SH_PFC_PIN_GROUP(avb_avtp_match_a),
-	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
-	SH_PFC_PIN_GROUP(avb_avtp_match_b),
-	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
-	SH_PFC_PIN_GROUP(can0_data_a),
-	SH_PFC_PIN_GROUP(can0_data_b),
-	SH_PFC_PIN_GROUP(can1_data),
-	SH_PFC_PIN_GROUP(can_clk),
-	SH_PFC_PIN_GROUP(canfd0_data_a),
-	SH_PFC_PIN_GROUP(canfd0_data_b),
-	SH_PFC_PIN_GROUP(canfd1_data),
-	SH_PFC_PIN_GROUP(drif0_ctrl_a),
-	SH_PFC_PIN_GROUP(drif0_data0_a),
-	SH_PFC_PIN_GROUP(drif0_data1_a),
-	SH_PFC_PIN_GROUP(drif0_ctrl_b),
-	SH_PFC_PIN_GROUP(drif0_data0_b),
-	SH_PFC_PIN_GROUP(drif0_data1_b),
-	SH_PFC_PIN_GROUP(drif0_ctrl_c),
-	SH_PFC_PIN_GROUP(drif0_data0_c),
-	SH_PFC_PIN_GROUP(drif0_data1_c),
-	SH_PFC_PIN_GROUP(drif1_ctrl_a),
-	SH_PFC_PIN_GROUP(drif1_data0_a),
-	SH_PFC_PIN_GROUP(drif1_data1_a),
-	SH_PFC_PIN_GROUP(drif1_ctrl_b),
-	SH_PFC_PIN_GROUP(drif1_data0_b),
-	SH_PFC_PIN_GROUP(drif1_data1_b),
-	SH_PFC_PIN_GROUP(drif1_ctrl_c),
-	SH_PFC_PIN_GROUP(drif1_data0_c),
-	SH_PFC_PIN_GROUP(drif1_data1_c),
-	SH_PFC_PIN_GROUP(drif2_ctrl_a),
-	SH_PFC_PIN_GROUP(drif2_data0_a),
-	SH_PFC_PIN_GROUP(drif2_data1_a),
-	SH_PFC_PIN_GROUP(drif2_ctrl_b),
-	SH_PFC_PIN_GROUP(drif2_data0_b),
-	SH_PFC_PIN_GROUP(drif2_data1_b),
-	SH_PFC_PIN_GROUP(drif3_ctrl_a),
-	SH_PFC_PIN_GROUP(drif3_data0_a),
-	SH_PFC_PIN_GROUP(drif3_data1_a),
-	SH_PFC_PIN_GROUP(drif3_ctrl_b),
-	SH_PFC_PIN_GROUP(drif3_data0_b),
-	SH_PFC_PIN_GROUP(drif3_data1_b),
-	SH_PFC_PIN_GROUP(du_rgb666),
-	SH_PFC_PIN_GROUP(du_rgb888),
-	SH_PFC_PIN_GROUP(du_clk_out_0),
-	SH_PFC_PIN_GROUP(du_clk_out_1),
-	SH_PFC_PIN_GROUP(du_sync),
-	SH_PFC_PIN_GROUP(du_oddf),
-	SH_PFC_PIN_GROUP(du_cde),
-	SH_PFC_PIN_GROUP(du_disp),
-	SH_PFC_PIN_GROUP(hscif0_data),
-	SH_PFC_PIN_GROUP(hscif0_clk),
-	SH_PFC_PIN_GROUP(hscif0_ctrl),
-	SH_PFC_PIN_GROUP(hscif1_data_a),
-	SH_PFC_PIN_GROUP(hscif1_clk_a),
-	SH_PFC_PIN_GROUP(hscif1_ctrl_a),
-	SH_PFC_PIN_GROUP(hscif1_data_b),
-	SH_PFC_PIN_GROUP(hscif1_clk_b),
-	SH_PFC_PIN_GROUP(hscif1_ctrl_b),
-	SH_PFC_PIN_GROUP(hscif2_data_a),
-	SH_PFC_PIN_GROUP(hscif2_clk_a),
-	SH_PFC_PIN_GROUP(hscif2_ctrl_a),
-	SH_PFC_PIN_GROUP(hscif2_data_b),
-	SH_PFC_PIN_GROUP(hscif2_clk_b),
-	SH_PFC_PIN_GROUP(hscif2_ctrl_b),
-	SH_PFC_PIN_GROUP(hscif2_data_c),
-	SH_PFC_PIN_GROUP(hscif2_clk_c),
-	SH_PFC_PIN_GROUP(hscif2_ctrl_c),
-	SH_PFC_PIN_GROUP(hscif3_data_a),
-	SH_PFC_PIN_GROUP(hscif3_clk),
-	SH_PFC_PIN_GROUP(hscif3_ctrl),
-	SH_PFC_PIN_GROUP(hscif3_data_b),
-	SH_PFC_PIN_GROUP(hscif3_data_c),
-	SH_PFC_PIN_GROUP(hscif3_data_d),
-	SH_PFC_PIN_GROUP(hscif4_data_a),
-	SH_PFC_PIN_GROUP(hscif4_clk),
-	SH_PFC_PIN_GROUP(hscif4_ctrl),
-	SH_PFC_PIN_GROUP(hscif4_data_b),
-	SH_PFC_PIN_GROUP(i2c0),
-	SH_PFC_PIN_GROUP(i2c1_a),
-	SH_PFC_PIN_GROUP(i2c1_b),
-	SH_PFC_PIN_GROUP(i2c2_a),
-	SH_PFC_PIN_GROUP(i2c2_b),
-	SH_PFC_PIN_GROUP(i2c3),
-	SH_PFC_PIN_GROUP(i2c5),
-	SH_PFC_PIN_GROUP(i2c6_a),
-	SH_PFC_PIN_GROUP(i2c6_b),
-	SH_PFC_PIN_GROUP(i2c6_c),
-	SH_PFC_PIN_GROUP(intc_ex_irq0),
-	SH_PFC_PIN_GROUP(intc_ex_irq1),
-	SH_PFC_PIN_GROUP(intc_ex_irq2),
-	SH_PFC_PIN_GROUP(intc_ex_irq3),
-	SH_PFC_PIN_GROUP(intc_ex_irq4),
-	SH_PFC_PIN_GROUP(intc_ex_irq5),
-	SH_PFC_PIN_GROUP(msiof0_clk),
-	SH_PFC_PIN_GROUP(msiof0_sync),
-	SH_PFC_PIN_GROUP(msiof0_ss1),
-	SH_PFC_PIN_GROUP(msiof0_ss2),
-	SH_PFC_PIN_GROUP(msiof0_txd),
-	SH_PFC_PIN_GROUP(msiof0_rxd),
-	SH_PFC_PIN_GROUP(msiof1_clk_a),
-	SH_PFC_PIN_GROUP(msiof1_sync_a),
-	SH_PFC_PIN_GROUP(msiof1_ss1_a),
-	SH_PFC_PIN_GROUP(msiof1_ss2_a),
-	SH_PFC_PIN_GROUP(msiof1_txd_a),
-	SH_PFC_PIN_GROUP(msiof1_rxd_a),
-	SH_PFC_PIN_GROUP(msiof1_clk_b),
-	SH_PFC_PIN_GROUP(msiof1_sync_b),
-	SH_PFC_PIN_GROUP(msiof1_ss1_b),
-	SH_PFC_PIN_GROUP(msiof1_ss2_b),
-	SH_PFC_PIN_GROUP(msiof1_txd_b),
-	SH_PFC_PIN_GROUP(msiof1_rxd_b),
-	SH_PFC_PIN_GROUP(msiof1_clk_c),
-	SH_PFC_PIN_GROUP(msiof1_sync_c),
-	SH_PFC_PIN_GROUP(msiof1_ss1_c),
-	SH_PFC_PIN_GROUP(msiof1_ss2_c),
-	SH_PFC_PIN_GROUP(msiof1_txd_c),
-	SH_PFC_PIN_GROUP(msiof1_rxd_c),
-	SH_PFC_PIN_GROUP(msiof1_clk_d),
-	SH_PFC_PIN_GROUP(msiof1_sync_d),
-	SH_PFC_PIN_GROUP(msiof1_ss1_d),
-	SH_PFC_PIN_GROUP(msiof1_ss2_d),
-	SH_PFC_PIN_GROUP(msiof1_txd_d),
-	SH_PFC_PIN_GROUP(msiof1_rxd_d),
-	SH_PFC_PIN_GROUP(msiof1_clk_e),
-	SH_PFC_PIN_GROUP(msiof1_sync_e),
-	SH_PFC_PIN_GROUP(msiof1_ss1_e),
-	SH_PFC_PIN_GROUP(msiof1_ss2_e),
-	SH_PFC_PIN_GROUP(msiof1_txd_e),
-	SH_PFC_PIN_GROUP(msiof1_rxd_e),
-	SH_PFC_PIN_GROUP(msiof1_clk_f),
-	SH_PFC_PIN_GROUP(msiof1_sync_f),
-	SH_PFC_PIN_GROUP(msiof1_ss1_f),
-	SH_PFC_PIN_GROUP(msiof1_ss2_f),
-	SH_PFC_PIN_GROUP(msiof1_txd_f),
-	SH_PFC_PIN_GROUP(msiof1_rxd_f),
-	SH_PFC_PIN_GROUP(msiof1_clk_g),
-	SH_PFC_PIN_GROUP(msiof1_sync_g),
-	SH_PFC_PIN_GROUP(msiof1_ss1_g),
-	SH_PFC_PIN_GROUP(msiof1_ss2_g),
-	SH_PFC_PIN_GROUP(msiof1_txd_g),
-	SH_PFC_PIN_GROUP(msiof1_rxd_g),
-	SH_PFC_PIN_GROUP(msiof2_clk_a),
-	SH_PFC_PIN_GROUP(msiof2_sync_a),
-	SH_PFC_PIN_GROUP(msiof2_ss1_a),
-	SH_PFC_PIN_GROUP(msiof2_ss2_a),
-	SH_PFC_PIN_GROUP(msiof2_txd_a),
-	SH_PFC_PIN_GROUP(msiof2_rxd_a),
-	SH_PFC_PIN_GROUP(msiof2_clk_b),
-	SH_PFC_PIN_GROUP(msiof2_sync_b),
-	SH_PFC_PIN_GROUP(msiof2_ss1_b),
-	SH_PFC_PIN_GROUP(msiof2_ss2_b),
-	SH_PFC_PIN_GROUP(msiof2_txd_b),
-	SH_PFC_PIN_GROUP(msiof2_rxd_b),
-	SH_PFC_PIN_GROUP(msiof2_clk_c),
-	SH_PFC_PIN_GROUP(msiof2_sync_c),
-	SH_PFC_PIN_GROUP(msiof2_ss1_c),
-	SH_PFC_PIN_GROUP(msiof2_ss2_c),
-	SH_PFC_PIN_GROUP(msiof2_txd_c),
-	SH_PFC_PIN_GROUP(msiof2_rxd_c),
-	SH_PFC_PIN_GROUP(msiof2_clk_d),
-	SH_PFC_PIN_GROUP(msiof2_sync_d),
-	SH_PFC_PIN_GROUP(msiof2_ss1_d),
-	SH_PFC_PIN_GROUP(msiof2_ss2_d),
-	SH_PFC_PIN_GROUP(msiof2_txd_d),
-	SH_PFC_PIN_GROUP(msiof2_rxd_d),
-	SH_PFC_PIN_GROUP(msiof3_clk_a),
-	SH_PFC_PIN_GROUP(msiof3_sync_a),
-	SH_PFC_PIN_GROUP(msiof3_ss1_a),
-	SH_PFC_PIN_GROUP(msiof3_ss2_a),
-	SH_PFC_PIN_GROUP(msiof3_txd_a),
-	SH_PFC_PIN_GROUP(msiof3_rxd_a),
-	SH_PFC_PIN_GROUP(msiof3_clk_b),
-	SH_PFC_PIN_GROUP(msiof3_sync_b),
-	SH_PFC_PIN_GROUP(msiof3_ss1_b),
-	SH_PFC_PIN_GROUP(msiof3_ss2_b),
-	SH_PFC_PIN_GROUP(msiof3_txd_b),
-	SH_PFC_PIN_GROUP(msiof3_rxd_b),
-	SH_PFC_PIN_GROUP(msiof3_clk_c),
-	SH_PFC_PIN_GROUP(msiof3_sync_c),
-	SH_PFC_PIN_GROUP(msiof3_txd_c),
-	SH_PFC_PIN_GROUP(msiof3_rxd_c),
-	SH_PFC_PIN_GROUP(msiof3_clk_d),
-	SH_PFC_PIN_GROUP(msiof3_sync_d),
-	SH_PFC_PIN_GROUP(msiof3_ss1_d),
-	SH_PFC_PIN_GROUP(msiof3_txd_d),
-	SH_PFC_PIN_GROUP(msiof3_rxd_d),
-	SH_PFC_PIN_GROUP(msiof3_clk_e),
-	SH_PFC_PIN_GROUP(msiof3_sync_e),
-	SH_PFC_PIN_GROUP(msiof3_ss1_e),
-	SH_PFC_PIN_GROUP(msiof3_ss2_e),
-	SH_PFC_PIN_GROUP(msiof3_txd_e),
-	SH_PFC_PIN_GROUP(msiof3_rxd_e),
-	SH_PFC_PIN_GROUP(pwm0),
-	SH_PFC_PIN_GROUP(pwm1_a),
-	SH_PFC_PIN_GROUP(pwm1_b),
-	SH_PFC_PIN_GROUP(pwm2_a),
-	SH_PFC_PIN_GROUP(pwm2_b),
-	SH_PFC_PIN_GROUP(pwm3_a),
-	SH_PFC_PIN_GROUP(pwm3_b),
-	SH_PFC_PIN_GROUP(pwm4_a),
-	SH_PFC_PIN_GROUP(pwm4_b),
-	SH_PFC_PIN_GROUP(pwm5_a),
-	SH_PFC_PIN_GROUP(pwm5_b),
-	SH_PFC_PIN_GROUP(pwm6_a),
-	SH_PFC_PIN_GROUP(pwm6_b),
-	SH_PFC_PIN_GROUP(sata0_devslp_a),
-	SH_PFC_PIN_GROUP(sata0_devslp_b),
-	SH_PFC_PIN_GROUP(scif0_data),
-	SH_PFC_PIN_GROUP(scif0_clk),
-	SH_PFC_PIN_GROUP(scif0_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data_a),
-	SH_PFC_PIN_GROUP(scif1_clk),
-	SH_PFC_PIN_GROUP(scif1_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data_b),
-	SH_PFC_PIN_GROUP(scif2_data_a),
-	SH_PFC_PIN_GROUP(scif2_clk),
-	SH_PFC_PIN_GROUP(scif2_data_b),
-	SH_PFC_PIN_GROUP(scif3_data_a),
-	SH_PFC_PIN_GROUP(scif3_clk),
-	SH_PFC_PIN_GROUP(scif3_ctrl),
-	SH_PFC_PIN_GROUP(scif3_data_b),
-	SH_PFC_PIN_GROUP(scif4_data_a),
-	SH_PFC_PIN_GROUP(scif4_clk_a),
-	SH_PFC_PIN_GROUP(scif4_ctrl_a),
-	SH_PFC_PIN_GROUP(scif4_data_b),
-	SH_PFC_PIN_GROUP(scif4_clk_b),
-	SH_PFC_PIN_GROUP(scif4_ctrl_b),
-	SH_PFC_PIN_GROUP(scif4_data_c),
-	SH_PFC_PIN_GROUP(scif4_clk_c),
-	SH_PFC_PIN_GROUP(scif4_ctrl_c),
-	SH_PFC_PIN_GROUP(scif5_data_a),
-	SH_PFC_PIN_GROUP(scif5_clk_a),
-	SH_PFC_PIN_GROUP(scif5_data_b),
-	SH_PFC_PIN_GROUP(scif5_clk_b),
-	SH_PFC_PIN_GROUP(scif_clk_a),
-	SH_PFC_PIN_GROUP(scif_clk_b),
-	SH_PFC_PIN_GROUP(sdhi0_data1),
-	SH_PFC_PIN_GROUP(sdhi0_data4),
-	SH_PFC_PIN_GROUP(sdhi0_ctrl),
-	SH_PFC_PIN_GROUP(sdhi0_cd),
-	SH_PFC_PIN_GROUP(sdhi0_wp),
-	SH_PFC_PIN_GROUP(sdhi1_data1),
-	SH_PFC_PIN_GROUP(sdhi1_data4),
-	SH_PFC_PIN_GROUP(sdhi1_ctrl),
-	SH_PFC_PIN_GROUP(sdhi1_cd),
-	SH_PFC_PIN_GROUP(sdhi1_wp),
-	SH_PFC_PIN_GROUP(sdhi2_data1),
-	SH_PFC_PIN_GROUP(sdhi2_data4),
-	SH_PFC_PIN_GROUP(sdhi2_data8),
-	SH_PFC_PIN_GROUP(sdhi2_ctrl),
-	SH_PFC_PIN_GROUP(sdhi2_cd_a),
-	SH_PFC_PIN_GROUP(sdhi2_wp_a),
-	SH_PFC_PIN_GROUP(sdhi2_cd_b),
-	SH_PFC_PIN_GROUP(sdhi2_wp_b),
-	SH_PFC_PIN_GROUP(sdhi2_ds),
-	SH_PFC_PIN_GROUP(sdhi3_data1),
-	SH_PFC_PIN_GROUP(sdhi3_data4),
-	SH_PFC_PIN_GROUP(sdhi3_data8),
-	SH_PFC_PIN_GROUP(sdhi3_ctrl),
-	SH_PFC_PIN_GROUP(sdhi3_cd),
-	SH_PFC_PIN_GROUP(sdhi3_wp),
-	SH_PFC_PIN_GROUP(sdhi3_ds),
-	SH_PFC_PIN_GROUP(ssi0_data),
-	SH_PFC_PIN_GROUP(ssi01239_ctrl),
-	SH_PFC_PIN_GROUP(ssi1_data_a),
-	SH_PFC_PIN_GROUP(ssi1_data_b),
-	SH_PFC_PIN_GROUP(ssi1_ctrl_a),
-	SH_PFC_PIN_GROUP(ssi1_ctrl_b),
-	SH_PFC_PIN_GROUP(ssi2_data_a),
-	SH_PFC_PIN_GROUP(ssi2_data_b),
-	SH_PFC_PIN_GROUP(ssi2_ctrl_a),
-	SH_PFC_PIN_GROUP(ssi2_ctrl_b),
-	SH_PFC_PIN_GROUP(ssi3_data),
-	SH_PFC_PIN_GROUP(ssi349_ctrl),
-	SH_PFC_PIN_GROUP(ssi4_data),
-	SH_PFC_PIN_GROUP(ssi4_ctrl),
-	SH_PFC_PIN_GROUP(ssi5_data),
-	SH_PFC_PIN_GROUP(ssi5_ctrl),
-	SH_PFC_PIN_GROUP(ssi6_data),
-	SH_PFC_PIN_GROUP(ssi6_ctrl),
-	SH_PFC_PIN_GROUP(ssi7_data),
-	SH_PFC_PIN_GROUP(ssi78_ctrl),
-	SH_PFC_PIN_GROUP(ssi8_data),
-	SH_PFC_PIN_GROUP(ssi9_data_a),
-	SH_PFC_PIN_GROUP(ssi9_data_b),
-	SH_PFC_PIN_GROUP(ssi9_ctrl_a),
-	SH_PFC_PIN_GROUP(ssi9_ctrl_b),
-	SH_PFC_PIN_GROUP(tmu_tclk1_a),
-	SH_PFC_PIN_GROUP(tmu_tclk1_b),
-	SH_PFC_PIN_GROUP(tmu_tclk2_a),
-	SH_PFC_PIN_GROUP(tmu_tclk2_b),
-	SH_PFC_PIN_GROUP(tpu_to0),
-	SH_PFC_PIN_GROUP(tpu_to1),
-	SH_PFC_PIN_GROUP(tpu_to2),
-	SH_PFC_PIN_GROUP(tpu_to3),
-	SH_PFC_PIN_GROUP(usb0),
-	SH_PFC_PIN_GROUP(usb1),
-	SH_PFC_PIN_GROUP(usb2),
-	SH_PFC_PIN_GROUP(usb2_ch3),
-	SH_PFC_PIN_GROUP(usb30),
-	VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
-	VIN_DATA_PIN_GROUP(vin4_data, 10, _a),
-	VIN_DATA_PIN_GROUP(vin4_data, 12, _a),
-	VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
-	SH_PFC_PIN_GROUP(vin4_data18_a),
-	VIN_DATA_PIN_GROUP(vin4_data, 20, _a),
-	VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
-	VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
-	VIN_DATA_PIN_GROUP(vin4_data, 10, _b),
-	VIN_DATA_PIN_GROUP(vin4_data, 12, _b),
-	VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
-	SH_PFC_PIN_GROUP(vin4_data18_b),
-	VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
-	VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
-	SH_PFC_PIN_GROUP(vin4_sync),
-	SH_PFC_PIN_GROUP(vin4_field),
-	SH_PFC_PIN_GROUP(vin4_clkenb),
-	SH_PFC_PIN_GROUP(vin4_clk),
-	VIN_DATA_PIN_GROUP(vin5_data, 8),
-	VIN_DATA_PIN_GROUP(vin5_data, 10),
-	VIN_DATA_PIN_GROUP(vin5_data, 12),
-	VIN_DATA_PIN_GROUP(vin5_data, 16),
-	SH_PFC_PIN_GROUP(vin5_sync),
-	SH_PFC_PIN_GROUP(vin5_field),
-	SH_PFC_PIN_GROUP(vin5_clkenb),
-	SH_PFC_PIN_GROUP(vin5_clk),
+static const struct {
+	struct sh_pfc_pin_group common[320];
+	struct sh_pfc_pin_group automotive[30];
+} pinmux_groups = {
+	.common = {
+		SH_PFC_PIN_GROUP(audio_clk_a_a),
+		SH_PFC_PIN_GROUP(audio_clk_a_b),
+		SH_PFC_PIN_GROUP(audio_clk_a_c),
+		SH_PFC_PIN_GROUP(audio_clk_b_a),
+		SH_PFC_PIN_GROUP(audio_clk_b_b),
+		SH_PFC_PIN_GROUP(audio_clk_c_a),
+		SH_PFC_PIN_GROUP(audio_clk_c_b),
+		SH_PFC_PIN_GROUP(audio_clkout_a),
+		SH_PFC_PIN_GROUP(audio_clkout_b),
+		SH_PFC_PIN_GROUP(audio_clkout_c),
+		SH_PFC_PIN_GROUP(audio_clkout_d),
+		SH_PFC_PIN_GROUP(audio_clkout1_a),
+		SH_PFC_PIN_GROUP(audio_clkout1_b),
+		SH_PFC_PIN_GROUP(audio_clkout2_a),
+		SH_PFC_PIN_GROUP(audio_clkout2_b),
+		SH_PFC_PIN_GROUP(audio_clkout3_a),
+		SH_PFC_PIN_GROUP(audio_clkout3_b),
+		SH_PFC_PIN_GROUP(avb_link),
+		SH_PFC_PIN_GROUP(avb_magic),
+		SH_PFC_PIN_GROUP(avb_phy_int),
+		SH_PFC_PIN_GROUP_ALIAS(avb_mdc, avb_mdio),	/* Deprecated */
+		SH_PFC_PIN_GROUP(avb_mdio),
+		SH_PFC_PIN_GROUP(avb_mii),
+		SH_PFC_PIN_GROUP(avb_avtp_pps),
+		SH_PFC_PIN_GROUP(avb_avtp_match_a),
+		SH_PFC_PIN_GROUP(avb_avtp_capture_a),
+		SH_PFC_PIN_GROUP(avb_avtp_match_b),
+		SH_PFC_PIN_GROUP(avb_avtp_capture_b),
+		SH_PFC_PIN_GROUP(can0_data_a),
+		SH_PFC_PIN_GROUP(can0_data_b),
+		SH_PFC_PIN_GROUP(can1_data),
+		SH_PFC_PIN_GROUP(can_clk),
+		SH_PFC_PIN_GROUP(canfd0_data_a),
+		SH_PFC_PIN_GROUP(canfd0_data_b),
+		SH_PFC_PIN_GROUP(canfd1_data),
+		SH_PFC_PIN_GROUP(du_rgb666),
+		SH_PFC_PIN_GROUP(du_rgb888),
+		SH_PFC_PIN_GROUP(du_clk_out_0),
+		SH_PFC_PIN_GROUP(du_clk_out_1),
+		SH_PFC_PIN_GROUP(du_sync),
+		SH_PFC_PIN_GROUP(du_oddf),
+		SH_PFC_PIN_GROUP(du_cde),
+		SH_PFC_PIN_GROUP(du_disp),
+		SH_PFC_PIN_GROUP(hscif0_data),
+		SH_PFC_PIN_GROUP(hscif0_clk),
+		SH_PFC_PIN_GROUP(hscif0_ctrl),
+		SH_PFC_PIN_GROUP(hscif1_data_a),
+		SH_PFC_PIN_GROUP(hscif1_clk_a),
+		SH_PFC_PIN_GROUP(hscif1_ctrl_a),
+		SH_PFC_PIN_GROUP(hscif1_data_b),
+		SH_PFC_PIN_GROUP(hscif1_clk_b),
+		SH_PFC_PIN_GROUP(hscif1_ctrl_b),
+		SH_PFC_PIN_GROUP(hscif2_data_a),
+		SH_PFC_PIN_GROUP(hscif2_clk_a),
+		SH_PFC_PIN_GROUP(hscif2_ctrl_a),
+		SH_PFC_PIN_GROUP(hscif2_data_b),
+		SH_PFC_PIN_GROUP(hscif2_clk_b),
+		SH_PFC_PIN_GROUP(hscif2_ctrl_b),
+		SH_PFC_PIN_GROUP(hscif2_data_c),
+		SH_PFC_PIN_GROUP(hscif2_clk_c),
+		SH_PFC_PIN_GROUP(hscif2_ctrl_c),
+		SH_PFC_PIN_GROUP(hscif3_data_a),
+		SH_PFC_PIN_GROUP(hscif3_clk),
+		SH_PFC_PIN_GROUP(hscif3_ctrl),
+		SH_PFC_PIN_GROUP(hscif3_data_b),
+		SH_PFC_PIN_GROUP(hscif3_data_c),
+		SH_PFC_PIN_GROUP(hscif3_data_d),
+		SH_PFC_PIN_GROUP(hscif4_data_a),
+		SH_PFC_PIN_GROUP(hscif4_clk),
+		SH_PFC_PIN_GROUP(hscif4_ctrl),
+		SH_PFC_PIN_GROUP(hscif4_data_b),
+		SH_PFC_PIN_GROUP(i2c0),
+		SH_PFC_PIN_GROUP(i2c1_a),
+		SH_PFC_PIN_GROUP(i2c1_b),
+		SH_PFC_PIN_GROUP(i2c2_a),
+		SH_PFC_PIN_GROUP(i2c2_b),
+		SH_PFC_PIN_GROUP(i2c3),
+		SH_PFC_PIN_GROUP(i2c5),
+		SH_PFC_PIN_GROUP(i2c6_a),
+		SH_PFC_PIN_GROUP(i2c6_b),
+		SH_PFC_PIN_GROUP(i2c6_c),
+		SH_PFC_PIN_GROUP(intc_ex_irq0),
+		SH_PFC_PIN_GROUP(intc_ex_irq1),
+		SH_PFC_PIN_GROUP(intc_ex_irq2),
+		SH_PFC_PIN_GROUP(intc_ex_irq3),
+		SH_PFC_PIN_GROUP(intc_ex_irq4),
+		SH_PFC_PIN_GROUP(intc_ex_irq5),
+		SH_PFC_PIN_GROUP(msiof0_clk),
+		SH_PFC_PIN_GROUP(msiof0_sync),
+		SH_PFC_PIN_GROUP(msiof0_ss1),
+		SH_PFC_PIN_GROUP(msiof0_ss2),
+		SH_PFC_PIN_GROUP(msiof0_txd),
+		SH_PFC_PIN_GROUP(msiof0_rxd),
+		SH_PFC_PIN_GROUP(msiof1_clk_a),
+		SH_PFC_PIN_GROUP(msiof1_sync_a),
+		SH_PFC_PIN_GROUP(msiof1_ss1_a),
+		SH_PFC_PIN_GROUP(msiof1_ss2_a),
+		SH_PFC_PIN_GROUP(msiof1_txd_a),
+		SH_PFC_PIN_GROUP(msiof1_rxd_a),
+		SH_PFC_PIN_GROUP(msiof1_clk_b),
+		SH_PFC_PIN_GROUP(msiof1_sync_b),
+		SH_PFC_PIN_GROUP(msiof1_ss1_b),
+		SH_PFC_PIN_GROUP(msiof1_ss2_b),
+		SH_PFC_PIN_GROUP(msiof1_txd_b),
+		SH_PFC_PIN_GROUP(msiof1_rxd_b),
+		SH_PFC_PIN_GROUP(msiof1_clk_c),
+		SH_PFC_PIN_GROUP(msiof1_sync_c),
+		SH_PFC_PIN_GROUP(msiof1_ss1_c),
+		SH_PFC_PIN_GROUP(msiof1_ss2_c),
+		SH_PFC_PIN_GROUP(msiof1_txd_c),
+		SH_PFC_PIN_GROUP(msiof1_rxd_c),
+		SH_PFC_PIN_GROUP(msiof1_clk_d),
+		SH_PFC_PIN_GROUP(msiof1_sync_d),
+		SH_PFC_PIN_GROUP(msiof1_ss1_d),
+		SH_PFC_PIN_GROUP(msiof1_ss2_d),
+		SH_PFC_PIN_GROUP(msiof1_txd_d),
+		SH_PFC_PIN_GROUP(msiof1_rxd_d),
+		SH_PFC_PIN_GROUP(msiof1_clk_e),
+		SH_PFC_PIN_GROUP(msiof1_sync_e),
+		SH_PFC_PIN_GROUP(msiof1_ss1_e),
+		SH_PFC_PIN_GROUP(msiof1_ss2_e),
+		SH_PFC_PIN_GROUP(msiof1_txd_e),
+		SH_PFC_PIN_GROUP(msiof1_rxd_e),
+		SH_PFC_PIN_GROUP(msiof1_clk_f),
+		SH_PFC_PIN_GROUP(msiof1_sync_f),
+		SH_PFC_PIN_GROUP(msiof1_ss1_f),
+		SH_PFC_PIN_GROUP(msiof1_ss2_f),
+		SH_PFC_PIN_GROUP(msiof1_txd_f),
+		SH_PFC_PIN_GROUP(msiof1_rxd_f),
+		SH_PFC_PIN_GROUP(msiof1_clk_g),
+		SH_PFC_PIN_GROUP(msiof1_sync_g),
+		SH_PFC_PIN_GROUP(msiof1_ss1_g),
+		SH_PFC_PIN_GROUP(msiof1_ss2_g),
+		SH_PFC_PIN_GROUP(msiof1_txd_g),
+		SH_PFC_PIN_GROUP(msiof1_rxd_g),
+		SH_PFC_PIN_GROUP(msiof2_clk_a),
+		SH_PFC_PIN_GROUP(msiof2_sync_a),
+		SH_PFC_PIN_GROUP(msiof2_ss1_a),
+		SH_PFC_PIN_GROUP(msiof2_ss2_a),
+		SH_PFC_PIN_GROUP(msiof2_txd_a),
+		SH_PFC_PIN_GROUP(msiof2_rxd_a),
+		SH_PFC_PIN_GROUP(msiof2_clk_b),
+		SH_PFC_PIN_GROUP(msiof2_sync_b),
+		SH_PFC_PIN_GROUP(msiof2_ss1_b),
+		SH_PFC_PIN_GROUP(msiof2_ss2_b),
+		SH_PFC_PIN_GROUP(msiof2_txd_b),
+		SH_PFC_PIN_GROUP(msiof2_rxd_b),
+		SH_PFC_PIN_GROUP(msiof2_clk_c),
+		SH_PFC_PIN_GROUP(msiof2_sync_c),
+		SH_PFC_PIN_GROUP(msiof2_ss1_c),
+		SH_PFC_PIN_GROUP(msiof2_ss2_c),
+		SH_PFC_PIN_GROUP(msiof2_txd_c),
+		SH_PFC_PIN_GROUP(msiof2_rxd_c),
+		SH_PFC_PIN_GROUP(msiof2_clk_d),
+		SH_PFC_PIN_GROUP(msiof2_sync_d),
+		SH_PFC_PIN_GROUP(msiof2_ss1_d),
+		SH_PFC_PIN_GROUP(msiof2_ss2_d),
+		SH_PFC_PIN_GROUP(msiof2_txd_d),
+		SH_PFC_PIN_GROUP(msiof2_rxd_d),
+		SH_PFC_PIN_GROUP(msiof3_clk_a),
+		SH_PFC_PIN_GROUP(msiof3_sync_a),
+		SH_PFC_PIN_GROUP(msiof3_ss1_a),
+		SH_PFC_PIN_GROUP(msiof3_ss2_a),
+		SH_PFC_PIN_GROUP(msiof3_txd_a),
+		SH_PFC_PIN_GROUP(msiof3_rxd_a),
+		SH_PFC_PIN_GROUP(msiof3_clk_b),
+		SH_PFC_PIN_GROUP(msiof3_sync_b),
+		SH_PFC_PIN_GROUP(msiof3_ss1_b),
+		SH_PFC_PIN_GROUP(msiof3_ss2_b),
+		SH_PFC_PIN_GROUP(msiof3_txd_b),
+		SH_PFC_PIN_GROUP(msiof3_rxd_b),
+		SH_PFC_PIN_GROUP(msiof3_clk_c),
+		SH_PFC_PIN_GROUP(msiof3_sync_c),
+		SH_PFC_PIN_GROUP(msiof3_txd_c),
+		SH_PFC_PIN_GROUP(msiof3_rxd_c),
+		SH_PFC_PIN_GROUP(msiof3_clk_d),
+		SH_PFC_PIN_GROUP(msiof3_sync_d),
+		SH_PFC_PIN_GROUP(msiof3_ss1_d),
+		SH_PFC_PIN_GROUP(msiof3_txd_d),
+		SH_PFC_PIN_GROUP(msiof3_rxd_d),
+		SH_PFC_PIN_GROUP(msiof3_clk_e),
+		SH_PFC_PIN_GROUP(msiof3_sync_e),
+		SH_PFC_PIN_GROUP(msiof3_ss1_e),
+		SH_PFC_PIN_GROUP(msiof3_ss2_e),
+		SH_PFC_PIN_GROUP(msiof3_txd_e),
+		SH_PFC_PIN_GROUP(msiof3_rxd_e),
+		SH_PFC_PIN_GROUP(pwm0),
+		SH_PFC_PIN_GROUP(pwm1_a),
+		SH_PFC_PIN_GROUP(pwm1_b),
+		SH_PFC_PIN_GROUP(pwm2_a),
+		SH_PFC_PIN_GROUP(pwm2_b),
+		SH_PFC_PIN_GROUP(pwm3_a),
+		SH_PFC_PIN_GROUP(pwm3_b),
+		SH_PFC_PIN_GROUP(pwm4_a),
+		SH_PFC_PIN_GROUP(pwm4_b),
+		SH_PFC_PIN_GROUP(pwm5_a),
+		SH_PFC_PIN_GROUP(pwm5_b),
+		SH_PFC_PIN_GROUP(pwm6_a),
+		SH_PFC_PIN_GROUP(pwm6_b),
+		SH_PFC_PIN_GROUP(sata0_devslp_a),
+		SH_PFC_PIN_GROUP(sata0_devslp_b),
+		SH_PFC_PIN_GROUP(scif0_data),
+		SH_PFC_PIN_GROUP(scif0_clk),
+		SH_PFC_PIN_GROUP(scif0_ctrl),
+		SH_PFC_PIN_GROUP(scif1_data_a),
+		SH_PFC_PIN_GROUP(scif1_clk),
+		SH_PFC_PIN_GROUP(scif1_ctrl),
+		SH_PFC_PIN_GROUP(scif1_data_b),
+		SH_PFC_PIN_GROUP(scif2_data_a),
+		SH_PFC_PIN_GROUP(scif2_clk),
+		SH_PFC_PIN_GROUP(scif2_data_b),
+		SH_PFC_PIN_GROUP(scif3_data_a),
+		SH_PFC_PIN_GROUP(scif3_clk),
+		SH_PFC_PIN_GROUP(scif3_ctrl),
+		SH_PFC_PIN_GROUP(scif3_data_b),
+		SH_PFC_PIN_GROUP(scif4_data_a),
+		SH_PFC_PIN_GROUP(scif4_clk_a),
+		SH_PFC_PIN_GROUP(scif4_ctrl_a),
+		SH_PFC_PIN_GROUP(scif4_data_b),
+		SH_PFC_PIN_GROUP(scif4_clk_b),
+		SH_PFC_PIN_GROUP(scif4_ctrl_b),
+		SH_PFC_PIN_GROUP(scif4_data_c),
+		SH_PFC_PIN_GROUP(scif4_clk_c),
+		SH_PFC_PIN_GROUP(scif4_ctrl_c),
+		SH_PFC_PIN_GROUP(scif5_data_a),
+		SH_PFC_PIN_GROUP(scif5_clk_a),
+		SH_PFC_PIN_GROUP(scif5_data_b),
+		SH_PFC_PIN_GROUP(scif5_clk_b),
+		SH_PFC_PIN_GROUP(scif_clk_a),
+		SH_PFC_PIN_GROUP(scif_clk_b),
+		SH_PFC_PIN_GROUP(sdhi0_data1),
+		SH_PFC_PIN_GROUP(sdhi0_data4),
+		SH_PFC_PIN_GROUP(sdhi0_ctrl),
+		SH_PFC_PIN_GROUP(sdhi0_cd),
+		SH_PFC_PIN_GROUP(sdhi0_wp),
+		SH_PFC_PIN_GROUP(sdhi1_data1),
+		SH_PFC_PIN_GROUP(sdhi1_data4),
+		SH_PFC_PIN_GROUP(sdhi1_ctrl),
+		SH_PFC_PIN_GROUP(sdhi1_cd),
+		SH_PFC_PIN_GROUP(sdhi1_wp),
+		SH_PFC_PIN_GROUP(sdhi2_data1),
+		SH_PFC_PIN_GROUP(sdhi2_data4),
+		SH_PFC_PIN_GROUP(sdhi2_data8),
+		SH_PFC_PIN_GROUP(sdhi2_ctrl),
+		SH_PFC_PIN_GROUP(sdhi2_cd_a),
+		SH_PFC_PIN_GROUP(sdhi2_wp_a),
+		SH_PFC_PIN_GROUP(sdhi2_cd_b),
+		SH_PFC_PIN_GROUP(sdhi2_wp_b),
+		SH_PFC_PIN_GROUP(sdhi2_ds),
+		SH_PFC_PIN_GROUP(sdhi3_data1),
+		SH_PFC_PIN_GROUP(sdhi3_data4),
+		SH_PFC_PIN_GROUP(sdhi3_data8),
+		SH_PFC_PIN_GROUP(sdhi3_ctrl),
+		SH_PFC_PIN_GROUP(sdhi3_cd),
+		SH_PFC_PIN_GROUP(sdhi3_wp),
+		SH_PFC_PIN_GROUP(sdhi3_ds),
+		SH_PFC_PIN_GROUP(ssi0_data),
+		SH_PFC_PIN_GROUP(ssi01239_ctrl),
+		SH_PFC_PIN_GROUP(ssi1_data_a),
+		SH_PFC_PIN_GROUP(ssi1_data_b),
+		SH_PFC_PIN_GROUP(ssi1_ctrl_a),
+		SH_PFC_PIN_GROUP(ssi1_ctrl_b),
+		SH_PFC_PIN_GROUP(ssi2_data_a),
+		SH_PFC_PIN_GROUP(ssi2_data_b),
+		SH_PFC_PIN_GROUP(ssi2_ctrl_a),
+		SH_PFC_PIN_GROUP(ssi2_ctrl_b),
+		SH_PFC_PIN_GROUP(ssi3_data),
+		SH_PFC_PIN_GROUP(ssi349_ctrl),
+		SH_PFC_PIN_GROUP(ssi4_data),
+		SH_PFC_PIN_GROUP(ssi4_ctrl),
+		SH_PFC_PIN_GROUP(ssi5_data),
+		SH_PFC_PIN_GROUP(ssi5_ctrl),
+		SH_PFC_PIN_GROUP(ssi6_data),
+		SH_PFC_PIN_GROUP(ssi6_ctrl),
+		SH_PFC_PIN_GROUP(ssi7_data),
+		SH_PFC_PIN_GROUP(ssi78_ctrl),
+		SH_PFC_PIN_GROUP(ssi8_data),
+		SH_PFC_PIN_GROUP(ssi9_data_a),
+		SH_PFC_PIN_GROUP(ssi9_data_b),
+		SH_PFC_PIN_GROUP(ssi9_ctrl_a),
+		SH_PFC_PIN_GROUP(ssi9_ctrl_b),
+		SH_PFC_PIN_GROUP(tmu_tclk1_a),
+		SH_PFC_PIN_GROUP(tmu_tclk1_b),
+		SH_PFC_PIN_GROUP(tmu_tclk2_a),
+		SH_PFC_PIN_GROUP(tmu_tclk2_b),
+		SH_PFC_PIN_GROUP(tpu_to0),
+		SH_PFC_PIN_GROUP(tpu_to1),
+		SH_PFC_PIN_GROUP(tpu_to2),
+		SH_PFC_PIN_GROUP(tpu_to3),
+		SH_PFC_PIN_GROUP(usb0),
+		SH_PFC_PIN_GROUP(usb1),
+		SH_PFC_PIN_GROUP(usb2),
+		SH_PFC_PIN_GROUP(usb2_ch3),
+		SH_PFC_PIN_GROUP(usb30),
+		VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 10, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 12, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
+		SH_PFC_PIN_GROUP(vin4_data18_a),
+		VIN_DATA_PIN_GROUP(vin4_data, 20, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
+		VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
+		VIN_DATA_PIN_GROUP(vin4_data, 10, _b),
+		VIN_DATA_PIN_GROUP(vin4_data, 12, _b),
+		VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
+		SH_PFC_PIN_GROUP(vin4_data18_b),
+		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
+		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		SH_PFC_PIN_GROUP(vin4_sync),
+		SH_PFC_PIN_GROUP(vin4_field),
+		SH_PFC_PIN_GROUP(vin4_clkenb),
+		SH_PFC_PIN_GROUP(vin4_clk),
+		VIN_DATA_PIN_GROUP(vin5_data, 8),
+		VIN_DATA_PIN_GROUP(vin5_data, 10),
+		VIN_DATA_PIN_GROUP(vin5_data, 12),
+		VIN_DATA_PIN_GROUP(vin5_data, 16),
+		SH_PFC_PIN_GROUP(vin5_sync),
+		SH_PFC_PIN_GROUP(vin5_field),
+		SH_PFC_PIN_GROUP(vin5_clkenb),
+		SH_PFC_PIN_GROUP(vin5_clk),
+	},
+	.automotive = {
+		SH_PFC_PIN_GROUP(drif0_ctrl_a),
+		SH_PFC_PIN_GROUP(drif0_data0_a),
+		SH_PFC_PIN_GROUP(drif0_data1_a),
+		SH_PFC_PIN_GROUP(drif0_ctrl_b),
+		SH_PFC_PIN_GROUP(drif0_data0_b),
+		SH_PFC_PIN_GROUP(drif0_data1_b),
+		SH_PFC_PIN_GROUP(drif0_ctrl_c),
+		SH_PFC_PIN_GROUP(drif0_data0_c),
+		SH_PFC_PIN_GROUP(drif0_data1_c),
+		SH_PFC_PIN_GROUP(drif1_ctrl_a),
+		SH_PFC_PIN_GROUP(drif1_data0_a),
+		SH_PFC_PIN_GROUP(drif1_data1_a),
+		SH_PFC_PIN_GROUP(drif1_ctrl_b),
+		SH_PFC_PIN_GROUP(drif1_data0_b),
+		SH_PFC_PIN_GROUP(drif1_data1_b),
+		SH_PFC_PIN_GROUP(drif1_ctrl_c),
+		SH_PFC_PIN_GROUP(drif1_data0_c),
+		SH_PFC_PIN_GROUP(drif1_data1_c),
+		SH_PFC_PIN_GROUP(drif2_ctrl_a),
+		SH_PFC_PIN_GROUP(drif2_data0_a),
+		SH_PFC_PIN_GROUP(drif2_data1_a),
+		SH_PFC_PIN_GROUP(drif2_ctrl_b),
+		SH_PFC_PIN_GROUP(drif2_data0_b),
+		SH_PFC_PIN_GROUP(drif2_data1_b),
+		SH_PFC_PIN_GROUP(drif3_ctrl_a),
+		SH_PFC_PIN_GROUP(drif3_data0_a),
+		SH_PFC_PIN_GROUP(drif3_data1_a),
+		SH_PFC_PIN_GROUP(drif3_ctrl_b),
+		SH_PFC_PIN_GROUP(drif3_data0_b),
+		SH_PFC_PIN_GROUP(drif3_data1_b),
+	}
+
 };
 
 static const char * const audio_clk_groups[] = {
@@ -5031,64 +5039,72 @@ static const char * const vin5_groups[] = {
 	"vin5_clk",
 };
 
-static const struct sh_pfc_function pinmux_functions[] = {
-	SH_PFC_FUNCTION(audio_clk),
-	SH_PFC_FUNCTION(avb),
-	SH_PFC_FUNCTION(can0),
-	SH_PFC_FUNCTION(can1),
-	SH_PFC_FUNCTION(can_clk),
-	SH_PFC_FUNCTION(canfd0),
-	SH_PFC_FUNCTION(canfd1),
-	SH_PFC_FUNCTION(drif0),
-	SH_PFC_FUNCTION(drif1),
-	SH_PFC_FUNCTION(drif2),
-	SH_PFC_FUNCTION(drif3),
-	SH_PFC_FUNCTION(du),
-	SH_PFC_FUNCTION(hscif0),
-	SH_PFC_FUNCTION(hscif1),
-	SH_PFC_FUNCTION(hscif2),
-	SH_PFC_FUNCTION(hscif3),
-	SH_PFC_FUNCTION(hscif4),
-	SH_PFC_FUNCTION(i2c0),
-	SH_PFC_FUNCTION(i2c1),
-	SH_PFC_FUNCTION(i2c2),
-	SH_PFC_FUNCTION(i2c3),
-	SH_PFC_FUNCTION(i2c5),
-	SH_PFC_FUNCTION(i2c6),
-	SH_PFC_FUNCTION(intc_ex),
-	SH_PFC_FUNCTION(msiof0),
-	SH_PFC_FUNCTION(msiof1),
-	SH_PFC_FUNCTION(msiof2),
-	SH_PFC_FUNCTION(msiof3),
-	SH_PFC_FUNCTION(pwm0),
-	SH_PFC_FUNCTION(pwm1),
-	SH_PFC_FUNCTION(pwm2),
-	SH_PFC_FUNCTION(pwm3),
-	SH_PFC_FUNCTION(pwm4),
-	SH_PFC_FUNCTION(pwm5),
-	SH_PFC_FUNCTION(pwm6),
-	SH_PFC_FUNCTION(sata0),
-	SH_PFC_FUNCTION(scif0),
-	SH_PFC_FUNCTION(scif1),
-	SH_PFC_FUNCTION(scif2),
-	SH_PFC_FUNCTION(scif3),
-	SH_PFC_FUNCTION(scif4),
-	SH_PFC_FUNCTION(scif5),
-	SH_PFC_FUNCTION(scif_clk),
-	SH_PFC_FUNCTION(sdhi0),
-	SH_PFC_FUNCTION(sdhi1),
-	SH_PFC_FUNCTION(sdhi2),
-	SH_PFC_FUNCTION(sdhi3),
-	SH_PFC_FUNCTION(ssi),
-	SH_PFC_FUNCTION(tmu),
-	SH_PFC_FUNCTION(tpu),
-	SH_PFC_FUNCTION(usb0),
-	SH_PFC_FUNCTION(usb1),
-	SH_PFC_FUNCTION(usb2),
-	SH_PFC_FUNCTION(usb2_ch3),
-	SH_PFC_FUNCTION(usb30),
-	SH_PFC_FUNCTION(vin4),
-	SH_PFC_FUNCTION(vin5),
+static const struct {
+	struct sh_pfc_function common[53];
+	struct sh_pfc_function automotive[4];
+} pinmux_functions = {
+	.common = {
+		SH_PFC_FUNCTION(audio_clk),
+		SH_PFC_FUNCTION(avb),
+		SH_PFC_FUNCTION(can0),
+		SH_PFC_FUNCTION(can1),
+		SH_PFC_FUNCTION(can_clk),
+		SH_PFC_FUNCTION(canfd0),
+		SH_PFC_FUNCTION(canfd1),
+		SH_PFC_FUNCTION(du),
+		SH_PFC_FUNCTION(hscif0),
+		SH_PFC_FUNCTION(hscif1),
+		SH_PFC_FUNCTION(hscif2),
+		SH_PFC_FUNCTION(hscif3),
+		SH_PFC_FUNCTION(hscif4),
+		SH_PFC_FUNCTION(i2c0),
+		SH_PFC_FUNCTION(i2c1),
+		SH_PFC_FUNCTION(i2c2),
+		SH_PFC_FUNCTION(i2c3),
+		SH_PFC_FUNCTION(i2c5),
+		SH_PFC_FUNCTION(i2c6),
+		SH_PFC_FUNCTION(intc_ex),
+		SH_PFC_FUNCTION(msiof0),
+		SH_PFC_FUNCTION(msiof1),
+		SH_PFC_FUNCTION(msiof2),
+		SH_PFC_FUNCTION(msiof3),
+		SH_PFC_FUNCTION(pwm0),
+		SH_PFC_FUNCTION(pwm1),
+		SH_PFC_FUNCTION(pwm2),
+		SH_PFC_FUNCTION(pwm3),
+		SH_PFC_FUNCTION(pwm4),
+		SH_PFC_FUNCTION(pwm5),
+		SH_PFC_FUNCTION(pwm6),
+		SH_PFC_FUNCTION(sata0),
+		SH_PFC_FUNCTION(scif0),
+		SH_PFC_FUNCTION(scif1),
+		SH_PFC_FUNCTION(scif2),
+		SH_PFC_FUNCTION(scif3),
+		SH_PFC_FUNCTION(scif4),
+		SH_PFC_FUNCTION(scif5),
+		SH_PFC_FUNCTION(scif_clk),
+		SH_PFC_FUNCTION(sdhi0),
+		SH_PFC_FUNCTION(sdhi1),
+		SH_PFC_FUNCTION(sdhi2),
+		SH_PFC_FUNCTION(sdhi3),
+		SH_PFC_FUNCTION(ssi),
+		SH_PFC_FUNCTION(tmu),
+		SH_PFC_FUNCTION(tpu),
+		SH_PFC_FUNCTION(usb0),
+		SH_PFC_FUNCTION(usb1),
+		SH_PFC_FUNCTION(usb2),
+		SH_PFC_FUNCTION(usb2_ch3),
+		SH_PFC_FUNCTION(usb30),
+		SH_PFC_FUNCTION(vin4),
+		SH_PFC_FUNCTION(vin5),
+	},
+	.automotive = {
+		SH_PFC_FUNCTION(drif0),
+		SH_PFC_FUNCTION(drif1),
+		SH_PFC_FUNCTION(drif2),
+		SH_PFC_FUNCTION(drif3),
+	}
+
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
@@ -5777,7 +5793,9 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ PIN_DU_DOTCLKIN1,    0, 2 },	/* DU_DOTCLKIN1 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL12", 0xe6060330) {
+#ifdef CONFIG_PINCTRL_PFC_R8A77951
 		{ PIN_DU_DOTCLKIN2,   28, 2 },	/* DU_DOTCLKIN2 */
+#endif
 		{ PIN_DU_DOTCLKIN3,   24, 2 },	/* DU_DOTCLKIN3 */
 		{ PIN_FSCLKST_N,      20, 2 },	/* FSCLKST# */
 		{ PIN_TMS,             4, 2 },	/* TMS */
@@ -5898,8 +5916,8 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(6, 27), 20, 3 },	/* USB1_OVC */
 		{ RCAR_GP_PIN(6, 28), 16, 3 },	/* USB30_PWEN */
 		{ RCAR_GP_PIN(6, 29), 12, 3 },	/* USB30_OVC */
-		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* USB2_CH3_PWEN */
-		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* USB2_CH3_OVC */
+		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* GP6_30/USB2_CH3_PWEN */
+		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* GP6_31/USB2_CH3_OVC */
 	} },
 	{ },
 };
@@ -6220,6 +6238,32 @@ static const struct sh_pfc_soc_operations r8a77951_pinmux_ops = {
 	.set_bias = r8a77951_pinmux_set_bias,
 };
 
+#ifdef CONFIG_PINCTRL_PFC_R8A774E1
+const struct sh_pfc_soc_info r8a774e1_pinmux_info = {
+	.name = "r8a774e1_pfc",
+	.ops = &r8a77951_pinmux_ops,
+	.unlock_reg = 0xe6060000, /* PMMR */
+
+	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
+
+	.pins = pinmux_pins,
+	.nr_pins = ARRAY_SIZE(pinmux_pins),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common),
+
+	.cfg_regs = pinmux_config_regs,
+	.drive_regs = pinmux_drive_regs,
+	.bias_regs = pinmux_bias_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
+
+	.pinmux_data = pinmux_data,
+	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+};
+#endif
+
+#ifdef CONFIG_PINCTRL_PFC_R8A77951
 const struct sh_pfc_soc_info r8a77951_pinmux_info = {
 	.name = "r8a77951_pfc",
 	.ops = &r8a77951_pinmux_ops,
@@ -6229,10 +6273,12 @@ const struct sh_pfc_soc_info r8a77951_pinmux_info = {
 
 	.pins = pinmux_pins,
 	.nr_pins = ARRAY_SIZE(pinmux_pins),
-	.groups = pinmux_groups,
-	.nr_groups = ARRAY_SIZE(pinmux_groups),
-	.functions = pinmux_functions,
-	.nr_functions = ARRAY_SIZE(pinmux_functions),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
+			ARRAY_SIZE(pinmux_groups.automotive),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
+			ARRAY_SIZE(pinmux_functions.automotive),
 
 	.cfg_regs = pinmux_config_regs,
 	.drive_regs = pinmux_drive_regs,
@@ -6242,3 +6288,4 @@ const struct sh_pfc_soc_info r8a77951_pinmux_info = {
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
 };
+#endif
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 0f013827baf9..eff1bb872325 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -312,6 +312,7 @@ extern const struct sh_pfc_soc_info r8a77470_pinmux_info;
 extern const struct sh_pfc_soc_info r8a774a1_pinmux_info;
 extern const struct sh_pfc_soc_info r8a774b1_pinmux_info;
 extern const struct sh_pfc_soc_info r8a774c0_pinmux_info;
+extern const struct sh_pfc_soc_info r8a774e1_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7778_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7779_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7790_pinmux_info;
-- 
2.17.1

