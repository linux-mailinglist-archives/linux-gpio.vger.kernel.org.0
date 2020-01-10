Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D86C136DC4
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgAJNTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:36 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:40256 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id odKU2100C5USYZQ01dKUal; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007Wl-93; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000Hk-81; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/13] pinctrl: sh-pfc: checker: Move data before code
Date:   Fri, 10 Jan 2020 14:19:15 +0100
Message-Id: <20200110131927.1029-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Restructure the checker to move all data definitions to the top, before
the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 82209116955b153a..a565effbff12f5a9 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -726,6 +726,9 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
 
 #ifdef DEBUG
+static unsigned int sh_pfc_errors __initdata = 0;
+static unsigned int sh_pfc_warnings __initdata = 0;
+
 static bool __init is0s(const u16 *enum_ids, unsigned int n)
 {
 	unsigned int i;
@@ -737,9 +740,6 @@ static bool __init is0s(const u16 *enum_ids, unsigned int n)
 	return true;
 }
 
-static unsigned int sh_pfc_errors __initdata = 0;
-static unsigned int sh_pfc_warnings __initdata = 0;
-
 static void __init sh_pfc_check_cfg_reg(const char *drvname,
 					const struct pinmux_cfg_reg *cfg_reg)
 {
-- 
2.17.1

