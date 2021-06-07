Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A572B39DBE8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 14:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhFGMJm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 08:09:42 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:33543 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGMJm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 08:09:42 -0400
Received: by mail-pf1-f173.google.com with SMTP id p13so3342312pfw.0;
        Mon, 07 Jun 2021 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zhhWGl26esEc98p9IGGGWCO8sKM0FckJ4uKbj2A/oOU=;
        b=vC0i5LswQU6RKt+tyGxvqEHjcgH8Nc4Ql0B0vgB4nKRbocjkbtELyX6JH1mM7iq0aW
         f+PO/adUAO7+RrXaOENCvngxMYsqHbsS6FyTrLUR+Mzfj49373FV3HNzYzOtwjjMetAS
         ALHNxWxMqSBIgdn3nO1VKQfABrR+TYftSaLB8EpIdn3qk23B5fgYbMi/9TQ2lAn4dUtt
         5ZCjn8bCq6ChvJG8WzUpB++pRb4aVrKDuMCX9EGpEFy+fBrUkoIVTsI8A6xzZpGMunIS
         K3lY6OKccNBKZUdvgWA7BK1UZMLCJdFcXuv6dbETiCjbK0/xBJ1vuC7CHSjfH9lmN8/I
         3H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zhhWGl26esEc98p9IGGGWCO8sKM0FckJ4uKbj2A/oOU=;
        b=Y4Y6EmzPm71GK2RTgTSkMMsyB0lUIYp1vuacgbGmUMgkdwOD963sKe7Id/VZeJuhn9
         tjDqEvF/wzH0XBC4qXOZCd+kpEs/651mA4a2uu1XsJ0ABL1UEUsKNCsNpn2n0TLenEch
         negiMr1X3iRm6PfueGTSf1dIw6JGsEsUcLRuk/tu0paUfDEcjabWTtGS6oo6q6Jl1k2e
         Au+7P8rQ3JjJGGnjAzg6WX+G1ZMc8ECrf4Q5a02SMLy1WV3miGw4mpFMZmOmhzaqh5Pq
         W6ndzkP0IRBMSszxsSLNcMDh6LTNFMlWLhey/C4xsbeybX8zXqhgyt7ZEWuU79Ao3Btm
         THVg==
X-Gm-Message-State: AOAM532/mhuVHXEO/ETm9Fb4uFjbCiIbZ+KM2bH/uS4ALDTnj4RGg/BZ
        0XIi4ysa+FaC3jAF7cQMTvICrd6Ch+y2Q/AtQpI=
X-Google-Smtp-Source: ABdhPJwRDQ49Jwel4k+NI3J4zL1wl40Xfc2l/hhi8hdg20koj8hrsXitFV7VWeYlRWGcgHyzO9McPph+l1TxIyAhSWM=
X-Received: by 2002:a63:b507:: with SMTP id y7mr17587622pge.74.1623067604406;
 Mon, 07 Jun 2021 05:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210607105122.2047212-1-robert.marko@sartura.hr> <20210607105122.2047212-2-robert.marko@sartura.hr>
In-Reply-To: <20210607105122.2047212-2-robert.marko@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Jun 2021 15:06:28 +0300
Message-ID: <CAHp75Vfkn-fSJrLFfswzLdZPJwe+x24rntCPO2VKK0RHfN0y=Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>, buczek@molgen.mpg.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 7, 2021 at 1:51 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
>
> It is a mix of input only and output only pins.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Couple of small issues below.
Otherwise looks good!

> ---
> Changes in v2:
> * Rewrite to use simple I2C MFD and GPIO regmap
> * Drop DT bindings for pin numbering
>
>  drivers/gpio/Kconfig      | 12 ++++++
>  drivers/gpio/Makefile     |  1 +
>  drivers/gpio/gpio-tn48m.c | 89 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 drivers/gpio/gpio-tn48m.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e3607ec4c2e8..472f7764508e 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1310,6 +1310,18 @@ config GPIO_TIMBERDALE
>         help
>         Add support for the GPIO IP in the timberdale FPGA.
>
> +config GPIO_TN48M_CPLD
> +       tristate "Delta Networks TN48M switch CPLD GPIO driver"
> +       depends on MFD_TN48M_CPLD
> +       select GPIO_REGMAP
> +       help
> +         This enables support for the GPIOs found on the Delta
> +         Networks TN48M switch CPLD.
> +         They are used for inputs and outputs on the SFP slots.
> +
> +         This driver can also be built as a module. If so, the
> +         module will be called gpio-tn48m.
> +
>  config GPIO_TPS65086
>         tristate "TI TPS65086 GPO"
>         depends on MFD_TPS65086
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index c58a90a3c3b1..271fb806475e 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_GPIO_TEGRA186)         += gpio-tegra186.o
>  obj-$(CONFIG_GPIO_TEGRA)               += gpio-tegra.o
>  obj-$(CONFIG_GPIO_THUNDERX)            += gpio-thunderx.o
>  obj-$(CONFIG_GPIO_TIMBERDALE)          += gpio-timberdale.o
> +obj-$(CONFIG_GPIO_TN48M_CPLD)          += gpio-tn48m.o
>  obj-$(CONFIG_GPIO_TPIC2810)            += gpio-tpic2810.o
>  obj-$(CONFIG_GPIO_TPS65086)            += gpio-tps65086.o
>  obj-$(CONFIG_GPIO_TPS65218)            += gpio-tps65218.o
> diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
> new file mode 100644
> index 000000000000..41484c002826
> --- /dev/null
> +++ b/drivers/gpio/gpio-tn48m.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Delta TN48M CPLD GPIO driver
> + *
> + * Copyright 2021 Sartura Ltd
> + *
> + * Author: Robert Marko <robert.marko@sartura.hr>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>

> +#include <linux/kernel.h>

What is this header for?

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +enum tn48m_gpio_type {
> +       TN48M_SFP_TX_DISABLE = 1,
> +       TN48M_SFP_PRESENT,
> +       TN48M_SFP_LOS,
> +};
> +
> +static int tn48m_gpio_probe(struct platform_device *pdev)
> +{
> +       struct gpio_regmap_config config = {0};
> +       enum tn48m_gpio_type type;
> +       struct regmap *regmap;
> +       u32 base;
> +       int ret;
> +
> +       if (!pdev->dev.parent)
> +               return -ENODEV;
> +
> +       type = (uintptr_t)device_get_match_data(&pdev->dev);
> +       if (!type)
> +               return -ENODEV;
> +
> +       ret = device_property_read_u32(&pdev->dev, "reg", &base);
> +       if (ret)

> +               return -EINVAL;

return ret;

> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!regmap)
> +               return -ENODEV;
> +
> +       config.regmap = regmap;
> +       config.parent = &pdev->dev;
> +       config.ngpio = 4;
> +
> +       switch (type) {
> +       case TN48M_SFP_TX_DISABLE:
> +               config.reg_set_base = base;
> +               break;
> +       case TN48M_SFP_PRESENT:
> +               config.reg_dat_base = base;
> +               break;
> +       case TN48M_SFP_LOS:
> +               config.reg_dat_base = base;
> +               break;
> +       default:
> +               dev_err(&pdev->dev, "unknown type %d\n", type);
> +               return -ENODEV;
> +       }
> +
> +       return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
> +}
> +
> +static const struct of_device_id tn48m_gpio_of_match[] = {
> +       { .compatible = "delta,tn48m-gpio-sfp-tx-disable", .data = (void *)TN48M_SFP_TX_DISABLE },
> +       { .compatible = "delta,tn48m-gpio-sfp-present", .data = (void *)TN48M_SFP_PRESENT },
> +       { .compatible = "delta,tn48m-gpio-sfp-los", .data = (void *)TN48M_SFP_LOS },
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
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
