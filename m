Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2B71A357C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbgDIOMf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:21918 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727079AbgDIOMe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:34 -0400
IronPort-SDR: iiAoUcf57dijXVewwZAsa+gWdxMP0AEYG9top/OaSPu0hI+eJxIlNfaaxjkjV8oiFpCIy8aCz8
 1FZB77rm7bRA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:34 -0700
IronPort-SDR: 97ls1L07vWTpOy88oRbi410xIzBxZqU/DTb/ukGizWpTAOHXb+KtNGZrxB3R4wQ+9m9YnZenHH
 jbj/Q2hdGsNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="286901074"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2020 07:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 912EC981; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 05/13] gpio: dwapb: Convert to use irqd_to_hwirq()
Date:   Thu,  9 Apr 2020 17:12:20 +0300
Message-Id: <20200409141228.49561-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert to use irqd_to_hwirq() instead of direct access to the hwirq member.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c0c267cddd80..3a1f3fae923f 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
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
@@ -255,8 +255,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = igc->private;
 	struct gpio_chip *gc = &gpio->ports[0].gc;
-	int bit = d->hwirq;
 	unsigned long level, polarity, flags;
+	u32 bit = irqd_to_hwirq(d);
 
 	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
 		     IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
@@ -305,11 +305,12 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = igc->private;
 	struct dwapb_context *ctx = gpio->ports[0].ctx;
+	u32 bit = irqd_to_hwirq(d);
 
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

