Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BD81AA9A7
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636551AbgDOOQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:57663 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636542AbgDOOPo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:44 -0400
IronPort-SDR: 3DWC+irO2WZtTdYrCYuJrBsh5HT9L0fZJ9UBcMotUJoExNHBbGcUIzZSNMVBMT6yj0RMUMqDZg
 8PHEVY0Hl/ew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: rATqkPJtLY6ZYVtbxqMtyhtihY2NxYrUqHObev6jUGy0ZUBcXD5jejJAAPGahjUklpG4hgJDPZ
 iGuOjgdXx9/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="288561291"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 07:15:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B6C87812; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 05/14] gpio: dwapb: Deduplicate IRQ resource management
Date:   Wed, 15 Apr 2020 17:15:25 +0300
Message-Id: <20200415141534.31240-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
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
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
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

