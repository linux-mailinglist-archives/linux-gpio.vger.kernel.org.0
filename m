Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56E3D1491
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731426AbfJIQvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:51:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:38363 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731192AbfJIQvZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Oct 2019 12:51:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 09:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; 
   d="scan'208";a="192930598"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2019 09:51:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BA33D48B; Wed,  9 Oct 2019 19:51:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 4/5] gpio: lynxpoint: Move hardware initialization to callback
Date:   Wed,  9 Oct 2019 19:50:55 +0300
Message-Id: <20191009165056.76580-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver wants to initialize related registers before IRQ chip will be added.
That's why move it to a corresponding callback. It also fixes the NULL pointer
dereference.

Fixes: 7b1e889436a1 ("gpio: lynxpoint: Pass irqchip when adding gpiochip")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-lynxpoint.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 6bb9741ad036..082cd143f430 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -294,8 +294,9 @@ static struct irq_chip lp_irqchip = {
 	.flags = IRQCHIP_SKIP_SET_WAKE,
 };
 
-static void lp_gpio_irq_init_hw(struct lp_gpio *lg)
+static int lp_gpio_irq_init_hw(struct gpio_chip *chip)
 {
+	struct lp_gpio *lg = gpiochip_get_data(chip);
 	unsigned long reg;
 	unsigned base;
 
@@ -307,6 +308,8 @@ static void lp_gpio_irq_init_hw(struct lp_gpio *lg)
 		reg = lp_gpio_reg(&lg->chip, base, LP_INT_STAT);
 		outl(0xffffffff, reg);
 	}
+
+	return 0;
 }
 
 static int lp_gpio_probe(struct platform_device *pdev)
@@ -364,6 +367,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 
 		girq = &gc->irq;
 		girq->chip = &lp_irqchip;
+		girq->init_hw = lp_gpio_irq_init_hw;
 		girq->parent_handler = lp_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
@@ -374,8 +378,6 @@ static int lp_gpio_probe(struct platform_device *pdev)
 		girq->parents[0] = (unsigned)irq_rc->start;
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_simple_irq;
-
-		lp_gpio_irq_init_hw(lg);
 	}
 
 	ret = devm_gpiochip_add_data(dev, gc, lg);
-- 
2.23.0

