Return-Path: <linux-gpio+bounces-1036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65D8060A3
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 22:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7291F21609
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 21:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FAA6E5A2;
	Tue,  5 Dec 2023 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkKJDvgM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27D41A5
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 13:24:40 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-67ad531686eso1783806d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 13:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701811480; x=1702416280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+Zh/59BXAZw04KlgIGnr6QtEam8qAlktoWUx+lSDLE=;
        b=gkKJDvgMv/ISDieJjGJqDpD/Nh7Y5g7py5cg62tNIdfROvDCnM1M8/WP0/eIsOawKW
         9uijbTVeRL0yBG3FMNYH3u0cv6xirCwhyZ8jNekR1F4Veoc9IVFfgP2HwA2Hj17MQVm1
         qSeDDXmkrpZIkQOmS5j5MenIecajQrMwLjJ+a+RArcSdIaMIXMIoRv/YY1Zx8e2Dp1da
         JX69XjgUNlg+1+x3uF5NbqipgQX2Ka3hMU5sllYknykayjDTObjj6/n+Op8c9LsuKGSx
         0gXA8F+KiiVgsWG4fuCCk8hm10+U3tU7Hb3krKSTcBNct8tCWUxT1YivNtQ6fwqPrNml
         EQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701811480; x=1702416280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+Zh/59BXAZw04KlgIGnr6QtEam8qAlktoWUx+lSDLE=;
        b=GGkBrRieuXm+F4P5DHe/FlIUrmSmedAQYixHSKLf5pet9KHpNAGqK+Rda7x0xTBwrV
         sHNXjhJMcQHH03+CEgp9yzAq20ZdBJlU4rzQHBKi5vREI+nM0JSDL0UDthd7sepz5htT
         WxwRl0vD4uHEjk/a9flWLiGzVR1bbGWwNqb96uxRiNBjlyChw2HaewXsGJimlUqaN7/e
         VlM1zyCecabgNtt9PMXfQx1/1gtDdMTA6IRKMIDYi04ZzCnZtreW7fVVgmBEHOItOuwW
         AXhS7ChW6OFCc24yyVN8WjhOG8O3aM85RJkAXiQsojwfCunNB8Z8nsklsPcrFj4fDpP9
         3KxA==
X-Gm-Message-State: AOJu0Ywl3ZQWF8dT+4zRpA1PhE9s370MYbC9ZlCwFQWpMIG09gprsNbO
	GhHHqU6Z/Ua0HaJBcXLLFm7jvri38XFX52cpGqEbGw==
X-Google-Smtp-Source: AGHT+IHGrwfoXR9dgLkuQhG24SlqBkj4ksLhAxMbg0X8Wz0N9cGgXzPI3/YlsWoPe0oJMONnAl2YcZ6IaDrYffNhzvI=
X-Received: by 2002:a05:6214:500c:b0:67a:2f1b:dd33 with SMTP id
 jo12-20020a056214500c00b0067a2f1bdd33mr3614120qvb.2.1701811479711; Tue, 05
 Dec 2023 13:24:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-15-peter.griffin@linaro.org> <CAPLW+4kBOWFPx3Hr-=UoLWvRxCorzBY9RCOiBhfkKcU0LAa21Q@mail.gmail.com>
In-Reply-To: <CAPLW+4kBOWFPx3Hr-=UoLWvRxCorzBY9RCOiBhfkKcU0LAa21Q@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 21:24:28 +0000
Message-ID: <CADrjBPoua+pBTfZbkzPEk-71OZUNsXUzMmJD7CEt0EzSjg7pDw@mail.gmail.com>
Subject: Re: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Thanks for the review.

On Sat, 2 Dec 2023 at 00:40, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Add support for the pin-controller found on the gs101 SoC used in
> > Pixel 6 phones.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 159 ++++++++++++++++++
> >  drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
> >  drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
> >  5 files changed, 198 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/p=
inctrl/samsung/pinctrl-exynos-arm64.c
> > index cb965cf93705..e1a0668ecb16 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > @@ -796,3 +796,162 @@ const struct samsung_pinctrl_of_match_data fsd_of=
_data __initconst =3D {
> >         .ctrl           =3D fsd_pin_ctrl,
> >         .num_ctrl       =3D ARRAY_SIZE(fsd_pin_ctrl),
> >  };
> > +
> > +/*
> > + * bank type for non-alive type
> > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit fiel=
d: 4)
> > + * (CONPDN bit field: 2, PUDPDN bit field: 4)
> > + */
> > +static struct samsung_pin_bank_type gs101_bank_type_off  =3D {
> > +       .fld_width =3D { 4, 1, 4, 4, 2, 4, },
> > +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> > +};
>
> This is just the same as exynos850_bank_type_off (100% duplication).

Ah nice, I hadn't spotted that these structs matched exynos850.

> Here is what I suggest. Now that it's obvious there is some common
> platform for moder Exynos SoCs, and it's probably Exynos9, I'd suggest
> next course of action (if maintainers agree):
>   1. Remove this one
>   2. Rename exynos850_bank_type_off to exynos9_bank_type_off
>   3. Use it for both gs101 and exynos850
>
> Does it make sense?

Yes, sounds like a good plan to me. I just checked downstream and they
were called bank_type_6 and bank_type_7 originally.

@Krzysztof - are you OK with the proposed generic name above
(exynos9_bank_type_off?) to be used by both exynos850 and gs101 (and
also future Tensor exynos based SoCs)?

>
> > +
> > +/*
> > + * bank type for alive type
> > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit fiel=
d: 4)
> > + */
> > +static const struct samsung_pin_bank_type gs101_bank_type_alive =3D {
> > +       .fld_width =3D { 4, 1, 4, 4, },
> > +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, },
> > +};
>
> Ditto, it's a duplication of exynos850_bank_type_alive .
>
> > +
> > +/* pin banks of gs101 pin-controller (ALIVE) */
> > +static const struct samsung_pin_bank_data gs101_pin_alive[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
> > +       EXYNOS9_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
> > +       EXYNOS9_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
> > +       EXYNOS9_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
> > +       EXYNOS9_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
> > +       EXYNOS9_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
> > +       EXYNOS9_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
> > +       EXYNOS9_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> > +static const struct samsung_pin_bank_data gs101_pin_far_alive[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
> > +       EXYNOS9_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
> > +       EXYNOS9_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
> > +       EXYNOS9_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (GSACORE) */
> > +static const struct samsung_pin_bank_data gs101_pin_gsacore[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
> > +       EXYNOS9_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
> > +       EXYNOS9_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (GSACTRL) */
> > +static const struct samsung_pin_bank_data gs101_pin_gsactrl[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (PERIC0) */
> > +static const struct samsung_pin_bank_data gs101_pin_peric0[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (PERIC1) */
> > +static const struct samsung_pin_bank_data gs101_pin_peric1[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
> > +       EXYNOS9_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
> > +       EXYNOS9_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
> > +       EXYNOS9_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (HSI1) */
> > +static const struct samsung_pin_bank_data gs101_pin_hsi1[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
> > +       EXYNOS9_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (HSI2) */
> > +static const struct samsung_pin_bank_data gs101_pin_hsi2[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
> > +       EXYNOS9_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
> > +       EXYNOS9_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
> > +};
> > +
> > +static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst =3D =
{
> > +       {
> > +               /* pin banks of gs101 pin-controller (ALIVE) */
> > +               .pin_banks      =3D gs101_pin_alive,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_alive),
> > +               .eint_wkup_init =3D exynos_eint_wkup_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (FAR_ALIVE) */
> > +               .pin_banks      =3D gs101_pin_far_alive,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_far_alive),
> > +               .eint_wkup_init =3D exynos_eint_wkup_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (GSACORE) */
> > +               .pin_banks      =3D gs101_pin_gsacore,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_gsacore),
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (GSACTRL) */
> > +               .pin_banks      =3D gs101_pin_gsactrl,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_gsactrl),
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (PERIC0) */
> > +               .pin_banks      =3D gs101_pin_peric0,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_peric0),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (PERIC1) */
> > +               .pin_banks      =3D gs101_pin_peric1,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_peric1),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (HSI1) */
> > +               .pin_banks      =3D gs101_pin_hsi1,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_hsi1),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (HSI2) */
> > +               .pin_banks      =3D gs101_pin_hsi2,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_hsi2),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       },
> > +};
> > +
> > +const struct samsung_pinctrl_of_match_data gs101_of_data __initconst =
=3D {
> > +       .ctrl           =3D gs101_pin_ctrl,
> > +       .num_ctrl       =3D ARRAY_SIZE(gs101_pin_ctrl),
> > +};
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
> > index 56fc11a1fe2f..75b9cf72ce73 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -537,6 +537,8 @@ static const struct of_device_id exynos_wkup_irq_id=
s[] =3D {
> >                         .data =3D &exynos7_wkup_irq_chip },
> >         { .compatible =3D "samsung,exynosautov9-wakeup-eint",
> >                         .data =3D &exynos7_wkup_irq_chip },
> > +       { .compatible =3D "google,gs101-wakeup-eint",
> > +                       .data =3D &exynos7_wkup_irq_chip },
> >         { }
> >  };
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl=
/samsung/pinctrl-exynos.h
> > index e2799ff1b5e9..1ffc90db079d 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > @@ -147,6 +147,40 @@
> >                 .name           =3D id                            \
> >         }
> >
> > +#define EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)   \
> > +       {                                               \
> > +               .type           =3D &types,               \
> > +               .pctl_offset    =3D reg,                  \
> > +               .nr_pins        =3D pins,                 \
> > +               .eint_type      =3D EINT_TYPE_NONE,       \
> > +               .fltcon_type    =3D FLT_DEFAULT           \
> > +               .name           =3D id                    \
> > +       }
>
> Where exactly it is used? What is 'types'?

EXYNOS9_PIN_BANK_EINTN macro can be dropped completely for gs101 as it
isn't used anywhere. I checked downstream code and it is declared and
not used there as well.

>Moreover, it doesn't look
> very different from EXYNOS850_PIN_BANK_EINTN() -- just because I
> created EXYNOS850_PIN_BANK_EINTN() exactly from this downstream macro.
> I was strictly prohibited adding EXYNOS9_* stuff back at the time. But
> now I guess it should be apparent we are actually dealing with Exynos9
> common platform. So I suggest renaming EXYNOS850_PIN_BANK_EINTN() to
> EXYNOS9_PIN_BANK_EINTN().
>
> > +
> > +#define EXYNOS9_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
> > +       {                                               \
> > +               .type           =3D &gs101_bank_type_off, \
> > +               .pctl_offset    =3D reg,                  \
> > +               .nr_pins        =3D pins,                 \
> > +               .eint_type      =3D EINT_TYPE_GPIO,       \
> > +               .eint_offset    =3D offs,                 \
> > +               .fltcon_type    =3D FLT_DEFAULT,          \
> > +               .fltcon_offset  =3D fltcon_offs,          \
> > +               .name           =3D id                    \
> > +       }
>
> Ditto. Please add filter fields to EXYNOS850_PIN_BANK_EINTG() instead
> of adding pretty much the same macro (it is the same, I created
> EXYNOS850_PIN_BANK_EINTG() from exactly this macro). Also I suggest
> renaming EXYNOS850_PIN_BANK_EINTG() to EXYNOS9_PIN_BANK_EINTG(), to
> avoid confusion. If you need any help with reworking Exynos850 pinctrl
> correspondingly, please let me know.

The only issue for me migrating Exynos850 to EXYNOS9_PIN_BANK_EINTG is
knowing what the fltcon_offset is. Can you provide the fltcon_offset
offsets for the relevant Exynos850 banks and help test?

Thanks,

Peter.

>
> > +
> > +#define EXYNOS9_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
> > +       {                                                       \
> > +               .type           =3D &gs101_bank_type_alive,       \
> > +               .pctl_offset    =3D reg,                          \
> > +               .nr_pins        =3D pins,                         \
> > +               .eint_type      =3D EINT_TYPE_WKUP,               \
> > +               .eint_offset    =3D offs,                         \
> > +               .fltcon_type    =3D FLT_SELECTABLE,               \
> > +               .fltcon_offset  =3D fltcon_offs,                  \
> > +               .name           =3D id                            \
> > +       }
>
> Ditto.
>
> > +
> >  /**
> >   * struct exynos_weint_data: irq specific data for all the wakeup inte=
rrupts
> >   * generated by the external wakeup interrupt controller.
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 50c360b4753a..982a5702714c 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1323,6 +1323,8 @@ static const struct of_device_id samsung_pinctrl_=
dt_match[] =3D {
> >                 .data =3D &exynosautov9_of_data },
> >         { .compatible =3D "tesla,fsd-pinctrl",
> >                 .data =3D &fsd_of_data },
> > +       { .compatible =3D "google,gs101-pinctrl",
> > +               .data =3D &gs101_of_data },
> >  #endif
> >  #ifdef CONFIG_PINCTRL_S3C64XX
> >         { .compatible =3D "samsung,s3c64xx-pinctrl",
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctr=
l/samsung/pinctrl-samsung.h
> > index 5fab3885a7d7..f6856290608c 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > @@ -373,6 +373,7 @@ extern const struct samsung_pinctrl_of_match_data e=
xynos7885_of_data;
> >  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
> >  extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data=
;
> >  extern const struct samsung_pinctrl_of_match_data fsd_of_data;
> > +extern const struct samsung_pinctrl_of_match_data gs101_of_data;
> >  extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
> >  extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
> >  extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >

