Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F5E50BF4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 15:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbfFXNZq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 09:25:46 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42422 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbfFXNZp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 09:25:45 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so12589201lje.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kPvpd9jFtLKCPgzqAlx5DtxQDxnYWtZQ6ePrjtiwaEA=;
        b=HesgNxGjMhBzCWbu5b1z1is2fdQnvw43rdh8cqxYyzhtedFAtR+3fbUTd7ldMS5CLn
         nO7EHrpi0dLB60TgATrHWpVkWLWNW0oqR6B4OJnGiOa52BefF4hwpJkWhghNcvcltATw
         pnAqNxkAZYsGBCiOhWlm7ei7XxqQU7a6E9OLbBKnupFJ1GbDx0WrGYuE0D6yKlT9j3X4
         k2TOzPwfQRX0F7lMMlWH6Q/FVbfCJ+NhJ9LtXP0UJTovxRChClJ2jfUfdigO36uDq7/b
         a4ywCWJfdYHXvDaHDHPyMIB63A9yMTZEK5RFbJJRlQOns4jCtdBzRhsr/ZgYZ21fv0g9
         vVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kPvpd9jFtLKCPgzqAlx5DtxQDxnYWtZQ6ePrjtiwaEA=;
        b=jhzNddnrICYF/7xDbohwFS+ccrJO5eyxoj0zmSIgV5/4NTYTlMeC0Rz8L5LCbibuA8
         MuD5pGA+bX4rP5lR8D7p0A5Ic1huVyoN0dVonBtKDrJmaLolceKHcpm5LKRaK+jqFISS
         /nWi7ipyAxb8RZt43PKBnYdo+vCM6+0OVJM2wt7QWS95tlDEN4o9IjjNDWjSc0pw5kuP
         RTh09rNh2XPyVcIVF1BVMPFUpSkVVjJBiFrTFPvZPspP5thBMkogvXktz9K7dTDPAhPq
         GFiWRCCMu7oqtvFAuwPMASGUM69Cl4bO33h2iBdpE7xH4KMPdNuyJXawyOAXFXwZ78mu
         1vlg==
X-Gm-Message-State: APjAAAXXV2P2+gfFdNXAdvyT935t68E+BuE4HnkLc4QGdP4EQhU5ghsi
        SuJGDGjfOKr/VZLvfvIezrW+hBwLx3g=
X-Google-Smtp-Source: APXvYqzsKn5bWNwBEfqIRdX0QajcAG0lS6svN1XpRFxviDPHoVCk6JKbm6v/HKa5RmuUdefZcjK6Ig==
X-Received: by 2002:a2e:6e0e:: with SMTP id j14mr15016273ljc.85.1561382742581;
        Mon, 24 Jun 2019 06:25:42 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id t4sm416102ljh.9.2019.06.24.06.25.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 06:25:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 2/4 v1] gpio: ixp4xx: Convert to hieararchical GPIOLIB_IRQCHIP
Date:   Mon, 24 Jun 2019 15:25:29 +0200
Message-Id: <20190624132531.6184-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190624132531.6184-1-linus.walleij@linaro.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This modifies the IXP4xx driver to use the new helpers
to handle the remapping of parent to child hardware irqs
in the gpiolib core.

This pulls the majority of the code out of the driver
and use the generic code in gpiolib.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Bitan Biswas <bbiswas@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>
Cc: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog RFC->v1:
- Fixed some bugs in dereferencing the gpio_chip first
  from the irqchip data, then dereference the
  local state container from the gpio_chip
- Adapted to changes in the core patch like provide
  as translation callback rather than a table.
- Tested on the Linksys NSLU2 and works like a charm
---
 drivers/gpio/Kconfig       |   2 +-
 drivers/gpio/gpio-ixp4xx.c | 277 +++++++++----------------------------
 2 files changed, 63 insertions(+), 216 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8023d03ec362..72027b0c5bf4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -291,7 +291,7 @@ config GPIO_IXP4XX
 	depends on ARM # For <asm/mach-types.h>
 	depends on ARCH_IXP4XX
 	select GPIO_GENERIC
-	select IRQ_DOMAIN
+	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Say yes here to support the GPIO functionality of a number of Intel
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 670c2a85a35b..8bd23e80c61f 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -47,7 +47,6 @@
  * @dev: containing device for this instance
  * @fwnode: the fwnode for this GPIO chip
  * @gc: gpiochip for this instance
- * @domain: irqdomain for this chip instance
  * @base: remapped I/O-memory base
  * @irq_edge: Each bit represents an IRQ: 1: edge-triggered,
  * 0: level triggered
@@ -56,48 +55,22 @@ struct ixp4xx_gpio {
 	struct device *dev;
 	struct fwnode_handle *fwnode;
 	struct gpio_chip gc;
-	struct irq_domain *domain;
 	void __iomem *base;
 	unsigned long long irq_edge;
 };
 
-/**
- * struct ixp4xx_gpio_map - IXP4 GPIO to parent IRQ map
- * @gpio_offset: offset of the IXP4 GPIO line
- * @parent_hwirq: hwirq on the parent IRQ controller
- */
-struct ixp4xx_gpio_map {
-	int gpio_offset;
-	int parent_hwirq;
-};
-
-/* GPIO lines 0..12 have corresponding IRQs, GPIOs 13..15 have no IRQs */
-const struct ixp4xx_gpio_map ixp4xx_gpiomap[] = {
-	{ .gpio_offset = 0, .parent_hwirq = 6 },
-	{ .gpio_offset = 1, .parent_hwirq = 7 },
-	{ .gpio_offset = 2, .parent_hwirq = 19 },
-	{ .gpio_offset = 3, .parent_hwirq = 20 },
-	{ .gpio_offset = 4, .parent_hwirq = 21 },
-	{ .gpio_offset = 5, .parent_hwirq = 22 },
-	{ .gpio_offset = 6, .parent_hwirq = 23 },
-	{ .gpio_offset = 7, .parent_hwirq = 24 },
-	{ .gpio_offset = 8, .parent_hwirq = 25 },
-	{ .gpio_offset = 9, .parent_hwirq = 26 },
-	{ .gpio_offset = 10, .parent_hwirq = 27 },
-	{ .gpio_offset = 11, .parent_hwirq = 28 },
-	{ .gpio_offset = 12, .parent_hwirq = 29 },
-};
-
 static void ixp4xx_gpio_irq_ack(struct irq_data *d)
 {
-	struct ixp4xx_gpio *g = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct ixp4xx_gpio *g = gpiochip_get_data(gc);
 
 	__raw_writel(BIT(d->hwirq), g->base + IXP4XX_REG_GPIS);
 }
 
 static void ixp4xx_gpio_irq_unmask(struct irq_data *d)
 {
-	struct ixp4xx_gpio *g = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct ixp4xx_gpio *g = gpiochip_get_data(gc);
 
 	/* ACK when unmasking if not edge-triggered */
 	if (!(g->irq_edge & BIT(d->hwirq)))
@@ -108,7 +81,8 @@ static void ixp4xx_gpio_irq_unmask(struct irq_data *d)
 
 static int ixp4xx_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	struct ixp4xx_gpio *g = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct ixp4xx_gpio *g = gpiochip_get_data(gc);
 	int line = d->hwirq;
 	unsigned long flags;
 	u32 int_style;
@@ -187,122 +161,31 @@ static struct irq_chip ixp4xx_gpio_irqchip = {
 	.irq_set_type = ixp4xx_gpio_irq_set_type,
 };
 
-static int ixp4xx_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
-{
-	struct ixp4xx_gpio *g = gpiochip_get_data(gc);
-	struct irq_fwspec fwspec;
-
-	fwspec.fwnode = g->fwnode;
-	fwspec.param_count = 2;
-	fwspec.param[0] = offset;
-	fwspec.param[1] = IRQ_TYPE_NONE;
-
-	return irq_create_fwspec_mapping(&fwspec);
-}
-
-static int ixp4xx_gpio_irq_domain_translate(struct irq_domain *domain,
-					    struct irq_fwspec *fwspec,
-					    unsigned long *hwirq,
-					    unsigned int *type)
+static int ixp4xx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					     unsigned int child,
+					     unsigned int child_type,
+					     unsigned int *parent,
+					     unsigned int *parent_type)
 {
-	int ret;
+	/* All these interrupts are level high in the CPU */
+	*parent_type = IRQ_TYPE_LEVEL_HIGH;
 
-	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
-		return irq_domain_translate_twocell(domain, fwspec,
-						    hwirq, type);
+	/* GPIO lines 0..12 have dedicated IRQs */
+	if (child == 0) {
+		*parent = 6;
+		return 0;
 	}
-
-	/* This goes away when we transition to DT */
-	if (is_fwnode_irqchip(fwspec->fwnode)) {
-		ret = irq_domain_translate_twocell(domain, fwspec,
-						   hwirq, type);
-		if (ret)
-			return ret;
-		WARN_ON(*type == IRQ_TYPE_NONE);
+	if (child == 1) {
+		*parent = 7;
 		return 0;
 	}
-	return -EINVAL;
-}
-
-static int ixp4xx_gpio_irq_domain_alloc(struct irq_domain *d,
-					unsigned int irq, unsigned int nr_irqs,
-					void *data)
-{
-	struct ixp4xx_gpio *g = d->host_data;
-	irq_hw_number_t hwirq;
-	unsigned int type = IRQ_TYPE_NONE;
-	struct irq_fwspec *fwspec = data;
-	int ret;
-	int i;
-
-	ret = ixp4xx_gpio_irq_domain_translate(d, fwspec, &hwirq, &type);
-	if (ret)
-		return ret;
-
-	dev_dbg(g->dev, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
-		irq, irq + nr_irqs - 1,
-		hwirq, hwirq + nr_irqs - 1);
-
-	for (i = 0; i < nr_irqs; i++) {
-		struct irq_fwspec parent_fwspec;
-		const struct ixp4xx_gpio_map *map;
-		int j;
-
-		/* Not all lines support IRQs */
-		for (j = 0; j < ARRAY_SIZE(ixp4xx_gpiomap); j++) {
-			map = &ixp4xx_gpiomap[j];
-			if (map->gpio_offset == hwirq)
-				break;
-		}
-		if (j == ARRAY_SIZE(ixp4xx_gpiomap)) {
-			dev_err(g->dev, "can't look up hwirq %lu\n", hwirq);
-			return -EINVAL;
-		}
-		dev_dbg(g->dev, "found parent hwirq %u\n", map->parent_hwirq);
-
-		/*
-		 * We set handle_bad_irq because the .set_type() should
-		 * always be invoked and set the right type of handler.
-		 */
-		irq_domain_set_info(d,
-				    irq + i,
-				    hwirq + i,
-				    &ixp4xx_gpio_irqchip,
-				    g,
-				    handle_bad_irq,
-				    NULL, NULL);
-		irq_set_probe(irq + i);
-
-		/*
-		 * Create a IRQ fwspec to send up to the parent irqdomain:
-		 * specify the hwirq we address on the parent and tie it
-		 * all together up the chain.
-		 */
-		parent_fwspec.fwnode = d->parent->fwnode;
-		parent_fwspec.param_count = 2;
-		parent_fwspec.param[0] = map->parent_hwirq;
-		/* This parent only handles asserted level IRQs */
-		parent_fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
-		dev_dbg(g->dev, "alloc_irqs_parent for %d parent hwirq %d\n",
-			irq + i, map->parent_hwirq);
-		ret = irq_domain_alloc_irqs_parent(d, irq + i, 1,
-						   &parent_fwspec);
-		if (ret)
-			dev_err(g->dev,
-				"failed to allocate parent hwirq %d for hwirq %lu\n",
-				map->parent_hwirq, hwirq);
+	if (child >= 2 && child <= 12) {
+		*parent = child + 17;
+		return 0;
 	}
-
-	return 0;
+	return -EINVAL;
 }
 
-static const struct irq_domain_ops ixp4xx_gpio_irqdomain_ops = {
-	.translate = ixp4xx_gpio_irq_domain_translate,
-	.alloc = ixp4xx_gpio_irq_domain_alloc,
-	.free = irq_domain_free_irqs_common,
-};
-
 static int ixp4xx_gpio_probe(struct platform_device *pdev)
 {
 	unsigned long flags;
@@ -311,8 +194,8 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent;
 	struct resource *res;
 	struct ixp4xx_gpio *g;
+	struct gpio_irq_chip *girq;
 	int ret;
-	int i;
 
 	g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
 	if (!g)
@@ -326,6 +209,35 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(g->base);
 	}
 
+	/*
+	 * When we convert to device tree we will simply look up the
+	 * parent irqdomain using irq_find_host(parent) as parent comes
+	 * from IRQCHIP_DECLARE(), then use of_node_to_fwnode() to get
+	 * the fwnode. For now we need this boardfile style code.
+	 */
+	if (np) {
+		struct device_node *irq_parent;
+
+		irq_parent = of_irq_find_parent(np);
+		if (!irq_parent) {
+			dev_err(dev, "no IRQ parent node\n");
+			return -ENODEV;
+		}
+		parent = irq_find_host(irq_parent);
+		if (!parent) {
+			dev_err(dev, "no IRQ parent domain\n");
+			return -ENODEV;
+		}
+		g->fwnode = of_node_to_fwnode(np);
+	} else {
+		parent = ixp4xx_get_irq_domain();
+		g->fwnode = irq_domain_alloc_fwnode(g->base);
+		if (!g->fwnode) {
+			dev_err(dev, "no domain base\n");
+			return -ENODEV;
+		}
+	}
+
 	/*
 	 * Make sure GPIO 14 and 15 are NOT used as clocks but GPIO on
 	 * specific machines.
@@ -360,7 +272,6 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
 	}
-	g->gc.to_irq = ixp4xx_gpio_to_irq;
 	g->gc.ngpio = 16;
 	g->gc.label = "IXP4XX_GPIO_CHIP";
 	/*
@@ -372,86 +283,22 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	g->gc.parent = &pdev->dev;
 	g->gc.owner = THIS_MODULE;
 
+	girq = &g->gc.irq;
+	girq->chip = &ixp4xx_gpio_irqchip;
+	girq->fwnode = g->fwnode;
+	girq->parent_domain = parent;
+	girq->child_to_parent_hwirq = ixp4xx_gpio_child_to_parent_hwirq;
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+
 	ret = devm_gpiochip_add_data(dev, &g->gc, g);
 	if (ret) {
 		dev_err(dev, "failed to add SoC gpiochip\n");
 		return ret;
 	}
 
-	/*
-	 * When we convert to device tree we will simply look up the
-	 * parent irqdomain using irq_find_host(parent) as parent comes
-	 * from IRQCHIP_DECLARE(), then use of_node_to_fwnode() to get
-	 * the fwnode. For now we need this boardfile style code.
-	 */
-	if (np) {
-		struct device_node *irq_parent;
-
-		irq_parent = of_irq_find_parent(np);
-		if (!irq_parent) {
-			dev_err(dev, "no IRQ parent node\n");
-			return -ENODEV;
-		}
-		parent = irq_find_host(irq_parent);
-		if (!parent) {
-			dev_err(dev, "no IRQ parent domain\n");
-			return -ENODEV;
-		}
-		g->fwnode = of_node_to_fwnode(np);
-	} else {
-		parent = ixp4xx_get_irq_domain();
-		g->fwnode = irq_domain_alloc_fwnode(g->base);
-		if (!g->fwnode) {
-			dev_err(dev, "no domain base\n");
-			return -ENODEV;
-		}
-	}
-	g->domain = irq_domain_create_hierarchy(parent,
-						IRQ_DOMAIN_FLAG_HIERARCHY,
-						ARRAY_SIZE(ixp4xx_gpiomap),
-						g->fwnode,
-						&ixp4xx_gpio_irqdomain_ops,
-						g);
-	if (!g->domain) {
-		irq_domain_free_fwnode(g->fwnode);
-		dev_err(dev, "no hierarchical irq domain\n");
-		return ret;
-	}
-
-	/*
-	 * After adding OF support, this is no longer needed: irqs
-	 * will be allocated for the respective fwnodes.
-	 */
-	if (!np) {
-		for (i = 0; i < ARRAY_SIZE(ixp4xx_gpiomap); i++) {
-			const struct ixp4xx_gpio_map *map = &ixp4xx_gpiomap[i];
-			struct irq_fwspec fwspec;
-
-			fwspec.fwnode = g->fwnode;
-			/* This is the hwirq for the GPIO line side of things */
-			fwspec.param[0] = map->gpio_offset;
-			fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
-			fwspec.param_count = 2;
-			ret = __irq_domain_alloc_irqs(g->domain,
-						      -1, /* just pick something */
-						      1,
-						      NUMA_NO_NODE,
-						      &fwspec,
-						      false,
-						      NULL);
-			if (ret < 0) {
-				irq_domain_free_fwnode(g->fwnode);
-				dev_err(dev,
-					"can not allocate irq for GPIO line %d parent hwirq %d in hierarchy domain: %d\n",
-					map->gpio_offset, map->parent_hwirq,
-					ret);
-				return ret;
-			}
-		}
-	}
-
 	platform_set_drvdata(pdev, g);
-	dev_info(dev, "IXP4 GPIO @%p registered\n", g->base);
+	dev_info(dev, "IXP4 GPIO registered\n");
 
 	return 0;
 }
-- 
2.21.0

