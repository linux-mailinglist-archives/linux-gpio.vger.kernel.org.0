Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677282C2EA8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 18:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390739AbgKXRdp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 12:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728749AbgKXRdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 12:33:45 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB8FC0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:33:45 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id a4so1451453vko.11
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S/7cBjE/AfveVXpAj/uvg/w2sEy/HbRfkcflcOYN7C8=;
        b=L+ktrhFuLC7tlnEWV+GD853KPvJnX4kL8MEMVfOeG5O/s5DoBkR6n3p8b1mu6nAA/M
         /GBz8mmMnoD0FBEAK+0Rn7HRWGbh3RkoQjwcImHhgsKm0RsKFNw5V6RG2dva+NQl46hj
         EQ3VXHdX+6x8jK9b9evNB/J2pYTCGdUNakOHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S/7cBjE/AfveVXpAj/uvg/w2sEy/HbRfkcflcOYN7C8=;
        b=Ka8Bnv7wz6SC8TpxuZX0VZAWmSnd9ZSOJTkXEsVVkjLCi5YMSYK31xht8XxhhjoaIV
         w83uU9Vjm42y2KvzgLl5U7TYaOIZRP+ojH72gSn0yCM1FKyZkTsS9KBW6gMMH5JUQ/OW
         kKYUzKVnmrt8s9CuphoG8okA5VREwT49GqyDTeKsCFSrIhKqS9pQGqcARlmcN6FSEppH
         fk/pcGD8WpyLTrqNfMiKTodYo6cnxU+Ig6Hc+eyZDfLgC00TOFl9VHGWVGLt/lDtntAE
         psEOKDVd+ldIy+ydreJ0WK06OPuatrOXjWo+YOYmYNsiOIJ2Z7mwcfTHm8wwYnn2E8Lv
         iiTg==
X-Gm-Message-State: AOAM530tR8LemQqtrClkFfHa1Z6EFekh+fmdqwvx+COFiy2nsZyVdyiI
        yy/7DFLB7M58ceMNThWN7Re4Y+R0W4sMgg==
X-Google-Smtp-Source: ABdhPJzBjfAWn6yNePG46qBlGY4l6+YwXG1dR5kvFc1PbpLKNWznLpUIHEnQxd1NG3Nr9KXeUsnQ6Q==
X-Received: by 2002:a1f:ab44:: with SMTP id u65mr5094257vke.18.1606239223982;
        Tue, 24 Nov 2020 09:33:43 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 187sm1559657vsv.6.2020.11.24.09.33.42
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 09:33:43 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id n5so6066440uao.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:33:42 -0800 (PST)
X-Received: by 2002:ab0:60b1:: with SMTP id f17mr3738253uam.104.1606239222440;
 Tue, 24 Nov 2020 09:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201123160139.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid> <502b39f5-a2b3-5893-da18-47b034f4895d@codeaurora.org>
In-Reply-To: <502b39f5-a2b3-5893-da18-47b034f4895d@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Nov 2020 09:33:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WP8hCuwC3RibfZw0diPE0Lgd2-FOt+t4FZUTqKCASBmg@mail.gmail.com>
Message-ID: <CAD=FV=WP8hCuwC3RibfZw0diPE0Lgd2-FOt+t4FZUTqKCASBmg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>Hi,

On Tue, Nov 24, 2020 at 2:37 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> > +static void msm_pinctrl_clear_pending_irq(struct msm_pinctrl *pctrl,
> > +                                       unsigned int group,
> > +                                       unsigned int irq)
> > +{
> > +     struct irq_data *d = irq_get_irq_data(irq);
> > +     const struct msm_pingroup *g;
> > +     unsigned long flags;
> > +     u32 val;
> > +
> > +     if (!d)
> > +             return;
> > +
> > +     if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> > +             irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
> > +
>
> can you add return here if IRQ has parent PDC?

Sure, done.


> also replace 0 with false as Marc suggested in patch 1 of this series.

Thanks for the reminder.


> > @@ -187,15 +215,26 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
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
>
> disable_irq() and enable_irq() should be moved inside this if loop. as
> only use for this is to mask the IRQ when switching back to gpio IRQ mode?

That totally breaks things.  Specifically the glitch actually
introduced above when we write the mux.  If the interrupt wasn't
disabled then we'd race our Ack-ing of it with it firing, right?  So
the disable _has_ to be above the mux change.


> i also don't think we should leave IRQ enabled at the end of this
> function by default, probably need to check if IRQ was already unmasked
> before disabling it, then only call enable_irq().

Marc already replied, but that's not how it works.  disable_irq() and
enable_irq() are reference counted, so as long as we match them then
we're leaving the state exactly the same as when we started, right?

To enumerate the possibilities:

a) If the GPIO wasn't configured as an interrupt at all, the
disable/enable are no-ops.

b) If the interrupt was already disabled, we'll increase the reference
count and then decrease it at the end.

c) If the interrupt wasn't already disabled, we'll disable it and then
re-enable it.


> > @@ -456,32 +495,45 @@ static const struct pinconf_ops msm_pinconf_ops = {
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
> > +     if (oldval != val)
> > +             msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
> > +
> > +     enable_irq(irq);
>
> i do not think we need disable_irq() and enable_irq() here, changing
> direction to input does not mean its being used for interrupt only, it
> may be set to use something like Rx mode in UART.
>
> the client driver should enable IRQ when needed.

Check the implementation of disable_irq() and enable_irq().  They are
silent no-ops if the interrupt isn't setup, so this doesn't hurt.

If we don't need the disable_irq() and enable_irq() here then we also
don't need to clear the pending irq.  If we need to clear the pending
irq then we need them to avoid the interrupt handler getting called.


> > @@ -774,7 +831,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
> >       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >   }
> >
> > -static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
> > +static void msm_gpio_irq_unmask(struct irq_data *d)
> >   {
> >       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> >       struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> > @@ -792,17 +849,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
> >
> >       raw_spin_lock_irqsave(&pctrl->lock, flags);
> >
> > -     if (status_clear) {
> > -             /*
> > -              * clear the interrupt status bit before unmask to avoid
> > -              * any erroneous interrupts that would have got latched
> > -              * when the interrupt is not in use.
> > -              */
> can you please carry this comment in msm_pinctrl_clear_pending_irq()?

I could, but as per the big long description of this patch I think
that comment is wrong / misleading.  It implies that the interrupt
controller was somehow paying attention even when the input was muxed
away (or similar).  After my recent tests I don't believe that's
actually what was happening.  I believe the glitches you were trying
to clear here were actually introduced by changing the muxing.


> > @@ -815,14 +861,10 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
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
> >   }
> >
> >   static void msm_gpio_irq_disable(struct irq_data *d)
> > @@ -837,11 +879,6 @@ static void msm_gpio_irq_disable(struct irq_data *d)
> >               msm_gpio_irq_mask(d);
> >   }
> >
> > -static void msm_gpio_irq_unmask(struct irq_data *d)
> > -{
> > -     msm_gpio_irq_clear_unmask(d, false);
> > -}
> > -
> >   /**
> >    * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs handled by parent.
> >    * @d: The irq dta.
> > @@ -1097,19 +1134,6 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
> >               ret = -EINVAL;
> >               goto out;
> >       }
> > -
> > -     /*
> > -      * Clear the interrupt that may be pending before we enable
> > -      * the line.
> > -      * This is especially a problem with the GPIOs routed to the
> > -      * PDC. These GPIOs are direct-connect interrupts to the GIC.
> > -      * Disabling the interrupt line at the PDC does not prevent
> > -      * the interrupt from being latched at the GIC. The state at
> > -      * GIC needs to be cleared before enabling.
> > -      */
> can you please carry this comment in msm_pinctrl_clear_pending_irq()?

I also think this comment is wrong / misleading.  Specifically:

1. I added a test patch to remux a line away from GPIO mode.

2. I toggled this line back and forth.

3. I then muxed it back.

4. I did not see any indication that the GIC was observing the line
when it was muxed away.  No interrupts were pending until I muxed it
back and caused the glitch.  Also: muxing it back could cause a glitch
regardless of whether I toggled it.

I will certainly admit that I could have messed up in my testing.  If
you have tested this yourself and you're certain that there is a case
where that comment is correct then please let me know and I'll
re-test.  One of the test patches I used when poking at this can be
found at <https://crrev.com/c/2556012>.

-Doug
