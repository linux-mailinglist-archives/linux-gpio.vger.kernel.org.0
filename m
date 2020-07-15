Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7709522013E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 02:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgGOAIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 20:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgGOAIu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 20:08:50 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8B8C061794
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 17:08:49 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id 66so45804vka.13
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 17:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oq76v+RUv94wSS69Fqfqev4VRzCgB2IyBU1P7nBVtig=;
        b=m0ut99R/8dD81hmur6pMC9ru6Vq9dtQamQKgmoqoLYTEfqFFkOIiJyqL/d7oWzxxID
         5JAvEZqNqyR8qSP6voCyTFwScD757h15qUjPPyMX4wDRYllrp1sLj3vKklZcfQ6DQv3F
         vlWq+SGYaBMgcYUpXfuv5WZ6qchx31F5olne0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oq76v+RUv94wSS69Fqfqev4VRzCgB2IyBU1P7nBVtig=;
        b=frJvZfIsG/B9dhA0ykV8Gxo7HcBRpUep9LtEg7WQL4CwwKO60pwrKPSNOQcIlTeimX
         69nTHh10vPQU+xZA9Ied/2+Rc7m5FkKS6U660zPRmUqcFfP8kv7geopAPrS9gqXyXLME
         VOBr5Czd2fN+r/TJpR+UGizRqSu4lYVdZdMkDyFclnUjbu0V7hm9x9vydi841eeRXgGh
         yT7xIobCr+1xeWfjigShF/jEC7KWT6w6Tdy5ezTNScIwXhrVoi1C1IH/Tn2knKdjcEgQ
         9H9375g4nVyA2omz5P1rK5FX6eYFcaqMQqPAQsHMNDd1PrDHE78b6DMtQvwvkU7+c2Vw
         emeg==
X-Gm-Message-State: AOAM532zllSbFIIlFQ1v3c6mYnsyoqAEURxxd9wyqMqxKyULU0Ne/scm
        d+Mbtk0j4lqn5YMl7Z29D+jkYWkx8Eo=
X-Google-Smtp-Source: ABdhPJzdtwSN45WyrUP0xUMEV7URdiijHoYu+s4Dqi9/JMEAuTVxgqcYMeMaT10b/5hbgMJtC8IzDg==
X-Received: by 2002:a1f:24cc:: with SMTP id k195mr5991195vkk.61.1594771728095;
        Tue, 14 Jul 2020 17:08:48 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id d200sm70742vkd.16.2020.07.14.17.08.46
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 17:08:46 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id q15so32673uap.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 17:08:46 -0700 (PDT)
X-Received: by 2002:ab0:486d:: with SMTP id c42mr5460752uad.64.1594771725929;
 Tue, 14 Jul 2020 17:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org>
 <1592818308-23001-2-git-send-email-mkshah@codeaurora.org> <CAD=FV=WcbEH2O+7xqCyDfrPR0+g+MpWWsgORNPepC=VrhOanFQ@mail.gmail.com>
 <723acb53-364a-9045-8dbd-fa2a270798a6@codeaurora.org>
In-Reply-To: <723acb53-364a-9045-8dbd-fa2a270798a6@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Jul 2020 17:08:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqeCbAgM+7_+trHYgeYFN3XnNdBcMy4N34N_8m9QFr9w@mail.gmail.com>
Message-ID: <CAD=FV=WqeCbAgM+7_+trHYgeYFN3XnNdBcMy4N34N_8m9QFr9w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: qcom: Remove irq_disable callback from
 msmgpio irqchip
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
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

On Tue, Jul 14, 2020 at 3:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 7/14/2020 3:47 AM, Doug Anderson wrote:
>
> Hi,
>
> On Mon, Jun 22, 2020 at 2:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> > > The gpio can be marked for wakeup and drivers can invoke disable_irq()
> > > during suspend, in such cases unlazy approach will also disable at HW
> > > and such gpios will not wakeup device from suspend to RAM.
> > >
> > > Remove irq_disable callback to allow gpio interrupts to lazy disabled.
> > > The gpio interrupts will get disabled during irq_mask callback.
> > >
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > > ---
> > >  drivers/pinctrl/qcom/pinctrl-msm.c | 13 -------------
> > >  1 file changed, 13 deletions(-)
> >
> > While the code of this patch looks fairly correct to me (there's no
> > need to implement the irq_disable callback and we can just rely on the
> > masking), I'm slightly anxious about the description.  It almost feels
> > like you're somehow relying on the laziness to "fix" your issue here.
>
> i don't think thats the case here. As i have mentioned in previous discussions, reiterating here..

I hadn't followed all the previous discussions, but generally if two
people are independently confused by the same thing it's a sign that
it needs to be explained better.  In this case that means a better
commit message that explains exactly why this isn't a problem.


> During suspend there is no way IRQ will be enabled/unmasked in HW even if its marked for wakeup.
>
> All kernel does during suspend is if an IRQ is not marked for wakeup (did not invoke enable_irq_wake())
> then during suspend those IRQs will get disabled/masked in HW to prevent them waking up.
>
> Note that kernel don't do anything for the IRQs that are marked for wakeup. those IRQs are left in its original state.
> by original state, i mean if the IRQ was enabled/unmasked in HW, it will stay as is, if its disabled/masked it will stay same.
> suspend process won't change the state of those IRQs.
>
> Lets take two cases of lazy and unlazy disable/mask.
>
> case-1)
>
> if the irq_chip implements .irq_disable callback, genirq by default takes unlazy path (immediatly disabled in SW + HW).
> if device enters suspend after client driver calls disable_irq(), there is no way to wakeup with such IRQs, even though
> driver choosen to mark it for wakeup. As i told above, kernel leaves such IRQ in its original state (disabled in SW + HW here)
> This is the problem case where we started with.
>
> case -2)
>
> If the irq_chip did not implements .irq_disable callback, genirq takes lazy disable path and only marks IRQ disabled in SW.
> It is still left enabled in HW. This is what current series is implemented for.

OK, I think I understand what you're trying to say.  What you're
saying is that the important thing is that when you're using the
kernel's "lazy" mode that the kernel will have knowledge of whether a
disabled IRQ is pending.  That's because the IRQ fired once (and the
kernel set IRQS_PENDING) before it got masked.  If we're using a
non-lazy case then the IRQ could be pending but the kernel wouldn't
know.

If that's what you're relying on for this patch to work then it
belongs in the commit message.

...but (see below) I don't think it's working like you think it does.


> > ...but the laziness is supposed to just be an optimization.
> > Specifically if an interrupt happens to fire at any point in time
> > after a driver has called disable_irq() then it acts just like a
> > non-lazy disable.
> >
> > Said another way, I think this is a valid thing for a driver to do and
> > it should get woken up if the irq fires in suspend:
> >
> > disable_irq();
> > msleep(1000);
> > enable_irq_wake()
> >
> > Specifically if an IRQ comes in during that sleep then it will be just
> > like you had a non-lazy IRQ.
>
> i don't think, Let me take your example...driver calls below during suspend
>
>
> 1. disable_irq();
> 2. msleep(1000);
> 3. enable_irq_wake();
>
>     a) if the IRQ comes in before (1) No issue in this case, its just like during active time if any other IRQ gets handled.
>
>     b) if IRQ comes anytime after (1) is over, but (3) is not done (i.e. during msleep())
>
>     - genirq will find that IRQ was disabled in SW,
>     - driver's IRQ handler will not get called since it was disabled in SW via (1).
>     - it will mark pending in SW and then really disables in HW now (lazy disable)
>     - next call is enable_irq_wake(), which will mark IRQ as wake up capable and also re-enable in HW from patch-4 of this series
>       in PDC driver's .irq_set_wake call...
>         if (on) {
>                 pdc_enable_intr(d, true);
>                 irq_chip_enable_parent(d);
>                 set_bit(d->hwirq, pdc_wake_irqs);
>         }
>         with this IRQ will be left enabled/unmasked in HW.
>     - device goes to suspend.
>     - since its enabled/unmasked in HW, it will be able to wake up with this IRQ since GIC will forward this IRQ to CPU to wake it up.

...but what if it's an edge interrupt?  Then:

1. It will fire.
2. It will get marked as IRQS_PENDING and Acked.
3. It will get masked.
4. Your code will unmask and wake up from future edges but the edge
that already came in won't cause a wakeup, right?

Hrm, though I guess that's just a problem in general.  Probably
suspend_device_irq() should check to see if an IRQ is pending?  In any
case, at this point in time it's not a bug that is affecting me since
(right now) cros_ec sets the wakeup _before_ disabling, but it
probably should still be fixed.


>     c) if IRQ comes in anytime after (3) is done,
>
>     - genirq will find that IRQ was disabled in SW
>     - driver's IRQ handler will not get called since it was disabled in SW via (1).
>     - it will mark pending in SW and then really disables in HW now (lazy disable)
>     - it will also notify suspend PM core about this event to abort the suspend since this IRQ was marked for wakeup.

So I tested this and it didn't seem to work.  I went into
cros_ec_suspend() and added a delay after the disable_irq() call.  I
pressed a key on my keyboard while the delay was happening.  When I
pressed the key I saw qcom_pdc_gic_mask() get called for the
interrupt.  ...and the suspend was _not_ aborted.  I watched and the
system continued all the way.

I watched the system go all the way down and shut down the CPUs.
Then, after 6 seconds (!) it woke back up.  I don't quite understand
it, but the 6 seconds here seems to be the time needed to wakeup if
PDC is enabled but the interrupt is masked at the gic level.

Digging a little deeper, I see that in irq_may_run() it was getting true for:

!irqd_has_set(&desc->irq_data, mask)

...and thus it was returning true for irq_may_run() without setting
irq_pm_check_wakeup().

Given that it's not working as you describe it to be working, I feel
like you might need to go back and re-evaluate your approach.  I'll
try to spend more time thinking about this tomorrow too, but I'm about
out of time for the day.


> So, in all cases we are fine.
>
>
> So while I'm for this patch, I'd suggest a simpler description
> (assuming my understanding is correct):
>
> There is no reason to implement irq_disable() and irq_mask().  Let's just
> use irq_mask() and let the rest of the core handle it.
>
> i think current description is fine with above explanation.

As per above, if nothing else you need to clarify things so people
aren't so confused.


> Also: it feels really weird to me that you're getting rid of the
> irq_disable() but keeping irq_enable().  That seems like asking for
> trouble, though I'd have to do more research to see if I could figure
> out exactly what might go wrong.  Could you remove your irq_enable()
> too?
>
>
> -Doug
>
> irq_enable() servers another purpose of clearing any errornous IRQ when enabling it first time, so its kept as it is.
>
> i do not think it causes any troubles.

I kinda ran out of time to dig more here, but it still worries me.
I'll try to dig more tomorrow.  In any case, can't you just clear out
any erroneous IRQs at init time and make it symmetric?

-Doug
