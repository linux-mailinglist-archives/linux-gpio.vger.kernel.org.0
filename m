Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A0C1E3EBE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 12:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387854AbgE0KPv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 06:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387840AbgE0KPu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 06:15:50 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B4EC061A0F
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 03:15:50 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id v2so6560434pfv.7
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 03:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=TlnmUrscKa/rIKFGJ53s4sxtDr9jacnXeVYHbyTFQtU=;
        b=U9PFUgFAFXaZ31fVg/bX9FAw0grwENMcVfqGyk+QHHM8fDNoIXX/5Jit64oU2z6s3V
         QMe5JjD120SyMoGMqxhHG8jEFrM0uIeE5nEHudeCswPopXz5ChGfdIyiq7e07lDABEEs
         614QVBHQD1bVz9Vl/rsQhNUZpNiWdfsiHeo9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=TlnmUrscKa/rIKFGJ53s4sxtDr9jacnXeVYHbyTFQtU=;
        b=CPbXSaaEriYnVZvx+HQ5tdJmoEevRvE2IHp+9B7lsVZsC+nkZxm6AvbCvptTID/Pqa
         rC3c+Dy+Aeya2BOaY7NE8Cp4UPRjb5aoYYizOsysk95j77v7vv7djWil1V39SaPoEA/e
         4ytCU7s/gIyUAlO6bu5Zn+raV9wa65xBMddp85w9/rKNAMDPW8CCnr299Zlk8nDFGshp
         Ftw4hJ3EMOjc5KMpXVgiHID1D6rQgJPGmGv94veMAmpAyibbEKhJjLCU1sRh8/OTSTLz
         8E3s8dSEm1h28aOJT8KNcBrUbzeFR/y5pQGJ0i17HLiupNHrFumUDvpfW3tJSQwVjEAP
         8Xdw==
X-Gm-Message-State: AOAM5337HuwxOB8NVxgtuz3sG8XUtbFdvJwh1e7GnVI1pyEdHJUtLVdd
        v2HQvQbbN5j5UEuklirN5HoxNw==
X-Google-Smtp-Source: ABdhPJyaQkX9GG0uxrGZHHp5tPrfy/kI025wjd11LmMZcniWV4wMMcJ/NJrAhz2pbNaPKnqpjnpfxQ==
X-Received: by 2002:a63:7d53:: with SMTP id m19mr3475449pgn.168.1590574549868;
        Wed, 27 May 2020 03:15:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z18sm1744925pfj.148.2020.05.27.03.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 03:15:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590253873-11556-5-git-send-email-mkshah@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-5-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v2 4/4] irqchip: qcom-pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Wed, 27 May 2020 03:15:47 -0700
Message-ID: <159057454795.88029.5963412495484312088@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-05-23 10:11:13)
> Remove irq_disable callback to allow lazy disable for pdc interrupts.
>=20
> Add irq_set_wake callback that unmask interrupt in HW when drivers
> mark interrupt for wakeup. Interrupt will be cleared in HW during
> lazy disable if its not marked for wakeup.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/irqchip/qcom-pdc.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 6ae9e1f..f7c0662 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -36,6 +36,7 @@ struct pdc_pin_region {
>         u32 cnt;
>  };
> =20
> +DECLARE_BITMAP(pdc_wake_irqs, PDC_MAX_IRQS);

static?

>  static DEFINE_RAW_SPINLOCK(pdc_lock);
>  static void __iomem *pdc_base;
>  static struct pdc_pin_region *pdc_region;
> @@ -87,22 +88,20 @@ static void pdc_enable_intr(struct irq_data *d, bool =
on)
>         raw_spin_unlock(&pdc_lock);
>  }
> =20
> -static void qcom_pdc_gic_disable(struct irq_data *d)
> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
>  {
>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> -               return;
> -
> -       pdc_enable_intr(d, false);
> -       irq_chip_disable_parent(d);
> -}
> +               return 0;

Shouldn't this fail if we can't set for wake?

> =20
> -static void qcom_pdc_gic_enable(struct irq_data *d)
> -{
> -       if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> -               return;
> +       if (on) {
> +               pdc_enable_intr(d, true);
> +               irq_chip_enable_parent(d);
> +               set_bit(d->hwirq, pdc_wake_irqs);
> +       } else {
> +               clear_bit(d->hwirq, pdc_wake_irqs);
> +       }
> =20
> -       pdc_enable_intr(d, true);
> -       irq_chip_enable_parent(d);
> +       return irq_chip_set_wake_parent(d, on);
>  }
> =20
>  static void qcom_pdc_gic_mask(struct irq_data *d)

The diff is really hard to read too. Maybe set_wake can be added first
and then the enable/disable functions removed?

> @@ -110,6 +109,9 @@ static void qcom_pdc_gic_mask(struct irq_data *d)
>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
>                 return;
> =20
> +       if (!test_bit(d->hwirq, pdc_wake_irqs))
> +               pdc_enable_intr(d, false);
> +
>         irq_chip_mask_parent(d);
>  }
> =20
> @@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
>         if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
>                 return;
> =20
> +       pdc_enable_intr(d, true);
>         irq_chip_unmask_parent(d);
>  }
> =20

I find these two hunks deeply confusing. I'm not sure what the
maintainers think though. I hope it would be simpler to always enable
the hwirqs in the pdc when an irq is requested and only disable it in
the pdc when the system goes to suspend and the pdc pin isn't for an irq
that's marked for wakeup. Does that break somehow?

My understanding of the hardware is that the GPIO controller has lines
directly connected to various SPI lines on the GIC and PDC has a way to
monitor those direct connections and wakeup the CPUs when they trigger
the detection logic in the PDC. The enable/disable bit in PDC gates that
logic for each wire between the GPIO controller and the GIC.

So isn't it simpler to leave the PDC monitoring pins that we care about
all the time and only stop monitoring when we enter and leave suspend?
And shouldn't the driver set something sane in qcom_pdc_init() to
disable all the pdc pins so that we don't rely on boot state to
configure pins for wakeup?

> @@ -197,15 +200,13 @@ static struct irq_chip qcom_pdc_gic_chip =3D {
>         .irq_eoi                =3D irq_chip_eoi_parent,
>         .irq_mask               =3D qcom_pdc_gic_mask,
>         .irq_unmask             =3D qcom_pdc_gic_unmask,
> -       .irq_disable            =3D qcom_pdc_gic_disable,
> -       .irq_enable             =3D qcom_pdc_gic_enable,
>         .irq_get_irqchip_state  =3D qcom_pdc_gic_get_irqchip_state,
>         .irq_set_irqchip_state  =3D qcom_pdc_gic_set_irqchip_state,
>         .irq_retrigger          =3D irq_chip_retrigger_hierarchy,
>         .irq_set_type           =3D qcom_pdc_gic_set_type,
> +       .irq_set_wake           =3D qcom_pdc_gic_set_wake,
>         .flags                  =3D IRQCHIP_MASK_ON_SUSPEND |
> -                                 IRQCHIP_SET_TYPE_MASKED |
> -                                 IRQCHIP_SKIP_SET_WAKE,
> +                                 IRQCHIP_SET_TYPE_MASKED,
>         .irq_set_vcpu_affinity  =3D irq_chip_set_vcpu_affinity_parent,
>         .irq_set_affinity       =3D irq_chip_set_affinity_parent,
