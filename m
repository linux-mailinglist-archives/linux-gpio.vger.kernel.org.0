Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A452F1B76
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 17:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730189AbhAKQvA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 11:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387736AbhAKQvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 11:51:00 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2278C061786
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 08:50:19 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id FUqG2400a4C55Sk01UqGfo; Mon, 11 Jan 2021 17:50:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kz0OV-002uj5-R1; Mon, 11 Jan 2021 17:50:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kz0OU-0025HE-Uh; Mon, 11 Jan 2021 17:50:14 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pinctrl: renesas: checker: Restrict checks to Renesas platforms
Date:   Mon, 11 Jan 2021 17:50:13 +0100
Message-Id: <20210111165013.496897-1-geert+renesas@glider.be>
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
To be queued in renesas-pinctrl-for-v5.12.

v2:
  - Add Reviewed-by,
  - Use IS_ENABLED().
---
 drivers/pinctrl/renesas/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index b16759a321ae9c94..2bfd3006f6fda445 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1066,6 +1066,10 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 {
 	unsigned int i;
 
+	if (!IS_ENABLED(CONFIG_SUPERH) &&
+	    !of_find_matching_node(NULL, pdrv->driver.of_match_table))
+		return;
+
 	sh_pfc_regs = kcalloc(SH_PFC_MAX_REGS, sizeof(*sh_pfc_regs),
 			      GFP_KERNEL);
 	if (!sh_pfc_regs)
-- 
2.25.1

