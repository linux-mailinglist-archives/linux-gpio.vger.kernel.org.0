Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9299354EEA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 10:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234510AbhDFIrJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 04:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbhDFIrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Apr 2021 04:47:08 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE11C06174A;
        Tue,  6 Apr 2021 01:47:01 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so9280708pjh.1;
        Tue, 06 Apr 2021 01:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v8t9qGiqdRXR8+EmbYnvxXFK/yprtNMCSRFqWTcfMeM=;
        b=mWi5s+7vFFZtmBOXAALwbHFSGth7cF9YjcujdRPfFFZcf9oOAAppFYAsN9DcYBoV4N
         7qpW9hfriJqtx+9BHIIYBhV7eWCTsRog79H401UBuYv+Y+vGHWiBYPnd/B9eOqsWJhD3
         MoLNgvZI32Ws5+ck2XWvTvB885rSYo6UDuD1L5OvIYimHkWwTtA+2BhC2dz3ZLYT5M3N
         /DXlQ0lMs7dsnWmYMHt87piEdPiGWNdOTaeX+eabP7dj4KnT6ntbGuF46wpkXVMlH/F5
         4ngyhweysB/S88YdxXkqTsOk+uUkNocxiIKFb1Hr9rz3zBs/BcfcY+5CDp/xdEuANQZE
         fI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8t9qGiqdRXR8+EmbYnvxXFK/yprtNMCSRFqWTcfMeM=;
        b=PSkxD8+6NUI5E7cPdkjL5wmKJCJQd+3yPaJ7mF+/neF3oyvbkpFdOTrXTQNLmo1xSo
         clJxMrD3GfadDFcDcfGf1VZSDqLD1oN4/la6qk2jmkfs0htF86Z0XHCELyc2zympzr7s
         D+coNokKMOt+KXHS31HTizWbkXH/iQOnrBcZiK+4CygZbSSooSv+p7YGAG+khhxCJSy7
         5c+hGc1nGAyGgYdzRlMg5KxRwVlirUL5SnwFG34PT50frlkChoxPZWxAfvqvilNO5BR2
         qzGzedlGAcD/tpJYeZAtJ44hmaUaubYo/DbsV9FM8dDCgde+ckkXQ3SAWCO1Cj8k0Dq/
         LzDA==
X-Gm-Message-State: AOAM531QWELq7xgAcbwsNR0q4P5qIvFgtkBoMdxioi8nGip3Y3Xt7ua0
        1Twz17gmTD37xVLSddF0u9bZBKqgOLx9ldm7gYc=
X-Google-Smtp-Source: ABdhPJyXGH7j8Ast6jAbcVyy9u4wRuey1uRMw4PxIvnqnHZ5zi3NOdL0POFI2UZVyImWJxLnBkX2SmbRjMr14kx2LLY=
X-Received: by 2002:a17:902:e803:b029:e9:1f79:2427 with SMTP id
 u3-20020a170902e803b02900e91f792427mr6531908plg.21.1617698820687; Tue, 06 Apr
 2021 01:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210322033846.39882-1-ran.wang_1@nxp.com>
In-Reply-To: <20210322033846.39882-1-ran.wang_1@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 6 Apr 2021 11:46:44 +0300
Message-ID: <CAHp75Ve6QP7tiTj7cxHiXFLMPSzkGULFe1GdYgtTbg9AhZR3qg@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: mpc8xxx: Add ACPI support
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 5:31 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Current implementation only supports DT, now add ACPI support.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v4:
>  - Update error print for gpiochip_add_data() to fix wrong info. in ACPI case.
>  - Update error print for devm_request_irq() to fix panic in ACPI case.
>  - Add include property.h and mod_devicetable.h.
>  - Correct error handling for mpc8xxx_gc->regs.
>  - Replace "!(IS_ERR_OR_NULL(fwnode) || is_of_node(fwnode)))" with "is_acpi_node(fwnode)"
>
> Change in v3:
>  - Recover ls1028a and ls1088a compatilbe checking logic
>
> Change in v2:
>  - Initialize devtype with NULL to fix compile warning.
>  - Replace of_device_get_match_data() and acpi_match_device with device_get_match_data().
>  - Replace acpi_match_device() with simpler checking logic per Andy's suggestion.
>
>  drivers/gpio/gpio-mpc8xxx.c | 47 ++++++++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 6dfca83bcd90..4b9157a69fca 100644
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
> @@ -18,6 +19,8 @@
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> +#include <linux/property.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/slab.h>
>  #include <linux/irq.h>
>  #include <linux/gpio/driver.h>
> @@ -303,8 +306,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         struct device_node *np = pdev->dev.of_node;
>         struct mpc8xxx_gpio_chip *mpc8xxx_gc;
>         struct gpio_chip        *gc;
> -       const struct mpc8xxx_gpio_devtype *devtype =
> -               of_device_get_match_data(&pdev->dev);
> +       const struct mpc8xxx_gpio_devtype *devtype = NULL;
> +       struct fwnode_handle *fwnode;
>         int ret;
>
>         mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERNEL);
> @@ -315,14 +318,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>
>         raw_spin_lock_init(&mpc8xxx_gc->lock);
>
> -       mpc8xxx_gc->regs = of_iomap(np, 0);
> -       if (!mpc8xxx_gc->regs)
> -               return -ENOMEM;
> +       mpc8xxx_gc->regs = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(mpc8xxx_gc->regs))
> +               return PTR_ERR(mpc8xxx_gc->regs);
>
>         gc = &mpc8xxx_gc->gc;
>         gc->parent = &pdev->dev;
>
> -       if (of_property_read_bool(np, "little-endian")) {
> +       if (device_property_read_bool(&pdev->dev, "little-endian")) {
>                 ret = bgpio_init(gc, &pdev->dev, 4,
>                                  mpc8xxx_gc->regs + GPIO_DAT,
>                                  NULL, NULL,
> @@ -345,6 +348,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>
>         mpc8xxx_gc->direction_output = gc->direction_output;
>
> +       devtype = device_get_match_data(&pdev->dev);
>         if (!devtype)
>                 devtype = &mpc8xxx_gpio_devtype_default;
>
> @@ -369,24 +373,29 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>          * associated input enable must be set (GPIOxGPIE[IEn]=1) to propagate
>          * the port value to the GPIO Data Register.
>          */
> +       fwnode = dev_fwnode(&pdev->dev);
>         if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
>             of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
> -           of_device_is_compatible(np, "fsl,ls1088a-gpio"))
> +           of_device_is_compatible(np, "fsl,ls1088a-gpio") ||
> +           is_acpi_node(fwnode))
>                 gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
>
>         ret = gpiochip_add_data(gc, mpc8xxx_gc);
>         if (ret) {
> -               pr_err("%pOF: GPIO chip registration failed with status %d\n",
> -                      np, ret);
> +               dev_err(&pdev->dev,
> +                       "GPIO chip registration failed with status %d\n", ret);
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
> +       mpc8xxx_gc->irq = irq_domain_create_linear(fwnode,
> +                                                  MPC8XXX_GPIO_PINS,
> +                                                  &mpc8xxx_gpio_irq_ops,
> +                                                  mpc8xxx_gc);
> +
>         if (!mpc8xxx_gc->irq)
>                 return 0;
>
> @@ -399,8 +408,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>                                IRQF_SHARED, "gpio-cascade",
>                                mpc8xxx_gc);
>         if (ret) {
> -               dev_err(&pdev->dev, "%s: failed to devm_request_irq(%d), ret = %d\n",
> -                       np->full_name, mpc8xxx_gc->irqn, ret);
> +               dev_err(&pdev->dev,
> +                       "failed to devm_request_irq(%d), ret = %d\n",
> +                       mpc8xxx_gc->irqn, ret);
>                 goto err;
>         }
>
> @@ -425,12 +435,21 @@ static int mpc8xxx_remove(struct platform_device *pdev)
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


-- 
With Best Regards,
Andy Shevchenko
