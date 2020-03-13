Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1FC184E7B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 19:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgCMSS6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 14:18:58 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:34462 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgCMSS6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 14:18:58 -0400
Received: by mail-il1-f193.google.com with SMTP id c8so9978193ilm.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2020 11:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bEGXLtL0+l+wcHxfb4Wda9rPAPCPxBsUaDtytU4tfYs=;
        b=QWfnoa/odga/VRk9Qtg2LsHU02epPuz9r/3CplBcCf7xAPSnKkd0S5pgBqgPGM3TST
         GO6aD1Yd+5BM/jwwzbySCz1TJ9HWXykyqIsPDW265TEprcSIAtjJYXF15PiTCuFqs0sq
         fuvk2NnO4XQiY3AkRUJJgXib/J0u1g1rWcDqlUEsKAinG5gzgeZZ9AoGRXerc7debypo
         Ie1MMG9PbdBiUmfTJvhwTVxxyv9v4NmIbmXTOW1TpIv2vNN9sfD8nKVdSXTbApgS/rzp
         hRK3gxAQM0hbYonUGbCoL4Kk0OzlKSUjZqctBTXhZnoLFi8jnp+j6Q2c3MAGb3ScWV3A
         uXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bEGXLtL0+l+wcHxfb4Wda9rPAPCPxBsUaDtytU4tfYs=;
        b=qif8jxRr2XKApiKmQ0C22Hu3Juh4m8EEGOHmqZkJNg1vhVf5o3MGpeIzWJSd74TLs7
         SUAVhi7kxywHlnt0EGrb/xxwezsECkEaL6+GY0nRya9dU2reCEz5ZoneSeDxKhXntxeu
         cHl6xaP5qpEQ5SiEU7FZ5CBjX4HFe+hskmmrOLqEJvFrppH4hFPqUSZDCAJ5Z5LfABzp
         SCWit2LZWoksO9L5m7YpcH4Ly9pEHfHl4g0mXOA/nuuiUtzAVviBU3K/rLxD8SN5lz2f
         hXyk7zvjB3dFsHEjGpHmx74NwQ+xs7n+N5Ai8TjkUhWS61nnoCq/CmZRiVvBBWgpuG8T
         YR9A==
X-Gm-Message-State: ANhLgQ2IXtvSKu7yUwi4c5IepWf0z/AKkBfnlOfrt3XFtcfQTYQB1vZH
        +/ZCQQeaFPYL3LpcyOYa/KDwr/jf3ajPck/gKy0P4Q==
X-Google-Smtp-Source: ADFU+vtpKSuqEiGn30ftj761EkgLo1rojIota2MFFVNGYJ6c1nKYRUq2Ok4wHUc7dVVcolpkRwacnS12/wNh6CGdY0g=
X-Received: by 2002:a92:af8c:: with SMTP id v12mr15707310ill.6.1584123536265;
 Fri, 13 Mar 2020 11:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200313081522.35143-1-linus.walleij@linaro.org>
In-Reply-To: <20200313081522.35143-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Mar 2020 19:18:45 +0100
Message-ID: <CAMRc=MfmoSXVQocPt3kLavph6ASG35N4UccYHuhZdpkeUxfh7g@mail.gmail.com>
Subject: Re: [PATCH] gpio: Move devres calls to devres file
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 13 mar 2020 o 09:15 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> These two devres functions devm_gpiochip_[add|remove]()
> were in the wrong file. They should be in gpiolib-devres.c
> not gpiolib.c.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-devres.c | 46 +++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib.c        | 46 -----------------------------------
>  2 files changed, 46 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.=
c
> index 72b6001c56ef..5c91c4365da1 100644
> --- a/drivers/gpio/gpiolib-devres.c
> +++ b/drivers/gpio/gpiolib-devres.c
> @@ -478,3 +478,49 @@ void devm_gpio_free(struct device *dev, unsigned int=
 gpio)
>                 &gpio));
>  }
>  EXPORT_SYMBOL_GPL(devm_gpio_free);
> +
> +static void devm_gpio_chip_release(struct device *dev, void *res)
> +{
> +       struct gpio_chip *gc =3D *(struct gpio_chip **)res;
> +
> +       gpiochip_remove(gc);
> +}
> +
> +/**
> + * devm_gpiochip_add_data() - Resource managed gpiochip_add_data()
> + * @dev: pointer to the device that gpio_chip belongs to.
> + * @gc: the GPIO chip to register
> + * @data: driver-private data associated with this chip
> + *
> + * Context: potentially before irqs will work
> + *
> + * The gpio chip automatically be released when the device is unbound.
> + *
> + * Returns:
> + * A negative errno if the chip can't be registered, such as because the
> + * gc->base is invalid or already associated with a different chip.
> + * Otherwise it returns zero as a success code.
> + */
> +int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
> +                          void *data)
> +{
> +       struct gpio_chip **ptr;
> +       int ret;
> +
> +       ptr =3D devres_alloc(devm_gpio_chip_release, sizeof(*ptr),
> +                            GFP_KERNEL);
> +       if (!ptr)
> +               return -ENOMEM;
> +
> +       ret =3D gpiochip_add_data(gc, data);
> +       if (ret < 0) {
> +               devres_free(ptr);
> +               return ret;
> +       }
> +
> +       *ptr =3D gc;
> +       devres_add(dev, ptr);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_gpiochip_add_data);
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 02f8b2b81199..00890f38f95f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1838,52 +1838,6 @@ void gpiochip_remove(struct gpio_chip *chip)
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_remove);
>
> -static void devm_gpio_chip_release(struct device *dev, void *res)
> -{
> -       struct gpio_chip *chip =3D *(struct gpio_chip **)res;
> -
> -       gpiochip_remove(chip);
> -}
> -
> -/**
> - * devm_gpiochip_add_data() - Resource managed gpiochip_add_data()
> - * @dev: pointer to the device that gpio_chip belongs to.
> - * @chip: the chip to register, with chip->base initialized
> - * @data: driver-private data associated with this chip
> - *
> - * Context: potentially before irqs will work
> - *
> - * The gpio chip automatically be released when the device is unbound.
> - *
> - * Returns:
> - * A negative errno if the chip can't be registered, such as because the
> - * chip->base is invalid or already associated with a different chip.
> - * Otherwise it returns zero as a success code.
> - */
> -int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *chip,
> -                          void *data)
> -{
> -       struct gpio_chip **ptr;
> -       int ret;
> -
> -       ptr =3D devres_alloc(devm_gpio_chip_release, sizeof(*ptr),
> -                            GFP_KERNEL);
> -       if (!ptr)
> -               return -ENOMEM;
> -
> -       ret =3D gpiochip_add_data(chip, data);
> -       if (ret < 0) {
> -               devres_free(ptr);
> -               return ret;
> -       }
> -
> -       *ptr =3D chip;
> -       devres_add(dev, ptr);
> -
> -       return 0;
> -}
> -EXPORT_SYMBOL_GPL(devm_gpiochip_add_data);
> -
>  /**
>   * gpiochip_find() - iterator for locating a specific gpio_chip
>   * @data: data to pass to match function
> --
> 2.24.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
