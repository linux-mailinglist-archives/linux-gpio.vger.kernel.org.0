Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2038139040E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbhEYOhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234060AbhEYOhB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:37:01 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7ECC061342
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:26 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id y2so43288711ybq.13
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J0ilzBZBqgocsd6m3/38+62PwrCky8NxPuNNGb80sqQ=;
        b=FGvaMn+jc8e9BOSTKrGpT0ZgugPpAo89cUkcwFeRY9RkLWxf0mK1IZH/IJj7VQuH9a
         v0iFOADs4WdKtYLfQBwafB6bCoxu0WssKVtgLrmeTUGU2MDhieu4dm8jpmx8+xmqJXRJ
         uO14ZSo5nKIlfPxpWF4YYIa6ffUcS45cdWUxmrxAOfxjyap+NxiO0blIvyUpuI5FIMSR
         iLSaHz7BxmK5Q9NUgvFNRmM69rbKtSvFnAVMe6cmyLlxPVb6PFFHUlHg1EDgo+HglrEY
         /AzFOQaiQPL2njYmntYPE7BXppHF+M3jgmpaZBk3iVxaFEvufp3kS/N6lmC7K99xraml
         XKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J0ilzBZBqgocsd6m3/38+62PwrCky8NxPuNNGb80sqQ=;
        b=g91lyH/9+guYu50LOATuYdz+9yqQxwQ+hbGiQkBq6T2CPmB5t8FIs0Ypk42L9kSv7D
         wAoPgQ8yngJKIyD25xwyOQoJ6olBlIeBaK6RNGHN/WfyMa0lOmJ/kU1by58yn4jcYRDs
         +T2uGNh3wUFXMhDXf/KzYes6brzVNsRJYW8dIMQgFOKAJYMWUWdCFH5R//MAJ/u6HdPj
         MkBKZuq8u+iOyB28ty0NlrZLrRSIi425rGn2HTkMPN1ROSemzJShHcHfiTghE+sH0HKt
         POqU6V3ahIbBX/8xh3d6o3MMhHJBVrsju+VrSjoAGBjECIlRo6oM/dG5KaXzwN9tCdrq
         d9UA==
X-Gm-Message-State: AOAM53194Mza9fKkuG2+V1eOaaTzaNw7mL16rXdoiZTc3GHtVXn2cn0m
        Bgj4oofukWfRDW8tfm/uqbQP4QghF5CS9xnUxvSBOQ==
X-Google-Smtp-Source: ABdhPJyd3jfLMLE42rOgZfwBIlc6l2gUBteMt4UM9fTNicFnjr+w8GiaX9J0f8/fQUBEe8jbB9/I64op3ZsuLyrA6ig=
X-Received: by 2002:a25:8804:: with SMTP id c4mr43685162ybl.469.1621953326170;
 Tue, 25 May 2021 07:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210517113540.237495-1-aardelean@deviqon.com> <20210517113540.237495-2-aardelean@deviqon.com>
In-Reply-To: <20210517113540.237495-2-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:35:15 +0200
Message-ID: <CAMpxmJVDAqXJnFLmPbaqf7Y+rfYRW1Bf4j9A1e1ze0L-ekxWrg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-wm8350: remove platform_set_drvdata() +
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
>  drivers/gpio/gpio-wm8350.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
> index 460f0a4b04bd..b1b131fb9804 100644
> --- a/drivers/gpio/gpio-wm8350.c
> +++ b/drivers/gpio/gpio-wm8350.c
> @@ -105,7 +105,6 @@ static int wm8350_gpio_probe(struct platform_device *pdev)
>         struct wm8350 *wm8350 = dev_get_drvdata(pdev->dev.parent);
>         struct wm8350_platform_data *pdata = dev_get_platdata(wm8350->dev);
>         struct wm8350_gpio_data *wm8350_gpio;
> -       int ret;
>
>         wm8350_gpio = devm_kzalloc(&pdev->dev, sizeof(*wm8350_gpio),
>                                    GFP_KERNEL);
> @@ -121,16 +120,7 @@ static int wm8350_gpio_probe(struct platform_device *pdev)
>         else
>                 wm8350_gpio->gpio_chip.base = -1;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &wm8350_gpio->gpio_chip,
> -                                    wm8350_gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, wm8350_gpio);
> -
> -       return ret;
> +       return devm_gpiochip_add_data(&pdev->dev, &wm8350_gpio->gpio_chip, wm8350_gpio);
>  }
>
>  static struct platform_driver wm8350_gpio_driver = {
> --
> 2.31.1
>

Applied, thanks!

Bart
