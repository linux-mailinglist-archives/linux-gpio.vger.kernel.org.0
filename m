Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D1A42558F
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 16:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbhJGOkw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 10:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242088AbhJGOkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 10:40:51 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6060C061762
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 07:38:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cc6:af5d:7a02:2753])
        by laurent.telenet-ops.be with bizsmtp
        id 32eu260041WYgkx012eucw; Thu, 07 Oct 2021 16:38:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-002n76-Sc; Thu, 07 Oct 2021 16:38:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mYUXt-006mJW-BN; Thu, 07 Oct 2021 16:38:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] pinctrl: renesas: checker: Prefix common checker output
Date:   Thu,  7 Oct 2021 16:38:50 +0200
Message-Id: <9cf1dc9f895dc5fa74125dabddfe46fecf438b4f.1633615652.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633615652.git.geert+renesas@glider.be>
References: <cover.1633615652.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a "sh_pfc: " prefix to common checker output that is not yet
prefixed by a subdriver-specific prefix ("<SoC-part-number>_pfc: "), for
easier grepping.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 9d791a5a5f957c6e..0d4ea2e22a53599f 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -934,7 +934,7 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	unsigned int *refcnts;
 	unsigned int i, j, k;
 
-	pr_info("Checking %s\n", drvname);
+	pr_info("sh_pfc: Checking %s\n", drvname);
 	sh_pfc_num_regs = 0;
 	sh_pfc_num_enums = 0;
 
@@ -1081,7 +1081,7 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 	if (!sh_pfc_enums)
 		goto free_regs;
 
-	pr_warn("Checking builtin pinmux tables\n");
+	pr_warn("sh_pfc: Checking builtin pinmux tables\n");
 
 	for (i = 0; pdrv->id_table[i].name[0]; i++)
 		sh_pfc_check_info((void *)pdrv->id_table[i].driver_data);
@@ -1091,7 +1091,7 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 		sh_pfc_check_info(pdrv->driver.of_match_table[i].data);
 #endif
 
-	pr_warn("Detected %u errors and %u warnings\n", sh_pfc_errors,
+	pr_warn("sh_pfc: Detected %u errors and %u warnings\n", sh_pfc_errors,
 		sh_pfc_warnings);
 
 	kfree(sh_pfc_enums);
-- 
2.25.1

