Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D39A425596
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242097AbhJGOkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 10:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242115AbhJGOkw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 10:40:52 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80C1C061769
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 07:38:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cc6:af5d:7a02:2753])
        by laurent.telenet-ops.be with bizsmtp
        id 32eu260031WYgkx012eucv; Thu, 07 Oct 2021 16:38:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-002n75-QU; Thu, 07 Oct 2021 16:38:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-006mJP-AH; Thu, 07 Oct 2021 16:38:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] pinctrl: renesas: checker: Fix bias checks on SoCs with pull-down only pins
Date:   Thu,  7 Oct 2021 16:38:49 +0200
Message-Id: <29526d06fa223cffd785cdb264b756a202b11cea.1633615652.git.geert+renesas@glider.be>
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
bias registers not to be checked.  In addition, sh_pfc_check_bias_reg()
does not handle such entries.

Fix this by treating pinmux_bias_reg.puen and pinmux_bias_reg.pud the
same.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index ab8bdb81e8df5069..9d791a5a5f957c6e 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -919,7 +919,8 @@ static void __init sh_pfc_check_bias_reg(const struct sh_pfc_soc_info *info,
 		if (bias->pins[i] != SH_PFC_PIN_NONE)
 			bits |= BIT(i);
 
-	sh_pfc_check_reg(info->name, bias->puen, bits);
+	if (bias->puen)
+		sh_pfc_check_reg(info->name, bias->puen, bits);
 	if (bias->pud)
 		sh_pfc_check_reg(info->name, bias->pud, bits);
 	for (i = 0; i < ARRAY_SIZE(bias->pins); i++)
@@ -928,6 +929,7 @@ static void __init sh_pfc_check_bias_reg(const struct sh_pfc_soc_info *info,
 
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 {
+	const struct pinmux_bias_reg *bias_regs = info->bias_regs;
 	const char *drvname = info->name;
 	unsigned int *refcnts;
 	unsigned int i, j, k;
@@ -1024,8 +1026,8 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 		sh_pfc_check_drive_reg(info, &info->drive_regs[i]);
 
 	/* Check bias registers */
-	for (i = 0; info->bias_regs && info->bias_regs[i].puen; i++)
-		sh_pfc_check_bias_reg(info, &info->bias_regs[i]);
+	for (i = 0; bias_regs && (bias_regs[i].puen || bias_regs[i].pud); i++)
+		sh_pfc_check_bias_reg(info, &bias_regs[i]);
 
 	/* Check ioctrl registers */
 	for (i = 0; info->ioctrl_regs && info->ioctrl_regs[i].reg; i++)
-- 
2.25.1

