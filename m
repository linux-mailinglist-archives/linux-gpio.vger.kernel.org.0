Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B53334656
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 19:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbhCJSMM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 13:12:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:35020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233569AbhCJSMK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 13:12:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22BC164FB5;
        Wed, 10 Mar 2021 18:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615399930;
        bh=gfC545zIBa1YDEjWh32i4lCV8kvxln2OQmvfhzAIAuw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sYX+2ueZ5+BBW+3IwDwioMbZQD3zjKwfpEK527va3E6dYpdzjxk4h/yC3f9GdsGdx
         Pojy5CqR6xScuMhKCeDKyNwb8RTUMmypnJ3ajQzO27mgbqPjFZ6ZV9FXF51+eVWaqt
         ETPHA4bBErhomAJ4vLxRVO//+bQ/TXKaX22J0lCZqxUZR61HALQhsr0sLGOCISHvqW
         rSYvbhdBky3jFw2qHnFTmSSQQI2ZWOwYuCqGC+0lfCLNudYej/lXm8baAxzcUspO7J
         z5ewasZ6p56SXd6Zm8e57rhYAv4nQqWKSav4mmmoQOMZxF4z2kcnWLkAALeu088sy2
         6COTccxstYU5g==
Received: by mail-ej1-f51.google.com with SMTP id mj10so40562038ejb.5;
        Wed, 10 Mar 2021 10:12:10 -0800 (PST)
X-Gm-Message-State: AOAM530ICtRZ/i7E09b/z7aBxxcUkC30SAxOtfzajQDxo1wrf95jbpDl
        W29NKI093SrFjzuubEvyapBU2eW2KAuWRqHyrw==
X-Google-Smtp-Source: ABdhPJwxdSLQjOW6L+TI3np6QegsvPUL5FBbauPuDU3UjA/1Qy9TM9iKBMw0I7xF343nV273xSof46KLVFoHKsX+44o=
X-Received: by 2002:a17:906:c405:: with SMTP id u5mr4947715ejz.341.1615399928619;
 Wed, 10 Mar 2021 10:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20210309142000.3034451-1-linus.walleij@linaro.org>
In-Reply-To: <20210309142000.3034451-1-linus.walleij@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Mar 2021 11:11:57 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJbCPstpx_Q_JUF2UDtMaNz6-VGf+oDP374t0CfEYqtyg@mail.gmail.com>
Message-ID: <CAL_JsqJbCPstpx_Q_JUF2UDtMaNz6-VGf+oDP374t0CfEYqtyg@mail.gmail.com>
Subject: Re: [PATCH] ARM/gpio/dt-bindings: Clean out gpio alias from CLPS711X
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alexander Shiyan <shc_work@mail.ru>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 7:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This removes the use of GPIO alias from the CLPS711X GPIO
> driver.
>
> This driver only use it to add quirks to two GPIO blocks
> for which we can reuse the standard property "ngpios" and
> define a new Cirrus quirk to do it properly and get rid
> of the alias.
>
> The patch changes the driver, the one DTS file and the
> bindings in one go: my apologies but this is a lockstep
> solution to avoid any unclarities or inbetween states.

in between

I don't think a single patch really buys anything, but okay.

>
> Old device trees with aliases are supported but will
> produce a warning in dmesg and new properties will take
> precedence.
>
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Link: https://lore.kernel.org/linux-gpio/CACRpkda8+Lvz+c=ohXsEDkNSQ63hPo613P4p_90fvKyC_kQ_GA@mail.gmail.com/T/#t
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This is a result of a discussion with Rob about whether
> we can get rid of GPIO aliases. I think we can at least
> get rid of this one.
> ---
>  .../bindings/gpio/gpio-clps711x.txt           | 10 +++---
>  arch/arm/boot/dts/ep7209.dtsi                 |  8 ++---
>  drivers/gpio/gpio-clps711x.c                  | 36 +++++++++----------
>  3 files changed, 26 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-clps711x.txt b/Documentation/devicetree/bindings/gpio/gpio-clps711x.txt
> index 0a304ad29d81..c1ff20107607 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-clps711x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-clps711x.txt
> @@ -11,15 +11,13 @@ Required properties:
>      0 = active high
>      1 = active low
>
> -Note: Each GPIO port should have an alias correctly numbered in "aliases"
> -node.
> +Optional properties:
> +- cirrus,inverted-polarity: The polarity of the GPIO lines is
> +  inverted in hardware.
> +- ngpios: Number of available GPIO lines 0..n-1, see gpio.txt
>
>  Example:
>
> -aliases {
> -       gpio0 = &porta;
> -};
> -
>  porta: gpio@80000000 {
>         compatible = "cirrus,ep7312-gpio","cirrus,ep7209-gpio";
>         reg = <0x80000000 0x1>, <0x80000040 0x1>;
> diff --git a/arch/arm/boot/dts/ep7209.dtsi b/arch/arm/boot/dts/ep7209.dtsi
> index 365931f8b48d..7d0f04959fdd 100644
> --- a/arch/arm/boot/dts/ep7209.dtsi
> +++ b/arch/arm/boot/dts/ep7209.dtsi
> @@ -11,10 +11,6 @@ / {
>         compatible = "cirrus,ep7209";
>
>         aliases {
> -               gpio0 = &porta;
> -               gpio1 = &portb;
> -               gpio3 = &portd;
> -               gpio4 = &porte;
>                 serial0 = &uart1;
>                 serial1 = &uart2;
>                 spi0 = &spi;
> @@ -72,6 +68,8 @@ portd: gpio@80000003 {
>                         reg = <0x80000003 0x1 0x80000043 0x1>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
> +                       /* This bank have all lines polarity inverted */
> +                       cirrus,inverted-polarity;
>                 };
>
>                 porte: gpio@80000083 {
> @@ -79,6 +77,8 @@ porte: gpio@80000083 {
>                         reg = <0x80000083 0x1 0x800000c3 0x1>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
> +                       /* Only 3 GPIOs available on this bank */
> +                       ngpios = <3>;
>                 };
>
>                 syscon1: syscon@80000100 {
> diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
> index 75f6f8d4323e..d2a20dc8f5d9 100644
> --- a/drivers/gpio/gpio-clps711x.c
> +++ b/drivers/gpio/gpio-clps711x.c
> @@ -16,14 +16,11 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
>         void __iomem *dat, *dir;
>         struct gpio_chip *gc;
>         int err, id;
> +       u32 ngpios;
>
>         if (!np)
>                 return -ENODEV;
>
> -       id = of_alias_get_id(np, "gpio");
> -       if ((id < 0) || (id > 4))
> -               return -ENODEV;
> -
>         gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
>         if (!gc)
>                 return -ENOMEM;
> @@ -36,29 +33,32 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
>         if (IS_ERR(dir))
>                 return PTR_ERR(dir);
>
> -       switch (id) {
> -       case 3:
> +       /* This ID will be negative if there is no alias node */
> +       id = of_alias_get_id(np, "gpio");
> +
> +       if (id >= 0)
> +               dev_info(&pdev->dev,
> +                        "DT is using deprecated alias, please remove this and "
> +                        "replace with proper node attributes\n");
> +
> +       if (of_property_read_bool(np, "cirrus,inverted-polarity") ||
> +           id == 3)
>                 /* PORTD is inverted logic for direction register */
>                 err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
>                                  NULL, dir, 0);
> -               break;
> -       default:
> +       else
>                 err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
>                                  dir, NULL, 0);
> -               break;
> -       }
> -
>         if (err)
>                 return err;
>
> -       switch (id) {
> -       case 4:
> -               /* PORTE is 3 lines only */
> +       if (id == 4)
> +               /* This is just for compatibility with older device trees */
>                 gc->ngpio = 3;
> -               break;
> -       default:
> -               break;
> -       }
> +
> +       if (!of_property_read_u32(np, "ngpios", &ngpios))
> +               /* PORTE is 3 lines only */
> +               gc->ngpio = ngpios;

Just this should work:

of_property_read_u32(np, "ngpios", &gc->ngpio);

The variable won't be touched on error.

Rob
