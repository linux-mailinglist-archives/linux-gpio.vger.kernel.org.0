Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667C23BF5F3
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 09:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhGHHHa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 03:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhGHHHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 03:07:25 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACFEC061766
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jul 2021 00:04:39 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id r24so3046927vsg.4
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jul 2021 00:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FWLMvmJ06qlpZlYeyp85/42QieZqDC8JnqSE+Eqvf7U=;
        b=kywxS9+6ZBdXU/YBRnFUBFYI+UzePgHvwWx4n2S4iAr+Z1mkqzYEv+1uZg3TC4yZTD
         cNwUCdqvaJDNCKaua+IDEO6xNcIypW9+5g8fJC8A9GyTKZbJmDfgjJRNbNYZN71aQC7O
         VB7PZCMJhuXIh0mBUoxyiF2N0gUJ0Ph5ALTOJ1xEdIKGFXqwEYpA67WkMq+z6GgjRPT0
         N6ywvoSsnmPVGHurBy3Y2qIPYAw0y3YadoRnSIS3MW1ldSZQPUxQRiOnuey2KhAAla3u
         PnudPmWrbGyE5nCScwDvJzNb/3kUr99QG6hjQPkSbFXicGmGXsXTzUnYxJWHtd/achYl
         AbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FWLMvmJ06qlpZlYeyp85/42QieZqDC8JnqSE+Eqvf7U=;
        b=Tk9DRtQgA8RmntiLE+wpay73c1UkBaBVDNmXvWyRIxut9Fd8HJ9iW5W/SfbVlmgeF5
         RYuRlEXoC/9MKOeEA4TiM8oxNs4GP0HeT9RTSiatv2jKTHK7VbwKRRLKjG5wPbHupkJW
         KHu4lDJtfHQjJSJuWiVvMT1dWE9HcEwFC9c+zTqaVv2xFh66rC3ow+RLHjoE285Ax9PP
         BiZHDlxRSGTPt5RHJt+bBqgn9Z5m+gkY13XOXhcXTQPRgbTZb7GKwNdvhWIpoOmA+QGJ
         94yWYAX2bEKXxw5ca9Sjjy7QPfO1Y5DQBvMB3lO5Kh4kIG73p6bIt15ncv2C3kRR7YwR
         vx6Q==
X-Gm-Message-State: AOAM530/MNvcN2/xvGHoeMoecqlTQS5dNzNT4GU1IXwnKV+nINz/1kU8
        Dq00Qy8CiRaLsEZQCS9taje1Oq6e8GgaDXJktT+Xxzyxl+7rX6L1
X-Google-Smtp-Source: ABdhPJwbbYIIbW4g48dqAUz2xrhWgdEfW+Y1LAZXkBYjt9y9zdl9+V5Nl/QKCidJaXgecYPgAdEtJpkeV/Xvs7u10xg=
X-Received: by 2002:a67:f3c1:: with SMTP id j1mr26699267vsn.43.1625727878939;
 Thu, 08 Jul 2021 00:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210707135109.191238-1-aardelean@deviqon.com>
In-Reply-To: <20210707135109.191238-1-aardelean@deviqon.com>
From:   Alexandru Ardelean <aardelean@deviqon.com>
Date:   Thu, 8 Jul 2021 10:04:28 +0300
Message-ID: <CAASAkoYknBtci5+Q5=zFdCC8mFaaw7tezfH6pKiAX0vQNKcrAQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sama5d2-piobu: remove platform_set_drvdata() +
 cleanup probe
To:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 7 Jul 2021 at 16:51, Alexandru Ardelean <aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> This change also changes the probe order a bit, moving the
> devm_gpiochip_add_data() as the last call. This means that when the
> gpiochip is registered [and available to consumers], it should be
> initialized.
>
> It's still possible that the devm_gpiochip_add_data() call could fail,
> leaving the chip in a partially initialized state, but that was possible
> even before this change; it was just some other partially initialized
> state.
>

Please disregard this.
It seems I have not taken into consideration the fact that interrupts
are enabled after the gpiochip is registered.

> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-sama5d2-piobu.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
> index b7c950658170..dfaa069b1466 100644
> --- a/drivers/gpio/gpio-sama5d2-piobu.c
> +++ b/drivers/gpio/gpio-sama5d2-piobu.c
> @@ -189,7 +189,6 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
>         if (!piobu)
>                 return -ENOMEM;
>
> -       platform_set_drvdata(pdev, piobu);
>         piobu->chip.label = pdev->name;
>         piobu->chip.parent = &pdev->dev;
>         piobu->chip.of_node = pdev->dev.of_node;
> @@ -210,12 +209,6 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
>                 return PTR_ERR(piobu->regmap);
>         }
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &piobu->chip, piobu);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to add gpiochip %d\n", ret);
> -               return ret;
> -       }
> -
>         for (i = 0; i < PIOBU_NUM; ++i) {
>                 ret = sama5d2_piobu_setup_pin(&piobu->chip, i);
>                 if (ret) {
> @@ -225,7 +218,7 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
>                 }
>         }
>
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &piobu->chip, piobu);
>  }
>
>  static const struct of_device_id sama5d2_piobu_ids[] = {
> --
> 2.31.1
>
