Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C4841EA3C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 11:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238512AbhJAKA1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 06:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353252AbhJAKA1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 06:00:27 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F12CC06177C
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 02:58:43 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id r4so19348943ybp.4
        for <linux-gpio@vger.kernel.org>; Fri, 01 Oct 2021 02:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+uUHmF2RAI7sGbaKJoO4TbpCYkh0FNhqLtnQn6C5nRU=;
        b=B/w1+gFIDYDBBVD5ke/IYcG9PiVaGQrFIW+FP7bHGT0AHZNr3RXHy+r41P5ZSriwVd
         qyKrX7I+hmEdtb6G9DDDj0guwCOeZn705q5suOzsPBeiI3x6y6S6GmVYptwR/BNejdB/
         Rxj/zob1caMoNb7I/Z2GwwZMWqsn64/7A/ZjqcOt+RFAL6cQ8leOaSA3vQ/JchDB7GZG
         iJn0nKcPfAS0BNfHpBaMDevGHbhdlemAy6N/IH/+ykTZa9x/oGPMAcJ95H5nMEMMcykd
         rPnY99D090Ilp1EUnxhAxsc6A85epbVewDQsA8P6rSzmQZvuhVgAlcRdxrzdSucu4ylT
         j/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+uUHmF2RAI7sGbaKJoO4TbpCYkh0FNhqLtnQn6C5nRU=;
        b=trhMvWO/EufIPVUSF14yiLYf6Lze3XGGsgPWnw9skRQrYDBxfJKKDauRfbFqDeC88l
         DpyfgZj8/MwNezjiEIXTjc9LuhVq/A+ZhIWlBQ+0KzLpsdrtbj4lzdTjC+LEiJoPaxnD
         joAGGf//MDtbMfKZ4mM4OvCRmuOf1YNegZDgGbfW4rWebxlbGPj3H8El6E6bsgEjzh+8
         L9l3acKcCBu694U9gR532ZuOc+aNLGdz/TK68ZSnaiJ3IPaSo7X5lfumh5orwtsnl8uS
         s/L3Y0pq43GmSrYPLthffGyLEXfQyL9vORLT9ZtVZGvCmkivAEgoS/z1krvowXuYAvon
         TLMA==
X-Gm-Message-State: AOAM533MEHL3px2zUIqpNYbsmAW8djmRxWUat3JGVbN9k0atD34AgmcC
        DYNHTlRIYads4boOiHy8roUs/ILqNSfqakYJIFLqKQfVIyY=
X-Google-Smtp-Source: ABdhPJz0BOFm+x8/UFrf+y3CI5cVPYOdCxxnW3Sif8MwolFw8b0XI6lihHmRXLsz2GG1NReXzKCrbVzH9S4X793QBGw=
X-Received: by 2002:a5b:783:: with SMTP id b3mr4867872ybq.328.1633082322563;
 Fri, 01 Oct 2021 02:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210923224640.62258-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210923224640.62258-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 1 Oct 2021 11:58:31 +0200
Message-ID: <CAMpxmJWG1rO69i9WmFu-a23W2cjNtabyySoAyOB-NXCN5VjNHw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: Improve bias setting
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 24, 2021 at 12:46 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The commit 15add06841a3 ("gpio: pca953x: add ->set_config implementation")
> introduced support for bias setting. However this, due to being half-baked,
> brought potential issues:
>  - the turning bias via disabling makes the pin floating for a while;
>  - once enabled, bias can't be disabled.
>
> Fix all these by adding support for bias disabling and move the disabling
> part under the corresponding conditional.
>
> While at it, add support for default setting, since it's cheap to add.
>
> Fixes: 15add06841a3 ("gpio: pca953x: add ->set_config implementation")
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index f5cfc0698799..dac4d772a4d1 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -566,21 +566,21 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
>
>         mutex_lock(&chip->i2c_lock);
>
> -       /* Disable pull-up/pull-down */
> -       ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, 0);
> -       if (ret)
> -               goto exit;
> -
>         /* Configure pull-up/pull-down */
>         if (config == PIN_CONFIG_BIAS_PULL_UP)
>                 ret = regmap_write_bits(chip->regmap, pull_sel_reg, bit, bit);
>         else if (config == PIN_CONFIG_BIAS_PULL_DOWN)
>                 ret = regmap_write_bits(chip->regmap, pull_sel_reg, bit, 0);
> +       else
> +               ret = 0;
>         if (ret)
>                 goto exit;
>
> -       /* Enable pull-up/pull-down */
> -       ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, bit);
> +       /* Disable/Enable pull-up/pull-down */
> +       if (config == PIN_CONFIG_BIAS_DISABLE)
> +               ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, 0);
> +       else
> +               ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, bit);
>
>  exit:
>         mutex_unlock(&chip->i2c_lock);
> @@ -594,7 +594,9 @@ static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>
>         switch (pinconf_to_config_param(config)) {
>         case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
>         case PIN_CONFIG_BIAS_PULL_DOWN:
> +       case PIN_CONFIG_BIAS_DISABLE:
>                 return pca953x_gpio_set_pull_up_down(chip, offset, config);
>         default:
>                 return -ENOTSUPP;
> --
> 2.33.0
>

Applied, thanks!

Bart
