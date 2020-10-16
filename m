Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF208290737
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 16:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406138AbgJPOd1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 10:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405628AbgJPOd0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 10:33:26 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FEFC061755;
        Fri, 16 Oct 2020 07:33:26 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ds1so1487949pjb.5;
        Fri, 16 Oct 2020 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KF2OHmi3Hm9dz3KRKT0p1ji0RuquRawxEOEyVtCtb1Q=;
        b=oG8r9fSD1r5uk75/nEX/vkwm/k3p/5kLORFfo2evLdgBOPeDn8LSrGON2l4sFsLxSV
         Cia2y6WmpLftleEKlPYfOPGG/7p6U9qKGw1Pc5NlykLHxeDaNnwG6cxw04SkB1bdxJfK
         2Fbaww/iFyMcU1IchELefWf9kpdnFWXwevkoLGJnImO2vPHrhOx1ph6RGL6CyPzkdE5Q
         GrVwPRDhvI4L1ISfk2khNOm35JPV0n+9T9O3csmRud+q7bMEDF9GLrOmAka3Q3OAW37r
         c9eHYEMIrxSseNHxb9o1M6UVeVVUYt2tz8d3FxQ7+oZg5MeGLC3y94e4MEAtDiv/6i0Z
         FTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KF2OHmi3Hm9dz3KRKT0p1ji0RuquRawxEOEyVtCtb1Q=;
        b=Er5mXmuqPyZcvTPwZfK3iXr0vv6463St5TkPGLu8DkuCdLwZ+I7ooiICRSYtsZoX1a
         whGeX+cK6JYFt0imzU9ogHEBUbVsJfPwdl3pgMfqer2gjO/a7gLMubFFZKssiR6W0k2h
         oEcXjMkFLE1wnM+Yj1nd9ziuNvB8cqm6PDqWmaFZ0w0ca7T1IxoAbXYjZOKSG4TMjfKJ
         XKMH7Mk+Qqmc9evp7sm+aCWU4q72qQIh/cR0wWo4xzyRKNEo6JxcClZqOvYRYHrB3Yoj
         iz8QdrxLa0l6a5dkNKcBwO4z2jkEQ37clBzhuG6cwqO7NpGI00SWSUfOPm7yl21Fx2Ki
         yXaA==
X-Gm-Message-State: AOAM533bOJbXnHUPCoaK2mEucNKEgLMzJ2M4h4TbXDIzxuF6hKl3BSdN
        Kan08CTeI3VQy59Fn58GcsDmFMIVP0VcM6e2+F0=
X-Google-Smtp-Source: ABdhPJwi6nosLW1r7DhD0+BQ2E58/G1wVWIMDf17j7lx+tE8z7JpCaVWixIXAx3UJ6NWpNSHxowrREox+LfbZ087j1Y=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr4404555pjb.129.1602858806218;
 Fri, 16 Oct 2020 07:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201014100707.2728637-1-lars.povlsen@microchip.com> <20201014100707.2728637-3-lars.povlsen@microchip.com>
In-Reply-To: <20201014100707.2728637-3-lars.povlsen@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Oct 2020 17:34:15 +0300
Message-ID: <CAHp75Vdd6ECJaWytYVz+5GYZrwybzZmviUOt3H=t-4LH=_idKg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
 driver for Microsemi Serial GPIO
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 6:25 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
> (SGPIO) device used in various SoC's.

...

> +#define PIN_NAM_SZ     (sizeof("SGPIO_D_pXXbY")+1)

+1 for what?

...

> +#define __shf(x)               (__builtin_ffsll(x) - 1)
> +#define __BF_PREP(bf, x)       (bf & ((x) << __shf(bf)))
> +#define __BF_GET(bf, x)                (((x & bf) >> __shf(bf)))

This smells like bitfield.h.

...

> +static int sgpio_input_get(struct sgpio_priv *priv,
> +                          struct sgpio_port_addr *addr)
> +{

> +       int ret;
> +
> +       ret = !!(sgpio_readl(priv, REG_INPUT_DATA, addr->bit) &
> +                BIT(addr->port));
> +
> +       return ret;

Sounds like one line.

> +}

> +static int sgpio_get_functions_count(struct pinctrl_dev *pctldev)
> +{

> +       return 1;

I didn't get why it's not a pure GPIO driver?
It has only one function (no pinmux).
I didn't find any pin control features either.

What did I miss?

...

> +static int microchip_sgpio_get_value(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct sgpio_bank *bank = gpiochip_get_data(gc);
> +       struct sgpio_priv *priv = bank->priv;
> +       struct sgpio_port_addr addr;

> +       int ret;

No need.

> +
> +       sgpio_pin_to_addr(priv, gpio, &addr);
> +
> +       if (bank->is_input)
> +               ret = sgpio_input_get(priv, &addr);
> +       else
> +               ret = sgpio_output_get(priv, &addr);
> +
> +       return ret;
> +}


...


> +       ret = devm_gpiochip_add_data(dev, gc, bank);
> +       if (ret == 0)

> +               dev_info(dev, "Registered %d GPIOs\n", ngpios);

No noise.

> +       else
> +               dev_err(dev, "Failed to register: ret %d\n", ret);
> +

...

> +       /* Get register map */
> +       regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       priv->regs = devm_ioremap_resource(dev, regs);

devm_platform_ioremap_resource();

> +       if (IS_ERR(priv->regs))
> +               return PTR_ERR(priv->regs);

> +       priv->properties = of_device_get_match_data(dev);

It's interesting you have a mix between OF APIs and device property
APIs. Choose one. If you stick with OF, use of_property_ and so,
otherwise replace of_*() by corresponding device_*() or generic calls.

Can you use gpio-regmap APIs?

-- 
With Best Regards,
Andy Shevchenko
