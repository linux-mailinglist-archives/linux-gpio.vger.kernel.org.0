Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3DE234850
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jul 2020 17:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731692AbgGaPTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jul 2020 11:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731416AbgGaPTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2020 11:19:35 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA48C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2020 08:19:35 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id x6so8439219qvr.8
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2020 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k6QsduC1fTB5ktADj2XGcC7CHp8S8zknN6C11XsL7nY=;
        b=u4RDf4EK0zw9T20cnJSvuycb/Z/2EgvH3s0zu72spDuDKxxkZQdYThn7LFSxbOiBzz
         h9nbzi2W6cA92IY1s1zCdEBGe+bmoDQgzCNqlfePKxI1aUIXT6CVSydMEz+xFkHL9XBd
         Le9q8c+5oduJkbjQEfdWBVd3wSAhFO2J5HYVSB5ffFnfgPVut8LpdTUKPAZueLUsqhDH
         nW6OpWoNPfoZzLBD+rEh4qj4GhR2L1xa4hLYmVUWqa2V20Dv1QXrYvPmHcXiE2jCxoI+
         8H1k6A3DCn1DNtFF5fwZ1+Cmj+IIcPi23Vqv7bSKHOP5YX7e75H4QyOQ6tLwrRvmSqXM
         LjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k6QsduC1fTB5ktADj2XGcC7CHp8S8zknN6C11XsL7nY=;
        b=niuUModL1hyJd6vXYxGkFBVxqryU2Ax+mc8/GARdANsEZ1m/7PUE56bcMi8e9k9Y60
         3kHBMdbM/kfrVZ4LQrvzEqGaYoLokwaz3qf1JNLny4WmH1U0Y+iNUjT6GvxZ6Md0ltpU
         R0Qw4GlGRLokZC34QRutS7k3rvQ5kaBDi12tKfFAkunPAd7bP04W+tmz36WMJy/EycR7
         wJBjGoPcJwuUI0Dr0PL3lyG5mQe3VE1wJHt8TI2OlV3hIc8WjPLkYn0iv8qjVxTn6try
         9AjrURS6i/6GqOWvzXCoWiiBVW0R+bZndl08+M6cp5gjQDrrfJPKESjTWLagB9JZRNaf
         BF/w==
X-Gm-Message-State: AOAM532GG5OF3xjPxvLUlDuZv4Zb6LZ3DSIN0Ppd7wOvlbrHub0dpyZb
        qIv3jDfF+zGIwukEkp7xuM1Xat2VGcfGq9+47DB8Gw==
X-Google-Smtp-Source: ABdhPJwal3sDCMt4IV+PuqA8j3XLSuaT6q00loh7GNl/llhN6BUJG/HYRBOXMbvclwLXecRm2DLu0lJUmFmCG7OgHTU=
X-Received: by 2002:a0c:eed1:: with SMTP id h17mr4402852qvs.96.1596208774629;
 Fri, 31 Jul 2020 08:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200731123835.8003-1-a.fatoum@pengutronix.de>
In-Reply-To: <20200731123835.8003-1-a.fatoum@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 31 Jul 2020 17:19:23 +0200
Message-ID: <CAMpxmJUfm_frmW9kMOfLBcFTizp-=WnkUUXDSYqg7-te1ZnPDw@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't use same lockdep class for all
 devm_gpiochip_add_data users
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Thierry Reding <treding@nvidia.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 31, 2020 at 2:39 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
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
>
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

Looks good to me and the previous code indeed looks buggy.

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
