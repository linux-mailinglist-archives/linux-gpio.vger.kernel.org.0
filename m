Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A142536FA43
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhD3McN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhD3McI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:08 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3E7C061351
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id z0XG2400W4p6Y38010XGJY; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSIe-001ecF-1R; Fri, 30 Apr 2021 14:31:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-00Bduo-1F; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/12] pinctrl: renesas: r8a77990: Drop bogus PUEN_ prefixes in comments
Date:   Fri, 30 Apr 2021 14:31:02 +0200
Message-Id: <9ea85ae8973f6d9b3d10f02f0d9b4ab6a086ec63.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "PUEN_" prefixes are part of the bit names of the PUEN registers,
while the comments should refer to the actual pin names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77990.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index eeebbab4dd811f9c..f44c7da3ec167de7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -5197,8 +5197,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[27] = RCAR_GP_PIN(1,  0),	/* A0 */
 		[28] = SH_PFC_PIN_NONE,
 		[29] = SH_PFC_PIN_NONE,
-		[30] = RCAR_GP_PIN(2, 25),	/* PUEN_EX_WAIT0 */
-		[31] = RCAR_GP_PIN(2, 24),	/* PUEN_RD/WR# */
+		[30] = RCAR_GP_PIN(2, 25),	/* EX_WAIT0 */
+		[31] = RCAR_GP_PIN(2, 24),	/* RD/WR# */
 	} },
 	{ PINMUX_BIAS_REG("PUEN2", 0xe6060408, "PUD2", 0xe6060448) {
 		 [0] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
@@ -5333,8 +5333,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[27] = SH_PFC_PIN_NONE,
 		[28] = SH_PFC_PIN_NONE,
 		[29] = SH_PFC_PIN_NONE,
-		[30] = RCAR_GP_PIN(6,  9),	/* PUEN_USB30_OVC */
-		[31] = RCAR_GP_PIN(6, 17),	/* PUEN_USB30_PWEN */
+		[30] = RCAR_GP_PIN(6,  9),	/* USB30_OVC */
+		[31] = RCAR_GP_PIN(6, 17),	/* USB30_PWEN */
 	} },
 	{ /* sentinel */ },
 };
-- 
2.25.1

