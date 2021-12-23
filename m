Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDBD47E539
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239971AbhLWO4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243977AbhLWO4c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:32 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B003C0617A0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id ZqwV2600b4C55Sk01qwV2p; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW9-006aMF-BW; Thu, 23 Dec 2021 15:56:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-003rwy-1q; Thu, 23 Dec 2021 15:56:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/10] pinctrl: renesas: checker: Add pin group sharing checks
Date:   Thu, 23 Dec 2021 15:56:21 +0100
Message-Id: <e16fdf729156e13b591d2f082f2cc934da580074.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add checks for discovering pin groups that could share pin data, as
sharing reduces kernel size.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 37 +++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 5c0a6212706270e7..57a06b5ea17444e2 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -924,6 +924,35 @@ static void __init sh_pfc_check_bias_reg(const struct sh_pfc_soc_info *info,
 		sh_pfc_check_pin(info, bias->puen, bias->pins[i]);
 }
 
+static void __init sh_pfc_compare_groups(const char *drvname,
+					 const struct sh_pfc_pin_group *a,
+					 const struct sh_pfc_pin_group *b)
+{
+	unsigned int i;
+	size_t len;
+
+	if (same_name(a->name, b->name))
+		sh_pfc_err("group %s: name conflict\n", a->name);
+
+	if (a->nr_pins > b->nr_pins)
+		swap(a, b);
+
+	len = a->nr_pins * sizeof(a->pins[0]);
+	for (i = 0; i <= b->nr_pins - a->nr_pins; i++) {
+		if (a->pins == b->pins + i || a->mux == b->mux + i ||
+		    memcmp(a->pins, b->pins + i, len) ||
+		    memcmp(a->mux, b->mux + i, len))
+			continue;
+
+		if (a->nr_pins == b->nr_pins)
+			sh_pfc_warn("group %s can be an alias for %s\n",
+				    a->name, b->name);
+		else
+			sh_pfc_warn("group %s is a subset of %s\n", a->name,
+				    b->name);
+	}
+}
+
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 {
 	const struct pinmux_bias_reg *bias_regs = info->bias_regs;
@@ -1000,11 +1029,9 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 			sh_pfc_err("empty group %u\n", i);
 			continue;
 		}
-		for (j = 0; j < i; j++) {
-			if (same_name(group->name, info->groups[j].name))
-				sh_pfc_err("group %s: name conflict\n",
-					   group->name);
-		}
+		for (j = 0; j < i; j++)
+			sh_pfc_compare_groups(drvname, group, &info->groups[j]);
+
 		if (!refcnts[i])
 			sh_pfc_err("orphan group %s\n", group->name);
 		else if (refcnts[i] > 1)
-- 
2.25.1

