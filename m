Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC646B085B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbjCHNT1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjCHNSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:41 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB55D08ED
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:24 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by baptiste.telenet-ops.be with bizsmtp
        id VpFL2900N3mNwr401pFLC7; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd0-00BF1G-L3;
        Wed, 08 Mar 2023 14:15:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUfX-BT;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 8/8] pinctrl: renesas: r8a779g0: Add support for AVB/TSN power-sources
Date:   Wed,  8 Mar 2023 11:42:44 +0100
Message-Id: <c046e0be7d26302061d7aa629180a451734ddf8f.1678271030.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678271030.git.geert+renesas@glider.be>
References: <cover.1678271030.git.geert+renesas@glider.be>
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

Add support for configuring the I/O voltage levels of the Ethernet AVB
and Ethernet TSN pins on the R-Car V4H SoC.  "PIN_VDDQ_AVB[012]" and
"PIN_VDDQ_TSN0" can be configured for 1.8V or 2.5V operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 45 ++++++++++++++++++++------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index a4e4759328367726..3243668522823383 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -49,6 +49,12 @@
 	PORT_GP_CFG_21(7,	fn, sfx, CFG_FLAGS),					\
 	PORT_GP_CFG_14(8,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33)
 
+#define CPU_ALL_NOGP(fn)								\
+	PIN_NOGP_CFG(VDDQ_AVB0, "VDDQ_AVB0", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_18_25),	\
+	PIN_NOGP_CFG(VDDQ_AVB1, "VDDQ_AVB1", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_18_25),	\
+	PIN_NOGP_CFG(VDDQ_AVB2, "VDDQ_AVB2", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_18_25),	\
+	PIN_NOGP_CFG(VDDQ_TSN0, "VDDQ_TSN0", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_18_25)
+
 /* GPSR0 */
 #define GPSR0_18	F_(MSIOF2_RXD,		IP2SR0_11_8)
 #define GPSR0_17	F_(MSIOF2_SCK,		IP2SR0_7_4)
@@ -1221,10 +1227,12 @@ static const u16 pinmux_data[] = {
  */
 enum {
 	GP_ASSIGN_LAST(),
+	NOGP_ALL(),
 };
 
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
+	PINMUX_NOGP_ALL(),
 };
 
 /* - AUDIO CLOCK ----------------------------------------- */
@@ -4086,23 +4094,42 @@ static int r8a779g0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = pin & 0x1f;
 
-	*pocctrl = pinmux_ioctrl_regs[POC0].reg;
-	if (pin >= RCAR_GP_PIN(0, 0) && pin <= RCAR_GP_PIN(0, 18))
+	switch (pin) {
+	case RCAR_GP_PIN(0, 0) ... RCAR_GP_PIN(0, 18):
+		*pocctrl = pinmux_ioctrl_regs[POC0].reg;
 		return bit;
 
-	*pocctrl = pinmux_ioctrl_regs[POC1].reg;
-	if (pin >= RCAR_GP_PIN(1, 0) && pin <= RCAR_GP_PIN(1, 22))
+	case RCAR_GP_PIN(1, 0) ... RCAR_GP_PIN(1, 22):
+		*pocctrl = pinmux_ioctrl_regs[POC1].reg;
 		return bit;
 
-	*pocctrl = pinmux_ioctrl_regs[POC3].reg;
-	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 12))
+	case RCAR_GP_PIN(3, 0) ... RCAR_GP_PIN(3, 12):
+		*pocctrl = pinmux_ioctrl_regs[POC3].reg;
 		return bit;
 
-	*pocctrl = pinmux_ioctrl_regs[POC8].reg;
-	if (pin >= RCAR_GP_PIN(8, 0) && pin <= RCAR_GP_PIN(8, 13))
+	case PIN_VDDQ_TSN0:
+		*pocctrl = pinmux_ioctrl_regs[POC4].reg;
+		return 0;
+
+	case PIN_VDDQ_AVB2:
+		*pocctrl = pinmux_ioctrl_regs[POC5].reg;
+		return 0;
+
+	case PIN_VDDQ_AVB1:
+		*pocctrl = pinmux_ioctrl_regs[POC6].reg;
+		return 0;
+
+	case PIN_VDDQ_AVB0:
+		*pocctrl = pinmux_ioctrl_regs[POC7].reg;
+		return 0;
+
+	case RCAR_GP_PIN(8, 0) ... RCAR_GP_PIN(8, 13):
+		*pocctrl = pinmux_ioctrl_regs[POC8].reg;
 		return bit;
 
-	return -EINVAL;
+	default:
+		return -EINVAL;
+	}
 }
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
-- 
2.34.1

