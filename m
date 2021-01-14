Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852012F5B1F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 08:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbhANHPd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 02:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbhANHPd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 02:15:33 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E41DC061575
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jan 2021 23:14:47 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id c22so3137508pgg.13
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jan 2021 23:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=OwRfqD0YnqmsUnmWg+j8CrMA8g6zFsMROmDWudFkMws=;
        b=D40JTh/WlJbBPmXf9TRmQxsAF37NVHwxgW6GQmhs2RZcMJQE7JMCeP6QlcbZwhSKrn
         lUBu8F/G0ajDoxVKkovPBbyYKAwdkW/s17EGwF3Li+iho+0WWlBwURfGrCBPnDOeSuWB
         aPR7+sWByCv3HqqoAqbVlMAgNZGWW08RiQ9mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=OwRfqD0YnqmsUnmWg+j8CrMA8g6zFsMROmDWudFkMws=;
        b=PzO0ylCaWKAcL3036VxwEy4cxj+oeqrSD4DSj18Dlqcu5dQra8qXsQeen4HdvxbhG6
         qVydVD8+5jtDoXEchzTOboXH00B7SEZjX9+Bj7HRIHBajZ6HdkXK/kPYamghmV1iVyzm
         k+la/fn5ifSEsD+FM4alN0VZQXcKhCw3/Cg37Y5Wmorxlj63jHafC9hiy83+Kq0k+pk+
         WDZh3wEhWxZuKfI3qoRNvSF95rHkJL/Ebawn1FZZrGR2HBnnFuI4baBq619toZdAfft6
         MRWi8LBqa9g7lKKRFoC0m7wjaCf/I9ic6izW+/ocYD1sydwA0aOBu3tJ0S0+sktBW8q/
         s87g==
X-Gm-Message-State: AOAM532VZDZs/tsNoGmbiC4qQaqBGG+z36zAHPNsVNHvkgO3uy3IbvG/
        0anJSlYbkej8x+VRX9GN9kPdqw==
X-Google-Smtp-Source: ABdhPJwUdidcdCjUhSkb43ssf1w2quZyKuKdGDjB6nCiqwidUNHmerShXUdelhOi7sgkHtMW/fXydg==
X-Received: by 2002:aa7:979d:0:b029:1a4:3b76:a559 with SMTP id o29-20020aa7979d0000b02901a43b76a559mr6122076pfp.49.1610608486387;
        Wed, 13 Jan 2021 23:14:46 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id n1sm4329919pfu.28.2021.01.13.23.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 23:14:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid> <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Wed, 13 Jan 2021 23:14:44 -0800
Message-ID: <161060848425.3661239.17417977666663714149@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2021-01-08 09:35:16)
> Let's deal with the problem like this:
> * When we mux away, we'll mask our interrupt.  This isn't necessary in
>   the above case since the client already masked us, but it's a good
>   idea in general.
> * When we mux back will clear any interrupts and unmask.

I'm on board!

>=20
> Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio=
")
> Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_re=
quest_resources callback")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index a6b0c17e2f78..d5d1f3430c6c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -51,6 +51,7 @@
>   * @dual_edge_irqs: Bitmap of irqs that need sw emulated dual edge
>   *                  detection.
>   * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt contr=
oller
> + * @disabled_for_mux: These IRQs were disabled because we muxed away.
>   * @soc:            Reference to soc_data of platform specific data.
>   * @regs:           Base addresses for the TLMM tiles.
>   * @phys_base:      Physical base address
> @@ -72,6 +73,7 @@ struct msm_pinctrl {
>         DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
>         DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
>         DECLARE_BITMAP(skip_wake_irqs, MAX_NR_GPIO);
> +       DECLARE_BITMAP(disabled_for_mux, MAX_NR_GPIO);
> =20
>         const struct msm_pinctrl_soc_data *soc;
>         void __iomem *regs[MAX_NR_TILES];
> @@ -179,6 +181,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pc=
tldev,
>                               unsigned group)
>  {
>         struct msm_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
> +       struct gpio_chip *gc =3D &pctrl->chip;
> +       unsigned int irq =3D irq_find_mapping(gc->irq.domain, group);
> +       struct irq_data *d =3D irq_get_irq_data(irq);
> +       unsigned int gpio_func =3D pctrl->soc->gpio_func;
>         const struct msm_pingroup *g;
>         unsigned long flags;
>         u32 val, mask;
> @@ -195,6 +201,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pc=
tldev,
>         if (WARN_ON(i =3D=3D g->nfuncs))
>                 return -EINVAL;
> =20
> +       /*
> +        * If an GPIO interrupt is setup on this pin then we need special
> +        * handling.  Specifically interrupt detection logic will still s=
ee
> +        * the pin twiddle even when we're muxed away.
> +        *
> +        * When we see a pin with an interrupt setup on it then we'll dis=
able
> +        * (mask) interrupts on it when we mux away until we mux back.  N=
ote
> +        * that disable_irq() refcounts and interrupts are disabled as lo=
ng as
> +        * at least one disable_irq() has been called.
> +        */
> +       if (d && i !=3D gpio_func &&
> +           !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
> +               disable_irq(irq);

Does it need to be forced non-lazy so that it is actually disabled at
the GIC? I'm trying to understand how the lazy irq disabling plays into
this. I think it's a don't care situation because if the line twiddles
and triggers an irq then we'll actually disable it at the GIC in the
genirq core and mark it pending for resend. I wonder if we wouldn't have
to undo the pending state if we actually ignored it at the GIC
forcefully. And I also worry that it may cause a random wakeup if the
line twiddles, becomes pending at GIC and thus blocks the CPU from
running a WFI but it isn't an irq that Linux cares about because it's
muxed to UART, and then lazy handling runs and shuts it down. Is that
possible?

> +
>         raw_spin_lock_irqsave(&pctrl->lock, flags);
> =20
>         val =3D msm_readl_ctl(pctrl, g);
> @@ -204,6 +224,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pc=
tldev,
> =20
>         raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> =20
> +       if (d && i =3D=3D gpio_func &&
> +           test_and_clear_bit(d->hwirq, pctrl->disabled_for_mux)) {
> +               /*
> +                * Clear interrupts detected while not GPIO since we only
> +                * masked things.
> +                */
> +               if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake=
_irqs))
> +                       irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDIN=
G, false);

So if not lazy this could go away? Although I think this is to clear out
the pending state in the GIC and not the PDC which is the parent.

> +               else
> +                       msm_ack_intr_status(pctrl, g);
> +
> +               enable_irq(irq);
> +       }
> +
