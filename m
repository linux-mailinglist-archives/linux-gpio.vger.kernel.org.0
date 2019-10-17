Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2C2DB0E6
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 17:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405146AbfJQPRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 11:17:15 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37034 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728994AbfJQPRP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 11:17:15 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so2480074oie.4
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uE0tbZ+Lcm8BshiWnWjcma6R9EPVCLjSw6y0KrAiXyk=;
        b=KwKKh5cMb59EU7eUJFf58cY5oY9p3LWzbDpBeHzLE8ze6/c2Qk3CpyZ3wD4Hm31wZN
         URTvEOF2U+5AYs8OrAvEpP0ipbUvaiq9dAEgZyy4wOU2M+9Vy8SxCrsnovus9CtESjM/
         FO/jTs8EQTWCEcF8jzbi/Iq0ji65cB8ycV8s8i01KiCxnT4myfVtac9AfgFYE22yV1T2
         1TRAisE2EKpPCJw+3+Eabl1e9ZofhzAHwvHkd4BvW00XgvntFO8mEbZlqPBaDRNU7ohO
         jeU2WnBfjBjJoRuOnLk1CPeBB1FYU+lNWxUxxHSYKphEmF2n93BEt4o5OZ82yJ717x4S
         v0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uE0tbZ+Lcm8BshiWnWjcma6R9EPVCLjSw6y0KrAiXyk=;
        b=eJqu32NGODg6himlv1xwCbxs29J0U8AEYzuCYZmOjKMbBl687Z5B0zJQ3Y0/z/eNpU
         2XM0DmDMns/RJEv9Xhvb22R72B91HT7bdbcFKOJVV1b2cj5u8F44cRAb4DKRYRI5cfRn
         LITb5TObqBkOsH8pXqkuxJTKH84C2XpR7K2cqQscfQzGV6QG9+mdebKd6aK6HM1tgkty
         1pLP7d5KssgwnTFX0Ga0eT7399pl31YIsf2iNVxIxKo7eMzJ8evtjGuVjxikFhx9nxIe
         DkErfcY1utS1rzCIrSTWut3tv8aFB4pvgcK9RLEnh7A/suSV3Zbh+/q0lHUxL7jg/4E0
         qQCQ==
X-Gm-Message-State: APjAAAVGgYR7/hYjZBUB8J5E9F7qJ1HZgKQ+SZ2rrNNcM4FxE/4sqIyq
        9IY0xl+oyKkvjbAUm4v1ftPsBimR9akxDFRcokhaKw==
X-Google-Smtp-Source: APXvYqxGEqiIaygG14lwEBQu+EoEY83H0D+BZyePsz3QDvozkxsP1t4B0L5N08TY2GzHeYPSDV4vHzS8LI5M88C5cjs=
X-Received: by 2002:a54:4e83:: with SMTP id c3mr3739078oiy.170.1571325433477;
 Thu, 17 Oct 2019 08:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191017031051.20366-1-chris.packham@alliedtelesis.co.nz> <20191017031051.20366-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191017031051.20366-3-chris.packham@alliedtelesis.co.nz>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 17 Oct 2019 17:17:02 +0200
Message-ID: <CAMpxmJXBn99oD7bBg-s-TKE6bpD4NV8J=CgFH+SP5YXqQZ-RmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add xgs-iproc driver
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 17 pa=C5=BA 2019 o 05:11 Chris Packham
<chris.packham@alliedtelesis.co.nz> napisa=C5=82(a):
>
> This driver supports the Chip Common A GPIO controller present on a
> number of Broadcom switch ASICs with integrated SoCs. The controller is
> similar to the pinctrl-nsp-gpio and pinctrl-iproc-gpio blocks but
> different enough that a separate driver is required.
>
> This has been ported from Broadcom's XLDK 5.0.3 retaining only the CCA
> support (pinctrl-iproc-gpio covers CCB).
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>     Changes in v2:
>     - use more of the generic infrastructure for gpio chips
>     - handling the root interrupt is still done manually due to sharing w=
ith uart0.
>
>  drivers/gpio/Kconfig          |   9 +
>  drivers/gpio/Makefile         |   1 +
>  drivers/gpio/gpio-xgs-iproc.c | 301 ++++++++++++++++++++++++++++++++++
>  3 files changed, 311 insertions(+)
>  create mode 100644 drivers/gpio/gpio-xgs-iproc.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 38e096e6925f..4b3c0f8397d7 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -156,6 +156,15 @@ config GPIO_BRCMSTB
>         help
>           Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) =
SoCs.
>
> +config GPIO_XGS_IPROC
> +       tristate "BRCM XGS iProc GPIO support"
> +       depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       default ARCH_BCM_IPROC
> +       help
> +         Say yes here to enable GPIO support for Broadcom XGS iProc SoCs=
.
> +
>  config GPIO_CADENCE
>         tristate "Cadence GPIO support"
>         depends on OF_GPIO
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index d2fd19c15bae..3783c3d43fbe 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_GPIO_BCM_KONA)           +=3D gpio-bcm-kon=
a.o
>  obj-$(CONFIG_GPIO_BD70528)             +=3D gpio-bd70528.o
>  obj-$(CONFIG_GPIO_BD9571MWV)           +=3D gpio-bd9571mwv.o
>  obj-$(CONFIG_GPIO_BRCMSTB)             +=3D gpio-brcmstb.o
> +obj-$(CONFIG_GPIO_XGS_IPROC)           +=3D gpio-xgs-iproc.o
>  obj-$(CONFIG_GPIO_BT8XX)               +=3D gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_CADENCE)             +=3D gpio-cadence.o
>  obj-$(CONFIG_GPIO_CLPS711X)            +=3D gpio-clps711x.o
> diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.=
c
> new file mode 100644
> index 000000000000..a0277acf9369
> --- /dev/null
> +++ b/drivers/gpio/gpio-xgs-iproc.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2017 Broadcom Corporation
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_gpio.h>

None of these of_ headers seem to be needed.

> +
> +#define CCA_INT_F_GPIOINT              BIT(0)
> +#define CCA_INT_STS                    0x20
> +#define CCA_INT_MASK                   0x24
> +
> +#define GPIO_CCA_DIN                   0x0
> +#define GPIO_CCA_DOUT                  0x4
> +#define GPIO_CCA_OUT_EN                        0x8
> +#define GPIO_CCA_INT_LEVEL             0x10
> +#define GPIO_CCA_INT_LEVEL_MASK                0x14
> +#define GPIO_CCA_INT_EVENT             0x18
> +#define GPIO_CCA_INT_EVENT_MASK                0x1C
> +#define GPIO_CCA_INT_EDGE              0x24

Please use a common prefix for all symbols.

> +
> +struct iproc_gpio_chip {
> +       struct irq_chip irqchip;
> +       struct gpio_chip gc;
> +       spinlock_t lock;

You're not using this lock anywhere.

> +       struct device *dev;
> +       void __iomem *base;
> +       void __iomem *intr;
> +};
> +
> +static inline struct iproc_gpio_chip *
> +to_iproc_gpio(struct gpio_chip *gc)
> +{
> +       return container_of(gc, struct iproc_gpio_chip, gc);
> +}
> +
> +static void iproc_gpio_irq_ack(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
> +       int pin =3D d->hwirq;
> +       u32 irq =3D d->irq;
> +       u32 irq_type, event_status =3D 0;
> +
> +       irq_type =3D irq_get_trigger_type(irq);
> +       if (irq_type & IRQ_TYPE_EDGE_BOTH) {
> +               event_status |=3D BIT(pin);
> +               writel(event_status, chip->base + GPIO_CCA_INT_EVENT);
> +       }
> +}
> +
> +static void iproc_gpio_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
> +       int pin =3D d->hwirq;
> +       u32 irq =3D d->irq;
> +       u32 int_mask, irq_type, event_mask;
> +
> +       irq_type =3D irq_get_trigger_type(irq);
> +       event_mask =3D readl(chip->base + GPIO_CCA_INT_EVENT_MASK);

Do you really need to use the non-relaxed versions of readl() and writel()?

> +       int_mask =3D readl(chip->base + GPIO_CCA_INT_LEVEL_MASK);
> +
> +       if (irq_type & IRQ_TYPE_EDGE_BOTH) {
> +               event_mask |=3D 1 << pin;
> +               writel(event_mask, chip->base + GPIO_CCA_INT_EVENT_MASK);
> +       } else {
> +               int_mask |=3D 1 << pin;
> +               writel(int_mask, chip->base + GPIO_CCA_INT_LEVEL_MASK);
> +       }
> +}
> +
> +static void iproc_gpio_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
> +       int pin =3D d->hwirq;
> +       u32 irq =3D d->irq;
> +       u32 irq_type, int_mask, event_mask;
> +
> +       irq_type =3D irq_get_trigger_type(irq);
> +       event_mask =3D readl(chip->base + GPIO_CCA_INT_EVENT_MASK);
> +       int_mask =3D readl(chip->base + GPIO_CCA_INT_LEVEL_MASK);
> +
> +       if (irq_type & IRQ_TYPE_EDGE_BOTH) {
> +               event_mask &=3D ~BIT(pin);
> +               writel(event_mask, chip->base + GPIO_CCA_INT_EVENT_MASK);
> +       } else {
> +               int_mask &=3D ~BIT(pin);
> +               writel(int_mask, chip->base + GPIO_CCA_INT_LEVEL_MASK);
> +       }
> +}
> +
> +
> +static int iproc_gpio_irq_set_type(struct irq_data *d, u32 type)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
> +       int pin =3D d->hwirq;
> +       u32 irq =3D d->irq;
> +       u32 event_pol, int_pol;
> +

Remove the extra newline.

Bart

> +
> +       switch (type & IRQ_TYPE_SENSE_MASK) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               event_pol =3D readl(chip->base + GPIO_CCA_INT_EDGE);
> +               event_pol &=3D ~BIT(pin);
> +               writel(event_pol, chip->base + GPIO_CCA_INT_EDGE);
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               event_pol =3D readl(chip->base + GPIO_CCA_INT_EDGE);
> +               event_pol |=3D BIT(pin);
> +               writel(event_pol, chip->base + GPIO_CCA_INT_EDGE);
> +               break;
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               int_pol =3D readl(chip->base + GPIO_CCA_INT_LEVEL);
> +               int_pol &=3D ~BIT(pin);
> +               writel(int_pol, chip->base + GPIO_CCA_INT_LEVEL);
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               int_pol =3D readl(chip->base + GPIO_CCA_INT_LEVEL);
> +               int_pol |=3D BIT(pin);
> +               writel(int_pol, chip->base + GPIO_CCA_INT_LEVEL);
> +               break;
> +       default:
> +               /* should not come here */
> +               return -EINVAL;
> +       }
> +
> +       if (type & IRQ_TYPE_LEVEL_MASK)
> +               irq_set_handler_locked(irq_get_irq_data(irq), handle_leve=
l_irq);
> +       else if (type & IRQ_TYPE_EDGE_BOTH)
> +               irq_set_handler_locked(irq_get_irq_data(irq), handle_edge=
_irq);
> +
> +       return 0;
> +}
> +
> +static irqreturn_t iproc_gpio_irq_handler(int irq, void *data)
> +{
> +       struct gpio_chip *gc =3D (struct gpio_chip *)data;
> +       struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
> +       int bit;
> +       unsigned long int_bits =3D 0;
> +       u32 int_status;
> +
> +       /* go through the entire GPIOs and handle all interrupts */
> +       int_status =3D readl(chip->intr + CCA_INT_STS);
> +       if (int_status & CCA_INT_F_GPIOINT) {
> +               u32 event, level;
> +
> +               /* Get level and edge interrupts */
> +               event =3D readl(chip->base + GPIO_CCA_INT_EVENT_MASK);
> +               event &=3D readl(chip->base + GPIO_CCA_INT_EVENT);
> +               level =3D readl(chip->base + GPIO_CCA_DIN);
> +               level ^=3D readl(chip->base + GPIO_CCA_INT_LEVEL);
> +               level &=3D readl(chip->base + GPIO_CCA_INT_LEVEL_MASK);
> +               int_bits =3D level | event;
> +
> +               for_each_set_bit(bit, &int_bits, gc->ngpio)
> +                       generic_handle_irq(
> +                               irq_linear_revmap(gc->irq.domain, bit));
> +       }
> +
> +       return  int_bits ? IRQ_HANDLED : IRQ_NONE;
> +}
> +
> +static int iproc_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *dn =3D pdev->dev.of_node;
> +       struct iproc_gpio_chip *chip;
> +       u32 num_gpios;
> +       int irq, ret;
> +
> +       chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +
> +       chip->dev =3D dev;
> +       platform_set_drvdata(pdev, chip);
> +
> +       chip->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(chip->base))
> +               return PTR_ERR(chip->base);
> +
> +       ret =3D bgpio_init(&chip->gc, dev, 4,
> +                        chip->base + GPIO_CCA_DIN,
> +                        chip->base + GPIO_CCA_DOUT,
> +                        NULL,
> +                        chip->base + GPIO_CCA_OUT_EN,
> +                        NULL,
> +                        0);
> +       if (ret) {
> +               dev_err(dev, "unable to init GPIO chip\n");
> +               return ret;
> +       }
> +
> +       chip->gc.label =3D dev_name(dev);
> +       if (of_property_read_u32(dn, "ngpios", &num_gpios))
> +               chip->gc.ngpio =3D num_gpios;
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq > 0) {
> +               struct gpio_irq_chip *girq;
> +               struct irq_chip *irqc;
> +               u32 val;
> +
> +               irqc =3D &chip->irqchip;
> +               irqc->name =3D dev_name(dev);
> +               irqc->irq_ack =3D iproc_gpio_irq_ack;
> +               irqc->irq_mask =3D iproc_gpio_irq_mask;
> +               irqc->irq_unmask =3D iproc_gpio_irq_unmask;
> +               irqc->irq_set_type =3D iproc_gpio_irq_set_type;
> +
> +               chip->intr =3D devm_platform_ioremap_resource(pdev, 1);
> +               if (IS_ERR(chip->intr))
> +                       return PTR_ERR(chip->intr);
> +
> +               /* Enable GPIO interrupts for CCA GPIO */
> +               val =3D readl(chip->intr + CCA_INT_MASK);
> +               val |=3D CCA_INT_F_GPIOINT;
> +               writel(val, chip->intr + CCA_INT_MASK);
> +
> +               /*
> +                * Directly request the irq here instead of passing
> +                * a flow-handler to gpiochip_set_chained_irqchip,
> +                * because the irq is shared.
> +                */
> +               ret =3D devm_request_irq(dev, irq, iproc_gpio_irq_handler=
,
> +                                      IRQF_SHARED, chip->gc.label, &chip=
->gc);
> +               if (ret) {
> +                       dev_err(dev, "Fail to request IRQ%d: %d\n", irq, =
ret);
> +                       return ret;
> +               }
> +
> +               girq =3D &chip->gc.irq;
> +               girq->chip =3D  irqc;
> +               /* This will let us handle the parent IRQ in the driver *=
/
> +               girq->parent_handler =3D NULL;
> +               girq->num_parents =3D 0;
> +               girq->parents =3D NULL;
> +               girq->default_type =3D IRQ_TYPE_NONE;
> +               girq->handler =3D handle_simple_irq;
> +       }
> +
> +       ret =3D devm_gpiochip_add_data(dev, &chip->gc, chip);
> +       if (ret) {
> +               dev_err(dev, "unable to add GPIO chip\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int __exit iproc_gpio_remove(struct platform_device *pdev)
> +{
> +       struct iproc_gpio_chip *chip;
> +
> +       chip =3D platform_get_drvdata(pdev);
> +       if (!chip)
> +               return -ENODEV;
> +
> +       if (chip->intr) {
> +               u32 val;
> +
> +               val =3D readl(chip->intr + CCA_INT_MASK);
> +               val &=3D ~CCA_INT_F_GPIOINT;
> +               writel(val, chip->intr + CCA_INT_MASK);
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst =
=3D {
> +       { .compatible =3D "brcm,iproc-gpio-cca" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, bcm_iproc_gpio_of_match);
> +
> +static struct platform_driver bcm_iproc_gpio_driver =3D {
> +       .driver =3D {
> +               .name =3D "iproc-xgs-gpio",
> +               .owner =3D THIS_MODULE,
> +               .of_match_table =3D bcm_iproc_gpio_of_match,
> +       },
> +       .probe =3D iproc_gpio_probe,
> +       .remove =3D iproc_gpio_remove,
> +};
> +
> +module_platform_driver(bcm_iproc_gpio_driver);
> +
> +MODULE_DESCRIPTION("XGS IPROC GPIO driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.23.0
>
