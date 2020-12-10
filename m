Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146642D6BB2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 00:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391805AbgLJXN2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 18:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391929AbgLJXNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 18:13:17 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5D5C0611C5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 14:36:38 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id w5so4861938pgj.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 14:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=xlLTehXao3L+8slBUwstxzkj3xGakt1I1gvmwmpUIPw=;
        b=an5YiOtX7Oi6tud/7z1vdP7xQlXnqpa5MmW+FzyxjOkliXtTUg45JoUE1vtYinPjC7
         hCa+Gz+8smpPXpLFRTV/bdG3UBrjeckYYAJdL5/7yeZfJkGYS1Ig/aelzrzHxTqea1aO
         4PROArPooHAZ7pb4vpeFGHH6+xIcFZ4FhZh3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=xlLTehXao3L+8slBUwstxzkj3xGakt1I1gvmwmpUIPw=;
        b=FET3+hP0QxWLHl+tz4ROhTc4Z8xiFrFk7M/TgqthFdoaEHQvX45rf6Zk/ZksicQYkq
         zPNn1Rz7R2vyKJUUpb3u+AEULt5NKL3PbLPN2qSPnuEdpnMYHrk4fsPI/yY9uQcr6Kfg
         wiW22hsS0xXSLavEtn4482fCRn3uHt2+mxSm5Kav13cOWbR9CbB+g3CWX15B+yFMd22J
         6jp9XA2f4AQM6YHdgD6PHyJQMgGjUfneE2KzO28nKEuqOlD6kxOz1fsUOO45Dlgea75s
         0N1MExIsy+9TEpYX8h1sur69bzTQb56TF4ME6MBSPTfNXOw7/bRvdcn8ubvVymF3pX50
         G7rw==
X-Gm-Message-State: AOAM531iSJCateF0vbHZYHEUxDGYiDXJN37W7Xy0uuqN40tDqEsABU2x
        r2xssYXN5Wxn5kjwFcUZbbHI1FAZc5JZOg==
X-Google-Smtp-Source: ABdhPJzaIczKI04WivnsAUnc8WolInM3iE9FfBcqFlzFdm5U7vAt/U7yquhEgB4TtHNQY4Xxa3zWgA==
X-Received: by 2002:a63:170f:: with SMTP id x15mr8393611pgl.157.1607637382747;
        Thu, 10 Dec 2020 13:56:22 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u124sm7830350pfb.171.2020.12.10.13.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:56:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201209163818.v3.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
References: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid> <20201209163818.v3.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Clear possible pending irq when remuxing GPIOs
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 10 Dec 2020 13:56:20 -0800
Message-ID: <160763738065.1580929.11062492180508041591@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2020-12-09 16:41:03)
> Conceptually, we can envision the input on Qualcomm SoCs to pass
> through a bunch of blocks between coming into the chip and becoming a
> GPIO interrupt.  From guessing and running a handful of tests, I
> believe that we can represent the state of the world with a drawing
> that looks something like this:
>=20
>  +-----------------+       +-----------------+       +-----------------+
>  |      INPUT      |  -->  |      PINMUX     |       |    IS_INPUT     |
>  +-----------------+       |                 |  -->  |                 |
>                            | output bogus (?)|       | output bogus (?)|
>                            | if not muxed    |       | if input disab. |
>                            +-----------------+       +-----------------+
>                                                               |
>           +---------------------------------------------------+--> to PDC
>           |
>           V
>  +-----------------+       +-----------------+       +-----------------+
>  | INTR RAW ENABLE |       | DETECTION LOGIC |       | STATUS REGISTER |
>  |                 |       |                 |       |                 |
>  | output bogus (?)|  -->  | maybe handles   |       | latches inputs  |
>  | if disabled     |       | polarity diffs  |  -->  | that are high   |
>  +-----------------+       |                 |       |                 |
>                            | maybe debounces |       | write 1 to clr  |
>                            | level irqs      |       +-----------------+
>                            +-----------------+                |
>                                                               |
>           +---------------------------------------------------+
>           |
>           V
>  +-----------------+
>  |      ENABLE     |
>  |                 |       +-----------------+
>  | nothing passes  |  -->  |   SUMMARY IRQ   |
>  | through if      |       +-----------------+
>  | disabled        |
>  +-----------------+

This diagram doesn't make sense to me. The TLMM hardware block has a
"summary IRQ" and then it also has a bunch of direct connections to the
GIC via dedicated GIC SPI lines that are monitored by the PDC for wakeup
purposes. I think the summary IRQ line (which is yet another GIC SPI
line) is only in the picture when the GPIO isn't wakeup capable. So is
that "to PDC" part of the diagram above indicating where the line goes
off to the PDC and the GIC SPI line for each GPIO that is wakeup
capable? From looking at the code it seems like the interrupt logic
inside TLMM isn't used in the direct connect mode.

It seems like the only way to ignore the GPIO at the GIC when it is
directly connected is to fully shut it off at the GIC. Is that possible?
Or that can't fix this because of below...

>=20
> The above might not be 100% exact, but for the purpose of this
> discussion, the point is that there are a whole bunch of gates and
> transformations on the input before it gets to the circuitry that
> generates interrupts.

Fair enough. I would like to know if any of the interrupt detection
circuity is enabled/used in the parent PDC case vs. the summary irq line
though. Presumably in the PDC case there is one or two gates, i.e. the
input enable bit and the pinmux function selection vs. the summary irq
line that has those two gates plus the raw status and non-raw status
enable bits.

>=20
> As you might guess, if you reconfigure one of the gates in the above
> diagram while the system is configured to detect interrupts things get
> a little wacky.  Specifically it appears that if you gate the input at
> any step it can cause various glitches in the later steps because they
> are still paying attention to their input but their input isn't really
> sane anymore.
>=20
> I did some poking and I found that I could generate bogus interrupts
> in the system both when muxing away from GPIO mode and also when
> muxing back to GPIO mode.  When configured to use the PDC path for
> generating interrupts I found that if the external input on the GPIO
> was low that I'd get what looked like a rising edge when unmuxing and
> a falling edge when muxing.  When configured away from the PDC path I
> got slightly different glitch interrupts when changing muxing.

Continued from above, just changing the mode from GPIO to some other
mode like UART seems to cause the GIC to notice an edge? So the other
gates that come after have been tested and cause problems too? Or is it
just the mode change that causes a problem?

Is there any way to tell TLMM that "no I don't want to use the direct
connect path, I want to use the summary irq path"?

>=20
> These glitches when remuxing matter in reality, not just in theory.
> To be concrete, let's take the special "wakeup_irq" in
> qcom_geni_serial.c as an example.  In sc7180-trogdor.dtsi we configure
> the uart3 to have two pinctrl states, sleep and default, and mux
> between the two during runtime PM and system suspend (see
> geni_se_resources_{on,off}() for more details).  The difference
> between the sleep and default state is that the RX pin is muxed to a
> GPIO during sleep and muxed to the UART otherwise.  When we switch
> between these two states we can generate the glitches talked about
> above because we're configured to look for edges but the transition
> from the gated input (which is bogus) to the real input can look like
> an edge.
>=20
> Historically the UART case above was handled by the fact that the
> "enable" function in the MSM GPIO driver did an "unmask and clear".
> This relied on the fact that the system happens to have the interrupt
> disabled until suspend time and that it would enable it after the
> pinmux change happened, thus clearing the interrupt.
>=20
> The historical solution, however, had a few problems.  The first
> problem (that nobody seemed to have tripped) is that we can still get
> bogus interrupts if we remux when the interrupt isn't disabled during
> the muxing and re-enabled after.  The second problem is that it
> violates how I believe that the interrupt enable path is supposed to
> work.
>=20
> In Linux, if a driver does disable_irq() and later does enable_irq()
> on its interrupt, I believe it's expecting these properties:
> * If an interrupt was pending when the driver disabled then it will
>   still be pending after the driver re-enables.
> * If an edge-triggered interrupt comes in while an interrupt is
>   disabled it should assert when the interrupt is re-enabled.
>=20
> If you think that the above sounds a lot like the disable_irq() and
> enable_irq() are supposed to be masking/unmasking the interrupt
> instead of disabling/enabling it then you've made an astute
> observation.  Specifically when talking about interrupts, "mask"
> usually means to stop posting interrupts but keep tracking them and
> "disable" means to fully shut off interrupt detection.  It's
> unfortunate that this is so confusing, but presumably this is all the
> way it is for historical reasons.
>=20
> Perhaps more confusing than the above is that, even though clients of
> IRQs themselves don't have a way to request mask/unmask
> vs. disable/enable calls, IRQ chips themselves can implement both.
> ...and yet more confusing is that if an IRQ chip implements
> disable/enable then they will be called when a client driver calls
> disable_irq() / enable_irq().
>=20
> It does feel like some of the above could be cleared up.  However,
> without any other core interrupt changes it should be clear that when
> an IRQ chip gets a request to "disable" an IRQ that it has to treat it
> like a mask of that IRQ.
>=20
> In any case, after that long interlude you can see that the "unmask
> and clear" can break things.  Maulik tried to fix it so that we no
> longer did "unmask and clear" in commit 71266d9d3936 ("pinctrl: qcom:
> Move clearing pending IRQ to .irq_request_resources callback"), but it
> didn't work for two reasons:
> * It only tried to address the problem for interrupts that had parents
>   (like the PDC).
> * It regressed the problem that the original clearing was trying to
>   solve.
>=20
> I think we can safely assume that if someone muxes a pin to be
> something other than a GPIO and then muxes it back that we can clear
> any interrupts that were pending on it without violating any
> assumptions that client drivers are making.  Presumably the client
> drivers are intentionally remuxing the pin away from a dedicated
> purpose to be a plain GPIO so they don't care what the pin state was
> before the mux switch and they don't expect to see the pin change
> level during this switch.  Let's move the clearing of the IRQ to the
> pin muxing routine so that we'll clear a pending IRQ if we're muxing
> from some non-GPIO mode to a GPIO mode.
>=20
> NOTE: now that we're not clearing the interrupt in "enable" we also
> need one extra fix here to clear the phantom interrupt that could have
> been generated the first time we set RAW_STATUS_EN.
>=20
> Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_re=
quest_resources callback")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Would it be possible to split this patch in two to handle the case where
there is a parent and the case where there isn't a parent? Has the
manual testing probed both paths, or only one path like the PDC path or
the summary irq path?

> This patch depends on #2 in the series, but not #1.  #1 can land on
> its own and then #2/#3 can land together even without #1.  The only
> reason patch #1 and #2/#3 are together in one series is because they
> address similar issues.
>=20
> I have done most of this patch testing on the Chrome OS 5.4 kernel
> tree (with many backports) but have sanity checked it on mainline.
>=20
> NOTE: there was quite a bit of discussion on v2 and I'm not sure I
> ever arrived on the same page as Maulik on how things here work.  If
> there are truly problems with v3 I'd love to see some test code
> proving it out.
>=20
> Changes in v3:
> - Fixed bug in msm_gpio_direction_output() (s/oldval =3D/oldval =3D val =
=3D/)
> - Add back "if !skip_wake_irqs" test in msm_gpio_irq_enable()
> - For non-PDC, clear 1st interrupt in msm_gpio_irq_set_type()
>=20
> Changes in v2:
> - 0 =3D> false
> - If skip_wake_irqs, don't need to clear normal intr.
> - Add comment about glitches in both output and input.
>=20
>  drivers/pinctrl/qcom/pinctrl-msm.c | 122 ++++++++++++++++++++---------
>  1 file changed, 86 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 588df91274e2..915b1e2ad40d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -491,12 +549,21 @@ static int msm_gpio_direction_output(struct gpio_ch=
ip *chip, unsigned offset, in
>                 val &=3D ~BIT(g->out_bit);
>         msm_writel_io(val, pctrl, g);
> =20
> -       val =3D msm_readl_ctl(pctrl, g);
> +       oldval =3D val =3D msm_readl_ctl(pctrl, g);
>         val |=3D BIT(g->oe_bit);
>         msm_writel_ctl(val, pctrl, g);
> =20
>         raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> =20
> +       /*
> +        * Clear IRQs if switching to/from input mode since that can use
> +        * a phantom edge.
> +        */
> +       if (oldval !=3D val)
> +               msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
> +
> +       enable_irq(irq);

This stuff where we call enable_irq() and disable_irq() makes me
nervous. No other pinctrl driver is doing that.

> +
>         return 0;
>  }
>
