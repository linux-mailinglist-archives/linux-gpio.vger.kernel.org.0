Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AED251AA9AC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636547AbgDOOQy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:9848 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636538AbgDOOPm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:42 -0400
IronPort-SDR: JBv8ayGxs9UGJ+b5CB/LvJIL/ydPgY0AZc4otT2SRdA1LIJvEJrsw6VkYyOntJE9U4urCYxAbs
 +xDmfZyMuMTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: rhVC47Oc7m9VXzZaaTSDMHn7UsA+jbTEEIrZyq0D/pt3+X/gBtnBe5KsoAIpiCi4KnMvZiFRE/
 nfWdt/UAjO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="244112398"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2020 07:15:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C06C4C4E; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 06/14] gpio: dwapb: Convert to use irqd_to_hwirq()
Date:   Wed, 15 Apr 2020 17:15:26 +0300
Message-Id: <20200415141534.31240-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert to use irqd_to_hwirq() instead of direct access to the hwirq member.
Also amend the type of the hwirq holding variable to be irq_hw_number_t.

Cc: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c0c267cddd80..2edccc5bbc25 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -194,7 +194,7 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 {
 	unsigned long irq_status;
-	int hwirq;
+	irq_hw_number_t hwirq;
 
 	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
 	for_each_set_bit(hwirq, &irq_status, 32) {
@@ -230,7 +230,7 @@ static void dwapb_irq_enable(struct irq_data *d)
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 	val = dwapb_read(gpio, GPIO_INTEN);
-	val |= BIT(d->hwirq);
+	val |= BIT(irqd_to_hwirq(d));
 	dwapb_write(gpio, GPIO_INTEN, val);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
@@ -245,7 +245,7 @@ static void dwapb_irq_disable(struct irq_data *d)
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 	val = dwapb_read(gpio, GPIO_INTEN);
-	val &= ~BIT(d->hwirq);
+	val &= ~BIT(irqd_to_hwirq(d));
 	dwapb_write(gpio, GPIO_INTEN, val);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
@@ -255,7 +255,7 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = igc->private;
 	struct gpio_chip *gc = &gpio->ports[0].gc;
-	int bit = d->hwirq;
+	irq_hw_number_t bit = irqd_to_hwirq(d);
 	unsigned long level, polarity, flags;
 
 	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
@@ -305,11 +305,12 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = igc->private;
 	struct dwapb_context *ctx = gpio->ports[0].ctx;
+	irq_hw_number_t bit = irqd_to_hwirq(d);
 
 	if (enable)
-		ctx->wake_en |= BIT(d->hwirq);
+		ctx->wake_en |= BIT(bit);
 	else
-		ctx->wake_en &= ~BIT(d->hwirq);
+		ctx->wake_en &= ~BIT(bit);
 
 	return 0;
 }
@@ -365,8 +366,9 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	struct gpio_chip *gc = &port->gc;
 	struct fwnode_handle  *fwnode = pp->fwnode;
 	struct irq_chip_generic	*irq_gc = NULL;
-	unsigned int hwirq, ngpio = gc->ngpio;
+	unsigned int ngpio = gc->ngpio;
 	struct irq_chip_type *ct;
+	irq_hw_number_t hwirq;
 	int err, i;
 
 	gpio->domain = irq_domain_create_linear(fwnode, ngpio,
-- 
2.25.1

