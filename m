Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE77C38E6CC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 14:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbhEXMpw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 08:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhEXMpu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 08:45:50 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE5EC06138A;
        Mon, 24 May 2021 05:44:22 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x188so20743893pfd.7;
        Mon, 24 May 2021 05:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DxrUgJ4P1Hl+jB24qHb/sYVF9wtCZ3rUg5c8mUV/Efc=;
        b=ZdXjBdS0S0eLpt+aVPNkW7J1iKz1ix2kUzAYqQzRXnQedO3e+gNJkKO6sP1wEmo4PN
         nGTe9eIKHz1Tcic6QX/g3JNSCXQ+2JLESY/o4EyYNjevXHkbGLaMBjR0+oxJEj52Mq/j
         G/gdHEfFFDOMFZZyfnGsLAW7BmzIJkenhfl45Tg3Ns6MxrEZZjmyMnmcNwm6m0NbFm6Y
         XrRSWmrLOsq21xRXBzRSTa2bonfb4XzwvjrJB0ZqMU/NmdysQ3w8CZ9gFMsFz4Jj3tyY
         8VdkV7qjmCmGIkrekYWp1zidHhBN0TuQ/M2X7uMxE4PqlACFpOK8/tiKVCX5Vl9n+6mR
         GdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxrUgJ4P1Hl+jB24qHb/sYVF9wtCZ3rUg5c8mUV/Efc=;
        b=lkycpuueL5Saf/tNbCQYRnrig7i3BNDlhHgi+XHPCSOFB6RHcgVKgCLikagwzT/0Mk
         njKWi622snTBCYXfwRfU8yeg+tMlbPAtYYqVsmp+9el7abyaAhRtQz6SIV3fVsELcPTm
         6EStcFtvDZ75syl/7lw0GSPqU2wYFAvNwM6q+6o+Z73y32VDDCf5P9oDcMmvZLDKPlES
         E4DyhMtowUC1o9k/Hxf8rzcDio9lkZAB3jBuDY30d4oDeY2X7Qc4WpoC8vTvl/61uUYF
         i36KPLnQSe9vNu3u47HL9xosdj5J/VR+ulozLioNC+/+f1eqZtljikshUEaVvIX42kR/
         p9Ug==
X-Gm-Message-State: AOAM533BdaI/fxYEaSKBmPpAc/lt3TmpYuy5LBco5zVjhI4uK6JDpPhh
        3eF+OJgT7+/QcKWtwkZNo8GHy+E7RTN3DIUJK/hPxpE9gQQ=
X-Google-Smtp-Source: ABdhPJxQ/Kvbe+h3uMQfotQ/d+9ylbVYIGO1bnDIIj99JyfaOWwF4RMN05Cmt32zx+TloBVrG7Ezw4puxS1JRvzxsRY=
X-Received: by 2002:a62:bd07:0:b029:2df:2c0a:d5e9 with SMTP id
 a7-20020a62bd070000b02902df2c0ad5e9mr24155743pff.7.1621860261581; Mon, 24 May
 2021 05:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr> <20210524120539.3267145-2-robert.marko@sartura.hr>
In-Reply-To: <20210524120539.3267145-2-robert.marko@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 15:44:05 +0300
Message-ID: <CAHp75VfuLVWLK1m8f3kRdiVHcZFAvZ3iXmNM1awqZjxN_xeOKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: Add Delta TN48M CPLD GPIO driver
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>, buczek@molgen.mpg.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 3:06 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
>
> It is a mix of input only and output only pins.

LGTM!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
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
> index 1dd0ec6727fd..46caf72960e6 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1332,6 +1332,18 @@ config GPIO_TIMBERDALE
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
> index d7c81e1611a4..07fa6419305f 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -147,6 +147,7 @@ obj-$(CONFIG_GPIO_TEGRA186)         += gpio-tegra186.o
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
> +
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
