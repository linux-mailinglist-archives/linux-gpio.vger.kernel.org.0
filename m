Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509F1233495
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 16:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgG3OiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 10:38:25 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56878 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgG3OiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 10:38:25 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id DBADF80045E5;
        Thu, 30 Jul 2020 14:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KpegvUn9Uau9; Thu, 30 Jul 2020 17:38:21 +0300 (MSK)
Date:   Thu, 30 Jul 2020 17:38:20 +0300
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
Subject: Re: [PATCH v2 05/10] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
Message-ID: <20200730143820.suneapi2ilp34nat@mobilestation>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
 <20200730135536.19747-6-Sergey.Semin@baikalelectronics.ru>
 <20200730142618.GM3703480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200730142618.GM3703480@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2020 at 05:26:18PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 30, 2020 at 04:55:31PM +0300, Serge Semin wrote:
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
> 

> Easy to read if you put blank lines in between of items.

Ok.

> 
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
> > an ordinary (not Generic) irq_chip descriptor is now utilized. Note this
> > shalln't give any regression
> > 6) Alter CONFIG_GPIO_DWAPB kernel config to select
> > CONFIG_GPIOLIB_IRQCHIP instead of CONFIG_GENERIC_IRQ_CHIP.
> > 
> > Note neither 4) nor 5) shall cause a regression of commit 6a2f4b7dadd5
> > ("gpio: dwapb: use a second irq chip"), since the later isn't properly
> > used here anyway.
> 
> ...
> 
> >  struct dwapb_gpio_port {
> >  	struct gpio_chip	gc;
> > +	unsigned int		nr_irqs;
> > +	unsigned int		irq[DWAPB_MAX_GPIOS];
> > +	struct irq_chip		irqchip;
> >  	bool			is_registered;
> >  	struct dwapb_gpio	*gpio;
> 

> Isn't it too much wasted memory (imagine 4 port controller)?
> 
> What if we have it in another structure and allocate dynamically?
> 
> struct dwapb_gpio_port_irqchip {
> 	struct irq_chip		irqchip;
> 	unsigned int		nr_irqs;
> 	unsigned int		irq[DWAPB_MAX_GPIOS];
> };

Agree. I have to send a new revision of the series anyway. I'll do that shortly.

-Sergey

> 
> 	...
> 	struct dwapb_gpio_port_irqchip *pirq;
> 	...
> 
> (I agree that IRQ chip is rather property of a port than controller)
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
