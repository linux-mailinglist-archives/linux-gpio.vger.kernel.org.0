Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB17293A5D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 13:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393911AbgJTL73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 07:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393854AbgJTL72 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2020 07:59:28 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BF0C061755;
        Tue, 20 Oct 2020 04:59:28 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id e15so1056324pfh.6;
        Tue, 20 Oct 2020 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2G39uyzDlYr7wYhISE9BbPWobKRmjy0rPum9vOydAa0=;
        b=mgC6LjU8DSsFbAQPr0jZutUqOpzb8vX8bkeXuDn66cMYqXMx0EuBwVP4fdnSLKeBSu
         cBFc3sFukkNqVZGHftDowtBM21D0mDYxM0Fr4YXUHxae7Jz6LhtJ7GTelQmV+/vScyV/
         F9xXgo6JBSxQGIkRbxk6V4qngnGZxkdVUVLVuE/hbCulaXzVTAB1M4QTunhclsew9lTA
         /QjQPfQnQKqYjhDHshYjWhx4MseLmMiCNyxzLzFzm7kr1H9dKOyjBuUFYNe1lf9ounox
         iLtD/+6GxSTYuAbuT1NZDxyK5RQN6ubj2a+4rD5YdDnuz7HHULj5aNBK09k8PIcfppAw
         sPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2G39uyzDlYr7wYhISE9BbPWobKRmjy0rPum9vOydAa0=;
        b=hVZsqfTmW3TBpVpa/zTWfNQeIk/Gk6kIGZfnHeVzl+twR93CPK+uEgLC/uwk7w4Ldo
         B+D1MEeFMDavDwj/tGpD0PoxeuWaucW7zzzAxJrCzjJRqXff3xV8KSZx1ypII0zDh2fV
         2M5aRhpdmlc9Ezbq3XH7x7+Jfi6ax7KL7lRFdL/wxiCs/i8MC/FJC806/Ps3S+EiU71x
         0XAMfrEzZImbEazQ8WgfvWKpQSza8Fyc/Gx1yERWY92xGVTW9OUiua8E5WDFUOOVMaWG
         6eC4oCLEmKROf1Iib+3jOnZIUoZ/+ziinpmVy7hBNWREOIrs07OYSOUVG70FFS+kWWkQ
         K5Kg==
X-Gm-Message-State: AOAM533Kbb8QbWnSXN0AOiV21fPDiAhbQESlf8zB66nK3i2p1Iayxvvn
        uWtjsjMPXVS90B967dogum+cxGLVU/3lOdPWk+cjNmcpvq021XGT
X-Google-Smtp-Source: ABdhPJzKAFhbTyFBSVI5GzFfezctKXEOPINvEBjVDs3F+C9oFP1ZbeeR0tat6x4qjSbZK2cXf0I3c5FMA8gBrO1mdU4=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr2319787pfd.7.1603195167974; Tue, 20 Oct
 2020 04:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201019141008.871177-1-daniel@0x0f.com> <20201019141008.871177-4-daniel@0x0f.com>
In-Reply-To: <20201019141008.871177-4-daniel@0x0f.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 20 Oct 2020 15:00:17 +0300
Message-ID: <CAHp75Vf5iUzKp32CqBbv_5MRo8q8CyBPsBcgzKsww6BFtGJwUA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 5:11 PM Daniel Palmer <daniel@0x0f.com> wrote:
>
> This adds a driver that supports the GPIO block found in
> MStar/SigmaStar ARMv7 SoCs.
>
> The controller seems to support 128 lines but where they
> are wired up differs between chips and no currently known
> chip uses anywhere near 128 lines so there needs to be some
> per-chip data to collect together what lines actually have
> physical pins attached and map the right names to them.
>
> The core peripherals seem to use the same lines on the
> currently known chips but the lines used for the sensor
> interface, lcd controller etc pins seem to be totally
> different between the infinity and mercury chips
>
> The code tries to collect all of the re-usable names,
> offsets etc together so that it's easy to build the extra
> per-chip data for other chips in the future.
>
> So far this only supports the MSC313 and MSC313E chips.
>
> Support for the SSC8336N (mercury5) is trivial to add once
> all of the lines have been mapped out.

...

> +config GPIO_MSC313
> +       bool "MStar MSC313 GPIO support"

Why boolean?

> +       default y if ARCH_MSTARV7

Simply
       default ARCH_MSTARV7
should work as well.

Are you planning to extend this to other boards?

> +       depends on ARCH_MSTARV7
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say Y here to support GPIO on MStar MSC313 and later SoCs.

Please, be more specific. Also it's recommended to have a module name
to be included (but let's understand first why it's not a module)

...

> +/*
> + * Copyright (C) 2020 Daniel Palmer<daniel@thingy.jp>
> + */

One line.

...

> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/gpio/driver.h>

I believe this should be reworked.
For example, it misses mod_devicetable.h, bits.h, io.h, types.h, etc, but has

...

> +/* These bits need to be saved to correctly restore the
> + * gpio state when resuming from suspend to memory.
> + */

/*
 * For this subsystem the comment style for multi-line
 * like this.
 */

...

> +#ifdef CONFIG_MACH_INFINITY

Does it make any sense?

> +#endif

...

> +       return readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset])
> +                       & MSC313_GPIO_IN;

Usual pattern is to leave operators on the previous line.

...

> +static struct irq_chip msc313_gpio_irqchip = {
> +       .name = "GPIO",

Is this name good enough?

> +       .irq_eoi = irq_chip_eoi_parent,
> +       .irq_mask = irq_chip_mask_parent,
> +       .irq_unmask = irq_chip_unmask_parent,
> +       .irq_set_type = irq_chip_set_type_parent,
> +};

...

> +static int msc313e_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
> +                                            unsigned int child,
> +                                            unsigned int child_type,
> +                                            unsigned int *parent,
> +                                            unsigned int *parent_type)
> +{
> +       struct msc313_gpio *priv = gpiochip_get_data(chip);
> +       unsigned int offset = priv->gpio_data->offsets[child];
> +       int ret = -EINVAL;
> +
> +       /* only the spi0 pins have interrupts on the parent
> +        * on all of the known chips and so far they are all
> +        * mapped to the same place
> +        */

Comment style!

> +       if (offset >= OFF_SPI0_CZ && offset <= OFF_SPI0_DO) {
> +               *parent_type = child_type;
> +               *parent = ((offset - OFF_SPI0_CZ) >> 2) + 28;
> +               ret = 0;
> +       }
> +
> +       return ret;

Oh, can, for a starter, we use a regular (not-so-twisted) pattern

  if (...)
    return -EINVAL;
  ...
  return 0;

?

> +}

...

> +       gpio->saved = devm_kzalloc(&pdev->dev, gpio->gpio_data->num * sizeof(*gpio->saved), GFP_KERNEL);

devm_kcalloc()

> +       if (!gpio->saved)
> +               return -ENOMEM;

...

> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       gpio->base = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource()

> +       if (IS_ERR(gpio->base))
> +               return PTR_ERR(gpio->base);

...

> +       gpiochip->label = DRIVER_NAME;

Not good. When you use user space how do you distinguish if more than
one chip appears in the system?

...

> +       ret = gpiochip_add_data(gpiochip, gpio);
> +       return ret;

return ...(...);

Why not devm_gpiochip_add_data() ?

...

> +static const struct of_device_id msc313_gpio_of_match[] = {

> +#ifdef CONFIG_MACH_INFINITY

To me this makes no sense.

> +       {
> +               .compatible = "mstar,msc313-gpio",
> +               .data = &msc313_data,
> +       },
> +#endif
> +       { }
> +};

...

> +/* The GPIO controller loses the state of the registers when the
> + * SoC goes into suspend to memory mode so we need to save some
> + * of the register bits before suspending and put it back when resuming
> + */

Comment style!

> +

Redundant blank line.

...

> +static int __maybe_unused msc313_gpio_resume(struct device *dev)
> +{

> +}

> +

Redundant blank line.

> +static SIMPLE_DEV_PM_OPS(msc313_gpio_ops, msc313_gpio_suspend, msc313_gpio_resume);

...

> +static struct platform_driver msc313_gpio_driver = {
> +       .driver = {
> +               .name = DRIVER_NAME,
> +               .of_match_table = msc313_gpio_of_match,
> +               .pm = &msc313_gpio_ops,

You still allow to unbind.

> +       },
> +       .probe = msc313_gpio_probe,
> +};

> +

Redundant blank line.

> +builtin_platform_driver(msc313_gpio_driver);

Why?

-- 
With Best Regards,
Andy Shevchenko
