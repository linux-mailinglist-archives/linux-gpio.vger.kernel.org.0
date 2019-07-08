Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23EA761D69
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 13:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbfGHLCJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 07:02:09 -0400
Received: from onstation.org ([52.200.56.107]:56148 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGHLB6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jul 2019 07:01:58 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9EE653EEA5;
        Mon,  8 Jul 2019 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562583717;
        bh=8+67+LpzlnUlaCGxsOGRdv+L0h/6uYQ8Fm4MEQhEifw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hbTM9mP+Ggp9lXZfLbu9m4x9y3qDbQeKeUf/LsXcSXu/7mTf6Iump6UoRSa16H18L
         muX8O74SsmpdpYoVR0sPZHyCYagDQ57G0oHSfS4lPpsIYOGsT1JbSKwKlRF4zLEpX0
         pWkMkx2udOn16u7A+WoMKchUkIuowN4acoiavXng=
From:   Brian Masney <masneyb@onstation.org>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        tglx@linutronix.de, marc.zyngier@arm.com, ilina@codeaurora.org,
        jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com,
        linux-tegra@vger.kernel.org, david.daney@cavium.com,
        yamada.masahiro@socionext.com, treding@nvidia.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] gpio: allow customizing hierarchical IRQ chips
Date:   Mon,  8 Jul 2019 07:01:36 -0400
Message-Id: <20190708110138.24657-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708110138.24657-1-masneyb@onstation.org>
References: <20190708110138.24657-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that the GPIO core has support for hierarchical IRQ chips, let's add
support for three new callbacks in struct gpio_irq_chip:

populate_parent_fwspec:
    This optional callback populates the struct irq_fwspec for the
    parent's IRQ domain. If this is not specified, then
    gpiochip_populate_parent_fwspec_twocell will be used. A four-cell
    variant named &gpiochip_populate_parent_fwspec_twocell is also
    available.

child_pin_to_irq:
    This optional callback is used to translate the child's GPIO pin
    number to an IRQ number for the GPIO to_irq() callback. If this is
    not specified, then a default callback will be provided that
    returns the pin number.

child_irq_domain_ops:
    The IRQ domain operations that will be used for this GPIO IRQ
    chip. If no operations are provided, then default callbacks will
    be populated to setup the IRQ hierarchy. Some drivers need to
    supply their own translate function.

These will be initially used by Qualcomm's spmi-gpio and ssbi-gpio.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Note: checkpatch doesn't like that child_irq_domain_ops is not const.

 drivers/gpio/gpiolib.c      | 52 +++++++++++++++++++++++++++----------
 include/linux/gpio/driver.h | 35 +++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 06c9cf714c99..5423242deb81 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1778,7 +1778,7 @@ static void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gc,
 
 			fwspec.fwnode = gc->irq.fwnode;
 			/* This is the hwirq for the GPIO line side of things */
-			fwspec.param[0] = i;
+			fwspec.param[0] = girq->child_pin_to_irq(gc, i);
 			/* Just pick something */
 			fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
 			fwspec.param_count = 2;
@@ -1841,7 +1841,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 
 	chip_info(gc, "called %s\n", __func__);
 
-	ret = gpiochip_hierarchy_irq_domain_translate(d, fwspec, &hwirq, &type);
+	ret = gc->irq.child_irq_domain_ops.translate(d, fwspec, &hwirq, &type);
 	if (ret)
 		return ret;
 
@@ -1882,10 +1882,9 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 		 * all together up the chain.
 		 */
 		parent_fwspec.fwnode = d->parent->fwnode;
-		parent_fwspec.param_count = 2;
-		parent_fwspec.param[0] = parent_hwirq;
 		/* This parent only handles asserted level IRQs */
-		parent_fwspec.param[1] = parent_type;
+		girq->populate_parent_fwspec(gc, &parent_fwspec, parent_hwirq,
+					     parent_type);
 		chip_info(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
 			  irq + i, parent_hwirq);
 		ret = irq_domain_alloc_irqs_parent(d, irq + i, 1,
@@ -1899,13 +1898,29 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	return 0;
 }
 
-static const struct irq_domain_ops gpiochip_hierarchy_domain_ops = {
-	.activate = gpiochip_irq_domain_activate,
-	.deactivate = gpiochip_irq_domain_deactivate,
-	.translate = gpiochip_hierarchy_irq_domain_translate,
-	.alloc = gpiochip_hierarchy_irq_domain_alloc,
-	.free = irq_domain_free_irqs_common,
-};
+static unsigned int gpiochip_child_pin_to_irq_noop(struct gpio_chip *chip,
+						   unsigned int pin)
+{
+	return pin;
+}
+
+static void gpiochip_add_default_irq_domain_ops(struct irq_domain_ops *ops)
+{
+	if (!ops->activate)
+		ops->activate = gpiochip_irq_domain_activate;
+
+	if (!ops->deactivate)
+		ops->deactivate = gpiochip_irq_domain_deactivate;
+
+	if (!ops->translate)
+		ops->translate = gpiochip_hierarchy_irq_domain_translate;
+
+	if (!ops->alloc)
+		ops->alloc = gpiochip_hierarchy_irq_domain_alloc;
+
+	if (!ops->free)
+		ops->free = irq_domain_free_irqs_common;
+}
 
 static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
 {
@@ -1921,12 +1936,21 @@ static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
 		return -EINVAL;
 	}
 
+	if (!gc->irq.child_pin_to_irq)
+		gc->irq.child_pin_to_irq = gpiochip_child_pin_to_irq_noop;
+
+	if (!gc->irq.populate_parent_fwspec)
+		gc->irq.populate_parent_fwspec =
+			gpiochip_populate_parent_fwspec_twocell;
+
+	gpiochip_add_default_irq_domain_ops(&gc->irq.child_irq_domain_ops);
+
 	gc->irq.domain = irq_domain_create_hierarchy(
 		gc->irq.parent_domain,
 		IRQ_DOMAIN_FLAG_HIERARCHY,
 		gc->ngpio,
 		gc->irq.fwnode,
-		&gpiochip_hierarchy_domain_ops,
+		&gc->irq.child_irq_domain_ops,
 		gc);
 
 	if (!gc->irq.domain) {
@@ -2106,7 +2130,7 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 
 		spec.fwnode = domain->fwnode;
 		spec.param_count = 2;
-		spec.param[0] = offset;
+		spec.param[0] = chip->irq.child_pin_to_irq(chip, offset);
 		spec.param[1] = IRQ_TYPE_NONE;
 
 		return irq_create_fwspec_mapping(&spec);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 6b6bca20c8f9..fb9c126dd8f0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -93,6 +93,41 @@ struct gpio_irq_chip {
 				     unsigned int child_type,
 				     unsigned int *parent_hwirq,
 				     unsigned int *parent_type);
+
+	/**
+	 * @populate_parent_fwspec:
+	 *
+	 * This optional callback populates the &struct irq_fwspec for the
+	 * parent's IRQ domain. If this is not specified, then
+	 * &gpiochip_populate_parent_fwspec_twocell will be used. A four-cell
+	 * variant named &gpiochip_populate_parent_fwspec_twocell is also
+	 * available.
+	 */
+	void (*populate_parent_fwspec)(struct gpio_chip *chip,
+				       struct irq_fwspec *fwspec,
+				       unsigned int parent_hwirq,
+				       unsigned int parent_type);
+
+	/**
+	 * @child_pin_to_irq:
+	 *
+	 * This optional callback is used to translate the child's GPIO pin
+	 * number to an IRQ number for the GPIO to_irq() callback. If this is
+	 * not specified, then a default callback will be provided that
+	 * returns the pin number.
+	 */
+	unsigned int (*child_pin_to_irq)(struct gpio_chip *chip,
+					 unsigned int pin);
+
+	/**
+	 * @child_irq_domain_ops:
+	 *
+	 * The IRQ domain operations that will be used for this GPIO IRQ
+	 * chip. If no operations are provided, then default callbacks will
+	 * be populated to setup the IRQ hierarchy. Some drivers need to
+	 * supply their own translate function.
+	 */
+	struct irq_domain_ops child_irq_domain_ops;
 #endif
 
 	/**
-- 
2.20.1

