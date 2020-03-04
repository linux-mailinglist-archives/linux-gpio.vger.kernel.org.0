Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF8EF179BFF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 23:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388490AbgCDWyp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 17:54:45 -0500
Received: from muru.com ([72.249.23.125]:58904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388468AbgCDWyp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Mar 2020 17:54:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CBF1B81AC;
        Wed,  4 Mar 2020 22:55:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Gerlach <d-gerlach@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 2/3] gpio: omap: Block idle on pending gpio interrupts
Date:   Wed,  4 Mar 2020 14:54:31 -0800
Message-Id: <20200304225433.37336-3-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304225433.37336-1-tony@atomide.com>
References: <20200304225433.37336-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With the SoC cpuidle handling fixed for cpu_pm, we can now start to
return NOTIFY_BAD if there there are pending gpio interrupts.

This way the deeper SoC idle states can get blocked, and gpio latency
is improved in some cases. Note that this will not help with the
latency if the SoC has already entered a deeper idle state.

Note that this patch depends on cpu_pm properly handling the errors
returned by notifiers. For omap variants, this is fixed with patch
"ARM: OMAP2+: Handle errors for cpu_pm".

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Ladislav Michl <ladis@linux-mips.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpio/gpio-omap.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1237,26 +1237,35 @@ static int gpio_omap_cpu_notifier(struct notifier_block *nb,
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
+	int ret = NOTIFY_OK;
+	u32 isr, mask;
 
 	bank = container_of(nb, struct gpio_bank, nb);
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
+	if (bank->is_suspended)
+		goto out_unlock;
+
 	switch (cmd) {
 	case CPU_CLUSTER_PM_ENTER:
-		if (bank->is_suspended)
+		mask = omap_get_gpio_irqbank_mask(bank);
+		isr = readl_relaxed(bank->base + bank->regs->irqstatus) & mask;
+		if (isr) {
+			ret = NOTIFY_BAD;
 			break;
+		}
 		omap_gpio_idle(bank, true);
 		break;
 	case CPU_CLUSTER_PM_ENTER_FAILED:
 	case CPU_CLUSTER_PM_EXIT:
-		if (bank->is_suspended)
-			break;
 		omap_gpio_unidle(bank);
 		break;
 	}
+
+out_unlock:
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
-	return NOTIFY_OK;
+	return ret;
 }
 
 static const struct omap_gpio_reg_offs omap2_gpio_regs = {
-- 
2.25.1
