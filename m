Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C206B0873
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjCHNTl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjCHNSp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:45 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD24C4885
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:37 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by michel.telenet-ops.be with bizsmtp
        id VpFM2900V3mNwr406pFMPp; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd1-00BF1n-9i;
        Wed, 08 Mar 2023 14:15:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUey-2I;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/8] pinctrl: renesas: r8a77995: Retain POCCTRL0 register across suspend/resume
Date:   Wed,  8 Mar 2023 11:42:37 +0100
Message-Id: <d17402b83b1f3fa0f572527c0382027bccb86205.1678271030.git.geert+renesas@glider.be>
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

The POC Control Register 0 (POCCTRL0) on R-Car D3 is not registered in
the pinmux_ioctrl_regs[] array.  Hence it is not saved/restored during
suspend/resume, and its contents may be lost after s2ram.

This went unnoticed when improving suspend/resume support in commit
d92ee9cf8ec8d7fe ("pinctrl: sh-pfc: rcar-gen3: Retain TDSELCTRL register
across suspend/resume").

Fix this by moving the pinmux_ioctrl_regs[] array up, and adding the
POCCTRL0 register.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77995.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index d949ae59c757924d..8e4ba9c61234bc7d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -2855,11 +2855,23 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
+enum ioctrl_regs {
+	POCCTRL0,
+	TDSELCTRL,
+};
+
+static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
+	[POCCTRL0] = { 0xe6060380, },
+	[TDSELCTRL] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
+
 static int r8a77995_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
-	*pocctrl = 0xe6060380;
+	*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
 
 	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 9))
 		bit = 29 - (pin - RCAR_GP_PIN(3, 0));
@@ -3075,15 +3087,6 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ }
 };
 
-enum ioctrl_regs {
-	TDSELCTRL,
-};
-
-static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
-	[TDSELCTRL] = { 0xe60603c0, },
-	{ /* sentinel */ },
-};
-
 static const struct pinmux_bias_reg *
 r8a77995_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
 			 unsigned int *puen_bit, unsigned int *pud_bit)
-- 
2.34.1

