Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D769624418D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 00:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgHMW7E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 18:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgHMW7E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 18:59:04 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E524AC061383
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 15:59:03 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id x17so2140359uao.5
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 15:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X0gX4eWr1/ebRNhUOFdjjldrlfyAtArfMfYSU2M/IDs=;
        b=nNIyh4yXC3P8AV5HVGVCyZB96qURK7ACagbp9qszCefal6hW3g/vhFIFUZL01cJ83e
         2EIWjFZ8qpY3IFtfEdQWG8AFOjRflmIilXxvAvOtU8GJQfUNGPiLw2HsmmfogXkt06wE
         QxNYwcdUvaK4ytUpt+7JqAeL8emTWqzaZgteE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0gX4eWr1/ebRNhUOFdjjldrlfyAtArfMfYSU2M/IDs=;
        b=mnTJbgXEbSGoUhO2ujXS4J8XqD645w6muVGsriDoGkJu7LtpR+2jE9o7itQmyR5BoG
         ZL8GgGvhXhL2A0HSoKh93CgqcdcHj8MlGUS31D258HfJCNUKi6YgXDkHYPzfifpgOovf
         ooEqQc0aGh/qPckaZ3SSTQRJUaWQChm0JuU2EB/3cvJy7J7BiEW9OFA3wgjWZJVDAV9m
         fQIiEKbj6tKp6ivZlq+07k++1xk5BVEgbV7nHJfKfN4v0qcqFjLbNYQ29Rz2KHOouZPT
         CpREImN0rHKrKSCojb6tdTrZ3fiMhHSJGOpBnt9NOUm0PPpTEsLyV5EqOfe7KkgSOkes
         6BWA==
X-Gm-Message-State: AOAM530Svqxvpio9O/sjT3wbXQwOh1xmyKYtGT2uJl/STOY/cLL8ynP6
        6l6ncmxJBHPO7nfy0U8UuPGdPYX9R/U=
X-Google-Smtp-Source: ABdhPJwQ9aBeD9mUwtEXhdEiZj00umK2zBZvIU10tNAr4GmIbQSx5sD4939wfaUaL8B80Un2cBUQqw==
X-Received: by 2002:ab0:20d2:: with SMTP id z18mr5565613ual.14.1597359542527;
        Thu, 13 Aug 2020 15:59:02 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id n123sm1065095vkf.41.2020.08.13.15.59.01
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 15:59:01 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id j188so3789640vsd.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 15:59:01 -0700 (PDT)
X-Received: by 2002:a67:fd67:: with SMTP id h7mr4962382vsa.121.1597359540516;
 Thu, 13 Aug 2020 15:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-4-git-send-email-mkshah@codeaurora.org> <87pn7ulwr5.fsf@nanos.tec.linutronix.de>
 <CAD=FV=WN4R1tS47ZzdZa_hsbvLifwnv6rgETVaiea0+QSZmiOw@mail.gmail.com> <878sei42ql.fsf@nanos.tec.linutronix.de>
In-Reply-To: <878sei42ql.fsf@nanos.tec.linutronix.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 13 Aug 2020 15:58:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com>
Message-ID: <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and
 irq_resume_one() callbacks
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Aug 13, 2020 at 3:09 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> > Specifically the problem we're trying to address is when an IRQ is
> > marked as "disabled" (driver called disable_irq()) but also marked as
> > "wakeup" (driver called enable_irq_wake()).  As per my understanding,
> > this means:
> >
> > * Don't call the interrupt handler for this interrupt until I call
> > enable_irq() but keep tracking it (either in hardware or in software).
> > Specifically it's a requirement that if the interrupt fires one or
> > more times while masked the interrupt handler should be called as soon
> > as enable_irq() is called.
>
> irq_disable() has two operating modes:
>
>     1) Immediately mask the interrupt at the irq chip level
>
>     2) Software disable it. If an interrupt is raised while disabled
>        then the flow handler observes disabled state, masks it, marks it
>        pending and returns without invoking any device handler.
>
> On a subsequent irq_enable() the interrupt is unmasked if it was masked
> and if the interrupt is marked pending and the interrupt is not level
> type then it's attempted to retrigger it. Either in hardware or by a
> software replay mechanism.
>
> > * If this interrupt fires while the system is suspended then please
> > wake the system up.
>
> Well, that's kinda contradicting itself. If the interrupt is masked then
> what is the point? I'm surely missing something subtle here.

This is how I've always been told that the API works and there are at
least a handful of drivers in the kernel whose suspend routines both
enable wakeup and call disable_irq().  Isn't this also documented as
of commit f9f21cea3113 ("genirq: Clarify that irq wake state is
orthogonal to enable/disable")?


> > On some (many?) interrupt controllers a masked interrupt won't wake
> > the system up.  Thus we need some point in time where the interrupt
> > controller can unmask interrupts in hardware so that they can act as
> > wakeups.
>
> So far nobody told me about this until now, but why exactly do we need
> yet another unspecified callback instead of simply telling the core via
> an irq chip flag that it should always unmask the interrupt if it is a
> wakeup source?
>
> > Also: if an interrupt was masked lazily this could be a good
> > time to ensure that these interrupts _won't_ wake the system up.
>
> Setting IRQCHIP_MASK_ON_SUSPEND does exactly that. No need for a chip
> driver to do any magic. You just have to use it.
>
> So the really obvious counterpart for this is to have:
>
>        IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND
>
> and then do:
>
> @@ -81,6 +81,8 @@ static bool suspend_device_irq(struct ir
>                  * IRQD_WAKEUP_ARMED is visible before we return from
>                  * suspend_device_irqs().
>                  */
> +               if (chip->flags & IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND)
> +                       unmask_irq(desc);
>                 return true;
>         }
>
> plus the counterpart in the resume path. This also ensures that state is
> consistent.

This sounds wonderful to me.  Maulik: I think you could replace quite
a few of the patches in the series and just use that.


> The magic behind the back of the core code unmask brings core state and
> hardware state out of sync. So if for whatever reason the interrupt is
> raised in the CPU before the resume path can mask it again, then the
> flow handler will see disabled state, invoke mask_irq() which does
> nothing because core state is masked and if that's a level irq it will
> come back forever.
>
> > Thus the point of these callbacks is to provide a hook for IRQ chips
> > to do this.  Now that you understand the motivation perhaps you can
> > suggest a better way to accomplish this if the approach in this patch
> > is not OK.
>
> See above.
>
> > I will note that a quick audit of existing users of the gernic-chip's
> > irq_suspend() show that they are doing exactly this.  So the point of
> > my patch is to actually allow other IRQ chips (ones that aren't using
> > generic-chip) to do this type of thing.  At the same time my patch
> > provides a way for current users of generic-chip to adapt their
> > routines so they work without syscore (which, I guess, isn't
> > compatible with s2idle).
>
> If that's the main problem which is solved in these callbacks, then I
> really have to ask why this has not been raised years ago. Why can't
> people talk?

Not all of us have the big picture that you do to know how things
ought to work, I guess.  If nothing else someone looking at this
problem would think: "this must be a common problem, let's go see how
all the other places do it" and then they find how everyone else is
doing it and do it that way.  It requires the grander picture that a
maintainer has in order to say: whoa, everyone's copying the same
hack--let's come up with a better solution.


> IIRC back then when the callbacks for GC were added the reason was that
> the affected chips needed a way to save and restore the full chip state
> because the hardware lost it during suspend. S2idle did not exist back
> then at least not in it's current form. Oh well...
>
> But gust replacing them by something which is yet another sinkhole for
> horrible hacks behind the core code is not making it any better.
>
> I fear another sweep through the unpleasantries of chip drivers is due
> sooner than later. Aside of finding time, I need to find my eyecancer
> protection glasses and check my schnaps stock.
>
> >> So what happens in this case:
> >>
> >>    CPU0                         CPU1
> >>    interrupt                    suspend_device_irq()
> >>      handle()                     chip->suspend_one()
> >>        action()                 ...
> >>        chip->fiddle();
> >>
> >> ????
> >
> > Ah, so I guess we need to move the call to suspend_one_irq() till
> > after the (potential) call to synchronize_irq() in in
> > suspend_device_irqs()?
>
> For what you are trying to achieve, no. IRQCHIP_MASK_ON_SUSPEND is
> already safe.
>
> If we add IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND then there is no sync
> problem either.
>
> > Hopefully with the above explanation this makes more sense?
>
> At least the explanation helped to understand the problem, while the
> changelog was pretty useless in that regard:
>
>   "These two callbacks are interesting because sometimes an irq chip
>    needs to know about suspend/resume."
>
> Really valuable and precise technical information.

Funny to get yelled at for not providing a detailed enough changelog.
Usually people complain that my changelogs are too detailed.  Sigh.


> But aside of the confusion, even with your explanation of what you are
> trying to solve, I really want a coherent explanation why this should be
> done for any of those:
>
>   1) an interrupt which has no action, i.e. an interrupt which has no
>      active users and is in the worst case completely deactivated or was
>      never activated to begin with.
>
>      In the inactive case it might be in a state where unmask issues an
>      invalid vector, causes hardware malfunction or hits undefined
>      software state in the chip drivers in the hierarchy.
>
>      If you want to be woken up by irq X, then request irq X which
>      ensures that irq X is in a usable state at all levels of the
>      stack. If you call disable_irq() or mark the interrupt with
>      IRQ_NOAUTOEN, fine, it's still consistent state.
>
>   2) interrupts which have no_suspend_depth > 0 which means that
>      there is an action requested which explicitely says: don't touch me
>      on suspend.
>
>      If that driver invokes disable_irq() then it can keep the pieces.
>
>   3) chained interrupts
>
>      They are never disabled and never masked. So why would anything
>      need to be done here?
>
>      Side note: they should not exist at all, but that's a different
>      story.
>
> If you don't have coherent explanations, then please just don't touch
> that condition at all.
>
> Hint: "Sometimes a chip needs to know" does not qualify :)

Clearly I am not coherent.  ;-)  My only goal was to help enable
interrupts that were disabled / marked as wakeup (as per above,
documented to be OK) to work on Qualcomm chips.  This specifically
affects me because a driver that I need to work (cros_ec) does this.
If IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND is good to add then it sounds like
a great plan to me.


-Doug
