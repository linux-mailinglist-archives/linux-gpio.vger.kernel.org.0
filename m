Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFB86B0856
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjCHNTZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjCHNSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:41 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08885D08D7
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:26 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by andre.telenet-ops.be with bizsmtp
        id VpFM290043mNwr401pFMRV; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd0-00BF1P-Sl;
        Wed, 08 Mar 2023 14:15:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUfI-6W;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/8] pinctrl: renesas: r8a77980: Add support for AVB/GE power-sources
Date:   Wed,  8 Mar 2023 11:42:41 +0100
Message-Id: <3c26c4f3735a6d071685c507c065172e63af5d70.1678271030.git.geert+renesas@glider.be>
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
and Gigabit Ethernet pins on the R-Car V3H SoC.  "PIN_VDDQ_AVB" and
"PIN_VDDQ_GE" can be configured for 2.5V or 3.3V operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77980.c | 39 ++++++++++++++++++--------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index b632ea1b29c73e3a..8effbcec0b227ee3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -35,7 +35,9 @@
 	PIN_NOGP_CFG(EXTALR, "EXTALR", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PIN_NOGP_CFG(FSCLKST, "FSCLKST", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
 	PIN_NOGP_CFG(FSCLKST_N, "FSCLKST#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN)
+	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT#", fn, SH_PFC_PIN_CFG_PULL_UP_DOWN), \
+	PIN_NOGP_CFG(VDDQ_AVB, "VDDQ_AVB", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_25_33), \
+	PIN_NOGP_CFG(VDDQ_GE, "VDDQ_GE", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_25_33)
 
 /*
  * F_() : just information
@@ -2837,24 +2839,39 @@ static int r8a77980_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = pin & 0x1f;
 
-	*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
-	if (pin >= RCAR_GP_PIN(0, 0) && pin <= RCAR_GP_PIN(0, 21))
+	switch (pin) {
+	case RCAR_GP_PIN(0, 0) ... RCAR_GP_PIN(0, 21):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
 		return bit;
-	else if (pin >= RCAR_GP_PIN(2, 0) && pin <= RCAR_GP_PIN(2, 9))
+
+	case RCAR_GP_PIN(2, 0) ... RCAR_GP_PIN(2, 9):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
 		return bit + 22;
 
-	*pocctrl = pinmux_ioctrl_regs[POCCTRL1].reg;
-	if (pin >= RCAR_GP_PIN(2, 10) && pin <= RCAR_GP_PIN(2, 16))
+	case RCAR_GP_PIN(2, 10) ... RCAR_GP_PIN(2, 16):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL1].reg;
 		return bit - 10;
-	if ((pin >= RCAR_GP_PIN(2, 17) && pin <= RCAR_GP_PIN(2, 24)) ||
-	    (pin >= RCAR_GP_PIN(3,  0) && pin <= RCAR_GP_PIN(3, 16)))
+
+	case RCAR_GP_PIN(2, 17) ... RCAR_GP_PIN(2, 24):
+	case RCAR_GP_PIN(3,  0) ... RCAR_GP_PIN(3, 16):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL1].reg;
 		return bit + 7;
 
-	*pocctrl = pinmux_ioctrl_regs[POCCTRL2].reg;
-	if (pin >= RCAR_GP_PIN(2, 25) && pin <= RCAR_GP_PIN(2, 29))
+	case RCAR_GP_PIN(2, 25) ... RCAR_GP_PIN(2, 29):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL2].reg;
 		return pin - 25;
 
-	return -EINVAL;
+	case PIN_VDDQ_AVB:
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL3].reg;
+		return 0;
+
+	case PIN_VDDQ_GE:
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL3].reg;
+		return 1;
+
+	default:
+		return -EINVAL;
+	}
 }
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
-- 
2.34.1

