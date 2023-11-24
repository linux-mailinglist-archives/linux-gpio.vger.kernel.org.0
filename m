Return-Path: <linux-gpio+bounces-486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941D7F7468
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 13:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B401CB2150A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0012511F;
	Fri, 24 Nov 2023 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="blACIZ3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B269C10F4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 04:56:53 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-28598035301so187853a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 04:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700830613; x=1701435413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xujb6kFqtC8wI/nMx0LNn7gwzfv+MW7wEFOovE+DY6o=;
        b=blACIZ3QRLV4orCzTsKNlr5kMj0PofjTxGfkbkt4led0mTZz5+jcnU1DOeDNhoraYt
         nJcHLML0OFRHQWuRAXgfVWKfBawkhXTbkuvS7uofIxxDkXZvzLeOefYswLpAFP1UKC8E
         CWe/3Oz1Brzn/FtvL88xF84fuziiC5nQka97w6OZuck4mWM/hTyqx9XC7XW0MmDTWSTq
         NiYPEfgH2J2bQ3h6P10MsQVhJTq/xYimdzIx+KpS7c0eKoZBpfbfN9//Mkp8lszZgT9x
         Po/SRhfyj4hhyadsu/HhSfaOlL0/Kj5M9RD9UGRwn1VLl2Qtps75xnrbL/03v2KfXz6n
         znxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700830613; x=1701435413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xujb6kFqtC8wI/nMx0LNn7gwzfv+MW7wEFOovE+DY6o=;
        b=hjk5LBCZCQI9t2L5WcloNTg48ibeANB6YUVP1NW7C02CNevooXB+ordxBUznB1Hjgb
         woZyNgOvw3o+Hxzv06feceDLmtJFi+TegdCPw77aAIAfW5uiTdQcwypeoMNvZQ1u/AJp
         zmaMjNWOFPfh9bKU9OYuUva6Ic7ky5y3BtzRQnFvP+/QbY5054XH4lQKp7vZxsXiRl0F
         i4x/gR4ILNb6APLwX/P/xvA8+diHPqOWX5Y4y9BkOpenei86dTd8xkL+JM10fIOf8+04
         e63LBLZL/t2Y+zutm1yIZTB/lNezQ+WwGk1I+Bt3cW6smBdKH5DDV6ZuwDDEiLZ7Um1H
         x8rA==
X-Gm-Message-State: AOJu0Yy+PUwxREkU1JEM/7di0X0tCXj4xAy6a5oEK6B/8wv/fpTjHgmD
	4SLztsALerPHXW1ATVozJ20z3gQoGKClbYtgymQcug==
X-Google-Smtp-Source: AGHT+IF9MkghMnGcmPZ6oKymMT/UpH3kadFQgleGNgpxXbEPR8je/OfgN9q1rqitSot59grj0w/EKrcRA8d+7uuBhfg=
X-Received: by 2002:a17:90b:1c0c:b0:280:c0:9d3f with SMTP id
 oc12-20020a17090b1c0c00b0028000c09d3fmr3019628pjb.34.1700830613137; Fri, 24
 Nov 2023 04:56:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20231119085440epcas2p375fa3b2999e1a3ceeff9949136db7e28@epcas2p3.samsung.com>
 <20231119092909.3018578-1-youngmin.nam@samsung.com> <CAPLW+4kO4wYP=5Sx7dPXU17b_CHBJKN_93GhWtZ60vKgNRTKwQ@mail.gmail.com>
 <ZWAn+XzseBTB+KE1@perf>
In-Reply-To: <ZWAn+XzseBTB+KE1@perf>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 24 Nov 2023 06:56:41 -0600
Message-ID: <CAPLW+4=4SDaw512hzUKscyu0RphKL7fKqVMcuQNEhz0UJ9smGw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: add irq_set_affinity() for non wake up
 external gpio interrupt
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: tomasz.figa@gmail.com, krzysztof.kozlowski@linaro.org, 
	s.nawrocki@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 10:00=E2=80=AFPM Youngmin Nam <youngmin.nam@samsung=
.com> wrote:
>
> On Tue, Nov 21, 2023 at 12:33:51PM -0600, Sam Protsenko wrote:
> > On Sun, Nov 19, 2023 at 2:54=E2=80=AFAM Youngmin Nam <youngmin.nam@sams=
ung.com> wrote:
> > >
> > > To support affinity setting for non wake up external gpio interrupt,
> > > we add a new irq_set_affinity callback using irq number which is in p=
inctrl
> > > driver data.
> > >
> > > Before applying this patch, we couldn't change irq affinity of gpio i=
nterrupt.
> > > * before
> > > erd9945:/proc/irq/418 # cat smp_affinity
> > > 3ff
> > > erd9945:/proc/irq/418 # echo 00f > smp_affinity
> > > erd9945:/proc/irq/418 # cat smp_affinity
> > > 3ff
> > > erd9945:/proc/irq/418 # cat /proc/interrupts
> > >            CPU0       CPU1       CPU2       CPU3       CPU4       CPU=
5       CPU6       CPU7       CPU8       CPU9
> > > 418:       3631          0          0          0          0          =
0          0          0          0          0      gpg2   0 Edge      19100=
000.drmdecon
> > >
> > > After applying this patch, we can change irq affinity of gpio interru=
pt as below.
> > > * after
> > > erd9945:/proc/irq/418 # cat smp_affinity
> > > 3ff
> > > erd9945:/proc/irq/418 # echo 00f > smp_affinity
> > > erd9945:/proc/irq/418 # cat smp_affinity
> > > 00f
> > > erd9945:/proc/irq/418 # cat /proc/interrupts
> > >            CPU0       CPU1       CPU2       CPU3       CPU4       CPU=
5       CPU6       CPU7       CPU8       CPU9
> > > 418:       3893        201        181        188          0          =
0          0          0          0          0      gpg2   0 Edge      19100=
000.drmdecon
> > >
> >
> > Suggest formatting the commit message as follows, to make it more reada=
ble:
> >
> > 8<---------------------------------------------------------------------=
----->8
> > To support affinity setting for non wake up external gpio interrupt,
> > add irq_set_affinity callback using irq number from pinctrl driver
> > data.
> >
> > Before this patch, changing the irq affinity of gpio interrupt is not
> > possible:
> >
> >     # cat /proc/irq/418/smp_affinity
> >     3ff
> >     # echo 00f > /proc/irq/418/smp_affinity
> >     # cat /proc/irq/418/smp_affinity
> >     3ff
> >     # cat /proc/interrupts
> >                CPU0       CPU1       CPU2       CPU3    ...
> >     418:       3631          0          0          0    ...
> >
> > With this patch applied, it's possible to change irq affinity of gpio
> > interrupt:
> >
> >     # cat /proc/irq/418/smp_affinity
> >     3ff
> >     # echo 00f > /proc/irq/418/smp_affinity
> >     # cat /proc/irq/418/smp_affinity
> >     00f
> >     # cat /proc/interrupts
> >                CPU0       CPU1       CPU2       CPU3      ...
> >     418:       3893        201        181        188      ...
> > 8<---------------------------------------------------------------------=
----->8
> >
>
> Thanks for your suggestion. I'll modify it.
>
> > > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > > ---
> > >  drivers/pinctrl/samsung/pinctrl-exynos.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinct=
rl/samsung/pinctrl-exynos.c
> > > index 6b58ec84e34b..5d7b788282e9 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > > @@ -147,6 +147,19 @@ static int exynos_irq_set_type(struct irq_data *=
irqd, unsigned int type)
> > >         return 0;
> > >  }
> > >
> > > +static int exynos_irq_set_affinity(struct irq_data *irqd,
> > > +                                  const struct cpumask *dest, bool f=
orce)
> > > +{
> > > +       struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(=
irqd);
> > > +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> > > +       struct irq_data *parent =3D irq_get_irq_data(d->irq);
> >
> > I'm probably missing something, but: why not just use "irqd" parameter
> > and avoid declaring "bank" and "d"? Is "d->irq" somehow different from
> > "irqd"?
> >
>
> Yes, irqd->irq is different from d->irq as below.
>
> [  188.230707] irqd->irq is 417
> [  188.230837] d->irq is 133
>
> We have to use d->irq(133) instead of irqd->irq(417) because d->irq has G=
ICv3 as a IRQ chip.
> To use set_affinity() call back of GICv3, d->irq is needed.
>
> IRQ  HWIRQ  Type   Affinity    IRQ_DESC             CPU0    CPU1    CPU2 =
   CPU3 ... Chip   Name
> 133    603  Level  0x3ff       0xffffff883b25d800  52260       0       0 =
      0 ... GICv3  11030000.pinctrl
> 417      0  Edge   0xffffffff  0xffffff883b68a800  52259       0       0 =
      0 ... gpg2   19100000.drmdecon
>
> erd9945: # cat /proc/interrupts | grep gpg2
> 417:       9250         48         45         45 ...  gpg2   0 Edge      =
19100000.drmdecon
>
> erd9945: # cat /proc/interrupts | grep 11030000
> 133:       9250         48         45         45 ...  GICv3 603 Level    =
 11030000.pinctrl
>

Thanks for the explanation! Apart from my suggestion for the commit message=
:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> > > +
> > > +       if (parent)
> > > +               return parent->chip->irq_set_affinity(parent, dest, f=
orce);
> > > +
> >
> > Why not use irq_chip_set_affinity_parent() API?
> >
> > > +       return -EINVAL;
> >
> > Maybe use something like this instead:
> >
> >     if (!irqd->parent_data)
> >             return -EINVAL;
> >
> >     return irq_chip_set_affinity_parent(irqd, dest, force);
> >
> > Can you please test if this code works?
> >
>
> I tested as you suggested as below.
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index bf8dd5e3c3d2..593320b408ce 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -153,14 +153,12 @@ static int exynos_irq_set_type(struct irq_data *irq=
d, unsigned int type)
>  static int exynos_irq_set_affinity(struct irq_data *irqd,
>                                    const struct cpumask *dest, bool force=
)
>  {
> -       struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(irqd=
);
> -       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> -       struct irq_data *parent =3D irq_get_irq_data(d->irq);
> -
> -       if (parent)
> -               return parent->chip->irq_set_affinity(parent, dest, force=
);
> +       if (!irqd->parent_data) {
> +               pr_err("irqd->parent_data is null!!\n");
> +               return -EINVAL;
> +       }
>
> -       return -EINVAL;
> +       return irq_chip_set_affinity_parent(irqd, dest, force);
>  }
>
> [  149.658395] irqd->parent_data is null!!
>
> Currently, irqd->paranet_data is null.
>
> > > +}
> > > +
> > >  static int exynos_irq_request_resources(struct irq_data *irqd)
> > >  {
> > >         struct samsung_pin_bank *bank =3D irq_data_get_irq_chip_data(=
irqd);
> > > @@ -212,6 +225,7 @@ static const struct exynos_irq_chip exynos_gpio_i=
rq_chip __initconst =3D {
> > >                 .irq_mask =3D exynos_irq_mask,
> > >                 .irq_ack =3D exynos_irq_ack,
> > >                 .irq_set_type =3D exynos_irq_set_type,
> > > +               .irq_set_affinity =3D exynos_irq_set_affinity,
> >
> > What happens if we just assign irq_chip_set_affinity_parent() here?
> > Would it work, or Exynos case is more complicated than this?
> >
>
> Yes, I couldn't find how to use irq_chip_set_affinity_parent() directly y=
et.
>
> > >                 .irq_request_resources =3D exynos_irq_request_resourc=
es,
> > >                 .irq_release_resources =3D exynos_irq_release_resourc=
es,
> > >         },
> > > --
> > > 2.39.2
> > >
> >

