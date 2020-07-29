Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFA4231EDB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 14:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgG2M6s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 08:58:48 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:52606 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2M6r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2020 08:58:47 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id DFBAF8030866;
        Wed, 29 Jul 2020 12:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id F5-UpB_0Hej0; Wed, 29 Jul 2020 15:58:38 +0300 (MSK)
Date:   Wed, 29 Jul 2020 15:58:37 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
Message-ID: <20200729125837.b27ncvd2eeixstba@mobilestation>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com>
 <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
 <CACRpkdZarVTeBbSqZ-N6iGC4fj2-tdtfxuuxJO=YvO29-uHAuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACRpkdZarVTeBbSqZ-N6iGC4fj2-tdtfxuuxJO=YvO29-uHAuA@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 12:22:28AM +0200, Linus Walleij wrote:
> On Sat, Jul 25, 2020 at 1:03 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> 
> > According to the DW APB GPIO databook it can be configured to provide either a
> > combined IRQ line or multiple interrupt signals for each GPIO. It's up to
> > the platform which of those signals are connected to an embedded IRQ
> > controller. So I guess theoretically the array values can be sparse.
> >
> > Anyway now I see it's rather problematic. I didn't forget about the sparse IRQs
> > array case. I just thought it would work out-of-box. Before getting your comment
> > and digging deeper into the IRQ subsystem I had thought that it wasn't a problem
> > passing invalid IRQ numbers to the irq_set_chained_handler_and_data() especially
> > seeing zero IRQ number was supposed to be considered as invalid. That method shall
> > just ignore the invalid IRQs since the method irq_to_desc() calling radix_tree_lookup()
> > will fail to find a descriptor with invalid IRQ value and return NULL. So after
> > getting a NULL irq_desc the method irq_set_chained_handler_and_data() would
> > have stopped setting the handler. But turns out it may work only for
> > CONFIG_SPARSE_IRQ. If that config isn't enabled, then a very first IRQ
> > descriptor will be returned for zero IRQ number. That descriptor will be
> > initialized with the passed parent_handler callback, which isn't what we want.
> 
> Ouch but different beahviour on the outside of the irqchip API depending
> on whether IRQs are sparse or not on some particular system seems to
> be a problem with irqchip reallty, if we wanna get to the bottom of things.
> (paging Marc)
> 
> > So in order to fix the problem we could follow either of the next paths:
> > 1) Just make sure the passed IRQs array is not sparse for instance by remapping
> >    it to be linear.
> > 2) Move "if (gc->irq.parents[i]) irq_set_chained_handler_and_data()" statement to the
> >    gpiochip_add_irqchip() method.
> >
> > What to you think? Linus?
> 

> What about (3) fixing irqchip?
> 
> Else (2), making the code inside gpiolib be careful and skip over
> invalid IRQs.

Sorry for a delay with a response to this issue. I had to give it a more thorough
thought since the problem is a bit more complex than it seemed originally. As I
see it now It might be wrong to implement the cases 2) and 3), but 1) is more
appropriate.

First of all we need to note that GPIOlib framework provides the next parameters
to describe the IRQ-chip:
gc->irq.num_parents - number of parental IRQ numbers.
gc->irq.parents[] - array of parental IRQ numbers.
*gc->irq.valid_mask - a mask of IRQ/GPIO lines describing a valid IRQ.
*gc->irq.map - mapping of hw IRQ/GPIO ID -> parental IRQ numbers.

Using that set we can handle any case of linear and sparse parental IRQs. Here
is how it can be implemented in the framework of DW APB GPIO controller.

DW APB GPIO can be synthesized with two configs:
1) Combined IRQ line (GPIO_INTR_IO == True),
2) Multiple interrupt signals for each GPIO (GPIO_INTR_IO == False).

Obviously the former case is trivial:

     IRQ_combined
    ______^________
   /_ _ _ _ _ ___ _\
   |_|_|_|_|_|...|_| - GPIOs

In that case
gc->irq.num_parents = 1;
gc->irq.parents[0] = IRQ_combined;
*gc->irq.valid_mask = GENMASK(ngpio - 1, 0); // This is done by the GPIOlib core itself.

The later one (when multiple interrupt signals are involved) can be a bit more
complicated. It can be also split up into two cases:
2a) One-on-one GPIO-IRQ mapping.
2b) Sparse GPIO-IRQ mapping.

It's straightforward to implement 2a):

   i1i2i3i4i5 ... iN
    _ _ _ _ _ ___ _
   |_|_|_|_|_|...|_| - GPIOs

In that case
gc->irq.num_parents = ngpio;
gc->irq.parents[] = {i1, i2, i3, i4, i5, ... iN};
gc->irq.map = {i1, i2, i3, i4, i5, ... iN};
*gc->irq.valid_mask = GENMASK(ngpio - 1, 0);

The complication starts when we get to implementing 2b):

   i1 xi3i4 x ... iN
    _ _ _ _ _ ___ _
   |_|_|_|_|_|...|_| - GPIOs

In order to cover this case we need to answer on two question.
Firstly how to get such platform config? I am not sure about ACPI, but
aside from straightforward platform_data-based setup such configuration
can be reached by setting up the "interrupts-extended" DT-property with
zeroed phandle.

Ok, since it's possible to meet such platform config, we need to think
how to handle it and here is the second question. How to describe such
case in the framework of GPIOlib-IRQchip?

So from my side it was wrong to set the sparse IRQs array to
gc->irq.parents. Instead I should have scanned the sparse IRQs array,
calculated the number of non-empty parental IRQs, created an array of linear
(non-sparse) IRQs, initialized *gc->irq.valid_mask in accordance with the
sparse parental IRQs array. In other words it was wrong to assume, that
each gc->irq.parents entry corresponds to the IRQ/GPIO line. The gc->irq.parents
array just describes the parental IRQs and nothing else.

Shortly speaking here is how the GPIOlib IRQchip parameters should be
initialized in this case:
gc->irq.num_parents - number of valid parental IRQs.
gc->irq.parents - non-sparse, linear array of valid IRQs.
*gc->irq.valid_mask - mask initialized by means of the gc->irq.init_valid_mask()
callback, which indicates valid IRQ/GPIO IDs.
*gc->irq.map - sparse array of parental IRQ numbers (which I mistakenly tried to
pass through the gc->irq.parents pointer).

After that GPIOlib IRQchip should work just fine without need to be patched 
in order to check whether the passed parental IRQs are valid or not.

Please correct me if I am wrong in some aspects of the solution described above.
I'll send a fix of the problem shortly.

-Sergey

> 
> Yours,
> Linus Walleij
