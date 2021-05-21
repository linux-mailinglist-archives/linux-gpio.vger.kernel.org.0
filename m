Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EE938C469
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbhEUKMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhEUKMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 06:12:19 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACDAC061574;
        Fri, 21 May 2021 03:10:56 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 22so14168059pfv.11;
        Fri, 21 May 2021 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IaqwQSeNH4Jy+ZwQZhmfsK64+hoPYxaUL9CpBze2Naw=;
        b=ZWTYbKj2HfDy2TDW20FyjOsA40JL53p0uSDWgPNU278uPIU8JYSB3L9VAai9utDQW8
         FMWfNTHC3zEylUEWeyiVf+6WVcSQiDvUeSmbAHwuAQiuRp+QFUOiGbuuSpwicoX8YXB8
         76I9K1LAZBdgf3MLvp0J69LrcXCREeigcL7Iqk69txCm0Y/v7dMXrKgCsbfFFU2K+CIx
         l78WskIi2PwmciOFkETUjU8mphjCgw3NizSvKpMiApB25CNZjgWgjVCl1d3QAXvqHVNB
         eNH+5jU/oolEcz0/+kS8zBGamlI1ssxM/GCZTBx33OHkheHRxgCdcmNJsSp53jFKD7mk
         0yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IaqwQSeNH4Jy+ZwQZhmfsK64+hoPYxaUL9CpBze2Naw=;
        b=KqoIadBhqf6p02DObNRf5xFhAi+71kcnsMZt9Ob2z79TmdtKj1HMhejz1iaAWVnjGk
         m/TmT4ueokxKAWJl2QBLHgUYmT5oefvlUYwG5Tw3WP3sfWtM1kB7ctQqA6o2+hRMwQ51
         AZMG+bW6ZkqDvrstYpxS7Ik22ErRI28zWlVnyqaPllJ+uAZs0idpd0BmWgoiBNO2Q2KV
         r6oQ3LQCnXdbevCvW7vrJFGGi9dVDGVD6coV8qJIobqQ9F448VFKIFa9FxdSkL1HBZcg
         76R1CmxTW30r4GKbypZsdxu+LoZqoHspPI8RFhDXDhD3Xn9BSr+i2DhINUBssG64rQdH
         hlag==
X-Gm-Message-State: AOAM530998bxHlHT0R+8q2DNnI07/c+bfwV/gX88OqGxT9QqbzXdVqQB
        4qBKg900FBRq3xbR+eEhgetrKFb/NNGB0uzCy4k=
X-Google-Smtp-Source: ABdhPJzaRyDiqepdYYUgZ2TB1T80ZWK5ak0P7QcNdrW07F/XFw1Rt8QvuBtLJTdew2Sv5vl6pu5gwOVgKzOYiN5Pj2I=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr9162451pgc.203.1621591856041;
 Fri, 21 May 2021 03:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com> <e3d3e704804668d1403f3630c181010b34409c8f.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <e3d3e704804668d1403f3630c181010b34409c8f.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 21 May 2021 13:10:39 +0300
Message-ID: <CAHp75VfgQw09KJ5pMNz7fnia-pzK8sMGKn6NJkmNEWLzo5GffA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: gpio-regmap: Use devm_add_action()
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 12:54 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Slightly simplify the devm_gpio_regmap_register() by using the
> devm_add_action().

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> Changelog:
>   - New patch at v2
>
>  drivers/gpio/gpio-regmap.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index c05370e984b9..4555e59f916e 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -341,9 +341,9 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
>  }
>  EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
>
> -static void devm_gpio_regmap_unregister(struct device *dev, void *res)
> +static void devm_gpio_regmap_unregister(void *res)
>  {
> -       gpio_regmap_unregister(*(struct gpio_regmap **)res);
> +       gpio_regmap_unregister(res);
>  }
>
>  /**
> @@ -360,20 +360,12 @@ static void devm_gpio_regmap_unregister(struct device *dev, void *res)
>  struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
>                                               const struct gpio_regmap_config *config)
>  {
> -       struct gpio_regmap **ptr, *gpio;
> -
> -       ptr = devres_alloc(devm_gpio_regmap_unregister, sizeof(*ptr),
> -                          GFP_KERNEL);
> -       if (!ptr)
> -               return ERR_PTR(-ENOMEM);
> +       struct gpio_regmap *gpio;
>
>         gpio = gpio_regmap_register(config);
> -       if (!IS_ERR(gpio)) {
> -               *ptr = gpio;
> -               devres_add(dev, ptr);
> -       } else {
> -               devres_free(ptr);
> -       }
> +
> +       if (!IS_ERR(gpio))
> +               devm_add_action(dev, devm_gpio_regmap_unregister, gpio);
>
>         return gpio;
>  }
> --
> 2.25.4
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]



-- 
With Best Regards,
Andy Shevchenko
