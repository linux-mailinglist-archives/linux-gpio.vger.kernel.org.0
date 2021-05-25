Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1645439042D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbhEYOnc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233973AbhEYOnc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:43:32 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57DC1C061756
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:42:02 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id y2so43319726ybq.13
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/On+AsJCHChHko3nWc1HB1x+6yZNMWaMGtWubpjuYxQ=;
        b=e9dc4eVS5ccoxh97fAN+RZ3RAXU7J8VLUXII9uwOOqwHWsPer4hR1yZMlAfW6v1ctF
         B1WulueDsL/XDnplT3sDyMvwA3RgX7cHSn2pCYJwUTueHmEIShRDDbNQzJsvAhmZ6qlS
         3+t9ejyDMHhwckKs/J4eaPYKPFumZnWZ+p5Jeh5J9230Zpg+pQA5E5H6ShfnunWmJqfY
         Q57yLIEzsFuCtEBfHJ5V8DVxFYRWJlvMhmX9/s4mwwjZCfjFzd6WlEMQXhAtBCGCktPE
         L96HqhmJQyzLeUsvv+ivEwxnECTeMX8De7Z3rKIAXmH0wX6q+P/7Rnc6zZS48nhYwB4n
         QB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/On+AsJCHChHko3nWc1HB1x+6yZNMWaMGtWubpjuYxQ=;
        b=UvGEUa4VsLJJQmw5cQXEYguBgsOxwZkEaJhGFUzt2VyNaHBqbeFdOh/0Nr2NEQeBSs
         al/vst9yFDxF6xpr8H46Z7SR0KcHiXZ7CMsxeXp2CqPI8onTIq3XrN5rfpEk7Nv4L2aI
         KRLdEkuaL2NmoRwdzCTsNnX58x56NqqFLuwJHsLZcTBSqdGDFVbk5dqhheajBdvjJ5Os
         iL47Ul2SGCGCV7muqbFyaffqFSBJaDTTa4q/4HJ7D3Vjs9sYTP2yN54p/pvktm8gwfnQ
         U/87k30DQnWKCTScVuKeB6T2x40JhBqAqZI7kIubRAA8jssEkRrgxMvpuMgkYpP48L94
         Cb1A==
X-Gm-Message-State: AOAM531DjMGiH3PtBCgAwF2gaajbvaS83CLNtF/87bseHZGxc2kzmkiM
        +5BkH/tVY353ZC1zOWG74ykwq7RSwADlnZ4RPuFZNEkYlRb4Fw==
X-Google-Smtp-Source: ABdhPJyQOMIqjgrhNRoPhtuTH1gXyccJ8MrD4m2LwBAvp2vIUqqzSKdXxJjgQkn38ykLllH8Tm6Xm/f3FF7bCiN8V7A=
X-Received: by 2002:a25:1804:: with SMTP id 4mr9058416yby.157.1621953721597;
 Tue, 25 May 2021 07:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr> <20210524120539.3267145-2-robert.marko@sartura.hr>
In-Reply-To: <20210524120539.3267145-2-robert.marko@sartura.hr>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:41:51 +0200
Message-ID: <CAMpxmJVSnC+OYdA3GZEH2K3Q+ETT_g2p8W3E7gQ1BnN7VgwLLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: Add Delta TN48M CPLD GPIO driver
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, luka.perkov@sartura.hr,
        jmp@epiphyte.org, pmenzel@molgen.mpg.de, buczek@molgen.mpg.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 2:05 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
>
> It is a mix of input only and output only pins.
>
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

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I guess this will go through the MFD tree?

Bart
