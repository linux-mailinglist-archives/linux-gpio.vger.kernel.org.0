Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4975238DC6F
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 20:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhEWSeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 14:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbhEWSeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 14:34:07 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DDFC061756
        for <linux-gpio@vger.kernel.org>; Sun, 23 May 2021 11:32:40 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id r8so34858080ybb.9
        for <linux-gpio@vger.kernel.org>; Sun, 23 May 2021 11:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MrBKPkLd0GPEoJRc/y1IxZTBQ7SxwLafLOfLA+MVi4Y=;
        b=kvlo+cd5IVnaI9LZz/ljNfjHmPfQ27rucW8tNNag0/3T7j8dWVifg7+g7Z440XXUJF
         QHNmO0wZexx6WDanF/JoubAwMWgjMhtkExAjiDmqP9+es6WHmw+GZmTf48C/i9P/xt1F
         tbNfnj/mj5qL0Jwyxw56IZrCeYUYiVGvLvzsBlYsi4r3EPIQ2Rci1x3lq9GKIZIREq5i
         Ne7GBDS+kdDrBBF0SZT6mdVRZeZPxJMy9kJHuQGQA5J+01ueR3nfl/KJjwDOBFgIriRu
         Y/tyhFnwW6vQ9gQ2X4jXoSG25/jwhngWYP9SJ7XDBcMzKzZ4eUnuE5921D0nZxNlUieO
         lfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MrBKPkLd0GPEoJRc/y1IxZTBQ7SxwLafLOfLA+MVi4Y=;
        b=sREhpmggDz2iUGnGjt84GnL8mRLZLmc3WlHtIQznl/UJPGQYqaYCbbJ0Cw/OcR4fuv
         2PPWNj2/vnzWJ4l+gPPTiHCrUtb7oFrFW16kTH8UfWsvCzOADpcGPiP2B2IoXS3Mzdpl
         ZbdHmg//nUd7KkLJSuBP+TY//tzeVp/R7MQwzWUQIGqJkt7DEGtgbM6gVIiDo7Ski9dq
         f10QIqYzC9u09CpH7W97WVMiuhvwuwuRxehUDDEK07GZvf+XzKlv59HkRddV3gz03EzE
         S3XNR97j3aaMfB2/Qhe2zkpukrH+z2G+Sw021PyTk0o5vawFegTfKGuPoHuioa0QoUM2
         WdZQ==
X-Gm-Message-State: AOAM530ich02JITRlexLqgdUSmw150YTRVcS9ujDAlRX2YfyvUk1oFO0
        MWsTPdSr8Gph99qCmsCjceAkuile/RdGkRHdb6AQoCf8+sc=
X-Google-Smtp-Source: ABdhPJwfxcVy5z34lJ3D92Wj9E7WhnjA/FPIzlOHSj5VEVWxK2RhtuZ3DMVzLygHQT5xuZ1dagLFIKVb46J32Tn5wsc=
X-Received: by 2002:a25:287:: with SMTP id 129mr29266156ybc.312.1621794759679;
 Sun, 23 May 2021 11:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210521181355.9983-1-aardelean@deviqon.com>
In-Reply-To: <20210521181355.9983-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 23 May 2021 20:32:28 +0200
Message-ID: <CAMpxmJUT_ynN=9aVZ7DMSo+X2D2A0gakuAHmxrucue3ty=dZsg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-da9052: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 8:14 PM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> If this is removed, we can also just do a direct return on
> devm_gpiochip_add_data(). We don't need to print that this call failed as
> there are other ways to log/see this during probe
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-da9052.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
> index 9aa59afdcbbf..559188d80c2b 100644
> --- a/drivers/gpio/gpio-da9052.c
> +++ b/drivers/gpio/gpio-da9052.c
> @@ -196,7 +196,6 @@ static int da9052_gpio_probe(struct platform_device *pdev)
>  {
>         struct da9052_gpio *gpio;
>         struct da9052_pdata *pdata;
> -       int ret;
>
>         gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>         if (!gpio)
> @@ -209,15 +208,7 @@ static int da9052_gpio_probe(struct platform_device *pdev)
>         if (pdata && pdata->gpio_base)
>                 gpio->gp.base = pdata->gpio_base;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, gpio);
> -
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
>  }
>
>  static struct platform_driver da9052_gpio_driver = {
> --
> 2.31.1
>

Applied, thanks!

Bart
