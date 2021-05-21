Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2931538C46E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhEUKNz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbhEUKNx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 06:13:53 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54219C061574;
        Fri, 21 May 2021 03:12:30 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 27so12543164pgy.3;
        Fri, 21 May 2021 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhchZa7DVPUcXuy8VPSlCODqEh2K2rK3oQYzq2HCeoM=;
        b=oDxU3dtm4b5UHRRsiFpEMI74xh8VEX5fBkcFrs35LzwYrsU4Xjb8uDEJva4NSyLaj5
         isR2rYaYizTeIJx1y+FK2uMDWCQP8ZLQdvWtOa/pvb7CVj4QqIY7IJ+Am4koqQxQhAWP
         +hl4kfgvwM6SrrwA7Q5l2TiIfN6XNVSbMAAXD3g5emhFiGpXfbf24gK0Gp+9SrNxfCvs
         A1A0D48g28KOd6KQxv9+A2I3PRRWHA2VLE5ltktjwYQwAnALbKabTO4vu9DbXfO/vrH2
         ShxsGLpxyUNzt5Kg8ZGa/irDuPZ1HI6kXTf2CGry13ue+ytdkqhWTyPAZ8m6g1NOP+i7
         8tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhchZa7DVPUcXuy8VPSlCODqEh2K2rK3oQYzq2HCeoM=;
        b=PfevpkMFVnhVkoN37C2sIn//Iv6RUOmLfwm2uOvDV6r5ah3WePoJgOjX2gZAKIWbwP
         F15GyxqiRMfXIyeWYJpVCEW66lEZFUCg4nRiXx4RsTXM2458Q9oIykJf0FHm0/43Zt+q
         T9ovNiK/aL8pNxVAzj4pI0TiqufoRW2x/EtRBdBeobd+KFgALOL9a8L2diNQJAFme816
         ulig9Sz2xJLzoRPc0xqOuQXh3zwqiWq/DFD3Hj/q6fFXV0dI8+NOTA7lxtbt75nuHC5w
         juLAjQpEukKVvDcn9D4WtkXrPYtPyQ6K6YsuK3WnDzpTEA9yrnkB+9Z9rIrf2e/mqZIU
         gniQ==
X-Gm-Message-State: AOAM531bzo8wh+WAgPThWuc61p8NaTWzlcH7tRCk+fY5GnW0otn8eYAN
        adJ9NkTN/OvKr8D5CWVcQqj0BHdRh6mkcBWhPX0=
X-Google-Smtp-Source: ABdhPJwWgfZ6LZnsIVEWWWg5BeexZaWlOrNe9XTXXJmU67UYNaVRYaHiFd7yJk8lfJs0kyw7I4kmYNZZIm/s1hLhwuA=
X-Received: by 2002:a62:bd07:0:b029:2df:2c0a:d5e9 with SMTP id
 a7-20020a62bd070000b02902df2c0ad5e9mr9312869pff.7.1621591949710; Fri, 21 May
 2021 03:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com> <9b040b3610a50e8c3c9579f5d28713af5a59942c.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <9b040b3610a50e8c3c9579f5d28713af5a59942c.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 21 May 2021 13:12:13 +0300
Message-ID: <CAHp75VctYvEOXep2-gtfsuTRp+yh+s_0EYubTO2cmh7YQ5OWYg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: bd71815: Use gpio-regmap
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 12:54 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Utilize the gpio-regmap helper and drop the custom functions

I like the statistics of this change!
FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> Changelog:
>  - No changes
>
>  drivers/gpio/Kconfig        |   1 +
>  drivers/gpio/gpio-bd71815.c | 106 ++++++++++--------------------------
>  2 files changed, 29 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 1dd0ec6727fd..97e1348cd410 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1120,6 +1120,7 @@ config GPIO_BD70528
>  config GPIO_BD71815
>         tristate "ROHM BD71815 PMIC GPIO support"
>         depends on MFD_ROHM_BD71828
> +       select GPIO_REGMAP
>         help
>           Support for GPO(s) on ROHM BD71815 PMIC. There are two GPOs
>           available on the ROHM PMIC.
> diff --git a/drivers/gpio/gpio-bd71815.c b/drivers/gpio/gpio-bd71815.c
> index 08ff2857256f..a241c01e08d1 100644
> --- a/drivers/gpio/gpio-bd71815.c
> +++ b/drivers/gpio/gpio-bd71815.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
>  #include <linux/init.h>
>  #include <linux/irq.h>
>  #include <linux/module.h>
> @@ -18,81 +19,33 @@
>  #include <linux/mfd/rohm-bd71815.h>
>
>  struct bd71815_gpio {
> -       /* chip.parent points the MFD which provides DT node and regmap */
> -       struct gpio_chip chip;
> -       /* dev points to the platform device for devm and prints */
>         struct device *dev;
> -       struct regmap *regmap;
>  };
>
> -static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
> -{
> -       struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
> -       int ret, val;
> -
> -       ret = regmap_read(bd71815->regmap, BD71815_REG_GPO, &val);
> -       if (ret)
> -               return ret;
> -
> -       return (val >> offset) & 1;
> -}
> -
> -static void bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
> -                          int value)
> -{
> -       struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
> -       int ret, bit;
> -
> -       bit = BIT(offset);
> -
> -       if (value)
> -               ret = regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
> -       else
> -               ret = regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
> -
> -       if (ret)
> -               dev_warn(bd71815->dev, "failed to toggle GPO\n");
> -}
> -
> -static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> +static int bd71815_gpio_set_config(struct regmap *regmap, void *drvdata,
> +                                  unsigned int offset,
>                                    unsigned long config)
>  {
> -       struct bd71815_gpio *bdgpio = gpiochip_get_data(chip);
> +       struct bd71815_gpio *bdgpio = (struct bd71815_gpio *)drvdata;
>
>         switch (pinconf_to_config_param(config)) {
>         case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> -               return regmap_update_bits(bdgpio->regmap,
> +               return regmap_update_bits(regmap,
>                                           BD71815_REG_GPO,
>                                           BD71815_GPIO_DRIVE_MASK << offset,
>                                           BD71815_GPIO_OPEN_DRAIN << offset);
>         case PIN_CONFIG_DRIVE_PUSH_PULL:
> -               return regmap_update_bits(bdgpio->regmap,
> +               return regmap_update_bits(regmap,
>                                           BD71815_REG_GPO,
>                                           BD71815_GPIO_DRIVE_MASK << offset,
>                                           BD71815_GPIO_CMOS << offset);
>         default:
> +               dev_err(bdgpio->dev, "Unsupported config (0x%lx)\n", config);
>                 break;
>         }
>         return -ENOTSUPP;
>  }
>
> -/* BD71815 GPIO is actually GPO */
> -static int bd71815gpo_direction_get(struct gpio_chip *gc, unsigned int offset)
> -{
> -       return GPIO_LINE_DIRECTION_OUT;
> -}
> -
> -/* Template for GPIO chip */
> -static const struct gpio_chip bd71815gpo_chip = {
> -       .label                  = "bd71815",
> -       .owner                  = THIS_MODULE,
> -       .get                    = bd71815gpo_get,
> -       .get_direction          = bd71815gpo_direction_get,
> -       .set                    = bd71815gpo_set,
> -       .set_config             = bd71815_gpio_set_config,
> -       .can_sleep              = true,
> -};
> -
>  #define BD71815_TWO_GPIOS      GENMASK(1, 0)
>  #define BD71815_ONE_GPIO       BIT(0)
>
> @@ -111,14 +64,16 @@ static const struct gpio_chip bd71815gpo_chip = {
>   * but allows using it by providing the DT property
>   * "rohm,enable-hidden-gpo".
>   */
> -static int bd71815_init_valid_mask(struct gpio_chip *gc,
> +static int bd71815_init_valid_mask(struct regmap *regmap, void *drvdata,
>                                    unsigned long *valid_mask,
>                                    unsigned int ngpios)
>  {
> +       struct bd71815_gpio *bdgpio = (struct bd71815_gpio *)drvdata;
> +
>         if (ngpios != 2)
>                 return 0;
>
> -       if (gc->parent && device_property_present(gc->parent,
> +       if (bdgpio->dev && device_property_present(bdgpio->dev->parent,
>                                                   "rohm,enable-hidden-gpo"))
>                 *valid_mask = BD71815_TWO_GPIOS;
>         else
> @@ -127,9 +82,19 @@ static int bd71815_init_valid_mask(struct gpio_chip *gc,
>         return 0;
>  }
>
> +/* Template for regmap gpio config */
> +static const struct gpio_regmap_config gpio_cfg_template = {
> +       .label                  = "bd71815",
> +       .reg_set_base           = BD71815_REG_GPO,
> +       .ngpio                  = 2,
> +       .set_config             = bd71815_gpio_set_config,
> +       .init_valid_mask        = bd71815_init_valid_mask,
> +};
> +
>  static int gpo_bd71815_probe(struct platform_device *pdev)
>  {
>         struct bd71815_gpio *g;
> +       struct gpio_regmap_config cfg;
>         struct device *parent, *dev;
>
>         /*
> @@ -144,30 +109,15 @@ static int gpo_bd71815_probe(struct platform_device *pdev)
>         if (!g)
>                 return -ENOMEM;
>
> -       g->chip = bd71815gpo_chip;
> -
> -       /*
> -        * FIXME: As writing of this the sysfs interface for GPIO control does
> -        * not respect the valid_mask. Do not trust it but rather set the ngpios
> -        * to 1 if "rohm,enable-hidden-gpo" is not given.
> -        *
> -        * This check can be removed later if the sysfs export is fixed and
> -        * if the fix is backported.
> -        *
> -        * For now it is safest to just set the ngpios though.
> -        */
> -       if (device_property_present(parent, "rohm,enable-hidden-gpo"))
> -               g->chip.ngpio = 2;
> -       else
> -               g->chip.ngpio = 1;
> -
> -       g->chip.init_valid_mask = bd71815_init_valid_mask;
> -       g->chip.base = -1;
> -       g->chip.parent = parent;
> -       g->regmap = dev_get_regmap(parent, NULL);
>         g->dev = dev;
>
> -       return devm_gpiochip_add_data(dev, &g->chip, g);
> +       cfg = gpio_cfg_template;
> +       cfg.parent = parent;
> +       cfg.regmap = dev_get_regmap(parent, NULL);
> +       cfg.fwnode = dev_fwnode(dev);
> +       cfg.drvdata = g;
> +
> +       return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &cfg));
>  }
>
>  static struct platform_driver gpo_bd71815_driver = {
> --
> 2.25.4
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
> Thanks to Simon Glass for the translation =]



-- 
With Best Regards,
Andy Shevchenko
