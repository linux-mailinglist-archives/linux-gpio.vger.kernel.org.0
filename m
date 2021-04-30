Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDEE436FA30
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhD3McH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhD3McG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:06 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89A3C06138D
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by andre.telenet-ops.be with bizsmtp
        id z0XG240034p6Y38010XGUe; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-001ecD-LO; Fri, 30 Apr 2021 14:31:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSIc-00Bdub-WA; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/12] pinctrl: renesas: r8a7796: Add missing bias for PRESET# pin
Date:   Fri, 30 Apr 2021 14:31:00 +0200
Message-Id: <c479de5b3f235c2f7d5faea9e7e08e6fccb135df.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

R-Car Gen3 Hardware Manual Errata for Rev. 0.52 of Nov 30, 2016, added
the configuration bit for bias pull-down control for the PRESET# pin on
R-Car M3-W.  Add driver support for controlling pull-down on this pin.

Fixes: 2d40bd24274d2577 ("pinctrl: sh-pfc: r8a7796: Add bias pinconf support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7796.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 44e9d2eea484ad5d..bbb1b436ded3123f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -67,6 +67,7 @@
 	PIN_NOGP_CFG(QSPI1_MOSI_IO0, "QSPI1_MOSI_IO0", fn, CFG_FLAGS),	\
 	PIN_NOGP_CFG(QSPI1_SPCLK, "QSPI1_SPCLK", fn, CFG_FLAGS),	\
 	PIN_NOGP_CFG(QSPI1_SSL, "QSPI1_SSL", fn, CFG_FLAGS),		\
+	PIN_NOGP_CFG(PRESET_N, "PRESET#", fn, SH_PFC_PIN_CFG_PULL_DOWN),\
 	PIN_NOGP_CFG(RPC_INT_N, "RPC_INT#", fn, CFG_FLAGS),		\
 	PIN_NOGP_CFG(RPC_RESET_N, "RPC_RESET#", fn, CFG_FLAGS),		\
 	PIN_NOGP_CFG(RPC_WP_N, "RPC_WP#", fn, CFG_FLAGS),		\
@@ -6218,7 +6219,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[ 4] = RCAR_GP_PIN(6, 29),	/* USB30_OVC */
 		[ 5] = RCAR_GP_PIN(6, 30),	/* GP6_30 */
 		[ 6] = RCAR_GP_PIN(6, 31),	/* GP6_31 */
-		[ 7] = SH_PFC_PIN_NONE,
+		[ 7] = PIN_PRESET_N,		/* PRESET# */
 		[ 8] = SH_PFC_PIN_NONE,
 		[ 9] = SH_PFC_PIN_NONE,
 		[10] = SH_PFC_PIN_NONE,
-- 
2.25.1

