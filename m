Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DA4244120
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 00:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHMWJn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 18:09:43 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:32914 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgHMWJn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 18:09:43 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1597356578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6KVd51yphIQM8+U1+7jx9SGbdS9NWjNQcuwCDXwh/mM=;
        b=MEx9lubcI5qHIOdS4TojvWPUpAMLyJb4+f2+PJJZi51d6N2CaWL6SwuzwZsbdFT836yI1h
        fEImjTfuUOqUdhhVyMVGsVISNq3SuqXVq0fVJRjeyFbAFymuDeY7WsUHVam5Go2ow1StLn
        6NCSBG+/KtKoqTqzc03wQwOUuto4UFYnmjLmJkV4z1LOxO0UZY/+uZ+rPbZmjHABaleZHt
        2YAD+hDDjEDuK7d2Mq+Fr5/33Al8XT+aP0kaaP51vfSLdQP/9Yw1tVt/0V0CpmIO4VXoiv
        NKeKd8BUveAClUY0AmEBAGJtEE5h8iYFVgugrTlmGqUJVof2jKD4TRI8c1008g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1597356578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6KVd51yphIQM8+U1+7jx9SGbdS9NWjNQcuwCDXwh/mM=;
        b=vNXj1QkNf0fUo90Ic1Ix3s4KDzeoNUHtQFcTPXUgGIpZ2N7GJjI4qXzUjgv0r14+g18F0B
        oUngCxj4z2o6/RBg==
To:     Doug Anderson <dianders@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and irq_resume_one() callbacks
In-Reply-To: <CAD=FV=WN4R1tS47ZzdZa_hsbvLifwnv6rgETVaiea0+QSZmiOw@mail.gmail.com>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-4-git-send-email-mkshah@codeaurora.org> <87pn7ulwr5.fsf@nanos.tec.linutronix.de> <CAD=FV=WN4R1tS47ZzdZa_hsbvLifwnv6rgETVaiea0+QSZmiOw@mail.gmail.com>
Date:   Fri, 14 Aug 2020 00:09:38 +0200
Message-ID: <878sei42ql.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Doug,

On Thu, Aug 13 2020 at 09:09, Doug Anderson wrote:
> On Thu, Aug 13, 2020 at 2:29 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>> The main point is that these callbacks are specific to generic chip and
>> not used anywhere else.
>
> I'm not sure I understand.  This callback is used by drivers that use
> generic-chip but I don't think there's anything specific about
> generic-chip in these callbacks.  Sure many of them use the
> generic-chip's "wake_active" tracking but a different IRQ chip could
> track "wake_active" itself without bringing in all of generic-chip and
> still might want to accomplish the same thing, right?

They are not issued for non generic chip based irq chips and they are
not issued from the common irq suspend/resume code.

Wake active tracking is just a conveniance function and there is nothing
which prevents any other driver to do that. The real question is why
would it do so? The state is tracked in the core already. Don't tell me,
I already read your whole reply :)

>> > Probably the old irq_suspend() and irq_resume() callbacks should be
>> > deprecated.
>>
>> You need to analyze first what these callbacks actually do. :)
>
> See below.  I intended my callbacks to be for the same type of thing
> as the existing ones, though perhaps either my naming or description
> was confusing.

IIRC the suspend/resume callbacks were added to get some existing SoC
drivers converted over in a similar way to existing code, but my memory
is faint. But I'm sure it wasn't a design from scratch and the semantics
are rather obscure. But clearly because this was based on syscore ops
this was never meant for S2idle which did not really exist back then.

>> >  static bool suspend_device_irq(struct irq_desc *desc)
>> >  {
>> > +     bool sync = false;
>> > +
>> >       if (!desc->action || irq_desc_is_chained(desc) ||
>> >           desc->no_suspend_depth)
>> > -             return false;
>> > +             goto exit;
>>
>> What?
>>
>> If no_suspend_depth is > 0 why would you try to tell the irq chip
>> that this line needs to be suspended?
>>
>> If there is no action, then the interrupt line is in shut down
>> state. What's the point of suspending it?
>>
>> Chained interrupts are special and you really have to think hard whether
>> calling suspend for them unconditionally is a good idea. What if a
>> wakeup irq is connected to this chained thing?
>
> I think there is a confusion about what this callback is intended to
> do and that probably needs to be made clearer, either by renaming or
> by comments (or both).  Let's think about these two things that we
> might be telling the IRQ:
>
> a) Please disable yourself in preparation for suspending.
>
> b) The system is suspending, please take any action you need to.
>
> I believe you are reading this as a).  I intended it to be b).  Can
> you think of a name for these callbacks that would make it clearer?
> suspend_notify() / resume_notify() maybe?

I probably read is as #a, but even with #b the semantics are completely
unclear. So I started asking questions.

And these questions are important because if we really would add such a
callback then it needs to be clear what semantics and rules are there
for the driver side. If you don't specify that clearly then this is
going to be (ab)used for implementing insanities which bring state out
of sync and cause more problems than they solve. I still can remember
that I had to cleanup tons of nasty irq chip driver code which did
exactly that. I had to do that to be able to change the internals of the
core code.

Guess why the irq subsystem attempts to encapsulate as much as possible
and has nasty struct member names all over the place.

> Specifically the problem we're trying to address is when an IRQ is
> marked as "disabled" (driver called disable_irq()) but also marked as
> "wakeup" (driver called enable_irq_wake()).  As per my understanding,
> this means:
>
> * Don't call the interrupt handler for this interrupt until I call
> enable_irq() but keep tracking it (either in hardware or in software).
> Specifically it's a requirement that if the interrupt fires one or
> more times while masked the interrupt handler should be called as soon
> as enable_irq() is called.

irq_disable() has two operating modes:

    1) Immediately mask the interrupt at the irq chip level

    2) Software disable it. If an interrupt is raised while disabled
       then the flow handler observes disabled state, masks it, marks it
       pending and returns without invoking any device handler.

On a subsequent irq_enable() the interrupt is unmasked if it was masked
and if the interrupt is marked pending and the interrupt is not level
type then it's attempted to retrigger it. Either in hardware or by a
software replay mechanism.

> * If this interrupt fires while the system is suspended then please
> wake the system up.

Well, that's kinda contradicting itself. If the interrupt is masked then
what is the point? I'm surely missing something subtle here.

> On some (many?) interrupt controllers a masked interrupt won't wake
> the system up.  Thus we need some point in time where the interrupt
> controller can unmask interrupts in hardware so that they can act as
> wakeups.

So far nobody told me about this until now, but why exactly do we need
yet another unspecified callback instead of simply telling the core via
an irq chip flag that it should always unmask the interrupt if it is a
wakeup source?

> Also: if an interrupt was masked lazily this could be a good
> time to ensure that these interrupts _won't_ wake the system up.

Setting IRQCHIP_MASK_ON_SUSPEND does exactly that. No need for a chip
driver to do any magic. You just have to use it.

So the really obvious counterpart for this is to have:

       IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND

and then do:

@@ -81,6 +81,8 @@ static bool suspend_device_irq(struct ir
 		 * IRQD_WAKEUP_ARMED is visible before we return from
 		 * suspend_device_irqs().
 		 */
+		if (chip->flags & IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND)
+			unmask_irq(desc);
 		return true;
 	}
 
plus the counterpart in the resume path. This also ensures that state is
consistent.

The magic behind the back of the core code unmask brings core state and
hardware state out of sync. So if for whatever reason the interrupt is
raised in the CPU before the resume path can mask it again, then the
flow handler will see disabled state, invoke mask_irq() which does
nothing because core state is masked and if that's a level irq it will
come back forever.

> Thus the point of these callbacks is to provide a hook for IRQ chips
> to do this.  Now that you understand the motivation perhaps you can
> suggest a better way to accomplish this if the approach in this patch
> is not OK.

See above.

> I will note that a quick audit of existing users of the gernic-chip's
> irq_suspend() show that they are doing exactly this.  So the point of
> my patch is to actually allow other IRQ chips (ones that aren't using
> generic-chip) to do this type of thing.  At the same time my patch
> provides a way for current users of generic-chip to adapt their
> routines so they work without syscore (which, I guess, isn't
> compatible with s2idle).

If that's the main problem which is solved in these callbacks, then I
really have to ask why this has not been raised years ago. Why can't
people talk?

IIRC back then when the callbacks for GC were added the reason was that
the affected chips needed a way to save and restore the full chip state
because the hardware lost it during suspend. S2idle did not exist back
then at least not in it's current form. Oh well...

But gust replacing them by something which is yet another sinkhole for
horrible hacks behind the core code is not making it any better.

I fear another sweep through the unpleasantries of chip drivers is due
sooner than later. Aside of finding time, I need to find my eyecancer
protection glasses and check my schnaps stock.

>> So what happens in this case:
>>
>>    CPU0                         CPU1
>>    interrupt                    suspend_device_irq()
>>      handle()                     chip->suspend_one()
>>        action()                 ...
>>        chip->fiddle();
>>
>> ????
>
> Ah, so I guess we need to move the call to suspend_one_irq() till
> after the (potential) call to synchronize_irq() in in
> suspend_device_irqs()?

For what you are trying to achieve, no. IRQCHIP_MASK_ON_SUSPEND is
already safe.

If we add IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND then there is no sync
problem either.

> Hopefully with the above explanation this makes more sense?

At least the explanation helped to understand the problem, while the
changelog was pretty useless in that regard:

  "These two callbacks are interesting because sometimes an irq chip
   needs to know about suspend/resume."

Really valuable and precise technical information.

But aside of the confusion, even with your explanation of what you are
trying to solve, I really want a coherent explanation why this should be
done for any of those:

  1) an interrupt which has no action, i.e. an interrupt which has no
     active users and is in the worst case completely deactivated or was
     never activated to begin with.

     In the inactive case it might be in a state where unmask issues an
     invalid vector, causes hardware malfunction or hits undefined
     software state in the chip drivers in the hierarchy.

     If you want to be woken up by irq X, then request irq X which
     ensures that irq X is in a usable state at all levels of the
     stack. If you call disable_irq() or mark the interrupt with
     IRQ_NOAUTOEN, fine, it's still consistent state.

  2) interrupts which have no_suspend_depth > 0 which means that
     there is an action requested which explicitely says: don't touch me
     on suspend.

     If that driver invokes disable_irq() then it can keep the pieces.

  3) chained interrupts

     They are never disabled and never masked. So why would anything
     need to be done here?

     Side note: they should not exist at all, but that's a different
     story.

If you don't have coherent explanations, then please just don't touch
that condition at all.

Hint: "Sometimes a chip needs to know" does not qualify :)

Thanks,

        tglx
