Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E238D136DB5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbgAJNTe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:34 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:46586 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id odKU2100F5USYZQ06dKUhH; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007X9-F4; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000IO-D3; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/13] pinctrl: sh-pfc: checker: Improve pin group checks
Date:   Fri, 10 Jan 2020 14:19:22 +0100
Message-Id: <20200110131927.1029-9-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Improve the checks for pin group descriptors:
  1. Introduce a local variable for the current group, to make the
     checks easier to read,
  2. Pin group names must be unique.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 54e433149e9bf715..4642959714f97102 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -916,15 +916,22 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	}
 
 	for (i = 0; i < info->nr_groups; i++) {
-		if (!info->groups[i].name) {
+		const struct sh_pfc_pin_group *group = &info->groups[i];
+
+		if (!group->name) {
 			sh_pfc_err("empty group %u\n", i);
 			continue;
 		}
+		for (j = 0; j < i; j++) {
+			if (same_name(group->name, info->groups[j].name))
+				sh_pfc_err("group %s: name conflict\n",
+					   group->name);
+		}
 		if (!refcnts[i])
-			sh_pfc_err("orphan group %s\n", info->groups[i].name);
+			sh_pfc_err("orphan group %s\n", group->name);
 		else if (refcnts[i] > 1)
 			sh_pfc_warn("group %s referenced by %u functions\n",
-				    info->groups[i].name, refcnts[i]);
+				    group->name, refcnts[i]);
 	}
 
 	kfree(refcnts);
-- 
2.17.1

