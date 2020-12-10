Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A142D5D70
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732232AbgLJOWy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729076AbgLJOWy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:22:54 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64352C0613CF;
        Thu, 10 Dec 2020 06:22:14 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id s21so4192510pfu.13;
        Thu, 10 Dec 2020 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7gvh3enTyM7r16asGFsXp25EQVi9nM03JLF3FLpI4e8=;
        b=g8KiW139pOV2susxo8HdW/YCjk7r0bCJ4v1VqLcaQGdS+kugolJyuTrKNLYE02M5Oy
         hwO0pFh3VRMHS9xsoL4zKAssx6DcQGdsUPQWjDb8Ms2QdI/RaFjWvBMAs3LlajEYLm7B
         E/A2Nm7BKrKcghKE4sxxyC17d2pz3yJPxpj7vgNOtGlyOeLGfWzS+Yh+MQnFrYW4XKPv
         Et7xQ/S87ZeU5xl/3i8CHeYDwkhdvTgBFJG+CL1zBOYmJ35bV5D/W9PFODHWO9hTZGHF
         +ffG/RBD1oTr9lZrJf6/aM81EXYASfnDpjNY7jdq5a4j15se5zsQCeoNQNwtCZaeEsNH
         DC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7gvh3enTyM7r16asGFsXp25EQVi9nM03JLF3FLpI4e8=;
        b=RxNOZ8c2DaW7OAjXAX4uI0VkrK2w73os6XVXydFmlRywHnvJLlXEGAKL7e8unjb/g5
         1dE6LEZsIyjiQM44dxi6imrY0RyKRXnM5OA++HnrI0Z9IRCYahE6NTEBI45yB+xu85Vb
         3qrCcDJ3DLwtSZW8QRF6YlfoVeYluMoIOs95oonsQ9GV+zRyA04+fA78NjCkGWXvIZ8n
         DeLlXDulxdHNGwf8l3R7v9xIv4zkMEZrZ7gy6ijhaXK/nMrW//IgtR6o3Rjv91uL2lWm
         7Wo5qnbc/h5bYVoaMO9KlaxNieApy9mrFE1SXzOO8NKQQgPKfr4diQUR2447fCAPcLBi
         gOQg==
X-Gm-Message-State: AOAM533/AF1mlq4+McGx7acs5oB96QqnR5CHy67AwLd3W0Iqj0AzXF3h
        IJOY8udV9/MmewAvBoxRP03yjADHdCPgsSxCToA=
X-Google-Smtp-Source: ABdhPJxVp8EjIZlO70I74O7fyXpVy6WLFzWzXDg3HsS2ENh9tXjZCbb5x1gDs1oxITNXtrQMaWhjZVC5PijATGv5ts4=
X-Received: by 2002:a63:4002:: with SMTP id n2mr6926113pga.4.1607610133882;
 Thu, 10 Dec 2020 06:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <20201129110803.2461700-4-daniel@0x0f.com>
In-Reply-To: <20201129110803.2461700-4-daniel@0x0f.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Dec 2020 16:23:02 +0200
Message-ID: <CAHp75Vdy9rBgJhyYXjUKapYdeMfsNhbX9Zi3Jtxb4H8H279V-A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     SoC Team <soc@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 29, 2020 at 1:10 PM Daniel Palmer <daniel@0x0f.com> wrote:
>
> This adds a driver that supports the GPIO block found in
> MStar/SigmaStar ARMv7 SoCs.
>
> The controller seems to have enough register for 128 lines
> but where they are wired up differs between chips and
> no currently known chip uses anywhere near 128 lines so there
> needs to be some per-chip data to collect together what lines
> actually have physical pins attached and map the right names to them.
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

> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Perhaps ordered?

...

> +       /*
> +        * only the spi0 pins have interrupts on the parent
> +        * on all of the known chips and so far they are all
> +        * mapped to the same place
> +        */

You have a different comment style here (no capital letter, no period).

> +       if (offset >= OFF_SPI0_CZ && offset <= OFF_SPI0_DO) {

Why not traditional pattern, i.e.

if (...)
  return -EINVAL;
...

?

> +               *parent_type = child_type;
> +               *parent = ((offset - OFF_SPI0_CZ) >> 2) + 28;
> +               return 0;
> +       }
> +
> +       return -EINVAL;

...

> +       ret = devm_gpiochip_add_data(dev, gpiochip, gpio);
> +       return ret;

Purpose?

return devm_...(...);

...

> +static int msc313_gpio_remove(struct platform_device *pdev)
> +{
> +       return 0;
> +}

Purpose?

...

> +static const struct of_device_id msc313_gpio_of_match[] = {

> +#ifdef CONFIG_MACH_INFINITY

What's the point? Are you expecting two drivers for the same IP?

> +       {
> +               .compatible = "mstar,msc313-gpio",
> +               .data = &msc313_data,
> +       },
> +#endif
> +       { }
> +};

...

> +static struct platform_driver msc313_gpio_driver = {
> +       .driver = {
> +               .name = DRIVER_NAME,
> +               .of_match_table = msc313_gpio_of_match,
> +               .pm = &msc313_gpio_ops,
> +       },
> +       .probe = msc313_gpio_probe,
> +       .remove = msc313_gpio_remove,
> +};

> +

Redundant blank line.

> +builtin_platform_driver(msc313_gpio_driver);

-- 
With Best Regards,
Andy Shevchenko
