Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD89136DA7
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgAJNTa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:30 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:41178 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbgAJNTa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:30 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id odKU2100A5USYZQ06dKU8W; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007Wr-A3; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000Hq-9F; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/13] pinctrl: sh-pfc: checker: Add helper for safe name comparison
Date:   Fri, 10 Jan 2020 14:19:17 +0100
Message-Id: <20200110131927.1029-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a helper to check if two strings are identical, skipping NULL
pointers.  This simplifies callers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 45bdaf88819fa498..fe11841e8ce81dbb 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -751,6 +751,14 @@ static bool __init is0s(const u16 *enum_ids, unsigned int n)
 	return true;
 }
 
+static bool __init same_name(const char *a, const char *b)
+{
+	if (!a || !b)
+		return false;
+
+	return !strcmp(a, b);
+}
+
 static void __init sh_pfc_check_cfg_reg(const char *drvname,
 					const struct pinmux_cfg_reg *cfg_reg)
 {
@@ -790,7 +798,7 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	/* Check pins */
 	for (i = 0; i < info->nr_pins; i++) {
 		for (j = 0; j < i; j++) {
-			if (!strcmp(info->pins[i].name, info->pins[j].name))
+			if (same_name(info->pins[i].name, info->pins[j].name))
 				sh_pfc_err("pin %s/%s: name conflict\n",
 					   info->pins[i].name,
 					   info->pins[j].name);
@@ -824,9 +832,8 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 		}
 		for (j = 0; j < func->nr_groups; j++) {
 			for (k = 0; k < info->nr_groups; k++) {
-				if (info->groups[k].name &&
-				    !strcmp(func->groups[j],
-					    info->groups[k].name)) {
+				if (same_name(func->groups[j],
+					      info->groups[k].name)) {
 					refcnts[k]++;
 					break;
 				}
-- 
2.17.1

