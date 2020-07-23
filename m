Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC1222AC14
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 12:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgGWKDU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 06:03:20 -0400
Received: from mga03.intel.com ([134.134.136.65]:1494 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728234AbgGWKDU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 06:03:20 -0400
IronPort-SDR: vkKEu+rcROaRaTcaNbshnowUPMWMg3QlraKr3GbieQHnjQ+XYrgqall1rxUiV4GVBn836cLhe3
 +qnDf5iAP3Pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="150479763"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="150479763"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 03:03:19 -0700
IronPort-SDR: Mo9g3aqn+5pESbGSA+ASuLdLj4ZXqCS0K16NlHhCzhJf+HIO3tLFI4k2zdn6TmF0T/uTj3bdwU
 dx41dlQknhrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="362998701"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 23 Jul 2020 03:03:17 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jyY4L-003QHj-2p; Thu, 23 Jul 2020 13:03:17 +0300
Date:   Thu, 23 Jul 2020 13:03:17 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
Message-ID: <20200723100317.GJ3703480@smile.fi.intel.com>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 04:38:55AM +0300, Serge Semin wrote:
> GPIO-lib provides a ready-to-use interface to initialize an IRQ-chip on
> top of a GPIO chip. It's better from maintainability and readability
> point of view to use one instead of supporting a hand-written Generic
> IRQ-chip-based implementation. Moreover the new implementation won't
> cause much functional overhead but will provide a cleaner driver code.
> All of that makes the DW APB GPIO driver conversion pretty much justified
> especially seeing a tendency of the other GPIO drivers getting converted
> too.
> 
> Here is what we do in the framework of this commit to convert the driver
> to using the GPIO-lib-based IRQ-chip interface:
> 1) IRQ ack, mask and unmask callbacks are locally defined instead of
> using the Generic IRQ-chip ones.
> 2) An irq_chip structure instance is embedded into the dwapb_gpio
> private data. Note we can't have a static instance of that structure since
> GPIO-lib will add some hooks into it by calling gpiochip_set_irq_hooks().
> A warning about that would have been printed by the GPIO-lib code if we
> used a single irq_chip structure instance for multiple DW APB GPIO
> controllers.
> 3) Initialize the gpio_irq_chip structure embedded into the gpio_chip
> descriptor. By default there is no IRQ enabled so any event raised will be
> handled by the handle_bad_irq() IRQ flow handler. If DW APB GPIO IP-core
> is synthesized to have non-shared reference IRQ-lines, then as before the
> hierarchical and cascaded cases are distinguished by checking how many
> parental IRQs are defined. (Note irq_set_chained_handler_and_data() won't
> initialize IRQs, which descriptors couldn't be found.) If DW APB GPIO IP
> is used on a platform with shared IRQ line, then we simply won't let the
> GPIO-lib to initialize the parental IRQs, but will handle them locally in
> the driver.
> 4) Discard linear IRQ-domain and Generic IRQ-chip initialization, since
> GPIO-lib IRQ-chip interface will create a new domain and accept a standard
> IRQ-chip structure pointer based on the setting we provided in the
> gpio_irq_chip structure.
> 5) Manually select a proper IRQ flow handler directly in the
> irq_set_type() callback by calling irq_set_handler_locked() method, since
> an ordinary (not Generic) irq_chip descriptor is now utilized.

Can you also emphasize that this make no regression to the 6a2f4b7dadd5 ("gpio:
dwapb: use a second irq chip")?

(And I hope you have means to test that scenario, because in my case I have
 only one IRQ and it's actually as input from other GPIO IRQ chip).

> 6) Discard the custom GPIO-to-IRQ mapping function since GPIO-lib defines
> the standard method gpiochip_to_irq(), which will be used anyway no matter
> whether the custom to_irq callback is specified or not.
> 7) Discard the acpi_gpiochip_{request,free}_interrupts()
> invocations, since they will be called from
> gpiochip_add_irqchip()/gpiochip_irqchip_remove() anyway.
> 8) Alter CONFIG_GPIO_DWAPB kernel config to select
> CONFIG_GPIOLIB_IRQCHIP instead of CONFIG_GENERIC_IRQ_CHIP.

I like the idea, but is it possible to split this?

...

>  static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  {
> -	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
> -	struct dwapb_gpio *gpio = igc->private;
> -	struct gpio_chip *gc = &gpio->ports[0].gc;
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
>  	irq_hw_number_t bit = irqd_to_hwirq(d);
>  	unsigned long level, polarity, flags;
> +	irq_flow_handler_t handler;
>  
>  	if (type & ~IRQ_TYPE_SENSE_MASK)
>  		return -EINVAL;
> @@ -274,26 +304,31 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  	case IRQ_TYPE_EDGE_BOTH:
>  		level |= BIT(bit);
>  		dwapb_toggle_trigger(gpio, bit);
> +		handler = handle_edge_irq;
>  		break;
>  	case IRQ_TYPE_EDGE_RISING:
>  		level |= BIT(bit);
>  		polarity |= BIT(bit);
> +		handler = handle_edge_irq;
>  		break;
>  	case IRQ_TYPE_EDGE_FALLING:
>  		level |= BIT(bit);
>  		polarity &= ~BIT(bit);
> +		handler = handle_edge_irq;
>  		break;
>  	case IRQ_TYPE_LEVEL_HIGH:
>  		level &= ~BIT(bit);
>  		polarity |= BIT(bit);
> +		handler = handle_level_irq;
>  		break;
>  	case IRQ_TYPE_LEVEL_LOW:
>  		level &= ~BIT(bit);
>  		polarity &= ~BIT(bit);
> +		handler = handle_level_irq;
>  		break;
>  	}
>  
> -	irq_setup_alt_chip(d, type);
> +	irq_set_handler_locked(d, handler);

Can we rather do like other GPIO IRQ chip implementations are doing, i.e.
instead of repeating same handler in each branch, use one conditional:

	if (type & IRQ_TYPE_LEVEL_MASK) {
		...
		irq_set_handler_locked(d, handle_level_irq);
	} else if (type & IRQ_TYPE_EDGE_BOTH) {
		...
		irq_set_handler_locked(d, handle_edge_irq);
	}

?

...

> +		/*
> +		 * If more than one IRQ line is specified then try to
> +		 * initialize the hierarchical interrupts. Otherwise it's
> +		 * a simple cascaded case with a common IRQ signal.
> +		 */
> +		girq->num_parents = pp->irq[1] ? pp->ngpio : 1;

Can it be sparse in the array? (It's actually the main point why I went with
memchr_inv() instead of doing something like above)

> +		girq->parents = pp->irq;
> +		girq->parent_handler_data = gpio;
> +		girq->parent_handler = dwapb_irq_handler;

...

+ blank line.

> +		/* This will let us handle the parent IRQ in the driver */
> +		girq->parents = NULL;
> +		girq->num_parents = 0;
> +		girq->parent_handler = NULL;

Shan't we do this before request_irq() call (at least for consistency with the
rest of the drivers)?

-- 
With Best Regards,
Andy Shevchenko


