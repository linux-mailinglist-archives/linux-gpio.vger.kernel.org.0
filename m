Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7F636A0AF
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Apr 2021 12:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhDXKs2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Apr 2021 06:48:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:39959 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231203AbhDXKs1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Apr 2021 06:48:27 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1laFpE-0004gz-00; Sat, 24 Apr 2021 12:47:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5367AC0B47; Sat, 24 Apr 2021 12:35:44 +0200 (CEST)
Date:   Sat, 24 Apr 2021 12:35:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] gpio: Add support for IDT 79RC3243x GPIO
 controller
Message-ID: <20210424103544.GA4353@alpha.franken.de>
References: <20210422152055.85544-1-tsbogend@alpha.franken.de>
 <CAHp75Ve6PEr5TFGRgALPCbi-T5Y5yNPV+-fJHC7C2mU+ms30uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve6PEr5TFGRgALPCbi-T5Y5yNPV+-fJHC7C2mU+ms30uw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 23, 2021 at 06:37:41PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 22, 2021 at 6:21 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > +static void idt_gpio_dispatch(struct irq_desc *desc)
> > +{
> > +       struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> > +       struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
> > +       struct irq_chip *host_chip = irq_desc_get_chip(desc);
> > +       unsigned int bit, virq;
> > +       unsigned long pending;
> > +
> > +       chained_irq_enter(host_chip, desc);
> > +
> > +       pending = readl(ctrl->pic + IDT_PIC_IRQ_PEND);
> > +       pending &= ~ctrl->mask_cache;
> > +       for_each_set_bit(bit, &pending, gc->ngpio) {
> 
> > +               virq = irq_linear_revmap(gc->irq.domain, bit);
> 
> Is it guaranteed to be linear always?

yes

> > +               if (virq)
> > +                       generic_handle_irq(virq);
> > +       }
> > +
> > +       chained_irq_exit(host_chip, desc);
> > +}
> 
> ...
> 
> > +       if (sense & ~(IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
> 
> There is a _BOTH variant.

that's IRQ_TYPE_EDGE_BOTH. LEVEL_BOTH would be an interesing concept.

> > +       ilevel = readl(ctrl->gpio + IDT_GPIO_ILEVEL);
> > +       if (sense & IRQ_TYPE_LEVEL_HIGH)
> > +               ilevel |= BIT(d->hwirq);
> > +       else if (sense & IRQ_TYPE_LEVEL_LOW)
> > +               ilevel &= ~BIT(d->hwirq);
> 
> > +       else
> > +               return -EINVAL;
> 
> Is it a double check of the above?

no, the above test is for anything not LEVEL and this now takes care
to be at least LEVEL_LOW or LEVEL_HIGH. This doesn't check for LOW|HIGH,
which I assumed nobody tries to set...

> > +       ctrl->gc.parent = dev;
> 
> Wondering if it's already done by GPIO library.

no it uses it:

        if (gc->parent) {
                gdev->dev.parent = gc->parent;
                gdev->dev.of_node = gc->parent->of_node;
        }

> ...
> 
> > +       ctrl->gc.ngpio = ngpios;
> 
> Shouldn't you do this before calling for bgpio_init()?

no, bgpio_init() initializes ngpios to size of register width, which is
32 for this hardware. And this statement restricts it to the real available
number of gpios.

> ...
> 
> > +       parent_irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> 
> platform_get_irq() ?..

yes, looks better :-)

> > +       /* Mask interrupts. */
> > +       ctrl->mask_cache = 0xffffffff;
> > +       writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
> 
> What about using ->init_hw() call back?

sure, doesn't look like it's worth the effort, but I changed it.

> > +       girq->handler = handle_level_irq;
> 
> handle_bad_irq()

the hardware only supports level interrupts. That's also why there is
no handler change in idt_gpio_irq_set_type.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
