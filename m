Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A90108F7F
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfKYOCi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:02:38 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44479 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727655AbfKYOCg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:02:36 -0500
Received: by mail-oi1-f196.google.com with SMTP id s71so13112200oih.11
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OIzYNbEyJDGiIkXjx+HLN4plNiwzomnRBU1bUeT6+Ec=;
        b=t+fC1RKeE5kqSHwGtdaKSVe9GcKfdtHTq402mARpcl/GnEKfJweMr0NmhSx72PRC7R
         kgZ4x25p1wmn6VX9u47zk54kZoSQLVr3sANmCVcJoxDq1V373HcvqZVzb6B73nwZHs5J
         kywZPIg9Xn73y8nZE969cRKzHLxadoGdtzS1dFysOz3Aika/S381KGjbDWvd/mmtyO0y
         ltlAevrpow4GsYNcY6QNfPrSiiJkbLjm9Cdn4Go/Aqhpb8obmbnc9TC/C+T4rg7EnoZd
         QYNdwXsPQJaOk8iHO68GhqfOEHzg9MC+YRu5XLGftZegINqcO/FUOlMH/TPEhWrYc9au
         LsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OIzYNbEyJDGiIkXjx+HLN4plNiwzomnRBU1bUeT6+Ec=;
        b=AvWzpveZUoHoiZH/1/MQ0bc+fMRN9Nw17YPWduqcw7oIypwRHOfaMzUnCc8M0z9U3e
         if1fwh98XT1YqxI+7EdKNqFvjZ0NczQS3Ip1uA1WijQa2UPXftv8PDexyIdap3ifzShQ
         LnhGgGf3DoK4gK4MW7Dh/nP2LmZxcLnbwNERBIWxtsZByDyHir1PwkyKVtcmjMYdW3N7
         TdZgjuFBqpmLwfSK9Kkc4KA9u5uBMarJ3sIUlwWOCbcR+f+Wk5Dlod7Q+NtfnN6AinC4
         k1wmro1wNbz3x1GPmj9S+TzbsMT9Tp9IyDJT9Ho8wxUMrUHsHL28ckoDGM1F1BC3Jflg
         OWJQ==
X-Gm-Message-State: APjAAAXpzPAW9CuneodScKnkGfzeht8N79msqZHE1/BMv0JN7CaGL8A2
        1q0tZyUyFw/2ugo6bExM4XUlZwlzuwMAkXPw6ehxoQ==
X-Google-Smtp-Source: APXvYqxj0NScs2QVGdUnZMJyoGoiJMJMyHZKA/DL8VJT9xKrxwelTdu/MAxbKCNy9QFeod8lgcDcrILNQ6+EdJmNPs0=
X-Received: by 2002:aca:d6d7:: with SMTP id n206mr23323089oig.147.1574690553427;
 Mon, 25 Nov 2019 06:02:33 -0800 (PST)
MIME-Version: 1.0
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com> <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 Nov 2019 15:02:22 +0100
Message-ID: <CAMpxmJUq_K00iJEPG-oXApasD7AD1THMhqXcjJ17dGvw1DSggw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
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

pon., 25 lis 2019 o 06:58 Yash Shah <yash.shah@sifive.com> napisa=C5=82(a):
>
> Adds the GPIO driver for SiFive RISC-V SoCs.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/gpio/Kconfig       |   9 ++
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpio-sifive.c | 252 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 262 insertions(+)
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
> index 0000000..147a1bd
> --- /dev/null
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 SiFive
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/of_irq.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/regmap.h>
> +
> +#define SIFIVE_GPIO_INPUT_VAL  0x00
> +#define SIFIVE_GPIO_INPUT_EN   0x04
> +#define SIFIVE_GPIO_OUTPUT_EN  0x08
> +#define SIFIVE_GPIO_OUTPUT_VAL 0x0C
> +#define SIFIVE_GPIO_RISE_IE    0x18
> +#define SIFIVE_GPIO_RISE_IP    0x1C
> +#define SIFIVE_GPIO_FALL_IE    0x20
> +#define SIFIVE_GPIO_FALL_IP    0x24
> +#define SIFIVE_GPIO_HIGH_IE    0x28
> +#define SIFIVE_GPIO_HIGH_IP    0x2C
> +#define SIFIVE_GPIO_LOW_IE     0x30
> +#define SIFIVE_GPIO_LOW_IP     0x34
> +#define SIFIVE_GPIO_OUTPUT_XOR 0x40
> +
> +#define SIFIVE_GPIO_MAX                32
> +#define SIFIVE_GPIO_IRQ_OFFSET 7
> +
> +struct sifive_gpio {
> +       void __iomem            *base;
> +       struct gpio_chip        gc;
> +       struct regmap           *regs;
> +       u32                     irq_state;
> +       unsigned int            trigger[SIFIVE_GPIO_MAX];
> +       unsigned int            irq_parent[SIFIVE_GPIO_MAX];
> +};
> +
> +static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int of=
fset)
> +{
> +       unsigned long flags;
> +       unsigned int trigger;
> +
> +       spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
> +       trigger =3D (chip->irq_state & BIT(offset)) ? chip->trigger[offse=
t] : 0;
> +       regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
> +                          (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset)=
 : 0);
> +       regmap_update_bits(chip->regs, SIFIVE_GPIO_FALL_IE, BIT(offset),
> +                          (trigger & IRQ_TYPE_EDGE_FALLING) ? BIT(offset=
) : 0);
> +       regmap_update_bits(chip->regs, SIFIVE_GPIO_HIGH_IE, BIT(offset),
> +                          (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) =
: 0);
> +       regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
> +                          (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) :=
 0);
> +       spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
> +}
> +
> +static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int tri=
gger)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> +       int offset =3D irqd_to_hwirq(d);
> +
> +       if (offset < 0 || offset >=3D gc->ngpio)
> +               return -EINVAL;
> +
> +       chip->trigger[offset] =3D trigger;
> +       sifive_gpio_set_ie(chip, offset);
> +       return 0;
> +}
> +
> +static void sifive_gpio_irq_enable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> +       int offset =3D irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
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
> +       regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> +       regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> +       regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> +       regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> +       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +       /* Enable interrupts */
> +       assign_bit(offset, (unsigned long *)&chip->irq_state, 1);
> +       sifive_gpio_set_ie(chip, offset);
> +}
> +
> +static void sifive_gpio_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> +       int offset =3D irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +
> +       assign_bit(offset, (unsigned long *)&chip->irq_state, 0);
> +       sifive_gpio_set_ie(chip, offset);
> +       irq_chip_disable_parent(d);
> +}
> +
> +static void sifive_gpio_irq_eoi(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> +       int offset =3D irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +       u32 bit =3D BIT(offset);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       /* Clear all pending interrupts */
> +       regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> +       regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> +       regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> +       regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> +       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +       irq_chip_eoi_parent(d);
> +}
> +
> +static struct irq_chip sifive_gpio_irqchip =3D {
> +       .name           =3D "sifive-gpio",
> +       .irq_set_type   =3D sifive_gpio_irq_set_type,
> +       .irq_mask       =3D irq_chip_mask_parent,
> +       .irq_unmask     =3D irq_chip_unmask_parent,
> +       .irq_enable     =3D sifive_gpio_irq_enable,
> +       .irq_disable    =3D sifive_gpio_irq_disable,
> +       .irq_eoi        =3D sifive_gpio_irq_eoi,
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
> +       if (ngpio >=3D SIFIVE_GPIO_MAX) {
> +               dev_err(dev, "Too many GPIO interrupts (max=3D%d)\n",
> +                       SIFIVE_GPIO_MAX);
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
> +                        chip->base + SIFIVE_GPIO_INPUT_VAL,
> +                        chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> +                        NULL,
> +                        chip->base + SIFIVE_GPIO_OUTPUT_EN,
> +                        chip->base + SIFIVE_GPIO_INPUT_EN,
> +                        0);
> +       if (ret) {
> +               dev_err(dev, "unable to init generic GPIO\n");
> +               return ret;
> +       }
> +
> +       /* Disable all GPIO interrupts before enabling parent interrupts =
*/
> +       regmap_write(chip->regs, SIFIVE_GPIO_RISE_IE, 0);
> +       regmap_write(chip->regs, SIFIVE_GPIO_FALL_IE, 0);
> +       regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IE, 0);
> +       regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
> +       chip->irq_state =3D 0;
> +
> +       chip->gc.base =3D -1;
> +       chip->gc.ngpio =3D ngpio;
> +       chip->gc.label =3D dev_name(dev);
> +       chip->gc.parent =3D dev;
> +       chip->gc.owner =3D THIS_MODULE;
> +       girq =3D &chip->gc.irq;
> +       girq->chip =3D &sifive_gpio_irqchip;
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

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
