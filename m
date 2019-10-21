Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5B5DEFD1
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 16:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbfJUOhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 10:37:01 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37978 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729378AbfJUOg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 10:36:59 -0400
Received: by mail-oi1-f193.google.com with SMTP id d140so6911796oib.5
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F9M8Eq89OF/FPeByyM9BDWeTQ0wWGwKwWZ709udKuf4=;
        b=mmdqi+xUFgKK08dkzQsoc11aXrAJuhn0nF6L1prsVq03E8plmTthHHqsjfDcT3UyKZ
         0YxgqjJZ5nd5BTaz9XqohkJyFgxnAbBvuj+i70yYZpx/VnXGxHjfIdGkIpgPnPzRwL0o
         wLUinJIU+eF5XnMozmAjwfRYSHVQ+ETlZ1I6UtmzUEkY1MWYCORmvIHXtCrW234fu/z0
         YIXYW8/QsFcr2BLipcO83fjqzpQ2BQwzM97JNT177OjUxiHjTuNuGSlS/bbj6wzrf5sG
         2jGWbDfHObwTnS8Bfn3B9+M2YK5J2B5MDZwb+9j1Qs6ifa4T/Xn2ybverAUD59ozWMki
         B6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F9M8Eq89OF/FPeByyM9BDWeTQ0wWGwKwWZ709udKuf4=;
        b=NUBk+sySQfbK2qnpQY4DbVIXC+6l8Zn8otWSzGyitroqdiUzoEQvYD40RnRgOd5lEg
         WMhzfpPT1VF8IE6aH7G4CVNhD+RIXTvF7Q+/T8rk9IWW/8QmszYE69fepsmcXhm0A7BD
         C4iqSM4HWSmINcKuRP1hLSofQMiXoBjmdESmlsOQBqVjIAUK8+XZ7Nk7zcdPmRWotw7S
         UlZeuw7qd4VuaYk3qJdGEXcHlkkGMBXkeIZH/wKeN567kgigVOTqcbK++0Z8zOg//udB
         HdpIEYkvhaKwTpAOgR62T+5wuwRvQZlUEXjWUdLmKvSDp2ESZIvtFzIkGRuSGihoBVzP
         Z7TQ==
X-Gm-Message-State: APjAAAXUJ9sboyKZES4zHcvztWf0fSdjO0hUBZew2iO8qB4hTRkFzECr
        rGj26+8Fwtr7IePMJSsqCUAvwrFwtzxtwc6AVuA3Cw==
X-Google-Smtp-Source: APXvYqypD0zKNpAb9ujIPFwAQ6WrMDcQk5bMysdXYGPjK87PkHpwNn9wzZBFBkfPzsRtDemL+uytcUMGDrlHGrHfxHE=
X-Received: by 2002:a54:4e83:: with SMTP id c3mr19803161oiy.170.1571668618065;
 Mon, 21 Oct 2019 07:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <f8f8c323d378244afe4e94f48c0a94bb296cbbe0.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <CAMpxmJWXQccY8HsM6MXYBW8KC0U+7iOk+Ve-4nk=cpa=Zuk1cg@mail.gmail.com> <3ae3507649f2e9a66053a99b4a71e29786fc3d34.camel@fi.rohmeurope.com>
In-Reply-To: <3ae3507649f2e9a66053a99b4a71e29786fc3d34.camel@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 21 Oct 2019 16:36:47 +0200
Message-ID: <CAMpxmJVABg-UAzZtaQKu5ADBhi1P7CNArmstxHi5ZfdPiSKyYw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/13] gpio: bd71828: Initial support for ROHM BD71828
 PMIC GPIOs
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 21 pa=C5=BA 2019 o 09:00 Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> napisa=C5=82(a):
>
> Hello Bartosz,
>
> Thanks for reading this through! I'll rework this patch during this
> week :)
>
> On Thu, 2019-10-17 at 14:45 +0200, Bartosz Golaszewski wrote:
> > czw., 17 pa=C5=BA 2019 o 11:53 Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> napisa=C5=82(a):
> > > ROHM BD71828 PMIC contains 4 pins which can be configured by OTP
> > > to be used for general purposes. First 3 can be used as outputs
> > > and 4.th pin can be used as input. Allow them to be controlled
> > > via GPIO framework.
> > >
> > > The driver assumes all of the pins are configured as GPIOs and
> > > rusts that the reserved pins in other OTP configurations are
> > > excluded from control using "gpio-reserved-ranges" device tree
> > > property (or left untouched by GPIO users).
> > >
> > > Typical use for 4.th pin (input) is to use it as HALL sensor
> > > input so that this pin state is toggled when HALL sensor detects
> > > LID position change (from close to open or open to close). PMIC
> > > HW implements some extra logic which allows PMIC to power-up the
> > > system when this pin is toggled. Please see the data sheet for
> > > details of GPIO options which can be selcted by OTP settings.
> > >
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > >
> > > +++ b/drivers/gpio/gpio-bd71828.c
> > > @@ -0,0 +1,161 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (C) 2018 ROHM Semiconductors
> > > +// gpio-bd71828.c ROHM BD71828 gpio driver
> >
> > I don't think the name of the source file is needed here.
>
> I Agree.
>
> >
> > > +
> > > +#include <linux/gpio/driver.h>
> > > +#include <linux/mfd/rohm-bd71828.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#define OUT 0
> > > +#define IN 1
> >
> > If you really want to define those, please use a common prefix for
> > all
> > symbols in the driver.
>
> I prefer defining them because I always need to check the meaning of
> these values. My brains just refuse from remembering which value is
> used for in and which for out. I will add the prefix even though the
> scope of these defines is limited to this file :)
>
> >
> > > +#define GPIO_OUT_REG(off) (BD71828_REG_GPIO_CTRL1 + (off))
> > > +#define HALL_GPIO_OFFSET 3
> > > +
> > > +struct bd71828_gpio {
> > > +       struct rohm_regmap_dev chip;
> > > +       struct gpio_chip gpio;
> > > +};
> > > +
> > > +static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int
> > > offset,
> > > +                            int value)
> > > +{
> > > +       int ret;
> > > +       struct bd71828_gpio *bdgpio =3D gpiochip_get_data(chip);
> > > +       u8 val =3D (value) ? BD71828_GPIO_OUT_HI :
> > > BD71828_GPIO_OUT_LO;
> > > +
> > > +       if (offset =3D=3D HALL_GPIO_OFFSET)
> > > +               return;
> >
> > Can you add a comment here saying that this pin can only be used as
> > input? Otherwise this information is only available in the commit
> > message.
>
> Sure thing. I thought the comment in get_direction was sufficient but
> you are correct - it's nice to see this limitation also here.
>
> > > +
> > > +       ret =3D regmap_update_bits(bdgpio->chip.regmap,
> > > GPIO_OUT_REG(offset),
> > > +                                BD71828_GPIO_OUT_MASK, val);
> > > +       if (ret)
> > > +               dev_err(bdgpio->chip.dev, "Could not set gpio to
> > > %d\n", value);
> > > +}
> > > +
> > > +static int bd71828_gpio_get(struct gpio_chip *chip, unsigned int
> > > offset)
> > > +{
> > > +       int ret;
> > > +       unsigned int val;
> > > +       struct bd71828_gpio *bdgpio =3D gpiochip_get_data(chip);
> > > +
> > > +       if (offset =3D=3D HALL_GPIO_OFFSET)
> > > +               ret =3D regmap_read(bdgpio->chip.regmap,
> > > BD71828_REG_IO_STAT,
> > > +                                 &val);
> > > +       else
> > > +               ret =3D regmap_read(bdgpio->chip.regmap,
> > > GPIO_OUT_REG(offset),
> > > +                                 &val);
> > > +       if (!ret)
> > > +               ret =3D (val & BD71828_GPIO_OUT_MASK);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int bd71828_gpio_set_config(struct gpio_chip *chip,
> > > unsigned int offset,
> > > +                                  unsigned long config)
> > > +{
> > > +       struct bd71828_gpio *bdgpio =3D gpiochip_get_data(chip);
> > > +
> > > +       if (offset =3D=3D HALL_GPIO_OFFSET)
> > > +               return -ENOTSUPP;
> > > +
> > > +       switch (pinconf_to_config_param(config)) {
> > > +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > +               return regmap_update_bits(bdgpio->chip.regmap,
> > > +                                         GPIO_OUT_REG(offset),
> > > +                                         BD71828_GPIO_DRIVE_MASK,
> > > +                                         BD71828_GPIO_OPEN_DRAIN);
> > > +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > +               return regmap_update_bits(bdgpio->chip.regmap,
> > > +                                         GPIO_OUT_REG(offset),
> > > +                                         BD71828_GPIO_DRIVE_MASK,
> > > +                                         BD71828_GPIO_PUSH_PULL);
> > > +       default:
> > > +               break;
> > > +       }
> > > +       return -ENOTSUPP;
> > +}+static int bd71828_get_direction(struct gpio_chip *chip, unsigned
> > int offset)
> > > +{
> > > +       /*
> > > +        * Pin usage is selected by OTP data. We can't read it
> > > runtime. Hence
> > > +        * we trust that if the pin is not excluded by "gpio-
> > > reserved-ranges"
> > > +        * the OTP configuration is set to OUT. (Other pins but
> > > HALL input pin
> > > +        * on BD71828 can't really be used for general purpose
> > > input - input
> > > +        * states are used for specific cases like regulator
> > > control or
> > > +        * PMIC_ON_REQ.
> > > +        */
> > > +       if (offset =3D=3D HALL_GPIO_OFFSET)
> > > +               return IN;
> > > +
> > > +       return OUT;
> > > +}
> > > +
> > > +static int bd71828_gpio_parse_dt(struct device *dev,
> > > +                                struct bd71828_gpio *bdgpio)
> > > +{
> > > +       /*
> > > +        * TBD: See if we need some implementation to mark some
> > > PINs as
> > > +        * not controllable based on DT info or if core can handle
> > > +        * "gpio-reserved-ranges" and exclude them from control
> > > +        */
> > > +       return 0;
> > > +}
> >
> > Please don't implement empty functions. Just add this comment next to
> > gpiochip's initialization...
>
> Yep. I should have cleaned this before sending even this. Thanks for
> pointing it out!
>
> >
> >
> > > +
> > > +       bdgpio->chip.dev =3D &pdev->dev;
> > > +       bdgpio->gpio.parent =3D pdev->dev.parent;
> > > +       bdgpio->gpio.label =3D "bd71828-gpio";
> > > +       bdgpio->gpio.owner =3D THIS_MODULE;
> > > +       bdgpio->gpio.get_direction =3D bd71828_get_direction;
> > > +       bdgpio->gpio.set_config =3D bd71828_gpio_set_config;
> > > +       bdgpio->gpio.can_sleep =3D true;
> > > +       bdgpio->gpio.get =3D bd71828_gpio_get;
> > > +       bdgpio->gpio.set =3D bd71828_gpio_set;
> >
> > Not implementing direction_output() and direction_input() here will
> > results in warnings from the GPIO framework: for instance you
> > implement set() but not direction_output(). I'd say: just add those
> > callbacks and return an error if they're called for invalid lines
> > (for
> > instance: direction_output() being called for line 3).
>
> Ok. I will implement dummy functions.
>
> But out of the curiosity - why the GPIO core emits the warnings if
> these are not implemented? I think the core should not require "no-
> operation" functions to be implemented for pins which don't support
> both of the directions. GPIO core could only emit warning if it needs
> to set direction to something the HW does not support. That would avoid
> adding the dummy functions to all of the drivers, right?
>

I looked at the code again and it seems I was wrong. If we don't have
direction_input() or direction_output() we check the actual direction
with get_direction() before emitting any warnings and if there's no
direction_output(), but line is in input mode then all's fine. In
other words: false alarm, and you can keep it this way.

> >
> > > +       bdgpio->gpio.base =3D -1;
> > > +       bdgpio->gpio.ngpio =3D 4;
> > > +#ifdef CONFIG_OF_GPIO
> >
> > This is not needed - for CONFIG_OF_GPIO disabled the parent of_node
> > will be NULL.
>
> Right. Thanks.
>
> > > +       bdgpio->gpio.of_node =3D pdev->dev.parent->of_node;
> > > +#endif
> > > +       bdgpio->chip.regmap =3D bd71828->regmap;
> > > +
> > > +       ret =3D devm_gpiochip_add_data(&pdev->dev, &bdgpio->gpio,
> > > +                                    bdgpio);
> > > +       if (ret)
> > > +               dev_err(&pdev->dev, "gpio_init: Failed to add
> > > bd71828-gpio\n");
> >
> > Since there aren't many places where this function can fail, you can
> > directly return devm_gpiochip_add_data() here.
>
> Ok.
>
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static struct platform_driver bd71828_gpio =3D {
> > > +       .driver =3D {
> > > +               .name =3D "bd71828-gpio"
> > > +       },
> > > +       .probe =3D bd71828_probe,
> > > +};
> > > +
> > > +module_platform_driver(bd71828_gpio);
> > > +
> > > +MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ");
> > > +MODULE_DESCRIPTION("BD71828 voltage regulator driver");
> > > +MODULE_LICENSE("GPL");
> >
> > Don't you need a MODULE_ALIAS() here since this is an MFD sub-module?
>
> I must admit I don't know the details of how module loading is done. I
> used system where modules are load by scripts. (I guess the module
> alias could be used to allow automatic module loading [by udev?])
>
> Can you please educate me - If I add module aliases matching the sub-
> device name given in in MFD cell - should the sub module loading be
> automatic when MFD driver gets probed? For some reason I didn't get
> that working on my test bed. Or maybe I misunderstood something.
>

If the gpio module is a sub-node on the device tree than you may need
to use a sub-compatible to get the module loaded by udev.

Bart

> Eg, this should be enough for GPIO sub-module to be also load:
>
> MFD:
> static struct mfd_cell bd71828_mfd_cells[] =3D {
>         { .name =3D "bd71828-pmic", },
>         { .name =3D "bd71828-gpio", },
> ...
> ret =3D devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
>                            bd71828_mfd_cells,
>                            ARRAY_SIZE(bd71828_mfd_cells), NULL, 0,
>                            regmap_irq_get_domain(irq_data));
>
> GPIO driver:
> MODULE_ALIAS("platform:bd71828-gpio");
>
> I had the sub-devices probed even without the MODULE_ALIAS - but manual
> loading is required. I will gladly add the alias if it should enable
> the automatic module loading.
>
> Br,
>         Matti Vaittinen
>
