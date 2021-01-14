Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789F42F66D1
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 18:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbhANRH6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 12:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbhANRH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 12:07:57 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5FBC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 09:07:17 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id s75so6635924oih.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 09:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SwBoPxM4e+KPD8l3ra5+IOX8Gq6+3SFn8A7GKWD3FX8=;
        b=UkMSbIXmINhwwlXIKiQREIz9EE6dc734maENiqSjMl23e7Bl2Hp8HGV5AKJn+EF+q0
         dZ6qP66LdOaplurMTV6uy2Y/iER2gnlK6SeN//w+CwECRVXTU2PBtQTYF2ciGQsGA6v7
         Gh023QIBNMD5JgEBjcdCh0Ei676E7dtyx+E9QPDDtZEfKsI6ziuOq0bm6gp8wMYd4TSL
         iUn1T17m8zSs6W2Y9hqjZNHzpKjBh5AMZ39byUvcRwl9D+SQ3QePrbeBvLAfCoXatdal
         JndcIkjepGFnFNqMU5IdO9ytDA2Fhfr8XUWtbDsG+SPa3Df6yRzLxDQtv7+Tj3S3l1DI
         Fj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SwBoPxM4e+KPD8l3ra5+IOX8Gq6+3SFn8A7GKWD3FX8=;
        b=UyGTZMOLoB4OiLUM0Jvdmq7S6vpq62mVA0eDuxBwJSMUI94yXiHJVwRfzRT8NgYB14
         5FeFunmoUus24ndKhrsyVeFArwuvWJzMQtPOaiBlDoUBx39n4o1PCITEWhmN1M5MeJ7T
         O6Smd/ajb7h2w2gQUT1EEGsRWTH0+NtlzUWlCcu+vS6D9c2iiywOpy2X0vdWHUOuay11
         OXnEwd2CKzivPcixTU6zUPt9tk1Et0ZGiDCVVW30Lv3iuMg9E6WqvS2aeAHd0rPDBg4a
         UkNV5blXHD03clStAxH+HYeedFizxfOItbWzv9wATz19CyuVI9zIsV17ABe8AIrATW7s
         qgPg==
X-Gm-Message-State: AOAM533ZrGi5pmvPdryqGvCFA7dDKoZX8MecMUPzmQHjIi8rEmFQmJJ6
        CJPsblyyY0nXKNo9HSzqKD41WQ==
X-Google-Smtp-Source: ABdhPJxVXWM9mjiCf22SQnw+II6tdd70Uwa07Rx0n6gfDC3X/paXkU7oCl8eACEe8c/bpSAZNiDp+w==
X-Received: by 2002:aca:efc6:: with SMTP id n189mr3140106oih.161.1610644036934;
        Thu, 14 Jan 2021 09:07:16 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g200sm1141338oib.19.2021.01.14.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 09:07:16 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:07:14 -0600
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
Message-ID: <YAB6QsmypEZa9SOP@builder.lan>
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

Isn't this the PDC line after all, because the GIC only has the summary
line while the PDC (if we have d->parent_data) has a dedicated line for
this irq?

Regards,
Bjorn

> > +               else
> > +                       msm_ack_intr_status(pctrl, g);
> > +
> > +               enable_irq(irq);
> > +       }
> > +
