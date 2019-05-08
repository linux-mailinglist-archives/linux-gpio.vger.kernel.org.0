Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F385217FBA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 20:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbfEHSTt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 14:19:49 -0400
Received: from muru.com ([72.249.23.125]:48178 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727352AbfEHSTt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 May 2019 14:19:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B8153809F;
        Wed,  8 May 2019 18:20:05 +0000 (UTC)
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
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH] gpio: gpio-omap: Fix lost edge wake-up interrupts
Date:   Wed,  8 May 2019 11:19:39 -0700
Message-Id: <20190508181939.1990-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If an edge interrupt triggers while entering idle just before we save
GPIO datain register to saved_datain, the triggered GPIO will not be
noticed on wake-up. This is because the saved_datain and GPIO datain
are the same. Let's fix this by ignoring any pending edge interrupts
in saved_datain.

This can be somewhat easily reproduced by pinging an idle system with
smsc911x Ethernet interface configured IRQ_TYPE_EDGE_FALLING. At some
point the smsc911x interrupts will just stop triggering.

Note that in the long run we may be able to cancel entering idle by
returning an error in gpio_omap_cpu_notifier(). But let's fix the bug
first.

Also note that because of the recent clean-up efforts this patch does
not apply directly to older kernels. This does fix a long term issue
though, and can be backported as needed.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Ladislav Michl <ladis@linux-mips.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpio/gpio-omap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1279,7 +1279,14 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
 	void __iomem *base = bank->base;
 	u32 nowake;
 
+	/*
+	 * Save datain register to trigger edge interrupts on unidle for GPIOS
+	 * that are not wake-up capable. Ignore any enabled_non_wakeup_gpios
+	 * that may have just triggered as we're entering idle. Otherwise unidle
+	 * will not notice them.
+	 */
 	bank->saved_datain = readl_relaxed(base + bank->regs->datain);
+	bank->saved_datain |= bank->enabled_non_wakeup_gpios;
 
 	if (!bank->enabled_non_wakeup_gpios)
 		goto update_gpio_context_count;
-- 
2.21.0
