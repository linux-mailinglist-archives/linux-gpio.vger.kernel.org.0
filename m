Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D9F446325
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhKEMJH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbhKEMJG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 08:09:06 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D454C061714;
        Fri,  5 Nov 2021 05:06:27 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id o8so32195918edc.3;
        Fri, 05 Nov 2021 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NvZt6wor/iWsNZUw+MTwLF1bGSr9r7fC7l43DBngm7Y=;
        b=mf8haO4WnkW6v0mwqaqCeV66+ffu/pRcM82c3sSY/a3mRm0bZL7jugBOk2iIZJYCXV
         gu4SF3vjrcmcDVcRs15JoYrgkHTwlEAGtOCQmJ9itC/QIl6/ZqNoc4S5lQ1tdiFDELe/
         s4gV6rF9qBkDHQZ90oatqAEHZGF0AHFxsX0i1c3fLJ1X44kuW7PfjjtTur9N3e91T7Mt
         eE4InmnEttBgrnHEessMH+Fm/4kG/GYL17UkUO7tzW647uQLlOiNN6ExnzYGOFM4jv9P
         sXEVPRsUaII89FfOOvmdhNw1lH7pOAA61l9CEIQbQm3y3c2+zX/EuxMym3Un2pje+9ai
         zjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NvZt6wor/iWsNZUw+MTwLF1bGSr9r7fC7l43DBngm7Y=;
        b=jMlSy++zjIdDSHyL76iiSlws/vuKrBC3HfGZzA1yHT0o8mRzm5YUoXZjmzL/Um3KEo
         VvXYyXvZxsbIvW32kl3SBrZyGQCiRoGNv+CUUBkAGd79WT+tA1SDzCd+3EXsMbWSP8sV
         8vwhLTq6Asw0yORYfzdBXsQyG6a4OcuLSwNTHDpzEpszfzI+95fzHAGedT1st10yj0wl
         vI+TmGEPXl0D3ptVdnKtBe8qvlvoKKZEr4WwWfu4geZErk3jha6B5+xXLIkMce8i3oBj
         AI1yujLsuAk4U6NiggutUalDNRUH1dtHis2dU4+u52u2i87xUlUwZzhatj+DdkFjAHFX
         tn4w==
X-Gm-Message-State: AOAM531wSCOW2oMrxwDFdnQPbpto5TVe0rrlGVjo5S55MjWoZmP+g6SS
        EvhhavuE5RpFm1JDttqCf98vE6GI5gG9X9Fw+Sg=
X-Google-Smtp-Source: ABdhPJzBKOMRsn7/mETWtYLffBLGvwD2CL3LdZo7pzN8bHN+tdd9NeutA5GzqbyC3ghHcdSd1B6XFy6GbmCwV7pY9qs=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr69346049ejd.425.1636113985627;
 Fri, 05 Nov 2021 05:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211105113859.101868-1-robert.marko@sartura.hr> <20211105113859.101868-2-robert.marko@sartura.hr>
In-Reply-To: <20211105113859.101868-2-robert.marko@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Nov 2021 14:05:38 +0200
Message-ID: <CAHp75Vc0M4CSd=ywj45jsDYKb4uL8c=FPjNnD2_ZuVAw2BDrXw@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Walle <michael@walle.cc>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 5, 2021 at 1:39 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
> expander.
>
> The CPLD provides 12 pins in total on the TN48M, but on more advanced
> switch models it provides up to 192 pins, so the driver is extendable
> to support more switches.

With or without nit-pick below
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v8:
> * No need to assing NULL to gpio_config per Andys comment
>
> Changes in v7:
> * Change compatibles, reduce their number
> * Rework the driver to be easily extendible to support more devices
> * Use match data to populate configuration
> * Drop reviews and ACK-s as the driver changed
>
> Changes in v6:
> * Drop unused header
> * Return the return value of device_property_read_u32()
> instead of a hardcoded return
>
> Changes in v2:
> * Rewrite to use simple I2C MFD and GPIO regmap
> * Drop DT bindings for pin numbering
> ---
>  drivers/gpio/Kconfig      |  12 +++++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-tn48m.c | 100 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 drivers/gpio/gpio-tn48m.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index fab571016adf..31b83271f954 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1344,6 +1344,18 @@ config GPIO_TIMBERDALE
>         help
>         Add support for the GPIO IP in the timberdale FPGA.
>
> +config GPIO_TN48M_CPLD
> +       tristate "Delta Networks TN48M switch CPLD GPIO driver"
> +       depends on MFD_TN48M_CPLD
> +       select GPIO_REGMAP
> +       help
> +         This enables support for the GPIOs found on the Delta
> +         Networks TN48M switch Lattice CPLD. It provides 12 pins in total,
> +         they are input-only or ouput-only type.
> +
> +         This driver can also be built as a module. If so, the
> +         module will be called gpio-tn48m.
> +
>  config GPIO_TPS65086
>         tristate "TI TPS65086 GPO"
>         depends on MFD_TPS65086
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 32a32659866a..93abc7461e45 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -148,6 +148,7 @@ obj-$(CONFIG_GPIO_TEGRA186)         += gpio-tegra186.o
>  obj-$(CONFIG_GPIO_TEGRA)               += gpio-tegra.o
>  obj-$(CONFIG_GPIO_THUNDERX)            += gpio-thunderx.o
>  obj-$(CONFIG_GPIO_TIMBERDALE)          += gpio-timberdale.o
> +obj-$(CONFIG_GPIO_TN48M_CPLD)          += gpio-tn48m.o
>  obj-$(CONFIG_GPIO_TPIC2810)            += gpio-tpic2810.o
>  obj-$(CONFIG_GPIO_TPS65086)            += gpio-tps65086.o
>  obj-$(CONFIG_GPIO_TPS65218)            += gpio-tps65218.o
> diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
> new file mode 100644
> index 000000000000..485565813ad4
> --- /dev/null
> +++ b/drivers/gpio/gpio-tn48m.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Delta TN48M CPLD GPIO driver
> + *
> + * Copyright (C) 2021 Sartura Ltd.
> + *
> + * Author: Robert Marko <robert.marko@sartura.hr>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +enum tn48m_gpio_type {
> +       TN48M_GP0 = 1,
> +       TN48M_GPI,
> +};
> +
> +struct tn48m_gpio_config {
> +       int ngpio;
> +       int ngpio_per_reg;
> +       enum tn48m_gpio_type type;
> +};
> +
> +static const struct tn48m_gpio_config tn48m_gpo_config = {
> +       .ngpio = 4,
> +       .ngpio_per_reg = 4,
> +       .type = TN48M_GP0,
> +};
> +
> +static const struct tn48m_gpio_config tn48m_gpi_config = {
> +       .ngpio = 4,
> +       .ngpio_per_reg = 4,
> +       .type = TN48M_GPI,
> +};
> +
> +static int tn48m_gpio_probe(struct platform_device *pdev)
> +{
> +       const struct tn48m_gpio_config *gpio_config;

> +       struct gpio_regmap_config config = {0};

I see, I mixed this up with regmap itself.

One nit-pick, though. The 0 there is not needed, the common use is {}.

> +       struct regmap *regmap;
> +       u32 base;
> +       int ret;
> +
> +       if (!pdev->dev.parent)
> +               return -ENODEV;
> +
> +       gpio_config = device_get_match_data(&pdev->dev);
> +       if (!gpio_config)
> +               return -ENODEV;
> +
> +       ret = device_property_read_u32(&pdev->dev, "reg", &base);
> +       if (ret)
> +               return ret;
> +
> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!regmap)
> +               return -ENODEV;
> +
> +       config.regmap = regmap;
> +       config.parent = &pdev->dev;
> +       config.ngpio = gpio_config->ngpio;
> +       config.ngpio_per_reg = gpio_config->ngpio_per_reg;
> +       switch (gpio_config->type) {
> +       case TN48M_GP0:
> +               config.reg_set_base = base;
> +               break;
> +       case TN48M_GPI:
> +               config.reg_dat_base = base;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
> +}
> +
> +static const struct of_device_id tn48m_gpio_of_match[] = {
> +       { .compatible = "delta,tn48m-gpo", .data = &tn48m_gpo_config },
> +       { .compatible = "delta,tn48m-gpi", .data = &tn48m_gpi_config },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, tn48m_gpio_of_match);
> +
> +static struct platform_driver tn48m_gpio_driver = {
> +       .driver = {
> +               .name = "delta-tn48m-gpio",
> +               .of_match_table = tn48m_gpio_of_match,
> +       },
> +       .probe = tn48m_gpio_probe,
> +};
> +module_platform_driver(tn48m_gpio_driver);
> +
> +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> +MODULE_DESCRIPTION("Delta TN48M CPLD GPIO driver");
> +MODULE_LICENSE("GPL");
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko
