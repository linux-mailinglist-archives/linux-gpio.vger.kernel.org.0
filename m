Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FD529D8C1
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388338AbgJ1WgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:36:13 -0400
Received: from muru.com ([72.249.23.125]:47074 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388459AbgJ1Wdx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:53 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1061A812F;
        Wed, 28 Oct 2020 06:06:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH] Revert "Revert "gpio: omap: Fix lost edge wake-up interrupts""
Date:   Wed, 28 Oct 2020 08:05:56 +0200
Message-Id: <20201028060556.56038-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit 579ced8fdb00b8e94304a83e3cc419f6f8eab08e.

Turns out I was overly optimistic about cpu_pm blocking idle being a
solution for handling edge interrupts. While it helps in preventing
entering idle states that potentially lose context, we can still get
an edge interrupt triggering while entering idle. So we need to also
add back the workaround for seeing if there are any pending edge
interrupts when waking up.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Ladislav Michl <ladis@linux-mips.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpio/gpio-omap.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1114,13 +1114,23 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
 {
 	struct device *dev = bank->chip.parent;
 	void __iomem *base = bank->base;
-	u32 nowake;
+	u32 mask, nowake;
 
 	bank->saved_datain = readl_relaxed(base + bank->regs->datain);
 
 	if (!bank->enabled_non_wakeup_gpios)
 		goto update_gpio_context_count;
 
+	/* Check for pending EDGE_FALLING, ignore EDGE_BOTH */
+	mask = bank->enabled_non_wakeup_gpios & bank->context.fallingdetect;
+	mask &= ~bank->context.risingdetect;
+	bank->saved_datain |= mask;
+
+	/* Check for pending EDGE_RISING, ignore EDGE_BOTH */
+	mask = bank->enabled_non_wakeup_gpios & bank->context.risingdetect;
+	mask &= ~bank->context.fallingdetect;
+	bank->saved_datain &= ~mask;
+
 	if (!may_lose_context)
 		goto update_gpio_context_count;
 
-- 
2.29.1
