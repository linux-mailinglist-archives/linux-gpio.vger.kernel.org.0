Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C67232221
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 18:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgG2QHH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 12:07:07 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53362 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgG2QHH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2020 12:07:07 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9EA898030866;
        Wed, 29 Jul 2020 16:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vcQPxmkk7SoN; Wed, 29 Jul 2020 19:07:00 +0300 (MSK)
Date:   Wed, 29 Jul 2020 19:06:59 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
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
Message-ID: <20200729160659.jcz7nl6qvd7lami2@mobilestation>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com>
 <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
 <CACRpkdZarVTeBbSqZ-N6iGC4fj2-tdtfxuuxJO=YvO29-uHAuA@mail.gmail.com>
 <20200729125837.b27ncvd2eeixstba@mobilestation>
 <CAHp75VfekW-aQhyCQJhzqJ+jSvmzJ-Otdh0jwoLt662CopwyTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VfekW-aQhyCQJhzqJ+jSvmzJ-Otdh0jwoLt662CopwyTQ@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 29, 2020 at 06:10:24PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 29, 2020 at 3:58 PM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> > On Mon, Jul 27, 2020 at 12:22:28AM +0200, Linus Walleij wrote:
> 
> ...
> 
> > Sorry for a delay with a response to this issue. I had to give it a more thorough
> > thought since the problem is a bit more complex than it seemed originally. As I
> > see it now It might be wrong to implement the cases 2) and 3), but 1) is more
> > appropriate.
> >
> > First of all we need to note that GPIOlib framework provides the next parameters
> > to describe the IRQ-chip:
> > gc->irq.num_parents - number of parental IRQ numbers.
> > gc->irq.parents[] - array of parental IRQ numbers.
> > *gc->irq.valid_mask - a mask of IRQ/GPIO lines describing a valid IRQ.
> > *gc->irq.map - mapping of hw IRQ/GPIO ID -> parental IRQ numbers.
> >
> > Using that set we can handle any case of linear and sparse parental IRQs. Here
> > is how it can be implemented in the framework of DW APB GPIO controller.
> >
> > DW APB GPIO can be synthesized with two configs:
> > 1) Combined IRQ line (GPIO_INTR_IO == True),
> > 2) Multiple interrupt signals for each GPIO (GPIO_INTR_IO == False).
> >
> > Obviously the former case is trivial:
> >
> >      IRQ_combined
> >     ______^________
> >    /_ _ _ _ _ ___ _\
> >    |_|_|_|_|_|...|_| - GPIOs
> >
> > In that case
> > gc->irq.num_parents = 1;
> > gc->irq.parents[0] = IRQ_combined;
> > *gc->irq.valid_mask = GENMASK(ngpio - 1, 0); // This is done by the GPIOlib core itself.
> >
> > The later one (when multiple interrupt signals are involved) can be a bit more
> > complicated. It can be also split up into two cases:
> > 2a) One-on-one GPIO-IRQ mapping.
> > 2b) Sparse GPIO-IRQ mapping.
> >
> > It's straightforward to implement 2a):
> >
> >    i1i2i3i4i5 ... iN
> >     _ _ _ _ _ ___ _
> >    |_|_|_|_|_|...|_| - GPIOs
> >

> > In that case
> > gc->irq.num_parents = ngpio;
> > gc->irq.parents[] = {i1, i2, i3, i4, i5, ... iN};
> > gc->irq.map = {i1, i2, i3, i4, i5, ... iN};
> > *gc->irq.valid_mask = GENMASK(ngpio - 1, 0);
> >
> 
> This case puzzles me. Why is it not NULL and 0 and actually you handle
> everything as a nested case?

The code provided above is a sketch. Don't consider it literally. In reality
of course valid_mask will be not NULL, memory for which will be allocated by
the GPIOlib itself. The mask will be initialized by means of the
gc->irq.init_valid_mask() callback.

> 
> > The complication starts when we get to implementing 2b):
> >
> >    i1 xi3i4 x ... iN
> >     _ _ _ _ _ ___ _
> >    |_|_|_|_|_|...|_| - GPIOs
> 
> So does this.
> 
> Valid mask will define exactly GPIOs that are IRQs. So, we will handle
> only nested IRQs which are valid.

Right.

> 
> > In order to cover this case we need to answer on two question.
> > Firstly how to get such platform config? I am not sure about ACPI, but
> > aside from straightforward platform_data-based setup such configuration
> > can be reached by setting up the "interrupts-extended" DT-property with
> > zeroed phandle.
> >
> > Ok, since it's possible to meet such platform config, we need to think
> > how to handle it and here is the second question. How to describe such
> > case in the framework of GPIOlib-IRQchip?
> >
> > So from my side it was wrong to set the sparse IRQs array to
> > gc->irq.parents. Instead I should have scanned the sparse IRQs array,
> > calculated the number of non-empty parental IRQs, created an array of linear
> > (non-sparse) IRQs, initialized *gc->irq.valid_mask in accordance with the
> > sparse parental IRQs array. In other words it was wrong to assume, that
> > each gc->irq.parents entry corresponds to the IRQ/GPIO line. The gc->irq.parents
> > array just describes the parental IRQs and nothing else.
> >
> > Shortly speaking here is how the GPIOlib IRQchip parameters should be
> > initialized in this case:
> > gc->irq.num_parents - number of valid parental IRQs.
> > gc->irq.parents - non-sparse, linear array of valid IRQs.
> > *gc->irq.valid_mask - mask initialized by means of the gc->irq.init_valid_mask()
> > callback, which indicates valid IRQ/GPIO IDs.
> > *gc->irq.map - sparse array of parental IRQ numbers (which I mistakenly tried to
> > pass through the gc->irq.parents pointer).
> >
> > After that GPIOlib IRQchip should work just fine without need to be patched
> > in order to check whether the passed parental IRQs are valid or not.
> >
> > Please correct me if I am wrong in some aspects of the solution described above.
> > I'll send a fix of the problem shortly.
> 

> Maybe I'm missing something, but looks like you are solving the issue
> which is not so complex / doesn't exist.

As I see it now the problem was to provide a suitable config for GPIO-lib IRQ-chip
so one would correctly perceive our DW APB GPIO-IRQ setup with single/sparse/linear
IRQs. My point in the message before was to explain how that problem could be solved
without patching GPIO-lib or IRQ-chip implementations. I shared my thoughts to make
sure the suggested solution is correct, to make sure I didn't miss something in
my considerations.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
