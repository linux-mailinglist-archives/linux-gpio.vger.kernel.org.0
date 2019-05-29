Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4428D2E7E4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2019 00:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfE2WPT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 18:15:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40273 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfE2WPT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 18:15:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id u11so3665242otq.7;
        Wed, 29 May 2019 15:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSFF4bDXPHpLrA6n50RMJhRFJYg/glW80Pouz4KvDb0=;
        b=IEMl1JGnDtgMbFifwyt+n3RoZCpqnF0MNkZcfSyOGUu1w/+TML/K7HiMRd3TSAnRAL
         ZuqQDsEbRhnCWSAQIjgz6VbQul60A0HhsNT7GMyxUDKEuIRCMnxWitJp9+KVO+5iSJqo
         S/qcC31/FZ3nnKUF+fSljw0UG7fmu3+vjItB25xpCU1y7NkHpkF7Vstg5JpAYC+U8qsm
         neHTiQBLeJXV4btS5aMuc/DMPtqo03oNMM837UiS9w25RjGFgf7PQ0jQuVYdhDeXRC3H
         78qDOYIn+BMFdc+yOuGwpneB3q0DNIhRYzG7TzSwwW0A6VobOzuIwptdc1P4xtM3TDvz
         S4sQ==
X-Gm-Message-State: APjAAAVX+ZMtywgTCQG4/41Adnsncs05rE2yh08s3ldEEINZ+O1vjqa+
        qW+E0ogJzkO2rBOzM9cCeHzLqPJlxKg=
X-Google-Smtp-Source: APXvYqymNn0zHzzyTzWydenBNUP9THKeC6tneQbniCp78hi77D0MatlYykgW/AlXXGz9nC66DhCInw==
X-Received: by 2002:a9d:7d9a:: with SMTP id j26mr105618otn.102.1559168118123;
        Wed, 29 May 2019 15:15:18 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id r14sm335550otk.72.2019.05.29.15.15.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 15:15:15 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id w144so3380984oie.12;
        Wed, 29 May 2019 15:15:15 -0700 (PDT)
X-Received: by 2002:aca:ea05:: with SMTP id i5mr374591oih.51.1559168115228;
 Wed, 29 May 2019 15:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190529083254.39581-1-chuanhua.han@nxp.com> <20190529083254.39581-2-chuanhua.han@nxp.com>
In-Reply-To: <20190529083254.39581-2-chuanhua.han@nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Wed, 29 May 2019 17:15:03 -0500
X-Gmail-Original-Message-ID: <CADRPPNTyr+ZpK84C4KPwLVLnabNYN4MC3q=Gp94hBc5VPh7fYg@mail.gmail.com>
Message-ID: <CADRPPNTyr+ZpK84C4KPwLVLnabNYN4MC3q=Gp94hBc5VPh7fYg@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: mpc8xxx: Use IRQF_SHARED mode to request IRQ
To:     Chuanhua Han <chuanhua.han@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Zhang Ying-22455 <ying.zhang22455@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 29, 2019 at 3:33 AM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>
> GPIO3 and GPIO4 controllers share one irq number on Layerscape
> platform. In the current implementation, only one GPIO controller
> can register successfully.
>
> This patch is to allow two controllers to share a single interrupt
> number.

This patch definitely did more than setting the IRQF_SHARED flag for
interrupt.  If the driver do need some cleanup please separate the
cleanup into another patch.

>
> Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 43 ++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 555e0e7957d9..63c8586fe5c8 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -11,6 +11,7 @@
>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/interrupt.h>
>  #include <linux/spinlock.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> @@ -105,10 +106,9 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>                 return -ENXIO;
>  }
>
> -static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
> +static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *dev_id)
>  {
> -       struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_desc_get_handler_data(desc);
> -       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct mpc8xxx_gpio_chip *mpc8xxx_gc = dev_id;
>         struct gpio_chip *gc = &mpc8xxx_gc->gc;
>         unsigned int mask;
>
> @@ -117,8 +117,7 @@ static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
>         if (mask)
>                 generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
>                                                      32 - ffs(mask)));
> -       if (chip->irq_eoi)
> -               chip->irq_eoi(&desc->irq_data);
> +       return IRQ_HANDLED;
>  }
>
>  static void mpc8xxx_irq_unmask(struct irq_data *d)
> @@ -129,6 +128,9 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
>
>         raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
>
> +       gc->write_reg(mpc8xxx_gc->regs + GPIO_IER,
> +                     gc->pin2mask(gc, irqd_to_hwirq(d)));

This API has been removed for a while, are you sure you compiled and
tested the change on latest kernel?

commit 24efd94bc38290dc1d9775a1e767ed4685d8a79b
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Fri Oct 20 16:31:27 2017 +0200

    gpio: mmio: Make pin2mask() a private business

    The vtable call pin2mask() was introducing a vtable function call
    in every gpiochip callback for a generic MMIO GPIO chip. This was
    not exactly efficient. (Maybe link-time optimization could get rid of
    it, I don't know.)

    After removing all external calls into this API we can make it a
    boolean flag in the struct gpio_chip call and sink the function into
    the gpio-mmio driver yielding encapsulation and potential speedups.

    Cc: Anton Vorontsov <anton@enomsg.org>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

> +
>         gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
>                 gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
>                 | mpc_pin2mask(irqd_to_hwirq(d)));
> @@ -302,21 +304,31 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         struct gpio_chip        *gc;
>         const struct mpc8xxx_gpio_devtype *devtype =
>                 of_device_get_match_data(&pdev->dev);
> -       int ret;
> +       int ret, irq;
>
>         mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERNEL);
>         if (!mpc8xxx_gc)
>                 return -ENOMEM;
>
> -       platform_set_drvdata(pdev, mpc8xxx_gc);
> -
> -       raw_spin_lock_init(&mpc8xxx_gc->lock);
> -
>         mpc8xxx_gc->regs = of_iomap(np, 0);
>         if (!mpc8xxx_gc->regs)
>                 return -ENOMEM;
>
>         gc = &mpc8xxx_gc->gc;
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0) {
> +               dev_err(&pdev->dev, "can't get irq number\n");
> +               return irq;
> +       }
> +
> +       mpc8xxx_gc->gc.label = pdev->name;
> +       mpc8xxx_gc->gc.owner = THIS_MODULE;
> +       mpc8xxx_gc->gc.base = -1;
> +       mpc8xxx_gc->gc.ngpio = MPC8XXX_GPIO_PINS;
> +
> +       platform_set_drvdata(pdev, mpc8xxx_gc);
> +
> +       raw_spin_lock_init(&mpc8xxx_gc->lock);
>
>         if (of_property_read_bool(np, "little-endian")) {
>                 ret = bgpio_init(gc, &pdev->dev, 4,
> @@ -364,7 +376,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>                 goto err;
>         }
>
> -       mpc8xxx_gc->irqn = irq_of_parse_and_map(np, 0);
> +       mpc8xxx_gc->irqn = platform_get_irq(pdev, 0);
>         if (!mpc8xxx_gc->irqn)
>                 return 0;
>
> @@ -378,8 +390,13 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0xffffffff);
>         gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR2, 0xffffffff);
>
> -       irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
> -                                        mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
> +       /* Request IRQ */
> +       ret = devm_request_irq(&pdev->dev, irq, mpc8xxx_gpio_irq_cascade,
> +                              IRQF_SHARED, pdev->name, mpc8xxx_gc);
> +       if (ret) {
> +               dev_err(&pdev->dev, "can't claim irq %d\n", mpc8xxx_gc->irqn);
> +               goto err;
> +       }
>         return 0;
>  err:
>         iounmap(mpc8xxx_gc->regs);
> --
> 2.17.1
>
