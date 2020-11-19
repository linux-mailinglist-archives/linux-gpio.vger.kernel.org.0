Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1852B95AF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 16:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgKSPEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 10:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgKSPEd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 10:04:33 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1DFC0613CF;
        Thu, 19 Nov 2020 07:04:33 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f18so4430252pgi.8;
        Thu, 19 Nov 2020 07:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gv+tzIwOh54GKgX+GFGq0lY1+3CA0ggLubRGTd2BE9w=;
        b=eey761QUD0kQfmjSWIEkvJhy6HgeRa0qwTMd8qAQYJHAf6XipLC83zhX+lFC7gFNVp
         GAVVyBLALpmN1TGnka6oRBVRyzFp6bt4DOQyi4fwhzqGOmpf34oFkOWbHO9Avcn4w+vE
         ZH0RoBdEG/uYDPbKr+bnUVELM2ADphDESll9xy1COCLk6Fxo47UL5CyVn2awv/iit+BJ
         TNa5DtqK5Nr6tHznyGmnMgEGdlI0BiPAkv+GdKUmh4M0aRujbNcCPhLNWuqLpAECiVrM
         xRE1N52tC8xF23Vk9HvbyWxM8ZrudSLopbmym9+V5O5xgxONTj1jEKbjbrtYpvnA81XR
         GmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gv+tzIwOh54GKgX+GFGq0lY1+3CA0ggLubRGTd2BE9w=;
        b=jvRJSg09A8/5lMTCR1VH+jhTVIBujzZXcR+dGFFLJfgMNqvnnZ+kt5B0Sf+q++2F0+
         sxhpHy6sL9GO5lzRqg0UEFZyL0HFULOwh3oq37hqgLQ6eyu1cHPfNvx09f7TuQ+TGqdH
         Q0vWDhs35jFROYtBkJcqn0fCvTjzr5dhIn1U41mtq339yfKTd6Pp+VN50+Vh6IvZMXu9
         m2cRH1erBPBo6CNhf0SZQyVAuwwG3wdE0qzeQg18ew535XxkdbPc4RR4qsA9A9a4bPDv
         jQrvTmQ4JG2qZ738j06tfvCQ+kgIHx03Hgt736X4vfpsoCC2nbAomYZSXEwCS27LPqyz
         aDgg==
X-Gm-Message-State: AOAM533SM5NwC9HOcJ7OMq8P45GKS9+/jG6t8C5X02xS6zeK97e5EUeL
        VCwS07//qfKeqEeQ+y/JuY9+NKME1Aw1EITsILk=
X-Google-Smtp-Source: ABdhPJxBx4+20B+iQxlNqY3VfjJdR8vGKMeLoUnzFwTDb3xl1QJayrvQwiGDDBxSGU5xKTlZIwdb02NXUDXJ35OaDi0=
X-Received: by 2002:a17:90a:4816:: with SMTP id a22mr5138400pjh.228.1605798273031;
 Thu, 19 Nov 2020 07:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20201119142104.85566-1-alexandru.ardelean@analog.com>
In-Reply-To: <20201119142104.85566-1-alexandru.ardelean@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Nov 2020 17:05:21 +0200
Message-ID: <CAHp75VdkomLMPYZbB7-KerGmyxXxB8hQuAjLtJ0bhB5f5vfuNA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xra1403: remove unneeded spi_set_drvdata()
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nandor Han <nandor.han@ge.com>,
        Semi Malinen <semi.malinen@ge.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 4:17 PM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
> There is no matching spi_get_drvdata() call in the driver, so there is no
> need to do spi_set_drvdata(). This looks like it probably was copied from a
> driver that used both spi_set_drvdata() & spi_get_drvdata().

While above luckily (*) okay it may not always be the case.

*) it can be paired with dev_get_drvdata() which is usual for PM callbacks.

With amended commit message
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/gpio/gpio-xra1403.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
> index e2cac12092af..49c878cfd5c6 100644
> --- a/drivers/gpio/gpio-xra1403.c
> +++ b/drivers/gpio/gpio-xra1403.c
> @@ -186,15 +186,7 @@ static int xra1403_probe(struct spi_device *spi)
>                 return ret;
>         }
>
> -       ret = devm_gpiochip_add_data(&spi->dev, &xra->chip, xra);
> -       if (ret < 0) {
> -               dev_err(&spi->dev, "Unable to register gpiochip\n");
> -               return ret;
> -       }
> -
> -       spi_set_drvdata(spi, xra);
> -
> -       return 0;
> +       return devm_gpiochip_add_data(&spi->dev, &xra->chip, xra);
>  }
>
>  static const struct spi_device_id xra1403_ids[] = {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
