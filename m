Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA60D1419
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731686AbfJIQeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:34:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42906 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfJIQeG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 12:34:06 -0400
Received: by mail-ot1-f65.google.com with SMTP id c10so2254947otd.9
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xpa5x5FtEx57kIrxbIEmX+YdyK/X1i/zUyZcWd2Z1Po=;
        b=udHthLOLaFCuZr0AbyIkG5rTFL5xRUgC84odB2PUtgTFgyqOFvGidHi/ETcIqSGKd4
         /DYr7kF4p/u7LGePJbWwY2Iu/qTyoO7Ow5Iw00c3ZC3s44Zn1J6ItQ82p25nac4CxXjG
         k5G410ZoY40DFUXUqs3GgQY6lhbaYSxX9h6rRhwh5KUmi1ZIfuw1Ne12SkQ8nfIbdDPc
         hvj8gsAQuKZsiPr/iHOvHzwIjAx/PSutIdLn0z0NwCOuuWeRupaqejxdyL8af7nsyI3R
         oBzpCbGXSHhqD0PKUsPj8tE0tPSty3MKR9/byzG3ABLnP8uJt1FfN/73G8IC8yI4K7SN
         f9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xpa5x5FtEx57kIrxbIEmX+YdyK/X1i/zUyZcWd2Z1Po=;
        b=k6B8Ad4XItFvVek/kKdCm+ixM9qHYOm2vDBQs2AIZuOs2SwJh/Ts/HtsfcAGtYywIQ
         r04H+mI+qbXbcgLAwqiXMzLSz9O1+sFeISOll2Eri3b81g5cGI5zDXEp1fje0Nt1ZcnI
         Mk4W0H+3sSaZcKZlBGyFStEdl0bUeGwsuZHlRY6dV0I1GX2mx6+ntkEVFY/1jCE2vfrN
         g50+FU85QJ3ENbSgt+APihUqXGqR+vpv6pIjlC9Q6T8A25uBIEgkEvD0uIbOPtXGlcDh
         Nhgz5Y3DNCod46kpmcR49yNv+GMMwFP+zS0lMmPqFPtaSnszbkVFxton9jF65zu7/jaC
         Ca6A==
X-Gm-Message-State: APjAAAWdMm26HGv2muSTe6M7Gf95zp7H0UnvdncRDBvcl+3UvpJ9CmyL
        rr54K4z3TLEpGtuF6XztF9orhi3FeDAGE94mgQlgvg==
X-Google-Smtp-Source: APXvYqxJohNE21WQBvPtj9t/5XJFgzN0/WlpuYOnA7Glsjddm3+nHq0LW7VLoKtNkRwKXJR896xW9Wj4qLAAYuvxuh4=
X-Received: by 2002:a9d:7dd6:: with SMTP id k22mr3693082otn.256.1570638845498;
 Wed, 09 Oct 2019 09:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191009083021.33529-1-hui.song_1@nxp.com>
In-Reply-To: <20191009083021.33529-1-hui.song_1@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Oct 2019 18:33:54 +0200
Message-ID: <CAMpxmJVUkkiywMOQ6i_izu+8LQD0S_fpd_iuBz4yGceSrs5beg@mail.gmail.com>
Subject: Re: [PATCH v6] gpio/mpc8xxx: change irq handler from chained to normal
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

=C5=9Br., 9 pa=C5=BA 2019 o 10:41 Hui Song <hui.song_1@nxp.com> napisa=C5=
=82(a):
>
> From: Song Hui <hui.song_1@nxp.com>
>
> More than one gpio controllers can share one interrupt, change the
> driver to request shared irq.
>
> While this will work, it will mess up userspace accounting of the number
> of interrupts per second in tools such as vmstat.  The reason is that
> for every GPIO interrupt, /proc/interrupts records the count against GIC
> interrupt 68 or 69, as well as the GPIO itself.  So, for every GPIO
> interrupt, the total number of interrupts that the system has seen
> increments by two
>
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  Changes in v6:
>         - change request_irq to devm_request_irq and add commit message.
>  Changes in v5:
>         - add traverse every bit function.
>  Changes in v4:
>         - convert 'pr_err' to 'dev_err'.
>  Changes in v3:
>         - update the patch description.
>  Changes in v2:
>         - delete the compatible of ls1088a.
>
>  drivers/gpio/gpio-mpc8xxx.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 16a47de..f0be284 100644
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
> +       struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D data;
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

This is unrelated to the patch. Please put it in a separate patch.

Bart

>                 goto err;
>         }
>
> @@ -409,8 +410,16 @@ static int mpc8xxx_probe(struct platform_device *pde=
v)
>         if (devtype->gpio_dir_in_init)
>                 devtype->gpio_dir_in_init(gc);
>
> -       irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
> -                                        mpc8xxx_gpio_irq_cascade, mpc8xx=
x_gc);
> +       ret =3D devm_request_irq(&pdev->dev, mpc8xxx_gc->irqn,
> +                              mpc8xxx_gpio_irq_cascade,
> +                              IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascad=
e",
> +                              mpc8xxx_gc);
> +       if (ret) {
> +               dev_err(&pdev->dev, "%s: failed to devm_request_irq(%d), =
ret =3D %d\n",
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
