Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397C239040F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbhEYOhV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbhEYOhL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:37:11 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E49C061344
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:40 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id y197so1630494ybe.11
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/xaJuWLhZlz0DYoLsBK4X2lV3sraj59LlQN0XX3kQkw=;
        b=yys3hV6neU28U36X0sNo3xbd0YgFDnuNYotoqtVACDebcsDbxQesa7SeIf1cnU+KG1
         CrwjK/zEN/9nsKDuAUeyg/jI85qTvuBCowZ38S+GPSAqKLDRAoVfBT5nEYkebKmZ0eTo
         G9HyeIyLiE1PoP9QH+0ag7cz7NiA9KxBVIadcywG60rHVlzGqdls1/uiWSiiYqEnO/Ev
         vTIb2zpDf8j+hxr1zD2Sb0wXlvFo7LLoe8DnmUrYXSS9/36m1ojL2zY8ukJ1eIJLdcYt
         asfZgdhHKHkkslYy5Ifkwp1atZlXbjNsdJzfETb74mUz+KJy3MaWocTtS2zrehMdTOf+
         an4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/xaJuWLhZlz0DYoLsBK4X2lV3sraj59LlQN0XX3kQkw=;
        b=MBWoqQk+6Bk/z3DkC6FKG3JSTTl3ziEs9Xf1gaAUeD/KUi6bYjPq5kZ6vmTiSxXfbI
         MF4pzJmNGLUjWTh3FKcxj8JhotjeIlrJduTfURpiAKIrY7f3vxxeG6NqeDBaS/x1tmVq
         RJ4TPATy1V/bZWS0ASt9WicKhmrimkle2knzNh5maCSSdfxW+eJeEUcVUSei1K83BN4C
         BTNvi4Xb703OD2jqtmCdhXGnJLBc7MgjO/zURnQEpKAasYTFMr5GwHefx/soPrn5XJ4g
         zlHmWFL4Uf/dTuMKY6sCOI2pAC82DnYMYAcVmWyVsT60ZLAvBezNU0a4G8cjeGAgd4uh
         dvHw==
X-Gm-Message-State: AOAM530OWFmYaP8Z1Yn+FXVMamRx9UVeo9SzzdRXtUb40G51Oc5FuvS8
        Qi9BA2icVd5w2AnfI1eHYUTU2+BqNGnYAQYjT91YaDL+KdQ5hH4a
X-Google-Smtp-Source: ABdhPJxCHSa2TM9XgKFOn/I0OdBvGx0TdXIWi5OJS7dWOcK4tL3ub4Cv1Srfnt9GhxsD41dpqxSKAZwa/HtKHYUwiaw=
X-Received: by 2002:a25:1804:: with SMTP id 4mr9017891yby.157.1621953339603;
 Tue, 25 May 2021 07:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210517113540.237495-1-aardelean@deviqon.com>
In-Reply-To: <20210517113540.237495-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:35:29 +0200
Message-ID: <CAMpxmJWbz1ORhaEZGcS7dKqzo31JDcA7hZRRGuFFnJ7cBNuDGQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-wm831x: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 1:36 PM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> If this is removed, we can also just do a direct return on
> devm_gpiochip_add_data(). We don't need to print that this call failed as
> there are other ways to log/see this during probe.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-wm831x.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
> index a3a32a77041f..9cf1e5ebb352 100644
> --- a/drivers/gpio/gpio-wm831x.c
> +++ b/drivers/gpio/gpio-wm831x.c
> @@ -261,7 +261,6 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
>         struct wm831x *wm831x = dev_get_drvdata(pdev->dev.parent);
>         struct wm831x_pdata *pdata = &wm831x->pdata;
>         struct wm831x_gpio *wm831x_gpio;
> -       int ret;
>
>         wm831x_gpio = devm_kzalloc(&pdev->dev, sizeof(*wm831x_gpio),
>                                    GFP_KERNEL);
> @@ -280,16 +279,7 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
>         wm831x_gpio->gpio_chip.of_node = wm831x->dev->of_node;
>  #endif
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &wm831x_gpio->gpio_chip,
> -                                    wm831x_gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, wm831x_gpio);
> -
> -       return ret;
> +       return devm_gpiochip_add_data(&pdev->dev, &wm831x_gpio->gpio_chip, wm831x_gpio);
>  }
>
>  static struct platform_driver wm831x_gpio_driver = {
> --
> 2.31.1
>

Applied, thanks!

Bart
