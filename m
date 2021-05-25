Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF112390412
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbhEYOh1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233960AbhEYOhT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:37:19 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AD4C06138A
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:48 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id l16so10475618ybf.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IXGxhNG8A8CmQe46YV5h/+klPXxUN6g33jr751FeTiA=;
        b=jmoBS/7kBDXT9IiemYvkDqOy0ZgH32tzlgl/i3TuYjIajb1hZcuucJhhMoyhSiM2cQ
         MWAAKbryD8B+pVKbe6c4aAAeZBCoAmTEuN0TH8JDJXW6cqVgJfZbtW+Slqh+5sDes71H
         saJp/uVoaQobcRYKaESCJwggy6I9LiQ2DnEZwPYlGDLlgBlMGP+AaEvkYxs5PHYSejN4
         ArVDvkbJOASU9EISRhLOXGcoBvKkLVkMM8Rk9+GEvyrCQpf/qx1eL97xa5QuIFQfoPuf
         w5P1QYh/PZjJBl7sX6ytSe9hk4zlwjlvU11CpPYhFI5tVwqOuGfpyU+DfSRwrBV5iYwr
         e6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IXGxhNG8A8CmQe46YV5h/+klPXxUN6g33jr751FeTiA=;
        b=Nc+EErIBvyjhVznA2BAtl+xMTsDAmi+x/kWsPhROCBMUBtGGA1Pl1yOlvN8MzflW9y
         b0egxDigJ5JdLCWyn48t3P75hkfLwe2XHAKuclzfrTP17+agic5NT5jA4gMGYBUKCzP4
         /LTpHzTRncCP08za9/b/1Gsb/u1zKBvSRhm9uBBTvuXN72HaCWGLD1oujr+uKtFWf2sl
         MXGXeA6xd0x0OYXIkP6HLCFciH+a+yU2WwsHoXzepT8uOqskCua/NfVFfbgO4asm3wBd
         NU2WLbBEl8+kR6ugnvkbmdsvBsX7/+s99QhIc5ImvkQMLlUa3WKfVp+V1QwO/HPl2HJ+
         tl5g==
X-Gm-Message-State: AOAM5308OfGRs/oJZgnsvVRv3C+963AkE82+ybX7LzVYzu2VDP0OjYzl
        Qp3FZX9SufgY65FBSVmErCfIPpiQlC+VqvhWZJ5Otw==
X-Google-Smtp-Source: ABdhPJz+Sk3zuoazdMq/qqEdZ49zB09cpUzYzS6EuyApwCwJBYgIdS7J08MKNR0mTqzbmPXCaS0EiShS4JGbEh5siEo=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr41619044ybp.366.1621953347985;
 Tue, 25 May 2021 07:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210516074311.7485-1-aardelean@deviqon.com>
In-Reply-To: <20210516074311.7485-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:35:37 +0200
Message-ID: <CAMpxmJXDAmX=Rp26A-N6SRx4WXjaf+v+XfKvZjWLSaY=WHAqzQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-spear-spics: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 16, 2021 at 9:43 AM Alexandru Ardelean
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
> This change isn't removing the 'DT probe failed' message, as some may find
> it useful as a reason for the failed probe. But that can be part of another
> change if needed.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-spear-spics.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
> index 6eca531b7d96..49aac2bb8d2c 100644
> --- a/drivers/gpio/gpio-spear-spics.c
> +++ b/drivers/gpio/gpio-spear-spics.c
> @@ -122,7 +122,6 @@ static int spics_gpio_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
>         struct spear_spics *spics;
> -       int ret;
>
>         spics = devm_kzalloc(&pdev->dev, sizeof(*spics), GFP_KERNEL);
>         if (!spics)
> @@ -148,8 +147,6 @@ static int spics_gpio_probe(struct platform_device *pdev)
>                                 &spics->cs_enable_shift))
>                 goto err_dt_data;
>
> -       platform_set_drvdata(pdev, spics);
> -
>         spics->chip.ngpio = NUM_OF_GPIO;
>         spics->chip.base = -1;
>         spics->chip.request = spics_request;
> @@ -163,14 +160,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
>         spics->chip.owner = THIS_MODULE;
>         spics->last_off = -1;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &spics->chip, spics);
> -       if (ret) {
> -               dev_err(&pdev->dev, "unable to add gpio chip\n");
> -               return ret;
> -       }
> -
> -       dev_info(&pdev->dev, "spear spics registered\n");
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &spics->chip, spics);
>
>  err_dt_data:
>         dev_err(&pdev->dev, "DT probe failed\n");
> --
> 2.31.1
>

Applied, thanks!

Bart
