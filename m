Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B120338AFD
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 12:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhCLLHn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 06:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbhCLLHU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 06:07:20 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E82C061761
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 03:07:20 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id r17so52541079ejy.13
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 03:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IqSN+ySm6bSg5bLee4pzIbnNLuqg3t2umE3dNOvxCoM=;
        b=Vc8qlRY89B8MNN6WnrFZMY/pb+UhhpjSQfok6kl8IkX1Qgs9t31oJGbF/EqdMImxEf
         l0ZCqw3HSrpiMHcjMUqmVc8EeiNEIenp1V2wI3oElxWtE+3NkRov6JDJn1mEWIW8qV04
         fZtp6Afq7H+M170MAV26eAatpMs8dJ4zv8Qs58nTTdG4KntT3xCwmWPLh8RLJBdn9oSK
         8airkN9yzf0KZQDdjL86cAlvHGr4xxuBHQ2SPaFjdcgrvX9xYwHSRa5kWAPW73iIAm1o
         rcjRpIO12uVY34mpRzPqoVSJ7Vq4Gzygv67ALU3aLw8hZirkh6rLlewm1I1FO7S4YyIj
         Ypcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqSN+ySm6bSg5bLee4pzIbnNLuqg3t2umE3dNOvxCoM=;
        b=KjcJfzWQIVEyjRHN+URznZBrgHuHHG2NmoUje3+0OjqyS2+pHsZjnW3FgfjHHBbeer
         MeYPAUTGlqHWMTWUx9lmrc/isx8YHYmb/zywysbXXGmrwV53KYlvzJt+9gwDAnksEB3P
         celhaD34x3M3Izuwgb9Y+o6irTinzsBFHVvBCa241gvRllpmK4jWGc4oaFSIFb2PAucm
         EwiNPljIxkojhzs/Xb2X3U5i+o8dLoCvhzeiREyGGH6BS1HahPSYP1x7+hHDH1h2QUk6
         zAMBHhJ39oFQ++JJ1chLiRIiUN0ncnio3etg/vX2F6aYeKLnU0k6rnR891ER7GzTXXte
         NhFw==
X-Gm-Message-State: AOAM532AIt61fcOyrZvL7kmSp1DgWPb7lWqUWWG7RLQ+tjDHnvY4ZJ1v
        voG7ploKTzU8FvDlwfKl7DHudN2Z8e9zFboug69TKg==
X-Google-Smtp-Source: ABdhPJxL7uSmlU56sT/eEKpgYZVBjzqTHs69+VRvPI3dX5rFqfqEr7apu5sex4H0a3q8/UWFIxeFEzbnpqoSzWeaTuE=
X-Received: by 2002:a17:906:3105:: with SMTP id 5mr7957617ejx.168.1615547239107;
 Fri, 12 Mar 2021 03:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20210312065855.37072-1-ran.wang_1@nxp.com>
In-Reply-To: <20210312065855.37072-1-ran.wang_1@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 12 Mar 2021 12:07:08 +0100
Message-ID: <CAMpxmJUjzL_6rU+45qWLABBFjkXoS3hBz3TzoP3VJErNOTFdWQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: Add ACPI support
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 12, 2021 at 7:51 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Current implementation only supports DT, now add ACPI support.
>
> Note that compared to device of 'fsl,qoriq-gpio', LS1028A and
> LS1088A's GPIO have no extra programming, so simplify related checking.
>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 50 +++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 6dfca83bcd90..de5b7e17cde3 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -9,6 +9,7 @@
>   * kind, whether express or implied.
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/spinlock.h>
> @@ -292,8 +293,6 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
>         { .compatible = "fsl,mpc5121-gpio", .data = &mpc512x_gpio_devtype, },
>         { .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
>         { .compatible = "fsl,pq3-gpio",     },
> -       { .compatible = "fsl,ls1028a-gpio", },
> -       { .compatible = "fsl,ls1088a-gpio", },

Why are you removing support for those?

Bart

>         { .compatible = "fsl,qoriq-gpio",   },
>         {}
>  };
> @@ -303,10 +302,19 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         struct device_node *np = pdev->dev.of_node;
>         struct mpc8xxx_gpio_chip *mpc8xxx_gc;
>         struct gpio_chip        *gc;
> -       const struct mpc8xxx_gpio_devtype *devtype =
> -               of_device_get_match_data(&pdev->dev);
> +       const struct mpc8xxx_gpio_devtype *devtype;
> +       const struct acpi_device_id *acpi_id;
>         int ret;
>
> +       if (pdev->dev.of_node) {
> +               devtype = of_device_get_match_data(&pdev->dev);
> +       } else {
> +               acpi_id = acpi_match_device(pdev->dev.driver->acpi_match_table,
> +                                               &pdev->dev);
> +               if (acpi_id)
> +                       devtype = (struct mpc8xxx_gpio_devtype *) acpi_id->driver_data;
> +       }
> +
>         mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERNEL);
>         if (!mpc8xxx_gc)
>                 return -ENOMEM;
> @@ -315,14 +323,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>
>         raw_spin_lock_init(&mpc8xxx_gc->lock);
>
> -       mpc8xxx_gc->regs = of_iomap(np, 0);
> +       mpc8xxx_gc->regs = devm_platform_ioremap_resource(pdev, 0);
>         if (!mpc8xxx_gc->regs)
>                 return -ENOMEM;
>
>         gc = &mpc8xxx_gc->gc;
>         gc->parent = &pdev->dev;
>
> -       if (of_property_read_bool(np, "little-endian")) {
> +       if (device_property_read_bool(&pdev->dev, "little-endian")) {
>                 ret = bgpio_init(gc, &pdev->dev, 4,
>                                  mpc8xxx_gc->regs + GPIO_DAT,
>                                  NULL, NULL,
> @@ -369,10 +377,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>          * associated input enable must be set (GPIOxGPIE[IEn]=1) to propagate
>          * the port value to the GPIO Data Register.
>          */
> -       if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
> -           of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
> -           of_device_is_compatible(np, "fsl,ls1088a-gpio"))
> -               gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
> +       if (pdev->dev.of_node) {
> +               if (of_device_is_compatible(np, "fsl,qoriq-gpio"))
> +                       gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
> +       } else {
> +               if (acpi_match_device(pdev->dev.driver->acpi_match_table,
> +                                       &pdev->dev))
> +                       gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
> +       }
>
>         ret = gpiochip_add_data(gc, mpc8xxx_gc);
>         if (ret) {
> @@ -381,12 +393,15 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>                 goto err;
>         }
>
> -       mpc8xxx_gc->irqn = irq_of_parse_and_map(np, 0);
> +       mpc8xxx_gc->irqn = platform_get_irq(pdev, 0);
>         if (!mpc8xxx_gc->irqn)
>                 return 0;
>
> -       mpc8xxx_gc->irq = irq_domain_add_linear(np, MPC8XXX_GPIO_PINS,
> -                                       &mpc8xxx_gpio_irq_ops, mpc8xxx_gc);
> +       mpc8xxx_gc->irq = irq_domain_create_linear(dev_fwnode(&pdev->dev),
> +                                                  MPC8XXX_GPIO_PINS,
> +                                                  &mpc8xxx_gpio_irq_ops,
> +                                                  mpc8xxx_gc);
> +
>         if (!mpc8xxx_gc->irq)
>                 return 0;
>
> @@ -425,12 +440,21 @@ static int mpc8xxx_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id gpio_acpi_ids[] = {
> +       {"NXP0031",},
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
> +#endif
> +
>  static struct platform_driver mpc8xxx_plat_driver = {
>         .probe          = mpc8xxx_probe,
>         .remove         = mpc8xxx_remove,
>         .driver         = {
>                 .name = "gpio-mpc8xxx",
>                 .of_match_table = mpc8xxx_gpio_ids,
> +               .acpi_match_table = ACPI_PTR(gpio_acpi_ids),
>         },
>  };
>
> --
> 2.25.1
>
