Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B89D2CAB3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 17:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfE1PxK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 11:53:10 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:40237 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfE1PxK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 11:53:10 -0400
Received: by mail-it1-f194.google.com with SMTP id h11so4677998itf.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3yVdiZtGBSBGlDhvB9DOUwLNsyFEwKkKgPF73cZCVKg=;
        b=MTfPdb6pXHJ22ny1QjP9IcsZ6jIajezQz03fP5a1+DhtEyj+LcZNfl/lerD7qIvYSP
         +NTBFf/Oz1bqFosS83DKD81vdhlUu6Rgz1Jik50pMX4R+86cQIxxiG0mf29lJkOTPxYD
         WglGBl4seph3kXUxws4K9NyQ6xiI8px0/QdkWEZBKd/VQnXdxx7NOYg0Briq8ndmGs6U
         R8mic1lvMYtU8tN53jRHbJsyJrRaR6nbiMZMOCloJwaNIZ1hU/yIeJEHNPqRl6XnuNKx
         aUxLBsFYdoY/tJjkAM/Zl7O+UBoU+k7pIM8n16Po6XAeH2FYQucT/1aGU5rcAtkEYkkL
         FnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3yVdiZtGBSBGlDhvB9DOUwLNsyFEwKkKgPF73cZCVKg=;
        b=oJyW5DXLeny1eocLR0ilspxcHBpJWfJJxJf0Rnjf3SJUJhfeweZecS4FWogVKliae9
         r6XycFA1kvS+0JpyhIr6tLLwfYJzZ0ftv7T1HlIa9iCEHvW2POAzK4NO7uf9NwZq+7P7
         qlqspj14pFXq6LAHdlE4mk1uI+1XMPsSJLXbMEMY3c7AAHIY7X45H1guwH5iZHkJJzFs
         cQw2kRQQqb8tY5fNxxhcB7q97nKsDV5P/kg46Gn3H3OMKmlRIZMeqYmF+ZqBBH6DGkOQ
         xXXc5Uve8LI4xALXiCUVOv1j1u5YJmHZiT50ZHA7rnsriP3LVmAehk3mstjj3AW0R570
         WkIw==
X-Gm-Message-State: APjAAAVEDMLWFEe+6k2IXmzvQ6NKWfcNXHbCR4JQjl5kt1/+dUPbzY+j
        E1qVICGSumQakuUPZtKyd4a3Lt52g/9CfVf87vcisg==
X-Google-Smtp-Source: APXvYqyAR9Zt4qe/vlIFOhbxEirAD96v9PPrA79GaYHwcdMz6fZ1NH3FCjjhf21FaWW4P/xls31tGJG1dXDvkEy8Z5A=
X-Received: by 2002:a02:a1cd:: with SMTP id o13mr40365144jah.57.1559058789160;
 Tue, 28 May 2019 08:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190521090306.28113-1-brgl@bgdev.pl>
In-Reply-To: <20190521090306.28113-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 28 May 2019 17:52:58 +0200
Message-ID: <CAMRc=MdJoO602kLfP_Hw9-0pB25CeUMxfqBUYhC7CB3Aw+5O4A@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: max732x: use i2c_new_dummy_device()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 21 maj 2019 o 11:03 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We now have a resource managed version of i2c_new_dummy_device() that
> also returns an actual error code instead of a NULL-pointer. Use it
> in the max732x GPIO driver and simplify code in the process.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

If there are no objections I'll apply it by the end of this week.

Bart

>  drivers/gpio/gpio-max732x.c | 37 ++++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index f03cb0ba7726..7fd1bdfe00e5 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -652,12 +652,12 @@ static int max732x_probe(struct i2c_client *client,
>         case 0x60:
>                 chip->client_group_a =3D client;
>                 if (nr_port > 8) {
> -                       c =3D i2c_new_dummy(client->adapter, addr_b);
> -                       if (!c) {
> +                       c =3D devm_i2c_new_dummy_device(&client->dev,
> +                                                     client->adapter, ad=
dr_b);
> +                       if (IS_ERR(c)) {
>                                 dev_err(&client->dev,
>                                         "Failed to allocate I2C device\n"=
);
> -                               ret =3D -ENODEV;
> -                               goto out_failed;
> +                               return PTR_ERR(c);
>                         }
>                         chip->client_group_b =3D chip->client_dummy =3D c=
;
>                 }
> @@ -665,12 +665,12 @@ static int max732x_probe(struct i2c_client *client,
>         case 0x50:
>                 chip->client_group_b =3D client;
>                 if (nr_port > 8) {
> -                       c =3D i2c_new_dummy(client->adapter, addr_a);
> -                       if (!c) {
> +                       c =3D devm_i2c_new_dummy_device(&client->dev,
> +                                                     client->adapter, ad=
dr_a);
> +                       if (IS_ERR(c)) {
>                                 dev_err(&client->dev,
>                                         "Failed to allocate I2C device\n"=
);
> -                               ret =3D -ENODEV;
> -                               goto out_failed;
> +                               return PTR_ERR(c);
>                         }
>                         chip->client_group_a =3D chip->client_dummy =3D c=
;
>                 }
> @@ -678,36 +678,34 @@ static int max732x_probe(struct i2c_client *client,
>         default:
>                 dev_err(&client->dev, "invalid I2C address specified %02x=
\n",
>                                 client->addr);
> -               ret =3D -EINVAL;
> -               goto out_failed;
> +               return -EINVAL;
>         }
>
>         if (nr_port > 8 && !chip->client_dummy) {
>                 dev_err(&client->dev,
>                         "Failed to allocate second group I2C device\n");
> -               ret =3D -ENODEV;
> -               goto out_failed;
> +               return -ENODEV;
>         }
>
>         mutex_init(&chip->lock);
>
>         ret =3D max732x_readb(chip, is_group_a(chip, 0), &chip->reg_out[0=
]);
>         if (ret)
> -               goto out_failed;
> +               return ret;
>         if (nr_port > 8) {
>                 ret =3D max732x_readb(chip, is_group_a(chip, 8), &chip->r=
eg_out[1]);
>                 if (ret)
> -                       goto out_failed;
> +                       return ret;
>         }
>
>         ret =3D gpiochip_add_data(&chip->gpio_chip, chip);
>         if (ret)
> -               goto out_failed;
> +               return ret;
>
>         ret =3D max732x_irq_setup(chip, id);
>         if (ret) {
>                 gpiochip_remove(&chip->gpio_chip);
> -               goto out_failed;
> +               return ret;
>         }
>
>         if (pdata && pdata->setup) {
> @@ -719,10 +717,6 @@ static int max732x_probe(struct i2c_client *client,
>
>         i2c_set_clientdata(client, chip);
>         return 0;
> -
> -out_failed:
> -       i2c_unregister_device(chip->client_dummy);
> -       return ret;
>  }
>
>  static int max732x_remove(struct i2c_client *client)
> @@ -744,9 +738,6 @@ static int max732x_remove(struct i2c_client *client)
>
>         gpiochip_remove(&chip->gpio_chip);
>
> -       /* unregister any dummy i2c_client */
> -       i2c_unregister_device(chip->client_dummy);
> -
>         return 0;
>  }
>
> --
> 2.21.0
>
