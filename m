Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD436B085D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjCHNT2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbjCHNSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:41 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4A0BE5E8
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:25 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by xavier.telenet-ops.be with bizsmtp
        id VpFM290033mNwr401pFMHl; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd0-00BF1M-Q9;
        Wed, 08 Mar 2023 14:15:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUfN-8G;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/8] pinctrl: renesas: r8a77990: Add support for AVB power-source
Date:   Wed,  8 Mar 2023 11:42:42 +0100
Message-Id: <57883cd2d94c7919dc0f0db07cf6169ca89538e6.1678271030.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678271030.git.geert+renesas@glider.be>
References: <cover.1678271030.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for configuring the I/O voltage level of the Ethernet AVB
pins on the R-Car E3 SoC.  "PIN_VDDQ_AVB0" can be configured for 2.5V or
3.3V operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77990.c | 29 +++++++++++++++++---------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 57de0580a4408d4c..229ad12bc9b7e6b0 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -56,7 +56,8 @@
 	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
 	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
 	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(TRST_N, "TRST_N", fn, SH_PFC_PIN_CFG_PULL_UP)
+	PIN_NOGP_CFG(TRST_N, "TRST_N", fn, SH_PFC_PIN_CFG_PULL_UP),	\
+	PIN_NOGP_CFG(VDDQ_AVB0, "VDDQ_AVB0", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_25_33)
 
 /*
  * F_() : just information
@@ -507,7 +508,8 @@ MOD_SEL0_1_0
 	FM(AVB_TD3) \
 	FM(PRESETOUT_N) FM(FSCLKST_N) FM(TRST_N) FM(TCK) FM(TMS) FM(TDI) \
 	FM(ASEBRK) \
-	FM(MLB_REF)
+	FM(MLB_REF) \
+	FM(VDDQ_AVB0)
 
 enum {
 	PINMUX_RESERVED = 0,
@@ -5040,28 +5042,35 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 
 enum ioctrl_regs {
 	POCCTRL0,
+	POCCTRL2,
 	TDSELCTRL,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL0] = { 0xe6060380, },
+	[POCCTRL2] = { 0xe6060388, },
 	[TDSELCTRL] = { 0xe60603c0, },
 	{ /* sentinel */ },
 };
 
 static int r8a77990_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
-	int bit = -EINVAL;
+	switch (pin) {
+	case RCAR_GP_PIN(3, 0) ... RCAR_GP_PIN(3, 11):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
+		return pin & 0x1f;
 
-	*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
+	case RCAR_GP_PIN(4, 0) ... RCAR_GP_PIN(4, 10):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
+		return (pin & 0x1f) + 19;
 
-	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 11))
-		bit = pin & 0x1f;
+	case PIN_VDDQ_AVB0:
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL2].reg;
+		return 0;
 
-	if (pin >= RCAR_GP_PIN(4, 0) && pin <= RCAR_GP_PIN(4, 10))
-		bit = (pin & 0x1f) + 19;
-
-	return bit;
+	default:
+		return -EINVAL;
+	}
 }
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
-- 
2.34.1

