Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 126AFE0035
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 11:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388259AbfJVJCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 05:02:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35177 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388182AbfJVJCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 05:02:55 -0400
Received: by mail-ot1-f68.google.com with SMTP id z6so13531562otb.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 02:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BB/TCLUtXE424Mz+v1KExFsxH84TaZce8LrOdUDYzMo=;
        b=Pm7FnxH0SsD12pr4IpZPXgZLf8ZcQw+lAsw9WSEz81IgdjibQnjosThxoxLOjY/kdb
         Y/eWATKuJ6f0mT7+v2HUvQxKo28qKuWEjWcHI1zQh1IaYv6XaCST/u326846ZjoOkHbR
         zW+9OFIfCLE94Sav+U2K2GC7HGLtPXwZR0/CzIp8g3aSep0u51XgQ7L1ujqmSc6l3XFb
         LGXPPfeyGSDA9M0iJMYQf62ulvGh+U/LA4zpSCDfnXs9Hg3w0in86dv35uw7cwDLCMiG
         Fq5kU/Ixwk3BiLNorLQmBKRsM1r0YkRh1Fycb/Z/lQ3VlrJOEimvFTaLgaOqBx1sgth4
         RJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BB/TCLUtXE424Mz+v1KExFsxH84TaZce8LrOdUDYzMo=;
        b=PlWpkfAbig6HpL6R9bseYP9JwXOQAaVkrcr3WAwN06SFPnGR07NtVoSasbWWxI28+5
         7s0LwYLgZg9GzUeZ42CfoILvQsIEc4ITHk3bZQAKzNgAr/IhjwPoOM0UVVior6SJJvM3
         rRciW8ENsWQZybptWltYKDwCVp0rYNHagesFT9eaW1JW24Anynl980Xbz5iAgGun05LU
         3Lwxo76brhEb22o0NwyfTV/W+/GprWKt0vGdQIDMcLfjbz/v0ixG0ZN8tqKTtOd0c50n
         LBO/gXUd4TGNn4e3V6NMHmqzqhkOmUFxCu1ODukUL5a3qRAy+oqSl+x55vLQLak1FxUB
         dT6A==
X-Gm-Message-State: APjAAAUuvgaOS31ygE6DwooIlNxovrNsighuiQJe0ZKsUKWztHTyIhMt
        oui48a2vOuz5vSMyPcg01RVVpZrI+zyd27cwebW4DX0O
X-Google-Smtp-Source: APXvYqycXDVGC8TSC4U5A08K+mMHmjJG6+4/VsH9tZdqiZQYCsLPGRDZiLgKLzSwj+lJIn9ewhacvXxkq+mjx/XrzJk=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr1819585otr.194.1571734972169;
 Tue, 22 Oct 2019 02:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org> <20191021064413.19840-4-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20191021064413.19840-4-manivannan.sadhasivam@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 22 Oct 2019 11:02:41 +0200
Message-ID: <CAMpxmJU9TFhQjSjoLwWDtEK+-RRU1j-Am1qk66mexGe1j_SQOw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] gpio: Add RDA Micro GPIO controller support
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 21 pa=C5=BA 2019 o 08:44 Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> napisa=C5=82(a):
>
> Add support for GPIO controller from RDA Micro. This GPIO controller
> is an in house IP, developed by RDA Micro (now Unisoc) for the use in
> RDA88* series of SoCs. There are multiple GPIO ports present in all SoCs,
> each capable of addressing 32 GPIOs. But only first 8 pins have the
> interrupt capability.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/gpio/Kconfig    |   9 ++
>  drivers/gpio/Makefile   |   1 +
>  drivers/gpio/gpio-rda.c | 294 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 304 insertions(+)
>  create mode 100644 drivers/gpio/gpio-rda.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 38e096e6925f..a896f0820a21 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -435,6 +435,15 @@ config GPIO_RCAR
>         help
>           Say yes here to support GPIO on Renesas R-Car SoCs.
>
> +config GPIO_RDA
> +       bool "RDA Micro GPIO controller support"
> +       depends on ARCH_RDA || COMPILE_TEST
> +       depends on OF_GPIO
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say Y here to support RDA Micro GPIO controller.
> +
>  config GPIO_REG
>         bool
>         help
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index d2fd19c15bae..5c68c9a48fa3 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -115,6 +115,7 @@ obj-$(CONFIG_GPIO_PXA)                      +=3D gpio=
-pxa.o
>  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)     +=3D gpio-raspberrypi-exp.o
>  obj-$(CONFIG_GPIO_RC5T583)             +=3D gpio-rc5t583.o
>  obj-$(CONFIG_GPIO_RCAR)                        +=3D gpio-rcar.o
> +obj-$(CONFIG_GPIO_RDA)                 +=3D gpio-rda.o
>  obj-$(CONFIG_GPIO_RDC321X)             +=3D gpio-rdc321x.o
>  obj-$(CONFIG_GPIO_REG)                 +=3D gpio-reg.o
>  obj-$(CONFIG_ARCH_SA1100)              +=3D gpio-sa1100.o
> diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
> new file mode 100644
> index 000000000000..28dcbb58b76b
> --- /dev/null
> +++ b/drivers/gpio/gpio-rda.c
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * RDA Micro GPIO driver
> + *
> + * Copyright (C) 2012 RDA Micro Inc.
> + * Copyright (C) 2019 Manivannan Sadhasivam
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#define RDA_GPIO_OEN_VAL               0x00
> +#define RDA_GPIO_OEN_SET_OUT           0x04
> +#define RDA_GPIO_OEN_SET_IN            0x08
> +#define RDA_GPIO_VAL                   0x0c
> +#define RDA_GPIO_SET                   0x10
> +#define RDA_GPIO_CLR                   0x14
> +#define RDA_GPIO_INT_CTRL_SET          0x18
> +#define RDA_GPIO_INT_CTRL_CLR          0x1c
> +#define RDA_GPIO_INT_CLR               0x20
> +#define RDA_GPIO_INT_STATUS            0x24
> +
> +#define RDA_GPIO_IRQ_RISE_SHIFT                0
> +#define RDA_GPIO_IRQ_FALL_SHIFT                8
> +#define RDA_GPIO_DEBOUCE_SHIFT         16
> +#define RDA_GPIO_LEVEL_SHIFT           24
> +
> +#define RDA_GPIO_IRQ_MASK              0xff
> +
> +/* Each bank consists of 32 GPIOs */
> +#define RDA_GPIO_BANK_NR       32
> +
> +struct rda_gpio {
> +       struct gpio_chip chip;
> +       void __iomem *base;
> +       spinlock_t lock;
> +       struct irq_chip irq_chip;
> +       int irq;
> +};
> +
> +static inline void rda_gpio_update(struct gpio_chip *chip, unsigned int =
offset,
> +                                  u16 reg, int val)
> +{
> +       struct rda_gpio *rda_gpio =3D gpiochip_get_data(chip);
> +       void __iomem *base =3D rda_gpio->base;
> +       unsigned long flags;
> +       u32 tmp;
> +
> +       spin_lock_irqsave(&rda_gpio->lock, flags);
> +       tmp =3D readl_relaxed(base + reg);
> +
> +       if (val)
> +               tmp |=3D BIT(offset);
> +       else
> +               tmp &=3D ~BIT(offset);
> +
> +       writel_relaxed(tmp, base + reg);
> +       spin_unlock_irqrestore(&rda_gpio->lock, flags);
> +}
> +
> +static void rda_gpio_irq_mask(struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct rda_gpio *rda_gpio =3D gpiochip_get_data(chip);
> +       void __iomem *base =3D rda_gpio->base;
> +       u32 offset =3D irqd_to_hwirq(data);
> +       u32 value;
> +
> +       value =3D BIT(offset) << RDA_GPIO_IRQ_RISE_SHIFT;
> +       value |=3D BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
> +
> +       writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
> +}
> +
> +static void rda_gpio_irq_ack(struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       u32 offset =3D irqd_to_hwirq(data);
> +
> +       rda_gpio_update(chip, offset, RDA_GPIO_INT_CLR, 1);
> +}
> +
> +static int rda_gpio_set_irq(struct gpio_chip *chip, u32 offset,
> +                           unsigned int flow_type)
> +{
> +       struct rda_gpio *rda_gpio =3D gpiochip_get_data(chip);
> +       void __iomem *base =3D rda_gpio->base;
> +       u32 value;
> +
> +       switch (flow_type) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               /* Set rising edge trigger */
> +               value =3D BIT(offset) << RDA_GPIO_IRQ_RISE_SHIFT;
> +               writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
> +
> +               /* Switch to edge trigger interrupt */
> +               value =3D BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
> +               writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
> +               break;
> +
> +       case IRQ_TYPE_EDGE_FALLING:
> +               /* Set falling edge trigger */
> +               value =3D BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
> +               writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
> +
> +               /* Switch to edge trigger interrupt */
> +               value =3D BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
> +               writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
> +               break;
> +
> +       case IRQ_TYPE_EDGE_BOTH:
> +               /* Set both edge trigger */
> +               value =3D BIT(offset) << RDA_GPIO_IRQ_RISE_SHIFT;
> +               value |=3D BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
> +               writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
> +
> +               /* Switch to edge trigger interrupt */
> +               value =3D BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
> +               writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
> +               break;
> +
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               /* Set high level trigger */
> +               value =3D BIT(offset) << RDA_GPIO_IRQ_RISE_SHIFT;
> +
> +               /* Switch to level trigger interrupt */
> +               value |=3D BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
> +               writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
> +               break;
> +
> +       case IRQ_TYPE_LEVEL_LOW:
> +               /* Set low level trigger */
> +               value =3D BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
> +
> +               /* Switch to level trigger interrupt */
> +               value |=3D BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
> +               writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static void rda_gpio_irq_unmask(struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       u32 offset =3D irqd_to_hwirq(data);
> +       u32 trigger =3D irqd_get_trigger_type(data);
> +
> +       rda_gpio_set_irq(chip, offset, trigger);
> +}
> +
> +static int rda_gpio_irq_set_type(struct irq_data *data, unsigned int flo=
w_type)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       u32 offset =3D irqd_to_hwirq(data);
> +       int ret;
> +
> +       ret =3D rda_gpio_set_irq(chip, offset, flow_type);
> +       if (ret)
> +               return ret;
> +
> +       if (flow_type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
> +               irq_set_handler_locked(data, handle_level_irq);
> +       else if (flow_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISIN=
G))
> +               irq_set_handler_locked(data, handle_edge_irq);
> +
> +       return 0;
> +}
> +
> +static void rda_gpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct gpio_chip *chip =3D irq_desc_get_handler_data(desc);
> +       struct irq_chip *ic =3D irq_desc_get_chip(desc);
> +       struct rda_gpio *rda_gpio =3D gpiochip_get_data(chip);
> +       unsigned long status;
> +       u32 n, girq;
> +
> +       chained_irq_enter(ic, desc);
> +
> +       status =3D readl_relaxed(rda_gpio->base + RDA_GPIO_INT_STATUS);
> +       /* Only lower 8 bits are capable of generating interrupts */
> +       status &=3D RDA_GPIO_IRQ_MASK;
> +
> +       for_each_set_bit(n, &status, RDA_GPIO_BANK_NR) {
> +               girq =3D irq_find_mapping(chip->irq.domain, n);
> +               generic_handle_irq(girq);
> +       }
> +
> +       chained_irq_exit(ic, desc);
> +}
> +
> +static int rda_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +       struct device *dev =3D &pdev->dev;
> +       struct gpio_irq_chip *girq;
> +       struct rda_gpio *rda_gpio;
> +       u32 ngpios;
> +       int ret;
> +
> +       rda_gpio =3D devm_kzalloc(dev, sizeof(*rda_gpio), GFP_KERNEL);
> +       if (!rda_gpio)
> +               return -ENOMEM;
> +
> +       ret =3D device_property_read_u32(dev, "ngpios", &ngpios);
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * Not all ports have interrupt capability. For instance, on
> +        * RDA8810PL, GPIOC doesn't support interrupt. So we must handle
> +        * those also.
> +        */
> +       rda_gpio->irq =3D platform_get_irq(pdev, 0);
> +
> +       rda_gpio->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(rda_gpio->base))
> +               return PTR_ERR(rda_gpio->base);
> +
> +       spin_lock_init(&rda_gpio->lock);
> +
> +       ret =3D bgpio_init(&rda_gpio->chip, dev, 4,
> +                        rda_gpio->base + RDA_GPIO_VAL,
> +                        rda_gpio->base + RDA_GPIO_SET,
> +                        rda_gpio->base + RDA_GPIO_CLR,
> +                        rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
> +                        rda_gpio->base + RDA_GPIO_OEN_SET_IN,
> +                        BGPIOF_READ_OUTPUT_REG_SET);
> +       if (ret) {
> +               dev_err(dev, "bgpio_init failed\n");
> +               return ret;
> +       }
> +
> +       rda_gpio->chip.label =3D dev_name(dev);
> +       rda_gpio->chip.ngpio =3D ngpios;
> +       rda_gpio->chip.base =3D -1;
> +       rda_gpio->chip.parent =3D dev;
> +       rda_gpio->chip.of_node =3D np;
> +
> +       if (rda_gpio->irq >=3D 0) {
> +               rda_gpio->irq_chip.name =3D "rda-gpio",
> +               rda_gpio->irq_chip.irq_ack =3D rda_gpio_irq_ack,
> +               rda_gpio->irq_chip.irq_mask =3D rda_gpio_irq_mask,
> +               rda_gpio->irq_chip.irq_unmask =3D rda_gpio_irq_unmask,
> +               rda_gpio->irq_chip.irq_set_type =3D rda_gpio_irq_set_type=
,
> +               rda_gpio->irq_chip.flags =3D IRQCHIP_SKIP_SET_WAKE,
> +
> +               girq =3D &rda_gpio->chip.irq;
> +               girq->chip =3D &rda_gpio->irq_chip;
> +               girq->handler =3D handle_bad_irq;
> +               girq->default_type =3D IRQ_TYPE_NONE;
> +               girq->parent_handler =3D rda_gpio_irq_handler;
> +               girq->parent_handler_data =3D rda_gpio;
> +               girq->num_parents =3D 1;
> +               girq->parents =3D devm_kcalloc(dev, 1,
> +                                            sizeof(*girq->parents),
> +                                            GFP_KERNEL);
> +               if (!girq->parents)
> +                       return -ENOMEM;
> +               girq->parents[0] =3D rda_gpio->irq;
> +       }
> +
> +       platform_set_drvdata(pdev, rda_gpio);
> +
> +       return devm_gpiochip_add_data(dev, &rda_gpio->chip, rda_gpio);
> +}
> +
> +static const struct of_device_id rda_gpio_of_match[] =3D {
> +       { .compatible =3D "rda,8810pl-gpio", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rda_gpio_of_match);
> +
> +static struct platform_driver rda_gpio_driver =3D {
> +       .probe =3D rda_gpio_probe,
> +       .driver =3D {
> +               .name =3D "rda-gpio",
> +               .of_match_table =3D rda_gpio_of_match,
> +       },
> +};
> +
> +module_platform_driver_probe(rda_gpio_driver, rda_gpio_probe);
> +
> +MODULE_DESCRIPTION("RDA Micro GPIO driver");
> +MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>"=
);
> +MODULE_LICENSE("GPL v2");
> --
> 2.17.1
>

Looks good to me.

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
