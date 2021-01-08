Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044A92EF696
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 18:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbhAHRih (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 12:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbhAHRih (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 12:38:37 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189AFC0612EA
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 09:37:57 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id e15so5985331vsa.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 09:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNxooFoPT/SbsRyhcMe6NUax3q2to1RFoVAxRniKpG0=;
        b=WM2aNAVpG4gGin7GprdICL5bytbIZNL88yE2mwarMEQ/XW/n/jOUBRlqNnS5lZSlmt
         UrdO94020ymMxkNkVVnqrqQs4Owo/gEntFiokWZgAmKrOfeidBR7MA+A73lul+cN2GLb
         z96dMHb/v98nRgogIpkKBkeitSYIbS5LxBVYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNxooFoPT/SbsRyhcMe6NUax3q2to1RFoVAxRniKpG0=;
        b=hZ1D2usLva/pcDotM06gUIujNAve/0FmG1iXDAztXC/jkMXS6Qt4CujEVuVKeDwWyA
         XXyiGbZg7QogIvty/gOlVWOaS2R83HAR7ef5kGsZ72qjhm6xlMxI//Uez3IV6femNO3v
         r/CvIAMCt1ct7v9MrSyfkfzj/sgO4R78mjMc9kFgihCU309ZnhmnZb632FJFB263Jv2I
         hTiOFb6OnOfcQ7E7Vgk8ILWmYRuEi4WOtR9JkCN3+sXzXK7FRFSBMMRdwAoERzkEKRoM
         WbIm8GN8qv/Xa7PQ3euoODYHDu7nn4YRV15S3EQjFQaPXw+lR3RiZtZdufzwbuxm51kY
         W7yw==
X-Gm-Message-State: AOAM532NbKZ6ituxfEH4H070ghrgJS/EF/mYMdzsnhmV7b4qj4SdBukj
        D2fV+l5K5Ac8armOL9ZUmzHnuNIkALVaSw==
X-Google-Smtp-Source: ABdhPJzUcQRN1JqpsXgG6CXj/1Fu6h/ZX1gT37erP/NaeyZRKWU8hyfaeu4DLQwtIGy8a1Mjq8NW4w==
X-Received: by 2002:a67:30c1:: with SMTP id w184mr3806865vsw.13.1610127475991;
        Fri, 08 Jan 2021 09:37:55 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id y2sm377327vkg.47.2021.01.08.09.37.54
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 09:37:55 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id x4so5953838vsp.7
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 09:37:54 -0800 (PST)
X-Received: by 2002:a05:6102:21c4:: with SMTP id r4mr3929051vsg.37.1610127473926;
 Fri, 08 Jan 2021 09:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201211141514.v4.3.I7cf3019783720feb57b958c95c2b684940264cd1@changeid> <c0dc57ad-a087-6d98-cb7f-74044c556f83@codeaurora.org>
In-Reply-To: <c0dc57ad-a087-6d98-cb7f-74044c556f83@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Jan 2021 09:37:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WNp06dE3J1KcNZBBW9_07tz_vAzoutEupb74cwae+W=w@mail.gmail.com>
Message-ID: <CAD=FV=WNp06dE3J1KcNZBBW9_07tz_vAzoutEupb74cwae+W=w@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: qcom: Don't clear pending interrupts when enabling
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Dec 21, 2020 at 8:01 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi Doug,
>
> On 12/12/2020 3:45 AM, Douglas Anderson wrote:
> > In Linux, if a driver does disable_irq() and later does enable_irq()
> > on its interrupt, I believe it's expecting these properties:
> > * If an interrupt was pending when the driver disabled then it will
> >    still be pending after the driver re-enables.
> > * If an edge-triggered interrupt comes in while an interrupt is
> >    disabled it should assert when the interrupt is re-enabled.
> >
> > If you think that the above sounds a lot like the disable_irq() and
> > enable_irq() are supposed to be masking/unmasking the interrupt
> > instead of disabling/enabling it then you've made an astute
> > observation.  Specifically when talking about interrupts, "mask"
> > usually means to stop posting interrupts but keep tracking them and
> > "disable" means to fully shut off interrupt detection.  It's
> > unfortunate that this is so confusing, but presumably this is all the
> > way it is for historical reasons.
> >
> > Perhaps more confusing than the above is that, even though clients of
> > IRQs themselves don't have a way to request mask/unmask
> > vs. disable/enable calls, IRQ chips themselves can implement both.
> > ...and yet more confusing is that if an IRQ chip implements
> > disable/enable then they will be called when a client driver calls
> > disable_irq() / enable_irq().
> >
> > It does feel like some of the above could be cleared up.  However,
> > without any other core interrupt changes it should be clear that when
> > an IRQ chip gets a request to "disable" an IRQ that it has to treat it
> > like a mask of that IRQ.
> >
> > In any case, after that long interlude you can see that the "unmask
> > and clear" can break things.  Maulik tried to fix it so that we no
> > longer did "unmask and clear" in commit 71266d9d3936 ("pinctrl: qcom:
> > Move clearing pending IRQ to .irq_request_resources callback"), but it
> > only handled the PDC case (it also had problems, but that's the
> > subject of another patch).  Let's fix this for the non-PDC case.
> >
> >  From my understanding the source of the phantom interrupt in the
> > non-PDC case was the one that could have been introduced in
> > msm_gpio_irq_set_type().  Let's handle that one and then get rid of
> > the clear.
> >
> > Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I don't have lots of good test cases here, so hopefully someone from
> > Qualcomm can confirm that this works well for them and there isn't
> > some other phantom interrupt source that I'm not aware of.
> >
> > Changes in v4:
> > - ("pinctrl: qcom: Don't clear pending interrupts when enabling") split for v4.
> >
> >   drivers/pinctrl/qcom/pinctrl-msm.c | 32 +++++++++++++-----------------
> >   1 file changed, 14 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 588df91274e2..f785646d1df7 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -774,7 +774,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
> >       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >   }
> >
> > -static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
> > +static void msm_gpio_irq_unmask(struct irq_data *d)
> >   {
> >       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> >       struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> > @@ -792,17 +792,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
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
> Removing above does not cover the case where GPIO IRQ do not have parent
> PDC.
>
> Specifically, for edge IRQs during masking we donot clear
> intr_raw_status_bit.
> see below at msm_gpio_irq_mask()
>
>          if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK)
>                  val &= ~BIT(g->intr_raw_status_bit);
>
> we have to keep the bit set anyway so that edges are latched while the
> line is masked.
>
> The problem is even when GPIO is set to some other function like
> "mi2s_2" it can still sense the line at make
> interrupt pending depending on the line toggle if intr_raw_status_bit is
> left set.

Ah, so it's the same problem as we have with the PDC.  Makes sense.


> I have thought of solution to this,
>
> 1) During msm_gpio_irq_mask() we keep intr_raw_status_bit set already in
> today's code
> This will make edges to latch when the line is masked.
> so no change required for this.
>
> 2) During msm_pinmux_set_mux() if we set GPIO to anyother function than
> GPIO interrupt mode,
> we clear intr_raw_status_bit, so the interrupt cannot latch when GPIO is
> used in other function.
> Below snippet can be inserted in msm_pinmux_set_mux()
>
>          val |= i << g->mux_bit;
>          msm_writel_ctl(val, pctrl, g);
>
> +        if (i != gpio_func) {
> +                val = msm_readl_intr_cfg(pctrl, g);
> +                val &= ~BIT(g->intr_raw_status_bit);
> +                msm_writel_intr_cfg(val, pctrl, g);
> +        }
> +
>          raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>
> 3) During msm_gpio_irq_unmask(), if the intr_raw_status_bit is not set,
> then clear the pending IRQ.
> specifically setting this bit itself can cause the error IRQ, so clear
> it when setting this.
>
> for edge IRQ, intr_raw_status_bit can only be cleared in
> msm_pinmux_set_mux() so clearing pending
> IRQ should not loose any edges since we know GPIO was used in other
> function mode like mi2s_2 for
> which we do not need to latch IRQs.
> Below snippet can be inserted in msm_gpio_irq_unmask()
>
> +       was_enabled = val & BIT(g->intr_raw_status_bit);
>          val |= BIT(g->intr_raw_status_bit);
>          val |= BIT(g->intr_enable_bit);
>          msm_writel_intr_cfg(val, pctrl, g);
>
> +       if (!was_enabled) {
> +               val = msm_readl_intr_status(pctrl, g);
> +               val &= ~BIT(g->intr_status_bit);
> +               msm_writel_intr_status(val, pctrl, g);
> +       }
> +
>          set_bit(d->hwirq, pctrl->enabled_irqs);
>
> This can cover the cases for which the GPIO do not have parent.

I think your solution can be made to work, but I think also we can
just use the exact same solution that I already came up with in patch
#4.  We can leave the "raw" bit alone and just mask the interrupt when
we switch the mux, then clear the interrupt when we switch back.

I've now combined the PDC/non-PDC cases and it actually turned out
fairly clean I think.  See what you think about v5.

-Doug
