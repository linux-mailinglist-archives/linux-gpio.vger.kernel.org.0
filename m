Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7A1439262
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 11:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhJYJct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 05:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhJYJct (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 05:32:49 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2605AC061745;
        Mon, 25 Oct 2021 02:30:27 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r4so15467990edi.5;
        Mon, 25 Oct 2021 02:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R53YJWQNI9IrUHz73mWYVhGKNa735wgVP438s+PtWxs=;
        b=jPCGpbicayls4H5kUw4y6Hs15D8wGMin5NHOYMWbkwZ/LEax+66T53dK8k1z78IoGU
         Vk8R6PGrjmAQMErCzUvVoUlOLse3dkwXLnZ+spaEb68bFf4T7IHO1TItvbszI57wcNc8
         4UoJ4lNHoOxibZuguAbbS5m7GpzLbn53cOcs60nzSXfV9bzmr7YX0YJ9Dbli5XOnLUDN
         eoPctSHWz35fghoxIxm2Jhs4LbG8AdCFIzVXqSxn4Fz3qWJGsEH+ucl6DUzoobi78Wj/
         TC1k+lqjSQJnn0/itD/oMUAyhnAz1B8ShsZl0yLAtn+NkOEUqy+C7lsrNnLg12pBVCbI
         0kQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R53YJWQNI9IrUHz73mWYVhGKNa735wgVP438s+PtWxs=;
        b=48MAduo/fVyefACjGxV2zbrXBIF7gZrHiChwPN8PWvT77v2MCBGb9jx3/uJ+TCevMh
         I4p9t/ZTO0CQa0uWWLbP0XJTMzlbeMD15xUky07US7CpeTS+TmTlv3ZT6115zbmBX3mt
         qyIxFdaVlLrWHvyD0mw/9fMdLw6h8sLQ4vrzje1KgRpD6D0I6JWC4YZhCioY+XfmP8o4
         ih/wf60lDOHRoDTwQBV4jVqC4GaIJMoRyh0QB0wDuo6X+AelwIsWwZ4/32GinvgznEFZ
         XpttUQqiuXZqC2aqfvo7YT8D3SYcZ5ZxlN8ArMnZEFbPt5r7gkDLapfVJxaY7WIphQ8d
         i7BA==
X-Gm-Message-State: AOAM530mEzaxijuz0jgl/aS/KXG/z34cNEHK4Muo0T/kqG9BYvC/FDvN
        wFJctQuGxXL3PavjoSl8CllqOwAsi/8M346SzaPqrY8XyNFWyQ==
X-Google-Smtp-Source: ABdhPJzXNLxBSwki7Oi6LnTmuIefzuaPLe/WNB+tRN7m+6fGxr/N2g/J3xAcfPapKG0Du8ngT1WOznZ3+29X9o59/oE=
X-Received: by 2002:a17:906:9f21:: with SMTP id fy33mr12216320ejc.567.1635154225528;
 Mon, 25 Oct 2021 02:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20211019200831.3817-1-maukka@ext.kapsi.fi> <20211019200831.3817-3-maukka@ext.kapsi.fi>
In-Reply-To: <20211019200831.3817-3-maukka@ext.kapsi.fi>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 12:29:31 +0300
Message-ID: <CAHp75VfKcS1eRRBypjkQG2D3QiFHOae9Ub1VcT=Mopt2wDAztg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] gpio: gpio-cascade: add generic GPIO cascade
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 11:10 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>
> Adds support for building cascades of GPIO lines. That is, it allows
> setups when there is one upstream line and multiple cascaded lines, out
> of which one can be chosen at a time. The status of the upstream line
> can be conveyed to the selected cascaded line or, vice versa, the status
> of the cascaded line can be conveyed to the upstream line.
>
> A multiplexer is being used to select, which cascaded GPIO line is being
> used at any given time.
>
> At the moment only input direction is supported. In future it should be
> possible to add support for output direction, too.

A nit-pick below and you may have my
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> ---
> v6 -> v7:
>  - In Kconfig add info about module name
>  - adhere to new convention that allows lines longer than 80 chars
>  - use dev_probe_err with upstream gpio line too
>  - refactor for cleaner exit of probe function.
> v5 -> v6:
>  - In Kconfig, remove dependency to OF_GPIO and select only MULTIPLEXER
>  - refactor code preferring one-liners
>  - clean up prints, removing them from success-path.
>  - don't explicitly set gpio_chip.of_node as it's done in the GPIO library
>  - use devm_gpiochip_add_data instead of gpiochip_add
> v4 -> v5:
>  - renamed gpio-mux-input -> gpio-cascade. refactored code accordingly
>    here and there and changed to use new bindings and compatible string
>    - ambigious and vague 'pin' was rename to 'upstream_line'
>  - dropped Tested-by and Reviewed-by due to changes in bindings
>  - dropped Reported-by suggested by an automatic bot as it was not really
>    appropriate to begin with
>  - functionally it's the same as v4
> v3 -> v4:
>  - Changed author email
>  - Included Tested-by and Reviewed-by from Drew
> v2 -> v3:
>  - use managed device resources
>  - update Kconfig description
> v1 -> v2:
>  - removed .owner from platform_driver as per test bot's instruction
>  - added MODULE_AUTHOR, MODULE_DESCRIPTION, MODULE_LICENSE
>  - added gpio_mux_input_get_direction as it's recommended for all chips
>  - removed because this is input only chip: gpio_mux_input_set_value
>  - removed because they are not needed for input/output only chips:
>      gpio_mux_input_direction_input
>      gpio_mux_input_direction_output
>  - fixed typo in an error message
>  - added info message about successful registration
>  - removed can_sleep flag as this does not sleep while getting GPIO value
>    like I2C or SPI do
>  - Updated description in Kconfig
> ---
>  drivers/gpio/Kconfig        |  15 +++++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-cascade.c | 118 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 drivers/gpio/gpio-cascade.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 37a6f77c86fe..e69457144459 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1694,4 +1694,19 @@ config GPIO_VIRTIO
>
>  endmenu
>
> +comment "Other GPIO expanders"
> +
> +config GPIO_CASCADE
> +       tristate "General GPIO cascade"
> +       select MULTIPLEXER
> +       help
> +         Say yes here to enable support for generic GPIO cascade.
> +
> +         This allows building one-to-many cascades of GPIO lines using
> +         different types of multiplexers readily available. At the
> +         moment only input lines are supported.
> +
> +         To build the driver as a module choose 'm' and the resulting module
> +         will be called 'gpio-cascade'.
> +
>  endif
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 71ee9fc2ff83..e8945456e7ea 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_GPIO_BD9571MWV)          += gpio-bd9571mwv.o
>  obj-$(CONFIG_GPIO_BRCMSTB)             += gpio-brcmstb.o
>  obj-$(CONFIG_GPIO_BT8XX)               += gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_CADENCE)             += gpio-cadence.o
> +obj-$(CONFIG_GPIO_CASCADE)             += gpio-cascade.o
>  obj-$(CONFIG_GPIO_CLPS711X)            += gpio-clps711x.o
>  obj-$(CONFIG_GPIO_SNPS_CREG)           += gpio-creg-snps.o
>  obj-$(CONFIG_GPIO_CRYSTAL_COVE)                += gpio-crystalcove.o
> diff --git a/drivers/gpio/gpio-cascade.c b/drivers/gpio/gpio-cascade.c
> new file mode 100644
> index 000000000000..82001299265e
> --- /dev/null
> +++ b/drivers/gpio/gpio-cascade.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  A generic GPIO cascade driver
> + *
> + *  Copyright (C) 2021 Mauri Sandberg <maukka@ext.kapsi.fi>
> + *
> + * This allows building cascades of GPIO lines in a manner illustrated
> + * below:
> + *
> + *                 /|---- Cascaded GPIO line 0
> + *  Upstream      | |---- Cascaded GPIO line 1
> + *  GPIO line ----+ | .
> + *                | | .
> + *                 \|---- Cascaded GPIO line n
> + *
> + * A gpio-mux is being used to select, which cascaded line is being
> + * addressed at any given time.
> + *
> + * At the moment only input mode is supported due to lack of means for
> + * testing output functionality. At least theoretically output should be
> + * possible with an open drain constructions.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/mux/consumer.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +
> +struct gpio_cascade {

> +       struct device           *parent;
> +       struct gpio_chip        gpio_chip;

Make the gpio_chip first and any container_of become a no-op at compile time!

> +       struct mux_control      *mux_control;
> +       struct gpio_desc        *upstream_line;
> +};
> +
> +static struct gpio_cascade *chip_to_cascade(struct gpio_chip *gc)
> +{
> +       return container_of(gc, struct gpio_cascade, gpio_chip);
> +}
> +
> +static int gpio_cascade_get_direction(struct gpio_chip *gc,
> +                                       unsigned int offset)
> +{
> +       return GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static int gpio_cascade_get_value(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct gpio_cascade *cas = chip_to_cascade(gc);
> +       int ret;
> +
> +       ret = mux_control_select(cas->mux_control, offset);
> +       if (ret)
> +               return ret;
> +
> +       ret = gpiod_get_value(cas->upstream_line);
> +       mux_control_deselect(cas->mux_control);
> +       return ret;
> +}
> +
> +static int gpio_cascade_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct gpio_cascade *cas;
> +       struct mux_control *mc;
> +       struct gpio_desc *upstream;
> +       struct gpio_chip *gc;
> +
> +       cas = devm_kzalloc(dev, sizeof(*cas), GFP_KERNEL);
> +       if (!cas)
> +               return -ENOMEM;
> +
> +       mc = devm_mux_control_get(dev, NULL);
> +       if (IS_ERR(mc))
> +               return dev_err_probe(dev, PTR_ERR(mc), "unable to get mux-control\n");
> +
> +       cas->mux_control = mc;
> +       upstream = devm_gpiod_get(dev, "upstream",  GPIOD_IN);
> +       if (IS_ERR(upstream))
> +               return dev_err_probe(dev, PTR_ERR(upstream), "unable to claim upstream GPIO line\n");
> +
> +       cas->upstream_line = upstream;
> +       cas->parent = dev;
> +
> +       gc = &cas->gpio_chip;
> +       gc->get = gpio_cascade_get_value;
> +       gc->get_direction = gpio_cascade_get_direction;
> +       gc->base = -1;
> +       gc->ngpio = mux_control_states(mc);
> +       gc->label = dev_name(cas->parent);
> +       gc->parent = cas->parent;
> +       gc->owner = THIS_MODULE;
> +
> +       platform_set_drvdata(pdev, cas);
> +       return devm_gpiochip_add_data(dev, &cas->gpio_chip, NULL);
> +}
> +
> +static const struct of_device_id gpio_cascade_id[] = {
> +       { .compatible = "gpio-cascade" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, gpio_cascade_id);
> +
> +static struct platform_driver gpio_cascade_driver = {
> +       .driver = {
> +               .name           = "gpio-cascade",
> +               .of_match_table = gpio_cascade_id,
> +       },
> +       .probe  = gpio_cascade_probe,
> +};
> +module_platform_driver(gpio_cascade_driver);
> +
> +MODULE_AUTHOR("Mauri Sandberg <maukka@ext.kapsi.fi>");
> +MODULE_DESCRIPTION("Generic GPIO cascade");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
