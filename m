Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3742F6CD2
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 22:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbhANVFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 16:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbhANVFd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 16:05:33 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450D3C0613C1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 13:04:50 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id x126so4099025pfc.7
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 13:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=HCwJT/QMqfx+uDi/P3LEr4w8M6Oze0j6kQUUwP5NA1U=;
        b=jrhN8QQKoBt+WKlIvufKWhZT/TQ1ksEv0c6S5ZBuUGCfQC7x2zb2UaR5q+Z4XbB/Bw
         AthQhMwQNFbbohSkAgCOhIUtAQqr2UXbYA/5lRwpa2sEY6fqzga5bxHfQ8yzMv0F/Vui
         TX+E3OhTngwV87ENkCV1a+SqIcb1WvyV9oQ20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=HCwJT/QMqfx+uDi/P3LEr4w8M6Oze0j6kQUUwP5NA1U=;
        b=ia1OXB+NAAgQSTsEz5AwweqyhTTV3F4A5WNqPJVPEBBlv4/x7BYoaTA3mWNVYoI2vj
         XmuT426nxknjh+XhNiHxnrvkzKn/dOOucjsmabziXHwj7td8pzhmeongEmeA2eqaFX3y
         674CLGJ7hjlu0//Xyoip/0Ki60Y5sywlJ01XWv1YEZfoeU65yQCuidswPaWJGm9mvN0e
         mv4ogSuwIbP/LRkz5NpVI2y9BnooPKeQMUKPZmVDgMOQMerNTOHwzF4yM+fsKHgkP4G6
         mJlQZ+Z1YujNjt+OSLvRMb11fiC754s6x2FBdP98mzn9zp/PPJbpuW0HDs1BzwNupxfa
         reLA==
X-Gm-Message-State: AOAM533f5akUq78COPbXy9gJzOE1chzoCMpWxEHy7xO7p0aMouRuUSYb
        ch+29S8LQw9NnFzO3jyS6rYngw==
X-Google-Smtp-Source: ABdhPJyJzhU+dVXlPTEbmGOg7/qVxhzjIm/Rz0sWGXZAIhlpI0s/hJlQGZeE614rRs4vIzz3k2vSuw==
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id t8-20020aa793880000b029019e06486480mr9392833pfe.21.1610658289583;
        Thu, 14 Jan 2021 13:04:49 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id o32sm6895357pgm.10.2021.01.14.13.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 13:04:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=Vg1PNVPhCH9GPX=F9-EHhSGF9NaXfui+rM4SQEtA=ZMA@mail.gmail.com>
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid> <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid> <161060848425.3661239.17417977666663714149@swboyd.mtv.corp.google.com> <CAD=FV=Vg1PNVPhCH9GPX=F9-EHhSGF9NaXfui+rM4SQEtA=ZMA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>, open list:
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Jan 2021 13:04:47 -0800
Message-ID: <161065828717.3661239.13961295387211584079@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Doug Anderson (2021-01-14 09:58:55)
> Hi,
>=20
> On Wed, Jan 13, 2021 at 11:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > > @@ -195,6 +201,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev=
 *pctldev,
> > >         if (WARN_ON(i =3D=3D g->nfuncs))
> > >                 return -EINVAL;
> > >
> > > +       /*
> > > +        * If an GPIO interrupt is setup on this pin then we need spe=
cial
> > > +        * handling.  Specifically interrupt detection logic will sti=
ll see
> > > +        * the pin twiddle even when we're muxed away.
> > > +        *
> > > +        * When we see a pin with an interrupt setup on it then we'll=
 disable
> > > +        * (mask) interrupts on it when we mux away until we mux back=
.  Note
> > > +        * that disable_irq() refcounts and interrupts are disabled a=
s long as
> > > +        * at least one disable_irq() has been called.
> > > +        */
> > > +       if (d && i !=3D gpio_func &&
> > > +           !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
> > > +               disable_irq(irq);
> >
> > Does it need to be forced non-lazy so that it is actually disabled at
> > the GIC?
>=20
> Yes, I think non-lazy is important.  Specifically at the end I assume
> that I can clear the interrupt in hardware and it will go away and
> Linux never saw it.  If it was lazy, it's possible Linux saw the
> interrupt and has it marked with IRQS_PENDING.
>=20
> Right now we get non-lazy because we have "disable" implemented, so it
> works fine.  I can be explicit.  Do I add a call to
> msm_gpio_irq_reqres() like:
>=20
>   irq_set_status_flags(d->irq, IRQ_DISABLE_UNLAZY);

Yes that should be done explicitly. I suppose when the irq is requested
the first time is when we should do it. Or we can add a flag to gpiolib
to do that all the time for the irq domain? Basically make it so
gpiochip_hierarchy_irq_domain_alloc() sets the flag.

>=20
> I'll wait for feedback if you think this is the right way to go before
> sending the next version.
>=20
>=20
> > I'm trying to understand how the lazy irq disabling plays into
> > this. I think it's a don't care situation because if the line twiddles
> > and triggers an irq then we'll actually disable it at the GIC in the
> > genirq core and mark it pending for resend.
>=20
> I think the marking as pending is a problem.  When we finally mux back
> to GPIO we want to clear out anything that showed up while it was
> muxed away and I'm not aware of a way to clear "IRQS_PENDING".

Ok.

>=20
>=20
> > I wonder if we wouldn't have
> > to undo the pending state if we actually ignored it at the GIC
> > forcefully. And I also worry that it may cause a random wakeup if the
> > line twiddles, becomes pending at GIC and thus blocks the CPU from
> > running a WFI but it isn't an irq that Linux cares about because it's
> > muxed to UART, and then lazy handling runs and shuts it down. Is that
> > possible?
>=20
> I believe if the interrupt is masked at the GIC then it won't cause
> wakeups.  Specifically to get wakeup stuff working we had to unmask
> the interrupt at the GIC level.

If I understand correctly, the lazy and non-lazy cases will masked at
the GIC either after the line twiddles or immediately here respectfully.
So either way we should be OK because it will be masked, but I'm still
unsure about the lazy case where we are in the process of suspending and
then the line twiddles. That would cause the irq to block suspend,
possibly really late if the CPU is running trusted firmware. So we
really need to make sure that it is non-lazy so this can't happen.

>=20
>=20
> > > +
> > >         raw_spin_lock_irqsave(&pctrl->lock, flags);
> > >
> > >         val =3D msm_readl_ctl(pctrl, g);
> > > @@ -204,6 +224,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev=
 *pctldev,
> > >
> > >         raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > >
> > > +       if (d && i =3D=3D gpio_func &&
> > > +           test_and_clear_bit(d->hwirq, pctrl->disabled_for_mux)) {
> > > +               /*
> > > +                * Clear interrupts detected while not GPIO since we =
only
> > > +                * masked things.
> > > +                */
> > > +               if (d->parent_data && test_bit(d->hwirq, pctrl->skip_=
wake_irqs))
> > > +                       irq_chip_set_parent_state(d, IRQCHIP_STATE_PE=
NDING, false);
> >
> > So if not lazy this could go away?
>=20
> I don't think so.  If lazy we could have a pending interrupt tracked
> in two places: in Linux and in the parent if this happened:
> * disable_irq() - do nothing except mark that IRQ is disalbed.
> * IRQ happened - track in Linux and actually disable (mask) the interrupt
> * IRQ happened again - still tracked in Linux but now also latched in
> hardware (but masked)
>=20
> ...so if it was lazy we'd need to clear the interrupt in two places.
> With non-lazy we only have to clear the latch that happened in
> hardware, right?

Yes makes sense.

>=20
> > Although I think this is to clear out
> > the pending state in the GIC and not the PDC which is the parent.
>=20
> Yeah, it clears the state that was latched in the GIC.  It just passes
> through the PDC code on the way there.

Got it. I'm happy with this patch once it explicitly disables the lazy
mode of the gpio irqs.
