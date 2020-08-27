Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15CB8254ED5
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgH0TkO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 15:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0TkL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 15:40:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9319C061264;
        Thu, 27 Aug 2020 12:40:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id v15so4090982pgh.6;
        Thu, 27 Aug 2020 12:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z5MuJjj2BRfbffbktmUArXq0jWI8OrbgvmEfcOOymls=;
        b=jD6rxi6RNgMg4A02GWwlrSmHVsI6daGM+MmqCIfnw+vIJT9IGKVs7tbi3VQAQAbCE3
         CjrQHAJbjT2+9zVMdW0qpamSo7TWDvJg3/cFjdKU6DsI0Ycld94iMACgBtWDSvzEivXr
         w955vfZwxMUuvtc0StzNJ1jVrXsZVXWzpzyJT7Mm0PqUhEOJ6CDb/2NEUN30WwhgVY8e
         zOxUvFYX3zCNDEdw2wF5xJJSdYQkqUXtyQ4TI9P9+A+MqI54GrJChGoqHsA8lPIKeE2r
         kdb7eqLbYLSDUKZquR0uwI6D58REZf9bwpjXV6RzQ481l8xmLPeBM/DGSHj8NYk2n1jb
         5CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z5MuJjj2BRfbffbktmUArXq0jWI8OrbgvmEfcOOymls=;
        b=ti/ZCIfqZ48VlHFxm54I4xu3ccheYqJDXUrx2KjhJCJmZzGGNUAhA35AQioffS3Azg
         nsidnCsSta/mlJP/gHabr3s04y/flRvy5Nk8hmbUdOm4ZSLF6PAv+Kvd/pwFWlDUxxTr
         Er61kTiTir2wgDkOEJrf1lqVOUjjJeFlSJGtWRfX6mIqhAFaNEwJMAiPDzYnqVHM1f42
         RsjkYMPWQ6yuMEsebHP5tfb1wmWiPfZ1rUTmMRQZU7JdN42i58T3kbnHZg7kFMw0Ckrv
         Kweck6BUuiJ59duj6sVf5O1xUuF2dW7fjjjx9T9/m9O5DMmm+tbkowf/mB1QgHOOAQn2
         THxg==
X-Gm-Message-State: AOAM532HIZNyLf8IhJwSz8Rf4Mxov/xDNklIhTUSwQdirsg4M5r41Brb
        hLL8z22Veg9MlzEi0YnCclPtqt3Me5zoj5Wveo4=
X-Google-Smtp-Source: ABdhPJyPfAs6F4scl/LPTaagO1N/0A6aEX5LL2g/s14gO2zqJshHDT5Mu870D8LHna1d3azm8Pri1UOohGi10Tv++TE=
X-Received: by 2002:a63:ec18:: with SMTP id j24mr15213316pgh.74.1598557211293;
 Thu, 27 Aug 2020 12:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-8-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-8-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 22:39:54 +0300
Message-ID: <CAHp75VcHpPTAJxd9bTbEkEW=4F1FCzTzHS=DCDWnvsjjXvMV=A@mail.gmail.com>
Subject: Re: [PATCH v3 07/27] Input: bu21013_ts - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 9:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> ---
>
> Changes since v1:
> 1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
> ---
>  drivers/input/touchscreen/bu21013_ts.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
> index 2f1f0d7607f8..86bd38243d6c 100644
> --- a/drivers/input/touchscreen/bu21013_ts.c
> +++ b/drivers/input/touchscreen/bu21013_ts.c
> @@ -496,12 +496,10 @@ static int bu21013_probe(struct i2c_client *client,
>
>         /* Named "CS" on the chip, DT binding is "reset" */
>         ts->cs_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> -       error = PTR_ERR_OR_ZERO(ts->cs_gpiod);
> -       if (error) {
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev, "failed to get CS GPIO\n");
> -               return error;
> -       }
> +       if (IS_ERR(ts->cs_gpiod))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->cs_gpiod),
> +                                    "failed to get CS GPIO\n");
> +
>         gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");
>
>         error = devm_add_action_or_reset(&client->dev,
> @@ -516,11 +514,8 @@ static int bu21013_probe(struct i2c_client *client,
>         ts->int_gpiod = devm_gpiod_get_optional(&client->dev,
>                                                 "touch", GPIOD_IN);
>         error = PTR_ERR_OR_ZERO(ts->int_gpiod);
> -       if (error) {
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev, "failed to get INT GPIO\n");
> -               return error;
> -       }
> +       if (error)
> +               return dev_err_probe(&client->dev, error, "failed to get INT GPIO\n");
>
>         if (ts->int_gpiod)
>                 gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
