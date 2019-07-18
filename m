Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9A466CD23
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 13:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbfGRLKV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 07:10:21 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54359 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfGRLKU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 07:10:20 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6IBA98t001054
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2019 20:10:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6IBA98t001054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563448210;
        bh=Xb0R3/kbYg66AA6ktEujjaxljN6VV9Wa8RaOy6cz6XM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hatQwasgZXoGqNQ6SMP4PeYpTvYtvKKgsX80HMJix8WLI/W2YN2A8qedIAjGYVvPF
         Xoikj7f5LbwKY9p2LRN/ZEUPD2aTwPjSpoS0cTi2CXKpKMr8+XwAkgV9vQHOzdFS/H
         XMY0qQ4by1oBcYw4KVAeYoGYV6JqlELkw88Xe2SeeeRj9+DWCFRDaCS7F5eIw9azyK
         zrgv3fxY8Uxw7yTE/q9R7DqLsLnhVL5bkKAq1V/OGqQ0p+ACxlxqg3TIbXnloI8XeP
         Rih6z1I0hCb9cvzzuhFow6e1aXoLchAQ/PsmADvZ1uc5sVQR+hS5Ci0wxXvP/abHvM
         0uKxVDsXFhDPg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id 190so18807177vsf.9
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2019 04:10:10 -0700 (PDT)
X-Gm-Message-State: APjAAAUfadFCKVNosC7GsDpxPqj3l+qUZgdpNuio5wNDUmFj8XSVOKdu
        fRzo86E6iwpkTvtWIYYoFfSmmUFzUUqukFxQBs4=
X-Google-Smtp-Source: APXvYqxBn637D7jdyHN2Sma7v8bKZGGbHkGyooxhJJgeuxuhvSym7BZ+OftPelwzhuMu1ySdqPtMEFRC6iaaWJ6QNi4=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr28377017vsl.155.1563448208922;
 Thu, 18 Jul 2019 04:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org> <20190624132531.6184-4-linus.walleij@linaro.org>
In-Reply-To: <20190624132531.6184-4-linus.walleij@linaro.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 18 Jul 2019 20:09:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATdYG-POvQQXwEiOD1eYwT081ohqACXV95fU01kfojXjQ@mail.gmail.com>
Message-ID: <CAK7LNATdYG-POvQQXwEiOD1eYwT081ohqACXV95fU01kfojXjQ@mail.gmail.com>
Subject: Re: [PATCH 4/4 v1] RFT: gpio: uniphier: Switch to GPIOLIB_IRQCHIP
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Jun 24, 2019 at 10:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Use the new infrastructure for hierarchical irqchips in
> gpiolib.
>
> I have no chance to test or debug this so I need
> help.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Brian Masney <masneyb@onstation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig         |   1 +
>  drivers/gpio/gpio-uniphier.c | 172 +++++++++--------------------------
>  2 files changed, 45 insertions(+), 128 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index ee34716a39aa..806d642498a6 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -552,6 +552,7 @@ config GPIO_UNIPHIER
>         tristate "UniPhier GPIO support"
>         depends on ARCH_UNIPHIER || COMPILE_TEST
>         depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP
>         select IRQ_DOMAIN_HIERARCHY
>         help
>           Say yes here to support UniPhier GPIOs.
> diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
> index 93cdcc41e9fb..e960836b9c01 100644
> --- a/drivers/gpio/gpio-uniphier.c
> +++ b/drivers/gpio/gpio-uniphier.c
> @@ -6,7 +6,6 @@
>  #include <linux/bits.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/irq.h>
> -#include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -30,7 +29,6 @@
>  struct uniphier_gpio_priv {
>         struct gpio_chip chip;
>         struct irq_chip irq_chip;
> -       struct irq_domain *domain;
>         void __iomem *regs;
>         spinlock_t lock;
>         u32 saved_vals[0];
> @@ -162,49 +160,33 @@ static void uniphier_gpio_set_multiple(struct gpio_chip *chip,
>         }
>  }
>
> -static int uniphier_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
> +static void uniphier_gpio_irq_mask(struct irq_data *d)
>  {
> -       struct irq_fwspec fwspec;
> -
> -       if (offset < UNIPHIER_GPIO_IRQ_OFFSET)
> -               return -ENXIO;
> -
> -       fwspec.fwnode = of_node_to_fwnode(chip->parent->of_node);
> -       fwspec.param_count = 2;
> -       fwspec.param[0] = offset - UNIPHIER_GPIO_IRQ_OFFSET;
> -       /*
> -        * IRQ_TYPE_NONE is rejected by the parent irq domain. Set LEVEL_HIGH
> -        * temporarily. Anyway, ->irq_set_type() will override it later.
> -        */
> -       fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
> -
> -       return irq_create_fwspec_mapping(&fwspec);
> -}
> -
> -static void uniphier_gpio_irq_mask(struct irq_data *data)
> -{
> -       struct uniphier_gpio_priv *priv = data->chip_data;
> -       u32 mask = BIT(data->hwirq);
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct uniphier_gpio_priv *priv = gpiochip_get_data(gc);
> +       u32 mask = BIT(d->hwirq);
>
>         uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, 0);
>
> -       return irq_chip_mask_parent(data);
> +       return irq_chip_mask_parent(d);
>  }
>
> -static void uniphier_gpio_irq_unmask(struct irq_data *data)
> +static void uniphier_gpio_irq_unmask(struct irq_data *d)

Are you renaming 'data' -> 'd'
just for your personal preference?


>  {
> -       struct uniphier_gpio_priv *priv = data->chip_data;
> -       u32 mask = BIT(data->hwirq);
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct uniphier_gpio_priv *priv = gpiochip_get_data(gc);
> +       u32 mask = BIT(d->hwirq);
>
>         uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, mask);
>
> -       return irq_chip_unmask_parent(data);
> +       return irq_chip_unmask_parent(d);
>  }
>
> -static int uniphier_gpio_irq_set_type(struct irq_data *data, unsigned int type)
> +static int uniphier_gpio_irq_set_type(struct irq_data *d, unsigned int type)

Again, this seems a noise change.


>  {
> -       struct uniphier_gpio_priv *priv = data->chip_data;
> -       u32 mask = BIT(data->hwirq);
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct uniphier_gpio_priv *priv = gpiochip_get_data(gc);
> +       u32 mask = BIT(d->hwirq);
>         u32 val = 0;
>
>         if (type == IRQ_TYPE_EDGE_BOTH) {
> @@ -216,7 +198,7 @@ static int uniphier_gpio_irq_set_type(struct irq_data *data, unsigned int type)
>         /* To enable both edge detection, the noise filter must be enabled. */
>         uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_FLT_EN, mask, val);
>
> -       return irq_chip_set_type_parent(data, type);
> +       return irq_chip_set_type_parent(d, type);
>  }
>
>  static int uniphier_gpio_irq_get_parent_hwirq(struct uniphier_gpio_priv *priv,
> @@ -245,82 +227,6 @@ static int uniphier_gpio_irq_get_parent_hwirq(struct uniphier_gpio_priv *priv,
>         return -ENOENT;
>  }
>
> -static int uniphier_gpio_irq_domain_translate(struct irq_domain *domain,
> -                                             struct irq_fwspec *fwspec,
> -                                             unsigned long *out_hwirq,
> -                                             unsigned int *out_type)
> -{
> -       if (WARN_ON(fwspec->param_count < 2))
> -               return -EINVAL;
> -
> -       *out_hwirq = fwspec->param[0];
> -       *out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> -
> -       return 0;
> -}
> -
> -static int uniphier_gpio_irq_domain_alloc(struct irq_domain *domain,
> -                                         unsigned int virq,
> -                                         unsigned int nr_irqs, void *arg)
> -{
> -       struct uniphier_gpio_priv *priv = domain->host_data;
> -       struct irq_fwspec parent_fwspec;
> -       irq_hw_number_t hwirq;
> -       unsigned int type;
> -       int ret;
> -
> -       if (WARN_ON(nr_irqs != 1))
> -               return -EINVAL;
> -
> -       ret = uniphier_gpio_irq_domain_translate(domain, arg, &hwirq, &type);
> -       if (ret)
> -               return ret;
> -
> -       ret = uniphier_gpio_irq_get_parent_hwirq(priv, hwirq);
> -       if (ret < 0)
> -               return ret;
> -
> -       /* parent is UniPhier AIDET */
> -       parent_fwspec.fwnode = domain->parent->fwnode;
> -       parent_fwspec.param_count = 2;
> -       parent_fwspec.param[0] = ret;
> -       parent_fwspec.param[1] = (type == IRQ_TYPE_EDGE_BOTH) ?
> -                                               IRQ_TYPE_EDGE_FALLING : type;
> -
> -       ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> -                                           &priv->irq_chip, priv);
> -       if (ret)
> -               return ret;
> -
> -       return irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
> -}
> -
> -static int uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
> -                                            struct irq_data *data, bool early)
> -{
> -       struct uniphier_gpio_priv *priv = domain->host_data;
> -       struct gpio_chip *chip = &priv->chip;
> -
> -       return gpiochip_lock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
> -}
> -
> -static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
> -                                               struct irq_data *data)
> -{
> -       struct uniphier_gpio_priv *priv = domain->host_data;
> -       struct gpio_chip *chip = &priv->chip;
> -
> -       gpiochip_unlock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
> -}



I did not test this patch, but probably it would break my board.


->(de)activate hook has offset  UNIPHIER_GPIO_IRQ_OFFSET (=120),
but you are replacing it with generic  gpiochip_irq_domain_activate,
which as zero offset.




>         ret = devm_gpiochip_add_data(dev, chip, priv);
>         if (ret)
>                 return ret;
>
> -       priv->domain = irq_domain_create_hierarchy(
> -                                       parent_domain, 0,
> -                                       UNIPHIER_GPIO_IRQ_MAX_NUM,

You are replacing UNIPHIER_GPIO_IRQ_MAX_NUM with gc->ngpio,
which will much more irqs than needed.

Is it possible to provide more flexibility?






-- 
Best Regards
Masahiro Yamada
