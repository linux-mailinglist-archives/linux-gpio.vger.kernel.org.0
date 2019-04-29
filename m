Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBE9BDD5D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 10:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbfD2IFY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 04:05:24 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43541 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727605AbfD2IFY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 04:05:24 -0400
Received: by mail-ot1-f68.google.com with SMTP id u15so7802407otq.10
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YyXy/Ie73uurSifnxXwPPCjDOWFEG0F3DJdimxJFcAc=;
        b=fn6je0oV2jgwh2sHe5zKMIc4U2H+O56n6fjSEqsXZCL+M7jv/d/4Yfuecsmkg1xJ9Q
         O279VIqyP3zsz0kl19ZfqlBEwrlTlLyy5yDRK5L4XZWEe5HxB5uIN9d9ISS6weZTErxW
         HildR8uWJjLWzSiN/X4kk3tNZZL9zrfLGrund0vKJwhNTFlQLdfTDvOHM8G5P9lX+3ic
         gYJIx+xi8Ve9UkNDMOJ0EFldRr4bCZ6j6Qw7hxusgce+jynuMORB7/7Sou09k6lsvTdm
         N/JbrKvegeGQmq8Lxu48MqB5G2qouNoSEq7+L1UwgUo1ui9vW7urRqoWT3ejm7hIebFk
         Hvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YyXy/Ie73uurSifnxXwPPCjDOWFEG0F3DJdimxJFcAc=;
        b=d9L93zqLOuMWd4Rx5Nl3Yk16SEIxppbUWGg4zziD++xNYAkxEGkuXa+E4o+CBEY8r9
         ueZJLlkFMSVTV+LMd0GknKNaTanVXkF9i6idKdXrXZ3p9uiUlm/pztZvziFgLKYRjR09
         deUSARFW6bVbpXtxfiJPdzLonir3eVa6d1bVc6E56x3olobKNy/EIygeytX20MrSwsV0
         Ip9L1x6shO0RMmzWWz+e5zuNe2uTmIWypZRcBK7lx9SapbukeM8ICd27sV+iDmyCpLFq
         WpagGwGbDEBJmWBwEKV49aWY7AEb3L4CzGUJTfh5wwPjOWHZixqE04pgzrIMJs+tU73I
         819A==
X-Gm-Message-State: APjAAAWk04OsFGkejVRGlnffTNcEfAXpb1nmJxhlbOpAhlu3FHVu6PMy
        do99AIpGwmndo0kaThE0shyx8FGqY0UQ40JhEMFfXg==
X-Google-Smtp-Source: APXvYqx06BG5eGh9UuXz0Saif18cT4+/cKdFi3yFkZEctF3FVCXmjfXlgQFyMDjYw0sd5whF3mGM3cwBeBSfl7lfReA=
X-Received: by 2002:a05:6830:150:: with SMTP id j16mr34168719otp.27.1556525123456;
 Mon, 29 Apr 2019 01:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190429054948.9185-1-andrew.smirnov@gmail.com> <20190429054948.9185-2-andrew.smirnov@gmail.com>
In-Reply-To: <20190429054948.9185-2-andrew.smirnov@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 29 Apr 2019 10:05:12 +0200
Message-ID: <CAMpxmJUrVU6qGH9ZOaxABOuOopnHjyv+iqT908p1f-NuSk0r5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: vf610: Use PTR_ERR_OR_ZERO() in vf610_gpio_probe()
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chris Healy <cphealy@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 29 kwi 2019 o 07:50 Andrey Smirnov <andrew.smirnov@gmail.com> napisa=
=C5=82(a):
>
> Simplify error checking code by replacing multiple ERR macros with a
> call to PTR_ERR_OR_ZERO. No functional change intended.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpio/gpio-vf610.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 30aef41e3b7e..7ba668db171b 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -265,7 +265,8 @@ static int vf610_gpio_probe(struct platform_device *p=
dev)
>                 return port->irq;
>
>         port->clk_port =3D devm_clk_get(dev, "port");
> -       if (!IS_ERR(port->clk_port)) {
> +       ret =3D PTR_ERR_OR_ZERO(port->clk_port);
> +       if (!ret) {
>                 ret =3D clk_prepare_enable(port->clk_port);
>                 if (ret)
>                         return ret;
> @@ -273,16 +274,17 @@ static int vf610_gpio_probe(struct platform_device =
*pdev)
>                                                port->clk_port);
>                 if (ret)
>                         return ret;
> -       } else if (port->clk_port =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> +       } else if (ret =3D=3D -EPROBE_DEFER) {
>                 /*
>                  * Percolate deferrals, for anything else,
>                  * just live without the clocking.
>                  */
> -               return PTR_ERR(port->clk_port);
> +               return ret;
>         }
>
>         port->clk_gpio =3D devm_clk_get(dev, "gpio");
> -       if (!IS_ERR(port->clk_gpio)) {
> +       ret =3D PTR_ERR_OR_ZERO(port->clk_gpio);
> +       if (!ret) {
>                 ret =3D clk_prepare_enable(port->clk_gpio);
>                 if (ret)
>                         return ret;
> @@ -290,8 +292,8 @@ static int vf610_gpio_probe(struct platform_device *p=
dev)
>                                                port->clk_gpio);
>                 if (ret)
>                         return ret;
> -       } else if (port->clk_gpio =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> -               return PTR_ERR(port->clk_gpio);
> +       } else if (ret =3D=3D -EPROBE_DEFER) {
> +               return ret;
>         }
>
>         gc =3D &port->gc;
> --
> 2.20.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
