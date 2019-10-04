Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70608CB619
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 10:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbfJDIZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 04:25:44 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37270 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbfJDIZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 04:25:44 -0400
Received: by mail-io1-f67.google.com with SMTP id b19so11772764iob.4
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 01:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=atDm+LCrx0hEYjOBAu2xcXS/ZP5sMWf/FCk2t+yNutM=;
        b=iK2zCBQ1gaKzABp8jFgNs/h8fqZAEEexFPW8O5WaisRBtxBEGYZF0oPS+H2E80Ydfp
         aycRgQAC9T5s2Q1dYvL9dD2/NWAFYwt9qVRxiliN6jQxUj0qhPGdk7TobFU3bsKnq91m
         O8NUsgBzKnonIjcn+1hIB0aPl3LuOcwkcVp21dislONlZtK06xPfMDf6Q1DAs3NmyW6d
         373hxaod5qLzX43BzlM4MT9q1wYnxSkMKhU07fdbGaDZVAjYyl/gzDsGwDIeAiqAZMjy
         b5j2whhQVF/zX8/hCex8D2cSdozMcHLjaqSL5BUNJYyCeGnP9l26iuCZ4cSBd8DuLAen
         bizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=atDm+LCrx0hEYjOBAu2xcXS/ZP5sMWf/FCk2t+yNutM=;
        b=OlVAX3eZGPd4LKicXfrbSHE28HD+QTpRdqLXNEHExeEYWg8ICCdjdz9P0usBottZ9d
         0CiHci8TVg9WKuuENRjdHrV3N2HOXJ8ci8g2/mI4Lgde3fClXlkvgC+MDJfVd1GSLnxD
         Qnrse19UfAXv6o9VvEq5vMTjYublSlqeN7dNcPEdlw1d9ecIWNiDGbVssdpJupyte5OF
         4jytHAYYytsqO2L8kuip9b8iteJUOfh0wbQYdK9v/EEo0CTjXI4pX8vqgorfUPeALjeU
         JCWQpeB7GqmdopbLsHvptvAEAOVjkg++6hF3CKbKtWOJZWGwnCEhrKFgmmfz+VfbSQoJ
         mqrg==
X-Gm-Message-State: APjAAAWhIj72pnSh1+GqxGX268Y6pszT0KSaLbqRo9BR9ikcmW1az9O5
        hIsT3M0AWKu3l2EDfMmhuEL6qO/1ap+rF0FYzFcDww==
X-Google-Smtp-Source: APXvYqxYlh2IE8anVfb6BJ+ATuchV2MzjK0Ig8fg1yhbAjDb+oBhiMk2QXFj4gL5INlbotps15Ar26Ukt1KH2hK1GX0=
X-Received: by 2002:a6b:fc04:: with SMTP id r4mr1174705ioh.189.1570177542977;
 Fri, 04 Oct 2019 01:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190917105902.445-1-m.felsch@pengutronix.de> <20190917105902.445-4-m.felsch@pengutronix.de>
 <CAMpxmJUeasS3ogGVvy2jrE8ZdVtjWVjgJr1wcynfu8SzXQMmRA@mail.gmail.com>
 <20190918120613.mnehis6ydvbsqppb@pengutronix.de> <CAMpxmJX4wwfxGSCmNXQxYT54yofqhE26MDqVx+M=v7rOorKNYg@mail.gmail.com>
 <20190919083804.2oayi6wwwc25ztvj@pengutronix.de> <20190930184241.3qssbvmpy7z4o3it@pengutronix.de>
 <CAMpxmJV2P4j3FTkVbm-+bReVZ7EfzWsDXYvsFttOigPy=EAAnQ@mail.gmail.com>
In-Reply-To: <CAMpxmJV2P4j3FTkVbm-+bReVZ7EfzWsDXYvsFttOigPy=EAAnQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 4 Oct 2019 10:25:31 +0200
Message-ID: <CAMRc=MeE8HzykbnfM8noYpU7g5vbFLEyGtwP=SfAK87HtasE6A@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: da9062: add driver support
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Adam.Thomson.Opensource@diasemi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 3 pa=C5=BA 2019 o 10:12 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> pon., 30 wrz 2019 o 20:42 Marco Felsch <m.felsch@pengutronix.de> napisa=
=C5=82(a):
> >
> > Hi Bartosz,
> >
> > On 19-09-19 10:38, Marco Felsch wrote:
> > > On 19-09-19 10:24, Bartosz Golaszewski wrote:
> > > > =C5=9Br., 18 wrz 2019 o 14:06 Marco Felsch <m.felsch@pengutronix.de=
> napisa=C5=82(a):
> > > > >
> > > > > On 19-09-18 09:04, Bartosz Golaszewski wrote:
> > > > > > wt., 17 wrz 2019 o 12:59 Marco Felsch <m.felsch@pengutronix.de>=
 napisa=C5=82(a):
> > > > > > >
> > > > > > > The DA9062 is a mfd pmic device which supports 5 GPIOs. The G=
PIOs can
> > > > > > > be used as input, output or have a special use-case.
> > > > > > >
> > > > > > > The patch adds the support for the normal input/output use-ca=
se.
> > > > > > >
> > > > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > > > ---
> > > > > > >  drivers/gpio/Kconfig            |  11 ++
> > > > > > >  drivers/gpio/Makefile           |   1 +
> > > > > > >  drivers/gpio/gpio-da9062.c      | 265 ++++++++++++++++++++++=
++++++++++
> > > > > > >  include/linux/mfd/da9062/gpio.h |  13 ++
> > > > > > >  4 files changed, 290 insertions(+)
> > > > > > >  create mode 100644 drivers/gpio/gpio-da9062.c
> > > > > > >  create mode 100644 include/linux/mfd/da9062/gpio.h
> > > > > > >
> > > > > > > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > > > > > > index bb13c266c329..b308ea549aaa 100644
> > > > > > > --- a/drivers/gpio/Kconfig
> > > > > > > +++ b/drivers/gpio/Kconfig
> > > > > > > @@ -1038,6 +1038,17 @@ config GPIO_DA9055
> > > > > > >
> > > > > > >           If driver is built as a module it will be called gp=
io-da9055.
> > > > > > >
> > > > > > > +config GPIO_DA9062
> > > > > > > +       tristate "Dialog Semiconductor DA9062 GPIO"
> > > > > > > +       depends on MFD_DA9062
> > > > > > > +       help
> > > > > > > +         Say yes here to enable the GPIO driver for the DA90=
62 chip.
> > > > > > > +
> > > > > > > +         The Dialog DA9062 PMIC chip has 5 GPIO pins that ca=
n be
> > > > > > > +         be controller by this driver.
> > > > > > > +
> > > > > > > +         If driver is built as a module it will be called gp=
io-da9062.
> > > > > > > +
> > > > > > >  config GPIO_DLN2
> > > > > > >         tristate "Diolan DLN2 GPIO support"
> > > > > > >         depends on MFD_DLN2
> > > > > > > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > > > > > > index a4e91175c708..f29c8af2d096 100644
> > > > > > > --- a/drivers/gpio/Makefile
> > > > > > > +++ b/drivers/gpio/Makefile
> > > > > > > @@ -45,6 +45,7 @@ obj-$(CONFIG_GPIO_CRYSTAL_COVE)            =
   +=3D gpio-crystalcove.o
> > > > > > >  obj-$(CONFIG_GPIO_CS5535)              +=3D gpio-cs5535.o
> > > > > > >  obj-$(CONFIG_GPIO_DA9052)              +=3D gpio-da9052.o
> > > > > > >  obj-$(CONFIG_GPIO_DA9055)              +=3D gpio-da9055.o
> > > > > > > +obj-$(CONFIG_GPIO_DA9062)              +=3D gpio-da9062.o
> > > > > > >  obj-$(CONFIG_GPIO_DAVINCI)             +=3D gpio-davinci.o
> > > > > > >  obj-$(CONFIG_GPIO_DLN2)                        +=3D gpio-dln=
2.o
> > > > > > >  obj-$(CONFIG_GPIO_DWAPB)               +=3D gpio-dwapb.o
> > > > > > > diff --git a/drivers/gpio/gpio-da9062.c b/drivers/gpio/gpio-d=
a9062.c
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..6035963929a2
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/gpio/gpio-da9062.c
> > > > > > > @@ -0,0 +1,265 @@
> > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > +/*
> > > > > > > + * GPIO Driver for Dialog DA9062 PMICs.
> > > > > > > + * Based on DA9055 GPIO driver.
> > > > > > > + *
> > > > > > > + * Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@peng=
utronix.de>
> > > > > > > + */
> > > > > > > +#include <linux/module.h>
> > > > > > > +#include <linux/platform_device.h>
> > > > > > > +#include <linux/regmap.h>
> > > > > > > +
> > > > > > > +#include <linux/gpio/driver.h>
> > > > > > > +#include <linux/gpio/consumer.h>
> > > > > > > +
> > > > > > > +#include <linux/mfd/da9062/core.h>
> > > > > > > +#include <linux/mfd/da9062/registers.h>
> > > > > > > +
> > > > > > > +#include "gpiolib.h"
> > > > > > > +
> > > > > > > +#define DA9062_TYPE(offset)            (4 * (offset % 2))
> > > > > > > +#define DA9062_PIN_SHIFT(offset)       (4 * (offset % 2))
> > > > > > > +#define DA9062_PIN_ALTERNATE           0x00 /* gpio alternat=
e mode */
> > > > > > > +#define DA9062_PIN_GPI                 0x01 /* gpio in */
> > > > > > > +#define DA9062_PIN_GPO_OD              0x02 /* gpio out open=
-drain */
> > > > > > > +#define DA9062_PIN_GPO_PP              0x03 /* gpio out push=
-pull */
> > > > > > > +#define DA9062_GPIO_NUM                        5
> > > > > > > +
> > > > > > > +struct da9062_gpio {
> > > > > > > +       struct da9062 *da9062;
> > > > > > > +       struct gpio_chip gp;
> > > > > > > +};
> > > > > > > +
> > > > > > > +int da9062_gpio_get_hwgpio(struct gpio_desc *desc)
> > > > > > > +{
> > > > > > > +       return gpio_chip_hwgpio(desc);
> > > > > > > +}
> > > > > > > +EXPORT_SYMBOL_GPL(da9062_gpio_get_hwgpio);
> > > > > > > +
> > > > > >
> > > > > > Is this going to be used anywhere? I'm not really a fan of addi=
ng new
> > > > > > APIs without users.
> > > > >
> > > > > Yes, it is used here: https://lkml.org/lkml/2019/9/17/411
> > > > >
> > > > > I don't know if I should add the gpio here or as seperate patch w=
ithin
> > > > > the above series.
> > > > >
> > > > > > > +static int da9062_gpio_get_pin_mode(struct regmap *regmap, u=
nsigned int offset)
> > > > > > > +{
> > > > > > > +       int ret;
> > > > > > > +       int val;
> > > > > >
> > > > > > Nit: maybe put these two in a single line?
> > > > >
> > > > > Yes.
> > > > >
> > > > > > > +
> > > > > > > +       ret =3D regmap_read(regmap, DA9062AA_GPIO_0_1 + (offs=
et >> 1), &val);
> > > > > > > +       if (ret < 0)
> > > > > > > +               return ret;
> > > > > > > +
> > > > > > > +       val >>=3D DA9062_PIN_SHIFT(offset);
> > > > > > > +       val &=3D DA9062AA_GPIO0_PIN_MASK;
> > > > > > > +
> > > > > > > +       return val;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int da9062_gpio_set_pin_mode(struct regmap *regmap, u=
nsigned int offset,
> > > > > > > +                                   unsigned int mode)
> > > > > > > +{
> > > > > > > +       unsigned int mask;
> > > > > > > +
> > > > > > > +       mode &=3D DA9062AA_GPIO0_PIN_MASK;
> > > > > > > +       mode <<=3D DA9062_PIN_SHIFT(offset);
> > > > > > > +       mask =3D DA9062AA_GPIO0_PIN_MASK << DA9062_PIN_SHIFT(=
offset);
> > > > > > > +
> > > > > > > +       return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 +=
 (offset >> 1),
> > > > > > > +                                 mask, mode);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int da9062_gpio_get(struct gpio_chip *gc, unsigned in=
t offset)
> > > > > > > +{
> > > > > > > +       struct da9062_gpio *gpio =3D gpiochip_get_data(gc);
> > > > > > > +       struct regmap *regmap =3D gpio->da9062->regmap;
> > > > > > > +       int gpio_dir, val;
> > > > > > > +       int ret;
> > > > > > > +
> > > > > > > +       gpio_dir =3D da9062_gpio_get_pin_mode(regmap, offset)=
;
> > > > > > > +       if (gpio_dir < 0)
> > > > > > > +               return gpio_dir;
> > > > > > > +
> > > > > > > +       switch (gpio_dir) {
> > > > > > > +       case DA9062_PIN_ALTERNATE:
> > > > > > > +               return -ENOTSUPP;
> > > > > > > +       case DA9062_PIN_GPI:
> > > > > > > +               ret =3D regmap_read(regmap, DA9062AA_STATUS_B=
, &val);
> > > > > > > +               if (ret < 0)
> > > > > > > +                       return ret;
> > > > > > > +               break;
> > > > > > > +       case DA9062_PIN_GPO_OD:
> > > > > > > +               /* falltrough */
> > > > > > > +       case DA9062_PIN_GPO_PP:
> > > > > > > +               ret =3D regmap_read(regmap, DA9062AA_GPIO_MOD=
E0_4, &val);
> > > > > > > +               if (ret < 0)
> > > > > > > +                       return ret;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       return val & BIT(offset);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void da9062_gpio_set(struct gpio_chip *gc, unsigned i=
nt offset,
> > > > > > > +                           int value)
> > > > > > > +{
> > > > > > > +       struct da9062_gpio *gpio =3D gpiochip_get_data(gc);
> > > > > > > +       struct regmap *regmap =3D gpio->da9062->regmap;
> > > > > > > +
> > > > > > > +       regmap_update_bits(regmap, DA9062AA_GPIO_MODE0_4, BIT=
(offset),
> > > > > > > +                          value << offset);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int da9062_gpio_get_direction(struct gpio_chip *gc, u=
nsigned int offset)
> > > > > > > +{
> > > > > > > +       struct da9062_gpio *gpio =3D gpiochip_get_data(gc);
> > > > > > > +       struct regmap *regmap =3D gpio->da9062->regmap;
> > > > > > > +       int gpio_dir;
> > > > > > > +
> > > > > > > +       gpio_dir =3D da9062_gpio_get_pin_mode(regmap, offset)=
;
> > > > > > > +       if (gpio_dir < 0)
> > > > > > > +               return gpio_dir;
> > > > > > > +
> > > > > > > +       switch (gpio_dir) {
> > > > > > > +       case DA9062_PIN_ALTERNATE:
> > > > > > > +               return -ENOTSUPP;
> > > > > > > +       case DA9062_PIN_GPI:
> > > > > > > +               return 1;
> > > > > > > +       case DA9062_PIN_GPO_OD:
> > > > > > > +               /* falltrough */
> > > > > > > +       case DA9062_PIN_GPO_PP:
> > > > > > > +               return 0;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       return -EINVAL;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > > > > > > +                                      unsigned int offset)
> > > > > > > +{
> > > > > > > +       struct da9062_gpio *gpio =3D gpiochip_get_data(gc);
> > > > > > > +       struct regmap *regmap =3D gpio->da9062->regmap;
> > > > > > > +       struct gpio_desc *desc =3D gpiochip_get_desc(gc, offs=
et);
> > > > > > > +       unsigned int gpi_type;
> > > > > > > +       int ret;
> > > > > > > +
> > > > > > > +       ret =3D da9062_gpio_set_pin_mode(regmap, offset, DA90=
62_PIN_GPI);
> > > > > > > +       if (ret)
> > > > > > > +               return ret;
> > > > > > > +
> > > > > > > +       /*
> > > > > > > +        * If the gpio is active low we should set it in hw t=
oo. No worries
> > > > > > > +        * about gpio_get() because we read and return the gp=
io-level. So the
> > > > > > > +        * gpiolob active_low handling is still correct.
> > > > > > > +        *
> > > > > > > +        * 0 - active low, 1 - active high
> > > > > > > +        */
> > > > > > > +       gpi_type =3D !gpiod_is_active_low(desc);
> > > > > > > +       return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 +=
 (offset >> 1),
> > > > > > > +                               DA9062AA_GPIO0_TYPE_MASK << D=
A9062_TYPE(offset),
> > > > > > > +                               gpi_type << DA9062_TYPE(offse=
t));
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int da9062_gpio_direction_output(struct gpio_chip *gc=
,
> > > > > > > +                                       unsigned int offset, =
int value)
> > > > > > > +{
> > > > > > > +       /* Push-Pull / Open-Drain options are configured duri=
ng set_config */
> > > > > > > +       da9062_gpio_set(gc, offset, value);
> > > > > > > +
> > > > > > > +       return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int da9062_gpio_set_config(struct gpio_chip *gc, unsi=
gned int offset,
> > > > > > > +                                 unsigned long config)
> > > > > > > +{
> > > > > > > +       struct da9062_gpio *gpio =3D gpiochip_get_data(gc);
> > > > > > > +       struct regmap *regmap =3D gpio->da9062->regmap;
> > > > > > > +       int gpio_dir;
> > > > > > > +
> > > > > > > +       switch (pinconf_to_config_param(config)) {
> > > > > > > +       case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > > +               /* PD only if pin is input */
> > > > > > > +               gpio_dir =3D da9062_gpio_get_pin_mode(regmap,=
 offset);
> > > > > > > +               if (gpio_dir < 0)
> > > > > > > +                       return -EINVAL;
> > > > > > > +               else if (gpio_dir !=3D DA9062_PIN_GPI)
> > > > > > > +                       return -ENOTSUPP;
> > > > > > > +               return regmap_update_bits(regmap, DA9062AA_CO=
NFIG_K,
> > > > > > > +                                         BIT(offset), BIT(of=
fset));
> > > > > > > +       case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > > +               /* PU only if pin is output open-drain */
> > > > > > > +               gpio_dir =3D da9062_gpio_get_pin_mode(regmap,=
 offset);
> > > > > > > +               if (gpio_dir < 0)
> > > > > > > +                       return -EINVAL;
> > > > > > > +               else if (gpio_dir !=3D DA9062_PIN_GPO_OD)
> > > > > > > +                       return -ENOTSUPP;
> > > > > > > +               return regmap_update_bits(regmap, DA9062AA_CO=
NFIG_K,
> > > > > > > +                                         BIT(offset), BIT(of=
fset));
> > > > > > > +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > > > > > +               return da9062_gpio_set_pin_mode(regmap, offse=
t,
> > > > > > > +                                               DA9062_PIN_GP=
O_OD);
> > > > > > > +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > > > > > +               return da9062_gpio_set_pin_mode(regmap, offse=
t,
> > > > > > > +                                               DA9062_PIN_GP=
O_PP);
> > > > > > > +       default:
> > > > > > > +               return -ENOTSUPP;
> > > > > > > +       }
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int da9062_gpio_to_irq(struct gpio_chip *gc, unsigned=
 int offset)
> > > > > > > +{
> > > > > > > +       struct da9062_gpio *gpio =3D gpiochip_get_data(gc);
> > > > > > > +       struct da9062 *da9062 =3D gpio->da9062;
> > > > > > > +
> > > > > > > +       return regmap_irq_get_virq(da9062->regmap_irq,
> > > > > > > +                                  DA9062_IRQ_GPI0 + offset);
> > > > > > > +}
> > > > > > > +
> > > > > >
> > > > > > I'm afraid this won't fly anymore. We now have support for
> > > > > > hierarchical GPIO irqchips (take a look at
> > > > > > Documentation/driver-api/gpio/driver.rst) and Linus is quite st=
rict on
> > > > > > enforcing its usage. What I did with a very simple mfd device w=
ith
> > > > > > GPIOs (where using hierarchical irqchips was clearly overkill) =
was to
> > > > > > put the gpio-controller on the same DT node as the core mfd dev=
ice -
> > > > > > that way there's no need for a hierarchy.
> > > > >
> > > > > Okay, I've checked the documentation and the code. If I understoo=
d it
> > > > > right I should request each irq using platform_get_irq_byname() a=
s you
> > > > > did for the max77650?
> > > > >
> > > >
> > > > No, regmap irq domain is fine, as long as you modify the DT binding=
s
> > > > to not use a sub-node for the gpio-controller.
> > >
> > > Ah okay.. thanks for clearing that.
> >
> > While implementing your suggestion I found a possible bug within the
> > max77650-gpio driver:
> >
> > 8<-----------------------------------------------------
> >
> > diff --git a/drivers/gpio/gpio-max77650.c b/drivers/gpio/gpio-max77650.=
c
> > index 3f03f4e8956c..1c25c55e7818 100644
> > --- a/drivers/gpio/gpio-max77650.c
> > +++ b/drivers/gpio/gpio-max77650.c
> > @@ -174,6 +174,10 @@ static int max77650_gpio_probe(struct platform_dev=
ice *pdev)
> >         chip->gc.set_config =3D max77650_gpio_set_config;
> >         chip->gc.to_irq =3D max77650_gpio_to_irq;
> >
> > +#ifdef CONFIG_OF_GPIO
> > +       chip->gc.of_node =3D parent->of_node;
> > +#endif
> > +
> >         return devm_gpiochip_add_data(dev, &chip->gc, chip);
> >  }
>
> This does make sense (except that you don't need the ifdef guard), but
> the driver works, I have tested it on real HW. I'll take a look
> tomorrow, I don't have the board with me.
>

Ok, so I checked it and if the chip has a parent assigned, the gpiolib
core will take its of_node and assign it to gdev, so all looks fine to
me.

Bart

> Bart
>
> >
> > 8<-----------------------------------------------------
> >
> > If I understood it right the max77650-gpio won't work without this fix.
> >
> > Regards,
> >   Marco
> >
> > > Regards,
> > >   Marco
> > >
> > > > > Regards,
> > > > >   Marco
> > > > >
> > > > > > Bart
> > > > > >
> > > > > > > +static const struct gpio_chip reference_gp =3D {
> > > > > > > +       .label =3D "da9062-gpio",
> > > > > > > +       .owner =3D THIS_MODULE,
> > > > > > > +       .get =3D da9062_gpio_get,
> > > > > > > +       .set =3D da9062_gpio_set,
> > > > > > > +       .get_direction =3D da9062_gpio_get_direction,
> > > > > > > +       .direction_input =3D da9062_gpio_direction_input,
> > > > > > > +       .direction_output =3D da9062_gpio_direction_output,
> > > > > > > +       .set_config =3D da9062_gpio_set_config,
> > > > > > > +       .to_irq =3D da9062_gpio_to_irq,
> > > > > > > +       .can_sleep =3D true,
> > > > > > > +       .ngpio =3D DA9062_GPIO_NUM,
> > > > > > > +       .base =3D -1,
> > > > > > > +};
> > > > > > > +
> > > > > > > +static int da9062_gpio_probe(struct platform_device *pdev)
> > > > > > > +{
> > > > > > > +       struct da9062_gpio *gpio;
> > > > > > > +
> > > > > > > +       gpio =3D devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_=
KERNEL);
> > > > > > > +       if (!gpio)
> > > > > > > +               return -ENOMEM;
> > > > > > > +
> > > > > > > +       gpio->da9062 =3D dev_get_drvdata(pdev->dev.parent);
> > > > > > > +       if (!gpio->da9062)
> > > > > > > +               return -EINVAL;
> > > > > > > +
> > > > > > > +       gpio->gp =3D reference_gp;
> > > > > > > +       gpio->gp.parent =3D &pdev->dev;
> > > > > > > +
> > > > > > > +       platform_set_drvdata(pdev, gpio);
> > > > > > > +
> > > > > > > +       return devm_gpiochip_add_data(&pdev->dev, &gpio->gp, =
gpio);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static const struct of_device_id da9062_compatible_id_table[=
] =3D {
> > > > > > > +       { .compatible =3D "dlg,da9062-gpio" },
> > > > > > > +       { },
> > > > > > > +};
> > > > > > > +MODULE_DEVICE_TABLE(of, da9062_compatible_id_table);
> > > > > > > +
> > > > > > > +static struct platform_driver da9062_gpio_driver =3D {
> > > > > > > +       .probe =3D da9062_gpio_probe,
> > > > > > > +       .driver =3D {
> > > > > > > +               .name   =3D "da9062-gpio",
> > > > > > > +               .of_match_table =3D da9062_compatible_id_tabl=
e,
> > > > > > > +       },
> > > > > > > +};
> > > > > > > +module_platform_driver(da9062_gpio_driver);
> > > > > > > +
> > > > > > > +MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de>");
> > > > > > > +MODULE_DESCRIPTION("DA9062 GPIO Device Driver");
> > > > > > > +MODULE_LICENSE("GPL v2");
> > > > > > > +MODULE_ALIAS("platform:da9062-gpio");
> > > > > > > diff --git a/include/linux/mfd/da9062/gpio.h b/include/linux/=
mfd/da9062/gpio.h
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..67627ada1ad4
> > > > > > > --- /dev/null
> > > > > > > +++ b/include/linux/mfd/da9062/gpio.h
> > > > > > > @@ -0,0 +1,13 @@
> > > > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > > > +/*
> > > > > > > + * Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@peng=
utronix.de>
> > > > > > > + */
> > > > > > > +
> > > > > > > +#ifndef __MFD_DA9062_GPIO_H__
> > > > > > > +#define __MFD_DA9062_GPIO_H__
> > > > > > > +
> > > > > > > +struct gpio_desc;
> > > > > > > +
> > > > > > > +int da9062_gpio_get_hwgpio(struct gpio_desc *desc);
> > > > > > > +
> > > > > > > +#endif /* __MFD_DA9062_GPIO_H__ */
> > > > > > > --
> > > > > > > 2.20.1
> > > > > > >
> > > > > >
> > > > >
> > > > > --
> > > > > Pengutronix e.K.                           |                     =
        |
> > > > > Industrial Linux Solutions                 | http://www.pengutron=
ix.de/  |
> > > > > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-2069=
17-0    |
> > > > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-2069=
17-5555 |
> > > >
> > >
> > > --
> > > Pengutronix e.K.                           |                         =
    |
> > > Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
> > > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=
    |
> > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=
555 |
> > >
> > >
> >
> > --
> > Pengutronix e.K.                           |                           =
  |
> > Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
> > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
