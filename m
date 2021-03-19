Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16CA341F85
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 15:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhCSOeq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 10:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhCSOel (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 10:34:41 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1508C06174A;
        Fri, 19 Mar 2021 07:34:41 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id v186so3805333pgv.7;
        Fri, 19 Mar 2021 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZPv46Rde/68JdkOJ3jA7N9OcBWe9sPvEDkapP3FqB08=;
        b=WGzmBKe8V1dmADM0kCwQksvkJ7dVcu5xy9BELVgikbjHjTCMYtEnQFuI4X5kfNBaUo
         YB3sQAzqgDaaDeIE3empPrCkCtJGp7qCVcqmUNFhKRC9jRmwokCLY9KsN7AcUx3AbQ42
         Sc5iSKxRALJ8WsDnBMe4M1LzkrhDabqKNbJEyOPVjTMnQ8EmwmqHHqOIdEknno6fCQRn
         MNDZExyjmga10muXWPviSqCrAflcXAZYyX3F/bR2SKkDDr+fOyXrpa3YV7ol13AKVNyb
         IUc12t+fHd2V36xKsamZe2U4PQmcv5B/ADfIN0gM+SVUMmESgdVAYpQlhTYA/elpHdIP
         PFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZPv46Rde/68JdkOJ3jA7N9OcBWe9sPvEDkapP3FqB08=;
        b=d6jl3e+b+aFVkeOs/TJ3hEcv67ei/spFbYEFXLT8LGxneM03KPEftDuaoET6E4SyIA
         zVed9Gb6Lf239quU8ajdN8qDcxtb8HxY63JD6cVT1yPqLichejasLM2YiHp2G8GkHk+B
         APb0fM4hkW5t/ppbXIX4K/hWZDw2tRse72V04/ccn9LMcRUuxT4XEzg6cQiuOgFYZY8Y
         vM2zSU865IF38ATJ5Oj7gcqwk8Jm7REu15hyr5VNbApalbbnqnpkGhtM2dD6XnjVhH+3
         FhfaGrhh+10CD6XhDqr40I5NVyErAT0LT4UB+EpKQ13I5eUTS6LstNNPYzNn0Wa6RvZR
         Gguw==
X-Gm-Message-State: AOAM5332tfFcp9wzB+8Sk5a7LvBFA88PUtoXy+FQlvD6Nc6jsdNCt93t
        mpollu5JYzS+/LPB8NpmvrOJQDHKzEn+xhL7/qU=
X-Google-Smtp-Source: ABdhPJxSwtGymcJiB9gv9psnkMgFNp+QsZC0kV+IMdGh8TpqSNgxJL4FUrC4tM0CchBNIh+SO50wUzHKqiF+muXKo08=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr11744963pgf.4.1616164481161;
 Fri, 19 Mar 2021 07:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210319131205.62775-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20210319131205.62775-1-alexander.sverdlin@nokia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Mar 2021 16:34:25 +0200
Message-ID: <CAHp75Vc=HnafsnnJYceBB66k+r9NcZqn7mxjdsc7dsQd_tK=LA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: pl061: Support implementations without GPIOINTR line
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 3:12 PM Alexander A Sverdlin
<alexander.sverdlin@nokia.com> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>
> There are several implementations of PL061 which lack GPIOINTR signal in
> hardware and only have individual GPIOMIS[7:0] interrupts. Use the
> hierarchical interrupt support of the gpiolib in these cases (if at least 8
> IRQs are configured for the PL061).
>
> One in-tree example is arch/arm/boot/dts/axm55xx.dtsi, PL061 instances have
> 8 IRQs defined, but current driver supports only the first one, so only one
> pin would work as IRQ trigger.

an IRQ

I'm wondering if the GPIO library support for IRQ hierarchy is what
you are looking for.

> Link: https://lore.kernel.org/linux-gpio/CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com/
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
> Changelog:
> v3: pl061_populate_parent_fwspec() -> pl061_populate_parent_alloc_arg()
> v2: Add pl061_populate_parent_fwspec()
>
>  drivers/gpio/Kconfig      |  1 +
>  drivers/gpio/gpio-pl061.c | 97 +++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 91 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e3607ec..456c0a5 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -469,6 +469,7 @@ config GPIO_PL061
>         depends on ARM_AMBA
>         select IRQ_DOMAIN
>         select GPIOLIB_IRQCHIP
> +       select IRQ_DOMAIN_HIERARCHY

A nit-pick: perhaps group IRQ_ together, like

       select IRQ_DOMAIN
       select IRQ_DOMAIN_HIERARCHY
       select GPIOLIB_IRQCHIP

?

>         help
>           Say yes here to support the PrimeCell PL061 GPIO device
>
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index f1b53dd..5bfb5f6 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm.h>

> +#include <linux/of_irq.h>

A nit-pick: Perhaps before linux/p* ?

>  #define GPIODIR 0x400
>  #define GPIOIS  0x404
> @@ -283,6 +284,69 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
>         return irq_set_irq_wake(pl061->parent_irq, state);
>  }
>
> +static int pl061_child_to_parent_hwirq(struct gpio_chip *gc, unsigned int child,
> +                                      unsigned int child_type,
> +                                      unsigned int *parent,
> +                                      unsigned int *parent_type)
> +{
> +       struct amba_device *adev = to_amba_device(gc->parent);
> +       unsigned int irq = adev->irq[child];
> +       struct irq_data *d = irq_get_irq_data(irq);
> +
> +       if (!d)
> +               return -EINVAL;
> +
> +       *parent_type = irqd_get_trigger_type(d);
> +       *parent = irqd_to_hwirq(d);
> +       return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static void *pl061_populate_parent_alloc_arg(struct gpio_chip *gc,
> +                                            unsigned int parent_hwirq,
> +                                            unsigned int parent_type)
> +{
> +       struct device_node *dn = to_of_node(gc->irq.fwnode);
> +       struct of_phandle_args pha;
> +       struct irq_fwspec *fwspec;
> +       int i;
> +
> +       if (WARN_ON(!dn))
> +               return NULL;
> +
> +       fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
> +       if (!fwspec)
> +               return NULL;
> +
> +       /*
> +        * This brute-force here is because of the fact PL061 is often paired
> +        * with GIC-v3, which has 3-cell IRQ specifier (SPI/PPI selection), and
> +        * unexpected range shifts in hwirq mapping (SPI IRQs are shifted by
> +        * 32). So this is about reversing of gic_irq_domain_translate().
> +        */
> +       for (i = 0; i < PL061_GPIO_NR; i++) {
> +               unsigned int p, pt;
> +
> +               if (pl061_child_to_parent_hwirq(gc, i, parent_type, &p, &pt))
> +                       continue;
> +               if (p == parent_hwirq)
> +                       break;
> +       }
> +       if (WARN_ON(i == PL061_GPIO_NR))
> +               return NULL;
> +
> +       if (WARN_ON(of_irq_parse_one(dn, i, &pha)))
> +               return NULL;
> +
> +       fwspec->fwnode = gc->irq.parent_domain->fwnode;
> +       fwspec->param_count = pha.args_count;
> +       for (i = 0; i < pha.args_count; i++)
> +               fwspec->param[i] = pha.args[i];
> +
> +       return fwspec;
> +}
> +#endif
> +
>  static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>         struct device *dev = &adev->dev;
> @@ -330,16 +394,35 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>
>         girq = &pl061->gc.irq;
>         girq->chip = &pl061->irq_chip;
> -       girq->parent_handler = pl061_irq_handler;
> -       girq->num_parents = 1;
> -       girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> -                                    GFP_KERNEL);
> -       if (!girq->parents)
> -               return -ENOMEM;
> -       girq->parents[0] = irq;
>         girq->default_type = IRQ_TYPE_NONE;
>         girq->handler = handle_bad_irq;
>
> +       /*
> +        * There are some PL061 implementations which lack GPIOINTR in hardware
> +        * and only have individual GPIOMIS[7:0] signals. We distinguish them by
> +        * the number of IRQs assigned to the AMBA device.
> +        */
> +       if (adev->irq[PL061_GPIO_NR - 1]) {
> +               girq->fwnode = dev->fwnode;
> +               girq->parent_domain =
> +                       irq_get_irq_data(adev->irq[PL061_GPIO_NR - 1])->domain;
> +               girq->child_to_parent_hwirq = pl061_child_to_parent_hwirq;
> +#ifdef CONFIG_OF
> +               girq->populate_parent_alloc_arg =
> +                       pl061_populate_parent_alloc_arg;
> +#endif
> +       } else {
> +               WARN_ON(adev->irq[1]);
> +
> +               girq->parent_handler = pl061_irq_handler;
> +               girq->num_parents = 1;
> +               girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> +                                            GFP_KERNEL);
> +               if (!girq->parents)
> +                       return -ENOMEM;
> +               girq->parents[0] = irq;
> +       }
> +
>         ret = devm_gpiochip_add_data(dev, &pl061->gc, pl061);
>         if (ret)
>                 return ret;
> --
> 2.10.2
>


-- 
With Best Regards,
Andy Shevchenko
