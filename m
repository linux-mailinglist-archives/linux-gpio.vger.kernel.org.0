Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDB367E63E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbjA0NLz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:11:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjA0NLy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:11:54 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F127F688
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:11:12 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:735b:e883:8069:427])
        by baptiste.telenet-ops.be with bizsmtp
        id DpAb290084pY4D901pAbhr; Fri, 27 Jan 2023 14:10:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLOUp-007Y0Q-6y;
        Fri, 27 Jan 2023 14:10:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLOV0-005Q8z-Uh;
        Fri, 27 Jan 2023 14:10:34 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hai Pham <hai.pham.ud@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a779a0: Remove incorrect AVB[01] pinmux configuration
Date:   Fri, 27 Jan 2023 14:10:31 +0100
Message-Id: <6fd217b71e83ba9a8157513ed671a1fa218b23b6.1674824958.git.geert+renesas@glider.be>
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

From: Hai Pham <hai.pham.ud@renesas.com>

AVB[01]_{MAGIC,MDC,MDIO,TXCREFCLK} are registered as both
PINMUX_SINGLE(fn) and PINMUX_IPSR_GPSR(fn) in the pinmux_data array.

The latter are correct, hence remove the former.
Without this fix, the Ethernet PHY is not operational on the MDIO bus.

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Fixes: 741a7370fc3b8b54 ("pinctrl: renesas: Initial R8A779A0 (V3U) PFC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Mea culpa, I suggested these PINMUX_SINGLE() additions during review.

Tested on (remote) Falcon: no regression for AVB0.
To be queued in renesas-pinctrl.
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 760c83a8740bd8b3..6069869353bb42f1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -696,16 +696,8 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(PCIE0_CLKREQ_N),
 
 	PINMUX_SINGLE(AVB0_PHY_INT),
-	PINMUX_SINGLE(AVB0_MAGIC),
-	PINMUX_SINGLE(AVB0_MDC),
-	PINMUX_SINGLE(AVB0_MDIO),
-	PINMUX_SINGLE(AVB0_TXCREFCLK),
 
 	PINMUX_SINGLE(AVB1_PHY_INT),
-	PINMUX_SINGLE(AVB1_MAGIC),
-	PINMUX_SINGLE(AVB1_MDC),
-	PINMUX_SINGLE(AVB1_MDIO),
-	PINMUX_SINGLE(AVB1_TXCREFCLK),
 
 	PINMUX_SINGLE(AVB2_AVTP_PPS),
 	PINMUX_SINGLE(AVB2_AVTP_CAPTURE),
-- 
2.34.1

