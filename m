Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 256BC10C731
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 11:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfK1Ksa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 05:48:30 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34310 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbfK1KsA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 05:48:00 -0500
Received: by mail-ot1-f68.google.com with SMTP id w11so21892795ote.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 02:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n2M2DOjN0rUIee7f4568qv54/w22jqT9t2zHXJTCIiw=;
        b=RUGtgzBebXP1WZ9U1bG+HcXscXKN80DgVHovE3PcZrqWBA0Wy4VcipFW2KTgh6tHaR
         +PdnRIM8vF4znJoXxcuHpd/hXdhaFfDbI7t5hdag9UEn4zreWqDlab1tbXI+aXOzcJ98
         5KR7t7gQbCP2PVHM1L8zHTwOfxfS6yy/Koec/WOYTWLJNSGwG8ZGJPz5WsYpwMs+SKoM
         F2XcGkA3KeQobqV0lAvoa6zxNMiBSqXib/rzgcGsbgI85sor94g1ws345m0cWSDzgkmV
         C71huSCrIP8Pn+cBPYuDIC5HOzi1/jzR+S9PqlV9+wl14GN68xWqBezKZ/JYognJantJ
         2NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n2M2DOjN0rUIee7f4568qv54/w22jqT9t2zHXJTCIiw=;
        b=TANKl8rDQTgh2o1GVk8o92adD1bXu8XbyYljLjHDgQJosrPMrKEjGANA7+8QKNkxn8
         kQAH37QIz/wSkNEeDTOYc/LILICqYIXW8PDviJ5dry1dMkmxtvilHq2HsJgQ4Sb2D+2k
         T3VqO63F5vl1UmrEE2IwrdU3rfEc0a95RJb7qxu2tYg1gcdy78/ZWQEa2mbFS42GnRxU
         hqj4typv8KeWcYtwaZGuIcnlN4JU5AR9RHvsk92goVXlGtMuprpv8PK48XT38VNlKG1L
         fr51zVB2AQfCEVLFhV7U1BAM2jt8JeXhVubwlegGMM7h68OKyGx2dU3FzJynbkob5t3f
         I7Tw==
X-Gm-Message-State: APjAAAVO3wm7N1pxT/OdMAwaknI90dsAwhS6i6i/+6qHzyuaYSrx4JYn
        hmiVLaqWP69XgQxsSOi3eD+s5dChRGnuZ/JTptrFZw==
X-Google-Smtp-Source: APXvYqwIkFVv7DR8vkf6HhHumjwzeFxERIxhx/z94crNx+5eHBWmuhZT3Pco4t/Z2qUI1fCGbsAYxly9lsdxfwBgFTw=
X-Received: by 2002:a9d:5d10:: with SMTP id b16mr1859246oti.250.1574938079551;
 Thu, 28 Nov 2019 02:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20191127115619.20278-1-m.felsch@pengutronix.de>
 <20191127115619.20278-4-m.felsch@pengutronix.de> <CACRpkdbd4J-FUNi=F12YQfNPajNCVaoKyqWU7qjmfFMbonzDKg@mail.gmail.com>
 <20191127150146.bbwse77eef6haita@pengutronix.de>
In-Reply-To: <20191127150146.bbwse77eef6haita@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 Nov 2019 11:47:48 +0100
Message-ID: <CAMpxmJVmvj_4DN85j4vu32FUZVnzmQzQfUtOVKAd0GVO3sWYmA@mail.gmail.com>
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

=C5=9Br., 27 lis 2019 o 16:01 Marco Felsch <m.felsch@pengutronix.de> napisa=
=C5=82(a):
>
> Hi Linus,
>
> On 19-11-27 14:49, Linus Walleij wrote:
> > Hi Marco,
> >
> > thanks for your patch!
>
> thanks for your fast response.
>
> > On Wed, Nov 27, 2019 at 12:56 PM Marco Felsch <m.felsch@pengutronix.de>=
 wrote:
> >
> > > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> > > be used as input, output or have a special use-case.
> > >
> > > The patch adds the support for the normal input/output use-case.
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > (...)
> >
> > > +config PINCTRL_DA9062
> > > +       tristate "Dialog Semiconductor DA9062 PMIC pinctrl and GPIO S=
upport"
> > > +       depends on MFD_DA9062
> > > +       select GPIOLIB
> >
> > Hm this would be one of those that could use GENERIC_REGMAP_GPIO
> > the day we invent it but we haven't invented it yet.
>
> Yes it is. Is there a plan for GENERIC_REGMAP_GPIO?
>

Yes, it's the second item on my TODO after the LINEINFO_FD series. I
just got a board I can use for developing this so I should have
something shortly.

Bart

> > > +#include <../gpio/gpiolib.h>
> >
> > Put a comment above this telling us why you do this thing.
>
> Okay.
>
> > > +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset=
)
> > > +{
> > (...)
> > > +       return val & BIT(offset);
> >
> > You should #include <linux/bits.h> since you use BIT()
>
> Argh.. of course I will add the include.
>
> > Usually I clamp it like this:
> > return !!(val & BIT(offset));
>
> Okay, I can change that too.
>
> > > +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned =
int offset)
> > > +{
> > > +       struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> > > +       struct regmap *regmap =3D pctl->da9062->regmap;
> > > +       int gpio_mode;
> > > +
> > > +       gpio_mode =3D da9062_pctl_get_pin_mode(regmap, offset);
> > > +       if (gpio_mode < 0)
> > > +               return gpio_mode;
> > > +
> > > +       switch (gpio_mode) {
> > > +       case DA9062_PIN_ALTERNATE:
> > > +               return -ENOTSUPP;
> > > +       case DA9062_PIN_GPI:
> > > +               return 1;
> > > +       case DA9062_PIN_GPO_OD:
> > > +       case DA9062_PIN_GPO_PP:
> > > +               return 0;
> >
> > We recently added defines for these directions in
> > <linux/gpio/driver.h>:
> >
> > #define GPIO_LINE_DIRECTION_IN  1
> > #define GPIO_LINE_DIRECTION_OUT 0
> >
> > Please use these. (Soon in Torvald's tree, else
> > in my "devel" branch.)
>
> I rebased it onto your devel, thanks for the hint.
>
> > > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > > +                                      unsigned int offset)
> > > +{
> > > +       struct da9062_pctl *pctl =3D gpiochip_get_data(gc);
> > > +       struct regmap *regmap =3D pctl->da9062->regmap;
> > > +       struct gpio_desc *desc =3D gpiochip_get_desc(gc, offset);
> > > +       unsigned int gpi_type;
> > > +       int ret;
> > > +
> > > +       ret =3D da9062_pctl_set_pin_mode(regmap, offset, DA9062_PIN_G=
PI);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       /*
> > > +        * If the gpio is active low we should set it in hw too. No w=
orries
> > > +        * about gpio_get() because we read and return the gpio-level=
. So the
> > > +        * gpiolib active_low handling is still correct.
> > > +        *
> > > +        * 0 - active low, 1 - active high
> > > +        */
> > > +       gpi_type =3D !gpiod_is_active_low(desc);
> >
> > That's interesting. Correct too, I guess.
>
> Double checked it again and the datasheet calls it gpio-level so I
> assume that this is correct.
>
> > > +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> > > +                                       unsigned int offset, int valu=
e)
> > > +{
> > > +       /* Push-Pull / Open-Drain options are configured during set_c=
onfig */
> > > +       da9062_gpio_set(gc, offset, value);
> >
> > That looks dangerous. There is no guarantee that .set_config()
> > always gets called.
>
> Hm.. it seems that other drivers using this assumption too:
>   - gpio-lp87565.c
>   - gpio-tps65218.c
>   - ...
>
> But you're right I missed the possible users of
> gpiod_direction_output_raw().
>
> > Please create a local state container for the mode of each pin in
> > struct da9062_pctl and set it to push-pull by default at probe, then
> > set this to whatever the state is here and let the .set_config()
> > alter it later if need be.
> >
> > If we don't do that you will get boot-time defaults I think and that
> > might create bugs.
>
> I will add a container for each pin, thanks for covering that.
>
> > > +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int=
 offset,
> > > +                                 unsigned long config)
> > > +{
> > (...)
> > > +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > +               return da9062_pctl_set_pin_mode(regmap, offset,
> > > +                                               DA9062_PIN_GPO_OD);
> > > +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > +               return da9062_pctl_set_pin_mode(regmap, offset,
> > > +                                               DA9062_PIN_GPO_PP);
> >
> > So also store this in the per-pin state.
>
> Of course.
>
> Regards,
>   Marco
>
> >
> > Yours,
> > Linus Walleij
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
