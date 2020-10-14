Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F5028DF8B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 13:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730481AbgJNLCp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 07:02:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:18022 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730467AbgJNLCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 07:02:44 -0400
X-IronPort-AV: E=Sophos;i="5.77,374,1596466800"; 
   d="scan'208";a="59768253"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Oct 2020 20:02:42 +0900
Received: from localhost.localdomain (unknown [172.29.51.165])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B344540078A0;
        Wed, 14 Oct 2020 20:02:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC] pinctrl: sh-pfc: pfc-r8a77965: Optimize pinctrl image size for RZ/G2N
Date:   Wed, 14 Oct 2020 12:02:38 +0100
Message-Id: <20201014110238.9600-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Optimize pinctrl image size, when only RZ/G2N is enabled in the defconfig.
(ie, disabling CONFIG_ARCH_R8A77965 from the defconfig)

with this patch and disabling CONFIG_ARCH_R8A77965:
$ size drivers/pinctrl/sh-pfc/pfc-r8a77965.o
   text	   data	    bss	    dec	    hex	filename
  49384	      0	      0	  49384	   c0e8	drivers/pinctrl/sh-pfc/pfc-r8a77965.o

without patch:
$ size drivers/pinctrl/sh-pfc/pfc-r8a77965.o
   text	   data	    bss	    dec	    hex	filename
  51848	      0	      0	  51848	   ca88	drivers/pinctrl/sh-pfc/pfc-r8a77965.o

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch will save ~ 6KB=(3x 2KB/SoC) of memory on RZ/G2[HMN] u-boot[1] with
multi dtb support. As per discussion [1], u-boot imports PFC and Clock tables from Linux.

[1] https://patchwork.ozlabs.org/project/uboot/patch/20201013085205.6075-4-biju.das.jz@bp.renesas.com/

1) By compiling out Automative parts
$ size drivers/pinctrl/renesas/pfc-r8a77965.o
   text	   data	    bss	    dec	    hex	filename
  46141	      0	      0	  46141	   b43d	drivers/pinctrl/renesas/pfc-r8a77965.o

2) without patch
$ size drivers/pinctrl/renesas/pfc-r8a77965.o
   text	   data	    bss	    dec	    hex	filename
  48191	      0	      0	  48191	   bc3f	drivers/pinctrl/renesas/pfc-r8a77965.o

Please share your comments.
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 6616f5210b9d..8e80b96aa4e5 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -18,6 +18,14 @@
 #include "core.h"
 #include "sh_pfc.h"
 
+#ifdef CONFIG_PINCTRL_PFC_R8A77965
+#define PFC_R8A77965_GROUP	(30)
+#define PFC_R8A77965_FUNCTION	(4)
+#else
+#define PFC_R8A77965_GROUP	(0)
+#define PFC_R8A77965_FUNCTION	(0)
+#endif
+
 #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define CPU_ALL_GP(fn, sfx)						\
@@ -1847,6 +1855,7 @@ static const unsigned int canfd1_data_mux[] = {
 	CANFD1_TX_MARK,         CANFD1_RX_MARK,
 };
 
+#ifdef CONFIG_PINCTRL_PFC_R8A77965
 /* - DRIF0 --------------------------------------------------------------- */
 static const unsigned int drif0_ctrl_a_pins[] = {
 	/* CLK, SYNC */
@@ -2120,6 +2129,7 @@ static const unsigned int drif3_data1_b_pins[] = {
 static const unsigned int drif3_data1_b_mux[] = {
 	RIF3_D1_B_MARK,
 };
+#endif
 
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du_rgb666_pins[] = {
@@ -4380,7 +4390,7 @@ static const unsigned int vin5_clk_mux[] = {
 
 static const struct {
 	struct sh_pfc_pin_group common[318];
-	struct sh_pfc_pin_group automotive[30];
+	struct sh_pfc_pin_group automotive[PFC_R8A77965_GROUP];
 } pinmux_groups = {
 	.common = {
 		SH_PFC_PIN_GROUP(audio_clk_a_a),
@@ -4703,6 +4713,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin5_clk),
 	},
 	.automotive = {
+#ifdef CONFIG_PINCTRL_PFC_R8A77965
 		SH_PFC_PIN_GROUP(drif0_ctrl_a),
 		SH_PFC_PIN_GROUP(drif0_data0_a),
 		SH_PFC_PIN_GROUP(drif0_data1_a),
@@ -4733,6 +4744,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(drif3_ctrl_b),
 		SH_PFC_PIN_GROUP(drif3_data0_b),
 		SH_PFC_PIN_GROUP(drif3_data1_b),
+#endif
 	}
 };
 
@@ -4792,6 +4804,7 @@ static const char * const canfd1_groups[] = {
 	"canfd1_data",
 };
 
+#ifdef CONFIG_PINCTRL_PFC_R8A77965
 static const char * const drif0_groups[] = {
 	"drif0_ctrl_a",
 	"drif0_data0_a",
@@ -4833,6 +4846,7 @@ static const char * const drif3_groups[] = {
 	"drif3_data0_b",
 	"drif3_data1_b",
 };
+#endif
 
 static const char * const du_groups[] = {
 	"du_rgb666",
@@ -5250,7 +5264,7 @@ static const char * const vin5_groups[] = {
 
 static const struct {
 	struct sh_pfc_function common[51];
-	struct sh_pfc_function automotive[4];
+	struct sh_pfc_function automotive[PFC_R8A77965_FUNCTION];
 } pinmux_functions = {
 	.common = {
 		SH_PFC_FUNCTION(audio_clk),
@@ -5306,10 +5320,12 @@ static const struct {
 		SH_PFC_FUNCTION(vin5),
 	},
 	.automotive = {
+#ifdef CONFIG_PINCTRL_PFC_R8A77965
 		SH_PFC_FUNCTION(drif0),
 		SH_PFC_FUNCTION(drif1),
 		SH_PFC_FUNCTION(drif2),
 		SH_PFC_FUNCTION(drif3),
+#endif
 	}
 };
 
-- 
2.17.1

