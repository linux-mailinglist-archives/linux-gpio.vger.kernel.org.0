Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69AF76965E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2019 17:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388538AbfGOOIf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 10:08:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388532AbfGOOIf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jul 2019 10:08:35 -0400
Received: from sasha-vm.mshome.net (unknown [73.61.17.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 47C512081C;
        Mon, 15 Jul 2019 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563199714;
        bh=3YxNeA0EItrPRLbclVhF+tWlgJuoC2IPRnUm6bApOto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ca3BOMU6YrFmk3onNWRX74oXcRYTWRlMAKqm94UJo5Z1bL5Al+Gq/ioz5yHDoy2xT
         xZRk1Jsj10Aot9ZgUBsOXThvGgyA3uPjYwdTh6cSE0PA3KFGj0zX8615erV/j3Dgp8
         zbJk3ropWRz/8DVgQ7KmVJXc/nbd1yTeA8CRm33Y=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 081/219] gpio: omap: Fix lost edge wake-up interrupts
Date:   Mon, 15 Jul 2019 10:01:22 -0400
Message-Id: <20190715140341.6443-81-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715140341.6443-1-sashal@kernel.org>
References: <20190715140341.6443-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit a522f1d0c381c42f3ace13b8bbeeccabdd6d2e5c ]

If an edge interrupt triggers while entering idle just before we save
GPIO datain register to saved_datain, the triggered GPIO will not be
noticed on wake-up. This is because the saved_datain and GPIO datain
are the same on wake-up in omap_gpio_unidle(). Let's fix this by
ignoring any pending edge interrupts for saved_datain.

This issue affects only idle states where the GPIO module internal
wake-up path is operational. For deeper idle states where the GPIO
module gets powered off, Linux generic wakeirqs must be used for
the padconf wake-up events with pinctrl-single driver. For examples,
please see "interrupts-extended" dts usage in many drivers.

This issue can be somewhat easily reproduced by pinging an idle system
with smsc911x Ethernet interface configured IRQ_TYPE_EDGE_FALLING. At
some point the smsc911x interrupts will just stop triggering. Also if
WLCORE WLAN is used with EDGE interrupt like it's documentation specifies,
we can see lost interrupts without this patch.

Note that in the long run we may be able to cancel entering idle by
returning an error in gpio_omap_cpu_notifier() on pending interrupts.
But let's fix the bug first.

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
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-omap.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 233245bc693c..1ddc872b4e4b 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1455,7 +1455,7 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
 {
 	struct device *dev = bank->chip.parent;
 	void __iomem *base = bank->base;
-	u32 nowake;
+	u32 mask, nowake;
 
 	bank->saved_datain = readl_relaxed(base + bank->regs->datain);
 
@@ -1465,6 +1465,16 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
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
2.20.1

