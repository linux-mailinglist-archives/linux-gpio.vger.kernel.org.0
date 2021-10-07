Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6516425592
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 16:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242064AbhJGOkx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 10:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242086AbhJGOkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 10:40:51 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92CFC061755
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 07:38:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cc6:af5d:7a02:2753])
        by albert.telenet-ops.be with bizsmtp
        id 32eu260061WYgkx062euKX; Thu, 07 Oct 2021 16:38:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-002n72-VK; Thu, 07 Oct 2021 16:38:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-006mJ4-6k; Thu, 07 Oct 2021 16:38:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] pinctrl: renesas: Fix save/restore on SoCs with pull-down only pins
Date:   Thu,  7 Oct 2021 16:38:46 +0200
Message-Id: <59d2fbddff685b6a7a82ff17d2b37633e30e8860.1633615652.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633615652.git.geert+renesas@glider.be>
References: <cover.1633615652.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If some bits in a pin Pull-Up control register (PUPR) control pin
pull-down instead of pin pull-up, there are two pinmux_bias_reg entries:
a first one with the puen field filled in, listing pins with pull-up
functionality, and a second one with the pud field filled in, listing
pins with pull-down functionality.  On encountering the second entry,
where puen is NULL, the for-loop terminates early, causing the remaining
bias registers not to be saved/restored during PSCI system suspend.
Fortunately this does not trigger on any supported system yet, as PSCI
is only used on R-Car Gen3 and RZ/G2 systems, which all have separate
pin Pull-Enable (PUEN) and pin Pull-Up/Down control (PUD) registers.

Avoid this ever becoming a problem by treating pinmux_bias_reg.puen and
pinmux_bias_reg.pud the same.  Note that a register controlling both
pull-up and pull-down pins would be saved and restored twice, which is
harmless.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index ef8ef05ba93030b9..b0d6103d012e7821 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -675,8 +675,10 @@ static unsigned int sh_pfc_walk_regs(struct sh_pfc *pfc,
 			do_reg(pfc, pfc->info->drive_regs[i].reg, n++);
 
 	if (pfc->info->bias_regs)
-		for (i = 0; pfc->info->bias_regs[i].puen; i++) {
-			do_reg(pfc, pfc->info->bias_regs[i].puen, n++);
+		for (i = 0; pfc->info->bias_regs[i].puen ||
+			    pfc->info->bias_regs[i].pud; i++) {
+			if (pfc->info->bias_regs[i].puen)
+				do_reg(pfc, pfc->info->bias_regs[i].puen, n++);
 			if (pfc->info->bias_regs[i].pud)
 				do_reg(pfc, pfc->info->bias_regs[i].pud, n++);
 		}
-- 
2.25.1

