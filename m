Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5143D22D209
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 01:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgGXXD6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 19:03:58 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39416 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgGXXD5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 19:03:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9A8C88040A69;
        Fri, 24 Jul 2020 23:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BeD3xAavDWHc; Sat, 25 Jul 2020 02:03:46 +0300 (MSK)
Date:   Sat, 25 Jul 2020 02:03:42 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
Message-ID: <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200723100317.GJ3703480@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 01:03:17PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 23, 2020 at 04:38:55AM +0300, Serge Semin wrote:
> > GPIO-lib provides a ready-to-use interface to initialize an IRQ-chip on
> > top of a GPIO chip. It's better from maintainability and readability
> > point of view to use one instead of supporting a hand-written Generic
> > IRQ-chip-based implementation. Moreover the new implementation won't
> > cause much functional overhead but will provide a cleaner driver code.
> > All of that makes the DW APB GPIO driver conversion pretty much justified
> > especially seeing a tendency of the other GPIO drivers getting converted
> > too.
> > 
> > Here is what we do in the framework of this commit to convert the driver
> > to using the GPIO-lib-based IRQ-chip interface:
> > 1) IRQ ack, mask and unmask callbacks are locally defined instead of
> > using the Generic IRQ-chip ones.
> > 2) An irq_chip structure instance is embedded into the dwapb_gpio
> > private data. Note we can't have a static instance of that structure since
> > GPIO-lib will add some hooks into it by calling gpiochip_set_irq_hooks().
> > A warning about that would have been printed by the GPIO-lib code if we
> > used a single irq_chip structure instance for multiple DW APB GPIO
> > controllers.
> > 3) Initialize the gpio_irq_chip structure embedded into the gpio_chip
> > descriptor. By default there is no IRQ enabled so any event raised will be
> > handled by the handle_bad_irq() IRQ flow handler. If DW APB GPIO IP-core
> > is synthesized to have non-shared reference IRQ-lines, then as before the
> > hierarchical and cascaded cases are distinguished by checking how many
> > parental IRQs are defined. (Note irq_set_chained_handler_and_data() won't
> > initialize IRQs, which descriptors couldn't be found.) If DW APB GPIO IP
> > is used on a platform with shared IRQ line, then we simply won't let the
> > GPIO-lib to initialize the parental IRQs, but will handle them locally in
> > the driver.
> > 4) Discard linear IRQ-domain and Generic IRQ-chip initialization, since
> > GPIO-lib IRQ-chip interface will create a new domain and accept a standard
> > IRQ-chip structure pointer based on the setting we provided in the
> > gpio_irq_chip structure.
> > 5) Manually select a proper IRQ flow handler directly in the
> > irq_set_type() callback by calling irq_set_handler_locked() method, since
> > an ordinary (not Generic) irq_chip descriptor is now utilized.
> 

> Can you also emphasize that this make no regression to the 6a2f4b7dadd5 ("gpio:
> dwapb: use a second irq chip")?

In fact I don't really see why that commit had been accepted in the first place.
Both level and edge triggered IRQ types are implemented by means of the same
callbacks and the same registers. The only handy thing in our case is the IRQ
flow handler setting in accordance with the requested IRQ type, but that
could be done by just calling irq_set_handler_locked() method without two-types
complication. The commit log says: "So we can have at runtime two users where
one is using edge and the other level." which isn't really correct since if an IRQ
line is shared it can only be requested with the same trigger flags (see the
inline comments in the __setup_irq() method definition). If an IRQ line isn't
shared, then there can't be more than one user.

Am I missing something?

> 
> (And I hope you have means to test that scenario, because in my case I have
>  only one IRQ and it's actually as input from other GPIO IRQ chip).

Alas I have DW APB GPIO with a single IRQ line attached too, so I can't test the
hierarchical case, but only the cascaded one.

> 
> > 6) Discard the custom GPIO-to-IRQ mapping function since GPIO-lib defines
> > the standard method gpiochip_to_irq(), which will be used anyway no matter
> > whether the custom to_irq callback is specified or not.
> > 7) Discard the acpi_gpiochip_{request,free}_interrupts()
> > invocations, since they will be called from
> > gpiochip_add_irqchip()/gpiochip_irqchip_remove() anyway.
> > 8) Alter CONFIG_GPIO_DWAPB kernel config to select
> > CONFIG_GPIOLIB_IRQCHIP instead of CONFIG_GENERIC_IRQ_CHIP.
> 

> I like the idea, but is it possible to split this?

Yeah, 6) and 7) could be unpinned to dedicated patches. Thanks for noticing
this. I'll do that. But leaving the changes described before and not applying 8)
will produce buildable but not working driver. So I'd prefer to leave 8) here.

> 
> ...
> 
> >  static int dwapb_irq_set_type(struct irq_data *d, u32 type)
> >  {
> > -	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
> > -	struct dwapb_gpio *gpio = igc->private;
> > -	struct gpio_chip *gc = &gpio->ports[0].gc;
> > +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
> >  	irq_hw_number_t bit = irqd_to_hwirq(d);
> >  	unsigned long level, polarity, flags;
> > +	irq_flow_handler_t handler;
> >  
> >  	if (type & ~IRQ_TYPE_SENSE_MASK)
> >  		return -EINVAL;
> > @@ -274,26 +304,31 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
> >  	case IRQ_TYPE_EDGE_BOTH:
> >  		level |= BIT(bit);
> >  		dwapb_toggle_trigger(gpio, bit);
> > +		handler = handle_edge_irq;
> >  		break;
> >  	case IRQ_TYPE_EDGE_RISING:
> >  		level |= BIT(bit);
> >  		polarity |= BIT(bit);
> > +		handler = handle_edge_irq;
> >  		break;
> >  	case IRQ_TYPE_EDGE_FALLING:
> >  		level |= BIT(bit);
> >  		polarity &= ~BIT(bit);
> > +		handler = handle_edge_irq;
> >  		break;
> >  	case IRQ_TYPE_LEVEL_HIGH:
> >  		level &= ~BIT(bit);
> >  		polarity |= BIT(bit);
> > +		handler = handle_level_irq;
> >  		break;
> >  	case IRQ_TYPE_LEVEL_LOW:
> >  		level &= ~BIT(bit);
> >  		polarity &= ~BIT(bit);
> > +		handler = handle_level_irq;
> >  		break;
> >  	}
> >  
> > -	irq_setup_alt_chip(d, type);
> > +	irq_set_handler_locked(d, handler);
> 

> Can we rather do like other GPIO IRQ chip implementations are doing, i.e.
> instead of repeating same handler in each branch, use one conditional:
> 
> 	if (type & IRQ_TYPE_LEVEL_MASK) {
> 		...
> 		irq_set_handler_locked(d, handle_level_irq);
> 	} else if (type & IRQ_TYPE_EDGE_BOTH) {
> 		...
> 		irq_set_handler_locked(d, handle_edge_irq);
> 	}
> 
> ?

In fact I've picked up the repeating stuff from another GPIO IRQ driver
./drivers/gpio/gpio-ep93xx.c . But your design of this code I like better.
Thanks for suggesting it.

> 
> ...
> 
> > +		/*
> > +		 * If more than one IRQ line is specified then try to
> > +		 * initialize the hierarchical interrupts. Otherwise it's
> > +		 * a simple cascaded case with a common IRQ signal.
> > +		 */
> > +		girq->num_parents = pp->irq[1] ? pp->ngpio : 1;
> 

> Can it be sparse in the array? (It's actually the main point why I went with
> memchr_inv() instead of doing something like above)

According to the DW APB GPIO databook it can be configured to provide either a
combined IRQ line or multiple interrupt signals for each GPIO. It's up to
the platform which of those signals are connected to an embedded IRQ
controller. So I guess theoretically the array values can be sparse.

Anyway now I see it's rather problematic. I didn't forget about the sparse IRQs
array case. I just thought it would work out-of-box. Before getting your comment
and digging deeper into the IRQ subsystem I had thought that it wasn't a problem
passing invalid IRQ numbers to the irq_set_chained_handler_and_data() especially
seeing zero IRQ number was supposed to be considered as invalid. That method shall
just ignore the invalid IRQs since the method irq_to_desc() calling radix_tree_lookup()
will fail to find a descriptor with invalid IRQ value and return NULL. So after
getting a NULL irq_desc the method irq_set_chained_handler_and_data() would
have stopped setting the handler. But turns out it may work only for
CONFIG_SPARSE_IRQ. If that config isn't enabled, then a very first IRQ
descriptor will be returned for zero IRQ number. That descriptor will be
initialized with the passed parent_handler callback, which isn't what we want.

So in order to fix the problem we could follow either of the next paths:
1) Just make sure the passed IRQs array is not sparse for instance by remapping
   it to be linear.
2) Move "if (gc->irq.parents[i]) irq_set_chained_handler_and_data()" statement to the
   gpiochip_add_irqchip() method.

What to you think? Linus?

> 
> > +		girq->parents = pp->irq;
> > +		girq->parent_handler_data = gpio;
> > +		girq->parent_handler = dwapb_irq_handler;
> 
> ...
> 

> + blank line.

Ok.

> 
> > +		/* This will let us handle the parent IRQ in the driver */
> > +		girq->parents = NULL;
> > +		girq->num_parents = 0;
> > +		girq->parent_handler = NULL;
> 

> Shan't we do this before request_irq() call (at least for consistency with the
> rest of the drivers)?

Technically we shan't. Please elaborate which drivers you are referring to?
Even the recent Linus' series "Use irqchip template" mostly does it in the
same order.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
