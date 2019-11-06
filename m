Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2D42F190E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 15:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731608AbfKFOsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 09:48:33 -0500
Received: from mga11.intel.com ([192.55.52.93]:26747 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726945AbfKFOsc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 09:48:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 06:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="201117588"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 06 Nov 2019 06:48:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 127C6115; Wed,  6 Nov 2019 16:48:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/8] pinctrl: lynxpoint: Use raw_spinlock for locking
Date:   Wed,  6 Nov 2019 16:48:23 +0200
Message-Id: <20191106144829.32275-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Intel Lynxpoint pinctrl driver implements irqchip callbacks which are
called with desc->lock raw_spinlock held. In mainline this is fine because
spinlock resolves to raw_spinlock. However, running the same code in -rt
we will get a BUG() asserted.

This is because in -rt spinlocks are preemptible so taking the driver
private spinlock in irqchip callbacks causes might_sleep() to trigger.

In order to keep -rt happy but at the same time make sure that register
accesses get serialized, convert the driver to use raw_spinlock instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 28 +++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index e9e47c0d5be7..6467095523cc 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -47,7 +47,7 @@
 struct lp_gpio {
 	struct gpio_chip	chip;
 	struct platform_device	*pdev;
-	spinlock_t		lock;
+	raw_spinlock_t		lock;
 	unsigned long		reg_base;
 };
 
@@ -144,7 +144,7 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 	if (hwirq >= lg->chip.ngpio)
 		return -EINVAL;
 
-	spin_lock_irqsave(&lg->lock, flags);
+	raw_spin_lock_irqsave(&lg->lock, flags);
 	value = inl(reg);
 
 	/* set both TRIG_SEL and INV bits to 0 for rising edge */
@@ -164,7 +164,7 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 		value |= TRIG_SEL_BIT | INT_INV_BIT;
 
 	outl(value, reg);
-	spin_unlock_irqrestore(&lg->lock, flags);
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
 
 	return 0;
 }
@@ -181,14 +181,14 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
-	spin_lock_irqsave(&lg->lock, flags);
+	raw_spin_lock_irqsave(&lg->lock, flags);
 
 	if (value)
 		outl(inl(reg) | OUT_LVL_BIT, reg);
 	else
 		outl(inl(reg) & ~OUT_LVL_BIT, reg);
 
-	spin_unlock_irqrestore(&lg->lock, flags);
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
 static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -197,9 +197,9 @@ static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
-	spin_lock_irqsave(&lg->lock, flags);
+	raw_spin_lock_irqsave(&lg->lock, flags);
 	outl(inl(reg) | DIR_BIT, reg);
-	spin_unlock_irqrestore(&lg->lock, flags);
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
 
 	return 0;
 }
@@ -213,9 +213,9 @@ static int lp_gpio_direction_output(struct gpio_chip *chip,
 
 	lp_gpio_set(chip, offset, value);
 
-	spin_lock_irqsave(&lg->lock, flags);
+	raw_spin_lock_irqsave(&lg->lock, flags);
 	outl(inl(reg) & ~DIR_BIT, reg);
-	spin_unlock_irqrestore(&lg->lock, flags);
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
 
 	return 0;
 }
@@ -266,9 +266,9 @@ static void lp_irq_enable(struct irq_data *d)
 	unsigned long reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
 	unsigned long flags;
 
-	spin_lock_irqsave(&lg->lock, flags);
+	raw_spin_lock_irqsave(&lg->lock, flags);
 	outl(inl(reg) | BIT(hwirq % 32), reg);
-	spin_unlock_irqrestore(&lg->lock, flags);
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
 static void lp_irq_disable(struct irq_data *d)
@@ -279,9 +279,9 @@ static void lp_irq_disable(struct irq_data *d)
 	unsigned long reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
 	unsigned long flags;
 
-	spin_lock_irqsave(&lg->lock, flags);
+	raw_spin_lock_irqsave(&lg->lock, flags);
 	outl(inl(reg) & ~BIT(hwirq % 32), reg);
-	spin_unlock_irqrestore(&lg->lock, flags);
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
 static struct irq_chip lp_irqchip = {
@@ -345,7 +345,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 		return -EBUSY;
 	}
 
-	spin_lock_init(&lg->lock);
+	raw_spin_lock_init(&lg->lock);
 
 	gc = &lg->chip;
 	gc->label = dev_name(dev);
-- 
2.24.0.rc1

