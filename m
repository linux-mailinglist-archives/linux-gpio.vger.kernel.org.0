Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDC7388776
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 08:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbhESGWO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 02:22:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:38501 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234472AbhESGWO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 02:22:14 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ljFZV-0001TL-00; Wed, 19 May 2021 08:20:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EA4C8C0F89; Wed, 19 May 2021 08:20:30 +0200 (CEST)
Date:   Wed, 19 May 2021 08:20:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] gpio: Add support for IDT 79RC3243x GPIO
 controller
Message-ID: <20210519062030.GA4308@alpha.franken.de>
References: <20210514123309.134048-1-tsbogend@alpha.franken.de>
 <CACRpkdYTor-c2qvE=6YD4A+NmvpLgS3LsOfNpBZ5EdTrDkGgkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYTor-c2qvE=6YD4A+NmvpLgS3LsOfNpBZ5EdTrDkGgkg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 01:50:39AM +0200, Linus Walleij wrote:
> Hi Thomas,
> 
> thanks for your patch!
> 
> I can see this is starting to look really good.
> 
> There is one thing that confuses me:
> 
> On Fri, May 14, 2021 at 2:33 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> 
> > IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> > to 32 gpios. All gpios could be used as an interrupt source.
> >
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> > Changes in v5:
> (...)
> 
> > +static int idt_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
> > +{
> (...)
> > +       /* hardware only supports level triggered */
> > +       if (sense == IRQ_TYPE_NONE || (sense & IRQ_TYPE_EDGE_BOTH))
> > +               return -EINVAL;
> (...)
> > +       irq_set_handler_locked(d, handle_level_irq);
> 
> But:
> 
> > +static void idt_gpio_ack(struct irq_data *d)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
> > +
> > +       writel(~BIT(d->hwirq), ctrl->gpio + IDT_GPIO_ISTAT);
> > +}
> (...)
> > +       .irq_ack = idt_gpio_ack,
> 
> Correct me if I'm wrong but I thing .irq_ack() is only called
> from handle_edge_irq ... so never in this case.

handle_level_irq() does a mask_ack_irq() and this uses mask_irq() and
desc->irq_data.chip->irq_ack(), if there is no irq_mask_ack function.

> Can this ACK just be deleted?

no without it interrupts won't go away.

> The code in the ACK callback also looks really weird:
> write all bits except for the current IRQ into the status
> register? It's usually the other way around with these
> things. That really makes me suspect it is unused.

interrupts are acked by writing a 0 to the bit position. I know it's
unusal...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
