Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDFBC7D10E3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 15:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377489AbjJTNyZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Oct 2023 09:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377274AbjJTNyY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2023 09:54:24 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFAD19E
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 06:54:20 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b2b1ae4c21so599692b6e.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697810059; x=1698414859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtwvBV51E4fAFQw0SFxiceF2yhOg1BukmOAnly80J7Q=;
        b=NxrxgeFrBWwUD5eo2r39RqQjc67L/KFKr+8on+UAz41sc5hNtMVM0Zo7xEoBhlksxQ
         rHFhZLFZz/w0H//9deaTGFBn2bMmdSHWJXuLpwOsp5AgC5qBsZB9dx8E45m5SFEmYF/P
         +sZ0JA7V7bAHEXvmnItXBjoD2rWAsxrLAIfFcoZ0G+UxE8XQB9Oxi8vY88jOEtx28eIk
         r6apqL8IkOv1Hh4s7daIFn2ug2QUVA6TwTWBFq50XnjkD5y9+T6c5ah4wl9qJAXPj9oM
         9smLVpfWi9Hqr1Ue75m94lFtuVmjIEYoSbQj5GbQ+CIs/si2tksYj96aGAMn4KhPJjgZ
         TXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810059; x=1698414859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtwvBV51E4fAFQw0SFxiceF2yhOg1BukmOAnly80J7Q=;
        b=VfnBoo1RppXyXEUiWR9GRjfzo9z4uiu5BtEsd8+WFT71JI0UPdV1T2RiRuh+xz9vuU
         0kKjPM97YztVZowELmxfntWr34z4NC+wZSudoBPZ/Wh4Y0t8UaVV1h5StEc3Ye86329n
         YfZG0Mj4VI3YBQSzAkoSsIEfTOd9kzwbljI781MD3FfrGxoKnPizgyneHHCpETr2IBPl
         3ndBBWvgcAjQ296RlJKfKKqw/GwXxKkmJJPmPoSIF+0iVNHykNMKCgArs9JgPA/oDb+c
         vW8XY0SxPvuLK33PDF0onQ12EHAXL4Rx1VJrbw0zTiC9SD3qE8CqsnLNkTyxTd/nXo/8
         txEg==
X-Gm-Message-State: AOJu0YznW1Z5ZvwIvwgYjFZTfJXKGmxiZgw4fWYr1EvWPOi5sbhT8jNu
        BPbRhSN5WuzzxQTau7KmYqEOiFgCzEXiIehXCOXoiQ==
X-Google-Smtp-Source: AGHT+IHpv2Vm4T4YbfcSkCY442O12YSvQFH8kmcGjglhDwt+1P6OnToh5q1mSl0h1YmBGD6KxcLKKTDETppFPSx6AWQ=
X-Received: by 2002:a05:6808:308b:b0:3ac:4ee2:337b with SMTP id
 bl11-20020a056808308b00b003ac4ee2337bmr2175099oib.51.1697810059595; Fri, 20
 Oct 2023 06:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-14-peter.griffin@linaro.org> <CAPLW+4nVKXrW3q8d+Lm7p=s9n92Viw2SZLsXV1E4vBxP7cWRwg@mail.gmail.com>
In-Reply-To: <CAPLW+4nVKXrW3q8d+Lm7p=s9n92Viw2SZLsXV1E4vBxP7cWRwg@mail.gmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Fri, 20 Oct 2023 14:54:08 +0100
Message-ID: <CADrjBPrGtr7Jas1Mr8U8qTm4HCyNppmC1s=XX1JfsoddCrK8Cw@mail.gmail.com>
Subject: Re: [PATCH v3 13/20] pinctrl: samsung: Add filter selection support
 for alive banks
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sam,

Thanks for your review feedback. See my answers inline below.

On Wed, 11 Oct 2023 at 23:47, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Newer Exynos SoCs have a filter selection register on alive bank pins.
> > This allows the selection of a digital or delay filter for each pin. If
> > the filter selection register is not available then the default filter
> > (digital) is applied.
> >
>
> I wonder if that solves any particular issue. For Exynos850 I decided
> against adding this feature because I failed to find any benefits of
> it. Didn't even come up with the way to test it. Is it really needed
> for this SoC functioning? In case you have some more details on why
> it's needed and how it can be tested, please add that info to the
> commit message as well.

I can certainly add some more information to the commit message.

The filter determines to what extent the signal fluctuations received
through the pad on the GPIO are considered glitches. The downstream
kernel used by Pixel 6 phones in production set this filter. If you want to
test on e850 then I would issue

echo mem > /sys/power/state

And then try to wake the device using some eint gpio. The upstream
kernel gs101/Oriole isn't functional enough currently to test suspend
resume. The logic makes sense though that whilst suspended you
don't want the digital filter enabled, as it is using a clock.

Given this filter is about detecting glitches and signal fluctuations it
looks like the sort of thing that may not deterministically fail but
could lead to spurious wakeups, which is obviously not good for a
battery based device. Additionally setting this filter is what is
recommended by the SoC manufacturer, so it seems wise to set it.

>
> > On suspend we apply the analog filter to all pins in the bank, and on
> > resume the digital filter is reapplied to all pins in the bank.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
>
> Heads up: I noticed some merge warnings when applying this patch onto
> the most recent linux-next, like so:
>
> 8<---------------------------------------------------------------------->=
8
>     Applying: pinctrl: samsung: Add filter selection support for alive ba=
nks
>     Using index info to reconstruct a base tree...
>     M    drivers/pinctrl/samsung/pinctrl-exynos.c
>     M    drivers/pinctrl/samsung/pinctrl-exynos.h
>     M    drivers/pinctrl/samsung/pinctrl-samsung.c
>     M    drivers/pinctrl/samsung/pinctrl-samsung.h
>     Falling back to patching base and 3-way merge...
>     Auto-merging drivers/pinctrl/samsung/pinctrl-samsung.h
>     Auto-merging drivers/pinctrl/samsung/pinctrl-samsung.c
>     Auto-merging drivers/pinctrl/samsung/pinctrl-exynos.h
>     Auto-merging drivers/pinctrl/samsung/pinctrl-exynos.c
> 8<---------------------------------------------------------------------->=
8
>
> It was still applied, but maybe if you are going to send v4 try to
> rebase your series on top of linux-next first.
>
> Below are pretty minor comments for the code.
>
> >  drivers/pinctrl/samsung/pinctrl-exynos.c  | 82 ++++++++++++++++++++++-
> >  drivers/pinctrl/samsung/pinctrl-exynos.h  |  7 ++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c |  2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h | 23 +++++++
> >  4 files changed, 113 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
> > index a8212fc126bf..800831aa8357 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -269,6 +269,68 @@ struct exynos_eint_gpio_save {
> >         u32 eint_mask;
> >  };
> >
> > +static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *d,
> > +                                  struct samsung_pin_bank *bank, int f=
ilter)
> > +{
> > +       unsigned int flt_reg, flt_con =3D 0;
> > +       unsigned int val, shift;
> > +       int i;
> > +       int loop_cnt;
> > +
> > +       /*
> > +        * This function sets the desired filter (digital or delay) to
> > +        * every pin in the bank. Note the filter selection bitfield is
> > +        * only found on alive banks. The FLTCON register has the
> > +        * following layout
> > +        *
> > +        * BitfieldName[PinNum][Bit:Bit]
> > +        *
> > +        * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> > +        * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> > +        * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> > +        * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
> > +        */
>
> Maybe move this comment above this function? Or split it in two parts:
> function doc, and 'flt_con' variable doc.

Ok will move/split it

>
> > +
> > +       flt_con |=3D EXYNOS9_FLTCON_EN;
> > +
> > +       if (filter)
>
> Different values are passed as a 'filter' param to this function. But
> here it's only used as a boolean value. Something doesn't feel right.

That was done to aid readability at the callee sites

>
> > +               flt_con |=3D EXYNOS9_FLTCON_SEL_DIGITAL;
> > +
> > +       flt_reg =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
> > +
> > +       if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN)
> > +               /*
> > +                * if nr_pins > 4, we should set FLTCON0 register fully=
.
> > +                * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
> > +                */
>
> Maybe move this comment above 'if' block? And start with capital
> letter, for consistency with other multi-line comments.

will fix

>
> > +               loop_cnt =3D EXYNOS9_FLTCON_NR_PIN;
> > +       else
> > +               loop_cnt =3D bank->nr_pins;
> > +
> > +       val =3D readl(d->virt_base + flt_reg);
> > +
>
> Maybe remove this empty line to make RMW block the whole?

will do
>
> > +       for (i =3D 0; i < loop_cnt; i++) {
> > +               shift =3D i * EXYNOS9_FLTCON_LEN;
> > +               val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> > +               val |=3D (flt_con << shift);
> > +       }
> > +
>
> Ditto.
>
> > +       writel(val, d->virt_base + flt_reg);
> > +
> > +       /* loop for FLTCON1 pin 4 ~ 7 */
>
> Start with a capital letter for consistency.

will fix

>
> > +       if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN) {
> > +               val =3D readl(d->virt_base + flt_reg + 0x4);
> > +               loop_cnt =3D (bank->nr_pins - EXYNOS9_FLTCON_NR_PIN);
> > +
> > +               for (i =3D 0; i < loop_cnt; i++) {
> > +                       shift =3D i * EXYNOS9_FLTCON_LEN;
> > +                       val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> > +                       val |=3D (flt_con << shift);
> > +               }
>
> Code duplication, but it's minor.
>
> > +               writel(val, d->virt_base + flt_reg + 0x4);
> > +       }
> > +}
> > +
> >  /*
> >   * exynos_eint_gpio_init() - setup handling of external gpio interrupt=
s.
> >   * @d: driver data of samsung pinctrl driver.
> > @@ -321,6 +383,9 @@ __init int exynos_eint_gpio_init(struct samsung_pin=
ctrl_drv_data *d)
> >                         goto err_domains;
> >                 }
> >
> > +               /* Set Delay Analog Filter */
> > +               if (bank->fltcon_type !=3D FLT_DEFAULT)
> > +                       exynos_eint_flt_config(d, bank, EXYNOS9_FLTCON_=
SEL_DELAY);
> >         }
> >
> >         return 0;
> > @@ -555,6 +620,10 @@ __init int exynos_eint_wkup_init(struct samsung_pi=
nctrl_drv_data *d)
> >                 if (bank->eint_type !=3D EINT_TYPE_WKUP)
> >                         continue;
> >
> > +               /* Set Digital Filter */
> > +               if (bank->fltcon_type !=3D FLT_DEFAULT)
> > +                       exynos_eint_flt_config(d, bank, EXYNOS9_FLTCON_=
SEL_DIGITAL);
>
> Please stick to 80 characters per line when possible.

will fix
>
> > +
> >                 bank->irq_chip =3D devm_kmemdup(dev, irq_chip, sizeof(*=
irq_chip),
> >                                               GFP_KERNEL);
> >                 if (!bank->irq_chip) {
> > @@ -658,6 +727,7 @@ static void exynos_pinctrl_suspend_bank(
> >  void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
> >  {
> >         struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> > +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> >         struct exynos_irq_chip *irq_chip =3D NULL;
> >         int i;
> >
> > @@ -665,6 +735,9 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_=
drv_data *drvdata)
> >                 if (bank->eint_type =3D=3D EINT_TYPE_GPIO)
> >                         exynos_pinctrl_suspend_bank(drvdata, bank);
> >                 else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> > +                       /* Setting Delay (Analog) Filter */
> > +                       if (bank->fltcon_type !=3D FLT_DEFAULT)
> > +                               exynos_eint_flt_config(d, bank, EXYNOS9=
_FLTCON_SEL_DELAY);
>
> Please stick to 80 characters per line when possible.

will fix
>
> >                         if (!irq_chip) {
> >                                 irq_chip =3D bank->irq_chip;
> >                                 irq_chip->set_eint_wakeup_mask(drvdata,
> > @@ -707,11 +780,18 @@ static void exynos_pinctrl_resume_bank(
> >  void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
> >  {
> >         struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> > +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> >         int i;
> >
> >         for (i =3D 0; i < drvdata->nr_banks; ++i, ++bank)
> > -               if (bank->eint_type =3D=3D EINT_TYPE_GPIO)
> > +               if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> >                         exynos_pinctrl_resume_bank(drvdata, bank);
> > +               } else if (bank->eint_type =3D=3D EINT_TYPE_WKUP ||
> > +                       bank->eint_type =3D=3D EINT_TYPE_WKUP_MUX) {
>
> Indent it to be under the open bracket on the previous line.

will fix
>
> > +                       /* Set Digital Filter */
> > +                       if (bank->fltcon_type !=3D FLT_DEFAULT)
> > +                               exynos_eint_flt_config(d, bank, EXYNOS9=
_FLTCON_SEL_DIGITAL);
>
> Please stick to 80 characters per line when possible.

will fix
>
> > +               }
> >  }
> >
> >  static void exynos_retention_enable(struct samsung_pinctrl_drv_data *d=
rvdata)
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl=
/samsung/pinctrl-exynos.h
> > index 7bd6d82c9f36..63b2426ad5d6 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > @@ -50,6 +50,13 @@
> >
> >  #define EXYNOS_EINT_MAX_PER_BANK       8
> >  #define EXYNOS_EINT_NR_WKUP_EINT
> > +/* EINT filter configuration */
> > +#define EXYNOS9_FLTCON_EN              BIT(7)
> > +#define EXYNOS9_FLTCON_SEL_DIGITAL     BIT(6)
> > +#define EXYNOS9_FLTCON_SEL_DELAY       0
> > +#define EXYNOS9_FLTCON_MASK            0xff
> > +#define EXYNOS9_FLTCON_LEN             8
> > +#define EXYNOS9_FLTCON_NR_PIN          4
> >
>
> I guess we discussed using EXYNOS9 prefix during the review of
> Exynos850 initial submission, and decided against it. But in case of
> this SoC (which is obviously Exynos, but is called Google), I'm not
> even sure which name would be appropriate. I mean, if it's ok to use
> EXYNOS9 prefix, then maybe I should go ahead and rename existing
> EXYNOS850 definitions to EXYNOS9 too, as it belongs to the same
> platform family, to avoid any confusion.

If Exynos850 also has this filter selection functionality, and we want to
share the same macro names between gs101 and exynos850 then I
think EXYNOS9_ prefix makes sense. That is what they are called in
the downstream kernel IIRC

>
> Krzysztof, what's your take on this?
>
> >  #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)           \
> >         {                                               \
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index e54847040b4a..449f8109d8b5 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1104,6 +1104,8 @@ samsung_pinctrl_get_soc_data(struct samsung_pinct=
rl_drv_data *d,
> >                 bank->eint_func =3D bdata->eint_func;
> >                 bank->eint_type =3D bdata->eint_type;
> >                 bank->eint_mask =3D bdata->eint_mask;
> > +               bank->fltcon_type =3D bdata->fltcon_type;
> > +               bank->fltcon_offset =3D bdata->fltcon_offset;
> >                 bank->eint_offset =3D bdata->eint_offset;
> >                 bank->name =3D bdata->name;
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctr=
l/samsung/pinctrl-samsung.h
> > index 9af93e3d8d9f..de2ca8e8b378 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > @@ -82,6 +82,21 @@ enum eint_type {
> >         EINT_TYPE_WKUP_MUX,
> >  };
> >
> > +/**
> > + * enum fltcon_type - filter selection
> > + * @FLT_DEFAULT: filter not selectable, default digital filter
> > + * @FLT_SELECT: filter selectable (digital or delay)
> > + *
> > + * Some banks on some SoCs (gs101 and possibly others) have a selectab=
le
> > + * filter on alive banks of 'delay/analog' or 'digital'. If the filter
> > + * selection is not available then the default filter is used (digital=
).
> > + */
> > +
>
> Maybe remove this empty line?

Will fix

regards,

Peter

>
> > +enum fltcon_type {
> > +       FLT_DEFAULT,
> > +       FLT_SELECTABLE,
> > +};
> > +
> >  /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
> >  #define PIN_NAME_LENGTH        10
> >
> > @@ -122,6 +137,8 @@ struct samsung_pin_bank_type {
> >   * @eint_type: type of the external interrupt supported by the bank.
> >   * @eint_mask: bit mask of pins which support EINT function.
> >   * @eint_offset: SoC-specific EINT register or interrupt offset of ban=
k.
> > + * @fltcon_type: whether the filter (delay/digital) is selectable
> > + * @fltcon_offset: SoC-specific EINT filter control register offset of=
 bank.
> >   * @name: name to be prefixed for each pin in this pin bank.
> >   */
> >  struct samsung_pin_bank_data {
> > @@ -133,6 +150,8 @@ struct samsung_pin_bank_data {
> >         enum eint_type  eint_type;
> >         u32             eint_mask;
> >         u32             eint_offset;
> > +       enum fltcon_type fltcon_type;
> > +       u32             fltcon_offset;
> >         const char      *name;
> >  };
> >
> > @@ -147,6 +166,8 @@ struct samsung_pin_bank_data {
> >   * @eint_type: type of the external interrupt supported by the bank.
> >   * @eint_mask: bit mask of pins which support EINT function.
> >   * @eint_offset: SoC-specific EINT register or interrupt offset of ban=
k.
> > + * @fltcon_type: whether the filter (delay/digital) is selectable
> > + * @fltcon_offset: SoC-specific EINT filter control register offset of=
 bank.
> >   * @name: name to be prefixed for each pin in this pin bank.
> >   * @pin_base: starting pin number of the bank.
> >   * @soc_priv: per-bank private data for SoC-specific code.
> > @@ -169,6 +190,8 @@ struct samsung_pin_bank {
> >         enum eint_type  eint_type;
> >         u32             eint_mask;
> >         u32             eint_offset;
> > +       enum fltcon_type fltcon_type;
> > +       u32             fltcon_offset;
> >         const char      *name;
> >
> >         u32             pin_base;
> > --
> > 2.42.0.655.g421f12c284-goog
> >
