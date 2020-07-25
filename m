Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD0422D2D1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 02:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgGYAGI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 20:06:08 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39460 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgGYAGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 20:06:05 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 61EAF8040A69;
        Sat, 25 Jul 2020 00:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kuyiWnH92oZU; Sat, 25 Jul 2020 03:05:58 +0300 (MSK)
Date:   Sat, 25 Jul 2020 03:05:57 +0300
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
Message-ID: <20200725000557.ru4h5twwd4ha4l6x@mobilestation>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723140815.GL3703480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200723140815.GL3703480@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 05:08:15PM +0300, Andy Shevchenko wrote:
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
> > 6) Discard the custom GPIO-to-IRQ mapping function since GPIO-lib defines
> > the standard method gpiochip_to_irq(), which will be used anyway no matter
> > whether the custom to_irq callback is specified or not.
> > 7) Discard the acpi_gpiochip_{request,free}_interrupts()
> > invocations, since they will be called from
> > gpiochip_add_irqchip()/gpiochip_irqchip_remove() anyway.
> > 8) Alter CONFIG_GPIO_DWAPB kernel config to select
> > CONFIG_GPIOLIB_IRQCHIP instead of CONFIG_GENERIC_IRQ_CHIP.
> 
> 
> ...
> 
> One more thing...
> 
> >  static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
> >  {
> > +	struct gpio_chip *gc = &gpio->ports[0].gc;
> >  	unsigned long irq_status;
> >  	irq_hw_number_t hwirq;
> >  
> >  	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
> >  	for_each_set_bit(hwirq, &irq_status, 32) {
> > -		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
> > +		int gpio_irq = gc->to_irq(gc, hwirq);
> 

> Very, very few do this.
> Can we stick with the original one?
> (See plenty of other examples in the GPIO / pin control subsystems.

You are right. After more thorough studying the IRQ-domain code I've found out
that irq_domain_add_simple() provides the on-the-fly mapping creation. We
don't have to call irq_create_mapping() first before using irq_find_mapping().
So the irq_find_mapping(gc->irq.domain, hwirq) method can be freely called here
the same way as the most of the GPIO drivers do. Thanks for noticing this.

-Sergey

> 
> >  		u32 irq_type = irq_get_trigger_type(gpio_irq);
> >  
> >  		generic_handle_irq(gpio_irq);
> 
> 
> >  }
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
