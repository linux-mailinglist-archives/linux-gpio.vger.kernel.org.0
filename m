Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C8D4D2AB3
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 09:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbiCIIdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 03:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiCIIdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 03:33:17 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD2D108543
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 00:32:19 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id bi12so3284670ejb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2022 00:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CDxkaqcG0fJrANM2ceXT68Oc4mg/sa4Hyds9EWcVwMo=;
        b=D0YZRm0Zo3pKm3j0CffjTpR2ewQvsGG4tcDtg18M0JRyuPCeDft7r4tvhbR092In3b
         oIS+CgaA67qEALwDxDXpIKx83GA5bI9Wi1abRaRe9avmm2JETRWhI1ndc07ucekYfVWw
         GxgIlU+9cApectUqWYiRgbM4HdeaN4fGuEBWuEBR94He4vDcQw0lJXt+yOOKKxSwwZFm
         5ck+T2lP8eqANjjCcPteqUDDQgUhvGuxdAostHbB7DKBDQQgi3ML0fY9h1wleydLBw2Y
         ixRAPcsV7Rx4JuGtrB7nj/RxLvHps3Mlh167NRnI6+v2023XvhV7yMRmxq008G+L73zr
         vl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CDxkaqcG0fJrANM2ceXT68Oc4mg/sa4Hyds9EWcVwMo=;
        b=NNC1tHJipovNoRa/jD3abwZ+0R8zpJbjainzhb5xBfVAX4y7I5Agyml4oreLdUeNC6
         iYy04L8hzwJGymDN74JrDfENFei3K6Nfd7OvAkwSVduwd00cy8dcs9l+Q0wdxGh6wvMc
         +7xKjVphBVN/zqCoVeYzVP86BWnrnxOFRzGc/CS/rNSNq+U8fJbktQckuIDQx/e5ZDt6
         6PSWw4kSPIgouXbjjhIXLlumWXFCN24TGn9oxQujR/7x92dgZbQvWRSEUPwjn/oJFLC5
         +LAuv9cPHGXV7ZS/igGwEhqB5metvZUjae1cyzvzhiyUD8ez/heiJwD6G1yaTc6dZZf9
         n5nQ==
X-Gm-Message-State: AOAM530FjCDxHwTXNrLx3StgS45jrJ5rJ79BVVtQPl4YNmgae4TeE5OX
        DkfB+KEwHaMRq4WhWNe3AnLYUXptpmGr8JnpZdy6rw==
X-Google-Smtp-Source: ABdhPJyiwZdXMCB+gl31EgY0K4uGx9NzfOVEzYdh1/gjJxUD6lAWqrvf9E7quDBoYLygHTpvMlC0AFyDQNcJ44dZc9o=
X-Received: by 2002:a17:907:7f0d:b0:6d6:f910:5136 with SMTP id
 qf13-20020a1709077f0d00b006d6f9105136mr17433293ejc.736.1646814737670; Wed, 09
 Mar 2022 00:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20220308181847.3276-1-kris@embeddedTS.com>
In-Reply-To: <20220308181847.3276-1-kris@embeddedTS.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Mar 2022 09:32:06 +0100
Message-ID: <CAMRc=McuAB96JSKVeAPQLOgjGZkD5hOtYt=904Aw4t4aYVVKqg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: ts4900: Do not set DAT and OE together
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

On Tue, Mar 8, 2022 at 7:19 PM Kris Bahnsen <kris@embeddedts.com> wrote:
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
> V1 -> V2: Add Fixes tag
>
>  drivers/gpio/gpio-ts4900.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
> index d885032cf814..fbabfca030c0 100644
> --- a/drivers/gpio/gpio-ts4900.c
> +++ b/drivers/gpio/gpio-ts4900.c
> @@ -1,7 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0

This is not part of the fix, please send a separate patch that comes
after the fix adding the SPDX identifier.

>  /*
>   * Digital I/O driver for Technologic Systems I2C FPGA Core
>   *
> - * Copyright (C) 2015 Technologic Systems
> + * Copyright (C) 2015-2018 Technologic Systems
>   * Copyright (C) 2016 Savoir-Faire Linux
>   *
>   * This program is free software; you can redistribute it and/or

If you're adding the SPDX identifier, you can drop the license boilerplate here.

Bart

> @@ -55,19 +56,33 @@ static int ts4900_gpio_direction_input(struct gpio_chip *chip,
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
