Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D46E218D5F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 18:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730315AbgGHQpf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 12:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730278AbgGHQpf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 12:45:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A6BC061A0B;
        Wed,  8 Jul 2020 09:45:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id md7so1436832pjb.1;
        Wed, 08 Jul 2020 09:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/0QaE6E8CXzLAPNfsNVNICr8uQjOJBz75blux9yeZRY=;
        b=ZPaJPdozMAQiL2Gq+tWHaGQ/IRAzrfgb72YMuC5chBqeUEHy/NNFCnayfq122lo6K4
         lTNNaNgPZykcZ4Thl5hIfwvvuGI6hwji6HqDBIg86i9xQWhTqJ5PoOBCszgwClJ3a9gK
         n6jVRhwMzu1fHl5uA1+jkWu5vV7cLzFxh0PM00rJwfjNu+6lqmGtEN1iViLcawmwYMWx
         ttPt9TMxbyzUV2vBMJi+jRv6qeyHGXzbFp1LfXVmdNTcxXgRIkAUINAeUWrDI4t2th/y
         BhqKtQoZOfMIGvUsYFeJX744JCIXSgX4ElOZ1SAlrYpqgw+9q9BPpp0PikQh3/3if5As
         5avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/0QaE6E8CXzLAPNfsNVNICr8uQjOJBz75blux9yeZRY=;
        b=uoNm1umtbcLQ4EXP91QqmVuWda4TSYyuo4jrIwjIN0L2pE8I8VqShsT6s1C106M19/
         bKduJoCinQh3SADSFZRUmPtQNbb3/UeVbUdkyQMqriBUF3Ftvh62WX5zYL84XI+9YvsW
         ogz+ZwzI8fyCMgNRBz3XpAE3E2xlP1AdT9m0i9c2R2a9o+kSYExdda1s9HaxfVz0nhuc
         qCYf4EglUQG//r+8j3Yba78x9oZrsNF7aJINLUL2NBVfCUawn96slthy4quVN5ZqZhul
         +mant38PmXRFjw2Kig8POOUQNfvcpW0V5fqKo5OJBfByKIEp5tlz12r2gw72zf3GNsES
         Lqcw==
X-Gm-Message-State: AOAM533cYThngN9WelUz4bGDJJKwSd9uMzVW0KpKthKzvb5UoIbn/L9+
        K6e3inh1Iu0vAT3vwED7k2GyygrdEo0VFH1yT2g=
X-Google-Smtp-Source: ABdhPJw/9tCiF8Lg8K1frvEARIekU3Ycw+ZcCSwFx5Jcd6FFxgQUP1wz5lTVdVNaeVg63WLJLPKx9iXKjUcpc1CCYqs=
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr51792321pll.18.1594226734775;
 Wed, 08 Jul 2020 09:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200708155834.19762-1-digetx@gmail.com> <20200708155834.19762-3-digetx@gmail.com>
In-Reply-To: <20200708155834.19762-3-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 19:45:18 +0300
Message-ID: <CAHp75VeKKDevnYgu-te9DzND5nm1EfZQFCjEsGhaDg3yJn9-Kw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 6:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
> let's use it instead of a raw value in order to improve the code's
> readability a tad.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/gpio-max77620.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
> index 970ad6397a56..08bd5b141437 100644
> --- a/drivers/gpio/gpio-max77620.c
> +++ b/drivers/gpio/gpio-max77620.c
> @@ -19,8 +19,8 @@ struct max77620_gpio {
>         struct regmap           *rmap;
>         struct device           *dev;
>         struct mutex            buslock; /* irq_bus_lock */
> -       unsigned int            irq_type[8];
> -       bool                    irq_enabled[8];
> +       unsigned int            irq_type[MAX77620_GPIO_NR];
> +       bool                    irq_enabled[MAX77620_GPIO_NR];
>  };
>
>  static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
> @@ -38,7 +38,7 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
>
>         pending = value;
>
> -       for_each_set_bit(offset, &pending, 8) {
> +       for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
>                 unsigned int virq;
>
>                 virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
> --
> 2.26.0
>


-- 
With Best Regards,
Andy Shevchenko
