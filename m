Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0CD31879E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 11:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhBKKAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 05:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbhBKJ61 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 04:58:27 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DF3C061574
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 01:57:46 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id p20so9118115ejb.6
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 01:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIqYHGlJLrTIm7p5vVOsw9X0+y09tyOklgLAYqgfA6I=;
        b=WUEpTJ9D8DpxHhl5r4uQFL+jdtHXnzMN0Ilg9hrAI5XLnuccAUUT6Lu+g+9fKADLmq
         ypSnjXl7taT73JPt1dJSDZK/cEFlq9Nbxhn87TX6FsxYMTN9iiuwmrqnez9rFAHwE7j6
         aXmF61yzyyjHwMqfkBJ+t05t8d+8Pd4zQCkLeL+e2u7EEBI6oZU4r59rUmA1f6uvEGJF
         zcVMKJbFVXJigmcOVAo5UBs523jl0cYVS6UjQBkO68h038LFXiBGYZa2ozesPGqsXqI6
         Rf2rv2ir5ZUqGAEVIahbm5lRb7BeX9Go+5y3lYMEDKxTz5tnK8AsWgKGz+peydAw9woa
         ShKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIqYHGlJLrTIm7p5vVOsw9X0+y09tyOklgLAYqgfA6I=;
        b=pAOCc6VX/Mlp315/zbJzM12LL/f/JKQumE8UElF7oKk/irAcTocGJ5jUKtPLFC2IAx
         wCWMbHMD5yGQ3ER5tlonHLUdNB8G7XGhpPe0u6LGkAIbXiUncTFMXS+qY7dkRwpYvPsN
         r8yAMcYPt2J22tAHulq9UOP5s9sf+LFz5W7ud8OaizMpDIkcmMV5NtJn9YVwLxcAhqX7
         jHrqKZuO/ckDdx9wt61KeJNbJJSwBNF1igvyxaDQGc4c+ZExjGfMlY3z+tXVAg6lxqWZ
         XsluHr9C9Ddxh1G/rHJa5Uzzg3J6aCJl1focEFGm2hOQEs4l0X4m6Z86CBwzCPXQQLz1
         gT1g==
X-Gm-Message-State: AOAM533hCp/sMaEy4IJbWG92RSLZ1z7i4hM2Domd/oVph53fFtsWrLla
        w8yfA8Wr39K2dYJHgMb+LSd/hFIuDvTAQF2qT4Thew==
X-Google-Smtp-Source: ABdhPJx2pTO4USpUfRR02212letWnFzySzsj9FFAnYoNY64dPlUq3O/Djt7hdh9IbxSXbgmAI1nKJM1el2XUJTuJjIg=
X-Received: by 2002:a17:906:3105:: with SMTP id 5mr7859252ejx.168.1613037465341;
 Thu, 11 Feb 2021 01:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net> <20210208222203.22335-8-info@metux.net>
In-Reply-To: <20210208222203.22335-8-info@metux.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 11 Feb 2021 10:57:34 +0100
Message-ID: <CAMpxmJVO79q7aZPPwsCn1eZWiyRBpH-HQsgXFv-0Hq_YcPg_Og@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] gpio: amd-fch: add oftree probing support
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2021 at 11:22 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Add support for probing via device tree.
> ---
>  drivers/gpio/gpio-amd-fch.c                     | 58 +++++++++++++++++++++++++
>  include/dt-bindings/gpio/amd-fch-gpio.h         | 36 +++++++++++++++
>  include/linux/platform_data/gpio/gpio-amd-fch.h | 24 ++--------
>  3 files changed, 98 insertions(+), 20 deletions(-)
>  create mode 100644 include/dt-bindings/gpio/amd-fch-gpio.h
>
> diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
> index 2a21354ed6a0..32024f99dae5 100644
> --- a/drivers/gpio/gpio-amd-fch.c
> +++ b/drivers/gpio/gpio-amd-fch.c
> @@ -136,12 +136,61 @@ static int amd_fch_gpio_request(struct gpio_chip *chip,
>         return 0;
>  }
>
> +static struct amd_fch_gpio_pdata *load_pdata(struct device *dev)

Please stick to the amd_fch_ prefix to all symbols for consistency.

> +{
> +       struct amd_fch_gpio_pdata *pdata;
> +       int ret;
> +
> +       pdata = devm_kzalloc(dev, sizeof(struct amd_fch_gpio_pdata),
> +                            GFP_KERNEL);
> +       if (!pdata)
> +               goto nomem;
> +
> +       pdata->gpio_num = of_property_count_elems_of_size(dev->of_node,
> +                                                         "gpio-regs",
> +                                                         sizeof(u32));
> +       pdata->gpio_reg = devm_kzalloc(dev, sizeof(int)*pdata->gpio_num,
> +                                      GFP_KERNEL);
> +       if (!pdata->gpio_reg)
> +               goto nomem;
> +
> +       pdata->gpio_names = devm_kzalloc(dev, sizeof(char*)*pdata->gpio_num,
> +                                        GFP_KERNEL);
> +       if (!pdata->gpio_names)
> +               goto nomem;
> +
> +       ret = of_property_read_variable_u32_array(dev->of_node, "gpio-regs",
> +                                                 pdata->gpio_reg,
> +                                                 pdata->gpio_num,
> +                                                 pdata->gpio_num);
> +       if (ret != pdata->gpio_num) {
> +               dev_err(dev, "failed reading gpio-regs from DT: %d\n", ret);
> +               return NULL;
> +       }
> +
> +       ret = of_property_read_string_array(dev->of_node, "gpio-line-names",
> +                                           pdata->gpio_names, pdata->gpio_num);
> +       if (ret != pdata->gpio_num) {
> +               dev_err(dev, "failed reading gpio-names from DT: %d\n", ret);
> +               return NULL;
> +       }

Since you're not iterating over DT nodes nor use any interfaces
specific to OF - I suggest you use the generic device properties to
load the fill the platform data.

> +
> +       return pdata;
> +
> +nomem:
> +       dev_err(dev, "load_pdata: failed allocating memory\n");
> +       return NULL;
> +}
> +
>  static int amd_fch_gpio_probe(struct platform_device *pdev)
>  {
>         struct amd_fch_gpio_priv *priv;
>         struct amd_fch_gpio_pdata *pdata;
>
>         pdata = dev_get_platdata(&pdev->dev);
> +       if (!pdata)
> +               pdata = load_pdata(&pdev->dev);
> +
>         if (!pdata) {
>                 dev_err(&pdev->dev, "no platform_data\n");
>                 return -ENOENT;
> @@ -165,6 +214,9 @@ static int amd_fch_gpio_probe(struct platform_device *pdev)
>         priv->gc.get_direction          = amd_fch_gpio_get_direction;
>         priv->gc.get                    = amd_fch_gpio_get;
>         priv->gc.set                    = amd_fch_gpio_set;
> +#ifdef CONFIG_OF_GPIO
> +       priv->gc.of_node                = pdev->dev.of_node;
> +#endif
>
>         spin_lock_init(&priv->lock);
>
> @@ -177,9 +229,15 @@ static int amd_fch_gpio_probe(struct platform_device *pdev)
>         return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
>  }
>
> +static const struct of_device_id amd_fch_gpio_of_match[] = {
> +       { .compatible = "amd,fch-gpio" },
> +       {}
> +};

Don't you need the module table?

> +
>  static struct platform_driver amd_fch_gpio_driver = {
>         .driver = {
>                 .name = AMD_FCH_GPIO_DRIVER_NAME,
> +               .of_match_table = amd_fch_gpio_of_match,
>         },
>         .probe = amd_fch_gpio_probe,
>  };
> diff --git a/include/dt-bindings/gpio/amd-fch-gpio.h b/include/dt-bindings/gpio/amd-fch-gpio.h
> new file mode 100644
> index 000000000000..7a47e6debcdb
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amd-fch-gpio.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +/*
> + * AMD FCH gpio platform data definitions
> + *
> + * Copyright (C) 2020 metux IT consult
> + * Author: Enrico Weigelt <info@metux.net>
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_GPIO_AMD_FCH_REGS_H
> +#define __DT_BINDINGS_GPIO_AMD_FCH_REGS_H
> +
> +/*
> + * gpio registers addresses
> + *
> + * these regs need to be assigned by board setup, since they're wired
> + * in very board specifici was, rarely documented, this should not be
> + * available to users.
> + */
> +#define AMD_FCH_GPIO_REG_GPIO49                0x40
> +#define AMD_FCH_GPIO_REG_GPIO50                0x41
> +#define AMD_FCH_GPIO_REG_GPIO51                0x42
> +#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0        0x43
> +#define AMD_FCH_GPIO_REG_GPIO57                0x44
> +#define AMD_FCH_GPIO_REG_GPIO58                0x45
> +#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1        0x46
> +#define AMD_FCH_GPIO_REG_GPIO64                0x47
> +#define AMD_FCH_GPIO_REG_GPIO68                0x48
> +#define AMD_FCH_GPIO_REG_GPIO66_SPKR   0x5B
> +#define AMD_FCH_GPIO_REG_GPIO71                0x4D
> +#define AMD_FCH_GPIO_REG_GPIO32_GE1    0x59
> +#define AMD_FCH_GPIO_REG_GPIO33_GE2    0x5A
> +#define AMT_FCH_GPIO_REG_GEVT22                0x09
> +
> +#endif /* __DT_BINDINGS_GPIO_AMD_FCH_REGS_H */
> diff --git a/include/linux/platform_data/gpio/gpio-amd-fch.h b/include/linux/platform_data/gpio/gpio-amd-fch.h
> index 255d51c9d36d..336f7387e82c 100644
> --- a/include/linux/platform_data/gpio/gpio-amd-fch.h
> +++ b/include/linux/platform_data/gpio/gpio-amd-fch.h
> @@ -11,25 +11,9 @@
>  #ifndef __LINUX_PLATFORM_DATA_GPIO_AMD_FCH_H
>  #define __LINUX_PLATFORM_DATA_GPIO_AMD_FCH_H
>
> -#define AMD_FCH_GPIO_DRIVER_NAME "gpio_amd_fch"
> +#include <dt-bindings/gpio/amd-fch-gpio.h>
>
> -/*
> - * gpio register index definitions
> - */
> -#define AMD_FCH_GPIO_REG_GPIO49                0x40
> -#define AMD_FCH_GPIO_REG_GPIO50                0x41
> -#define AMD_FCH_GPIO_REG_GPIO51                0x42
> -#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0        0x43
> -#define AMD_FCH_GPIO_REG_GPIO57                0x44
> -#define AMD_FCH_GPIO_REG_GPIO58                0x45
> -#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1        0x46
> -#define AMD_FCH_GPIO_REG_GPIO64                0x47
> -#define AMD_FCH_GPIO_REG_GPIO68                0x48
> -#define AMD_FCH_GPIO_REG_GPIO66_SPKR   0x5B
> -#define AMD_FCH_GPIO_REG_GPIO71                0x4D
> -#define AMD_FCH_GPIO_REG_GPIO32_GE1    0x59
> -#define AMD_FCH_GPIO_REG_GPIO33_GE2    0x5A
> -#define AMT_FCH_GPIO_REG_GEVT22                0x09
> +#define AMD_FCH_GPIO_DRIVER_NAME "gpio_amd_fch"
>
>  /*
>   * struct amd_fch_gpio_pdata - GPIO chip platform data
> @@ -39,8 +23,8 @@
>   */
>  struct amd_fch_gpio_pdata {
>         int                     gpio_num;
> -       int                     *gpio_reg;
> -       const char * const      *gpio_names;
> +       u32                     *gpio_reg;
> +       const char *            *gpio_names;
>  };
>
>  #endif /* __LINUX_PLATFORM_DATA_GPIO_AMD_FCH_H */
> --
> 2.11.0
>

Bartosz
