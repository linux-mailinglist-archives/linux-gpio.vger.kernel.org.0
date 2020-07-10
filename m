Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 016D321BA69
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 18:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgGJQLL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 12:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbgGJQLL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 12:11:11 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D958FC08C5DC
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 09:11:10 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id j21so1980126ual.11
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9VScCVlSfPm10VLDJ+axRDGvLBsXb3kNBBHpzq8FkJY=;
        b=Wj9sHUVaOU3sganeLL8aaDicZfyUpHLNACr9EYLefs5Bo1d0zLKvSwqMCmX3tWo26I
         4U9XetO9wuGMwLD5gDVZ53itPP2oEgt/FDBJ1SblPyzIvusj8uQzGFcvz112Y9B+4nUk
         gVG7cvS2em6LtdjPdDDHIDvSExe3TYLJglB4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9VScCVlSfPm10VLDJ+axRDGvLBsXb3kNBBHpzq8FkJY=;
        b=oIUKJYkgG4an39NjH2NvJET+ga1vjAohkX+8fcxynAYDQxKK2509acpKTv1Ttq3EgN
         FI8rNrHCLoiKzJas0w2NRQUQP23g2h6yyN+WKjdyErhshLrbhsVuXDWlJketBhiTCyRx
         pp3QjuzjC9F5uprdkldf7CtMElTnDYQv/IiImForN1AxOJ14/4SupDmVuDVfxWUdeVsq
         Tffd50ejh9/czxcxv/1YA5cp0Ex8tPP48iUa5G+7A6EPNPXk/GAPEsFsk3OV4vg0Ac4P
         4Z9yKe+b758leY4ajQxUD/5yYiGiAUlkDjR/G6Nkf7akVGzPgJZHt5WSiEe6H2S5gIze
         VxYQ==
X-Gm-Message-State: AOAM531MXUrA5YH/5MT5GNa5gXeRHLgvtJv/XljWPT8aQtk6+rT9EKBm
        /99TUlc9wMCl+YfVocJD+zQhlp/V0MI=
X-Google-Smtp-Source: ABdhPJyIqkb2WnOGEogyIKg+7OrCemKuwNcq6Ixu8HUE42WVHEElimdH8wLRyYNb0djFT1dkVCoFDQ==
X-Received: by 2002:ab0:2e98:: with SMTP id f24mr21085929uaa.1.1594397469532;
        Fri, 10 Jul 2020 09:11:09 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id q83sm869427vkq.46.2020.07.10.09.11.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 09:11:08 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id c7so1994398uap.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 09:11:07 -0700 (PDT)
X-Received: by 2002:ab0:6e8e:: with SMTP id b14mr56616622uav.0.1594397467385;
 Fri, 10 Jul 2020 09:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
 <87lfjreo7m.wl-maz@kernel.org>
In-Reply-To: <87lfjreo7m.wl-maz@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 10 Jul 2020 09:10:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzhdL67ocBPmAngxbZJsq-dSjhV2QjA8=7Ry+9oYxXHw@mail.gmail.com>
Message-ID: <CAD=FV=VzhdL67ocBPmAngxbZJsq-dSjhV2QjA8=7Ry+9oYxXHw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Handle broken PDC dual edge case on sc7180
To:     Marc Zyngier <maz@kernel.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Jul 10, 2020 at 2:03 AM Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Doug,
>
> On Wed, 08 Jul 2020 22:16:25 +0100,
> Douglas Anderson <dianders@chromium.org> wrote:
> >
> > As per Qualcomm, there is a PDC hardware issue (with the specific IP
> > rev that exists on sc7180) that causes the PDC not to work properly
> > when configured to handle dual edges.
> >
> > Let's work around this by emulating only ever letting our parent see
> > requests for single edge interrupts on affected hardware.
> >
> > Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > As far as I can tell everything here should work and the limited
> > testing I'm able to give it shows that, in fact, I can detect both
> > edges.
> >
> > Please give this an extra thorough review since it's trying to find
> > the exact right place to insert this code and I'm not massively
> > familiar with all the frameworks.
> >
> > If someone has hardware where it's easy to stress test this that'd be
> > wonderful too.  The board I happen to have in front of me doesn't have
> > any easy-to-toggle GPIOs where I can just poke a button or a switch to
> > generate edges.  My testing was done by hacking the "write protect"
> > GPIO on my board into gpio-keys as a dual-edge interrupt and then
> > sending commands to our security chip to toggle it--not exactly great
> > for testing to make sure there are no race conditions if the interrupt
> > bounces a lot.
>
> This looks positively awful (the erratum, not the patch). Is there an
> actual description of the problem, outlining the circumstances that
> triggers this issue? The PDC really never fails to disappoint...

Hopefully someone from Qualcomm can chime in here.  My entire
knowledge of the errata comes from:

https://lore.kernel.org/r/c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org

...and I tried to copy the exact phrasing that Rajendra gave.


> >  drivers/pinctrl/qcom/pinctrl-msm.c    | 80 +++++++++++++++++++++++++++
> >  drivers/pinctrl/qcom/pinctrl-msm.h    |  4 ++
> >  drivers/pinctrl/qcom/pinctrl-sc7180.c |  1 +
> >  3 files changed, 85 insertions(+)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 83b7d64bc4c1..45ca09ebb7b3 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -860,6 +860,79 @@ static void msm_gpio_irq_ack(struct irq_data *d)
> >       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >  }
> >
> > +/**
> > + * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs handled by parent.
> > + * @d: The irq dta.
> > + *
> > + * This is much like msm_gpio_update_dual_edge_pos() but for IRQs that are
> > + * normally handled by the parent irqchip.  The logic here is slightly
> > + * different due to what's easy to do with our parent, but in principle it's
> > + * the same.
> > + */
> > +static void msm_gpio_update_dual_edge_parent(struct irq_data *d)
> > +{
> > +     struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +     struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> > +     const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
> > +     unsigned long flags;
> > +     int loop_limit = 100;
>
> I guess this is a "finger up in the air" type of limit?

Yes, the same "finger up in the air" as
msm_gpio_update_dual_edge_pos() in the same file.  My function comment
refers to the other function to try to tie them together at least a
little.


> > +     unsigned int val;
> > +     unsigned int type;
> > +
> > +     /* Read the value and make a guess about what edge we need to catch */
> > +     val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
>
> What does this value represent? The input line value?

Yes.  Coped from msm_gpio_update_dual_edge_pos().


> > +     type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
> > +
> > +     raw_spin_lock_irqsave(&pctrl->lock, flags);
>
> What is this lock protecting you against? In both cases, you are
> already under the irq_desc lock, with interrupts disabled.

We are?  I put a breakpoint when the IRQ hits and did a bt.  I see
this (I happen to be on 5.4 at the moment, so hopefully the same as
mainline):

 kgdb_breakpoint+0x3c/0x74
 msm_gpio_update_dual_edge_parent+0x58/0x17c
 msm_gpio_handle_dual_edge_parent_irq+0x1c/0x30
 __handle_domain_irq+0x84/0xc4
 gic_handle_irq+0x170/0x220
 el1_irq+0xd0/0x180

I think the stack is missing a few things due to aggressive inlining
from my compiler, so the true backtrace would be:

msm_gpio_handle_dual_edge_parent_irq()
generic_handle_irq_desc()
generic_handle_irq()
__handle_domain_irq()
handle_domain_irq()
gic_handle_irq()

The first place that got the "desc" was generic_handle_irq() and it
got it via irq_to_desc().  That doesn't seem to do any locking.  Then
generic_handle_irq_desc() just calls a function pointer so no locking
there either.

...ah, but maybe what you're saying is that
msm_gpio_handle_dual_edge_parent_irq() should be holding "desc->lock"
around the call to msm_gpio_update_dual_edge_parent()?  I can do that.


> > +     do {
> > +             /* Set the parent to catch the next edge */
> > +             irq_chip_set_type_parent(d, type);
> > +
> > +             /*
> > +              * Possibly the line changed between when we last read "val"
> > +              * (and decided what edge we needed) and when set the edge.
> > +              * If the value didn't change (or changed and then changed
> > +              * back) then we're done.
> > +              */
>
> If the line changed, shouldn't you actually inject a new interrupt
> altogether? By changing the polarity more than once, you are
> effectively loosing edges that should have triggered an interrupt.

Are you sure this is needed?  My understanding of edge triggered
interrupts is that until the interrupt handler is called that all
edges can be coalesced into a single interrupt.  It's only after the
interrupt handler is called that it's important to capture new edges.
So if you have this:

a) Be busy processing another unrelated interrupt
b) 5 edges happen on the line
c) Other interrupt finishes
d) Edge interrupt is acked and handler is called

You'll only get one call to the interrupt handler even though there
were 5 edges, right?  It's only important that you queue another
interrupt if that interrupt happens after the true interrupt handler
(the one acting on the edge) has started.

...actually, in theory you'll get _either_ one or two calls to the
interrupt handler depending on timing, since the above could also
happen as:

a) Be busy processing another unrelated interrupt
b) 4 edges happen on the line
c) Other interrupt finishes
d) Edge interrupt is acked and ...
e) 1 more edge happens on the line
f) ...handler is called
g) Edge interrupt is acked and handler is called


As long as msm_gpio_update_dual_edge_parent() is called _before_ the
true interrupt handler is called then what I have should be fine,
right?


> > +             val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
> > +             if (type == IRQ_TYPE_EDGE_RISING) {
> > +                     if (!val)
> > +                             break;
> > +                     type = IRQ_TYPE_EDGE_FALLING;
> > +             } else if (type == IRQ_TYPE_EDGE_FALLING) {
> > +                     if (val)
> > +                             break;
> > +                     type = IRQ_TYPE_EDGE_RISING;
> > +             }
> > +     } while (loop_limit-- > 0);
> > +     raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > +
> > +     if (!loop_limit)
> > +             dev_err(pctrl->dev, "dual-edge irq failed to stabilize\n");
> > +}
> > +
> > +void msm_gpio_handle_dual_edge_parent_irq(struct irq_desc *desc)
> > +{
> > +     struct irq_data *d = &desc->irq_data;
> > +
> > +     /* Make sure we're primed for the next edge */
> > +     msm_gpio_update_dual_edge_parent(d);
>
> I would have expected this to happen on EOI or ACK, rather than before
> the flow is actually handled, once you have told the interrupt
> controller that you were dealing with this interrupt.

Having it on Ack would be ideal, but it appears that the Ack function
isn't called in this case.  That's only called if our handler is
handle_edge_irq() or handle_level_irq().  See more below.

...I'm pretty sure I don't want it on EOI.  Specifically, if I did it
on EOI then I think I _would_ need to re-queue another interrupt if an
edge came in msm_gpio_update_dual_edge_parent().  Doing all the edge
adjustment before calling the true interrupt handler avoids all that.


> > +
> > +     /* Pass on to the normal interrupt handler */
> > +     handle_fasteoi_irq(desc);
>
> Is that the right flow? It seems that the current code is using
> handle_edge_irq. I guess it has been broken so far, and that this
> patch actually fixes it by forcing a fasteoi flow...

The code today only uses handle_level_irq() / handle_edge_irq() if
"skip_wake_irqs" wasn't set for this IRQ.  In the case that
"skip_wake_irqs" wasn't set then it leaves the handler alone.  I
definitely had a hard time following all the flow and interactions
between the pinctrl, PDC, and the GICv3 but I definitely did confirm
that handle_fasteoi_irq() was the handler that was running when
"skip_wake_irqs" was set before I stuck mine in the middle.

I believe how things work today with the "skip_wake_irqs" case is
that, for the most part, the pinctrl driver stays out of the way for
setting up and handling IRQs and just passes some calls onto its
parent (the PDC).  The PDC driver is actually quite minimal.  There's
no "Ack" in there and no calls to set an IRQ handler--it seems to just
rely on the GICv3 doing all that.  It looks there is an implicit Ack
as part of gic_handle_irq() since reading the IAR counts as an Ack.


So to try to sum up my understanding:

1. In the case of "skip_wake_irqs" today there is no acking / handling
code that is part of pinctrl-msm or the PDC.  They just configure
things to direct to the GICv3.

2. For my workaround I just need to make sure to intercept myself and
prime the next edge _before_ the end-user interrupt handler gets
called.  If edges are coalesced before the end-user interrupt handler
is called then that's OK.


I'll await your reply before sending out the next version.  Thanks
much for all your time looking at this!


> > +}
> > +
> > +static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
> > +                                                    unsigned int type)
> > +{
> > +     struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +     struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> > +
> > +     return type == IRQ_TYPE_EDGE_BOTH &&
> > +            pctrl->soc->wakeirq_dual_edge_errata && d->parent_data &&
> > +            test_bit(d->hwirq, pctrl->skip_wake_irqs);
> > +}
> > +
> >  static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> >  {
> >       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > @@ -868,6 +941,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> >       unsigned long flags;
> >       u32 val;
> >
> > +     if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
> > +             irq_set_handler_locked(d, msm_gpio_handle_dual_edge_parent_irq);
> > +             msm_gpio_update_dual_edge_parent(d);
> > +
> > +             return 0;
> > +     }
> > +
> >       if (d->parent_data)
> >               irq_chip_set_type_parent(d, type);
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> > index 9452da18a78b..7486fe08eb9b 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> > @@ -113,6 +113,9 @@ struct msm_gpio_wakeirq_map {
> >   * @pull_no_keeper: The SoC does not support keeper bias.
> >   * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/MPM
> >   * @nwakeirq_map:   The number of entries in @wakeirq_map
> > + * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
> > + *                            to be aware that their parent can't handle dual
> > + *                            edge interrupts.
> >   */
> >  struct msm_pinctrl_soc_data {
> >       const struct pinctrl_pin_desc *pins;
> > @@ -128,6 +131,7 @@ struct msm_pinctrl_soc_data {
> >       const int *reserved_gpios;
> >       const struct msm_gpio_wakeirq_map *wakeirq_map;
> >       unsigned int nwakeirq_map;
> > +     bool wakeirq_dual_edge_errata;
> >  };
> >
> >  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> > diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> > index 1b6465a882f2..1d9acad3c1ce 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> > @@ -1147,6 +1147,7 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> >       .ntiles = ARRAY_SIZE(sc7180_tiles),
> >       .wakeirq_map = sc7180_pdc_map,
> >       .nwakeirq_map = ARRAY_SIZE(sc7180_pdc_map),
> > +     .wakeirq_dual_edge_errata = true,
> >  };
> >
> >  static int sc7180_pinctrl_probe(struct platform_device *pdev)
> > --
> > 2.27.0.383.g050319c2ae-goog
> >
> >
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
