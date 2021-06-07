Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1805D39DC26
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 14:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhFGM0D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 08:26:03 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:38465 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhFGM0C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 08:26:02 -0400
Received: by mail-io1-f41.google.com with SMTP id b25so18042323iot.5
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 05:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iye2hzlZMm4k3ArCLqkXWazy2rFbkKnKpyJHx0+74tg=;
        b=LP2p8ISrR9G7MhZN6U7AQHnQVN3Tbd7xXje8AcuRgY4RPS6Xi6uRGuKGnc9ggopera
         qqTpY1lZA9cxPHbDBesr2D3Wvo1U7d3UkZ2ZReTT7iYeKTCG73U89v5GWfdmGjK1pK96
         c/MM5Ua+2FHL2zLrUFWUtJqgSWw2z5uBgltqU4zRw2aBFQTlbzyf8HqEepz1K/0EbxVA
         wCwuX/qGXX0aBWHEaEZbdQdDh1lzrRVu/EH5sZFM1Uc2QjontSSSX6hyDsy2Orgf6gxF
         wZeRGkprn0K7QLFFoHBPytTCgcV6kyo9QfFayNjK9idy6aPeps0766YbH9wJb9lxaxJD
         Pl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iye2hzlZMm4k3ArCLqkXWazy2rFbkKnKpyJHx0+74tg=;
        b=uIiIw+Duky4Et9P3zPu19zvRa7tes5GIp3CAyOfHzzL41TBIE7x/7+kT0CM7/VtfGD
         LbjV5OZJ/7HGlShZxSkL3fkJifafu9hO1rbPK3cs4nVfrAviAFz4UYMpUqhe5/+87Z7R
         uIxbRNasP3t4DEG1DtBgz6NUUqgULiyFaCPsU90LO0aIafOGC0BxIM+sP6cFwKYrSKkE
         hvkXGmI27OGQH9XGzJ0oqZKyEWgOIMLiSDthgqPp5dpGsh837gLgSrb1mByCWOg/jec9
         +j8tOuUB51/JQ7KdpDrU83PMCLv3dcng/h6q/iHnzW+wFFVkJLcAhOeZuGYv8+i4aRqI
         HNLg==
X-Gm-Message-State: AOAM5336W/V6Nzr0bvblnlASigCpUnUnKCOEFN1GOFHlxiKfMSe+howV
        YbSCRUOYowhZL4RfP/3ICeZh3lFbxZ8sOdG72+LX5Q==
X-Google-Smtp-Source: ABdhPJzpyr6l2dZ2J7xBcePLM41BDXcGM1ASNQ0L1Z98BU7Zzps+KqlvxZjeIdUG5ANVErPokhu0osYL2Sy46qHp/D8=
X-Received: by 2002:a05:6638:634:: with SMTP id h20mr16097279jar.14.1623068591470;
 Mon, 07 Jun 2021 05:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210607105122.2047212-1-robert.marko@sartura.hr>
 <20210607105122.2047212-2-robert.marko@sartura.hr> <CAHp75Vfkn-fSJrLFfswzLdZPJwe+x24rntCPO2VKK0RHfN0y=Q@mail.gmail.com>
In-Reply-To: <CAHp75Vfkn-fSJrLFfswzLdZPJwe+x24rntCPO2VKK0RHfN0y=Q@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 7 Jun 2021 14:23:00 +0200
Message-ID: <CA+HBbNH9suWNFgFE8V4SLesF6aHkEOrxVGSRsL9XVU2eorwruQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 7, 2021 at 2:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jun 7, 2021 at 1:51 PM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
> >
> > It is a mix of input only and output only pins.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Couple of small issues below.
> Otherwise looks good!
>
> > ---
> > Changes in v2:
> > * Rewrite to use simple I2C MFD and GPIO regmap
> > * Drop DT bindings for pin numbering
> >
> >  drivers/gpio/Kconfig      | 12 ++++++
> >  drivers/gpio/Makefile     |  1 +
> >  drivers/gpio/gpio-tn48m.c | 89 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 102 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-tn48m.c
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index e3607ec4c2e8..472f7764508e 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1310,6 +1310,18 @@ config GPIO_TIMBERDALE
> >         help
> >         Add support for the GPIO IP in the timberdale FPGA.
> >
> > +config GPIO_TN48M_CPLD
> > +       tristate "Delta Networks TN48M switch CPLD GPIO driver"
> > +       depends on MFD_TN48M_CPLD
> > +       select GPIO_REGMAP
> > +       help
> > +         This enables support for the GPIOs found on the Delta
> > +         Networks TN48M switch CPLD.
> > +         They are used for inputs and outputs on the SFP slots.
> > +
> > +         This driver can also be built as a module. If so, the
> > +         module will be called gpio-tn48m.
> > +
> >  config GPIO_TPS65086
> >         tristate "TI TPS65086 GPO"
> >         depends on MFD_TPS65086
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index c58a90a3c3b1..271fb806475e 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -145,6 +145,7 @@ obj-$(CONFIG_GPIO_TEGRA186)         += gpio-tegra186.o
> >  obj-$(CONFIG_GPIO_TEGRA)               += gpio-tegra.o
> >  obj-$(CONFIG_GPIO_THUNDERX)            += gpio-thunderx.o
> >  obj-$(CONFIG_GPIO_TIMBERDALE)          += gpio-timberdale.o
> > +obj-$(CONFIG_GPIO_TN48M_CPLD)          += gpio-tn48m.o
> >  obj-$(CONFIG_GPIO_TPIC2810)            += gpio-tpic2810.o
> >  obj-$(CONFIG_GPIO_TPS65086)            += gpio-tps65086.o
> >  obj-$(CONFIG_GPIO_TPS65218)            += gpio-tps65218.o
> > diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
> > new file mode 100644
> > index 000000000000..41484c002826
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-tn48m.c
> > @@ -0,0 +1,89 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Delta TN48M CPLD GPIO driver
> > + *
> > + * Copyright 2021 Sartura Ltd
> > + *
> > + * Author: Robert Marko <robert.marko@sartura.hr>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/regmap.h>
>
> > +#include <linux/kernel.h>
>
> What is this header for?

Its not being actually used,
I will drop it.
>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +enum tn48m_gpio_type {
> > +       TN48M_SFP_TX_DISABLE = 1,
> > +       TN48M_SFP_PRESENT,
> > +       TN48M_SFP_LOS,
> > +};
> > +
> > +static int tn48m_gpio_probe(struct platform_device *pdev)
> > +{
> > +       struct gpio_regmap_config config = {0};
> > +       enum tn48m_gpio_type type;
> > +       struct regmap *regmap;
> > +       u32 base;
> > +       int ret;
> > +
> > +       if (!pdev->dev.parent)
> > +               return -ENODEV;
> > +
> > +       type = (uintptr_t)device_get_match_data(&pdev->dev);
> > +       if (!type)
> > +               return -ENODEV;
> > +
> > +       ret = device_property_read_u32(&pdev->dev, "reg", &base);
> > +       if (ret)
>
> > +               return -EINVAL;
>
> return ret;

Will fix this and send v6 in a couple of minutes.

Thanks,
Robert
>
> > +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> > +       if (!regmap)
> > +               return -ENODEV;
> > +
> > +       config.regmap = regmap;
> > +       config.parent = &pdev->dev;
> > +       config.ngpio = 4;
> > +
> > +       switch (type) {
> > +       case TN48M_SFP_TX_DISABLE:
> > +               config.reg_set_base = base;
> > +               break;
> > +       case TN48M_SFP_PRESENT:
> > +               config.reg_dat_base = base;
> > +               break;
> > +       case TN48M_SFP_LOS:
> > +               config.reg_dat_base = base;
> > +               break;
> > +       default:
> > +               dev_err(&pdev->dev, "unknown type %d\n", type);
> > +               return -ENODEV;
> > +       }
> > +
> > +       return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
> > +}
> > +
> > +static const struct of_device_id tn48m_gpio_of_match[] = {
> > +       { .compatible = "delta,tn48m-gpio-sfp-tx-disable", .data = (void *)TN48M_SFP_TX_DISABLE },
> > +       { .compatible = "delta,tn48m-gpio-sfp-present", .data = (void *)TN48M_SFP_PRESENT },
> > +       { .compatible = "delta,tn48m-gpio-sfp-los", .data = (void *)TN48M_SFP_LOS },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, tn48m_gpio_of_match);
> > +
> > +static struct platform_driver tn48m_gpio_driver = {
> > +       .driver = {
> > +               .name = "delta-tn48m-gpio",
> > +               .of_match_table = tn48m_gpio_of_match,
> > +       },
> > +       .probe = tn48m_gpio_probe,
> > +};
> > +module_platform_driver(tn48m_gpio_driver);
> > +
> > +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> > +MODULE_DESCRIPTION("Delta TN48M CPLD GPIO driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.31.1
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
