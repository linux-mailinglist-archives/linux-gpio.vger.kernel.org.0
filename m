Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105DD2C9034
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 22:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbgK3Vpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 16:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgK3Vpa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 16:45:30 -0500
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E935DC0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 13:44:49 -0800 (PST)
Received: by mail-ua1-x941.google.com with SMTP id q4so4253203ual.8
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 13:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IzzFMOQ2YRkMCxvmCHg5ti/PD9Utfx1/a9X+8+nAZS8=;
        b=DiM9VTBpsGfF9Mg6DLeQBhQngC+yXQQoSTzGiVNcv2tsU3mDuzvVLjiOQgTRau2QLp
         CD40nTcjniPdPwpqwJtj2FKR5bg6PWcyzSbPvWijZwXUe1nYzdZIO3WGYtPerKjIOqFz
         zfWXVP1/W0A6/XDilEZ8xvQXeYPk2m7qV9QpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IzzFMOQ2YRkMCxvmCHg5ti/PD9Utfx1/a9X+8+nAZS8=;
        b=Cq5/yuUGyXuvTYC2aA+p7in64pV4pX3V+xMzcs+b3bqTJWdP99re6CoM11k4gSBjNc
         VCDoIhR/JlzbCqBsKTspUYT700FIGXe/WIU0kmi40xrQsNj5z6hKw3pM5qGuFzBpsa8d
         7qDGtqo/XP1zbhVbYhrFbkZQivSYcePbtFa9qOJJuRIYX5Y0Cg4XiHPL0QXy7wnqGeqH
         KeGyQmLLQPmIEY9qn5uA6bERESZzsVA3tNguZbqDLPccosakgvRPvJP7QEfUI7hkOfQ7
         Z9pAeI2PQrikcJNzwxmPXPO8Y5hJCebqPBXS+QDfsMHmlQsDgQoNGjCKy2xLN95A3qdQ
         Cykw==
X-Gm-Message-State: AOAM530MDNICT5mzHtVzgech00S2RayvSWyEU8OacLZwxI5+CiTL0l2R
        38jwimqKVqlSCac5El0y8KoRMXCb7RmydA==
X-Google-Smtp-Source: ABdhPJxVdUhQjMSK2CA+oHruEG97XPxrUaE7NxntGK6PqufbktZ+Tc2i820wqdyKMa6wk6XHx3DQ9g==
X-Received: by 2002:ab0:3901:: with SMTP id b1mr20457867uaw.34.1606772688323;
        Mon, 30 Nov 2020 13:44:48 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id j21sm5650721vsf.18.2020.11.30.13.44.47
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 13:44:47 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id x4so2995875uac.11
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 13:44:47 -0800 (PST)
X-Received: by 2002:a9f:24eb:: with SMTP id 98mr14259940uar.90.1606772686598;
 Mon, 30 Nov 2020 13:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid> <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org>
In-Reply-To: <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Nov 2020 13:44:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
Message-ID: <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Nov 30, 2020 at 2:33 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> > [1] https://lore.kernel.org/r/603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org
> Please wait to land [1] before i confirm with HW team if this is indeed
> valid case.

Oh, oops.  Somehow I thought your reply was in response to patch #3 in
the series, not #1.  I responded to patch #1 in the series now to make
it clear to wait for you.


> > @@ -187,15 +217,26 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> >       if (WARN_ON(i == g->nfuncs))
> >               return -EINVAL;
> >
> > -     raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +     disable_irq(irq);
> >
> > -     val = msm_readl_ctl(pctrl, g);
> > +     raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +     oldval = val = msm_readl_ctl(pctrl, g);
> >       val &= ~mask;
> >       val |= i << g->mux_bit;
> >       msm_writel_ctl(val, pctrl, g);
> > -
> >       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >
> > +     /*
> > +      * Clear IRQs if switching to/from GPIO mode since muxing to/from
> > +      * the GPIO path can cause phantom edges.
> > +      */
> > +     old_i = (oldval & mask) >> g->mux_bit;
> > +     if (old_i != i &&
> > +         (i == pctrl->soc->gpio_func || old_i == pctrl->soc->gpio_func))
> > +             msm_pinctrl_clear_pending_irq(pctrl, group, irq);
> > +
>
> The phantom irq can come when switching to GPIO irq mode. so may be only
> check if (i == pctrl->soc->gpio_func) {

Have you tested this experimentally?

I have experimentally tested this and I can actually see an interrupt
generated when I _leave_ GPIO as well as when I enter GPIO mode.  If
you can't see this I can re-setup my test, but this was one of those
things that convinced me that the _transition_ is what was causing the
fake interrupt.

I think my test CL <https://crrev.com/c/2556012/> can help you with
testing if you wish.


> even better if you can clear this unconditionally.

Why?  It should only matter if we're going to/from GPIO mode.


> > @@ -456,32 +497,49 @@ static const struct pinconf_ops msm_pinconf_ops = {
> >   static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> >   {
> >       const struct msm_pingroup *g;
> > +     unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
> >       struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
> >       unsigned long flags;
> > +     u32 oldval;
> >       u32 val;
> >
> >       g = &pctrl->soc->groups[offset];
> >
> > +     disable_irq(irq);
> > +
> >       raw_spin_lock_irqsave(&pctrl->lock, flags);
> >
> > -     val = msm_readl_ctl(pctrl, g);
> > +     oldval = val = msm_readl_ctl(pctrl, g);
> >       val &= ~BIT(g->oe_bit);
> >       msm_writel_ctl(val, pctrl, g);
> >
> >       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >
> > +     /*
> > +      * Clear IRQs if switching to/from input mode since that can use
> > +      * a phantom edge.
> > +      */
> > +     if (oldval != val)
> > +             msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
> same as above, can you clear this unconditionally.

Any reason why?  If we didn't change anything then there's no reason
to go through all this extra code?


> >   static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, int value)
> >   {
> >       const struct msm_pingroup *g;
> > +     unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
> >       struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
> >       unsigned long flags;
> > +     u32 oldval;
> >       u32 val;
> >
> >       g = &pctrl->soc->groups[offset];
> >
> > +     disable_irq(irq);
> > +
> >       raw_spin_lock_irqsave(&pctrl->lock, flags);
> >
> >       val = msm_readl_io(pctrl, g);
> > @@ -491,12 +549,21 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
> >               val &= ~BIT(g->out_bit);
> >       msm_writel_io(val, pctrl, g);
> >
> > -     val = msm_readl_ctl(pctrl, g);
> > +     oldval = msm_readl_ctl(pctrl, g);
>
> should be, oldval = val = msm_readl_ctl(pctrl, g);
>
> otherwise val will carry invalid value.

Whoa!  Good catch.  How did I miss that and how did it not fail?  I
will fix in a v3 but will wait until other questions are resolved
before sending.


> >       val |= BIT(g->oe_bit);
> >       msm_writel_ctl(val, pctrl, g);
> >
> >       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >
> > +     /*
> > +      * Clear IRQs if switching to/from input mode since that can use
> > +      * a phantom edge.
> > +      */
> > +     if (oldval != val)
> > +             msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
>
> i don't see a reason to clear the edges when switching to output mode.
>
> can you remove the changes from .direction_output callback?

I haven't confirmed that this can glitch, however I did confirm that I
could glitch when muxing _away_ from GPIO mode.  This makes me believe
that I could also glitch when muxing to an output.

I can try to concoct a test for this if necessary.


> > @@ -792,17 +859,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
> >
> >       raw_spin_lock_irqsave(&pctrl->lock, flags);
> >
> > -     if (status_clear) {
> > -             /*
> > -              * clear the interrupt status bit before unmask to avoid
> > -              * any erroneous interrupts that would have got latched
> > -              * when the interrupt is not in use.
> > -              */
> > -             val = msm_readl_intr_status(pctrl, g);
> > -             val &= ~BIT(g->intr_status_bit);
> > -             msm_writel_intr_status(val, pctrl, g);
> > -     }
> > -
> Above change was clearing irq in .irq_enable callback which will do
> clear + unmask from irq_startup() at the very end.
> With your change, The problem is we have cleared the phantom irq much
> earlier in __setup_irq() phase and in below case its still latched as
> pending.
>
> 1. The client driver calls request_irq() => __setup_irq()
> 2. __setup_irq() then first invokes irq_request_resources() =>
> msm_gpio_irq_reqres() => msm_pinmux_set_mux() =>
> msm_pinctrl_clear_pending_irq()
> 3. __setup_irq() goes ahead and invokes __irq_set_trigger() =>
> msm_gpio_irq_set_type()
> 4. __setup_irq() then invokes irq_startup() => gpiochip_irq_enable() =>
> msm_gpio_irq_enable()
>
> The phantom irq gets cleared in step (2) here, but with step (3) it gets
> latched again and at the end of step (4) still get phantom irq.
> This seems because as per below comment in driver, pasting the part
> which has info,
> /*
>   * The edge detection logic seems to have a problem where toggling the
> RAW_STATUS_EN bit may
>   * cause the status bit to latch spuriously when there isn't any edge
>   */
> In step (3) msm_gpio_irq_set_type() touches the RAW_STATUS_EN making the
> phantom irq pending again.
> To resolve this, you will need to invoke msm_pinctrl_clear_pending_irq()
> at the end of the msm_gpio_irq_set_type().
>
> I would like Rajendra's (already in cc) review as well on above part.

Ugh, so we need a clear in yet another place.  Joy.  OK, I will wait
for Rajendra's comment but I can add similar code in
msm_gpio_irq_enable().


> >       val = msm_readl_intr_cfg(pctrl, g);
> >       val |= BIT(g->intr_raw_status_bit);
> >       val |= BIT(g->intr_enable_bit);
> > @@ -815,14 +871,10 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
> >
> >   static void msm_gpio_irq_enable(struct irq_data *d)
> >   {
> > -     struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > -     struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> > -
> >       if (d->parent_data)
> >               irq_chip_enable_parent(d);
> >
> > -     if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
> > -             msm_gpio_irq_clear_unmask(d, true);
> > +     msm_gpio_irq_unmask(d);
>
> Still need the above if condition, the previous call
> irq_chip_enable_parent() already enabled the IRQ at PDC and GIC, so only
> go ahead to enable it at TLMM if there wasn't any parent.
>
> if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
>          msm_gpio_irq_unmask(d);

Right.  I'll fix it when I send the v3.  Thanks!

-Doug
