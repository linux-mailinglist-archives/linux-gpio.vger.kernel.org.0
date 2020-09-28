Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DDF27ABB5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 12:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgI1KTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 06:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgI1KTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:19:35 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE4FC0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:19:33 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id e22so685985edq.6
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HHY2LitkeyuKE1ueF79fzsqA8gZGVBNl2y26Vi+0G7w=;
        b=MuZN73SUJay7gOjonPYwPI9p88HhEJpd6OklwrVJ1WYR7Pwg3gZE9S2iLwX2jUn0Yl
         Ga2nhyy5CwTRuHevkTvvHwNuyZi7wBsh40p2iGbl0DfXPqVCAYev2seVzzj8i2Tqo0FJ
         PB6kNQTqSXaZ9/GNQaYIRVmskHf3QQMm10kq36d6zAQuj8sHQwABeC75MDxRU7DxBCL1
         PzbUYgSsIIwwTxmUp53/gz9dv7IAueiHR3deSivi95hhVzOO8KCEwKM+Sh+ObJWT0v5c
         nfujMuHzcNTbNlTq4My3xZlXs3Y/HovWFpB8JCZoqk3S3Fagu5Fd+z1gj0omwF5q5oKD
         0blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HHY2LitkeyuKE1ueF79fzsqA8gZGVBNl2y26Vi+0G7w=;
        b=Vzo+VHlAEI4whaBKN4UpTIhY5Iz9lVy/udBcjh0PDCJVx/WoDV/p4ZPZWOVOCdTckv
         x5Nh2BarNfuMQT5gfQyooL8xDV3FBeCdLNKkG1Q1WSMNvIl1BiX4kzMaL2qvaNJ6uXVv
         TArsxKbSKwqoglVUI0wuIGX0Y/AMhwvylsO+u1EmLEc6kKuSMxyF3MX9o3QEemdEXk9E
         QExGaeAfOazQpvl2E0VZQINTZaHvmV3h1yYG2h8mEk793Dasgst0akm7Qalf7cyckucP
         YpagvDD8v9xIQ5N+DvCjWdI+rNr3lFzhNMtuvenuXrfEasY4Vz89Wwg47FgL+rZu0vf+
         8OHw==
X-Gm-Message-State: AOAM532XY/JCk/8jbWODlsP+t78yQF4MnvblLhBfevgG5RqCsswLxHC1
        bIQaJx+G+wmgzoJLyxH6oGp6i36J7l+dnvHW90cUgA==
X-Google-Smtp-Source: ABdhPJz0fRfokckEsdMIHPWlQ+ZJ7Z2nVZUNqonyr5ezT7aGO4E5eOLmu124oJDJaz4YmyI3V+UIpB2m5eBGqhyy0lU=
X-Received: by 2002:a05:6402:78b:: with SMTP id d11mr882112edy.341.1601288372214;
 Mon, 28 Sep 2020 03:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl> <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <e3a3979657babf716e5f4072e373637ce86ad7ff.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 12:19:21 +0200
Message-ID: <CAMpxmJV5A3OkNNmVcc0AZ+gHo_G2h2D7QrNjc=vKH-6O4mOYhw@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: tps65910: use regmap accessors
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 27, 2020 at 1:59 AM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:
>
> Use regmap accessors directly for register manipulation - removing one
> layer of abstraction.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/gpio/gpio-tps65910.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
> index 0c785b0fd161..0c0b445c75c0 100644
> --- a/drivers/gpio/gpio-tps65910.c
> +++ b/drivers/gpio/gpio-tps65910.c
> @@ -28,7 +28,7 @@ static int tps65910_gpio_get(struct gpio_chip *gc, unsi=
gned offset)
>         struct tps65910 *tps65910 =3D tps65910_gpio->tps65910;
>         unsigned int val;
>
> -       tps65910_reg_read(tps65910, TPS65910_GPIO0 + offset, &val);
> +       regmap_read(tps65910->regmap, TPS65910_GPIO0 + offset, &val);
>
>         if (val & GPIO_STS_MASK)
>                 return 1;
> @@ -43,10 +43,10 @@ static void tps65910_gpio_set(struct gpio_chip *gc, u=
nsigned offset,
>         struct tps65910 *tps65910 =3D tps65910_gpio->tps65910;
>
>         if (value)
> -               tps65910_reg_set_bits(tps65910, TPS65910_GPIO0 + offset,
> +               regmap_set_bits(tps65910->regmap, TPS65910_GPIO0 + offset=
,
>                                                 GPIO_SET_MASK);
>         else
> -               tps65910_reg_clear_bits(tps65910, TPS65910_GPIO0 + offset=
,
> +               regmap_clear_bits(tps65910->regmap, TPS65910_GPIO0 + offs=
et,
>                                                 GPIO_SET_MASK);
>  }
>
> @@ -59,7 +59,7 @@ static int tps65910_gpio_output(struct gpio_chip *gc, u=
nsigned offset,
>         /* Set the initial value */
>         tps65910_gpio_set(gc, offset, value);
>
> -       return tps65910_reg_set_bits(tps65910, TPS65910_GPIO0 + offset,
> +       return regmap_set_bits(tps65910->regmap, TPS65910_GPIO0 + offset,
>                                                 GPIO_CFG_MASK);
>  }
>
> @@ -68,7 +68,7 @@ static int tps65910_gpio_input(struct gpio_chip *gc, un=
signed offset)
>         struct tps65910_gpio *tps65910_gpio =3D gpiochip_get_data(gc);
>         struct tps65910 *tps65910 =3D tps65910_gpio->tps65910;
>
> -       return tps65910_reg_clear_bits(tps65910, TPS65910_GPIO0 + offset,
> +       return regmap_clear_bits(tps65910->regmap, TPS65910_GPIO0 + offse=
t,
>                                                 GPIO_CFG_MASK);
>  }
>
> @@ -157,7 +157,7 @@ static int tps65910_gpio_probe(struct platform_device=
 *pdev)
>                 if (!pdata->en_gpio_sleep[i])
>                         continue;
>
> -               ret =3D tps65910_reg_set_bits(tps65910,
> +               ret =3D regmap_set_bits(tps65910->regmap,
>                         TPS65910_GPIO0 + i, GPIO_SLEEP_MASK);
>                 if (ret < 0)
>                         dev_warn(tps65910->dev,
> --
> 2.20.1
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
