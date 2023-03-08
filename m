Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B2F6B086A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjCHNTc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjCHNSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:41 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA13D00BD
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:24 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by albert.telenet-ops.be with bizsmtp
        id VpFM290033mNwr406pFMLj; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd0-00BF1J-Nb;
        Wed, 08 Mar 2023 14:15:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUfS-9l;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/8] pinctrl: renesas: r8a77995: Add support for AVB power-source
Date:   Wed,  8 Mar 2023 11:42:43 +0100
Message-Id: <8f9164487715d8a4898ca651038c0b4d5013764c.1678271030.git.geert+renesas@glider.be>
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
pins on the R-Car D3 SoC.  "PIN_VDDQ_AVB0" can be configured for 2.5V or
3.3V operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77995.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 5a42213c680cf7b4..29664d97e5ec0748 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -34,7 +34,8 @@
 	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
 	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
 	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP)
+	PIN_NOGP_CFG(TRST_N, "TRST#", fn, SH_PFC_PIN_CFG_PULL_UP),	\
+	PIN_NOGP_CFG(VDDQ_AVB0, "VDDQ_AVB0", fn, SH_PFC_PIN_CFG_IO_VOLTAGE_25_33)
 
 /*
  * F_() : just information
@@ -2857,11 +2858,13 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 
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
@@ -2869,14 +2872,18 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 
 static int r8a77995_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
-	int bit = -EINVAL;
-
-	*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
+	switch (pin) {
+	case RCAR_GP_PIN(3, 0) ... RCAR_GP_PIN(3, 9):
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
+		return 29 - (pin - RCAR_GP_PIN(3, 0));
 
-	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 9))
-		bit = 29 - (pin - RCAR_GP_PIN(3, 0));
+	case PIN_VDDQ_AVB0:
+		*pocctrl = pinmux_ioctrl_regs[POCCTRL2].reg;
+		return 0;
 
-	return bit;
+	default:
+		return -EINVAL;
+	}
 }
 
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
-- 
2.34.1

