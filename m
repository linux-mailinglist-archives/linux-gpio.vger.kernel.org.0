Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1991E1A357D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgDIOMf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:40330 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbgDIOMf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:35 -0400
IronPort-SDR: vCo3AEa5F/sgCmhig2KbPuCZHqn4mleSlcYMv7/pSbG4ysfgLCdLGNmSzGl3/JkdwpoX1Zmg8u
 U1pTeT9KRN7A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:35 -0700
IronPort-SDR: UgOveT1lgKwFKh9ipFZlUPCw8jC0wYI3FqVpovukamAHo+VgvEnTkGJ/PJjh3b/maGwERqLl4d
 +UKBzi/+jNBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="398581416"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 09 Apr 2020 07:12:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 81EE9697; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 04/13] gpio: dwapb: Deduplicate IRQ resource management
Date:   Thu,  9 Apr 2020 17:12:19 +0300
Message-Id: <20200409141228.49561-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO library provides default IRQ resource management hooks,
there is no need to repeat this in the individual driver.

Remove them for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 588d5c61ae42..c0c267cddd80 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -250,31 +250,6 @@ static void dwapb_irq_disable(struct irq_data *d)
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
-static int dwapb_irq_reqres(struct irq_data *d)
-{
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
-	int ret;
-
-	ret = gpiochip_lock_as_irq(gc, irqd_to_hwirq(d));
-	if (ret) {
-		dev_err(gpio->dev, "unable to lock HW IRQ %lu for IRQ\n",
-			irqd_to_hwirq(d));
-		return ret;
-	}
-	return 0;
-}
-
-static void dwapb_irq_relres(struct irq_data *d)
-{
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
-
-	gpiochip_unlock_as_irq(gc, irqd_to_hwirq(d));
-}
-
 static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
@@ -428,8 +403,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		ct->chip.irq_set_type = dwapb_irq_set_type;
 		ct->chip.irq_enable = dwapb_irq_enable;
 		ct->chip.irq_disable = dwapb_irq_disable;
-		ct->chip.irq_request_resources = dwapb_irq_reqres;
-		ct->chip.irq_release_resources = dwapb_irq_relres;
 #ifdef CONFIG_PM_SLEEP
 		ct->chip.irq_set_wake = dwapb_irq_set_wake;
 #endif
-- 
2.25.1

