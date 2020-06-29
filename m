Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40F6E20D49F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2020 21:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgF2TKO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 15:10:14 -0400
Received: from muru.com ([72.249.23.125]:59964 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgF2TKL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jun 2020 15:10:11 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F1E3A81A3;
        Mon, 29 Jun 2020 16:42:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] gpio: omap: Add missing PM ops for suspend
Date:   Mon, 29 Jun 2020 09:41:14 -0700
Message-Id: <20200629164114.1186-1-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We've had the legacy platform code take care of suspend for us but
this no longer is the case when probed without legacy mode with
ti-sysc. We need to configure PM ops like standard Linux device
drivers do.

As we still have some SoCs booting also the legacy mode, we need to
add omap_gpio_suspend() and omap_gpio_resume(), and check for the
is_suspended flag to avoid legacy _od_suspend_noirq() calling them
on an already suspended GPIO instance.

Once we have no SoCs booting in legacy mode, we can just switch to
using the standard PM ops with pm_runtime_force_suspend() and
pm_runtime_force_resume().

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpio/gpio-omap.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -60,6 +60,7 @@ struct gpio_bank {
 	struct clk *dbck;
 	struct notifier_block nb;
 	unsigned int is_suspended:1;
+	unsigned int needs_resume:1;
 	u32 mod_usage;
 	u32 irq_usage;
 	u32 dbck_enable_mask;
@@ -1504,9 +1505,34 @@ static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int omap_gpio_suspend(struct device *dev)
+{
+	struct gpio_bank *bank = dev_get_drvdata(dev);
+
+	if (bank->is_suspended)
+		return 0;
+
+	bank->needs_resume = 1;
+
+	return omap_gpio_runtime_suspend(dev);
+}
+
+static int omap_gpio_resume(struct device *dev)
+{
+	struct gpio_bank *bank = dev_get_drvdata(dev);
+
+	if (!bank->needs_resume)
+		return 0;
+
+	bank->needs_resume = 0;
+
+	return omap_gpio_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops gpio_pm_ops = {
 	SET_RUNTIME_PM_OPS(omap_gpio_runtime_suspend, omap_gpio_runtime_resume,
 									NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(omap_gpio_suspend, omap_gpio_resume)
 };
 
 static struct platform_driver omap_gpio_driver = {
-- 
2.27.0
