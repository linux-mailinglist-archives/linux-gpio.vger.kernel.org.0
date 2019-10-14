Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79E8BD6510
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 16:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732707AbfJNOZm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 10:25:42 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40399 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731121AbfJNOZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 10:25:42 -0400
Received: by mail-oi1-f193.google.com with SMTP id k9so13896223oib.7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IGi1R4moYNLLf/c9IrQAJUNJOBPDadHm6kdzqPuUdCQ=;
        b=nvkV88TEq9HiyttxgpqGZCEJNG7SqSm5D2f9HWi8Y2TJDOLR0R7smW6WcnJenFvlHu
         49rQoegBQp5Vk93pOOpl2L44M/XqeOHulEvrvBjxjBSlDVmn+3TTZg04WPsA6W08/PcG
         y0lMU0Sl+EjtcWZU0XxP0mFMqJMoGaQYpIY8lCnT10qhFoMyRBH9T1hbCm8rpF/rqjKO
         MbQOowmveEQVwDXDOItyiI7XygoVEwdp4U4uqg8TTzZTUIzUsAPA1EtjWexUFmkopz6i
         oKuPDoiWGHqAtPjhdcYjjo/USobrHg/pcRh3Xf5tmTID/beJYhdpraosDSzMcvvhpqlc
         3FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IGi1R4moYNLLf/c9IrQAJUNJOBPDadHm6kdzqPuUdCQ=;
        b=d9eeva1LjchEXDK53VfYoEkGsYEO1zWbicr0hwGu+Srlfmh83iW69V529hqd3gNNUV
         YEJfpihGGZwzvpIH+o65j14yDQn9k7Bj2xkJ1WHAc8Ji0L3EpIHs2QRVmNNp4hUbzBRm
         mtr1mt7mFFKBKKRB2rwTfvB/b9sDlThFPudfSeE65nGj7pFV1c4Ps7xELFPQrmjwXE1f
         Eap16GDt1B4CXAovrnm1vG5dTsTTUneNkLJ1ERIAd8P74LnSXqQ/GKMKL1gUH+SZ4okR
         bd817hX+0lHqcz3bnqLrUfVnNBx/cs6H5mmAUwG642ESuNpqKP7yQkYg8HudViIGqcKY
         75xg==
X-Gm-Message-State: APjAAAWMW2prlXohA6iKzg8DLQ4LN67+UnPIx2wvZj1Cl59pfa9/CSvy
        32+1wbZFS9H/l2lUJryBYzTakwCz53ypXoCUq+QfZg==
X-Google-Smtp-Source: APXvYqzG1sZOLuXDxDvhU2hXmcLbwL+mmjNQcB3o4zhXoQXBmxjhbZmXpgvrMDc9NeZlwrHi74xFk4YpsVqoEwcGXHI=
X-Received: by 2002:a05:6808:114:: with SMTP id b20mr25162674oie.114.1571063140566;
 Mon, 14 Oct 2019 07:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191013114037.9845-1-manivannan.sadhasivam@linaro.org> <20191013114037.9845-3-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20191013114037.9845-3-manivannan.sadhasivam@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Oct 2019 16:25:29 +0200
Message-ID: <CAMpxmJU6odqXcsAbZiYoh94Ett44z+R05WMygB66jCg8xd0UZw@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: Add RDA Micro GPIO controller support
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

niedz., 13 pa=C5=BA 2019 o 13:40 Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> napisa=C5=82(a):
>
> Add support for GPIO controller from RDA Micro.

Looks nice and clean, just a couple nits.

>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/gpio/Kconfig    |   8 +
>  drivers/gpio/Makefile   |   1 +
>  drivers/gpio/gpio-rda.c | 334 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 343 insertions(+)
>  create mode 100644 drivers/gpio/gpio-rda.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 38e096e6925f..71826e61fdb3 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -435,6 +435,14 @@ config GPIO_RCAR
>         help
>           Say yes here to support GPIO on Renesas R-Car SoCs.
>
> +config GPIO_RDA
> +       bool "RDA Micro GPIO controller support"
> +       depends on ARCH_RDA || COMPILE_TEST
> +       depends on OF_GPIO
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
> index 000000000000..5a4adeb25f72
> --- /dev/null
> +++ b/drivers/gpio/gpio-rda.c
> @@ -0,0 +1,334 @@
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
> +#include <linux/of_device.h>
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
> +static void rda_gpio_update(struct gpio_chip *chip, unsigned int offset,
> +                           u16 reg, int val)
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

If you used the mmio regmap, you could save all this code and reuse
regmap's update helpers. This is just a suggestion, not a requirement
though.

> +
> +static int rda_gpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +       /* Not supported currently */
> +       return 0;
> +}
> +
> +static void rda_gpio_free(struct gpio_chip *chip, unsigned int offset)
> +{
> +       /* Not supported currently */
> +}

Just don't implement these callbacks if they're doing nothing.

> +
> +static int rda_gpio_direction_input(struct gpio_chip *chip, unsigned int=
 offset)
> +{
> +       rda_gpio_update(chip, offset, RDA_GPIO_OEN_SET_IN, 1);
> +
> +       return 0;
> +}
> +
> +static int rda_gpio_direction_output(struct gpio_chip *chip,
> +                                    unsigned int offset, int value)
> +{
> +       rda_gpio_update(chip, offset, RDA_GPIO_OEN_SET_OUT, 1);
> +
> +       return 0;
> +}
> +
> +static int rda_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rda_gpio *rda_gpio =3D gpiochip_get_data(chip);
> +       void __iomem *base =3D rda_gpio->base;
> +
> +       if (readl_relaxed(base + RDA_GPIO_OEN_VAL) & BIT(offset))
> +               return !!(readl_relaxed(base + RDA_GPIO_VAL) & BIT(offset=
));
> +       else
> +               return !!(readl_relaxed(base + RDA_GPIO_SET) & BIT(offset=
));
> +}
> +
> +static void rda_gpio_set(struct gpio_chip *chip, unsigned int offset, in=
t value)
> +{
> +       if (value)
> +               rda_gpio_update(chip, offset, RDA_GPIO_SET, 1);
> +       else
> +               rda_gpio_update(chip, offset, RDA_GPIO_CLR, 1);
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
> +       struct gpio_irq_chip *irq;

Can you call this variable irq_chip? Visually it interferes with
rda_gpio->irq too much.

> +       struct rda_gpio *rda_gpio;
> +       u32 ngpios;
> +       int ret;
> +
> +       rda_gpio =3D devm_kzalloc(&pdev->dev, sizeof(*rda_gpio), GFP_KERN=
EL);
> +       if (!rda_gpio)
> +               return -ENOMEM;
> +
> +       ret =3D of_property_read_u32(np, "ngpios", &ngpios);
> +       if (ret < 0)
> +               return ret;
> +

Please use the generic device property helpers unless it's really
necessary to use of_ variants. Also: remove the of_device.h include.

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
> +       rda_gpio->chip.label =3D dev_name(&pdev->dev);
> +       rda_gpio->chip.ngpio =3D ngpios;
> +       rda_gpio->chip.base =3D -1;
> +       rda_gpio->chip.parent =3D &pdev->dev;
> +       rda_gpio->chip.of_node =3D np;
> +       rda_gpio->chip.request =3D rda_gpio_request;
> +       rda_gpio->chip.free =3D rda_gpio_free;
> +       rda_gpio->chip.get =3D rda_gpio_get;
> +       rda_gpio->chip.set =3D rda_gpio_set;
> +       rda_gpio->chip.direction_input =3D rda_gpio_direction_input;
> +       rda_gpio->chip.direction_output =3D rda_gpio_direction_output;
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
> +               irq =3D &rda_gpio->chip.irq;
> +               irq->chip =3D &rda_gpio->irq_chip;
> +               irq->handler =3D handle_bad_irq;
> +               irq->default_type =3D IRQ_TYPE_NONE;
> +               irq->parent_handler =3D rda_gpio_irq_handler;
> +               irq->parent_handler_data =3D rda_gpio;
> +               irq->num_parents =3D 1;
> +               irq->parents =3D &rda_gpio->irq;
> +       }
> +
> +       ret =3D devm_gpiochip_add_data(&pdev->dev, &rda_gpio->chip, rda_g=
pio);

I'd simply do 'return devm_gpiochip_add_data()' here, not much else
can fail in this driver's probe.

Bart

> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "Could not register gpiochip %d\n", r=
et);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, rda_gpio);
> +
> +       return 0;
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
