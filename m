Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B87D9116D9E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfLINJd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:33 -0500
Received: from mga04.intel.com ([192.55.52.120]:15274 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727522AbfLINJc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="219976299"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2019 05:09:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CC279907; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 14/24] pinctrl: lynxpoint: Move lp_irq_type() closer to IRQ related routines
Date:   Mon,  9 Dec 2019 15:09:16 +0200
Message-Id: <20191209130926.86483-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Consolidate IRQ routines for better maintenance.

While here, rename lp_irq_type() to lp_irq_set_type() to be in align
with a callback name.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 88 +++++++++++------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 83b5b2590778..19e8f8f1f7aa 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -152,49 +152,6 @@ static void lp_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	pm_runtime_put(lg->dev);
 }
 
-static int lp_irq_type(struct irq_data *d, unsigned int type)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct lp_gpio *lg = gpiochip_get_data(gc);
-	u32 hwirq = irqd_to_hwirq(d);
-	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_CONFIG1);
-	unsigned long flags;
-	u32 value;
-
-	if (hwirq >= lg->chip.ngpio)
-		return -EINVAL;
-
-	raw_spin_lock_irqsave(&lg->lock, flags);
-	value = ioread32(reg);
-
-	/* set both TRIG_SEL and INV bits to 0 for rising edge */
-	if (type & IRQ_TYPE_EDGE_RISING)
-		value &= ~(TRIG_SEL_BIT | INT_INV_BIT);
-
-	/* TRIG_SEL bit 0, INV bit 1 for falling edge */
-	if (type & IRQ_TYPE_EDGE_FALLING)
-		value = (value | INT_INV_BIT) & ~TRIG_SEL_BIT;
-
-	/* TRIG_SEL bit 1, INV bit 0 for level low */
-	if (type & IRQ_TYPE_LEVEL_LOW)
-		value = (value | TRIG_SEL_BIT) & ~INT_INV_BIT;
-
-	/* TRIG_SEL bit 1, INV bit 1 for level high */
-	if (type & IRQ_TYPE_LEVEL_HIGH)
-		value |= TRIG_SEL_BIT | INT_INV_BIT;
-
-	iowrite32(value, reg);
-
-	if (type & IRQ_TYPE_EDGE_BOTH)
-		irq_set_handler_locked(d, handle_edge_irq);
-	else if (type & IRQ_TYPE_LEVEL_MASK)
-		irq_set_handler_locked(d, handle_level_irq);
-
-	raw_spin_unlock_irqrestore(&lg->lock, flags);
-
-	return 0;
-}
-
 static int lp_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
@@ -311,13 +268,56 @@ static void lp_irq_disable(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
+static int lp_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct lp_gpio *lg = gpiochip_get_data(gc);
+	u32 hwirq = irqd_to_hwirq(d);
+	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_CONFIG1);
+	unsigned long flags;
+	u32 value;
+
+	if (hwirq >= lg->chip.ngpio)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&lg->lock, flags);
+	value = ioread32(reg);
+
+	/* set both TRIG_SEL and INV bits to 0 for rising edge */
+	if (type & IRQ_TYPE_EDGE_RISING)
+		value &= ~(TRIG_SEL_BIT | INT_INV_BIT);
+
+	/* TRIG_SEL bit 0, INV bit 1 for falling edge */
+	if (type & IRQ_TYPE_EDGE_FALLING)
+		value = (value | INT_INV_BIT) & ~TRIG_SEL_BIT;
+
+	/* TRIG_SEL bit 1, INV bit 0 for level low */
+	if (type & IRQ_TYPE_LEVEL_LOW)
+		value = (value | TRIG_SEL_BIT) & ~INT_INV_BIT;
+
+	/* TRIG_SEL bit 1, INV bit 1 for level high */
+	if (type & IRQ_TYPE_LEVEL_HIGH)
+		value |= TRIG_SEL_BIT | INT_INV_BIT;
+
+	iowrite32(value, reg);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
+
+	return 0;
+}
+
 static struct irq_chip lp_irqchip = {
 	.name = "LP-GPIO",
 	.irq_mask = lp_irq_mask,
 	.irq_unmask = lp_irq_unmask,
 	.irq_enable = lp_irq_enable,
 	.irq_disable = lp_irq_disable,
-	.irq_set_type = lp_irq_type,
+	.irq_set_type = lp_irq_set_type,
 	.flags = IRQCHIP_SKIP_SET_WAKE,
 };
 
-- 
2.24.0

