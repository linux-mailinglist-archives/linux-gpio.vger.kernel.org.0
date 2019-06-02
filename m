Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4530E324D8
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2019 22:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfFBUyg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jun 2019 16:54:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43509 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfFBUyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jun 2019 16:54:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id r18so943353wrm.10
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jun 2019 13:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=86Q/XsXcrnKtDhtp2ZmVwkDN4kscs4/XU9T8ExBYYqU=;
        b=OStQnlQl4MR49Ax7IM7BNsCSy6DLq4ekQpsf1qSYB+BK5rQbM4F1+QtMCCsx3JYseD
         +ni5WUCzRHp1cAe1q3+cl0gIyrqTS4/0p1cwRC+rFLq6SJ4anrZARNBxqtwYH2/ch18W
         WEBrbFJH41s2nn2ivhFcLI1nprn1msD6/TgfjHqOzrNM7VCfrQtZzioEcoChsqf74wqT
         fOEADXapl9ibNg/CWg7Z6cGATKOHQhx29y806fHF8Ft1AoB1QBz4cQ6RKVvoqbiQ5M8A
         1ds5RUGvl3xFAWjvoFdxgH+BL5rXaMg5C+4qLiBZbIM3Hglsha5PwSwG7f6jhr9Yg4rx
         sVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=86Q/XsXcrnKtDhtp2ZmVwkDN4kscs4/XU9T8ExBYYqU=;
        b=okD+9mTfqnTk7uOZ0mpI0lZaLRoZT3HsgqXWcuhW/c3ZiHww2JBPOf8mPn3nWUaKu5
         ulGFyDcKa+YZWC4xZ2lT/1U9Gdjaq5b1vyLQkxWOx9U7gvQp/dVue5RqBmtK71YSrpZ+
         /FwwomqzzJFOT+1A7EhL6A8dYwp0LACRyq5+sm0jURkgNlO/qk/nqlEL3qnVlhI3hnmU
         Herm8+6zg96MhrIAjaOYOWNa7SZTAPKBg2nqdHENBbECzLoApapu/farsQuFtqb9+J90
         tCtmBUfqUlcuZSShC/mQP3xH5x4x2iZNm1Z9uaAZAFm75K0OLmuXIm2SemNZ3zypU0kQ
         2vcQ==
X-Gm-Message-State: APjAAAXJBt9DdIE2C9N0/OlFGLHSgaAxzkjJRCwcNEWBaHj4qHmRC+Sv
        HzMZe+0lt13lyC15xJc5V7SVg8XERSs=
X-Google-Smtp-Source: APXvYqwhylPoqxIxiL2+2y0/b4dDHSFyGmGXhmM9WS2LvDDdeESM99iK6EAl+vV0hBhWn+nk0rdCmg==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr49976wru.172.1559508873212;
        Sun, 02 Jun 2019 13:54:33 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id h90sm38620365wrh.15.2019.06.02.13.54.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 02 Jun 2019 13:54:31 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] RFC: gpio: ixp4xx: Convert to hieararchical GPIOLIB_IRQCHIP
Date:   Sun,  2 Jun 2019 22:54:24 +0200
Message-Id: <20190602205424.28674-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602205424.28674-1-linus.walleij@linaro.org>
References: <20190602205424.28674-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This modifies the IXP4xx driver to use the new helpers
to handle the remapping of parent to child hardware irqs
in the gpiolib core.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Bitan Biswas <bbiswas@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Warning: not even compile tested as my IXP4xx setup is
at home and I'm travelling. I just wanted to get this out
there as an example of how I imagine this would work with
existing drivers.
---
 drivers/gpio/Kconfig       |   3 +-
 drivers/gpio/gpio-ixp4xx.c | 211 +++++--------------------------------
 2 files changed, 28 insertions(+), 186 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 23a121c2e176..3aef6327f994 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -289,8 +289,7 @@ config GPIO_IXP4XX
 	depends on ARM # For <asm/mach-types.h>
 	depends on ARCH_IXP4XX
 	select GPIO_GENERIC
-	select IRQ_DOMAIN
-	select IRQ_DOMAIN_HIERARCHY
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the GPIO functionality of a number of Intel
 	  IXP4xx series of chips.
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 670c2a85a35b..429d9d519ed4 100644
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
@@ -56,36 +55,25 @@ struct ixp4xx_gpio {
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
 /* GPIO lines 0..12 have corresponding IRQs, GPIOs 13..15 have no IRQs */
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
+const struct gpiochip_hierarchy_map ixp4xx_gpiomap[] = {
+	{ .hwirq = 0, .parent_hwirq = 6, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 1, .parent_hwirq = 7, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 2, .parent_hwirq = 19, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 3, .parent_hwirq = 20, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 4, .parent_hwirq = 21, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 5, .parent_hwirq = 22, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 6, .parent_hwirq = 23, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 7, .parent_hwirq = 24, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 8, .parent_hwirq = 25, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 9, .parent_hwirq = 26, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 10, .parent_hwirq = 27, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 11, .parent_hwirq = 28, .parent_type = IRQ_TYPE_LEVEL_HIGH },
+	{ .hwirq = 12, .parent_hwirq = 29, .parent_type = IRQ_TYPE_LEVEL_HIGH },
 };
 
 static void ixp4xx_gpio_irq_ack(struct irq_data *d)
@@ -187,122 +175,6 @@ static struct irq_chip ixp4xx_gpio_irqchip = {
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
-{
-	int ret;
-
-	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
-		return irq_domain_translate_twocell(domain, fwspec,
-						    hwirq, type);
-	}
-
-	/* This goes away when we transition to DT */
-	if (is_fwnode_irqchip(fwspec->fwnode)) {
-		ret = irq_domain_translate_twocell(domain, fwspec,
-						   hwirq, type);
-		if (ret)
-			return ret;
-		WARN_ON(*type == IRQ_TYPE_NONE);
-		return 0;
-	}
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
-	}
-
-	return 0;
-}
-
-static const struct irq_domain_ops ixp4xx_gpio_irqdomain_ops = {
-	.translate = ixp4xx_gpio_irq_domain_translate,
-	.alloc = ixp4xx_gpio_irq_domain_alloc,
-	.free = irq_domain_free_irqs_common,
-};
-
 static int ixp4xx_gpio_probe(struct platform_device *pdev)
 {
 	unsigned long flags;
@@ -406,49 +278,20 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 			return -ENODEV;
 		}
 	}
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
+	g->gc.irq.fwnode = g->fwnode;
+	g->gc.irq.parent_domain = parent;
+	g->gc.irq.parent_irq_map = &ixp4xx_gpiomap;
+	g->gc.irq.parent_n_irq_maps = ARRAY_SIZE(ixp4xx_gpiomap);
+	ret = gpiochip_irqchip_add(&g->gc, &ixp4xx_gpio_irqchip,
+				   0, handle_bad_irq,
+				   IRQ_TYPE_NONE);
+        if (ret) {
+		dev_info(dev, "could not add irqchip\n");
+		irq_domain_free_fwnode(g->fwnode);
+		return -ENODEV;
+        }
+	gpiochip_set_hierarchical_irqchip(&g->gc, &ixp4xx_gpio_irqchip);
 
 	platform_set_drvdata(pdev, g);
 	dev_info(dev, "IXP4 GPIO @%p registered\n", g->base);
-- 
2.20.1

