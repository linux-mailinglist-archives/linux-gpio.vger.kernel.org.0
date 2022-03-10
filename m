Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4F44D431E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Mar 2022 10:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240649AbiCJJID (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Mar 2022 04:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240719AbiCJJH6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2022 04:07:58 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04C7137768
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 01:06:57 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id gb39so10591760ejc.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 01:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opuWC7CW/tv251p5ZaRVuqD3hhAUP7lnkXVZsuoANT8=;
        b=U8IWFnXp3c1DjFEPD0zBgD/mAjFY4y1MmJmTQtALR+bEzPYK104Q9LLOsR08FXUlwv
         MdIiwA+2BNGg6Uhfm56l/IEb0Xp9nE+sWUWn3sUsN+vKxA0dndOA9edwQJ6m+jY4+846
         suUSG4AXLsgDjVtRebAJPab1kP6+EMKo5TnGEoHop/q/u2DckMDeRfuXkXTFeLbMSMXb
         k3b4tGyDbR+P0o4n3a72vayhsoNQOnI46Dqzhcebvn99lLe2JCLKvVuU9WzvhaX1K4Ft
         1aynUXZU4itAMzxkAWH8h75MtpKYsl7BUEsR62k0yJL4Cccj4a7Ui+bxG0YVS+Byfs5e
         INiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opuWC7CW/tv251p5ZaRVuqD3hhAUP7lnkXVZsuoANT8=;
        b=f2H6SL65fLVv5wxrsL1Be/4XVovX3ZW/6NmaWxZu14q6j2OM3zVjOw1Il5qjWpcisp
         Hy8qx2j/++tASHndJmis63fma2TQD/UkT3/hVrqgzGThBESfu9qngFNYwgCp7QHxqmZC
         7gbPJIYICHnh9b/9iJRT8GXnJwB03HqyxJAc5lZDY1q58oXYfkroOmBPL/OBru7sDKMo
         QWfgiV5z5Vx1x8ddkgEMyTBX8dn+t8xE+GZvNvBL7+KYLxHsZBYzkhBnAGgVqwp2lzTI
         E9AFvGtZ4iqmXWN+wupzxrYkUM30JxO5Mwjnft+JxSaQB8G3c4IDr+5bm9AgVSzRqBEw
         AAOg==
X-Gm-Message-State: AOAM532/xV0aWCUhGaQi7broHANPrZ5wuPZedkUopH5QlEdt1P8uBJgC
        ZGyTJSeepN8/t84VF1AWIQJynOEecu40gd8O/zY+xw==
X-Google-Smtp-Source: ABdhPJztDbK+XFnIiOY8fGHFQMiD117FOmTN0qLqZTdbdWraqGbYiUKosJWnn5Bit7sFetZAr3L73DhdAYQ4ZRXma4w=
X-Received: by 2002:a17:907:728b:b0:6da:97db:b66d with SMTP id
 dt11-20020a170907728b00b006da97dbb66dmr3277777ejc.636.1646903216312; Thu, 10
 Mar 2022 01:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20220310011617.29660-1-kris@embeddedTS.com> <20220310011617.29660-2-kris@embeddedTS.com>
In-Reply-To: <20220310011617.29660-2-kris@embeddedTS.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 10 Mar 2022 10:06:45 +0100
Message-ID: <CAMRc=MdTpv9RHWw6597rvZ+poXtQ4H2+x31-D1vQQXLJ8fwUJw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: ts4900: Do not set DAT and OE together
To:     Kris Bahnsen <kris@embeddedts.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Featherston <mark@embeddedts.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 10, 2022 at 2:16 AM Kris Bahnsen <kris@embeddedts.com> wrote:
>
> From: Mark Featherston <mark@embeddedTS.com>
>
> This works around an issue with the hardware where both OE and
> DAT are exposed in the same register. If both are updated
> simultaneously, the harware makes no guarantees that OE or DAT
> will actually change in any given order and may result in a
> glitch of a few ns on a GPIO pin when changing direction and value
> in a single write.
>
> Setting direction to input now only affects OE bit. Setting
> direction to output updates DAT first, then OE.
>
> Fixes: 9c6686322d74 ("gpio: add Technologic I2C-FPGA gpio support")
>
> Signed-off-by: Mark Featherston <mark@embeddedTS.com>
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> ---
>  drivers/gpio/gpio-ts4900.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
> index d885032cf814..d918d2df4de2 100644
> --- a/drivers/gpio/gpio-ts4900.c
> +++ b/drivers/gpio/gpio-ts4900.c
> @@ -1,7 +1,7 @@
>  /*
>   * Digital I/O driver for Technologic Systems I2C FPGA Core
>   *
> - * Copyright (C) 2015 Technologic Systems
> + * Copyright (C) 2015, 2018 Technologic Systems
>   * Copyright (C) 2016 Savoir-Faire Linux
>   *
>   * This program is free software; you can redistribute it and/or
> @@ -55,19 +55,33 @@ static int ts4900_gpio_direction_input(struct gpio_chip *chip,
>  {
>         struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
>
> -       /*
> -        * This will clear the output enable bit, the other bits are
> -        * dontcare when this is cleared
> +       /* Only clear the OE bit here, requires a RMW. Prevents potential issue
> +        * with OE and data getting to the physical pin at different times.
>          */
> -       return regmap_write(priv->regmap, offset, 0);
> +       return regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OE, 0);
>  }
>
>  static int ts4900_gpio_direction_output(struct gpio_chip *chip,
>                                         unsigned int offset, int value)
>  {
>         struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
> +       unsigned int reg;
>         int ret;
>
> +       /* If changing from an input to an output, we need to first set the
> +        * proper data bit to what is requested and then set OE bit. This
> +        * prevents a glitch that can occur on the IO line
> +        */
> +       regmap_read(priv->regmap, offset, &reg);
> +       if (!(reg & TS4900_GPIO_OE)) {
> +               if (value)
> +                       reg = TS4900_GPIO_OUT;
> +               else
> +                       reg &= ~TS4900_GPIO_OUT;
> +
> +               regmap_write(priv->regmap, offset, reg);
> +       }
> +
>         if (value)
>                 ret = regmap_write(priv->regmap, offset, TS4900_GPIO_OE |
>                                                          TS4900_GPIO_OUT);
> --
> 2.11.0
>

Applied for fixes, thanks!

Bart
