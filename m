Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5FAB136DCE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgAJNTk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:40 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:41208 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id odKU2100L5USYZQ06dKU8e; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007XE-GU; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000IU-Fa; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/13] pinctrl: sh-pfc: checker: Add bias register checks
Date:   Fri, 10 Jan 2020 14:19:24 +0100
Message-Id: <20200110131927.1029-11-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add checks for bias register descriptors:
  1. Pull-up and optional pull-down register addresses must be unique,
  2. Referred pins must exist.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index a1667a29dd69c3ff..b737aa5978b7daa4 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -888,6 +888,18 @@ static void __init sh_pfc_check_drive_reg(const struct sh_pfc_soc_info *info,
 	}
 }
 
+static void __init sh_pfc_check_bias_reg(const struct sh_pfc_soc_info *info,
+					 const struct pinmux_bias_reg *bias)
+{
+	unsigned int i;
+
+	sh_pfc_check_reg(info->name, bias->puen);
+	if (bias->pud)
+		sh_pfc_check_reg(info->name, bias->pud);
+	for (i = 0; i < ARRAY_SIZE(bias->pins); i++)
+		sh_pfc_check_pin(info, bias->puen, bias->pins[i]);
+}
+
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 {
 	const char *drvname = info->name;
@@ -984,6 +996,10 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	/* Check drive strength registers */
 	for (i = 0; info->drive_regs && info->drive_regs[i].reg; i++)
 		sh_pfc_check_drive_reg(info, &info->drive_regs[i]);
+
+	/* Check bias registers */
+	for (i = 0; info->bias_regs && info->bias_regs[i].puen; i++)
+		sh_pfc_check_bias_reg(info, &info->bias_regs[i]);
 }
 
 static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
-- 
2.17.1

