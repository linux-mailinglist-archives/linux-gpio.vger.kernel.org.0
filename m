Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60D021DA09
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 17:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbgGMP1w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 11:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbgGMP1w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 11:27:52 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D01C061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 08:27:51 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id j186so6793701vsd.10
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6iEPUhiKr3M4ezuL+SwEmOApae428FvrCM4ScVSRZLg=;
        b=UiqZFl/KMjYG1ojWDNqz0ODKAIVixIywN3OlHnGG2fr6KkZAyWS1w80jgSiPdKvVVG
         aELQbZh/u6Phrtn3SsVKnGVN46QIPLDUVkxVS/PCC1UGE6+lx/g3D+bvJ29lYH6dddsA
         iElpGnmEacPw6L7VhftHY/BzvTuzTNaXldY5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6iEPUhiKr3M4ezuL+SwEmOApae428FvrCM4ScVSRZLg=;
        b=lju+JkbWEafw5n+DysMQUGm8ohry3gUSBjA0FxseixKtbXNee5qRCopFljPsDhKLDv
         TO7yb6gZb+ZbxFZpIh2HdvalfPsQtZ1Sw9LUsKVPi5c8wBNXpF3MoTmkJQRKWd00Nwox
         7RG+4OL4SbMhyPMKkeVpKuJGHFVFx0RNQEUcrpn0N/jGUN6lzQWEOr4a2O5XZwR5ISJX
         EDqbA1A1kzjhZ6Tf6CDG2SunYFBUS3VRtqwuFhjkL/g4RufA/JJOpglQHde9lqe+Ipur
         ZKSs4WuWcxcIwjdO507wj27CmuqcS/GZjsXCPO40Bga/77irmOFs/Et8eEmpGPWCsQKG
         faEw==
X-Gm-Message-State: AOAM530CNTHKocd3sS7r0IX4wBbYjfqC8ggAKqCt4vPLmECYcbXvBshK
        GnJx83zqajVBgzW9P+jEFt/WsEDi3uU=
X-Google-Smtp-Source: ABdhPJwJyY6olrmUhfGzC40JA/Be0mSM5r7hH0G4QeW9aGDytCdxAqPOAKtVZMXRLJ7Wrz7FUQQ2Dw==
X-Received: by 2002:a67:2a47:: with SMTP id q68mr4457980vsq.202.1594654070074;
        Mon, 13 Jul 2020 08:27:50 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id d123sm2055178vke.43.2020.07.13.08.27.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 08:27:49 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id d198so6815520vsc.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 08:27:48 -0700 (PDT)
X-Received: by 2002:a67:e046:: with SMTP id n6mr31587759vsl.6.1594654068105;
 Mon, 13 Jul 2020 08:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
 <87lfjreo7m.wl-maz@kernel.org> <CAD=FV=VzhdL67ocBPmAngxbZJsq-dSjhV2QjA8=7Ry+9oYxXHw@mail.gmail.com>
 <87sgdyxvh1.wl-maz@kernel.org>
In-Reply-To: <87sgdyxvh1.wl-maz@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Jul 2020 08:27:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XridBQVjGNm_S6OkMRN1xYPOGS6Kvm4pu-Abjvo7HgMQ@mail.gmail.com>
Message-ID: <CAD=FV=XridBQVjGNm_S6OkMRN1xYPOGS6Kvm4pu-Abjvo7HgMQ@mail.gmail.com>
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

On Sat, Jul 11, 2020 at 2:16 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 10 Jul 2020 17:10:55 +0100,
> Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Jul 10, 2020 at 2:03 AM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > Hi Doug,
>
> [...]
>
> > >
> > > > +     type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
> > > > +
> > > > +     raw_spin_lock_irqsave(&pctrl->lock, flags);
> > >
> > > What is this lock protecting you against? In both cases, you are
> > > already under the irq_desc lock, with interrupts disabled.
> >
> > We are?  I put a breakpoint when the IRQ hits and did a bt.  I see
> > this (I happen to be on 5.4 at the moment, so hopefully the same as
> > mainline):
> >
> >  kgdb_breakpoint+0x3c/0x74
> >  msm_gpio_update_dual_edge_parent+0x58/0x17c
> >  msm_gpio_handle_dual_edge_parent_irq+0x1c/0x30
> >  __handle_domain_irq+0x84/0xc4
> >  gic_handle_irq+0x170/0x220
> >  el1_irq+0xd0/0x180
> >
> > I think the stack is missing a few things due to aggressive inlining
> > from my compiler, so the true backtrace would be:
> >
> > msm_gpio_handle_dual_edge_parent_irq()
> > generic_handle_irq_desc()
> > generic_handle_irq()
> > __handle_domain_irq()
> > handle_domain_irq()
> > gic_handle_irq()
> >
> > The first place that got the "desc" was generic_handle_irq() and it
> > got it via irq_to_desc().  That doesn't seem to do any locking.  Then
> > generic_handle_irq_desc() just calls a function pointer so no locking
> > there either.
> >
> > ...ah, but maybe what you're saying is that
> > msm_gpio_handle_dual_edge_parent_irq() should be holding "desc->lock"
> > around the call to msm_gpio_update_dual_edge_parent()?  I can do that.
>
> No, I mentally did a fast-forward to moving this hack into the irq
> flow, rather than doing before entering the flow. handle_fasteoi_irq
> will take the lock, but obviously not with the current state of this
> patch.
>
> >
> >
> > > > +     do {
> > > > +             /* Set the parent to catch the next edge */
> > > > +             irq_chip_set_type_parent(d, type);
> > > > +
> > > > +             /*
> > > > +              * Possibly the line changed between when we last read "val"
> > > > +              * (and decided what edge we needed) and when set the edge.
> > > > +              * If the value didn't change (or changed and then changed
> > > > +              * back) then we're done.
> > > > +              */
> > >
> > > If the line changed, shouldn't you actually inject a new interrupt
> > > altogether? By changing the polarity more than once, you are
> > > effectively loosing edges that should have triggered an interrupt.
> >
> > Are you sure this is needed?  My understanding of edge triggered
> > interrupts is that until the interrupt handler is called that all
> > edges can be coalesced into a single interrupt.
>
> It really depends on whether the edges are semantically different, and
> I'm not sure you can decide this at the interrupt controller
> level. The core IRQ code doesn't give you a way to discriminate
> between those, but endpoint drivers could, and could get terminally
> confused if the see two rising edges without a falling edge in
> between.

I have added discussion about this in the commit message for v2.
Hopefully it looks OK.  NOTE: it's actually quite common for pinctrl
hardware to only support single edge and require dual edge emulation
in solftware.  I think there are at least 4-5 examples that I found
pretty easily.  ...so I think any drivers that are expecting dual
edges to come from an external pin will have code to account for this.


> > It's only after the
> > interrupt handler is called that it's important to capture new edges.
> > So if you have this:
> >
> > a) Be busy processing another unrelated interrupt
> > b) 5 edges happen on the line
> > c) Other interrupt finishes
> > d) Edge interrupt is acked and handler is called
> >
> > You'll only get one call to the interrupt handler even though there
> > were 5 edges, right?  It's only important that you queue another
> > interrupt if that interrupt happens after the true interrupt handler
> > (the one acting on the edge) has started.
> >
> > ...actually, in theory you'll get _either_ one or two calls to the
> > interrupt handler depending on timing, since the above could also
> > happen as:
> >
> > a) Be busy processing another unrelated interrupt
> > b) 4 edges happen on the line
> > c) Other interrupt finishes
> > d) Edge interrupt is acked and ...
> > e) 1 more edge happens on the line
> > f) ...handler is called
> > g) Edge interrupt is acked and handler is called
> >
> >
> > As long as msm_gpio_update_dual_edge_parent() is called _before_ the
> > true interrupt handler is called then what I have should be fine,
> > right?
>
> I don't disagree with any of that, except that being fine at the
> irqchip level doesn't necessarily mean being fine at the endpoint
> driver level. On the other hand, the HW looks terminally broken, so
> maybe it doesn't matter as the drivers will have to be written with
> this limitation in mind...
>
> >
> > > > +             val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
> > > > +             if (type == IRQ_TYPE_EDGE_RISING) {
> > > > +                     if (!val)
> > > > +                             break;
> > > > +                     type = IRQ_TYPE_EDGE_FALLING;
> > > > +             } else if (type == IRQ_TYPE_EDGE_FALLING) {
> > > > +                     if (val)
> > > > +                             break;
> > > > +                     type = IRQ_TYPE_EDGE_RISING;
> > > > +             }
> > > > +     } while (loop_limit-- > 0);
> > > > +     raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > > > +
> > > > +     if (!loop_limit)
> > > > +             dev_err(pctrl->dev, "dual-edge irq failed to stabilize\n");
> > > > +}
> > > > +
> > > > +void msm_gpio_handle_dual_edge_parent_irq(struct irq_desc *desc)
> > > > +{
> > > > +     struct irq_data *d = &desc->irq_data;
> > > > +
> > > > +     /* Make sure we're primed for the next edge */
> > > > +     msm_gpio_update_dual_edge_parent(d);
> > >
> > > I would have expected this to happen on EOI or ACK, rather than before
> > > the flow is actually handled, once you have told the interrupt
> > > controller that you were dealing with this interrupt.
> >
> > Having it on Ack would be ideal, but it appears that the Ack function
> > isn't called in this case.  That's only called if our handler is
> > handle_edge_irq() or handle_level_irq().  See more below.
>
> Easily fixed, see further down.
>
> >
> > ...I'm pretty sure I don't want it on EOI.  Specifically, if I did it
> > on EOI then I think I _would_ need to re-queue another interrupt if an
> > edge came in msm_gpio_update_dual_edge_parent().  Doing all the edge
> > adjustment before calling the true interrupt handler avoids all
> > that.
>
> Requeuing interrupts would be fine, and we have the retrigger callback
> for that. This can be used when you want to support level interrupts,
> but your interrupt controller only supports edge. Something similar
> could be done to deal with dual edge interrupts.
>
> >
> >
> > > > +
> > > > +     /* Pass on to the normal interrupt handler */
> > > > +     handle_fasteoi_irq(desc);
> > >
> > > Is that the right flow? It seems that the current code is using
> > > handle_edge_irq. I guess it has been broken so far, and that this
> > > patch actually fixes it by forcing a fasteoi flow...
> >
> > The code today only uses handle_level_irq() / handle_edge_irq() if
> > "skip_wake_irqs" wasn't set for this IRQ.  In the case that
> > "skip_wake_irqs" wasn't set then it leaves the handler alone.  I
> > definitely had a hard time following all the flow and interactions
> > between the pinctrl, PDC, and the GICv3 but I definitely did confirm
> > that handle_fasteoi_irq() was the handler that was running when
> > "skip_wake_irqs" was set before I stuck mine in the middle.
>
> OK.
>
> > I believe how things work today with the "skip_wake_irqs" case is
> > that, for the most part, the pinctrl driver stays out of the way for
> > setting up and handling IRQs and just passes some calls onto its
> > parent (the PDC).  The PDC driver is actually quite minimal.  There's
> > no "Ack" in there and no calls to set an IRQ handler--it seems to just
> > rely on the GICv3 doing all that.  It looks there is an implicit Ack
> > as part of gic_handle_irq() since reading the IAR counts as an Ack.
> >
> >
> > So to try to sum up my understanding:
> >
> > 1. In the case of "skip_wake_irqs" today there is no acking / handling
> > code that is part of pinctrl-msm or the PDC.  They just configure
> > things to direct to the GICv3.
> >
> > 2. For my workaround I just need to make sure to intercept myself and
> > prime the next edge _before_ the end-user interrupt handler gets
> > called.  If edges are coalesced before the end-user interrupt handler
> > is called then that's OK.
> >
> >
> > I'll await your reply before sending out the next version.  Thanks
> > much for all your time looking at this!
>
> So here are my suggestions:
>
> - Move your dual edge hack to the irq_ack callback
>
> - On detecting a dual edge interrupt, switch to the
>   handle_fasteoi_ack_irq flow, which will call the irq_ack callback
>
> - Get rid of the now useless locking

OK, see how v2 looks to you.  Sending it out right after I hit "Send'
on this message.


> I bet you could reuse some of the existing hacks, though I haven't
> looked too hard because it is Saturday and this code really makes my
> eyes bleed.

Thanks again for all your help!  For now I'll keep the code separate.
While I agree that it could be unified with the existing
msm_gpio_update_dual_edge_pos() function, doing so would mean:

1. Changing the logic of msm_gpio_update_dual_edge_pos() slightly.
That function does things that we can't quite do as easily.  For
instance, it reads the current config and queries whether an interrupt
is pending both of which didn't seem easy to do in my case.  I think
it would be fine/possible to change msm_gpio_update_dual_edge_pos() to
be more like my function, but I haven't quantified if it would be
worse or better performance.

2. Doing do would require an extra level of abstraction and I'm not
100% sure it's worth it.

If folks want me to work on trying to unify the two let me know and I
can do a v3.


-Doug
