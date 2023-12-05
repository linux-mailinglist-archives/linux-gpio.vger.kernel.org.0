Return-Path: <linux-gpio+bounces-1034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BD805E65
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 20:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29CDBB2113A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 19:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4506A339;
	Tue,  5 Dec 2023 19:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cdv3dx/v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016C8188
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 11:10:50 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-58d18c224c7so3640763eaf.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 11:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701803450; x=1702408250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjRq0YQceCfiBc3DP2n6+Qtso7OISCbbcS5kthjj0o8=;
        b=Cdv3dx/vPsfngzgOqMWEHSgbn7b4LFXfYr2tJBV9qJ1SyWT2wA5BbHIiKdc5yMhapm
         xQEr7x7Yu3CnJnop0tAQX+dqIdyvlr9BdvaMxNBwLTk4VOcZIwflAjuKD/25HajhDtis
         hmEbira92OzRYIU6KyRLRz7TSLdIdIGD4MsFm9c7BVj8KyJMUYS8aPSi4kKyI/NtFjBh
         Hh83bZPtgxj/8TKN3Xfo+uJQy2IBG84GChKp1+VlPXduJkhQUOo+gLWvg+V6ZHDajmbj
         nTIo0DkGmdhStAQOd2pNghDpjTh20jhwxfp4e8bD40Hxwx9vo6NTa0Y0Yh16zku1vAGc
         eh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701803450; x=1702408250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjRq0YQceCfiBc3DP2n6+Qtso7OISCbbcS5kthjj0o8=;
        b=gNhFoY2buMFS5gXfg7AzAbGjqP/Jbj1Ts8lkJxovz9V1M69k6FStgEqbzHpc4Ix5kS
         o7glG2MQcSa0Frz3a8gSmeVqQToViBzYMDyM39Q42sI6X3BcFRBybqmTXJMtdy1UXSYA
         ejy58wXDY0vsYopE1FyF/Pg6VTVIpnZq46oiUcL6eo+nB6UUbKMNxmnHRl6UjvWXYh+v
         9YEd+0hHv0qlwKKMRg2M2lFWOd1VshaZw+aTUWoD7Qi3AeeyVpjB0xGZjsSzgQyu/uIn
         bb7QkUE8gA23QH64QBil65N7W6PIm+oCkB+fHBZnS15VhYEvvi9zorRUGlURTprkPu+w
         8ijQ==
X-Gm-Message-State: AOJu0Yw/xJI1XbYFmfc3ut+e8axivowwZJRm1XvaLqkPqcVd6MzXdIzD
	RJLLwC+KBacfYkYxGd3tfKqEMh60hUA8+PV+D6Ns3A==
X-Google-Smtp-Source: AGHT+IHIjnsSOUQFeqok2YoC5481YIqj2LTtj0w/jHgelGVWX7P31gM/PbTQLJrBonqNKVPrUBKHNiZfiwkaZfd/jrk=
X-Received: by 2002:a05:6358:419f:b0:16b:c467:695f with SMTP id
 w31-20020a056358419f00b0016bc467695fmr4156981rwc.9.1701803450050; Tue, 05 Dec
 2023 11:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-14-peter.griffin@linaro.org> <CAPLW+4nJCabQhyGrTKZhKG40Z9ysRq7Zms413JrhZKzeYzad5w@mail.gmail.com>
 <CADrjBPrq_CTzZsP+5cqpNkkyVYHu9Yey0AF+m4VxcSEz+Z+wrQ@mail.gmail.com>
In-Reply-To: <CADrjBPrq_CTzZsP+5cqpNkkyVYHu9Yey0AF+m4VxcSEz+Z+wrQ@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 19:10:37 +0000
Message-ID: <CADrjBPoJ4E4cLS9sVDnu4PmgLuGGybPwg+u3fQefjuUz-60Y5w@mail.gmail.com>
Subject: Re: [PATCH v5 13/20] pinctrl: samsung: Add filter selection support
 for alive banks
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

On Tue, 5 Dec 2023 at 11:34, Peter Griffin <peter.griffin@linaro.org> wrote=
:
>
> Hi Sam,
>
> Thanks for your review.
>
> On Sat, 2 Dec 2023 at 00:22, Sam Protsenko <semen.protsenko@linaro.org> w=
rote:
> >
> > On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@li=
naro.org> wrote:
> > >
> > > Newer Exynos SoCs have a filter selection register on alive bank pins=
.
> > > This allows the selection of a digital or delay filter for each pin. =
If
> > > the filter selection register is not available then the default filte=
r
> > > (digital) is applied.
> > >
> > > On suspend we apply the analog filter to all pins in the bank (as the
> > > digital filter relies on a clock). On resume the digital filter is
> > > reapplied to all pins in the bank. The digital filter is working via
> > > clock and has an adjustable filter delay register bitfield, whereas
> > > the analog filter uses a fixed delay.
> > >
> > > The filter determines to what extent signal fluctuations received thr=
ough
> > > the pad are considered glitches.
> > >
> > > The code path can be exercised using
> > > echo mem > /sys/power/state
> > > And then wake the device using a eint gpio
> >
> > Period.
>
> Will fix
>
> >
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  drivers/pinctrl/samsung/pinctrl-exynos.c  | 89 +++++++++++++++++++++=
+-
> > >  drivers/pinctrl/samsung/pinctrl-exynos.h  |  7 ++
> > >  drivers/pinctrl/samsung/pinctrl-samsung.c |  2 +
> > >  drivers/pinctrl/samsung/pinctrl-samsung.h | 22 ++++++
> > >  4 files changed, 119 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinct=
rl/samsung/pinctrl-exynos.c
> > > index 6b58ec84e34b..56fc11a1fe2f 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > > @@ -269,6 +269,71 @@ struct exynos_eint_gpio_save {
> > >         u32 eint_mask;
> > >  };
> > >
> > > +/*
> > > + * Set the desired filter (digital or analog delay) to every pin in
> > > + * the bank. Note the filter selection bitfield is only found on ali=
ve
> > > + * banks. The filter determines to what extent signal fluctuations
> > > + * received through the pad are considered glitches.
> > > + */
> > > +static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *=
d,
> > > +                                  struct samsung_pin_bank *bank, int=
 filter)
> > > +{
> > > +       unsigned int flt_reg, flt_con =3D 0;
> > > +       unsigned int val, shift;
> > > +       int i;
> > > +       int loop_cnt;
> > > +
> > > +       /*
> > > +        * The FLTCON register has the following layout
> > > +        *
> > > +        * BitfieldName[PinNum][Bit:Bit]
> > > +        * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> > > +        * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> > > +        * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> > > +        * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
> > > +        *
> > > +        * FLT_EN       0x0 =3D Disable, 0x1=3DEnable
> > > +        * FLT_SEL      0x0 =3D Delay filter, 0x1 Digital filter
> > > +        * FLT_WIDTH    Filtering width. Valid when FLT_SEL is 0x1
> > > +        */
> > > +
> > > +       flt_con |=3D EXYNOS9_FLTCON_EN;
> > > +
> > > +       if (filter)
> > > +               flt_con |=3D EXYNOS9_FLTCON_DIGITAL;
> > > +
> > > +       flt_reg =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
> > > +
> > > +       /*
> > > +        * If nr_pins > 4, we should set FLTCON0 register fully.
> > > +        * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
> > > +        */
> > > +       if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN)
> > > +               loop_cnt =3D EXYNOS9_FLTCON_NR_PIN;
> > > +       else
> > > +               loop_cnt =3D bank->nr_pins;
> > > +
> > > +       val =3D readl(d->virt_base + flt_reg);
> > > +       for (i =3D 0; i < loop_cnt; i++) {
> > > +               shift =3D i * EXYNOS9_FLTCON_LEN;
> > > +               val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> > > +               val |=3D (flt_con << shift);
> > > +       }
> > > +       writel(val, d->virt_base + flt_reg);
> > > +
> > > +       /* Loop for FLTCON1 pin 4 ~ 7 */
> > > +       if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN) {
> > > +               loop_cnt =3D (bank->nr_pins - EXYNOS9_FLTCON_NR_PIN);
> > > +               val =3D readl(d->virt_base + flt_reg + 0x4);
> > > +               for (i =3D 0; i < loop_cnt; i++) {
> > > +                       shift =3D i * EXYNOS9_FLTCON_LEN;
> > > +                       val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> > > +                       val |=3D (flt_con << shift);
> > > +               }
> > > +               writel(val, d->virt_base + flt_reg + 0x4);
> > > +       }
> > > +}
> > > +
> >
> > This whole function needs a refactoring. Do you think below code looks =
better?
>
> Yes it does!
> >
> > 8<----------------------------------------------------------------->8
> > static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int =
con)
> > {
> >     unsigned int val, shift;
> >     int i;
> >
> >     val =3D readl(reg);
> >     for (i =3D 0; i < cnt; i++) {
> >         shift =3D i * EXYNOS9_FLTCON_LEN;
> >         val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> >         val |=3D con << shift;
> >     }
> >     writel(val, reg);
> > }
> >
> > /*
> >  * Set the desired filter (digital or analog delay) to every pin in the=
 bank.
> >  * Note the filter selection bitfield is only found on alive banks. The=
 filter
> >  * determines to what extent signal fluctuations received through the p=
ad are
> >  * considered glitches.
> >  *
> >  * The FLTCON register has the following layout:
> >  *
> >  *     BitfieldName[PinNum][Bit:Bit]
> >  *     FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> >  *     FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> >  *     FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> >  *     FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
> >  *
> >  * FLT_EN    0x0 =3D Disable, 0x1 =3D Enable
> >  * FLT_SEL    0x0 =3D Delay filter, 0x1 =3D Digital filter
> >  * FLT_WIDTH    Filtering width. Valid when FLT_SEL is 0x1
> >  */
> > static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *d,
> >                    struct samsung_pin_bank *bank, int filter)
> > {
> >     unsigned int off =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offs=
et;
> >     unsigned int con =3D EXYNOS9_FLTCON_EN | filter;
> >     void __iomem *reg =3D d->virt_base + off;
> >     u8 n =3D bank->nr_pins;
> >
> >     if (bank->fltcon_type =3D=3D FLT_DEFAULT)
> >         return;
> >
> >     /*
> >      * If nr_pins > 4, we should set FLTCON0 register fully (pin0~3).
> >      * So loop 4 times in case of FLTCON0. Loop for FLTCON1 pin4~7.
> >      */
> >     if (n <=3D 4) {
> >         exynos_eint_update_flt_reg(reg, n, con);
> >     } else {
> >         exynos_eint_update_flt_reg(reg, 4, con);
> >         exynos_eint_update_flt_reg(reg + 0x4, n - 4, con);
> >     }
> > }
> > 8<----------------------------------------------------------------->8
> >
> > (the code is only to illustrate the idea, I never tested it).
>
> I can refactor it along those lines.
>
> >
> > >  /*
> > >   * exynos_eint_gpio_init() - setup handling of external gpio interru=
pts.
> > >   * @d: driver data of samsung pinctrl driver.
> > > @@ -321,6 +386,10 @@ __init int exynos_eint_gpio_init(struct samsung_=
pinctrl_drv_data *d)
> > >                         goto err_domains;
> > >                 }
> > >
> > > +               /* Set Delay Analog Filter */
> >
> > The code below looks quite self-explanatory to. Maybe remove all
> > comments like this? If you don't think exynos_eint_flt_config() is
> > clear, maybe rename it to exynos_eint_set_filter().
>
> Ok, I will update the function name to exynos_eint_set_filter() and
> remove the comments.
>
> >
> > > +               if (bank->fltcon_type !=3D FLT_DEFAULT)
> > > +                       exynos_eint_flt_config(d, bank,
> > > +                                              EXYNOS9_FLTCON_DELAY);
> >
> > It fits the previous line just fine, no need to break the line.
> >
> > Also, if you use the refactored version of exynos_eint_flt_config() I
> > mentioned above, you can drop all 'if' conditions like this.
>
> Will fix
>
> >
> > >         }
> > >
> > >         return 0;
> > > @@ -555,6 +624,11 @@ __init int exynos_eint_wkup_init(struct samsung_=
pinctrl_drv_data *d)
> > >                 if (bank->eint_type !=3D EINT_TYPE_WKUP)
> > >                         continue;
> > >
> > > +               /* Set Digital Filter */
> > > +               if (bank->fltcon_type !=3D FLT_DEFAULT)
> > > +                       exynos_eint_flt_config(d, bank,
> > > +                                              EXYNOS9_FLTCON_DIGITAL=
);
> >
> > Ditto: no need to break the line, remove the comment. If you use the
> > refactored function, you can drop 'if'.
>
> will fix
>
> >
> > > +
> > >                 bank->irq_chip =3D devm_kmemdup(dev, irq_chip, sizeof=
(*irq_chip),
> > >                                               GFP_KERNEL);
> > >                 if (!bank->irq_chip) {
> > > @@ -658,6 +732,7 @@ static void exynos_pinctrl_suspend_bank(
> > >  void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata=
)
> > >  {
> > >         struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> > > +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> > >         struct exynos_irq_chip *irq_chip =3D NULL;
> > >         int i;
> > >
> > > @@ -665,6 +740,10 @@ void exynos_pinctrl_suspend(struct samsung_pinct=
rl_drv_data *drvdata)
> > >                 if (bank->eint_type =3D=3D EINT_TYPE_GPIO)
> > >                         exynos_pinctrl_suspend_bank(drvdata, bank);
> > >                 else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> > > +                       /* Setting Delay (Analog) Filter */
> > > +                       if (bank->fltcon_type !=3D FLT_DEFAULT)
> > > +                               exynos_eint_flt_config(d, bank,
> > > +                                                      EXYNOS9_FLTCON=
_DELAY);
> >
> > Ditto: no need to break the line, remove the comment. If you use the
> > refactored function, you can drop 'if'.
>
> Will fix
> >
> > >                         if (!irq_chip) {
> > >                                 irq_chip =3D bank->irq_chip;
> > >                                 irq_chip->set_eint_wakeup_mask(drvdat=
a,
> > > @@ -707,11 +786,19 @@ static void exynos_pinctrl_resume_bank(
> > >  void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
> > >  {
> > >         struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> > > +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> > >         int i;
> > >
> > >         for (i =3D 0; i < drvdata->nr_banks; ++i, ++bank)
> > > -               if (bank->eint_type =3D=3D EINT_TYPE_GPIO)
> > > +               if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> > >                         exynos_pinctrl_resume_bank(drvdata, bank);
> > > +               } else if (bank->eint_type =3D=3D EINT_TYPE_WKUP ||
> > > +                          bank->eint_type =3D=3D EINT_TYPE_WKUP_MUX)=
 {
> > > +                       /* Set Digital Filter */
> > > +                       if (bank->fltcon_type !=3D FLT_DEFAULT)
> > > +                               exynos_eint_flt_config(d, bank,
> > > +                                                      EXYNOS9_FLTCON=
_DIGITAL);
> >
> > Ditto: remove the comment, and if you use the refactored function, you
> > can drop 'if'; also there will be no need to break the line.
>
> Will fix
> >
> > > +               }
> > >  }
> > >
> > >  static void exynos_retention_enable(struct samsung_pinctrl_drv_data =
*drvdata)
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinct=
rl/samsung/pinctrl-exynos.h
> > > index 3ac52c2cf998..e2799ff1b5e9 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> > > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > > @@ -50,6 +50,13 @@
> > >
> > >  #define EXYNOS_EINT_MAX_PER_BANK       8
> > >  #define EXYNOS_EINT_NR_WKUP_EINT
> >
> > Maybe add an empty line here?
>
> Will fix
> >
> > > +/* EINT filter configuration */
> > > +#define EXYNOS9_FLTCON_EN              BIT(7)
> > > +#define EXYNOS9_FLTCON_DIGITAL         BIT(6)
> > > +#define EXYNOS9_FLTCON_DELAY           (0 << 6)
> > > +#define EXYNOS9_FLTCON_MASK            0xff
> > > +#define EXYNOS9_FLTCON_LEN             8
> > > +#define EXYNOS9_FLTCON_NR_PIN          4
> >
> > I'd say drop this one and just hard-code it where needed?
>
> Ok, will drop.
>
> >
> > >
> > >  #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)           \
> > >         {                                               \
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinc=
trl/samsung/pinctrl-samsung.c
> > > index 79babbb39ced..50c360b4753a 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > > @@ -1105,6 +1105,8 @@ samsung_pinctrl_get_soc_data(struct samsung_pin=
ctrl_drv_data *d,
> > >                 bank->eint_func =3D bdata->eint_func;
> > >                 bank->eint_type =3D bdata->eint_type;
> > >                 bank->eint_mask =3D bdata->eint_mask;
> > > +               bank->fltcon_type =3D bdata->fltcon_type;
> > > +               bank->fltcon_offset =3D bdata->fltcon_offset;
> > >                 bank->eint_offset =3D bdata->eint_offset;
> > >                 bank->name =3D bdata->name;
> > >
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinc=
trl/samsung/pinctrl-samsung.h
> > > index 9b3db50adef3..5fab3885a7d7 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > > @@ -82,6 +82,20 @@ enum eint_type {
> > >         EINT_TYPE_WKUP_MUX,
> > >  };
> > >
> > > +/**
> > > + * enum fltcon_type - filter selection
> > > + * @FLT_DEFAULT: filter not selectable, default digital filter
> > > + * @FLT_SELECT: filter selectable (digital or delay)
> > > + *
> > > + * Some banks on newer Exynos based SoCs have a selectable filter on=
 alive
> > > + * banks of 'analog/delay' or 'digital'. If the filter selection reg=
ister is
> > > + * not available then the default filter is used (digital).
> > > + */
> > > +enum fltcon_type {
> > > +       FLT_DEFAULT,
> > > +       FLT_SELECTABLE,
> > > +};
> >
> > Is there any benefit of having this enum over replacing it with just a
> > bool field (e.g. 'bool flt_selectable')?
>
> I thought it made it clearer at the callee sites which filter was
> being set, but I can update to a bool if that's what you prefer.

Actually that was a previous version. We actually pass
EXYNOS9_FLTCON_DELAY and EXYNOS9_FLTCON_DIGITAL now so yes enum is no
longer required.

Peter
>
> regards,
>
> Peter.
>
> >
> > > +
> > >  /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
> > >  #define PIN_NAME_LENGTH        10
> > >
> > > @@ -122,6 +136,8 @@ struct samsung_pin_bank_type {
> > >   * @eint_type: type of the external interrupt supported by the bank.
> > >   * @eint_mask: bit mask of pins which support EINT function.
> > >   * @eint_offset: SoC-specific EINT register or interrupt offset of b=
ank.
> > > + * @fltcon_type: whether the filter (delay/digital) is selectable
> > > + * @fltcon_offset: SoC-specific EINT filter control register offset =
of bank.
> > >   * @name: name to be prefixed for each pin in this pin bank.
> > >   */
> > >  struct samsung_pin_bank_data {
> > > @@ -133,6 +149,8 @@ struct samsung_pin_bank_data {
> > >         enum eint_type  eint_type;
> > >         u32             eint_mask;
> > >         u32             eint_offset;
> > > +       enum fltcon_type fltcon_type;
> > > +       u32             fltcon_offset;
> > >         const char      *name;
> > >  };
> > >
> > > @@ -147,6 +165,8 @@ struct samsung_pin_bank_data {
> > >   * @eint_type: type of the external interrupt supported by the bank.
> > >   * @eint_mask: bit mask of pins which support EINT function.
> > >   * @eint_offset: SoC-specific EINT register or interrupt offset of b=
ank.
> > > + * @fltcon_type: whether the filter (delay/digital) is selectable
> > > + * @fltcon_offset: SoC-specific EINT filter control register offset =
of bank.
> > >   * @name: name to be prefixed for each pin in this pin bank.
> > >   * @id: id of the bank, propagated to the pin range.
> > >   * @pin_base: starting pin number of the bank.
> > > @@ -170,6 +190,8 @@ struct samsung_pin_bank {
> > >         enum eint_type  eint_type;
> > >         u32             eint_mask;
> > >         u32             eint_offset;
> > > +       enum fltcon_type fltcon_type;
> > > +       u32             fltcon_offset;
> > >         const char      *name;
> > >         u32             id;
> > >
> > > --
> > > 2.43.0.rc2.451.g8631bc7472-goog
> > >

