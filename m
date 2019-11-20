Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 805C2103727
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 11:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfKTKBX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 05:01:23 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39811 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfKTKBX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 05:01:23 -0500
Received: by mail-oi1-f195.google.com with SMTP id v138so21970359oif.6
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 02:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=owYl7Mqpt03mWUhIgEwwHONpGDjEn3cnP45Q+cviie4=;
        b=c5TtuObauI3ydDduFjioktPnaNdATg7qjaFt25EINLYA9Scx8Fsc6kaiY+3qSLuc7j
         bE7TbVDvlGenHuGRIB183tL1pyG6nwmRTwF+fkYP250ji9zB7mj/gBUW8AWhMjs1s14r
         Fn3fj8M0WKfFmNknh78MlUfwhtNecCFRwyip/GN6cxPFrVDa2QI4kR2yhie/SkRwpgrV
         0WsNBLi9sqX+PVyWldhsOz0Bp56c4YzkhKSsah8L56+cRIgsFXHWYjRbeXsnyTvfVDl5
         8EEA6X8fDl2uHMoQj442yLOBbTCNXKfqgu3q8aRxKPyF9zKkzdz6V1YA7J/k68fNX5Zg
         IrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=owYl7Mqpt03mWUhIgEwwHONpGDjEn3cnP45Q+cviie4=;
        b=Khusfxx40F6c33q4YkhI9JurwzgR14gcWcHHDBPMr9lToN6WS+f1NWoF3gsplaeX40
         +YkMcuEOuyd9UQYAwP0xrvUV77uN9ggpT0JngJf3/f0j616L4E0z4VT04flV/5SzCMqE
         hdMjE9P1oTRjSSuymmo7whapriIe0roTPyRNPLlgrbsTRuPD2Pw3a36vccK2L1Zg5vgJ
         37Ftu3q/3xXLEn86Flwdd42UUHkLOT7ydEvoD6kXr6r5iNBR2Fb8r6CWAV6zJmdWBTk2
         7kqxrIjXh35atLgp9FgOfZR7d0xoZ4ZCxihNw9QztukGguxr+ZjJQqsN1eu9eAFibFdd
         A64A==
X-Gm-Message-State: APjAAAUySWByhHIItXZ2xSCEE2CA2pegxGvLiCGDVl+o1t+0APvhk/1e
        Y+5XcGWwf/rLL4o9hs7aOoOa4uw8jxjFGxL0lsL+Vw==
X-Google-Smtp-Source: APXvYqz3r7gBS8j3jGnUdcRUI8kDQTz1SdtSZLcTAU0UL8P4gRUSN5TF8Bh563HYZEUxxKtLgo0o1lEqenI6PObdQzw=
X-Received: by 2002:a05:6808:9a1:: with SMTP id e1mr2025810oig.175.1574244081870;
 Wed, 20 Nov 2019 02:01:21 -0800 (PST)
MIME-Version: 1.0
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com> <1574233128-28114-5-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574233128-28114-5-git-send-email-yash.shah@sifive.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 20 Nov 2019 11:01:11 +0100
Message-ID: <CAMpxmJX0A+_6LmrWPe=Ne5KGhG9r_HySpstDhV5ZTnpz2QXF7Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: sifive: Add GPIO driver for SiFive SoCs
To:     Yash Shah <yash.shah@sifive.com>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 20 lis 2019 o 07:59 Yash Shah <yash.shah@sifive.com> napisa=C5=82=
(a):
>
> Adds the GPIO driver for SiFive RISC-V SoCs.
>

This looks much better just a couple nits.

> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/gpio/Kconfig       |   9 ++
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpio-sifive.c | 256 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 266 insertions(+)
>  create mode 100644 drivers/gpio/gpio-sifive.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 38e096e..05e8a41 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -453,6 +453,15 @@ config GPIO_SAMA5D2_PIOBU
>           The difference from regular GPIOs is that they
>           maintain their value during backup/self-refresh.
>
> +config GPIO_SIFIVE
> +       bool "SiFive GPIO support"
> +       depends on OF_GPIO
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       select REGMAP_MMIO
> +       help
> +         Say yes here to support the GPIO device on SiFive SoCs.
> +
>  config GPIO_SIOX
>         tristate "SIOX GPIO support"
>         depends on SIOX
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index d2fd19c..bf7984e 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -121,6 +121,7 @@ obj-$(CONFIG_ARCH_SA1100)           +=3D gpio-sa1100.=
o
>  obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)       +=3D gpio-sama5d2-piobu.o
>  obj-$(CONFIG_GPIO_SCH311X)             +=3D gpio-sch311x.o
>  obj-$(CONFIG_GPIO_SCH)                 +=3D gpio-sch.o
> +obj-$(CONFIG_GPIO_SIFIVE)              +=3D gpio-sifive.o
>  obj-$(CONFIG_GPIO_SIOX)                        +=3D gpio-siox.o
>  obj-$(CONFIG_GPIO_SODAVILLE)           +=3D gpio-sodaville.o
>  obj-$(CONFIG_GPIO_SPEAR_SPICS)         +=3D gpio-spear-spics.o
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> new file mode 100644
> index 0000000..02666ae
> --- /dev/null
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 SiFive
> + */

I prefer to have a newline between the copyright notice and the headers.

> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/of_irq.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/of.h>

Is this really needed? I only see functions defined in of_irq.h.

> +#include <linux/platform_device.h>
> +#include <linux/pm.h>

Same here - I don't see any functions from this header being called.

> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/regmap.h>
> +
> +#define GPIO_INPUT_VAL 0x00
> +#define GPIO_INPUT_EN  0x04
> +#define GPIO_OUTPUT_EN 0x08
> +#define GPIO_OUTPUT_VAL        0x0C
> +#define GPIO_RISE_IE   0x18
> +#define GPIO_RISE_IP   0x1C
> +#define GPIO_FALL_IE   0x20
> +#define GPIO_FALL_IP   0x24
> +#define GPIO_HIGH_IE   0x28
> +#define GPIO_HIGH_IP   0x2C
> +#define GPIO_LOW_IE    0x30
> +#define GPIO_LOW_IP    0x34
> +#define GPIO_OUTPUT_XOR        0x40
> +
> +#define MAX_GPIO               32
> +#define SIFIVE_GPIO_IRQ_OFFSET 7

Please use a single prefix for all symbols in this driver. Let's stick
to sifive_gpio and SIFIVE_GPIO for defines.

> +
> +struct sifive_gpio {
> +       void __iomem            *base;
> +       struct gpio_chip        gc;
> +       struct regmap           *regs;
> +       u32                     enabled;

The name of this field is a bit confusing - do you mind renaming it to
something like irq_state? Maybe something else, but simply using
'enabled' makes me think this has more to do with the chip being
enabled.

> +       unsigned int            trigger[MAX_GPIO];
> +       unsigned int            irq_parent[MAX_GPIO];
> +};
> +
> +static void sifive_set_ie(struct sifive_gpio *chip, unsigned int offset)
> +{
> +       unsigned long flags;
> +       unsigned int trigger;
> +
> +       spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
> +       trigger =3D (chip->enabled & BIT(offset)) ? chip->trigger[offset]=
 : 0;
> +       regmap_update_bits(chip->regs, GPIO_RISE_IE, BIT(offset),
> +                          (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset)=
 : 0);
> +       regmap_update_bits(chip->regs, GPIO_FALL_IE, BIT(offset),
> +                          (trigger & IRQ_TYPE_EDGE_FALLING) ? BIT(offset=
) : 0);
> +       regmap_update_bits(chip->regs, GPIO_HIGH_IE, BIT(offset),
> +                          (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) =
: 0);
> +       regmap_update_bits(chip->regs, GPIO_LOW_IE, BIT(offset),
> +                          (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) :=
 0);
> +       spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
> +}
> +
> +static int sifive_irq_set_type(struct irq_data *d, unsigned int trigger)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> +       int offset =3D irqd_to_hwirq(d);
> +
> +       if (offset < 0 || offset >=3D gc->ngpio)
> +               return -EINVAL;
> +
> +       chip->trigger[offset] =3D trigger;
> +       sifive_set_ie(chip, offset);
> +       return 0;
> +}
> +
> +static void sifive_irq_enable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> +       int offset =3D irqd_to_hwirq(d) % MAX_GPIO;
> +       u32 bit =3D BIT(offset);
> +       unsigned long flags;
> +
> +       irq_chip_enable_parent(d);
> +
> +       /* Switch to input */
> +       gc->direction_input(gc, offset);
> +
> +       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       /* Clear any sticky pending interrupts */
> +       regmap_write(chip->regs, GPIO_RISE_IP, bit);
> +       regmap_write(chip->regs, GPIO_FALL_IP, bit);
> +       regmap_write(chip->regs, GPIO_HIGH_IP, bit);
> +       regmap_write(chip->regs, GPIO_LOW_IP, bit);
> +       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +       /* Enable interrupts */
> +       assign_bit(offset, (unsigned long *)&chip->enabled, 1);
> +       sifive_set_ie(chip, offset);
> +}
> +
> +static void sifive_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> +       int offset =3D irqd_to_hwirq(d) % MAX_GPIO;
> +
> +       assign_bit(offset, (unsigned long *)&chip->enabled, 0);
> +       sifive_set_ie(chip, offset);
> +       irq_chip_disable_parent(d);
> +}
> +
> +static void sifive_irq_eoi(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> +       int offset =3D irqd_to_hwirq(d) % MAX_GPIO;
> +       u32 bit =3D BIT(offset);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       /* Clear all pending interrupts */
> +       regmap_write(chip->regs, GPIO_RISE_IP, bit);
> +       regmap_write(chip->regs, GPIO_FALL_IP, bit);
> +       regmap_write(chip->regs, GPIO_HIGH_IP, bit);
> +       regmap_write(chip->regs, GPIO_LOW_IP, bit);
> +       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +       irq_chip_eoi_parent(d);
> +}
> +
> +static struct irq_chip sifive_irqchip =3D {
> +       .name           =3D "sifive-gpio",
> +       .irq_set_type   =3D sifive_irq_set_type,
> +       .irq_mask       =3D irq_chip_mask_parent,
> +       .irq_unmask     =3D irq_chip_unmask_parent,
> +       .irq_enable     =3D sifive_irq_enable,
> +       .irq_disable    =3D sifive_irq_disable,
> +       .irq_eoi        =3D sifive_irq_eoi,
> +};
> +
> +static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> +                                            unsigned int child,
> +                                            unsigned int child_type,
> +                                            unsigned int *parent,
> +                                            unsigned int *parent_type)
> +{
> +       *parent_type =3D IRQ_TYPE_NONE;
> +       *parent =3D child + SIFIVE_GPIO_IRQ_OFFSET;
> +       return 0;
> +}
> +
> +static const struct regmap_config sifive_gpio_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .val_bits =3D 32,
> +       .fast_io =3D true,
> +       .disable_locking =3D true,
> +};
> +
> +static int sifive_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *node =3D pdev->dev.of_node;
> +       struct device_node *irq_parent;
> +       struct irq_domain *parent;
> +       struct gpio_irq_chip *girq;
> +       struct sifive_gpio *chip;
> +       struct resource *res;
> +       unsigned long flags;
> +       int ret, ngpio;
> +
> +       chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +
> +       chip->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(chip->base)) {
> +               dev_err(dev, "failed to allocate device memory\n");
> +               return PTR_ERR(chip->base);
> +       }
> +
> +       chip->regs =3D devm_regmap_init_mmio(dev, chip->base,
> +                                          &sifive_gpio_regmap_config);
> +       if (IS_ERR(chip->regs))
> +               return PTR_ERR(chip->regs);
> +
> +       ngpio =3D of_irq_count(node);
> +       if (ngpio >=3D MAX_GPIO) {
> +               dev_err(dev, "Too many GPIO interrupts (max=3D%d)\n", MAX=
_GPIO);
> +               return -ENXIO;
> +       }
> +
> +       irq_parent =3D of_irq_find_parent(node);
> +       if (!irq_parent) {
> +               dev_err(dev, "no IRQ parent node\n");
> +               return -ENODEV;
> +       }
> +       parent =3D irq_find_host(irq_parent);
> +       if (!parent) {
> +               dev_err(dev, "no IRQ parent domain\n");
> +               return -ENODEV;
> +       }
> +
> +       ret =3D bgpio_init(&chip->gc, dev, 4,
> +                        chip->base + GPIO_INPUT_VAL,
> +                        chip->base + GPIO_OUTPUT_VAL,
> +                        NULL,
> +                        chip->base + GPIO_OUTPUT_EN,
> +                        chip->base + GPIO_INPUT_EN,
> +                        0);
> +       if (ret) {
> +               dev_err(dev, "unable to init generic GPIO\n");
> +               return ret;
> +       }
> +
> +       spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
> +       /* Disable all GPIO interrupts before enabling parent interrupts =
*/
> +       regmap_write(chip->regs, GPIO_RISE_IE, 0);
> +       regmap_write(chip->regs, GPIO_FALL_IE, 0);
> +       regmap_write(chip->regs, GPIO_HIGH_IE, 0);
> +       regmap_write(chip->regs, GPIO_LOW_IE, 0);
> +       spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);

No need for locking in probe().

> +       chip->enabled =3D 0;
> +
> +       chip->gc.base =3D -1;
> +       chip->gc.ngpio =3D ngpio;
> +       chip->gc.label =3D dev_name(dev);
> +       chip->gc.parent =3D dev;
> +       chip->gc.owner =3D THIS_MODULE;
> +       girq =3D &chip->gc.irq;
> +       girq->chip =3D &sifive_irqchip;
> +       girq->fwnode =3D of_node_to_fwnode(node);
> +       girq->parent_domain =3D parent;
> +       girq->child_to_parent_hwirq =3D sifive_gpio_child_to_parent_hwirq=
;
> +       girq->handler =3D handle_bad_irq;
> +       girq->default_type =3D IRQ_TYPE_NONE;
> +
> +       platform_set_drvdata(pdev, chip);
> +       return gpiochip_add_data(&chip->gc, chip);
> +}
> +
> +static const struct of_device_id sifive_gpio_match[] =3D {
> +       { .compatible =3D "sifive,gpio0" },
> +       { .compatible =3D "sifive,fu540-c000-gpio" },
> +       { },
> +};
> +
> +static struct platform_driver sifive_gpio_driver =3D {
> +       .probe          =3D sifive_gpio_probe,
> +       .driver =3D {
> +               .name   =3D "sifive_gpio",
> +               .of_match_table =3D of_match_ptr(sifive_gpio_match),
> +       },
> +};
> +builtin_platform_driver(sifive_gpio_driver)
> --
> 2.7.4
>

Bartosz
