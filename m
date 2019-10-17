Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACE11DAC9F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 14:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502529AbfJQMpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 08:45:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41839 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502501AbfJQMpT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 08:45:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id g13so1734801otp.8
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DHEsQ/t2mNEg5LKu5Mj2zpugAqBSCvuZbGbTIWytwV4=;
        b=Txkr59yRl2Ox0VxegifYZHbERme0c7yuNsQITmT/4CUgyG92fosJJqbC3gCRm1DZ1T
         z5Bb2AVaZKJjtP/OYMD4q0+3gF5/79mYluKOr6sIS3irApVeIVBue7FbK3a8+4mV8NAy
         MjSMrDn7yhLK24KDuIEPaIJEso96FkALB8UW7ppkWJh0cHB7QDaHU/PtOyabowOYmK/7
         Gwwj1kB8NmCpgqyh/dG1ih4FsRFeYigMmQP9UarSq1MSRzusn+xHmh7EJWVE5wR7qYYh
         ZOAGgvloA/ql9yI+9esoZMsHe2FGbDY0IcaieH2LrPc3AgH+pVC6BcvJni6hZfiJT4kT
         /uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DHEsQ/t2mNEg5LKu5Mj2zpugAqBSCvuZbGbTIWytwV4=;
        b=geBICBZDjlT3SVDk/q91uQ9jU6TLAJ7NBNQjKPftjE3gNCVtCO55TddfhV7IIZ9GKG
         nWBPQ26grB1Uye/RdWARxxyP9EtTm7pI/Z1XQReVVf8E+6QbXoJUFTk+2BG4jVlBmxgc
         1311D8VdTkFWhEq93UJ9LOtAJAOpGsoFfGlNoBvqNRYurGJzCIGrNRrH8zUvkVA4626G
         jJB7Si8VWfAHn1zj2HenoddN0tGLo06Z1X8hyAH8IGvrHJ24aT1bXXNHfkpyTCZmDZje
         2VaYZ4FVgAqpmpEPsO18A8HroaP873RmUKOx/267ebglA7GSrCjZBlkanVMQEEiWGYj/
         SNVA==
X-Gm-Message-State: APjAAAX54Y7ABz+oVlFiFYszoAN7jhd1HV//z5SokxyRzbzTl5r0ZHyt
        CWDLWCuRwj1ti9HPmM6X8aAp/2OoJFJ2BZW3haKDtA==
X-Google-Smtp-Source: APXvYqyb2vOvmSDj5KcHlFaG8FReaXiD1B0KpKO/tQhf5PzX4y7oRLevzVXTbOtrlOWA9AixmSejWJHz4apsrioz8Bk=
X-Received: by 2002:a9d:7d09:: with SMTP id v9mr2902297otn.292.1571316317767;
 Thu, 17 Oct 2019 05:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com> <f8f8c323d378244afe4e94f48c0a94bb296cbbe0.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <f8f8c323d378244afe4e94f48c0a94bb296cbbe0.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 17 Oct 2019 14:45:06 +0200
Message-ID: <CAMpxmJWXQccY8HsM6MXYBW8KC0U+7iOk+Ve-4nk=cpa=Zuk1cg@mail.gmail.com>
Subject: Re: [RFC PATCH 10/13] gpio: bd71828: Initial support for ROHM BD71828
 PMIC GPIOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 17 pa=C5=BA 2019 o 11:53 Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> napisa=C5=82(a):
>
> ROHM BD71828 PMIC contains 4 pins which can be configured by OTP
> to be used for general purposes. First 3 can be used as outputs
> and 4.th pin can be used as input. Allow them to be controlled
> via GPIO framework.
>
> The driver assumes all of the pins are configured as GPIOs and
> rusts that the reserved pins in other OTP configurations are
> excluded from control using "gpio-reserved-ranges" device tree
> property (or left untouched by GPIO users).
>
> Typical use for 4.th pin (input) is to use it as HALL sensor
> input so that this pin state is toggled when HALL sensor detects
> LID position change (from close to open or open to close). PMIC
> HW implements some extra logic which allows PMIC to power-up the
> system when this pin is toggled. Please see the data sheet for
> details of GPIO options which can be selcted by OTP settings.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/gpio/Kconfig        |  12 +++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-bd71828.c | 161 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 174 insertions(+)
>  create mode 100644 drivers/gpio/gpio-bd71828.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index bb13c266c329..fb0a099de961 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -986,6 +986,18 @@ config GPIO_BD70528
>           This driver can also be built as a module. If so, the module
>           will be called gpio-bd70528.
>
> +config GPIO_BD71828
> +       tristate "ROHM BD71828 GPIO support"
> +       depends on MFD_ROHM_BD71828
> +       help
> +         Support for GPIOs on ROHM BD71828 PMIC. There are three GPIOs
> +         available on the ROHM PMIC in total. The GPIOs are limited to
> +         outputs only and pins must be configured to GPIO outputs by
> +         OTP. Enable this only if you want to use these pins as outputs.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio-bd71828.
> +
>  config GPIO_BD9571MWV
>         tristate "ROHM BD9571 GPIO support"
>         depends on MFD_BD9571MWV
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index a4e91175c708..b11932844768 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_GPIO_ASPEED)             +=3D gpio-aspeed.=
o
>  obj-$(CONFIG_GPIO_ATH79)               +=3D gpio-ath79.o
>  obj-$(CONFIG_GPIO_BCM_KONA)            +=3D gpio-bcm-kona.o
>  obj-$(CONFIG_GPIO_BD70528)             +=3D gpio-bd70528.o
> +obj-$(CONFIG_GPIO_BD71828)             +=3D gpio-bd71828.o
>  obj-$(CONFIG_GPIO_BD9571MWV)           +=3D gpio-bd9571mwv.o
>  obj-$(CONFIG_GPIO_BRCMSTB)             +=3D gpio-brcmstb.o
>  obj-$(CONFIG_GPIO_BT8XX)               +=3D gpio-bt8xx.o
> diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-bd71828.c
> new file mode 100644
> index 000000000000..3cf3890a24c4
> --- /dev/null
> +++ b/drivers/gpio/gpio-bd71828.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2018 ROHM Semiconductors
> +// gpio-bd71828.c ROHM BD71828 gpio driver

I don't think the name of the source file is needed here.

> +
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/rohm-bd71828.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define OUT 0
> +#define IN 1

If you really want to define those, please use a common prefix for all
symbols in the driver.

> +#define GPIO_OUT_REG(off) (BD71828_REG_GPIO_CTRL1 + (off))
> +#define HALL_GPIO_OFFSET 3
> +
> +struct bd71828_gpio {
> +       struct rohm_regmap_dev chip;
> +       struct gpio_chip gpio;
> +};
> +
> +static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset=
,
> +                            int value)
> +{
> +       int ret;
> +       struct bd71828_gpio *bdgpio =3D gpiochip_get_data(chip);
> +       u8 val =3D (value) ? BD71828_GPIO_OUT_HI : BD71828_GPIO_OUT_LO;
> +
> +       if (offset =3D=3D HALL_GPIO_OFFSET)
> +               return;

Can you add a comment here saying that this pin can only be used as
input? Otherwise this information is only available in the commit
message.

> +
> +       ret =3D regmap_update_bits(bdgpio->chip.regmap, GPIO_OUT_REG(offs=
et),
> +                                BD71828_GPIO_OUT_MASK, val);
> +       if (ret)
> +               dev_err(bdgpio->chip.dev, "Could not set gpio to %d\n", v=
alue);
> +}
> +
> +static int bd71828_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       int ret;
> +       unsigned int val;
> +       struct bd71828_gpio *bdgpio =3D gpiochip_get_data(chip);
> +
> +       if (offset =3D=3D HALL_GPIO_OFFSET)
> +               ret =3D regmap_read(bdgpio->chip.regmap, BD71828_REG_IO_S=
TAT,
> +                                 &val);
> +       else
> +               ret =3D regmap_read(bdgpio->chip.regmap, GPIO_OUT_REG(off=
set),
> +                                 &val);
> +       if (!ret)
> +               ret =3D (val & BD71828_GPIO_OUT_MASK);
> +
> +       return ret;
> +}
> +
> +static int bd71828_gpio_set_config(struct gpio_chip *chip, unsigned int =
offset,
> +                                  unsigned long config)
> +{
> +       struct bd71828_gpio *bdgpio =3D gpiochip_get_data(chip);
> +
> +       if (offset =3D=3D HALL_GPIO_OFFSET)
> +               return -ENOTSUPP;
> +
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +               return regmap_update_bits(bdgpio->chip.regmap,
> +                                         GPIO_OUT_REG(offset),
> +                                         BD71828_GPIO_DRIVE_MASK,
> +                                         BD71828_GPIO_OPEN_DRAIN);
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +               return regmap_update_bits(bdgpio->chip.regmap,
> +                                         GPIO_OUT_REG(offset),
> +                                         BD71828_GPIO_DRIVE_MASK,
> +                                         BD71828_GPIO_PUSH_PULL);
> +       default:
> +               break;
> +       }
> +       return -ENOTSUPP;
> +}
> +
> +static int bd71828_get_direction(struct gpio_chip *chip, unsigned int of=
fset)
> +{
> +       /*
> +        * Pin usage is selected by OTP data. We can't read it runtime. H=
ence
> +        * we trust that if the pin is not excluded by "gpio-reserved-ran=
ges"
> +        * the OTP configuration is set to OUT. (Other pins but HALL inpu=
t pin
> +        * on BD71828 can't really be used for general purpose input - in=
put
> +        * states are used for specific cases like regulator control or
> +        * PMIC_ON_REQ.
> +        */
> +       if (offset =3D=3D HALL_GPIO_OFFSET)
> +               return IN;
> +
> +       return OUT;
> +}
> +
> +static int bd71828_gpio_parse_dt(struct device *dev,
> +                                struct bd71828_gpio *bdgpio)
> +{
> +       /*
> +        * TBD: See if we need some implementation to mark some PINs as
> +        * not controllable based on DT info or if core can handle
> +        * "gpio-reserved-ranges" and exclude them from control
> +        */
> +       return 0;
> +}

Please don't implement empty functions. Just add this comment next to
gpiochip's initialization...

> +
> +static int bd71828_probe(struct platform_device *pdev)
> +{
> +       struct bd71828_gpio *bdgpio;
> +       struct rohm_regmap_dev *bd71828;
> +       int ret;
> +
> +       bd71828 =3D dev_get_drvdata(pdev->dev.parent);
> +       if (!bd71828) {
> +               dev_err(&pdev->dev, "No MFD driver data\n");
> +               return -EINVAL;
> +       }
> +
> +       bdgpio =3D devm_kzalloc(&pdev->dev, sizeof(*bdgpio),
> +                             GFP_KERNEL);
> +       if (!bdgpio)
> +               return -ENOMEM;
> +
> +       ret =3D bd71828_gpio_parse_dt(pdev->dev.parent, bdgpio);

... and remove this call.

> +
> +       bdgpio->chip.dev =3D &pdev->dev;
> +       bdgpio->gpio.parent =3D pdev->dev.parent;
> +       bdgpio->gpio.label =3D "bd71828-gpio";
> +       bdgpio->gpio.owner =3D THIS_MODULE;
> +       bdgpio->gpio.get_direction =3D bd71828_get_direction;
> +       bdgpio->gpio.set_config =3D bd71828_gpio_set_config;
> +       bdgpio->gpio.can_sleep =3D true;
> +       bdgpio->gpio.get =3D bd71828_gpio_get;
> +       bdgpio->gpio.set =3D bd71828_gpio_set;

Not implementing direction_output() and direction_input() here will
results in warnings from the GPIO framework: for instance you
implement set() but not direction_output(). I'd say: just add those
callbacks and return an error if they're called for invalid lines (for
instance: direction_output() being called for line 3).

> +       bdgpio->gpio.base =3D -1;
> +       bdgpio->gpio.ngpio =3D 4;
> +#ifdef CONFIG_OF_GPIO

This is not needed - for CONFIG_OF_GPIO disabled the parent of_node
will be NULL.

> +       bdgpio->gpio.of_node =3D pdev->dev.parent->of_node;
> +#endif
> +       bdgpio->chip.regmap =3D bd71828->regmap;
> +
> +       ret =3D devm_gpiochip_add_data(&pdev->dev, &bdgpio->gpio,
> +                                    bdgpio);
> +       if (ret)
> +               dev_err(&pdev->dev, "gpio_init: Failed to add bd71828-gpi=
o\n");

Since there aren't many places where this function can fail, you can
directly return devm_gpiochip_add_data() here.

> +
> +       return ret;
> +}
> +
> +static struct platform_driver bd71828_gpio =3D {
> +       .driver =3D {
> +               .name =3D "bd71828-gpio"
> +       },
> +       .probe =3D bd71828_probe,
> +};
> +
> +module_platform_driver(bd71828_gpio);
> +
> +MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
> +MODULE_DESCRIPTION("BD71828 voltage regulator driver");
> +MODULE_LICENSE("GPL");

Don't you need a MODULE_ALIAS() here since this is an MFD sub-module?

Bart

> --
> 2.21.0
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =3D]
