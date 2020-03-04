Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33037179C01
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 23:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388494AbgCDWyr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 17:54:47 -0500
Received: from muru.com ([72.249.23.125]:58920 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388468AbgCDWyr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Mar 2020 17:54:47 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AA17481B1;
        Wed,  4 Mar 2020 22:55:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH 3/3] Revert "gpio: omap: Fix lost edge wake-up interrupts"
Date:   Wed,  4 Mar 2020 14:54:32 -0800
Message-Id: <20200304225433.37336-4-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304225433.37336-1-tony@atomide.com>
References: <20200304225433.37336-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit a522f1d0c381c42f3ace13b8bbeeccabdd6d2e5c.

With cpu_pm handling fixed for omaps, and with gpio-omap now returning
notify error on pending interrupts, we can drop the old workaround for
seeing if there may be pending edge interrupts.

Depends-on: ARM: OMAP2+: Handle errors for cpu_pm
Depends-on: gpio: omap: Block idle on pending gpio interrupts
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Ladislav Michl <ladis@linux-mips.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1102,23 +1102,13 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
 {
 	struct device *dev = bank->chip.parent;
 	void __iomem *base = bank->base;
-	u32 mask, nowake;
+	u32 nowake;
 
 	bank->saved_datain = readl_relaxed(base + bank->regs->datain);
 
 	if (!bank->enabled_non_wakeup_gpios)
 		goto update_gpio_context_count;
 
-	/* Check for pending EDGE_FALLING, ignore EDGE_BOTH */
-	mask = bank->enabled_non_wakeup_gpios & bank->context.fallingdetect;
-	mask &= ~bank->context.risingdetect;
-	bank->saved_datain |= mask;
-
-	/* Check for pending EDGE_RISING, ignore EDGE_BOTH */
-	mask = bank->enabled_non_wakeup_gpios & bank->context.risingdetect;
-	mask &= ~bank->context.fallingdetect;
-	bank->saved_datain &= ~mask;
-
 	if (!may_lose_context)
 		goto update_gpio_context_count;
 
-- 
2.25.1
