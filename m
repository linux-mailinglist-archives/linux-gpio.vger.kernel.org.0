Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E237100129
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 10:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfKRJW7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 04:22:59 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36328 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbfKRJW7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 04:22:59 -0500
Received: by mail-ot1-f68.google.com with SMTP id f10so13899008oto.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pFR3llPqLc9xR1rrhErYhQ9Np0pKks1TZnUYHHrrRUA=;
        b=xkAD0lAA56gY4bQ9ijcGMcEwSp2xt3Cl4rQTLy1jbTkDKHLd06l1Vf+9asPzk9f5y9
         qhYeCfoGuAy/zCGuCkfoQzT4HcIrC2VuP9yL2rbPP7vp/G2/VuqrqbMBkty0d+dUPvGL
         Of6gq7BsBPGf2L3B/79FWDnyPUKxX9QYoTcnO/ZmaYPMw4wcparF/NRZaaxDsc50vJ2p
         FEfsm/xveCH6I8a669jHCzNtCTz4+mQVnP2lNoDbCJcvn75sHcnUW1KtaVw2cbVMEjvj
         +or6nEgar+TUUTj41/Fv5fw4+bQmG5pYK3R3gBMzYvNx8M1sbfDaEfos4Coeo4ps1jcc
         lqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pFR3llPqLc9xR1rrhErYhQ9Np0pKks1TZnUYHHrrRUA=;
        b=qjSRtwIyAKTNL09SGw7dRMs1ptMW1rpUAiQhoorK4L/zTKxWuHdjMS/oeirWil3ig6
         5VLui2pwZZr4RIRNDu1nWyImS9K+0LiJg2AFhHPZa+8nILz7nnDujHzJiijxGuZjUxGx
         KhhJY+6CQStitLZvRvQqFaf9gJSn3fNNHsr22RDXiiXFJ86QCMUffhSm5Ime9CwtYd1V
         HGccDbISpW06ay3xbtsHPQ5VueJDpnVk2yC3X0vSbhbQZ2adlPyhSmjuHFt4gPlhAyCx
         GS9DPyZlJZqw9b85gSXf7khYvgqqZ0Bj2aJAoKUjRLOW6tXyM7YtJfZviQYwQpa4Sj8Z
         gS9w==
X-Gm-Message-State: APjAAAUZr1qQusZ8xcp6jBS9vdhzuYcvqObkZhh/GxS77m0QVxLnF7m0
        ljaJswA5unuekftThGo5peSbIeFOuihJ/1XqSfH69Q==
X-Google-Smtp-Source: APXvYqyRoHKVrD1n4Cgd2I6KuFKGN+l5TEEMBuB1e1/s+Se/6WFkJqKeypIw9NLQvd2TOZfc864qCstM5dnQvWHwiLE=
X-Received: by 2002:a9d:68d4:: with SMTP id i20mr9552898oto.194.1574068977604;
 Mon, 18 Nov 2019 01:22:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com> <41bf40586bb8f725dc8401696856ecd4a75df748.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <41bf40586bb8f725dc8401696856ecd4a75df748.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 18 Nov 2019 10:22:46 +0100
Message-ID: <CAMpxmJVfEXddxFMjtTQN4uHEdvvZY98eVABq+sQZ-ww-OUokCw@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] gpio: bd71828: Initial support for ROHM BD71828
 PMIC GPIOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 18 lis 2019 o 08:01 Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> napisa=C5=82(a):
>
> ROHM BD71828 PMIC contains 4 pins which can be configured by OTP
> to be used for general purposes. First 3 can be used as outputs
> and 4.th pin can be used as input. Allow them to be controlled
> via GPIO framework.
>
> The driver assumes all of the pins are configured as GPIOs and
> trusts that the reserved pins in other OTP configurations are
> excluded from control using "gpio-reserved-ranges" device tree
> property (or left untouched by GPIO users).
>
> Typical use for 4.th pin (input) is to use it as HALL sensor
> input so that this pin state is toggled when HALL sensor detects
> LID position change (from close to open or open to close). PMIC
> HW implements some extra logic which allows PMIC to power-up the
> system when this pin is toggled. Please see the data sheet for
> details of GPIO options which can be selected by OTP settings.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>
> No changes from v4
>
>  drivers/gpio/Kconfig        |  12 +++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-bd71828.c | 159 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 172 insertions(+)
>  create mode 100644 drivers/gpio/gpio-bd71828.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 38e096e6925f..b4089096f7f2 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -994,6 +994,18 @@ config GPIO_BD70528
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
> index d2fd19c15bae..034b38996579 100644
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
> index 000000000000..04aade9e0a4d
> --- /dev/null
> +++ b/drivers/gpio/gpio-bd71828.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (C) 2018 ROHM Semiconductors
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/rohm-bd71828.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define GPIO_OUT_REG(off) (BD71828_REG_GPIO_CTRL1 + (off))
> +#define HALL_GPIO_OFFSET 3
> +
> +/*
> + * These defines can be removed when
> + * "gpio: Add definition for GPIO direction"
> + * (9208b1e77d6e8e9776f34f46ef4079ecac9c3c25 in GPIO tree) gets merged,
> + */
> +#ifndef GPIO_LINE_DIRECTION_IN
> +       #define GPIO_LINE_DIRECTION_IN 1
> +       #define GPIO_LINE_DIRECTION_OUT 0
> +#endif
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
> +       /*
> +        * The HALL input pin can only be used as input. If this is the p=
in
> +        * we are dealing with - then we are done
> +        */
> +       if (offset =3D=3D HALL_GPIO_OFFSET)
> +               return;
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
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int bd71828_probe(struct platform_device *pdev)
> +{
> +       struct bd71828_gpio *bdgpio;
> +       struct rohm_regmap_dev *bd71828;
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
> +       bdgpio->chip.dev =3D &pdev->dev;
> +       bdgpio->gpio.parent =3D pdev->dev.parent;
> +       bdgpio->gpio.label =3D "bd71828-gpio";
> +       bdgpio->gpio.owner =3D THIS_MODULE;
> +       bdgpio->gpio.get_direction =3D bd71828_get_direction;
> +       bdgpio->gpio.set_config =3D bd71828_gpio_set_config;
> +       bdgpio->gpio.can_sleep =3D true;
> +       bdgpio->gpio.get =3D bd71828_gpio_get;
> +       bdgpio->gpio.set =3D bd71828_gpio_set;
> +       bdgpio->gpio.base =3D -1;
> +
> +       /*
> +        * See if we need some implementation to mark some PINs as
> +        * not controllable based on DT info or if core can handle
> +        * "gpio-reserved-ranges" and exclude them from control
> +        */
> +       bdgpio->gpio.ngpio =3D 4;
> +       bdgpio->gpio.of_node =3D pdev->dev.parent->of_node;
> +       bdgpio->chip.regmap =3D bd71828->regmap;
> +
> +       return devm_gpiochip_add_data(&pdev->dev, &bdgpio->gpio,
> +                                    bdgpio);
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
> +MODULE_ALIAS("platform:bd71828-gpio");
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

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
