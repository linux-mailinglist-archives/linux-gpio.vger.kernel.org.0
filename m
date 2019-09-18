Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F31B7B5E2E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2019 09:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfIRHgn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Sep 2019 03:36:43 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41011 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfIRHgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Sep 2019 03:36:43 -0400
Received: by mail-oi1-f194.google.com with SMTP id w17so5139070oiw.8
        for <linux-gpio@vger.kernel.org>; Wed, 18 Sep 2019 00:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SnfA/z7sYmS4p90KugFRDGYAqrClHJ5yHTUJ5IzMHDY=;
        b=0xf9mIzBD0QKbX2cTIovmV63drg+4bFZ2C0WEIGQX/8kD+lr9PORvLVtvWmqVnY2Hx
         uw6DicmbP6IePdEL+n95cmQOhIk9nc9GgRhtNYYJFFx8kR2SMvvfw+iR+wMyZPY2QiZM
         md2HIIXPM/RJGfNbpnUv1aW3b9YljxNxM2NMjyzQBN+kSUwhhZXHtxxKAStdhjx5QFD8
         3KvY9Szt5E08abh4wEt9bmoKmO/hkpkb7RvSD+/em/plmFxXU63xHCMO8Mr5AC43Sh/k
         ZcIkXW27Uor7Z0rF/d/YLluWqH4CrJj/sIPPcJOZIGn5/c/qjkI6XwbN6/QEUjRJmGoM
         qgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SnfA/z7sYmS4p90KugFRDGYAqrClHJ5yHTUJ5IzMHDY=;
        b=eMyuitHn7U9yTFUBHzmWVnv6iKRQAWRwHirZzg/5ll/eAbbd4Fyuwnqq/n+m0Cyrh6
         Co39skBW3mwvMXP4s6Noy7cz3jYaLlg0E92x5QVPIk55SPYf08Dq+1+F90vJW+blhy50
         XrtG1osZgOYwz7oVj4kSlBqgr8+tEtqGQZwmPvbpbm1IQdkdMc33+g4X1xZJDqd73Uah
         Jq4Fe7jLR/nb0Uo7oxtjlWmtsFDby9TM8EMzFTRXWrl5TNbOhl1RnhE2MllSz+3cURic
         /OqQojvjry6OeiLFGSioHgT1aIQ1rjp8BjDhnKFZ9ejWCSXEEiDjF27g3V5R3G9IonnE
         3yLg==
X-Gm-Message-State: APjAAAVV+T6xVk2IOimLpODWLkLfcMT7pg+Ae0aWYNgFaKSI35n8YVsX
        pxUbQ1Yk7T2RfhWSP6tDvwANJh8StrKDnRIh/VSPWg==
X-Google-Smtp-Source: APXvYqwMYiX7Vw6JmKe0Ol7MjxXPzGf9u9TbL2LZE7CKgVXuTc8ckQF2o5+GS64CpIQUfJoykEUEW8e0A9Ky5L8I4v8=
X-Received: by 2002:aca:ad09:: with SMTP id w9mr1346998oie.114.1568792202394;
 Wed, 18 Sep 2019 00:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190916055817.43425-1-hui.song_1@nxp.com>
In-Reply-To: <20190916055817.43425-1-hui.song_1@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 18 Sep 2019 09:36:31 +0200
Message-ID: <CAMpxmJU6-nSCK0bVdJq_U9pKsWyVEE8G2G74Yyg_o2kyqnXhjw@mail.gmail.com>
Subject: Re: [PATCH v5] gpio/mpc8xxx: change irq handler from chained to normal
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 16 wrz 2019 o 08:08 Hui Song <hui.song_1@nxp.com> napisa=C5=82(a):
>
> From: Song Hui <hui.song_1@nxp.com>
>
> More than one gpio controllers can share one interrupt, change the
> driver to request shared irq.
>
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
> Changes in v5:
>         - add traverse every bit function.
> Changes in v4:
>         - convert 'pr_err' to 'dev_err'.
> Changes in v3:
>         - update the patch description.
> Changes in v2:
>         - delete the compatible of ls1088a.
>  drivers/gpio/gpio-mpc8xxx.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 16a47de..3a06ca9 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -22,6 +22,7 @@
>  #include <linux/irq.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/bitops.h>
> +#include <linux/interrupt.h>
>
>  #define MPC8XXX_GPIO_PINS      32
>
> @@ -127,20 +128,20 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc=
, unsigned offset)
>                 return -ENXIO;
>  }
>
> -static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
> +static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
>  {
> -       struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D irq_desc_get_handler_dat=
a(desc);
> -       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +       struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D (struct mpc8xxx_gpio_chi=
p *)data;

There's no need to cast void pointers.

>         struct gpio_chip *gc =3D &mpc8xxx_gc->gc;
>         unsigned int mask;
> +       int i;
>
>         mask =3D gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
>                 & gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
> -       if (mask)
> +       for_each_set_bit(i, &mask, 32)
>                 generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
> -                                                    32 - ffs(mask)));
> -       if (chip->irq_eoi)
> -               chip->irq_eoi(&desc->irq_data);
> +                                                    31 - i));
> +
> +       return IRQ_HANDLED;
>  }
>
>  static void mpc8xxx_irq_unmask(struct irq_data *d)
> @@ -388,8 +389,8 @@ static int mpc8xxx_probe(struct platform_device *pdev=
)
>
>         ret =3D gpiochip_add_data(gc, mpc8xxx_gc);
>         if (ret) {
> -               pr_err("%pOF: GPIO chip registration failed with status %=
d\n",
> -                      np, ret);
> +               dev_err(&pdev->dev, "%pOF: GPIO chip registration failed =
with status %d\n",
> +                       np, ret);
>                 goto err;
>         }
>
> @@ -409,8 +410,15 @@ static int mpc8xxx_probe(struct platform_device *pde=
v)
>         if (devtype->gpio_dir_in_init)
>                 devtype->gpio_dir_in_init(gc);
>
> -       irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
> -                                        mpc8xxx_gpio_irq_cascade, mpc8xx=
x_gc);
> +       ret =3D request_irq(mpc8xxx_gc->irqn, mpc8xxx_gpio_irq_cascade,
> +                         IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade",
> +                         mpc8xxx_gc);

You never free this irq. Maybe use devm_request_irq()?

Bart

> +       if (ret) {
> +               dev_err(&pdev->dev, "%s: failed to request_irq(%d), ret =
=3D %d\n",
> +                       np->full_name, mpc8xxx_gc->irqn, ret);
> +               goto err;
> +       }
> +
>         return 0;
>  err:
>         iounmap(mpc8xxx_gc->regs);
> --
> 2.9.5
>
