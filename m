Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1472C10D61F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 14:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfK2NbH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 08:31:07 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33021 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfK2NbH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 08:31:07 -0500
Received: by mail-oi1-f196.google.com with SMTP id x21so18983170oic.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2019 05:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=leUO0edu/zvwcrXVpyPdi3hcS08emdpnl5Q/cwFAAr8=;
        b=kbzuiBDQWwKJPwIRi4i482mkXy4aS4iMuw4P/5xl9C+iAC9MUH01UQkzSmZWdarPjn
         nVMEHn/ZW/n2DBtKRJ2L6BZVBt50CmpdKK31OeTKm6Ca/ItXY3VniXwz1N2IjYERXcTn
         M3lkoUUmAnkYazxMLHRQx/GFcABAQHviwyMiQ9z8S+BpTgL4nQO/rtQFPuSMdSmtSOj9
         +t551QQXebDFI8R5NHbCmPsZkH+B4WCylbEw/07XoZ/mMdsMkRPYy0ECEx8LMx8qENvz
         gDvIYSS/dsRAIuFUjI3iHkBvIDdyaHSkcnF3pxkmSi1XSzpWQ81ZVFyVU8HLzC0hOnHu
         OvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=leUO0edu/zvwcrXVpyPdi3hcS08emdpnl5Q/cwFAAr8=;
        b=jnQlrS5IMyMaz9bCx3bxFBSsDng5U+df97oHnSFORJ9E5bPgPZdsshHBc4FDYPn+C5
         BycUCXX+0AxWakaCKVDA19Els4o+iGR0I4ffy6s3gYjqhIRUO3wkki/z+PN85GlHzRG7
         SH4zQo0WqvPbxdmUiNyuOsgFYfaqfO451ACCBFvwjYhRd4WB7acm1Hx0fLi4yU5aN7c4
         3knLVHsvqhkLZ+G2166tWEhc1NPjk7MEd3SavVNP+IKgMQuwR2WcZTsiXd45XXNqF2W0
         yxH4hPb8G5cve1ixHyQ60vweJLLPC3g7YSdL0kgHvCcEVEFgVkojdbck1EyuJkw882v9
         8krQ==
X-Gm-Message-State: APjAAAVBxSKiKoCmpVTAPEWslY2wRqj+5KtCW088csTZW4ZcoDsrpl0X
        6kS4pojCowl4H9Dcj34v2jODZ+FukHFxRgNW3ESaMw==
X-Google-Smtp-Source: APXvYqwc6a5zYSDqecG5biac+UoMZe9gZlziGmg96HzAYjifOMZNJPfuv9wqBvxjnBYpU9Q8nxWYvn3Ekoq/C+yQBMk=
X-Received: by 2002:aca:d904:: with SMTP id q4mr12722686oig.21.1575034264381;
 Fri, 29 Nov 2019 05:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20191127115619.20278-1-m.felsch@pengutronix.de>
 <20191127115619.20278-4-m.felsch@pengutronix.de> <CACRpkdbd4J-FUNi=F12YQfNPajNCVaoKyqWU7qjmfFMbonzDKg@mail.gmail.com>
 <20191127150146.bbwse77eef6haita@pengutronix.de> <CAMpxmJVmvj_4DN85j4vu32FUZVnzmQzQfUtOVKAd0GVO3sWYmA@mail.gmail.com>
 <20191129090736.f2ozwtrhynryatlq@pengutronix.de>
In-Reply-To: <20191129090736.f2ozwtrhynryatlq@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 29 Nov 2019 14:30:53 +0100
Message-ID: <CAMpxmJVoJsVaQHzAsMEwgiTUk9FOESmzrzk_ko-BFdNZVA1ogg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: da9062: add driver support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 29 lis 2019 o 10:07 Marco Felsch <m.felsch@pengutronix.de> napisa=C5=
=82(a):
>
> On 19-11-28 11:47, Bartosz Golaszewski wrote:
> > =C5=9Br., 27 lis 2019 o 16:01 Marco Felsch <m.felsch@pengutronix.de> na=
pisa=C5=82(a):
> > >
> > > Hi Linus,
> > >
> > > On 19-11-27 14:49, Linus Walleij wrote:
> > > > Hi Marco,
> > > >
> > > > thanks for your patch!
> > >
> > > thanks for your fast response.
> > >
> > > > On Wed, Nov 27, 2019 at 12:56 PM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
> > > >
> > > > > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs=
 can
> > > > > be used as input, output or have a special use-case.
> > > > >
> > > > > The patch adds the support for the normal input/output use-case.
> > > > >
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > (...)
> > > >
> > > > > +config PINCTRL_DA9062
> > > > > +       tristate "Dialog Semiconductor DA9062 PMIC pinctrl and GP=
IO Support"
> > > > > +       depends on MFD_DA9062
> > > > > +       select GPIOLIB
> > > >
> > > > Hm this would be one of those that could use GENERIC_REGMAP_GPIO
> > > > the day we invent it but we haven't invented it yet.
> > >
> > > Yes it is. Is there a plan for GENERIC_REGMAP_GPIO?
> > >
> >
> > Yes, it's the second item on my TODO after the LINEINFO_FD series. I
> > just got a board I can use for developing this so I should have
> > something shortly.
>
> So it is okay to keep the above select and change it later?
>

Yes, we don't want to stop you from getting this upstream. We'll
convert it once the new module is ready.

Bart

> Regards,
>   Marco
>
> > Bart
> >
> > > > > +#include <../gpio/gpiolib.h>
> > > >
> > > > Put a comment above this telling us why you do this thing.
> > >
> > > Okay.
> > >
> > > > > +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int of=
fset)
> > > > > +{
> > > > (...)
> > > > > +       return val & BIT(offset);
> > > >
> > > > You should #include <linux/bits.h> since you use BIT()
> > >
> > > Argh.. of course I will add the include.
> > >
> > > > Usually I clamp it like this:
> > > > return !!(val & BIT(offset));
> > >
> > > Okay, I can change that too.
> > >
> > > > > +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsig=
ned int offset)
> > > > > +{
> > > > > +       struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> > > > > +       struct regmap *regmap =3D pctl->da9062->regmap;
> > > > > +       int gpio_mode;
> > > > > +
> > > > > +       gpio_mode =3D da9062_pctl_get_pin_mode(regmap, offset);
> > > > > +       if (gpio_mode < 0)
> > > > > +               return gpio_mode;
> > > > > +
> > > > > +       switch (gpio_mode) {
> > > > > +       case DA9062_PIN_ALTERNATE:
> > > > > +               return -ENOTSUPP;
> > > > > +       case DA9062_PIN_GPI:
> > > > > +               return 1;
> > > > > +       case DA9062_PIN_GPO_OD:
> > > > > +       case DA9062_PIN_GPO_PP:
> > > > > +               return 0;
> > > >
> > > > We recently added defines for these directions in
> > > > <linux/gpio/driver.h>:
> > > >
> > > > #define GPIO_LINE_DIRECTION_IN  1
> > > > #define GPIO_LINE_DIRECTION_OUT 0
> > > >
> > > > Please use these. (Soon in Torvald's tree, else
> > > > in my "devel" branch.)
> > >
> > > I rebased it onto your devel, thanks for the hint.
> > >
> > > > > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > > > > +                                      unsigned int offset)
> > > > > +{
> > > > > +       struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> > > > > +       struct regmap *regmap =3D pctl->da9062->regmap;
> > > > > +       struct gpio_desc *desc =3D gpiochip_get_desc(gc, offset);
> > > > > +       unsigned int gpi_type;
> > > > > +       int ret;
> > > > > +
> > > > > +       ret =3D da9062_pctl_set_pin_mode(regmap, offset, DA9062_P=
IN_GPI);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       /*
> > > > > +        * If the gpio is active low we should set it in hw too. =
No worries
> > > > > +        * about gpio_get() because we read and return the gpio-l=
evel. So the
> > > > > +        * gpiolib active_low handling is still correct.
> > > > > +        *
> > > > > +        * 0 - active low, 1 - active high
> > > > > +        */
> > > > > +       gpi_type =3D !gpiod_is_active_low(desc);
> > > >
> > > > That's interesting. Correct too, I guess.
> > >
> > > Double checked it again and the datasheet calls it gpio-level so I
> > > assume that this is correct.
> > >
> > > > > +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> > > > > +                                       unsigned int offset, int =
value)
> > > > > +{
> > > > > +       /* Push-Pull / Open-Drain options are configured during s=
et_config */
> > > > > +       da9062_gpio_set(gc, offset, value);
> > > >
> > > > That looks dangerous. There is no guarantee that .set_config()
> > > > always gets called.
> > >
> > > Hm.. it seems that other drivers using this assumption too:
> > >   - gpio-lp87565.c
> > >   - gpio-tps65218.c
> > >   - ...
> > >
> > > But you're right I missed the possible users of
> > > gpiod_direction_output_raw().
> > >
> > > > Please create a local state container for the mode of each pin in
> > > > struct da9062_pctl and set it to push-pull by default at probe, the=
n
> > > > set this to whatever the state is here and let the .set_config()
> > > > alter it later if need be.
> > > >
> > > > If we don't do that you will get boot-time defaults I think and tha=
t
> > > > might create bugs.
> > >
> > > I will add a container for each pin, thanks for covering that.
> > >
> > > > > +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned=
 int offset,
> > > > > +                                 unsigned long config)
> > > > > +{
> > > > (...)
> > > > > +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > > > +               return da9062_pctl_set_pin_mode(regmap, offset,
> > > > > +                                               DA9062_PIN_GPO_OD=
);
> > > > > +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > > > +               return da9062_pctl_set_pin_mode(regmap, offset,
> > > > > +                                               DA9062_PIN_GPO_PP=
);
> > > >
> > > > So also store this in the per-pin state.
> > >
> > > Of course.
> > >
> > > Regards,
> > >   Marco
> > >
> > > >
> > > > Yours,
> > > > Linus Walleij
> > > >
> > >
> > > --
> > > Pengutronix e.K.                           |                         =
    |
> > > Steuerwalder Str. 21                       | http://www.pengutronix.d=
e/  |
> > > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0=
    |
> > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=
555 |
> >
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
