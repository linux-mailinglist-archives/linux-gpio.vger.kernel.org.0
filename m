Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A982C89C1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 17:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgK3QkI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 11:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728780AbgK3QkH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 11:40:07 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D285C0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 08:39:27 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id d17so21086869ejy.9
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6tD9ZVZ6gEgHyopRLPxX9gjuGEYfwDbo2GR5pg3Ufw4=;
        b=glbcz3v23KpKTyAKnx1I60vsVXUyi8fdbsPAkgkSO82ICb8g57m1qTTu7ZzCVZ9Ihc
         FH5rZ8Ht8MBFuLyHSylml3QywhK9XbmEWYDbOuDsdABb8RFkUldZ1HCYLrPNDdNlxyTp
         DQYHeaUIJz/6bgu/RYhL7KePVkD+5V03rg+b3NxI3uOc4hXeJ80fHWG9QameyeLyAr5Q
         qXmCwF85bIyrjijUS9NSSilY3kjYs8ViX4Q9fH9appyTrlusTidi4l8tmBTPvrt932qZ
         8P27uJXoiWSFSIXKvkt4+prrOLmDRHI73pPWHz5bshntvLIQbbIQ3XZRAPzCk3a61Cs4
         m6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6tD9ZVZ6gEgHyopRLPxX9gjuGEYfwDbo2GR5pg3Ufw4=;
        b=iA9UUmCcfHjw6d7x3WYIlPepyfaMWH2tL+0wnhXCcGMKFbwoKPUuPKoxky6vm8TUJ3
         sf7TYWaqKzfix2x6hfbS8TrOzmuUfn2gKbrBAevm0cO7EOEvu5ctRwbz949eFEyKfDQh
         lSFO3TBr6wWpvCGKljBGYQBLjqUUzsncrhQJiX5uYGX+sXl42fC8wzoJmzZiUuQ2yYe3
         Yd1+yadV6qaEyFEuL+zWcj40f1ioJ2BMU0Y9XhOG5WHNGJXRWAcInkGlm6AbJR0enOk1
         OGnDY1SmfU+rGF/c+i8aqYaatRFH+e3KDcKWIsw07eWAXzttuo2harUyXioxo/G/Hnk7
         6Lhg==
X-Gm-Message-State: AOAM533OkIPtO+D1TYUiFEhapKpK3FjPM2X8aQyGx4ldz0Pc3cKdpP5M
        AoFRMZYs3N0ZCbe3FjuhwrMadxpJ6IcSVDOaqjqI0Q==
X-Google-Smtp-Source: ABdhPJzoCYimjzh4bEQ9MTo+GD5OKm/5MTWjv3mRz8F3tY/eucztztKkMgUZGD/9LslE8VvXK+DJg6C7YKs8OF0nQ58=
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr7163881ejl.155.1606754365951;
 Mon, 30 Nov 2020 08:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20201118143149.26067-1-grygorii.strashko@ti.com>
In-Reply-To: <20201118143149.26067-1-grygorii.strashko@ti.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 30 Nov 2020 17:39:15 +0100
Message-ID: <CAMpxmJVm7euifTBKx06mzUw6zD5s2KJHYniGviV=H8Yo6YJMdg@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: handle deferred probe with dev_err_probe()
 for gpiochip_add_data()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 18, 2020 at 3:31 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
> The gpiochip_add_data() may return -EPROBE_DEFER which is not handled
> properly by TI GPIO driver and causes unnecessary boot log messages.
>
> Hence, add proper deferred probe handling with new dev_err_probe() API.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  drivers/gpio/gpio-omap.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index f7ceb2b11afc..41952bb818ad 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1049,11 +1049,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
>         irq->first = irq_base;
>
>         ret = gpiochip_add_data(&bank->chip, bank);
> -       if (ret) {
> -               dev_err(bank->chip.parent,
> -                       "Could not register gpio chip %d\n", ret);
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(bank->chip.parent, ret, "Could not register gpio chip\n");
>
>         ret = devm_request_irq(bank->chip.parent, bank->irq,
>                                omap_gpio_irq_handler,
> --
> 2.17.1
>

Now applied. Thanks!

Bartosz
