Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF15C2F673C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 18:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbhANRPv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 12:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbhANRPv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 12:15:51 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FEBC061574
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 09:15:10 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id d8so5848573otq.6
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 09:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qaFSjFq15gJ5kL5BciOwoue8YB8M48nAYhLQvOFNNhY=;
        b=h1gf3Ri9zlYKv1/Pt/v3LUg3++8O2s/1Owo9/GL5iV43s6JCbl8Eu56f0hAJ2/mtE2
         K8wSgsL1ZHfGgsp7zJV+74crDethx3ZUxCU39jxneEI2O5ZN+t6FwbwmeDtL9jGw1GpZ
         2YxuM1mOAlpEgYbzcQhZ8RsYW2WkF1GyqXweLV4jnDt0xX/OChXm34qAavAz11EbOtxN
         XbAJzG1sICY3TmuIH7hooetViHHwkS8yj7DHGxwUbRJ/xS1im5VjeD5EufJOaC8YE2Nd
         ifpiyQTkPWd8A8OhQ0AO7GpdnL+Dx9jJmvPuBv/bHU2xkTN7qosp16mFaoCHsxJ3cVm8
         QDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qaFSjFq15gJ5kL5BciOwoue8YB8M48nAYhLQvOFNNhY=;
        b=YNBKv3HUSrJIt13FaO8RLFM/EkeUA4HiME0qdLz821W0OzRKWXoeajQd547q3SOGSA
         7G0GwDJ3hq0FdIMbZ+bbrg19DlHdNyE8QTDkV5vYT6PkYOc1Zb/tAJzHm2+b1JI0agSy
         FFUUyYntvjFJpWm3cJJETqjlSA6s2tW9PWTOOpGEHbCWGnWwMWtSnrhSRV1LP0fur91r
         xUwoLiWfPuDiNQ1aoMjpNVHqoh1M8jl0RafTkkcUUqKf4IBCwrlLDJ29DwomYwCn/7WJ
         N9eEVro8EVfMA9GO1AsMW/2yParFHgVHKDgF2BzQ3set1Nl+y23f2j9aGrC9PB8WptbW
         S4dA==
X-Gm-Message-State: AOAM533jJslhFesykSfy+8gK6m8isgMQSe3QARMQIoCT9IIJI4wnnBxK
        XBu2dSk+lvDAZHeLCsTprwjk3g==
X-Google-Smtp-Source: ABdhPJys2GzDnT5HCru2U+086JIhIuoUHn9W/Swzho2QPCnEX4VWamPgoN/so5v99Q7Tl8RProRR9A==
X-Received: by 2002:a05:6830:1e41:: with SMTP id e1mr5233569otj.143.1610644510091;
        Thu, 14 Jan 2021 09:15:10 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s26sm1175595otd.8.2021.01.14.09.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 09:15:09 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:15:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: Don't clear pending interrupts
 when enabling
Message-ID: <YAB8G137wfisfOqt@builder.lan>
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
 <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
 <161060848425.3661239.17417977666663714149@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161060848425.3661239.17417977666663714149@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 14 Jan 01:14 CST 2021, Stephen Boyd wrote:

> Quoting Douglas Anderson (2021-01-08 09:35:16)
> > Let's deal with the problem like this:
> > * When we mux away, we'll mask our interrupt.  This isn't necessary in
> >   the above case since the client already masked us, but it's a good
> >   idea in general.
> > * When we mux back will clear any interrupts and unmask.
> 
> I'm on board!
> 
> > 
> > Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
> > Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index a6b0c17e2f78..d5d1f3430c6c 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -51,6 +51,7 @@
> >   * @dual_edge_irqs: Bitmap of irqs that need sw emulated dual edge
> >   *                  detection.
> >   * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt controller
> > + * @disabled_for_mux: These IRQs were disabled because we muxed away.
> >   * @soc:            Reference to soc_data of platform specific data.
> >   * @regs:           Base addresses for the TLMM tiles.
> >   * @phys_base:      Physical base address
> > @@ -72,6 +73,7 @@ struct msm_pinctrl {
> >         DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
> >         DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
> >         DECLARE_BITMAP(skip_wake_irqs, MAX_NR_GPIO);
> > +       DECLARE_BITMAP(disabled_for_mux, MAX_NR_GPIO);
> >  
> >         const struct msm_pinctrl_soc_data *soc;
> >         void __iomem *regs[MAX_NR_TILES];
> > @@ -179,6 +181,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> >                               unsigned group)
> >  {
> >         struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +       struct gpio_chip *gc = &pctrl->chip;
> > +       unsigned int irq = irq_find_mapping(gc->irq.domain, group);
> > +       struct irq_data *d = irq_get_irq_data(irq);
> > +       unsigned int gpio_func = pctrl->soc->gpio_func;
> >         const struct msm_pingroup *g;
> >         unsigned long flags;
> >         u32 val, mask;
> > @@ -195,6 +201,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> >         if (WARN_ON(i == g->nfuncs))
> >                 return -EINVAL;
> >  
> > +       /*
> > +        * If an GPIO interrupt is setup on this pin then we need special
> > +        * handling.  Specifically interrupt detection logic will still see
> > +        * the pin twiddle even when we're muxed away.
> > +        *
> > +        * When we see a pin with an interrupt setup on it then we'll disable
> > +        * (mask) interrupts on it when we mux away until we mux back.  Note
> > +        * that disable_irq() refcounts and interrupts are disabled as long as
> > +        * at least one disable_irq() has been called.
> > +        */
> > +       if (d && i != gpio_func &&
> > +           !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
> > +               disable_irq(irq);
> 
> Does it need to be forced non-lazy so that it is actually disabled at
> the GIC? I'm trying to understand how the lazy irq disabling plays into
> this. I think it's a don't care situation because if the line twiddles
> and triggers an irq then we'll actually disable it at the GIC in the
> genirq core and mark it pending for resend. I wonder if we wouldn't have
> to undo the pending state if we actually ignored it at the GIC
> forcefully. And I also worry that it may cause a random wakeup if the
> line twiddles, becomes pending at GIC and thus blocks the CPU from
> running a WFI but it isn't an irq that Linux cares about because it's
> muxed to UART, and then lazy handling runs and shuts it down. Is that
> possible?
> 

I was about to write a question about why we should disable the IRQ
through the irqchip framework, rather than just do it in the hardware
directly.

Which I think means that I came to the same conclusion as you, that if
we have a pin masked to non-gpio, it will still wake the system up, just
to actually disable the IRQ lazily.

Is there a problem with leaving the irq framework to believe the IRQ is
enabled while we disable the delivery in hardware?

Regards,
Bjorn

> > +
> >         raw_spin_lock_irqsave(&pctrl->lock, flags);
> >  
> >         val = msm_readl_ctl(pctrl, g);
> > @@ -204,6 +224,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> >  
> >         raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >  
> > +       if (d && i == gpio_func &&
> > +           test_and_clear_bit(d->hwirq, pctrl->disabled_for_mux)) {
> > +               /*
> > +                * Clear interrupts detected while not GPIO since we only
> > +                * masked things.
> > +                */
> > +               if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> > +                       irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
> 
> So if not lazy this could go away? Although I think this is to clear out
> the pending state in the GIC and not the PDC which is the parent.
> 
> > +               else
> > +                       msm_ack_intr_status(pctrl, g);
> > +
> > +               enable_irq(irq);
> > +       }
> > +
