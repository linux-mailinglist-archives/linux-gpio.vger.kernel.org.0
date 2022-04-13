Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C114FFCB4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbiDMRcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbiDMRcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:32:04 -0400
X-Greylist: delayed 320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Apr 2022 10:29:41 PDT
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D5651E48
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:29:40 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4KdqFr1ypXz4xFlb
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 19:24:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQG270052t8Arn01HQGXS; Wed, 13 Apr 2022 19:24:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000Tq5-EB; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negiz-00DfRh-Vm; Wed, 13 Apr 2022 19:24:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/50] pinctrl: renesas: r8a77470: Use fixed-width description for IPSR regs
Date:   Wed, 13 Apr 2022 19:23:23 +0200
Message-Id: <f6f26a0dfd16050ead83daf2b9fabeb8b26821a6.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All fields in the IPSR registers on RZ/G1C have the same width, but the
driver describes them using the PINMUX_CFG_REG_VAR() macro, which
is intended for fields with different widths.  Convert the description
to use the PINMUX_CFG_REG() macro for fixed-width fields instead.

This reduces kernel size by 162 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 72 +++++++-------------------
 1 file changed, 18 insertions(+), 54 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index ee6e8fabab246c2b..63db71ebb7e955ec 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -2689,9 +2689,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_5_1_FN, FN_IP14_3_0,
 		GP_5_0_FN, FN_IP13_31_28, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR0", 0xE6060040, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR0", 0xE6060040, 32, 4, GROUP(
 		/* IP0_31_28 [4] */
 		FN_SD0_WP, FN_IRQ7, FN_CAN0_TX_A, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
@@ -2717,9 +2715,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SD0_CLK, 0, 0, FN_SSI_SCK1_C, FN_RX3_C, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR1", 0xE6060044, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR1", 0xE6060044, 32, 4, GROUP(
 		/* IP1_31_28 [4] */
 		FN_D5, FN_HRX2, FN_SCL1_B, FN_PWM2_C, FN_TCLK2_B, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
@@ -2745,9 +2741,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_MMC0_D4, FN_SD1_CD, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR2", 0xE6060048, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR2", 0xE6060048, 32, 4, GROUP(
 		/* IP2_31_28 [4] */
 		FN_D13, FN_MSIOF2_SYNC_A, 0, FN_RX4_C, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0,
@@ -2773,9 +2767,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_D6, FN_HTX2, FN_SDA1_B, FN_PWM4_C, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR3", 0xE606004C, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR3", 0xE606004C, 32, 4, GROUP(
 		/* IP3_31_28 [4] */
 		FN_QSPI0_SSL, FN_WE1_N, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 		0, 0,
@@ -2802,9 +2794,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		0, FN_AVB_AVTP_CAPTURE_A,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR4", 0xE6060050, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR4", 0xE6060050, 32, 4, GROUP(
 		/* IP4_31_28 [4] */
 		FN_DU0_DR6, 0, FN_RX2_C, 0, 0, 0, FN_A6, 0,
 		0, 0, 0, 0, 0, 0, 0, 0,
@@ -2830,9 +2820,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_EX_WAIT0, FN_CAN_CLK_B, FN_SCIF_CLK_A, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR5", 0xE6060054, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR5", 0xE6060054, 32, 4, GROUP(
 		/* IP5_31_28 [4] */
 		FN_DU0_DG6, 0, FN_HRX1_C, 0, 0, 0, FN_A14,  0, 0, 0,
 		0, 0, 0, 0, 0, 0,
@@ -2858,9 +2846,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DU0_DR7, 0, FN_TX2_C, 0, FN_PWM2_B, 0, FN_A7, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR6", 0xE6060058, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR6", 0xE6060058, 32, 4, GROUP(
 		/* IP6_31_28 [4] */
 		FN_DU0_DB6, 0, 0, 0, 0, 0, FN_A22, 0, 0,
 		0, 0, 0, 0, 0, 0, 0,
@@ -2886,9 +2872,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DU0_DG7, 0, FN_HTX1_C, 0,  FN_PWM6_B, 0, FN_A15,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR7", 0xE606005C, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR7", 0xE606005C, 32, 4, GROUP(
 		/* IP7_31_28 [4] */
 		FN_DU0_DISP, 0, 0, 0, FN_CAN1_RX_C, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0,
@@ -2914,9 +2898,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DU0_DB7, 0, 0, 0, 0, 0, FN_A23, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR8", 0xE6060060, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR8", 0xE6060060, 32, 4, GROUP(
 		/* IP8_31_28 [4] */
 		FN_VI1_DATA5, 0, 0, 0, FN_AVB_RXD4, FN_ETH_LINK, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0,
@@ -2942,9 +2924,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_DU0_CDE, 0, 0, 0, FN_CAN1_TX_C, 0, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR9", 0xE6060064, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR9", 0xE6060064, 32, 4, GROUP(
 		/* IP9_31_28 [4] */
 		FN_VI1_DATA9, 0, 0, FN_SDA2_B, FN_AVB_TXD0, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0,
@@ -2970,9 +2950,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI1_DATA6, 0, 0, 0, FN_AVB_RXD5, FN_ETH_TXD1, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR10", 0xE6060068, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR10", 0xE6060068, 32, 4, GROUP(
 		/* IP10_31_28 [4] */
 		FN_SCL1_A, FN_RX4_A, FN_PWM5_D, FN_DU1_DR0, 0, 0,
 		FN_SSI_SCK6_B, FN_VI0_G0, 0, 0, 0, 0, 0, 0, 0, 0,
@@ -2999,9 +2977,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_VI1_DATA10, 0, 0, FN_CAN0_RX_B, FN_AVB_TXD1, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR11", 0xE606006C, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR11", 0xE606006C, 32, 4, GROUP(
 		/* IP11_31_28 [4] */
 		FN_HRX1_A, FN_SCL4_A, FN_PWM6_A, FN_DU1_DG0, FN_RX0_A, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, 0,
@@ -3031,9 +3007,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SDA1_A, FN_TX4_A, 0, FN_DU1_DR1, 0, 0, FN_SSI_WS6_B,
 		FN_VI0_G1, 0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR12", 0xE6060070, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR12", 0xE6060070, 32, 4, GROUP(
 		/* IP12_31_28 [4] */
 		FN_SD2_DAT2, FN_RX2_A, 0, FN_DU1_DB0, FN_SSI_SDATA2_B, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, 0,
@@ -3059,9 +3033,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_HTX1_A, FN_SDA4_A, 0, FN_DU1_DG1, FN_TX0_A, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR13", 0xE6060074, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR13", 0xE6060074, 32, 4, GROUP(
 		/* IP13_31_28 [4] */
 		FN_SSI_SCK5_A, 0, 0, FN_DU1_DOTCLKOUT1, 0, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0,
@@ -3088,9 +3060,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SD2_DAT3, FN_TX2_A, 0, FN_DU1_DB1, FN_SSI_WS9_B, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR14", 0xE6060078, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR14", 0xE6060078, 32, 4, GROUP(
 		/* IP14_31_28 [4] */
 		FN_SSI_SDATA7_A, 0, 0, FN_IRQ8, FN_AUDIO_CLKA_D, FN_CAN_CLK_D,
 		FN_VI0_G5, 0, 0, 0, 0, 0, 0, 0, 0, 0,
@@ -3116,9 +3086,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SSI_WS5_A, 0, FN_SCL3_C, FN_DU1_DOTCLKIN, 0, 0, 0, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR15", 0xE606007C, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR15", 0xE606007C, 32, 4, GROUP(
 		/* IP15_31_28 [4] */
 		FN_SSI_WS4_A, 0, FN_AVB_PHY_INT, 0, 0, 0, FN_VI0_R5, 0, 0, 0,
 		0, 0, 0, 0, 0, 0,
@@ -3144,9 +3112,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SSI_SCK0129_A, FN_MSIOF1_RXD_A, FN_RX5_D, 0, 0, 0,
 		FN_VI0_G6, 0, 0, 0, 0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR16", 0xE6060080, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR16", 0xE6060080, 32, 4, GROUP(
 		/* IP16_31_28 [4] */
 		FN_SSI_SDATA2_A, FN_HRTS1_N_B, 0, 0, 0, 0,
 		FN_VI0_DATA4_VI0_B4, 0, 0, 0, 0, 0, 0, 0, 0, 0,
@@ -3173,9 +3139,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SSI_SDATA4_A, 0, FN_AVB_CRS, 0, 0, 0, FN_VI0_R6, 0, 0, 0,
 		0, 0, 0, 0, 0, 0, ))
 	},
-	{ PINMUX_CFG_REG_VAR("IPSR17", 0xE6060084, 32,
-			     GROUP(4, 4, 4, 4, 4, 4, 4, 4),
-			     GROUP(
+	{ PINMUX_CFG_REG("IPSR17", 0xE6060084, 32, 4, GROUP(
 		/* IP17_31_28 [4] */
 		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 		/* IP17_27_24 [4] */
-- 
2.25.1

