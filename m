Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED5207BAB1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 09:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfGaH2z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 03:28:55 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43543 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfGaH2z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 03:28:55 -0400
Received: by mail-ot1-f66.google.com with SMTP id j11so11852529otp.10
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TmYkszd4hw4EUMOJlisQyoGCI5lj99eO1lyXFc/HvcQ=;
        b=1FSzN5/m+2ZZrpqyW9/he10E9ViMT2xLFVUnIVYVmP85JCy+nnGQYXFObI6VdG7Tty
         LzE9lj3YiaA0P7dNENQmTZWunnDdx3gF571XI9yNqSlXkeBK8ETZdYs4hBZYKuKsOnNu
         JbrdkiVaVpuyFo5k7UD9vGIqCdN6hF5lqMlkT0MozS2hosU3jPnv/3irVmt5k7Shb/GE
         HkrbhaX0m6tEfJNYB6fZR41tdcazkWYXihVhnfaQcMgV3N6Du67XPTszejJ/sNqhqicp
         QHAdbUYQm3J0LqkUzIxRXJ5UMUjFyN9qYwr1TWIi0rPIYvO1ovG+lyQIZhSqC1vx7Q1i
         xcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TmYkszd4hw4EUMOJlisQyoGCI5lj99eO1lyXFc/HvcQ=;
        b=nb1vel7PFqpgQG5pfPcvD1AAsX/CWN4JBKPFuQ5OWA04ORS6TJvvn6vwxNNG5Y7z4B
         JqTzaDasCzjfyiOV0NiTgf0ljVEe5TvC6Vyj/6IFD9lCBVbaTC3shKktmYnDkFLHOQJ7
         DCEH1W0BPbruILQvovMn6b/3qoSTZ1V1V8lhAH5YZc1JBT9gBDOMBAoGskS5EnksFlBf
         j1TUck5WbovvGX8l+QDGYQMyoSFBnT4zUx7HyjTLj/dShAw6aY4HWMAc6lXIGZVqOpN5
         B+KM2y6xlh+28G+9Z7+HSJ1B6ZhbdMkjtcnLpuZfy8ZuvoXJSM98fZfUQ6PiLcUCJPQX
         X7+Q==
X-Gm-Message-State: APjAAAVKMsx8v/KaZfC+IenRHMIgYX7bzVg2n7aZJFUNZ3Nj1orDEzaa
        wYYzaHvzSCRWXgwSMX5YbRsTdVrG+BZypkrEpFITBA==
X-Google-Smtp-Source: APXvYqxULIyQ0mxCElZagcHFTYO3mQulX+y5C1eb2SRJ1AuFJHGnA10tuT8TVOlBFiyFytouhpSp5TkaYMN7QKtwteU=
X-Received: by 2002:a05:6830:1681:: with SMTP id k1mr7287623otr.256.1564558133564;
 Wed, 31 Jul 2019 00:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190730181557.90391-1-swboyd@chromium.org> <20190730181557.90391-16-swboyd@chromium.org>
In-Reply-To: <20190730181557.90391-16-swboyd@chromium.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Jul 2019 09:28:41 +0200
Message-ID: <CAMpxmJWEsuFcNqCJpM2Xc-n3Dz45u_O+V5jtXHHUJG5_cCZdbQ@mail.gmail.com>
Subject: Re: [PATCH v6 15/57] gpio: Remove dev_err() usage after platform_get_irq()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 30 lip 2019 o 20:16 Stephen Boyd <swboyd@chromium.org> napisa=C5=82(a)=
:
>
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
>
> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
>
> ret =3D
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
>
> if ( \( ret < 0 \| ret <=3D 0 \) )
> {
> (
> -if (ret !=3D -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
>
> While we're here, remove braces on if statements that only have one
> statement (manually).
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Please apply directly to subsystem trees
>
>  drivers/gpio/gpio-brcmstb.c       | 4 +---
>  drivers/gpio/gpio-eic-sprd.c      | 4 +---
>  drivers/gpio/gpio-grgpio.c        | 2 --
>  drivers/gpio/gpio-max77620.c      | 4 +---
>  drivers/gpio/gpio-pmic-eic-sprd.c | 4 +---
>  drivers/gpio/gpio-sprd.c          | 4 +---
>  drivers/gpio/gpio-tb10x.c         | 4 +---
>  drivers/gpio/gpio-tegra.c         | 4 +---
>  drivers/gpio/gpio-zx.c            | 1 -
>  drivers/gpio/gpio-zynq.c          | 4 +---
>  10 files changed, 8 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index af936dcca659..05e3f99ae59c 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -636,10 +636,8 @@ static int brcmstb_gpio_probe(struct platform_device=
 *pdev)
>
>         if (of_property_read_bool(np, "interrupt-controller")) {
>                 priv->parent_irq =3D platform_get_irq(pdev, 0);
> -               if (priv->parent_irq <=3D 0) {
> -                       dev_err(dev, "Couldn't get IRQ");
> +               if (priv->parent_irq <=3D 0)
>                         return -ENOENT;
> -               }
>         } else {
>                 priv->parent_irq =3D -ENOENT;
>         }
> diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
> index 7b9ac4a12c20..fe7a73f52329 100644
> --- a/drivers/gpio/gpio-eic-sprd.c
> +++ b/drivers/gpio/gpio-eic-sprd.c
> @@ -584,10 +584,8 @@ static int sprd_eic_probe(struct platform_device *pd=
ev)
>         sprd_eic->type =3D pdata->type;
>
>         sprd_eic->irq =3D platform_get_irq(pdev, 0);
> -       if (sprd_eic->irq < 0) {
> -               dev_err(&pdev->dev, "Failed to get EIC interrupt.\n");
> +       if (sprd_eic->irq < 0)
>                 return sprd_eic->irq;
> -       }
>
>         for (i =3D 0; i < SPRD_EIC_MAX_BANK; i++) {
>                 /*
> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index 0937b605e134..08234e64993a 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -408,8 +408,6 @@ static int grgpio_probe(struct platform_device *ofdev=
)
>                                  * Continue without irq functionality for=
 that
>                                  * gpio line
>                                  */
> -                               dev_err(priv->dev,
> -                                       "Failed to get irq for offset %d\=
n", i);
>                                 continue;
>                         }
>                         priv->uirqs[lirq->index].uirq =3D ret;
> diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
> index b7d89e30131e..47d05e357e61 100644
> --- a/drivers/gpio/gpio-max77620.c
> +++ b/drivers/gpio/gpio-max77620.c
> @@ -270,10 +270,8 @@ static int max77620_gpio_probe(struct platform_devic=
e *pdev)
>         int ret;
>
>         gpio_irq =3D platform_get_irq(pdev, 0);
> -       if (gpio_irq <=3D 0) {
> -               dev_err(&pdev->dev, "GPIO irq not available %d\n", gpio_i=
rq);
> +       if (gpio_irq <=3D 0)
>                 return -ENODEV;
> -       }
>
>         mgpio =3D devm_kzalloc(&pdev->dev, sizeof(*mgpio), GFP_KERNEL);
>         if (!mgpio)
> diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-e=
ic-sprd.c
> index 24228cf79afc..05000cace9b2 100644
> --- a/drivers/gpio/gpio-pmic-eic-sprd.c
> +++ b/drivers/gpio/gpio-pmic-eic-sprd.c
> @@ -305,10 +305,8 @@ static int sprd_pmic_eic_probe(struct platform_devic=
e *pdev)
>         mutex_init(&pmic_eic->buslock);
>
>         pmic_eic->irq =3D platform_get_irq(pdev, 0);
> -       if (pmic_eic->irq < 0) {
> -               dev_err(&pdev->dev, "Failed to get PMIC EIC interrupt.\n"=
);
> +       if (pmic_eic->irq < 0)
>                 return pmic_eic->irq;
> -       }
>
>         pmic_eic->map =3D dev_get_regmap(pdev->dev.parent, NULL);
>         if (!pmic_eic->map)
> diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
> index f5c8b3a351d5..d7314d39ab65 100644
> --- a/drivers/gpio/gpio-sprd.c
> +++ b/drivers/gpio/gpio-sprd.c
> @@ -226,10 +226,8 @@ static int sprd_gpio_probe(struct platform_device *p=
dev)
>                 return -ENOMEM;
>
>         sprd_gpio->irq =3D platform_get_irq(pdev, 0);
> -       if (sprd_gpio->irq < 0) {
> -               dev_err(&pdev->dev, "Failed to get GPIO interrupt.\n");
> +       if (sprd_gpio->irq < 0)
>                 return sprd_gpio->irq;
> -       }
>
>         sprd_gpio->base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(sprd_gpio->base))
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index bd1f3f775ce9..5e375186f90e 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -171,10 +171,8 @@ static int tb10x_gpio_probe(struct platform_device *=
pdev)
>                 struct irq_chip_generic *gc;
>
>                 ret =3D platform_get_irq(pdev, 0);
> -               if (ret < 0) {
> -                       dev_err(dev, "No interrupt specified.\n");
> +               if (ret < 0)
>                         return ret;
> -               }
>
>                 tb10x_gpio->gc.to_irq   =3D tb10x_gpio_to_irq;
>                 tb10x_gpio->irq         =3D ret;
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 0f59161a4701..8a01d3694b28 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -624,10 +624,8 @@ static int tegra_gpio_probe(struct platform_device *=
pdev)
>
>         for (i =3D 0; i < tgi->bank_count; i++) {
>                 ret =3D platform_get_irq(pdev, i);
> -               if (ret < 0) {
> -                       dev_err(&pdev->dev, "Missing IRQ resource: %d\n",=
 ret);
> +               if (ret < 0)
>                         return ret;
> -               }
>
>                 bank =3D &tgi->bank_info[i];
>                 bank->bank =3D i;
> diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
> index 8637adb6bc20..8d9b9bf8510a 100644
> --- a/drivers/gpio/gpio-zx.c
> +++ b/drivers/gpio/gpio-zx.c
> @@ -253,7 +253,6 @@ static int zx_gpio_probe(struct platform_device *pdev=
)
>         writew_relaxed(0, chip->base + ZX_GPIO_IE);
>         irq =3D platform_get_irq(pdev, 0);
>         if (irq < 0) {
> -               dev_err(dev, "invalid IRQ\n");
>                 gpiochip_remove(&chip->gc);
>                 return -ENODEV;
>         }
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index f241b6c13dbe..86b0bd256c13 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -849,10 +849,8 @@ static int zynq_gpio_probe(struct platform_device *p=
dev)
>                 return PTR_ERR(gpio->base_addr);
>
>         gpio->irq =3D platform_get_irq(pdev, 0);
> -       if (gpio->irq < 0) {
> -               dev_err(&pdev->dev, "invalid IRQ\n");
> +       if (gpio->irq < 0)
>                 return gpio->irq;
> -       }
>
>         /* configure the gpio chip */
>         chip =3D &gpio->chip;
> --
> Sent by a computer through tubes
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
