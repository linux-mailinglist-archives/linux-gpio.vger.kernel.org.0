Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304FCC2776
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2019 22:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730183AbfI3U5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 16:57:15 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41881 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729983AbfI3U5P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 16:57:15 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iF0d8-0005jO-FP; Mon, 30 Sep 2019 20:42:42 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iF0d7-0006hm-NL; Mon, 30 Sep 2019 20:42:41 +0200
Date:   Mon, 30 Sep 2019 20:42:41 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-devicetree <devicetree@vger.kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        Adam.Thomson.Opensource@diasemi.com
Subject: Re: [PATCH 3/3] gpio: da9062: add driver support
Message-ID: <20190930184241.3qssbvmpy7z4o3it@pengutronix.de>
References: <20190917105902.445-1-m.felsch@pengutronix.de>
 <20190917105902.445-4-m.felsch@pengutronix.de>
 <CAMpxmJUeasS3ogGVvy2jrE8ZdVtjWVjgJr1wcynfu8SzXQMmRA@mail.gmail.com>
 <20190918120613.mnehis6ydvbsqppb@pengutronix.de>
 <CAMpxmJX4wwfxGSCmNXQxYT54yofqhE26MDqVx+M=v7rOorKNYg@mail.gmail.com>
 <20190919083804.2oayi6wwwc25ztvj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190919083804.2oayi6wwwc25ztvj@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 20:22:38 up 136 days, 40 min, 88 users,  load average: 0.23, 0.09,
 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On 19-09-19 10:38, Marco Felsch wrote:
> On 19-09-19 10:24, Bartosz Golaszewski wrote:
> > śr., 18 wrz 2019 o 14:06 Marco Felsch <m.felsch@pengutronix.de> napisał(a):
> > >
> > > On 19-09-18 09:04, Bartosz Golaszewski wrote:
> > > > wt., 17 wrz 2019 o 12:59 Marco Felsch <m.felsch@pengutronix.de> napisał(a):
> > > > >
> > > > > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> > > > > be used as input, output or have a special use-case.
> > > > >
> > > > > The patch adds the support for the normal input/output use-case.
> > > > >
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  drivers/gpio/Kconfig            |  11 ++
> > > > >  drivers/gpio/Makefile           |   1 +
> > > > >  drivers/gpio/gpio-da9062.c      | 265 ++++++++++++++++++++++++++++++++
> > > > >  include/linux/mfd/da9062/gpio.h |  13 ++
> > > > >  4 files changed, 290 insertions(+)
> > > > >  create mode 100644 drivers/gpio/gpio-da9062.c
> > > > >  create mode 100644 include/linux/mfd/da9062/gpio.h
> > > > >
> > > > > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > > > > index bb13c266c329..b308ea549aaa 100644
> > > > > --- a/drivers/gpio/Kconfig
> > > > > +++ b/drivers/gpio/Kconfig
> > > > > @@ -1038,6 +1038,17 @@ config GPIO_DA9055
> > > > >
> > > > >           If driver is built as a module it will be called gpio-da9055.
> > > > >
> > > > > +config GPIO_DA9062
> > > > > +       tristate "Dialog Semiconductor DA9062 GPIO"
> > > > > +       depends on MFD_DA9062
> > > > > +       help
> > > > > +         Say yes here to enable the GPIO driver for the DA9062 chip.
> > > > > +
> > > > > +         The Dialog DA9062 PMIC chip has 5 GPIO pins that can be
> > > > > +         be controller by this driver.
> > > > > +
> > > > > +         If driver is built as a module it will be called gpio-da9062.
> > > > > +
> > > > >  config GPIO_DLN2
> > > > >         tristate "Diolan DLN2 GPIO support"
> > > > >         depends on MFD_DLN2
> > > > > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > > > > index a4e91175c708..f29c8af2d096 100644
> > > > > --- a/drivers/gpio/Makefile
> > > > > +++ b/drivers/gpio/Makefile
> > > > > @@ -45,6 +45,7 @@ obj-$(CONFIG_GPIO_CRYSTAL_COVE)               += gpio-crystalcove.o
> > > > >  obj-$(CONFIG_GPIO_CS5535)              += gpio-cs5535.o
> > > > >  obj-$(CONFIG_GPIO_DA9052)              += gpio-da9052.o
> > > > >  obj-$(CONFIG_GPIO_DA9055)              += gpio-da9055.o
> > > > > +obj-$(CONFIG_GPIO_DA9062)              += gpio-da9062.o
> > > > >  obj-$(CONFIG_GPIO_DAVINCI)             += gpio-davinci.o
> > > > >  obj-$(CONFIG_GPIO_DLN2)                        += gpio-dln2.o
> > > > >  obj-$(CONFIG_GPIO_DWAPB)               += gpio-dwapb.o
> > > > > diff --git a/drivers/gpio/gpio-da9062.c b/drivers/gpio/gpio-da9062.c
> > > > > new file mode 100644
> > > > > index 000000000000..6035963929a2
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpio/gpio-da9062.c
> > > > > @@ -0,0 +1,265 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * GPIO Driver for Dialog DA9062 PMICs.
> > > > > + * Based on DA9055 GPIO driver.
> > > > > + *
> > > > > + * Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > > > > + */
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +#include <linux/regmap.h>
> > > > > +
> > > > > +#include <linux/gpio/driver.h>
> > > > > +#include <linux/gpio/consumer.h>
> > > > > +
> > > > > +#include <linux/mfd/da9062/core.h>
> > > > > +#include <linux/mfd/da9062/registers.h>
> > > > > +
> > > > > +#include "gpiolib.h"
> > > > > +
> > > > > +#define DA9062_TYPE(offset)            (4 * (offset % 2))
> > > > > +#define DA9062_PIN_SHIFT(offset)       (4 * (offset % 2))
> > > > > +#define DA9062_PIN_ALTERNATE           0x00 /* gpio alternate mode */
> > > > > +#define DA9062_PIN_GPI                 0x01 /* gpio in */
> > > > > +#define DA9062_PIN_GPO_OD              0x02 /* gpio out open-drain */
> > > > > +#define DA9062_PIN_GPO_PP              0x03 /* gpio out push-pull */
> > > > > +#define DA9062_GPIO_NUM                        5
> > > > > +
> > > > > +struct da9062_gpio {
> > > > > +       struct da9062 *da9062;
> > > > > +       struct gpio_chip gp;
> > > > > +};
> > > > > +
> > > > > +int da9062_gpio_get_hwgpio(struct gpio_desc *desc)
> > > > > +{
> > > > > +       return gpio_chip_hwgpio(desc);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(da9062_gpio_get_hwgpio);
> > > > > +
> > > >
> > > > Is this going to be used anywhere? I'm not really a fan of adding new
> > > > APIs without users.
> > >
> > > Yes, it is used here: https://lkml.org/lkml/2019/9/17/411
> > >
> > > I don't know if I should add the gpio here or as seperate patch within
> > > the above series.
> > >
> > > > > +static int da9062_gpio_get_pin_mode(struct regmap *regmap, unsigned int offset)
> > > > > +{
> > > > > +       int ret;
> > > > > +       int val;
> > > >
> > > > Nit: maybe put these two in a single line?
> > >
> > > Yes.
> > >
> > > > > +
> > > > > +       ret = regmap_read(regmap, DA9062AA_GPIO_0_1 + (offset >> 1), &val);
> > > > > +       if (ret < 0)
> > > > > +               return ret;
> > > > > +
> > > > > +       val >>= DA9062_PIN_SHIFT(offset);
> > > > > +       val &= DA9062AA_GPIO0_PIN_MASK;
> > > > > +
> > > > > +       return val;
> > > > > +}
> > > > > +
> > > > > +static int da9062_gpio_set_pin_mode(struct regmap *regmap, unsigned int offset,
> > > > > +                                   unsigned int mode)
> > > > > +{
> > > > > +       unsigned int mask;
> > > > > +
> > > > > +       mode &= DA9062AA_GPIO0_PIN_MASK;
> > > > > +       mode <<= DA9062_PIN_SHIFT(offset);
> > > > > +       mask = DA9062AA_GPIO0_PIN_MASK << DA9062_PIN_SHIFT(offset);
> > > > > +
> > > > > +       return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >> 1),
> > > > > +                                 mask, mode);
> > > > > +}
> > > > > +
> > > > > +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
> > > > > +{
> > > > > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > > > > +       struct regmap *regmap = gpio->da9062->regmap;
> > > > > +       int gpio_dir, val;
> > > > > +       int ret;
> > > > > +
> > > > > +       gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> > > > > +       if (gpio_dir < 0)
> > > > > +               return gpio_dir;
> > > > > +
> > > > > +       switch (gpio_dir) {
> > > > > +       case DA9062_PIN_ALTERNATE:
> > > > > +               return -ENOTSUPP;
> > > > > +       case DA9062_PIN_GPI:
> > > > > +               ret = regmap_read(regmap, DA9062AA_STATUS_B, &val);
> > > > > +               if (ret < 0)
> > > > > +                       return ret;
> > > > > +               break;
> > > > > +       case DA9062_PIN_GPO_OD:
> > > > > +               /* falltrough */
> > > > > +       case DA9062_PIN_GPO_PP:
> > > > > +               ret = regmap_read(regmap, DA9062AA_GPIO_MODE0_4, &val);
> > > > > +               if (ret < 0)
> > > > > +                       return ret;
> > > > > +       }
> > > > > +
> > > > > +       return val & BIT(offset);
> > > > > +}
> > > > > +
> > > > > +static void da9062_gpio_set(struct gpio_chip *gc, unsigned int offset,
> > > > > +                           int value)
> > > > > +{
> > > > > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > > > > +       struct regmap *regmap = gpio->da9062->regmap;
> > > > > +
> > > > > +       regmap_update_bits(regmap, DA9062AA_GPIO_MODE0_4, BIT(offset),
> > > > > +                          value << offset);
> > > > > +}
> > > > > +
> > > > > +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> > > > > +{
> > > > > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > > > > +       struct regmap *regmap = gpio->da9062->regmap;
> > > > > +       int gpio_dir;
> > > > > +
> > > > > +       gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> > > > > +       if (gpio_dir < 0)
> > > > > +               return gpio_dir;
> > > > > +
> > > > > +       switch (gpio_dir) {
> > > > > +       case DA9062_PIN_ALTERNATE:
> > > > > +               return -ENOTSUPP;
> > > > > +       case DA9062_PIN_GPI:
> > > > > +               return 1;
> > > > > +       case DA9062_PIN_GPO_OD:
> > > > > +               /* falltrough */
> > > > > +       case DA9062_PIN_GPO_PP:
> > > > > +               return 0;
> > > > > +       }
> > > > > +
> > > > > +       return -EINVAL;
> > > > > +}
> > > > > +
> > > > > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > > > > +                                      unsigned int offset)
> > > > > +{
> > > > > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > > > > +       struct regmap *regmap = gpio->da9062->regmap;
> > > > > +       struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
> > > > > +       unsigned int gpi_type;
> > > > > +       int ret;
> > > > > +
> > > > > +       ret = da9062_gpio_set_pin_mode(regmap, offset, DA9062_PIN_GPI);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       /*
> > > > > +        * If the gpio is active low we should set it in hw too. No worries
> > > > > +        * about gpio_get() because we read and return the gpio-level. So the
> > > > > +        * gpiolob active_low handling is still correct.
> > > > > +        *
> > > > > +        * 0 - active low, 1 - active high
> > > > > +        */
> > > > > +       gpi_type = !gpiod_is_active_low(desc);
> > > > > +       return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >> 1),
> > > > > +                               DA9062AA_GPIO0_TYPE_MASK << DA9062_TYPE(offset),
> > > > > +                               gpi_type << DA9062_TYPE(offset));
> > > > > +}
> > > > > +
> > > > > +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> > > > > +                                       unsigned int offset, int value)
> > > > > +{
> > > > > +       /* Push-Pull / Open-Drain options are configured during set_config */
> > > > > +       da9062_gpio_set(gc, offset, value);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> > > > > +                                 unsigned long config)
> > > > > +{
> > > > > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > > > > +       struct regmap *regmap = gpio->da9062->regmap;
> > > > > +       int gpio_dir;
> > > > > +
> > > > > +       switch (pinconf_to_config_param(config)) {
> > > > > +       case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > +               /* PD only if pin is input */
> > > > > +               gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> > > > > +               if (gpio_dir < 0)
> > > > > +                       return -EINVAL;
> > > > > +               else if (gpio_dir != DA9062_PIN_GPI)
> > > > > +                       return -ENOTSUPP;
> > > > > +               return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > > > > +                                         BIT(offset), BIT(offset));
> > > > > +       case PIN_CONFIG_BIAS_PULL_UP:
> > > > > +               /* PU only if pin is output open-drain */
> > > > > +               gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> > > > > +               if (gpio_dir < 0)
> > > > > +                       return -EINVAL;
> > > > > +               else if (gpio_dir != DA9062_PIN_GPO_OD)
> > > > > +                       return -ENOTSUPP;
> > > > > +               return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > > > > +                                         BIT(offset), BIT(offset));
> > > > > +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > > > +               return da9062_gpio_set_pin_mode(regmap, offset,
> > > > > +                                               DA9062_PIN_GPO_OD);
> > > > > +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > > > +               return da9062_gpio_set_pin_mode(regmap, offset,
> > > > > +                                               DA9062_PIN_GPO_PP);
> > > > > +       default:
> > > > > +               return -ENOTSUPP;
> > > > > +       }
> > > > > +}
> > > > > +
> > > > > +static int da9062_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
> > > > > +{
> > > > > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > > > > +       struct da9062 *da9062 = gpio->da9062;
> > > > > +
> > > > > +       return regmap_irq_get_virq(da9062->regmap_irq,
> > > > > +                                  DA9062_IRQ_GPI0 + offset);
> > > > > +}
> > > > > +
> > > >
> > > > I'm afraid this won't fly anymore. We now have support for
> > > > hierarchical GPIO irqchips (take a look at
> > > > Documentation/driver-api/gpio/driver.rst) and Linus is quite strict on
> > > > enforcing its usage. What I did with a very simple mfd device with
> > > > GPIOs (where using hierarchical irqchips was clearly overkill) was to
> > > > put the gpio-controller on the same DT node as the core mfd device -
> > > > that way there's no need for a hierarchy.
> > >
> > > Okay, I've checked the documentation and the code. If I understood it
> > > right I should request each irq using platform_get_irq_byname() as you
> > > did for the max77650?
> > >
> > 
> > No, regmap irq domain is fine, as long as you modify the DT bindings
> > to not use a sub-node for the gpio-controller.
> 
> Ah okay.. thanks for clearing that.

While implementing your suggestion I found a possible bug within the
max77650-gpio driver:

8<-----------------------------------------------------

diff --git a/drivers/gpio/gpio-max77650.c b/drivers/gpio/gpio-max77650.c
index 3f03f4e8956c..1c25c55e7818 100644
--- a/drivers/gpio/gpio-max77650.c
+++ b/drivers/gpio/gpio-max77650.c
@@ -174,6 +174,10 @@ static int max77650_gpio_probe(struct platform_device *pdev)
 	chip->gc.set_config = max77650_gpio_set_config;
 	chip->gc.to_irq = max77650_gpio_to_irq;
 
+#ifdef CONFIG_OF_GPIO
+	chip->gc.of_node = parent->of_node;
+#endif
+
 	return devm_gpiochip_add_data(dev, &chip->gc, chip);
 }

8<-----------------------------------------------------

If I understood it right the max77650-gpio won't work without this fix.

Regards,
  Marco

> Regards,
>   Marco
> 
> > > Regards,
> > >   Marco
> > >
> > > > Bart
> > > >
> > > > > +static const struct gpio_chip reference_gp = {
> > > > > +       .label = "da9062-gpio",
> > > > > +       .owner = THIS_MODULE,
> > > > > +       .get = da9062_gpio_get,
> > > > > +       .set = da9062_gpio_set,
> > > > > +       .get_direction = da9062_gpio_get_direction,
> > > > > +       .direction_input = da9062_gpio_direction_input,
> > > > > +       .direction_output = da9062_gpio_direction_output,
> > > > > +       .set_config = da9062_gpio_set_config,
> > > > > +       .to_irq = da9062_gpio_to_irq,
> > > > > +       .can_sleep = true,
> > > > > +       .ngpio = DA9062_GPIO_NUM,
> > > > > +       .base = -1,
> > > > > +};
> > > > > +
> > > > > +static int da9062_gpio_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +       struct da9062_gpio *gpio;
> > > > > +
> > > > > +       gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> > > > > +       if (!gpio)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       gpio->da9062 = dev_get_drvdata(pdev->dev.parent);
> > > > > +       if (!gpio->da9062)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       gpio->gp = reference_gp;
> > > > > +       gpio->gp.parent = &pdev->dev;
> > > > > +
> > > > > +       platform_set_drvdata(pdev, gpio);
> > > > > +
> > > > > +       return devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
> > > > > +}
> > > > > +
> > > > > +static const struct of_device_id da9062_compatible_id_table[] = {
> > > > > +       { .compatible = "dlg,da9062-gpio" },
> > > > > +       { },
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, da9062_compatible_id_table);
> > > > > +
> > > > > +static struct platform_driver da9062_gpio_driver = {
> > > > > +       .probe = da9062_gpio_probe,
> > > > > +       .driver = {
> > > > > +               .name   = "da9062-gpio",
> > > > > +               .of_match_table = da9062_compatible_id_table,
> > > > > +       },
> > > > > +};
> > > > > +module_platform_driver(da9062_gpio_driver);
> > > > > +
> > > > > +MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de>");
> > > > > +MODULE_DESCRIPTION("DA9062 GPIO Device Driver");
> > > > > +MODULE_LICENSE("GPL v2");
> > > > > +MODULE_ALIAS("platform:da9062-gpio");
> > > > > diff --git a/include/linux/mfd/da9062/gpio.h b/include/linux/mfd/da9062/gpio.h
> > > > > new file mode 100644
> > > > > index 000000000000..67627ada1ad4
> > > > > --- /dev/null
> > > > > +++ b/include/linux/mfd/da9062/gpio.h
> > > > > @@ -0,0 +1,13 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > +/*
> > > > > + * Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > > > > + */
> > > > > +
> > > > > +#ifndef __MFD_DA9062_GPIO_H__
> > > > > +#define __MFD_DA9062_GPIO_H__
> > > > > +
> > > > > +struct gpio_desc;
> > > > > +
> > > > > +int da9062_gpio_get_hwgpio(struct gpio_desc *desc);
> > > > > +
> > > > > +#endif /* __MFD_DA9062_GPIO_H__ */
> > > > > --
> > > > > 2.20.1
> > > > >
> > > >
> > >
> > > --
> > > Pengutronix e.K.                           |                             |
> > > Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> > > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
