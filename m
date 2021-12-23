Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4687E47E533
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239925AbhLWO4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243983AbhLWO4c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:32 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EC1C0617A1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id ZqwV2600a4C55Sk01qwV2o; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW9-006aMO-B9; Thu, 23 Dec 2021 15:56:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-003rxX-7U; Thu, 23 Dec 2021 15:56:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/10] pinctrl: renesas: checker: Check drive pin conflicts
Date:   Thu, 23 Dec 2021 15:56:26 +0100
Message-Id: <382206e737710afd3059abe75bc41e324823e657.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Check that there is only a single entry for each pin with drive strength
capabilities.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 1e0b21428e83c549..c252eb5c9755035f 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1154,8 +1154,26 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 		sh_pfc_check_cfg_reg(drvname, &info->cfg_regs[i]);
 
 	/* Check drive strength registers */
-	for (i = 0; info->drive_regs && info->drive_regs[i].reg; i++)
-		sh_pfc_check_drive_reg(info, &info->drive_regs[i]);
+	for (i = 0; drive_regs && drive_regs[i].reg; i++)
+		sh_pfc_check_drive_reg(info, &drive_regs[i]);
+
+	for (i = 0; drive_regs && drive_regs[i / 8].reg; i++) {
+		if (!drive_regs[i / 8].fields[i % 8].pin &&
+		    !drive_regs[i / 8].fields[i % 8].offset &&
+		    !drive_regs[i / 8].fields[i % 8].size)
+			continue;
+
+		for (j = 0; j < i; j++) {
+			if (drive_regs[i / 8].fields[i % 8].pin ==
+			    drive_regs[j / 8].fields[j % 8].pin &&
+			    drive_regs[j / 8].fields[j % 8].offset &&
+			    drive_regs[j / 8].fields[j % 8].size) {
+				sh_pfc_err("drive_reg 0x%x:%u/0x%x:%u: pin conflict\n",
+					   drive_regs[i / 8].reg, i % 8,
+					   drive_regs[j / 8].reg, j % 8);
+			}
+		}
+	}
 
 	/* Check bias registers */
 	for (i = 0; bias_regs && (bias_regs[i].puen || bias_regs[i].pud); i++)
-- 
2.25.1

