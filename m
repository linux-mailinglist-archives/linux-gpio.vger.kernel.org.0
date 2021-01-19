Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFED2FB974
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 15:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405151AbhASOcd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 09:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387752AbhASLJC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 06:09:02 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95189C061575
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 03:07:28 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id g24so20943586edw.9
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PiSjDPl16vhUAr6+ooHTRzvPgNHbXyGAQCQbk4AmUos=;
        b=ny/yfseETpui/uGYy5m/BCn0Wmh42Jehw6bXhKkNR3ZFc73yLXexoQgaP3xlMQPZil
         2oU5LJTPsp/pVrcw6q46rFIJnI5GuCLXO3P4cb5W73MDcKjp0ghXjB9aw04vxjZCOn5s
         FO/khYiN10ARZjpg39ao3RbjKw+XodmMySyvzr0I8bJaIGU0LHQHd7GvuwnOGp6S3P+W
         EIIKNUJibptm6s+nD0KKk6EOtc1zbv5LYxSBikqTvrK1XKibcPOrNzvE7DbQ2gZ/LQGf
         ZB2ibAUba7EZgShuh9GjtHLzjVgghxqxATXXM1e3/Pe+bQ1cN7G683sOc/bZvu3DbMh6
         q+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PiSjDPl16vhUAr6+ooHTRzvPgNHbXyGAQCQbk4AmUos=;
        b=Nc7tzxv19D/p5/6/OnXchszFlsTfO01Q+EyEl7imzM7y3ugJgXmeAisKI2pSpkxiFg
         Uu7sarZpcNBBoWRmfR4Y8UyMU44+O4XhzWO49ehvOHh9VLbmyGBGWFgHU2jpk1HRoHn5
         TPACcTyxdJ1f+8BYsSd5dVSAf2nQswHBbOqaWi4T2nhW5EzCLtYU6MAzwQYwznOykSML
         Ar8gaXUXhIhaAiJkMJWb5KsIZwfdmtqqjml32jsOYmy9NChJRfipm/kBEa7PGGD5eM6I
         NwkIxi2mFvp5bx4meugfapzD6Lzbt3HXV+7hMvKIVV9pA1wwDfBjuITQ5mG7fU8dSenZ
         r9OA==
X-Gm-Message-State: AOAM532OpVotGBwQVnWlFiv8tL72JQJUOJdpUVYo+mCyyEyHUwiXPpKT
        iH9XWVm/Y6087G4avTbWM2xtkJpc1EFKjwjDoQFFvQ==
X-Google-Smtp-Source: ABdhPJz/1WP0AgSz4xQSUCugngOIARYeJgEQS2PMU+S7nK7aEm5ZHXIcqJFcCXKfWO6z4hnptEIfnAM2bHl2z9cTOAY=
X-Received: by 2002:a50:b742:: with SMTP id g60mr2872307ede.113.1611054447199;
 Tue, 19 Jan 2021 03:07:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com> <50f72f1f7f28e969a1e0353712fcc530bce9dd06.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <50f72f1f7f28e969a1e0353712fcc530bce9dd06.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Jan 2021 12:07:16 +0100
Message-ID: <CAMpxmJVjnAMig16qWkjpaHwQ+4Ld9yEc-gg-CGv28QQYBB6gNg@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] gpio: support ROHM BD71815 GPOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-power@fi.rohmeurope.com,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 19, 2021 at 8:23 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Support GPO(s) found from ROHM BD71815 power management IC. The IC has two
> GPO pins but only one is properly documented in data-sheet. The driver
> exposes by default only the documented GPO. The second GPO is connected to
> E5 pin and is marked as GND in data-sheet. Control for this undocumented
> pin can be enabled using a special DT property.
>
> This driver is derived from work by Peter Yang <yanglsh@embest-tech.com>
> although not so much of original is left.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Hi Matti,

looks great, just a couple nits.

> ---
> Changes since v1:
>   - removed unneeded headers
>   - clarified dev/parent->dev usage
>   - removed forgotten #define DEBUG
>
>  drivers/gpio/Kconfig        |  10 +++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-bd71815.c | 171 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 182 insertions(+)
>  create mode 100644 drivers/gpio/gpio-bd71815.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c70f46e80a3b..fd7283af858d 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1096,6 +1096,16 @@ config GPIO_BD70528
>           This driver can also be built as a module. If so, the module
>           will be called gpio-bd70528.
>
> +config GPIO_BD71815
> +       tristate "ROHM BD71815 PMIC GPIO support"
> +       depends on MFD_ROHM_BD71828
> +       help
> +         Support for GPO(s) on ROHM BD71815 PMIC. There are two GPOs
> +         available on the ROHM PMIC.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio-bd71815.
> +
>  config GPIO_BD71828
>         tristate "ROHM BD71828 GPIO support"
>         depends on MFD_ROHM_BD71828
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 35e3b6026665..86bb680522a6 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_GPIO_ATH79)              += gpio-ath79.o
>  obj-$(CONFIG_GPIO_BCM_KONA)            += gpio-bcm-kona.o
>  obj-$(CONFIG_GPIO_BCM_XGS_IPROC)       += gpio-xgs-iproc.o
>  obj-$(CONFIG_GPIO_BD70528)             += gpio-bd70528.o
> +obj-$(CONFIG_GPIO_BD71815)             += gpio-bd71815.o
>  obj-$(CONFIG_GPIO_BD71828)             += gpio-bd71828.o
>  obj-$(CONFIG_GPIO_BD9571MWV)           += gpio-bd9571mwv.o
>  obj-$(CONFIG_GPIO_BRCMSTB)             += gpio-brcmstb.o
> diff --git a/drivers/gpio/gpio-bd71815.c b/drivers/gpio/gpio-bd71815.c
> new file mode 100644
> index 000000000000..664de5f69bf1
> --- /dev/null
> +++ b/drivers/gpio/gpio-bd71815.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Support to GPOs on ROHM BD71815
> + */

Newline here.

> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +/* For the BD71815 register definitions */
> +#include <linux/mfd/rohm-bd71815.h>
> +

Please arrange headers alphabetically.

> +struct bd71815_gpio {
> +       struct gpio_chip chip;
> +       struct device *dev;
> +       struct regmap *regmap;
> +       /*
> +        * Sigh. The BD71815 and BD71817 were originally designed to support two
> +        * GPO pins. At some point it was noticed the second GPO pin which is
> +        * the E5 pin located at the center of IC is hard to use on PCB (due to
> +        * the location). It was decided to not promote this second GPO and pin
> +        * is marked as GND on the data-sheet. The functionality is still there
> +        * though! I guess driving GPO connected to ground is a bad idea. Thus
> +        * we do not support it by default. OTOH - the original driver written
> +        * by colleagues at Embest did support controlling this second GPO. It
> +        * is thus possible this is used in some of the products.
> +        *
> +        * This driver does not by default support configuring this second GPO
> +        * but allows using it by providing the DT property
> +        * "rohm,enable-hidden-gpo".
> +        */
> +       bool e5_pin_is_gpo;
> +};
> +
> +static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
> +       int ret = 0;
> +       int val;
> +
> +       ret = regmap_read(bd71815->regmap, BD71815_REG_GPO, &val);
> +       if (ret)
> +               return ret;
> +
> +       return (val >> offset) & 1;
> +}
> +
> +static void bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
> +                          int value)
> +{
> +       struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
> +       int ret, val, mask;
> +
> +       if (!bd71815->e5_pin_is_gpo && offset)
> +               return;
> +
> +       mask = BIT(offset);
> +       val = value ? mask : 0;

Maybe use regmap_set/clear_bits() here?

> +       ret = regmap_update_bits(bd71815->regmap, BD71815_REG_GPO, mask, val);
> +       if (ret)
> +               dev_warn(bd71815->dev, "failed to toggle GPO\n");
> +}
> +
> +static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> +                                  unsigned long config)
> +{
> +       struct bd71815_gpio *bdgpio = gpiochip_get_data(chip);
> +
> +       if (!bdgpio->e5_pin_is_gpo && offset)
> +               return -EOPNOTSUPP;
> +
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +               return regmap_update_bits(bdgpio->regmap,
> +                                         BD71815_REG_GPO,
> +                                         BD71815_GPIO_DRIVE_MASK << offset,
> +                                         BD71815_GPIO_OPEN_DRAIN << offset);
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +               return regmap_update_bits(bdgpio->regmap,
> +                                         BD71815_REG_GPO,
> +                                         BD71815_GPIO_DRIVE_MASK << offset,
> +                                         BD71815_GPIO_CMOS << offset);
> +       default:
> +               break;
> +       }
> +       return -EOPNOTSUPP;
> +}
> +
> +/* BD71815 GPIO is actually GPO */
> +static int bd71815gpo_direction_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +/* Template for GPIO chip */

So let's make it const?

> +static struct gpio_chip bd71815gpo_chip = {
> +       .label                  = "bd71815",
> +       .owner                  = THIS_MODULE,
> +       .get                    = bd71815gpo_get,
> +       .get_direction          = bd71815gpo_direction_get,
> +       .set                    = bd71815gpo_set,
> +       .set_config             = bd71815_gpio_set_config,
> +       .can_sleep              = 1,
> +};
> +
> +static int gpo_bd71815_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct bd71815_gpio *g;
> +       struct device *dev;
> +       struct device *parent;
> +
> +       /*
> +        * Bind devm lifetime to this platform device => use dev for devm.
> +        * also the prints should originate from this device.
> +        */
> +       dev = &pdev->dev;
> +       /* The device-tree and regmap come from MFD => use parent for that */
> +       parent = dev->parent;
> +
> +       g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
> +       if (!g)
> +               return -ENOMEM;
> +
> +       g->e5_pin_is_gpo = of_property_read_bool(parent->of_node,
> +                                                "rohm,enable-hidden-gpo");
> +       g->chip = bd71815gpo_chip;
> +       g->chip.base = -1;
> +
> +       if (g->e5_pin_is_gpo)
> +               g->chip.ngpio = 2;
> +       else
> +               g->chip.ngpio = 1;
> +
> +       g->chip.parent = parent;
> +       g->chip.of_node = parent->of_node;
> +       g->regmap = dev_get_regmap(parent, NULL);
> +       g->dev = dev;
> +
> +       ret = devm_gpiochip_add_data(dev, &g->chip, g);
> +       if (ret < 0) {
> +               dev_err(dev, "could not register gpiochip, %d\n", ret);
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +static const struct platform_device_id bd7181x_gpo_id[] = {
> +       { "bd71815-gpo" },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(platform, bd7181x_gpo_id);
> +
> +static struct platform_driver gpo_bd71815_driver = {
> +       .driver = {
> +               .name   = "bd71815-gpo",
> +               .owner  = THIS_MODULE,
> +       },
> +       .probe          = gpo_bd71815_probe,
> +       .id_table       = bd7181x_gpo_id,
> +};
> +
> +module_platform_driver(gpo_bd71815_driver);
> +
> +/* Note:  this hardware lives inside an I2C-based multi-function device. */
> +MODULE_ALIAS("platform:bd71815-gpo");
> +
> +MODULE_AUTHOR("Peter Yang <yanglsh@embest-tech.com>");
> +MODULE_DESCRIPTION("GPO interface for BD71815");
> +MODULE_LICENSE("GPL");
> --
> 2.25.4
>

Bartosz

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
> Thanks to Simon Glass for the translation =]
