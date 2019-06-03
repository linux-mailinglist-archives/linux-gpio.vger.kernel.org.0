Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2190633607
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 19:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbfFCRGS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 13:06:18 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45314 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbfFCRGS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 13:06:18 -0400
Received: by mail-lj1-f193.google.com with SMTP id r76so16936052lja.12
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2LtZG5NMwbMMqgTlRo61r9yT6UJe01VWRXoi6wd8D18=;
        b=gTLNFGBB1VHufZ/uhIiAundGovgheFJJTnTw7o9naF5vIOfx8uAsFSQPifBj8Yo7Qv
         +Sx736XrM2WwIMtLFgykvM6U06KZ3he7tPqf8f3zGj1WGOCr4B0pVXgYpH3xJGP7JDu+
         9AZQQ9JB4uUAIv0QYvVbJPVl+GEGfZGxyxB2QYC73tpgymD755AowGcflI9Cqq0l4bZH
         rFcBOOZuRh7/n1ddXBN9wDu/tG6iRCPKJjW2jGR612I+AXavFMSE1WzEBMHyV1fUrU9T
         rcqsAlRZ5AwbFqQI8MRYh6R0HneFIeEciPrTv+TJsnVo3KiFSvsKSt6GRKtHWyZY45dw
         YrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2LtZG5NMwbMMqgTlRo61r9yT6UJe01VWRXoi6wd8D18=;
        b=GgevrLe15fTvdZlEjDkO6R03+y7CfzeVYhEnHHTDO8JLeGRqxJXlxeX+K+w4ywUbJo
         rXtI6E5MvNr2fGVlTu9PG03jQQw29nHrWGlB06xTRWkWI2H/8q/dupr3UWz4nhLQCgKZ
         CLCgwxKspzPGmdQmF1Y9FvU8GnalOHzbFbHwNY+aKe6DtB4sqm6ExoFJTF3ZCvIaAO27
         X31FHTYaLH5/rrTM2quY99YaN8WCk17YFxmTWo9KagjRd6CcySAN0XbcaCZQZBdU1Gxj
         sg74JXtLhT+XmXFgz1oP3v78Zr3hn2wQYU7bLMpSUYDqiohiBmgayVHesnry0yA2j4qp
         ybuw==
X-Gm-Message-State: APjAAAU9irnvh6MlU271zKLM7sYFdnc+q9uDx9MPMGfFcGD4nhmuSD8n
        zGgFArO+GhZ5ye8y+AygrubuxUW5OdptWzkHQmrcGw==
X-Google-Smtp-Source: APXvYqwnt5OK7mkHzUFxBDcdaN2CPFTpjKNbBkmJkuq+XszNwYJEjgKPwoZIpRJ6IM5JumZ5GwXBcpkh/UPz3cqUng4=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr5281619lje.46.1559581575562;
 Mon, 03 Jun 2019 10:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190602205424.28674-1-linus.walleij@linaro.org> <20190603091045.GC27753@ulmo>
In-Reply-To: <20190603091045.GC27753@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Jun 2019 19:06:04 +0200
Message-ID: <CACRpkda9AMOpLq=02qw_q9Kkr1osiLz3F=ikFATKCj5u84K2Bw@mail.gmail.com>
Subject: Re: [PATCH 1/2] RFC: gpio: Add support for hierarchical IRQ domains
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 3, 2019 at 11:10 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Sun, Jun 02, 2019 at 10:54:23PM +0200, Linus Walleij wrote:

> > +     if (is_fwnode_irqchip(gpiochip->irq.fwnode)) {
>
> I wonder if this is really necessary. From the below it looks like you
> bake in a bunch of assumptions just to make this sort of work, but do we
> really need this for boardfile support? Or at least, perhaps let drivers
> that require the legacy support carry that burden rather than have this
> code in gpiolib?

I think it is needed. Boardfiles have been predicted to disappear
"soon" since 2011 or so, it's just not happening. The "irqchip" type
of fwnode is there primarily for the ARM GIC which is used still
in a number of boardfile systems, but this fwnode type is also
necessary for migrating old boardfile systems over to device
trees stepwise, as is shown by the IXP4xx example, and from
a quick glance mach-iopX and mach-ks8695 also need
hierarchical top level IRQ controllers and GPIO chips to be
converted properly. And this is just for ARM. The situation for
MIPS and all these x86 laptops seem even worse. (OK
maybe I'm a bit overly pessimistic.)

If footprint is the issue then we should really think twice before
doing select IRQ_DOMAIN_HIERARCHY, because that is
something that really brings in a big chunk of code, the
few hundred lines that add irqchip fwnode support is nothing
compared to that. Then we should #ifdef this stuff for
hierarchical domains instead.

> Again, this is baking in twocell as the only option. I'm not sure that
> makes this code really that useful.

It's been really useful so far, I don't really see a problem with that.
It is what you need for Tegra too, right? The day someone makes
a convincing case that the need something else than twocell
we can alter the API simply. Onecell should be trivial to support.

> > +static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
> > +                                                struct irq_fwspec *fwspec,
> > +                                                unsigned long *hwirq,
> > +                                                unsigned int *type)
> > +{
> > +     /* We support standard DT translation */
> > +     if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> > +             return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> > +     }
> > +
> > +     /* This is for board files and others not using DT */
> > +     if (is_fwnode_irqchip(fwspec->fwnode)) {
> > +             int ret;
> > +
> > +             ret = irq_domain_translate_twocell(d, fwspec, hwirq, type);
> > +             if (ret)
> > +                     return ret;
> > +             WARN_ON(*type == IRQ_TYPE_NONE);
> > +             return 0;
> > +     }
> > +     return -EINVAL;
> > +}
>
> This is also hard-coding the simple two-cell variant, which makes this
> very inflexible and useful only to a subset (though, admittedly, a very
> large subset) of drivers.

Same comment. No big upfront design without users. I do not see
how it would be hard to add support for more or less cells if need be.

> > +     ret = gpiochip_hierarchy_irq_domain_translate(d, fwspec, &hwirq, &type);
> > +     if (ret)
> > +             return ret;
>
> I think you technically need to translate each of nr_irqs interrupts to
> make sure you deal properly with holes. irq_domain_translate() really
> only operates on a single interrupt at a time, so it doesn't know that
> the result will be used as the beginning of a linear range of
> interrupts. I don't think that's generally safe to do.

As long as we pass in the number of irqs to
irq_domain_create_hierarchy() (and we do) we will get a
linear irqdomain, so this is perfectly fine. Linear is ...
well linear :D

This is based on gicv2m_irq_domain_alloc() in
drivers/irqchip/irq-gic-v2m.c and the same code appears in
gic_irq_domain_alloc() in drivers/irqchip/irq-gic-v3.c
so all the worlds contemporary ARM systems assume that
irq_domain_translate() works this way, for the same reason:
the domain is implicitly linear.

> > +     chip_info(chip, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
> > +               irq, irq + nr_irqs - 1,
> > +               hwirq, hwirq + nr_irqs - 1);
>
> Eventually perhaps this should be chip_dbg()?

Yeah I will kill most noisy prints once I can test this on
real hardware the next week or so.

> > +     for (i = 0; i < nr_irqs; i++) {
> > +             struct irq_fwspec parent_fwspec;
> > +             const struct gpiochip_hierarchy_map *map = NULL;
> > +             int j;
> > +
> > +             /* Find the map, maybe not all lines support IRQs */
> > +             for (j = 0; j < chip->irq.parent_n_irq_maps; j++) {
> > +                     map = &chip->irq.parent_irq_map[j];
> > +                     if (map->hwirq == hwirq)
> > +                             break;
> > +             }
> > +             if (j == chip->irq.parent_n_irq_maps) {
> > +                     chip_err(chip, "can't look up hwirq %lu\n", hwirq);
> > +                     return -EINVAL;
> > +             }
> > +             chip_dbg(chip, "found parent hwirq %u\n", map->parent_hwirq);
>
> I kind of dislike the type of map that we need to build here. For the
> Tegra case specifically, we already need to create a "valid IRQ map" in
> order to make it comply strictly with twocell unless we keep the
> possibility to override various callbacks in the drivers. In this case
> we would need to generate yet another mapping.

Sorry about that, can we think of some nice way to unify them?
Would it not be trivial to add a helper (possibly even static inline)
to gpiolib that generates the irq.valid_mask from the
struct gpiochip_hierarchy_map * that I'm suggesting?

Possibly I should even make that the default behaviour when calling
[devm_]gpiochip_add[_data]? That makes a bit of sense and
pulls even more boilerplate into the core.

> I can see how this map would be advantageous if it is for a small number
> of GPIOs and interrupts, or if the mapping is more or less arbitrary. In
> case of Tegra it's trivial to do the mapping in code for both of the
> above cases (we can actually use the exact same code for the two
> mappings, but we could not easily use the same data for the different
> purposes).
>
> But perhaps there's some compromise still. What if, for example, we
> added a new callback to struct gpio_irq_chip that would allow us to do
> basically the reverse of irq_domain_ops.translate? We could make the
> code accept either the fixed mapping for cases where that's sensible, or
> allow it to fall back to using irq_domain_ops.translate() and
> gpio_irq_chip.translate() to map using code at runtime.
>
> I think that would also allow me to use this code without having to
> override the gpiochip_to_irq() from gpiolib, because that's the only
> other place (in addition to here) where I need to do that conversion.

As noted on the other patch I am really sceptical to overriding
.to_irq(). Something is wrong if you do that, all .to_irq() is supposed
to do is let the irqdomain do its job of translating between the number
spaces, calls should be pretty much the same no matter what.

.to_irq() is just supposed to be a convenience function for getting
the irq for a GPIO line, it must still be possible to just pick an IRQ
directly from the irqchip, and that will go through the same
irqdomain so ... it should work the same, without any intervention.

> Basically for Tegra I imagine something like this:
>
>         if (chip->irq.translate)
>                 chip->irq.translate(&chip->irq, &parent_fwspec, hwirq + i, type);

I would rather see that we create something translationwise that
can be used universally. If using a list like this for every irq in need
of translation doesn't work

struct gpiochip_hierarchy_map {
        int hwirq;
        int parent_hwirq;
        unsigned int parent_type;
};

Then I want to know what data structure we need.

What would satisfy Tegra? I can think of trivial things like encoding a
"range" (int n_hwirqs) in each entry if that makes things more
convenient/faster when handling mapping of entire ranges.

> Incidentally, parent_fwspec in the Tegra case would yield the same thing
> as fwspec because that's how the bindings are defined. For other drivers
> it might make sense for it to return something different.

I don't quite follow this, sorry :/

> Come to think of it, I think having that backwards-translate callback
> would allow us to get rid of the issue with non-linear mappings, that I
> mentioned above, as well. With one restriction, that is: the GPIO number
> space has to be assumed to be linear.

The GPIO number space is linear per gpiochip, so for a GPIO
offset (hwirq or whatever it happens to be called) an expander or
SoC gpio_chip has IRQs 0..N possibly with invalid holes made in it
with .valid_mask, but the number space is still linear.

> In that case the
> irq_domain_ops.translate() would convert from whatever the external
> representation is to the linear, no-holes, internal representation of
> the GPIO chip (hence hwirq + i would do the right thing with regards to
> multiple IRQs being allocated) and then gpio_irq_chip.translate() would
> convert from that internally linear representation to the external one
> again, taking care of any holes if necessary.

Yeah ... but what about just using gpiolibs internal representation
of the mapping instead if it is versatile enough? It's just going to
be used for this anyway, right?

> As a concrete example, on Tegra we could have the following situation:
> GPIO A.00-A.06 and B.00-B.06 are numbered like this:
>
>     GPIO   DT  pin
>     --------------
>     A.00    0    0
>     A.01    1    1
>     A.02    2    2
>     A.03    3    3
>     A.04    4    4
>     A.05    5    5
>     A.06    6    6
>
>     B.00    8    7
>     B.01    9    8
>     B.02   10    9
>     B.03   11   10
>     B.04   12   11
>     B.05   13   12
>     B.06   14   13
>
> The DT binding is basically a historical "accident" because the GPIO
> controller used to have 8 pins per port, so we use macros to describe
> the second cell in the DT specifier and they simply multiply the port
> index by 8 to get the GPIO base offset for a given port. But I think
> you're familiar with that already from our earlier discussions on this.

Yeah... I vaguely remember.

I'm not entirely sure that it is a good idea for gpiolib or irqdomain
to try to provide generic mechanisms to correct historical incidents
in device tree bindings though.

The mission of the hierarchical irqdomain is to translate a hwirq
offset on irqchip A to a hwirq on irqchip B, so it can walk up the
ladder in the irq handler.

> irq_domain_ops.translate() translates from the DT column above to the
> pin column, which is the linear (no-holes) space that I was referring
> to. gpio_irq_chip.translate() would go from the pin to the DT column.
> That's got a nice symmetry to it.

> So now for your RFC code this would not work if you get the following
> fwspec and nr_irqs = 2:
>
>     fwspec.param[0] = 6;
>
> Because it will try to allocate conceptually for A.06 and A.07, when
> there's actually no A.07.

Correct me if I'm wrong, but now it starts to seem like the trickery I've
seen in Tegra's .to_irq() is due to the fact that the irqdomain is not
really linear.

It seems your basic problem is that you want to use nonlinear
irqdomains here, and that is indeed interesting, and I see how
that will complicate things for you. I was thinking to hopefully
do this in a two-stage rocket then: support linear hierarchical
irqdomains for gpio irqchips, then think about how to support
nonlinear irqdomains.

Nonlinear irqdomains should have the hallmark of passing
0 in the third argument (size) to irq_domain_create_hierarchy()
so that a tree is created. So this is what Tegra should be doing
if its numberspace is not linear, and indeed that is something
I don't handle in this patch set.

So Tegra support, if it needs to deal with nonlinear numberspaces,
should start with that: use a nonlinear irqdomain.

But when I look at the current upstream gpio-tegra186.c code I
get really confused. It doesn't seem to call irq_domain_create*
or irq_domain_add* at all, instead it seems to just assign function pointers to
a NULL irqdomain and rely on the core to call that.

Where is the gpiochip.irq.domain coming from in the Tegra186
case?

Can you explain how this really works, because it looks a bit
like abuse of the API but maybe I just don't get it.

> Overall I think this should work for Tegra. Ideally, like I said, this
> parent IRQ map would be optional and we would allow drivers to compute
> the mapping at runtime where reasonable. Generating a lot of data
> upfront would also work, but it seems rather redundant to have to
> generate a large table with over 200 entries for what's essentially a
> trivial mapping that can be expressed with just a handful of lines of
> code.

I think we need to establish what type of irqdomain you really
want to be using here and what the current 186 driver is really
doing. I am a bit lost, sorry...

Yours,
Linus Walleij
