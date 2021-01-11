Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222962F1780
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 15:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388221AbhAKOHS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 09:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388498AbhAKOHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 09:07:17 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C91C061794
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:06:37 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id FS6b2400P4C55Sk06S6bvm; Mon, 11 Jan 2021 15:06:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kyxq7-002qiS-1V; Mon, 11 Jan 2021 15:06:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kyxq6-001lyv-IQ; Mon, 11 Jan 2021 15:06:34 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: checker: Restrict checks to Renesas platforms
Date:   Mon, 11 Jan 2021 15:06:33 +0100
Message-Id: <20210111140633.422726-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When DEBUG is defined (e.g. if CONFIG_DEBUG_PINCTRL=y), the Renesas pin
control driver runs sanity checks against the pin control tables.  This
may cause lots of output on the console, and can be annoying in ARM
multi-platform kernels.  Fix this by only running the checks when
running on SuperH, or on a DT platform supported by the Renesas pin
controller driver.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v5.12.

 drivers/pinctrl/renesas/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index b9f80833f532e7b7..56cb8e1d8384b39c 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1146,6 +1146,11 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 {
 	unsigned int i;
 
+#ifndef CONFIG_SUPERH
+	if (!of_find_matching_node(NULL, pdrv->driver.of_match_table))
+		return;
+#endif
+
 	sh_pfc_regs = kcalloc(SH_PFC_MAX_REGS, sizeof(*sh_pfc_regs),
 			      GFP_KERNEL);
 	if (!sh_pfc_regs)
-- 
2.25.1

