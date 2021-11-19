Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432444577C0
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 21:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhKSUdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 15:33:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235285AbhKSUdc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Nov 2021 15:33:32 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9300EC06173E
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 12:30:29 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id k21so14337012ioh.4
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 12:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAUhIBP078fnIpfNsctFVU/hIbI+oiA9NYL1Zz+yQsw=;
        b=GxclxbCO0fuX0oi91XcP3Pl1KNE+8CRC8A4FL2DIUPEaKiGU1P2NA3jBFHTEK7zXWK
         iijmezPGMjyeTZSKEgNGokRdBN45M49o2N2nYj5UXX+0wKrBgb7K8cNvxVug//mKGeaN
         L4fkvewxJcwrSOlHd/LbR2THiPKofb0h5v7aSi1kvL1CbAmHRg+xX4m0DwvS5kn5gk8C
         3h4R6VFMUDtSt7g+lLpQ15VlsMzy338u/CSK7q06PhO6Mjj/4ZIDh6sM7PfQ28z/eo1U
         jMdlesLRXwS233sVBK1P/V7MPeojsMiLEiZ+4VJ40knz0/G88/+5wWow86l1Df/D7awn
         0Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAUhIBP078fnIpfNsctFVU/hIbI+oiA9NYL1Zz+yQsw=;
        b=Rc5CFCxAoxWs8mAwR4nYpxxWGlLcb4GJaTy9EGDPSNDnc77NBInchlBj6PtPlQLnEf
         N8/t1T/a925qxyuUjQKo7qJ9s6J2ney8vwTmgUAwZvh0o8o/x1tFFkP6LjCPzp9YSUBQ
         uGwNFoNS4hkCiq7xnT/ubAEwBpaG6tbmVMLkzzlLj9g//nGZoV/lFnxXdtri76YcpLcO
         7INwov0cb41k0sI+1zo56ixWe/G1pkXisJahjsCHvyEDYomMjGe6tsow0v90LGQLm/ck
         pT70MT7LQvRCJYXPgKaoUMSESqwI15qogWqLK3k84gJ1zKwOXBQiD4CwBLzm04GwzvPL
         KwKg==
X-Gm-Message-State: AOAM531+EdEO/0sylgJJRGMRz83CuLVsi9h25x9xb+WqM6i1qkAMZtg5
        AsLFfPvigoQldDPD+e1Evli0Lzxp7lG1i8D4KlQMNQ==
X-Google-Smtp-Source: ABdhPJyXZBD0JDC6Qq4qjwy7plo96K5M0kw0/AhMvJlvY+btEXI4JX4JkpMfWsC5rzTMkivw/gUPe7i64OcLM0Xin60=
X-Received: by 2002:a5d:994f:: with SMTP id v15mr7909635ios.88.1637353828625;
 Fri, 19 Nov 2021 12:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20211109113239.93493-1-robert.marko@sartura.hr> <20211109113239.93493-2-robert.marko@sartura.hr>
In-Reply-To: <20211109113239.93493-2-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 19 Nov 2021 21:30:18 +0100
Message-ID: <CA+HBbNFyrLTxuSf8Wt0D5eK5YAW3AK2U_u0uB_2EWyHWrSfR-A@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>
Cc:     Luka Perkov <luka.perkov@sartura.hr>,
        Bruno Banelli <bruno.banelli@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 12:32 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
> expander.
>
> The CPLD provides 12 pins in total on the TN48M, but on more advanced
> switch models it provides up to 192 pins, so the driver is extendable
> to support more switches.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> ---
> Changes in v9:
> * Use {} instead of {0} for initialising the regmap config per Andys
> comment
> * Fix spelling mistake in KConfig
>
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
> index fab571016adf..8f7dd207bd16 100644
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
> +         they are input-only or output-only type.
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
> index 000000000000..cd4a80b22794
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
> +       struct gpio_regmap_config config = {};
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

Bartosz and Linus,
do you have any comments on the patch series?

I would like to start working on support for the more complex switch models
so that we finally have some L3 switches with upstream support.

Regards,
Robert
-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
