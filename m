Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DD646781E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 14:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352239AbhLCN0W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 08:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbhLCN0W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 08:26:22 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59200C06174A
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 05:22:58 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
        by xavier.telenet-ops.be with bizsmtp
        id RpNw2601B3eLghq01pNw9y; Fri, 03 Dec 2021 14:22:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt8We-002LFl-CL; Fri, 03 Dec 2021 14:22:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt8Wd-000kYw-RD; Fri, 03 Dec 2021 14:22:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a779a0: Align comments
Date:   Fri,  3 Dec 2021 14:22:55 +0100
Message-Id: <886ef84ea6b8314d348953792c9616b3e5dc28c0.1638537704.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Align the CANFD4_TX and AVB2_MDC comments with all others.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v5.17.
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index ad6532443a785b13..83580385c3ca9b1c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -3835,7 +3835,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ RCAR_GP_PIN(3, 12), 16, 3 },	/* CANFD5_RX */
 		{ RCAR_GP_PIN(3, 11), 12, 3 },	/* CANFD5_TX */
 		{ RCAR_GP_PIN(3, 10),  8, 3 },	/* CANFD4_RX */
-		{ RCAR_GP_PIN(3,  9),  4, 3 },	/* CANFD4_TX*/
+		{ RCAR_GP_PIN(3,  9),  4, 3 },	/* CANFD4_TX */
 		{ RCAR_GP_PIN(3,  8),  0, 3 },	/* CANFD3_RX */
 	} },
 	{ PINMUX_DRIVE_REG("DRV2CTRL3", 0xe6058888) {
@@ -4305,7 +4305,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[11] = RCAR_GP_PIN(6, 11),	/* AVB2_TD3 */
 		[12] = RCAR_GP_PIN(6, 12),	/* AVB2_TXCREFCLK */
 		[13] = RCAR_GP_PIN(6, 13),	/* AVB2_MDIO */
-		[14] = RCAR_GP_PIN(6, 14),	/* AVB2_MDC*/
+		[14] = RCAR_GP_PIN(6, 14),	/* AVB2_MDC */
 		[15] = RCAR_GP_PIN(6, 15),	/* AVB2_MAGIC */
 		[16] = RCAR_GP_PIN(6, 16),	/* AVB2_PHY_INT */
 		[17] = RCAR_GP_PIN(6, 17),	/* AVB2_LINK */
-- 
2.25.1

