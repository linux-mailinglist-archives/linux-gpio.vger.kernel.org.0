Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B85D62DB
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 14:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730988AbfJNMoH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 08:44:07 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35023 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730733AbfJNMoH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 08:44:07 -0400
Received: by mail-io1-f66.google.com with SMTP id q10so37675593iop.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Iu3uh6VGrqxTgnm4Zi0XGQ3TgSJ/wMbjAhBye9ZS9cw=;
        b=U9xd7wrOgIbSeY9xP4LJIYOociumRs6sx4OzwJQBCdl5i7uvIHtpbcf+KQc9Hvw3xF
         AUnLFD389dCXA5ZSRbkCnEUwlIBRV+rBDmsd5m6EAUNB4S+Gn990co4gxm3aT1XVhLKi
         io9zR9aotlWcVn+kxMWZYbqaLiszT9lydTFroYy4Cquu8+0S6n8r5m62WF49uTqK6E+l
         GF0af6WurBoT418DawxaGzQdG3HMGspGqvSom8xF4UWD4FKzkDjk9aGbaC1IP2dLM9XK
         9QqnNI08bZa/41QhAgiEoVYz63y1id8dgRcL1J0qnWYuWxCW7XtAQ84QkcgMXppE4hXz
         AYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Iu3uh6VGrqxTgnm4Zi0XGQ3TgSJ/wMbjAhBye9ZS9cw=;
        b=Urjrpfn6clh3fv9CHXAv9JZ7TEp1Na0jaKNk1X6vzcAHMXm6Td1tLx2i/uox2pw8Qn
         /L+gZzW6Hsas0YjmCXYuQ7jpjK2DygDF0GiqBj6VfDl/Q/X3YdwLRnxw8JOpLU+fU6FU
         H2yQTq1reKHSG63nl+LpAN8OB1CRcqXwRfivbLxySFT6beF9El1q7P9yn1xIydka71Y7
         RCZajnyC9JyaahX+5pe4YGdhwD+DBtxdy+GF3xJYIqryRYwviugiA7e9IvcQQ04NvsbL
         st9K7A+W0X1ZeDXYOnz6pMjhy4vLXAonKvS2BKAIBcSAWGVHnZcGz/b5TubO2OwrOsvy
         RIqw==
X-Gm-Message-State: APjAAAUH1cCbKK8/nd7628xjimsQJaokTx7NMChUbCMGZ5pEx+rmY8xT
        OX2at7JBOHIxT1PhPPQQlHOzKp4m94Z9DQtDTuN3EA==
X-Google-Smtp-Source: APXvYqyHbBR25RO9hm+AjSr7RnBLLgLNqB6bbUSxyuyOal80V4ya1RRZfBY6A6j5w0oLhz1VOIt39pVTZtOfZzxO4Bg=
X-Received: by 2002:a05:6602:10f:: with SMTP id s15mr14849639iot.220.1571057045073;
 Mon, 14 Oct 2019 05:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-6-warthog618@gmail.com>
In-Reply-To: <20191012015628.9604-6-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Oct 2019 14:43:54 +0200
Message-ID: <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> This patch allows pull up/down bias to be disabled, allowing
> the line to float or to be biased only by external circuitry.
> Use case is for where the bias has been applied previously,
> either by default or by the user, but that setting may
> conflict with the current use of the line.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 647334f53622..f90b20d548b9 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gde=
v, void __user *ip)
>             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
>                 return -EINVAL;
>
> -       /* Same with pull-up and pull-down. */
> -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> -               return -EINVAL;
> -
>         /*
>          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single reques=
t. If
>          * the hardware actually supports enabling both at the same time =
the
> @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev=
, void __user *ip)
>              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
>                 return -EINVAL;
>
> -       /*
> -        * Do not allow both pull-up and pull-down flags to be set as the=
y
> -        *  are contradictory.
> -        */
> -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> -               return -EINVAL;
> -
>         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
>         if (!le)
>                 return -ENOMEM;
> @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, un=
signed offset,
>         unsigned arg;
>
>         switch (mode) {
> +       case PIN_CONFIG_BIAS_DISABLE:
>         case PIN_CONFIG_BIAS_PULL_DOWN:
>         case PIN_CONFIG_BIAS_PULL_UP:
>                 arg =3D 1;
> @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
>         if (ret =3D=3D 0)
>                 clear_bit(FLAG_IS_OUT, &desc->flags);
>
> -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> +                               PIN_CONFIG_BIAS_DISABLE);
> +       else if (test_bit(FLAG_PULL_UP, &desc->flags))

From looking at the code: user-space can disable bias when setting
both PULL_UP and PULL_DOWN flags. I don't understand why it's done in
this implicit way? Why not a separate flag? Also: I don't like that
this patch deletes code added by earlier patches in this series. If we
really need this, then it should be rearranged.

Bart

>                 gpio_set_config(chip, gpio_chip_hwgpio(desc),
>                                 PIN_CONFIG_BIAS_PULL_UP);
>         else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> @@ -4462,7 +4454,7 @@ int gpiod_configure_flags(struct gpio_desc *desc, c=
onst char *con_id,
>
>         if (lflags & GPIO_PULL_UP)
>                 set_bit(FLAG_PULL_UP, &desc->flags);
> -       else if (lflags & GPIO_PULL_DOWN)
> +       if (lflags & GPIO_PULL_DOWN)
>                 set_bit(FLAG_PULL_DOWN, &desc->flags);
>
>         ret =3D gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
> --
> 2.23.0
>
