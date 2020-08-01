Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44002351EF
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Aug 2020 13:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbgHALwD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Aug 2020 07:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgHALwD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Aug 2020 07:52:03 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A9AC06174A;
        Sat,  1 Aug 2020 04:52:03 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id lx9so9006447pjb.2;
        Sat, 01 Aug 2020 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2cimN9Yvy25UPH51XSaIWZhhYkPPGceN+e4WaCDrxc=;
        b=bH/7xYTVSzAYcbVdRzs8gJFpprccPE4mejvVwACUZSyaK4y7HU0D4JgmpJieFGMzca
         By43QB0NUfbqvAw4PsJoN+Ka+Ac67V9IQ6ySwQVN3kmDMb5auEnBECTxFPziztvdXkBF
         31lWDuJ4tH4zL5i2eokMS76E2FVS2yORWf5IHX0h6RA2qdyKnIMtpHSbt5i8rAwTTWv2
         SBnXvJdgmVaSFQJDOk8imVfUnnqlOyfBVnYIH8Gg/JAMSzwZYnokzVlP80psyONL4+P0
         k5+8HYB29ylJNQmSvVqkVp5zKe3zwzR5viY7ytlOQa69tkbQEOHw8fYGo1RUNlYl+U8T
         DlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2cimN9Yvy25UPH51XSaIWZhhYkPPGceN+e4WaCDrxc=;
        b=D64GNYNAyyHz4jnGRc/WP8DMBV+5gHlf5wKwc5SbW+f31waxvjBAw4d4xEtSscxBeR
         Oa8FuOesyYf2EaUWidjtf5c275Ek3giHBgnA6gnvP4GXFONsSxRISYLIKdLZdHknQwGk
         6vwoV1scrAOtgyve8bgNA8UgmG7InkROLoULyeGp9+fA/iMvhLGZQT9fPDDkMcuIXemk
         q9Tn5vEIziQ8StYyvo/HSB4ztzGRjoqo2T/8kSMz2MGvf/l3j56AjVYrGeSTY1cZSdud
         sGJBhmCoWruiliU7g5miSJGAKvc3/6RTlN7yO3zmXB09nHzEwPDpydy4jOvnuvzoUQfy
         e1qw==
X-Gm-Message-State: AOAM531buHT1gBWAg4AvtPLuUdJJrgh838x7V77W05JEsMmaU1s3F4As
        gZkzF1d9kWSIc0B0Kar0p6lQASlRdETu7wj15AQ=
X-Google-Smtp-Source: ABdhPJwfp5CCIbJnTwmKX2fsq5+6kN32Du9swj9c1Soea9R8ZJZ1Lj85b5NXu/Fr1GYYpDt0bUqzDN277cRKM2FvJlQ=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr7322900plo.262.1596282722426;
 Sat, 01 Aug 2020 04:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200731123835.8003-1-a.fatoum@pengutronix.de>
In-Reply-To: <20200731123835.8003-1-a.fatoum@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 1 Aug 2020 14:51:46 +0300
Message-ID: <CAHp75VcnGX8Bjcxx6sVkp1wzeLb38eBqUhrPWqjnzc-7jXShGw@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't use same lockdep class for all
 devm_gpiochip_add_data users
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Thierry Reding <treding@nvidia.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 31, 2020 at 3:40 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Commit 959bc7b22bd2 ("gpio: Automatically add lockdep keys") documents
> in its commits message its intention to "create a unique class key for
> each driver".
>
> It does so by having gpiochip_add_data add in-place the definition of
> two static lockdep classes for LOCKDEP use. That way, every caller of
> the macro adds their gpiochip with unique lockdep classes.
>
> There are many indirect callers of gpiochip_add_data, however, via
> use of devm_gpiochip_add_data. devm_gpiochip_add_data has external
> linkage and all its users will share the same lockdep classes, which
> probably is not intended.
>
> Fix this by replicating the gpio_chip_add_data statics-in-macro for
> the devm_ version as well.

I ran into similar issues in another driver (not GPIO) and I agree with the fix.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 959bc7b22bd2 ("gpio: Automatically add lockdep keys")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> This doesn't fix any particular problem I ran into, but the code
> looked buggy, at least to my lockdep-user-not-developer eyes.
> ---
>  drivers/gpio/gpiolib-devres.c | 13 ++++++++-----
>  include/linux/gpio/driver.h   | 13 +++++++++++--
>  2 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
> index 5c91c4365da1..7dbce4c4ebdf 100644
> --- a/drivers/gpio/gpiolib-devres.c
> +++ b/drivers/gpio/gpiolib-devres.c
> @@ -487,10 +487,12 @@ static void devm_gpio_chip_release(struct device *dev, void *res)
>  }
>
>  /**
> - * devm_gpiochip_add_data() - Resource managed gpiochip_add_data()
> + * devm_gpiochip_add_data_with_key() - Resource managed gpiochip_add_data_with_key()
>   * @dev: pointer to the device that gpio_chip belongs to.
>   * @gc: the GPIO chip to register
>   * @data: driver-private data associated with this chip
> + * @lock_key: lockdep class for IRQ lock
> + * @request_key: lockdep class for IRQ request
>   *
>   * Context: potentially before irqs will work
>   *
> @@ -501,8 +503,9 @@ static void devm_gpio_chip_release(struct device *dev, void *res)
>   * gc->base is invalid or already associated with a different chip.
>   * Otherwise it returns zero as a success code.
>   */
> -int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
> -                          void *data)
> +int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc, void *data,
> +                                   struct lock_class_key *lock_key,
> +                                   struct lock_class_key *request_key)
>  {
>         struct gpio_chip **ptr;
>         int ret;
> @@ -512,7 +515,7 @@ int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
>         if (!ptr)
>                 return -ENOMEM;
>
> -       ret = gpiochip_add_data(gc, data);
> +       ret = gpiochip_add_data_with_key(gc, data, lock_key, request_key);
>         if (ret < 0) {
>                 devres_free(ptr);
>                 return ret;
> @@ -523,4 +526,4 @@ int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
>
>         return 0;
>  }
> -EXPORT_SYMBOL_GPL(devm_gpiochip_add_data);
> +EXPORT_SYMBOL_GPL(devm_gpiochip_add_data_with_key);
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index c4f272af7af5..e6217d8e2e9f 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -509,8 +509,16 @@ extern int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>                 gpiochip_add_data_with_key(gc, data, &lock_key, \
>                                            &request_key);         \
>         })
> +#define devm_gpiochip_add_data(dev, gc, data) ({ \
> +               static struct lock_class_key lock_key;  \
> +               static struct lock_class_key request_key;         \
> +               devm_gpiochip_add_data_with_key(dev, gc, data, &lock_key, \
> +                                          &request_key);         \
> +       })
>  #else
>  #define gpiochip_add_data(gc, data) gpiochip_add_data_with_key(gc, data, NULL, NULL)
> +#define devm_gpiochip_add_data(dev, gc, data) \
> +       devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
>  #endif /* CONFIG_LOCKDEP */
>
>  static inline int gpiochip_add(struct gpio_chip *gc)
> @@ -518,8 +526,9 @@ static inline int gpiochip_add(struct gpio_chip *gc)
>         return gpiochip_add_data(gc, NULL);
>  }
>  extern void gpiochip_remove(struct gpio_chip *gc);
> -extern int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
> -                                 void *data);
> +extern int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc, void *data,
> +                                          struct lock_class_key *lock_key,
> +                                          struct lock_class_key *request_key);
>
>  extern struct gpio_chip *gpiochip_find(void *data,
>                               int (*match)(struct gpio_chip *gc, void *data));
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
