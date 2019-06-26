Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFEE57350
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 23:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfFZVJL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 17:09:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50828 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFZVJK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 17:09:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EEA6E60A97; Wed, 26 Jun 2019 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561583348;
        bh=t5kOqAAD9D4Hi1u6Frhbe87Yv6iQ1DEzUEt0fk0J/Fo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dBlLA0Eyo098tifYlDxfqFCk+Qb1rzRduMGPQdxRFnBGpy7aRed5b3SeMW3l9pPsP
         Vw15eYiReNZs5rixGUOfjTpP3vCViOrn76CSGrYLHGfLCAenUsbqQtlTO3XXh4WSW4
         HLrpdtHTbjqjbQwlZq+LQTJwIW5T7KCVBFAM37OU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A1B6601E7;
        Wed, 26 Jun 2019 21:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561583341;
        bh=t5kOqAAD9D4Hi1u6Frhbe87Yv6iQ1DEzUEt0fk0J/Fo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OFS3LCyIVgAJe5L8BbaMz9gj3vUYAGiy63HN1l0ctfkPgglfG468xZevWi+siQ1Gp
         lFya3bihyKh/dz0gf187Vn8/qtpM9cb4tiKMd/deEBVRWgcwOD6FC9KCvL5eZge1JB
         v0rUJb8/1QJc0PRC3lTW9KMhx5thJV7MxpViPod0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A1B6601E7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Wed, 26 Jun 2019 15:09:00 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Brian Masney <masneyb@onstation.org>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190626210900.GA1629@codeaurora.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190624132531.6184-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for the patch Linus. I was running into the warning in
gpiochip_set_irq_hooks(), because it was called from two places.
Hopefully, this will fix that as well. I will give it a try.

On Mon, Jun 24 2019 at 07:29 -0600, Linus Walleij wrote:
>Hierarchical IRQ domains can be used to stack different IRQ
>controllers on top of each other.
>
>Bring hierarchical IRQ domains into the GPIOLIB core with the
>following basic idea:
>
>Drivers that need their interrupts handled hierarchically
>specify a callback to translate the child hardware IRQ and
>IRQ type for each GPIO offset to a parent hardware IRQ and
>parent hardware IRQ type.
>
>Users have to pass the callback, fwnode, and parent irqdomain
>before calling gpiochip_irqchip_add().
>
>We use the new method of just filling in the struct
>gpio_irq_chip before adding the gpiochip for all hierarchical
>irqchips of this type.
>
>The code path for device tree is pretty straight-forward,
>while the code path for old boardfiles or anything else will
>be more convoluted requireing upfront allocation of the
>interrupts when adding the chip.
>
>One specific use-case where this can be useful is if a power
>management controller has top-level controls for wakeup
>interrupts. In such cases, the power management controller can
>be a parent to other interrupt controllers and program
>additional registers when an IRQ has its wake capability
>enabled or disabled.
>
>The hierarchical irqchip helper code will only be available
>when IRQ_DOMAIN_HIERARCHY is selected to GPIO chips using
>this should select or depend on that symbol. When using
>hierarchical IRQs, the parent interrupt controller must
>also be hierarchical all the way up to the top interrupt
>controller wireing directly into the CPU, so on systems
>that do not have this we can get rid of all the extra
>code for supporting hierarchical irqs.
>
>Cc: Thomas Gleixner <tglx@linutronix.de>
>Cc: Marc Zyngier <marc.zyngier@arm.com>
>Cc: Lina Iyer <ilina@codeaurora.org>
>Cc: Jon Hunter <jonathanh@nvidia.com>
>Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
>Cc: Bitan Biswas <bbiswas@nvidia.com>
>Cc: linux-tegra@vger.kernel.org
>Cc: David Daney <david.daney@cavium.com>
>Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>Cc: Brian Masney <masneyb@onstation.org>
>Signed-off-by: Thierry Reding <treding@nvidia.com>
>Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>---
>ChangeLog RFC->v1:
>- Tested on real hardware
>- Incorporate Thierry's idea to have a translation callback.
>  He was right about this approach, I was wrong in insisting
>  on IRQ maps.
>---
> Documentation/driver-api/gpio/driver.rst | 120 ++++++++--
> drivers/gpio/gpiolib.c                   | 285 ++++++++++++++++++++++-
> include/linux/gpio/driver.h              |  46 ++++
> 3 files changed, 426 insertions(+), 25 deletions(-)
>
>diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
>index 1ce7fcd0f989..3099c7fbefdb 100644
>--- a/Documentation/driver-api/gpio/driver.rst
>+++ b/Documentation/driver-api/gpio/driver.rst
>@@ -259,7 +259,7 @@ most often cascaded off a parent interrupt controller, and in some special
> cases the GPIO logic is melded with a SoC's primary interrupt controller.
>
> The IRQ portions of the GPIO block are implemented using an irq_chip, using
>-the header <linux/irq.h>. So basically such a driver is utilizing two sub-
>+the header <linux/irq.h>. So this combined driver is utilizing two sub-
> systems simultaneously: gpio and irq.
>
> It is legal for any IRQ consumer to request an IRQ from any irqchip even if it
>@@ -391,14 +391,108 @@ Infrastructure helpers for GPIO irqchips
> ----------------------------------------
>
> To help out in handling the set-up and management of GPIO irqchips and the
>-associated irqdomain and resource allocation callbacks, the gpiolib has
>-some helpers that can be enabled by selecting the GPIOLIB_IRQCHIP Kconfig
>-symbol:
>-
>-- gpiochip_irqchip_add(): adds a chained cascaded irqchip to a gpiochip. It
>-  will pass the struct gpio_chip* for the chip to all IRQ callbacks, so the
>-  callbacks need to embed the gpio_chip in its state container and obtain a
>-  pointer to the container using container_of().
>+associated irqdomain and resource allocation callbacks. These are activated
>+by selecting the Kconfig symbol GPIOLIB_IRQCHIP. If the symbol
>+IRQ_DOMAIN_HIERARCHY is also selected, hierarchical helpers will also be
>+provided. A big portion of overhead code will be managed by gpiolib,
>+under the assumption that your interrupts are 1-to-1-mapped to the
>+GPIO line index:
>+
>+  GPIO line offset   Hardware IRQ
>+  0                  0
>+  1                  1
>+  2                  2
>+  ...                ...
>+  ngpio-1            ngpio-1
>+
>+If some GPIO lines do not have corresponding IRQs, the bitmask valid_mask
>+and the flag need_valid_mask in gpio_irq_chip can be used to mask off some
>+lines as invalid for associating with IRQs.
>+
>+The preferred way to set up the helpers is to fill in the
>+struct gpio_irq_chip inside struct gpio_chip before adding the gpio_chip.
>+If you do this, the additional irq_chip will be set up by gpiolib at the
>+same time as setting up the rest of the GPIO functionality. The following
>+is a typical example of a cascaded interrupt handler using gpio_irq_chip:
>+
>+  /* Typical state container with dynamic irqchip */
>+  struct my_gpio {
>+      struct gpio_chip gc;
>+      struct irq_chip irq;
>+  };
>+
>+  int irq; /* from platform etc */
>+  struct my_gpio *g;
>+  struct gpio_irq_chip *girq
>+
>+  /* Set up the irqchip dynamically */
>+  g->irq.name = "my_gpio_irq";
>+  g->irq.irq_ack = my_gpio_ack_irq;
>+  g->irq.irq_mask = my_gpio_mask_irq;
>+  g->irq.irq_unmask = my_gpio_unmask_irq;
>+  g->irq.irq_set_type = my_gpio_set_irq_type;
>+
>+  /* Get a pointer to the gpio_irq_chip */
>+  girq = &g->gc.irq;
>+  girq->chip = &g->irq;
>+  girq->parent_handler = ftgpio_gpio_irq_handler;
>+  girq->num_parents = 1;
>+  girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
>+                               GFP_KERNEL);
Could this be folded into the gpiolib?

>+  if (!girq->parents)
>+      return -ENOMEM;
>+  girq->default_type = IRQ_TYPE_NONE;
>+  girq->handler = handle_bad_irq;
>+  girq->parents[0] = irq;
>+
>+  return devm_gpiochip_add_data(dev, &g->gc, g);
>+
>+The helper support using hierarchical interrupt controllers as well.
>+In this case the typical set-up will look like this:
>+
>+  /* Typical state container with dynamic irqchip */
>+  struct my_gpio {
>+      struct gpio_chip gc;
>+      struct irq_chip irq;
>+      struct fwnode_handle *fwnode;
>+  };
>+
>+  int irq; /* from platform etc */
>+  struct my_gpio *g;
>+  struct gpio_irq_chip *girq
>+
>+  /* Set up the irqchip dynamically */
>+  g->irq.name = "my_gpio_irq";
>+  g->irq.irq_ack = my_gpio_ack_irq;
>+  g->irq.irq_mask = my_gpio_mask_irq;
>+  g->irq.irq_unmask = my_gpio_unmask_irq;
>+  g->irq.irq_set_type = my_gpio_set_irq_type;
>+
>+  /* Get a pointer to the gpio_irq_chip */
>+  girq = &g->gc.irq;
>+  girq->chip = &g->irq;
>+  girq->default_type = IRQ_TYPE_NONE;
>+  girq->handler = handle_bad_irq;
>+  girq->fwnode = g->fwnode;
>+  girq->parent_domain = parent;
>+  girq->child_to_parent_hwirq = my_gpio_child_to_parent_hwirq;
>+
Should be the necessary, if the driver implements it's own .alloc?

>+  return devm_gpiochip_add_data(dev, &g->gc, g);
>+
>+As you can see pretty similar, but you do not supply a parent handler for
>+the IRQ, instead a parent irqdomain, an fwnode for the hardware and
>+a funcion .child_to_parent_hwirq() that has the purpose of looking up
>+the parent hardware irq from a child (i.e. this gpio chip) hardware irq.
>+As always it is good to look at examples in the kernel tree for advice
>+on how to find the required pieces.
>+
>+The old way of adding irqchips to gpiochips after registration is also still
>+available but we try to move away from this:
>+
>+- DEPRECATED: gpiochip_irqchip_add(): adds a chained cascaded irqchip to a
>+  gpiochip. It will pass the struct gpio_chip* for the chip to all IRQ
>+  callbacks, so the callbacks need to embed the gpio_chip in its state
>+  container and obtain a pointer to the container using container_of().
>   (See Documentation/driver-model/design-patterns.txt)
>
> - gpiochip_irqchip_add_nested(): adds a nested cascaded irqchip to a gpiochip,
>@@ -406,10 +500,10 @@ symbol:
>   cascaded irq has to be handled by a threaded interrupt handler.
>   Apart from that it works exactly like the chained irqchip.
>
>-- gpiochip_set_chained_irqchip(): sets up a chained cascaded irq handler for a
>-  gpio_chip from a parent IRQ and passes the struct gpio_chip* as handler
>-  data. Notice that we pass is as the handler data, since the irqchip data is
>-  likely used by the parent irqchip.
>+- DEPRECATED: gpiochip_set_chained_irqchip(): sets up a chained cascaded irq
>+  handler for a gpio_chip from a parent IRQ and passes the struct gpio_chip*
>+  as handler data. Notice that we pass is as the handler data, since the
>+  irqchip data is likely used by the parent irqchip.
>
> - gpiochip_set_nested_irqchip(): sets up a nested cascaded irq handler for a
>   gpio_chip from a parent IRQ. As the parent IRQ has usually been
>diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>index e013d417a936..af72ffa02963 100644
>--- a/drivers/gpio/gpiolib.c
>+++ b/drivers/gpio/gpiolib.c
>@@ -1718,6 +1718,240 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
> }
> EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
>
>+#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
>+
>+/**
>+ * gpiochip_set_hierarchical_irqchip() - connects a hierarchical irqchip
>+ * to a gpiochip
>+ * @gc: the gpiochip to set the irqchip hierarchical handler to
>+ * @irqchip: the irqchip to handle this level of the hierarchy, the interrupt
>+ * will then percolate up to the parent
>+ */
>+static void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gc,
>+					      struct irq_chip *irqchip)
>+{
>+	/* DT will deal with mapping each IRQ as we go along */
>+	if (is_of_node(gc->irq.fwnode))
>+		return;
>+
>+	/*
>+	 * This is for legacy and boardfile "irqchip" fwnodes: allocate
>+	 * irqs upfront instead of dynamically since we don't have the
>+	 * dynamic type of allocation that hardware description languages
>+	 * provide. Once all GPIO drivers using board files are gone from
>+	 * the kernel we can delete this code, but for a transitional period
>+	 * it is necessary to keep this around.
>+	 */
>+	if (is_fwnode_irqchip(gc->irq.fwnode)) {
>+		int i;
>+		int ret;
>+
>+		for (i = 0; i < gc->ngpio; i++) {
>+			struct irq_fwspec fwspec;
>+			unsigned int parent_hwirq;
>+			unsigned int parent_type;
>+			struct gpio_irq_chip *girq = &gc->irq;
>+
>+			/*
>+			 * We call the child to parent translation function
>+			 * only to check if the child IRQ is valid or not.
>+			 * Just pick the rising edge type here as that is what
>+			 * we likely need to support.
>+			 */
>+			ret = girq->child_to_parent_hwirq(gc, i,
>+							  IRQ_TYPE_EDGE_RISING,
>+							  &parent_hwirq,
>+							  &parent_type);
>+			if (ret) {
>+				chip_err(gc, "skip set-up on hwirq %d\n",
>+					 i);
>+				continue;
>+			}
>+
>+			fwspec.fwnode = gc->irq.fwnode;
>+			/* This is the hwirq for the GPIO line side of things */
>+			fwspec.param[0] = i;
>+			/* Just pick something */
>+			fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
>+			fwspec.param_count = 2;
>+			ret = __irq_domain_alloc_irqs(gc->irq.domain,
>+						      /* just pick something */
>+						      -1,
>+						      1,
>+						      NUMA_NO_NODE,
>+						      &fwspec,
>+						      false,
>+						      NULL);
>+			if (ret < 0) {
>+				chip_err(gc,
>+					 "can not allocate irq for GPIO line %d parent hwirq %d in hierarchy domain: %d\n",
>+					 i, parent_hwirq,
>+					 ret);
>+			}
>+		}
>+	}
>+
>+	chip_err(gc, "%s unknown fwnode type proceed anyway\n", __func__);
>+
>+	return;
>+}
>+
>+static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
>+						   struct irq_fwspec *fwspec,
>+						   unsigned long *hwirq,
>+						   unsigned int *type)
>+{
>+	/* We support standard DT translation */
>+	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
>+		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
>+	}
>+
>+	/* This is for board files and others not using DT */
>+	if (is_fwnode_irqchip(fwspec->fwnode)) {
>+		int ret;
>+
>+		ret = irq_domain_translate_twocell(d, fwspec, hwirq, type);
>+		if (ret)
>+			return ret;
>+		WARN_ON(*type == IRQ_TYPE_NONE);
>+		return 0;
>+	}
>+	return -EINVAL;
>+}
>+
>+static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
>+					       unsigned int irq,
>+					       unsigned int nr_irqs,
>+					       void *data)
>+{
>+	struct gpio_chip *gc = d->host_data;
>+	irq_hw_number_t hwirq;
>+	unsigned int type = IRQ_TYPE_NONE;
>+	struct irq_fwspec *fwspec = data;
>+	int ret;
>+	int i;
>+
>+	chip_info(gc, "called %s\n", __func__);
>+
>+	ret = gpiochip_hierarchy_irq_domain_translate(d, fwspec, &hwirq, &type);
>+	if (ret)
>+		return ret;
>+
>+	chip_info(gc, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
>+		  irq, irq + nr_irqs - 1,
>+		  hwirq, hwirq + nr_irqs - 1);
>+
>+	for (i = 0; i < nr_irqs; i++) {
>+		struct irq_fwspec parent_fwspec;
>+		unsigned int parent_hwirq;
>+		unsigned int parent_type;
>+		struct gpio_irq_chip *girq = &gc->irq;
>+
>+		ret = girq->child_to_parent_hwirq(gc, hwirq, type,
>+						  &parent_hwirq, &parent_type);
>+		if (ret) {
>+			chip_err(gc, "can't look up hwirq %lu\n", hwirq);
>+			return ret;
>+		}
>+		chip_info(gc, "found parent hwirq %u\n", parent_hwirq);
>+
>+		/*
>+		 * We set handle_bad_irq because the .set_type() should
>+		 * always be invoked and set the right type of handler.
>+		 */
>+		irq_domain_set_info(d,
>+				    irq + i,
>+				    hwirq + i,
>+				    gc->irq.chip,
>+				    gc,
>+				    handle_bad_irq,
>+				    NULL, NULL);
>+		irq_set_probe(irq + i);
>+
>+		/*
>+		 * Create a IRQ fwspec to send up to the parent irqdomain:
>+		 * specify the hwirq we address on the parent and tie it
>+		 * all together up the chain.
>+		 */
>+		parent_fwspec.fwnode = d->parent->fwnode;
>+		parent_fwspec.param_count = 2;
>+		parent_fwspec.param[0] = parent_hwirq;
>+		/* This parent only handles asserted level IRQs */
>+		parent_fwspec.param[1] = parent_type;
>+		chip_info(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
>+			  irq + i, parent_hwirq);
>+		ret = irq_domain_alloc_irqs_parent(d, irq + i, 1,
>+						   &parent_fwspec);
>+		if (ret)
>+			chip_err(gc,
>+				 "failed to allocate parent hwirq %d for hwirq %lu\n",
>+				 parent_hwirq, hwirq);
>+	}
>+
>+	return 0;
>+}
>+
>+static const struct irq_domain_ops gpiochip_hierarchy_domain_ops = {
>+	.activate = gpiochip_irq_domain_activate,
>+	.deactivate = gpiochip_irq_domain_deactivate,
>+	.translate = gpiochip_hierarchy_irq_domain_translate,
>+	.alloc = gpiochip_hierarchy_irq_domain_alloc,
>+	.free = irq_domain_free_irqs_common,
>+};
>+
>+static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
>+{
>+	if (!gc->irq.parent_domain) {
>+		chip_err(gc, "missing parent irqdomain\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!gc->irq.parent_domain ||
>+	    !gc->irq.child_to_parent_hwirq ||
This should probably be validated if the .ops have not been set.

>+	    !gc->irq.fwnode) {
>+		chip_err(gc, "missing irqdomain vital data\n");
>+		return -EINVAL;
>+	}
>+
>+	gc->irq.domain = irq_domain_create_hierarchy(
>+		gc->irq.parent_domain,
>+		IRQ_DOMAIN_FLAG_HIERARCHY,
>+		gc->ngpio,
>+		gc->irq.fwnode,
>+		&gpiochip_hierarchy_domain_ops,
>+		gc);
>+
>+	if (!gc->irq.domain) {
>+		chip_err(gc, "failed to add hierarchical domain\n");
>+		return -EINVAL;
>+	}
>+
>+	gpiochip_set_hierarchical_irqchip(gc, gc->irq.chip);
>+
>+	chip_info(gc, "set up hierarchical irqdomain\n");
>+
>+	return 0;
>+}
>+
>+static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
>+{
>+	return !!gc->irq.parent_domain;
>+}
>+
>+#else
>+
>+static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
>+{
>+	return -EINVAL;
>+}
>+
>+static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
>+{
>+	return false;
>+}
>+
>+#endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
>+
> /**
>  * gpiochip_irq_map() - maps an IRQ into a GPIO irqchip
>  * @d: the irqdomain used by this irqchip
>@@ -1786,6 +2020,11 @@ static const struct irq_domain_ops gpiochip_domain_ops = {
> 	.xlate	= irq_domain_xlate_twocell,
> };
>
>+/*
>+ * TODO: move these activate/deactivate in under the hierarchicial
>+ * irqchip implementation as static once SPMI and SSBI (all external
>+ * users) are phased over.
>+ */
> /**
>  * gpiochip_irq_domain_activate() - Lock a GPIO to be used as an IRQ
>  * @domain: The IRQ domain used by this IRQ chip
>@@ -1825,10 +2064,23 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
>
> static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
> {
>+	struct irq_domain *domain = chip->irq.domain;
>+
> 	if (!gpiochip_irqchip_irq_valid(chip, offset))
> 		return -ENXIO;
>
>-	return irq_create_mapping(chip->irq.domain, offset);
>+	if (irq_domain_is_hierarchy(domain)) {
>+		struct irq_fwspec spec;
>+
>+		spec.fwnode = domain->fwnode;
>+		spec.param_count = 2;
>+		spec.param[0] = offset;
>+		spec.param[1] = IRQ_TYPE_NONE;
>+
>+		return irq_create_fwspec_mapping(&spec);
>+	}
>+
>+	return irq_create_mapping(domain, offset);
> }
>
> static int gpiochip_irq_reqres(struct irq_data *d)
>@@ -1905,7 +2157,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
> 				struct lock_class_key *request_key)
> {
> 	struct irq_chip *irqchip = gpiochip->irq.chip;
>-	const struct irq_domain_ops *ops;
>+	const struct irq_domain_ops *ops = NULL;
> 	struct device_node *np;
> 	unsigned int type;
> 	unsigned int i;
>@@ -1941,16 +2193,25 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
> 	gpiochip->irq.lock_key = lock_key;
> 	gpiochip->irq.request_key = request_key;
>
>-	if (gpiochip->irq.domain_ops)
>-		ops = gpiochip->irq.domain_ops;
>-	else
>-		ops = &gpiochip_domain_ops;
>-
>-	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
>-						     gpiochip->irq.first,
>-						     ops, gpiochip);
>-	if (!gpiochip->irq.domain)
>-		return -EINVAL;
>+	/* If a parent irqdomain is provided, let's build a hierarchy */
>+	if (gpiochip_hierarchy_is_hierarchical(gpiochip)) {
>+		int ret = gpiochip_hierarchy_add_domain(gpiochip);
>+		if (ret)
>+			return ret;
>+	} else {
>+		/* Some drivers provide custom irqdomain ops */
>+		if (gpiochip->irq.domain_ops)
>+			ops = gpiochip->irq.domain_ops;
>+
>+		if (!ops)
>+			ops = &gpiochip_domain_ops;
>+		gpiochip->irq.domain = irq_domain_add_simple(np,
>+			gpiochip->ngpio,
>+			gpiochip->irq.first,
>+			ops, gpiochip);
>+		if (!gpiochip->irq.domain)
>+			return -EINVAL;
>+	}
>
> 	if (gpiochip->irq.parent_handler) {
> 		void *data = gpiochip->irq.parent_handler_data ?: gpiochip;
>diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
>index a1d273c96016..e32d02cb2d08 100644
>--- a/include/linux/gpio/driver.h
>+++ b/include/linux/gpio/driver.h
>@@ -22,6 +22,9 @@ enum gpiod_flags;
> #ifdef CONFIG_GPIOLIB
>
> #ifdef CONFIG_GPIOLIB_IRQCHIP
>+
>+struct gpio_chip;
>+
> /**
>  * struct gpio_irq_chip - GPIO interrupt controller
>  */
>@@ -48,6 +51,49 @@ struct gpio_irq_chip {
> 	 */
> 	const struct irq_domain_ops *domain_ops;
>
>+#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
>+	/**
>+	 * @fwnode:
>+	 *
>+	 * Firmware node corresponding to this gpiochip/irqchip, necessary
>+	 * for hierarchical irqdomain support.
>+	 */
>+	struct fwnode_handle *fwnode;
>+
>+	/**
>+	 * @parent_domain:
>+	 *
>+	 * If non-NULL, will be set as the parent of this GPIO interrupt
>+	 * controller's IRQ domain to establish a hierarchical interrupt
>+	 * domain. The presence of this will activate the hierarchical
>+	 * interrupt support.
>+	 */
>+	struct irq_domain *parent_domain;
>+
>+	/**
>+	 * @child_to_parent_hwirq:
>+	 *
>+	 * This callback translates a child hardware IRQ offset to a parent
>+	 * hardware IRQ offset on a hierarchical interrupt chip. The child
>+	 * hardware IRQs correspond to the GPIO index 0..ngpio-1 (see the
>+	 * ngpio field of struct gpio_chip) and the corresponding parent
>+	 * hardware IRQ and type (such as IRQ_TYPE_*) shall be returned by
>+	 * the driver. The driver can calculate this from an offset or using
>+	 * a lookup table or whatever method is best for this chip. Return
>+	 * 0 on successful translation in the driver.
>+	 *
>+	 * If some ranges of hardware IRQs do not have a corresponding parent
>+	 * HWIRQ, return -EINVAL, but also make sure to fill in @valid_mask and
>+	 * @need_valid_mask to make these GPIO lines unavailable for
>+	 * translation.
>+	 */
>+	int (*child_to_parent_hwirq)(struct gpio_chip *chip,
>+				     unsigned int child_hwirq,
>+				     unsigned int child_type,
>+				     unsigned int *parent_hwirq,
>+				     unsigned int *parent_type);
Would irq_fwspec(s) be better than passing all these arguments around?

Thanks,
Lina

>+#endif
>+
> 	/**
> 	 * @handler:
> 	 *
>--
>2.21.0
>
