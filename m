Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16DA4334A6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 18:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfFCQME (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 12:12:04 -0400
Received: from foss.arm.com ([217.140.101.70]:54940 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727501AbfFCQMD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Jun 2019 12:12:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5313E80D;
        Mon,  3 Jun 2019 09:12:02 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 845DB3F5AF;
        Mon,  3 Jun 2019 09:12:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] RFC: gpio: Add support for hierarchical IRQ domains
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
References: <20190602205424.28674-1-linus.walleij@linaro.org>
From:   Marc Zyngier <marc.zyngier@arm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marc.zyngier@arm.com; prefer-encrypt=mutual; keydata=
 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
Organization: ARM Ltd
Message-ID: <2c14f320-41e8-6e66-6c6f-7fcc7ab65793@arm.com>
Date:   Mon, 3 Jun 2019 17:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190602205424.28674-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/06/2019 21:54, Linus Walleij wrote:
> Hierarchical IRQ domains can be used to stack different IRQ
> controllers on top of each other.
> 
> Bring hierarchical IRQ domains into the GPIOLIB core with the
> following basic idea:
> 
> Drivers that need their interrupts handled hierarchically
> specify a map of one element per interrupt where the hwirq
> on the GPIO chip is mapped to the hwirq on the parent irqchip
> along with type. Users have to pass the interrupt map, fwnode,
> and parent irqdomain before calling gpiochip_irqchip_add().
> The consumer will then call gpiochio_set_hierarchical_irqchip()
> analogous to the earlier functions for chained and nested
> irqchips.
> 
> The code path for device tree is pretty straight-forward,
> while the code path for old boardfiles or anything else will
> be more convoluted requireing upfront allocation of the
> interrupts when adding the chip.
> 
> One specific use-case where this can be useful is if a power
> management controller has top-level controls for wakeup
> interrupts. In such cases, the power management controller can be a
> parent to other interrupt controllers and program additional
> registers when an IRQ has its wake capability enabled or disabled.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
> Cc: Bitan Biswas <bbiswas@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This is my idea for deeper integration of hierarchical irqs
> into the gpiolib core. Admittedly based on my own IXP4xx
> driver which is provided as an example conversion in
> patch 2/2, let me know what you think. Based on heavy patching
> on top of Thierry's patch, not mangled beyond recognition,
> sorry for that, I just wanted to convey my idea here.
> ---
>  drivers/gpio/Kconfig        |   1 +
>  drivers/gpio/gpiolib.c      | 218 ++++++++++++++++++++++++++++++++++--
>  include/linux/gpio/driver.h |  54 +++++++++
>  3 files changed, 266 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 3d17d40fa635..23a121c2e176 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -45,6 +45,7 @@ config GPIO_ACPI
>  
>  config GPIOLIB_IRQCHIP
>  	select IRQ_DOMAIN
> +	select IRQ_DOMAIN_HIERARCHY
>  	bool
>  
>  config DEBUG_GPIO
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e013d417a936..f976e95e54f5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1718,6 +1718,175 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
>  
> +/**
> + * gpiochip_set_hierarchical_irqchip() - connects a hierarchical irqchip
> + * to a gpiochip
> + * @gpiochip: the gpiochip to set the irqchip hierarchical handler to
> + * @irqchip: the irqchip to handle this level of the hierarchy, the interrupt
> + * will then percolate up to the parent
> + */
> +void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gpiochip,
> +				       struct irq_chip *irqchip)
> +{
> +	if (!gpiochip->irq.domain) {
> +		chip_err(gpiochip, "called %s before setting up irqchip\n",
> +			 __func__);
> +		return;
> +	}
> +	if (!gpiochip->irq.parent_domain) {
> +		chip_err(gpiochip, "tried to create a hierarchy on non-hierarchical GPIO irqchip\n");
> +		return;
> +	}
> +	/* DT will deal with mapping each IRQ as we go along */
> +	if (is_of_node(gpiochip->irq.fwnode))
> +		return;
> +
> +	/*
> +	 * This is for legacy and boardfile "irqchip" fwnodes: allocate
> +	 * irqs upfront instead of dynamically since we don't have the
> +	 * dynamic type of allocation that hardware description languages
> +	 * provide.
> +	 */
> +	if (is_fwnode_irqchip(gpiochip->irq.fwnode)) {

How about ACPI-based systems? Do they even exist in this scheme? This is
a genuine question, as I have no idea...

> +		int i;
> +		int ret;
> +
> +		for (i = 0; i < gpiochip->irq.parent_n_irq_maps; i++) {
> +			const struct gpiochip_hierarchy_map *map =
> +				&gpiochip->irq.parent_irq_map[i];
> +			struct irq_fwspec fwspec;
> +
> +			fwspec.fwnode = gpiochip->irq.fwnode;
> +			/* This is the hwirq for the GPIO line side of things */
> +			fwspec.param[0] = map->hwirq;
> +			/* Just pick something */
> +			fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
> +			fwspec.param_count = 2;
> +			ret = __irq_domain_alloc_irqs(gpiochip->irq.domain,
> +						      /* just pick something */
> +						      -1,
> +						      1,
> +						      NUMA_NO_NODE,
> +						      &fwspec,

It feels a bit odd that we're building a fwspec for something that
already has all the required information (the alloc function has the
gpio_irq_chip as host_data). I have the feeling that we could just have
a single __irq_domain_alloc_irqs() call with irq.parent_n_irq_maps as
the nr_irqs, and let the alloc function sort it out...

> +						      false,
> +						      NULL);
> +			if (ret < 0) {
> +				chip_err(gpiochip,
> +					 "can not allocate irq for GPIO line %d parent hwirq %d in hierarchy domain: %d\n",
> +					 map->hwirq, map->parent_hwirq,
> +					 ret);
> +			}
> +		}
> +	}
> +
> +	chip_err(gpiochip, "%s unknown fwnode type proceed anyway\n", __func__);
> +
> +	return;
> +}
> +EXPORT_SYMBOL_GPL(gpiochip_set_hierarchical_irqchip);
> +
> +static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
> +						   struct irq_fwspec *fwspec,
> +						   unsigned long *hwirq,
> +						   unsigned int *type)
> +{
> +	/* We support standard DT translation */
> +	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> +		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> +	}
> +
> +	/* This is for board files and others not using DT */
> +	if (is_fwnode_irqchip(fwspec->fwnode)) {
> +		int ret;
> +
> +		ret = irq_domain_translate_twocell(d, fwspec, hwirq, type);
> +		if (ret)
> +			return ret;
> +		WARN_ON(*type == IRQ_TYPE_NONE);
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
> +					       unsigned int irq,
> +					       unsigned int nr_irqs,
> +					       void *data)
> +{
> +	struct gpio_chip *chip = d->host_data;
> +	irq_hw_number_t hwirq;
> +	unsigned int type = IRQ_TYPE_NONE;
> +	struct irq_fwspec *fwspec = data;
> +	int ret;
> +	int i;
> +
> +	ret = gpiochip_hierarchy_irq_domain_translate(d, fwspec, &hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	chip_info(chip, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
> +		  irq, irq + nr_irqs - 1,
> +		  hwirq, hwirq + nr_irqs - 1);
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct irq_fwspec parent_fwspec;
> +		const struct gpiochip_hierarchy_map *map = NULL;
> +		int j;
> +
> +		/* Find the map, maybe not all lines support IRQs */
> +		for (j = 0; j < chip->irq.parent_n_irq_maps; j++) {
> +			map = &chip->irq.parent_irq_map[j];
> +			if (map->hwirq == hwirq)
> +				break;
> +		}
> +		if (j == chip->irq.parent_n_irq_maps) {
> +			chip_err(chip, "can't look up hwirq %lu\n", hwirq);
> +			return -EINVAL;
> +		}
> +		chip_dbg(chip, "found parent hwirq %u\n", map->parent_hwirq);
> +
> +		/*
> +		 * We set handle_bad_irq because the .set_type() should
> +		 * always be invoked and set the right type of handler.
> +		 */
> +		irq_domain_set_info(d,
> +				    irq + i,
> +				    hwirq + i,
> +				    chip->irq.chip,
> +				    chip,
> +				    handle_bad_irq,
> +				    NULL, NULL);
> +		irq_set_probe(irq + i);
> +
> +		/*
> +		 * Create a IRQ fwspec to send up to the parent irqdomain:
> +		 * specify the hwirq we address on the parent and tie it
> +		 * all together up the chain.
> +		 */
> +		parent_fwspec.fwnode = d->parent->fwnode;
> +		parent_fwspec.param_count = 2;
> +		parent_fwspec.param[0] = map->parent_hwirq;
> +		/* This parent only handles asserted level IRQs */
> +		parent_fwspec.param[1] = map->parent_type;
> +		chip_dbg(chip, "alloc_irqs_parent for %d parent hwirq %d\n",
> +			 irq + i, map->parent_hwirq);
> +		ret = irq_domain_alloc_irqs_parent(d, irq + i, 1,
> +						   &parent_fwspec);
> +		if (ret)
> +			chip_err(chip,
> +				 "failed to allocate parent hwirq %d for hwirq %lu\n",
> +				 map->parent_hwirq, hwirq);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops gpiochip_hierarchy_domain_ops = {
> +	.translate = gpiochip_hierarchy_irq_domain_translate,
> +	.alloc = gpiochip_hierarchy_irq_domain_alloc,
> +	.free = irq_domain_free_irqs_common,
> +};
> +
>  /**
>   * gpiochip_irq_map() - maps an IRQ into a GPIO irqchip
>   * @d: the irqdomain used by this irqchip
> @@ -1825,10 +1994,23 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
>  
>  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> +	struct irq_domain *domain = chip->irq.domain;
> +
>  	if (!gpiochip_irqchip_irq_valid(chip, offset))
>  		return -ENXIO;
>  
> -	return irq_create_mapping(chip->irq.domain, offset);
> +	if (irq_domain_is_hierarchy(domain)) {
> +		struct irq_fwspec spec;
> +
> +		spec.fwnode = domain->fwnode;
> +		spec.param_count = 2;
> +		spec.param[0] = offset;
> +		spec.param[1] = IRQ_TYPE_NONE;
> +
> +		return irq_create_fwspec_mapping(&spec);
> +	}
> +
> +	return irq_create_mapping(domain, offset);
>  }
>  
>  static int gpiochip_irq_reqres(struct irq_data *d)
> @@ -1905,7 +2087,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
>  				struct lock_class_key *request_key)
>  {
>  	struct irq_chip *irqchip = gpiochip->irq.chip;
> -	const struct irq_domain_ops *ops;
> +	const struct irq_domain_ops *ops = NULL;
>  	struct device_node *np;
>  	unsigned int type;
>  	unsigned int i;
> @@ -1941,14 +2123,36 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
>  	gpiochip->irq.lock_key = lock_key;
>  	gpiochip->irq.request_key = request_key;
>  
> +	/* Some drivers provide custom irqdomain ops */
>  	if (gpiochip->irq.domain_ops)
>  		ops = gpiochip->irq.domain_ops;

Is that already a requirement? Or an educated guess?

> -	else
> -		ops = &gpiochip_domain_ops;
>  
> -	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
> -						     gpiochip->irq.first,
> -						     ops, gpiochip);
> +	/* If a parent irqdomain is provided, let's build a hierarchy */
> +	if (gpiochip->irq.parent_domain) {
> +		if (!ops)
> +			ops = &gpiochip_hierarchy_domain_ops;
> +		if (!gpiochip->irq.parent_domain ||
> +		    !gpiochip->irq.parent_irq_map ||
> +		    !gpiochip->irq.parent_n_irq_maps ||
> +		    !gpiochip->irq.fwnode) {
> +			chip_err(gpiochip, "missing irqdomain vital data\n");
> +			return -EINVAL;
> +		}
> +		gpiochip->irq.domain = irq_domain_create_hierarchy(
> +			gpiochip->irq.parent_domain,
> +			IRQ_DOMAIN_FLAG_HIERARCHY,
> +			gpiochip->irq.parent_n_irq_maps,
> +			gpiochip->irq.fwnode,
> +			ops,
> +			gpiochip);
> +	} else {
> +		if (!ops)
> +			ops = &gpiochip_domain_ops;
> +		gpiochip->irq.domain = irq_domain_add_simple(np,
> +			gpiochip->ngpio,
> +			gpiochip->irq.first,
> +			ops, gpiochip);
> +	}
>  	if (!gpiochip->irq.domain)
>  		return -EINVAL;
>  
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index a1d273c96016..65193878a0e1 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -22,6 +22,21 @@ enum gpiod_flags;
>  #ifdef CONFIG_GPIOLIB
>  
>  #ifdef CONFIG_GPIOLIB_IRQCHIP
> +
> +/**
> + * struct gpiochip_hierarchy_map - hierarchical IRQ GPIO to parent IRQ map
> + * @hwirq: offset of the GPIO line (irq line) locally on the gpio_chip
> + * @parent_hwirq: hwirq on the parent IRQ controller that this local hardware
> + * irq is mapped to
> + * @parent_type: what type of IRQ the parent uses for this line, such
> + * as most typical IRQ_TYPE_LEVEL_HIGH.
> + */
> +struct gpiochip_hierarchy_map {
> +	int hwirq;
> +	int parent_hwirq;
> +	unsigned int parent_type;
> +};
> +
>  /**
>   * struct gpio_irq_chip - GPIO interrupt controller
>   */
> @@ -48,6 +63,42 @@ struct gpio_irq_chip {
>  	 */
>  	const struct irq_domain_ops *domain_ops;
>  
> +	/**
> +	 * @fwnode:
> +	 *
> +	 * Firmware node corresponding to this gpiochip/irqchip, necessary
> +	 * for hierarchical irqdomain support.
> +	 */
> +	struct fwnode_handle *fwnode;
> +
> +	/**
> +	 * @parent_domain:
> +	 *
> +	 * If non-NULL, will be set as the parent of this GPIO interrupt
> +	 * controller's IRQ domain to establish a hierarchical interrupt
> +	 * domain. The presence of this will activate the hierarchical
> +	 * interrupt support.
> +	 */
> +	struct irq_domain *parent_domain;
> +
> +	/**
> +	 * @parent_irq_map:
> +	 *
> +	 * This should contain an array defining the maps between any hardware
> +	 * GPIO line on the gpio_chip and the corresponding hardware IRQ on the
> +	 * parent IRQ controller (irqchip) and the parent IRQ type for the
> +	 * line when using hierarchical interrupts.
> +	 */
> +	const struct gpiochip_hierarchy_map *parent_irq_map;
> +
> +	/**
> +	 * @parent_n_irq_maps:
> +	 *
> +	 * The number of parent irq map tuples in the array above, used for
> +	 * hierarchical interrupt support.
> +	 */
> +	int parent_n_irq_maps;
> +
>  	/**
>  	 * @handler:
>  	 *
> @@ -489,6 +540,9 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
>  		struct irq_chip *irqchip,
>  		unsigned int parent_irq);
>  
> +void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gpiochip,
> +				       struct irq_chip *irqchip);
> +
>  int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
>  			     struct irq_chip *irqchip,
>  			     unsigned int first_irq,
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
