Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1159A38C824
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 15:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhEUNch (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 09:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbhEUNch (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 09:32:37 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EA6C061763
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:31:14 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id w1so16171678ybt.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FYTaWwfm3QROhcwX/aUHvjSyyM0wTPBO8vdBpVZtKz4=;
        b=A55JpB1jUFRqlWxwgK1BVww09N9MwOR2hRPz1RqTYc2OKY7rDml7CD4ECC2ZiOizyh
         SIZJL6KVlzT/7IoylesL0LXmiwqxawosLNbTxAn6iHU7BevrQM7hC5mypff0Hq04FgD+
         aDyBBnbW/0jzJ9hW8zf6GSWbN8YnEaoSI64YasDOaYld0NnHJlTKJ7Di7huV6x5oik2y
         FsxJns6A8hhjrpsZfLk4aTjbyOg9weudo1LwQJNizCMsTseNZYuKw2K53qm+28dd4Etr
         QkNEiFaHOcv/6GqOgqvahWEv/1fmJ6OKKtxvs5qWNi8OymKOOX1KY+jA4xRNCZqNOVA1
         71EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYTaWwfm3QROhcwX/aUHvjSyyM0wTPBO8vdBpVZtKz4=;
        b=AeKI/EP7h+BdTW2xEsCLHBRazR+rwoDDabLdCaaglu7TT05oIpZjWtKNOVZKqAf4ZC
         wHm9UJSNgYDGduT8lNtGRAWOc+RrE7Cfvo6FzBoktusttm5sbBT4+X263yGfVWC945cH
         NyweZMLbQjID2wF/2eyt6px6VqnQKFVLTnBpZaYm+CmclLU9J7FForN+Nnk168j0xO52
         PrRlXcbWoJW/tL0uI4kSeTY0ThVjnPeK89fQdfcGr0JVHssoE2NJ5PAU2GhDvk8MlBJS
         c5eO95qHBusuEIt2+U2UX95vKXGisqCNf5gDFzRkA7AH9cORfaOgEI1Xs7UBY8RHTpbf
         FYtA==
X-Gm-Message-State: AOAM532j9EkcLvR0Wdj0dNYkDvP+O7IWtVLK2JCpmRB0x1z+JV5DWYkh
        1DYRii2bf9v+Eor87x9NM8/wrw5gMAWkw5UkAOMOrWFv7Pyyqo38
X-Google-Smtp-Source: ABdhPJz0HweSawACq/CUdkjijXK0nu4odf0TqGCa9K8F8pOSgN2+YUXxO7Y1dMpQ7atIrdCSLgzb17hpJhNnIPmmxcw=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr14593522ybp.366.1621603873465;
 Fri, 21 May 2021 06:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210514085627.11230-1-aardelean@deviqon.com>
In-Reply-To: <20210514085627.11230-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 15:31:02 +0200
Message-ID: <CAMpxmJVL4Bxhj3mqaTDofVhd1mAt=wUwu51McOK=WMUSvH7gLg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-adp5520: cleanup probe error path + remove platform_set_drvdata()
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Hennerich <michael.hennerich@analog.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 14, 2021 at 10:56 AM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> This also means that the 'err' label can be removed and all goto statements
> replaced with direct returns (with error codes).
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-adp5520.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
> index 0386ede53f3a..c55e821c63b6 100644
> --- a/drivers/gpio/gpio-adp5520.c
> +++ b/drivers/gpio/gpio-adp5520.c
> @@ -113,10 +113,8 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
>                 if (pdata->gpio_en_mask & (1 << i))
>                         dev->lut[gpios++] = 1 << i;
>
> -       if (gpios < 1) {
> -               ret = -EINVAL;
> -               goto err;
> -       }
> +       if (gpios < 1)
> +               return -EINVAL;
>
>         gc = &dev->gpio_chip;
>         gc->direction_input  = adp5520_gpio_direction_input;
> @@ -148,18 +146,10 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
>
>         if (ret) {
>                 dev_err(&pdev->dev, "failed to write\n");
> -               goto err;
> +               return ret;
>         }
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &dev->gpio_chip, dev);
> -       if (ret)
> -               goto err;
> -
> -       platform_set_drvdata(pdev, dev);
> -       return 0;
> -
> -err:
> -       return ret;
> +       return devm_gpiochip_add_data(&pdev->dev, &dev->gpio_chip, dev);
>  }
>
>  static struct platform_driver adp5520_gpio_driver = {
> --
> 2.31.1
>

Applied, thanks!
Bartosz
