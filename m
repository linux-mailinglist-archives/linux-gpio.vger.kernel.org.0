Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5882DCBC7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 05:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgLQEzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 23:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgLQEzb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 23:55:31 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36136C0617B0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 20:54:51 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 11so18251798pfu.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 20:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=RGWsO2xASpBiXhZOz0Bm5x2XJu6xcytDBXU8vp0kbtY=;
        b=P2i13ZvYTtEMG+HaAg5v6BDYs4ilVIzVLiyIU6d4UlHfThAGlK5l4UW+rM//rFLebJ
         7+kdK2YwrVdr9McAUw1Qd7Doik5GUQCK3y0fXEG5apfnKAHZVMb5w7Jchf0wcgwFGlfp
         F1aKbR4IKmtsEyyUMw0dq5puhhIKp5M5Jx8KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=RGWsO2xASpBiXhZOz0Bm5x2XJu6xcytDBXU8vp0kbtY=;
        b=pZNjREdAxbQ+RB7UaYOcyvR6e1ka+3EQLLcir36Ggiy5yPbn4AJys6Ulp8CVOAy+al
         myfR1BIegqM8jzH62s0gI6tARNMok79BBc1qDnydrrkH0q1RfpH1R8fGK6I8Yh2PRpxe
         qlJB7hWV1weLQgvobXZN2U5scF3WmVEWYQt4HcHvJh9MURBZi/pLEfyzRLxLboRvC8y8
         /FlJUX9LxIuVk3W5U9As7Yk3cJdccBfvmcYIig5n0Hh/ENW1ZIvngA9x4gN2VzcdT3z1
         ETcNO2UrfKfC/Xz/xW0O2HuoWcpZfPp5ky8zSug2Qp60OVWpEqRFF3Glk9YciwDhEOhi
         O9ow==
X-Gm-Message-State: AOAM530czrzXMpaK6B//qOIBZa17VhsyWq55o0xWTs0Ei28f0xh4OzlK
        URou6Qvp1FOPC3sQBx8dx7DWXg==
X-Google-Smtp-Source: ABdhPJwYM5PQZ/2gUquOdjbCWYuBeSwxrLSWvcIHmmM/LgfFe434huWTpVdsgyJoRQVXzIDkS1LbNQ==
X-Received: by 2002:a63:5866:: with SMTP id i38mr4288937pgm.26.1608180890551;
        Wed, 16 Dec 2020 20:54:50 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id z20sm3397734pjq.16.2020.12.16.20.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 20:54:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201211141514.v4.3.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
References: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid> <20201211141514.v4.3.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
Subject: Re: [PATCH v4 3/4] pinctrl: qcom: Don't clear pending interrupts when enabling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Wed, 16 Dec 2020 20:54:47 -0800
Message-ID: <160818088793.1580929.1672018770454181938@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2020-12-11 14:15:37)
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
> only handled the PDC case (it also had problems, but that's the
> subject of another patch).  Let's fix this for the non-PDC case.
>=20
> From my understanding the source of the phantom interrupt in the
> non-PDC case was the one that could have been introduced in
> msm_gpio_irq_set_type().  Let's handle that one and then get rid of
> the clear.
>=20
> Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio=
")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One comment clarification below.

> I don't have lots of good test cases here, so hopefully someone from
> Qualcomm can confirm that this works well for them and there isn't
> some other phantom interrupt source that I'm not aware of.
>=20
> Changes in v4:
> - ("pinctrl: qcom: Don't clear pending interrupts when enabling") split f=
or v4.
>=20
>  drivers/pinctrl/qcom/pinctrl-msm.c | 32 +++++++++++++-----------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 588df91274e2..f785646d1df7 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1046,6 +1032,16 @@ static int msm_gpio_irq_set_type(struct irq_data *=
d, unsigned int type)
>         }
>         msm_writel_intr_cfg(val, pctrl, g);
> =20
> +       /*
> +        * The first time we set RAW_STATUS_EN it could trigger an interr=
upt.
> +        * Clear it.  This is safe because we have IRQCHIP_SET_TYPE_MASKE=
D.

Clear the interrupt? 'it' is ambiguous.

> +        */
> +       if (!was_enabled) {
> +               val =3D msm_readl_intr_status(pctrl, g);
> +               val &=3D ~BIT(g->intr_status_bit);
> +               msm_writel_intr_status(val, pctrl, g);
> +       }
> +
>         if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
>                 msm_gpio_update_dual_edge_pos(pctrl, g, d);
>
