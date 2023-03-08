Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9E66B0868
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbjCHNTd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbjCHNSm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:42 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087F8CDA3F
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:26 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by xavier.telenet-ops.be with bizsmtp
        id VpFL2900L3mNwr401pFLHk; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd0-00BF1D-IQ;
        Wed, 08 Mar 2023 14:15:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrHY-00FUij-Cf;
        Wed, 08 Mar 2023 11:44:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Annotate sentinels in tables
Date:   Wed,  8 Mar 2023 11:44:27 +0100
Message-Id: <845f1d8285dd44522af1b0f429d4c6bd4759eb9e.1678272180.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It does not make sense to have a comma after a sentinel, as any new
elements must be added before the sentinel.  Hence drop all such commas.

Add comments to clarify the purpose of the empty elements.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No change in generated code.
To be queued in renesas-pinctrl-for-v6.4.

 drivers/pinctrl/renesas/core.c         | 4 ++--
 drivers/pinctrl/renesas/pfc-emev2.c    | 2 +-
 drivers/pinctrl/renesas/pfc-r8a73a4.c  | 4 ++--
 drivers/pinctrl/renesas/pfc-r8a7740.c  | 4 ++--
 drivers/pinctrl/renesas/pfc-r8a77470.c | 2 +-
 drivers/pinctrl/renesas/pfc-r8a7778.c  | 4 ++--
 drivers/pinctrl/renesas/pfc-r8a7779.c  | 2 +-
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 2 +-
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 4 ++--
 drivers/pinctrl/renesas/pfc-r8a7792.c  | 2 +-
 drivers/pinctrl/renesas/pfc-r8a7794.c  | 2 +-
 drivers/pinctrl/renesas/pfc-r8a77951.c | 8 ++++----
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 8 ++++----
 drivers/pinctrl/renesas/pfc-r8a77965.c | 8 ++++----
 drivers/pinctrl/renesas/pfc-r8a77970.c | 4 ++--
 drivers/pinctrl/renesas/pfc-r8a77980.c | 4 ++--
 drivers/pinctrl/renesas/pfc-r8a77990.c | 8 ++++----
 drivers/pinctrl/renesas/pfc-r8a77995.c | 4 ++--
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 8 ++++----
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 8 ++++----
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 8 ++++----
 drivers/pinctrl/renesas/pfc-sh7203.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7264.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7269.c   | 6 ++----
 drivers/pinctrl/renesas/pfc-sh73a0.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7720.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7722.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7723.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7724.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7734.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7757.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7785.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-sh7786.c   | 4 ++--
 drivers/pinctrl/renesas/pfc-shx3.c     | 4 ++--
 drivers/pinctrl/renesas/pinctrl-rza1.c | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 2 +-
 36 files changed, 78 insertions(+), 80 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 336cfae756b0f12b..17f70be2b2b9a7c7 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -645,7 +645,7 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &sh73a0_pinmux_info,
 	},
 #endif
-	{ },
+	{ /* sentinel */ }
 };
 #endif
 
@@ -1411,7 +1411,7 @@ static const struct platform_device_id sh_pfc_id_table[] = {
 #ifdef CONFIG_PINCTRL_PFC_SHX3
 	{ "pfc-shx3", (kernel_ulong_t)&shx3_pinmux_info },
 #endif
-	{ },
+	{ /* sentinel */ }
 };
 
 static struct platform_driver sh_pfc_driver = {
diff --git a/drivers/pinctrl/renesas/pfc-emev2.c b/drivers/pinctrl/renesas/pfc-emev2.c
index 1d8b540110f23e4c..86d18b03668eacb8 100644
--- a/drivers/pinctrl/renesas/pfc-emev2.c
+++ b/drivers/pinctrl/renesas/pfc-emev2.c
@@ -1644,7 +1644,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_HSI_1_0_00, FN_SEL_HSI_1_0_01, 0, 0,
 		))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info emev2_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a73a4.c b/drivers/pinctrl/renesas/pfc-r8a73a4.c
index dbfc46fe2f277092..be0a4914eab3357a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a73a4.c
+++ b/drivers/pinctrl/renesas/pfc-r8a73a4.c
@@ -2384,7 +2384,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			MSEL8CR_00_0, MSEL8CR_00_1,
 		))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -2510,7 +2510,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 			PORT323_DATA, PORT322_DATA, PORT321_DATA, PORT320_DATA,
 		))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_irq pinmux_irqs[] = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
index 6dcd39918daf96bc..9ee3b700a3d3d298 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7740.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7740.c
@@ -3348,7 +3348,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			MSEL5CR_0_0,	MSEL5CR_0_1,
 		))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -3452,7 +3452,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		0, 0, 0, 0,
 		0, 0, 0, 0 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_irq pinmux_irqs[] = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index 4ba710610255e580..ed48b043763fef6c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -3252,7 +3252,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_SSI0 [2] */
 		FN_SEL_SSI0_0, FN_SEL_SSI0_1, 0, 0, ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static int r8a77470_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index 35bdb9af81607566..c52761d80f7bed16 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -2832,7 +2832,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_I2C1_A,		FN_SEL_I2C1_B,
 		))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
@@ -3040,7 +3040,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a7778_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7779.c b/drivers/pinctrl/renesas/pfc-r8a7779.c
index fcc8ea48881fb961..0a94ef64f954d600 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7779.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7779.c
@@ -3919,7 +3919,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    /* SEL_I2C1 [2] */
 	    FN_SEL_I2C1_0, FN_SEL_I2C1_1, FN_SEL_I2C1_2, FN_SEL_I2C1_3 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info r8a7779_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 149700ee1d104ffd..791e089d47dbca58 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -5824,7 +5824,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* SEL_I2C1 [2] */
 		FN_SEL_I2C1_0, FN_SEL_I2C1_1, FN_SEL_I2C1_2, 0, ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static int r8a7790_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index c83e21c4c3955814..d9e5ce0dfb5b3e2d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -6552,7 +6552,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_SSP_0, FN_SEL_SSP_1, FN_SEL_SSP_2, 0,
 		/* RESERVED [6] */ ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static int r8a7791_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
@@ -6874,7 +6874,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a7791_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
index 808a85d62415399f..2c51c32b8e0904fc 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7792.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7792.c
@@ -2625,7 +2625,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* IP7_1_0 [2] */
 		FN_PWM0, FN_TCLK1, FN_FSO_CFE_0, 0 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index 6e801ae90d25a404..e800fef91ddb1e5b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -5512,7 +5512,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		FN_SEL_SSI9_0, FN_SEL_SSI9_1,
 		/* RESERVED [12] */ ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static int r8a7794_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index 321014c8bc16f86d..a1d74f61fd8cce64 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -5610,7 +5610,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* RESERVED 16-1 */
 		MOD_SEL2_0 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_drive_reg pinmux_drive_regs[] = {
@@ -5861,7 +5861,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* GP6_30/USB2_CH3_PWEN */
 		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* GP6_31/USB2_CH3_OVC */
 	} },
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -5872,7 +5872,7 @@ enum ioctrl_regs {
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL] = { 0xe6060380, },
 	[TDSELCTRL] = { 0xe60603c0, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a77951_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
@@ -6129,7 +6129,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a77951_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 5db8429c54fecb02..807834f319f07d8c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -5565,7 +5565,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* RESERVED 16-1 */
 		MOD_SEL2_0 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_drive_reg pinmux_drive_regs[] = {
@@ -5813,7 +5813,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* GP6_30 */
 		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* GP6_31 */
 	} },
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -5824,7 +5824,7 @@ enum ioctrl_regs {
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL] = { 0xe6060380, },
 	[TDSELCTRL] = { 0xe60603c0, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a7796_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
@@ -6081,7 +6081,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a7796_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index 2b8b49b18b10b822..e7c88a5d983f4343 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -5806,7 +5806,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		/* RESERVED 16-1 */
 		MOD_SEL2_0 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_drive_reg pinmux_drive_regs[] = {
@@ -6054,7 +6054,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(6, 30),  8, 3 },	/* GP6_30 */
 		{ RCAR_GP_PIN(6, 31),  4, 3 },	/* GP6_31 */
 	} },
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -6065,7 +6065,7 @@ enum ioctrl_regs {
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL] = { 0xe6060380, },
 	[TDSELCTRL] = { 0xe60603c0, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a77965_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
@@ -6322,7 +6322,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a77965_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index 54da0c025458d0a7..5b66d7b1af951337 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -2343,7 +2343,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_1
 		MOD_SEL0_0 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -2358,7 +2358,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL1] = { 0xe6060384 },
 	[POCCTRL2] = { 0xe6060388 },
 	[TDSELCTRL] = { 0xe60603c0, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a77970_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index 8effbcec0b227ee3..384faa0d6937b1bf 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -2815,7 +2815,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL0_1
 		MOD_SEL0_0 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -2832,7 +2832,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL2] = { 0xe6060388, },
 	[POCCTRL3] = { 0xe606038c, },
 	[TDSELCTRL] = { 0xe60603c0, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a77980_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 229ad12bc9b7e6b0..262390dd7d67a101 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -5004,7 +5004,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_4
 		/* RESERVED 3, 2, 1, 0  */ ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_drive_reg pinmux_drive_regs[] = {
@@ -5037,7 +5037,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(4,  9), 17, 2 },	/* SD3_DAT7 */
 		{ RCAR_GP_PIN(4, 10), 14, 2 },	/* SD3_DS */
 	} },
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -5050,7 +5050,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL0] = { 0xe6060380, },
 	[POCCTRL2] = { 0xe6060388, },
 	[TDSELCTRL] = { 0xe60603c0, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a77990_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
@@ -5278,7 +5278,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = RCAR_GP_PIN(6,  9),	/* USB30_OVC */
 		[31] = RCAR_GP_PIN(6, 17),	/* USB30_PWEN */
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a77990_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 29664d97e5ec0748..298e7a07e4934e67 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -2853,7 +2853,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_26
 		/* RESERVED 25-0 */ ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -2866,7 +2866,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL0] = { 0xe6060380, },
 	[POCCTRL2] = { 0xe6060388, },
 	[TDSELCTRL] = { 0xe60603c0, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 6069869353bb42f1..a01bc197d70695f1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -3630,7 +3630,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL2_3_2
 		/* RESERVED 1-0 */ ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_drive_reg pinmux_drive_regs[] = {
@@ -3935,7 +3935,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(9, 17),  4, 3 },	/* AVB5_LINK */
 		{ RCAR_GP_PIN(9, 16),  0, 3 },	/* AVB5_PHY_INT */
 	} },
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -3962,7 +3962,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POC8] = { 0xe60690a0, },
 	[POC9] = { 0xe60698a0, },
 	[TD1SEL0] = { 0xe6058124, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a779a0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
@@ -4349,7 +4349,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a779a0_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index 65c141ce909ac371..16e722a4d18fa635 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -1784,7 +1784,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL1_3_2
 		MOD_SEL1_1_0))
 	},
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_drive_reg pinmux_drive_regs[] = {
@@ -1896,7 +1896,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(3, 17),  4, 3 },	/* TSN0_AVTP_MATCH_B */
 		{ RCAR_GP_PIN(3, 16),  0, 3 },	/* TSN0_AVTP_PPS */
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -1911,7 +1911,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POC1] = { 0xe60508a0, },
 	[POC3] = { 0xe60518a0, },
 	[TD0SEL1] = { 0xe6050920, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a779f0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
@@ -2070,7 +2070,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a779f0_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 3243668522823383..8420145a271d5bf8 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -3802,7 +3802,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MOD_SEL8_1
 		MOD_SEL8_0))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_drive_reg pinmux_drive_regs[] = {
@@ -4064,7 +4064,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(8,  9),  4, 3 },	/* SDA4 */
 		{ RCAR_GP_PIN(8,  8),  0, 3 },	/* SCL4 */
 	} },
-	{ },
+	{ /* sentinel */ }
 };
 
 enum ioctrl_regs {
@@ -4087,7 +4087,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POC6]		= { 0xE60610A0, },
 	[POC7]		= { 0xE60618A0, },
 	[POC8]		= { 0xE60680A0, },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static int r8a779g0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
@@ -4439,7 +4439,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[30] = SH_PFC_PIN_NONE,
 		[31] = SH_PFC_PIN_NONE,
 	} },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 
 static const struct sh_pfc_soc_operations r8a779g0_pin_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7203.c b/drivers/pinctrl/renesas/pfc-sh7203.c
index 19735746b1bb2157..640564db2c0b6f01 100644
--- a/drivers/pinctrl/renesas/pfc-sh7203.c
+++ b/drivers/pinctrl/renesas/pfc-sh7203.c
@@ -1509,7 +1509,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PF0MD_00, PF0MD_01, PF0MD_10, PF0MD_11,
 		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -1555,7 +1555,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		PF7_DATA, PF6_DATA, PF5_DATA, PF4_DATA,
 		PF3_DATA, PF2_DATA, PF1_DATA, PF0_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7203_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7264.c b/drivers/pinctrl/renesas/pfc-sh7264.c
index 30096925a70c5d88..8417c4243ddacf8d 100644
--- a/drivers/pinctrl/renesas/pfc-sh7264.c
+++ b/drivers/pinctrl/renesas/pfc-sh7264.c
@@ -2031,7 +2031,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PK1_IN, PK1_OUT,
 		PK0_IN, PK0_OUT ))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -2109,7 +2109,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		PK7_DATA, PK6_DATA, PK5_DATA, PK4_DATA,
 		PK3_DATA, PK2_DATA, PK1_DATA, PK0_DATA ))
 	},
-	{ }
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7264_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7269.c b/drivers/pinctrl/renesas/pfc-sh7269.c
index f59f558d75ae253e..3569093f17ae63a4 100644
--- a/drivers/pinctrl/renesas/pfc-sh7269.c
+++ b/drivers/pinctrl/renesas/pfc-sh7269.c
@@ -2749,8 +2749,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PJ1_IN, PJ1_OUT,
 		PJ0_IN, PJ0_OUT ))
 	},
-
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -2828,8 +2827,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		PJ7_DATA, PJ6_DATA, PJ5_DATA, PJ4_DATA,
 		PJ3_DATA, PJ2_DATA, PJ1_DATA, PJ0_DATA ))
 	},
-
-	{ }
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7269_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index 4f54dfd5a9674916..ca5adf2095be3167 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -3876,7 +3876,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 			/* RESERVED [1] */
 		))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -3980,7 +3980,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 			PORT295_DATA, PORT294_DATA, PORT293_DATA, PORT292_DATA,
 			PORT291_DATA, PORT290_DATA, PORT289_DATA, PORT288_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_irq pinmux_irqs[] = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7720.c b/drivers/pinctrl/renesas/pfc-sh7720.c
index 6eedcc5bbb4d6705..91434743fb1c4352 100644
--- a/drivers/pinctrl/renesas/pfc-sh7720.c
+++ b/drivers/pinctrl/renesas/pfc-sh7720.c
@@ -1103,7 +1103,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PTV1_FN, PTV1_OUT, 0, PTV1_IN,
 		PTV0_FN, PTV0_OUT, 0, PTV0_IN ))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -1179,7 +1179,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		0, 0, 0, PTV4_DATA,
 		PTV3_DATA, PTV2_DATA, PTV1_DATA, PTV0_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7720_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7722.c b/drivers/pinctrl/renesas/pfc-sh7722.c
index 4b82ac2c5e91d787..54b4625b52cf0343 100644
--- a/drivers/pinctrl/renesas/pfc-sh7722.c
+++ b/drivers/pinctrl/renesas/pfc-sh7722.c
@@ -1585,7 +1585,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		MSELB8_RGB, MSELB8_SYS,
 		/* RESERVED [8] */ ))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -1681,7 +1681,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		0, 0, PTZ5_DATA, PTZ4_DATA,
 		PTZ3_DATA, PTZ2_DATA, PTZ1_DATA, PTZ0_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7722_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7723.c b/drivers/pinctrl/renesas/pfc-sh7723.c
index 95344281966e6eb0..c1abdec9bf1d60df 100644
--- a/drivers/pinctrl/renesas/pfc-sh7723.c
+++ b/drivers/pinctrl/renesas/pfc-sh7723.c
@@ -1784,7 +1784,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PSD3_PSD2_FN1, PSD3_PSD2_FN2, 0, 0,
 		PSD1_PSD0_FN1, PSD1_PSD0_FN2, 0, 0 ))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -1880,7 +1880,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		PTZ7_DATA, PTZ6_DATA, PTZ5_DATA, PTZ4_DATA,
 		PTZ3_DATA, PTZ2_DATA, PTZ1_DATA, PTZ0_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7723_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7724.c b/drivers/pinctrl/renesas/pfc-sh7724.c
index 26517ad26a0fd1b8..5148a3460cc6f0b4 100644
--- a/drivers/pinctrl/renesas/pfc-sh7724.c
+++ b/drivers/pinctrl/renesas/pfc-sh7724.c
@@ -2059,7 +2059,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PSE1_0,  PSE1_1,
 		PSE0_0,  PSE0_1))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -2155,7 +2155,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		PTZ7_DATA, PTZ6_DATA, PTZ5_DATA, PTZ4_DATA,
 		PTZ3_DATA, PTZ2_DATA, PTZ1_DATA, PTZ0_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7724_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7734.c b/drivers/pinctrl/renesas/pfc-sh7734.c
index 106a500ad13d160e..a0a5d8b94086f0b9 100644
--- a/drivers/pinctrl/renesas/pfc-sh7734.c
+++ b/drivers/pinctrl/renesas/pfc-sh7734.c
@@ -2366,7 +2366,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_5_1_IN, GP_5_1_OUT,
 		GP_5_0_IN, GP_5_0_OUT ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -2383,7 +2383,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		GP_5_7_DATA, GP_5_6_DATA, GP_5_5_DATA, GP_5_4_DATA,
 		GP_5_3_DATA, GP_5_2_DATA, GP_5_1_DATA, GP_5_0_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7734_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7757.c b/drivers/pinctrl/renesas/pfc-sh7757.c
index 0d7857d7efefb47b..817b22c3e6395d3d 100644
--- a/drivers/pinctrl/renesas/pfc-sh7757.c
+++ b/drivers/pinctrl/renesas/pfc-sh7757.c
@@ -2089,7 +2089,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PS8_8_FN1, PS8_8_FN2,
 		/* RESERVED [8] */ ))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -2197,7 +2197,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		PTZ7_DATA, PTZ6_DATA, PTZ5_DATA, PTZ4_DATA,
 		PTZ3_DATA, PTZ2_DATA, PTZ1_DATA, PTZ0_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7757_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7785.c b/drivers/pinctrl/renesas/pfc-sh7785.c
index 126b663bb6eb3abe..0b6fbbac7c6dfc94 100644
--- a/drivers/pinctrl/renesas/pfc-sh7785.c
+++ b/drivers/pinctrl/renesas/pfc-sh7785.c
@@ -1168,7 +1168,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		P2MSEL1_0, P2MSEL1_1,
 		P2MSEL0_0, P2MSEL0_1 ))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -1236,7 +1236,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		0, 0, 0, 0,
 		PR3_DATA, PR2_DATA, PR1_DATA, PR0_DATA ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7785_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh7786.c b/drivers/pinctrl/renesas/pfc-sh7786.c
index f09f4a76901088b4..a1ff39c5424d1244 100644
--- a/drivers/pinctrl/renesas/pfc-sh7786.c
+++ b/drivers/pinctrl/renesas/pfc-sh7786.c
@@ -747,7 +747,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		P2MSEL1_0,  P2MSEL1_1,
 		P2MSEL0_0,  P2MSEL0_1 ))
 	},
-	{}
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -787,7 +787,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		PJ7_DATA, PJ6_DATA, PJ5_DATA, PJ4_DATA,
 		PJ3_DATA, PJ2_DATA, PJ1_DATA, 0 ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info sh7786_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-shx3.c b/drivers/pinctrl/renesas/pfc-shx3.c
index 96a65d83774f16a7..e2ba5e3b9ec3f317 100644
--- a/drivers/pinctrl/renesas/pfc-shx3.c
+++ b/drivers/pinctrl/renesas/pfc-shx3.c
@@ -502,7 +502,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		PH1_FN, PH1_OUT, PH1_IN, 0,
 		PH0_FN, PH0_OUT, PH0_IN, 0, ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 static const struct pinmux_data_reg pinmux_data_regs[] = {
@@ -538,7 +538,7 @@ static const struct pinmux_data_reg pinmux_data_regs[] = {
 		0, 0, PH5_DATA, PH4_DATA,
 		PH3_DATA, PH2_DATA, PH1_DATA, PH0_DATA, ))
 	},
-	{ },
+	{ /* sentinel */ }
 };
 
 const struct sh_pfc_soc_info shx3_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 529c0fc4ec0630e2..f0897b23a2ed5ce1 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1388,7 +1388,7 @@ static const struct of_device_id rza1_pinctrl_of_match[] = {
 		.compatible	= "renesas,r7s72102-ports",
 		.data		= &rza1l_pmx_conf,
 	},
-	{ }
+	{ /* sentinel */ }
 };
 
 static struct platform_driver rza1_pinctrl_driver = {
diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index 9158c1757492396f..8c4425fd7b06376d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -931,7 +931,7 @@ static int rzn1_pinctrl_remove(struct platform_device *pdev)
 
 static const struct of_device_id rzn1_pinctrl_match[] = {
 	{ .compatible = "renesas,rzn1-pinctrl", },
-	{}
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzn1_pinctrl_match);
 
-- 
2.34.1

