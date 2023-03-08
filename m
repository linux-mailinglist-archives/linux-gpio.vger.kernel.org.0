Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458F96B0869
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjCHNTd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbjCHNSm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:42 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48D9C3E26
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:29 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by andre.telenet-ops.be with bizsmtp
        id VpFM290093mNwr401pFMRX; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd0-00BF1S-VH;
        Wed, 08 Mar 2023 14:15:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUfD-4d;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/8] pinctrl: renesas: r8a77970: Add support for AVB power-source
Date:   Wed,  8 Mar 2023 11:42:40 +0100
Message-Id: <eb4db82bdeb67507a1a77f63b9d90280d6f38ba4.1678271030.git.geert+renesas@glider.be>
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

Add support for configuring the I/O voltage level of the Ethernet AVB
pins on the R-Car V3M SoC.  "PIN_VDDQ_AVB0" can be configured for 2.5V
or 3.3V operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77970.c | 28 ++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index 578c1d6fc2e0fcd9..54da0c025458d0a7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -34,7 +34,8 @@
 	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
 	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
 	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
+	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP),	\
+	PIN_NOGP_CFG(VDDQ_AVB0, "VDDQ_AVB0", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_25_33)
 
 /*
  * F_() : just information
@@ -2364,19 +2365,30 @@ static int r8a77970_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = pin & 0x1f;
 
-	*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
-	if (pin >= RCAR_GP_PIN(0, 0) && pin <= RCAR_GP_PIN(0, 21))
+	switch (pin) {
+	case RCAR_GP_PIN(0, 0) ... RCAR_GP_PIN(0, 21):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
 		return bit;
-	if (pin >= RCAR_GP_PIN(2, 0) && pin <= RCAR_GP_PIN(2, 9))
+
+	case RCAR_GP_PIN(2, 0) ... RCAR_GP_PIN(2, 9):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
 		return bit + 22;
 
-	*pocctrl = pinmux_ioctrl_regs[POCCTRL1].reg;
-	if (pin >= RCAR_GP_PIN(2, 10) && pin <= RCAR_GP_PIN(2, 16))
+	case RCAR_GP_PIN(2, 10) ... RCAR_GP_PIN(2, 16):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL1].reg;
 		return bit - 10;
-	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 16))
+
+	case RCAR_GP_PIN(3, 0) ... RCAR_GP_PIN(3, 16):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL1].reg;
 		return bit + 7;
 
-	return -EINVAL;
+	case PIN_VDDQ_AVB0:
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL2].reg;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
 }
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
-- 
2.34.1

