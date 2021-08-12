Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D693EA132
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 10:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235575AbhHLJAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 05:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235554AbhHLJAM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 05:00:12 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A9CC0613D3;
        Thu, 12 Aug 2021 01:59:46 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id y16so10385983yby.0;
        Thu, 12 Aug 2021 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vKRBROq8Wq0IP86b/kaf6Lf4jtgBmO6sCqMy522kDvk=;
        b=UcnCRmmzL60OTAnAPA5xdpu6JodiaRxNLiLRaz4M/NOcGf4OYiA2yf6YPSthJhOEok
         2sQGlMMirT2JB/hFizwoCww8ZQ/s7eS/ij+sgrG8O+9IMbcDZMmM3ZzPlJtOQQHGrt7j
         Vpo8tsggwq5WcNkzhkyC8C2zfLAEsio5FROhwKjgOqJRUkuRClD/d0HJ7kods8dYJvoe
         cXlQsZMnJC8Kcq4VrXn7FcRoSSZAF9C+XP9pia+43RtqoswTWwvdOEPia2fDzzm1XSTU
         Hzp1CgHzck7z/z8RfWI1I9/sC2qxM0e9Zh0CN7hNqfTi5Z7EDyP3RDok7rBD9rlTrYAY
         a7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vKRBROq8Wq0IP86b/kaf6Lf4jtgBmO6sCqMy522kDvk=;
        b=HDhcPN7A67jqhd/pM+//mdmJa7H2u6SXHgm7gwYaQSDFnF8pDYqJ9SgaUCJaEl9/Yr
         TzdETyZ90h1sO3Uwant+s79hHBJXLtxOtcLOQmvnyj5NLB5Hy9YjIQTTooFhFwnrkY//
         1+JeTHrHvKCva747YvRoOsXmmWod/yaMlpzKAecQu5P6N6hSt+Bx3zkJCnB8Cmxq1J8R
         AXbto9FN1a0WQYXxmEfIWavP5hw/TrJTAPtWj8bnmKflYQKG+gnMDJDQ7dKw65vT+lgp
         9VeQKfzfHXgtkWl6Y/sLaDIGdoFgIrb12YzUjqthOpiK+zPVJ6JAuYBymxbUa+NW8Egv
         aoSQ==
X-Gm-Message-State: AOAM531gPn8C9znXt9TRO0O+Ey6Hn1IrZE389CT39qc2Wo4ptXASk+7Q
        m29UoouWsqd8JGY9PWiOE6YLHNzeY92UzFdS2t0=
X-Google-Smtp-Source: ABdhPJxX9n93Ox2ulou4n68MHVIjrH53VZ1qdZOVULskctIT4t9MRrPuXTK/j+zUQUKCHV0444xYghol19Ax8Q3Iqt0=
X-Received: by 2002:a5b:98c:: with SMTP id c12mr3139027ybq.156.1628758786136;
 Thu, 12 Aug 2021 01:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210803175109.1729-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <87pmutwhfx.wl-maz@kernel.org>
In-Reply-To: <87pmutwhfx.wl-maz@kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 12 Aug 2021 09:59:20 +0100
Message-ID: <CA+V-a8uaUi3qcM8e3OuNyiyB=zoxZSRBQNq8e4r38xigO4f53Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
To:     Marc Zyngier <maz@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc,

Thank you for the review.

On Wed, Aug 4, 2021 at 12:57 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 03 Aug 2021 18:51:07 +0100,
> Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Add a driver for the Renesas RZ/G2L Interrupt Controller.
> >
> > This supports external pins being used as interrupts. It supports
> > one line for NMI, 8 external pins and 32 GPIO pins (GPIOINT0-122)
> > to be used as IRQ lines.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/irqchip/Kconfig             |   8 +
> >  drivers/irqchip/Makefile            |   1 +
> >  drivers/irqchip/irq-renesas-rzg2l.c | 557 ++++++++++++++++++++++++++++
> >  drivers/soc/renesas/Kconfig         |   1 +
> >  4 files changed, 567 insertions(+)
> >  create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c
> >
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index 62543a4eccc0..790c19ad6e39 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -236,6 +236,14 @@ config RENESAS_RZA1_IRQC
> >         Enable support for the Renesas RZ/A1 Interrupt Controller, to use up
> >         to 8 external interrupts with configurable sense select.
> >
> > +config RENESAS_RZG2L_IRQC
> > +     bool "Renesas RZ/G2L IRQC support" if COMPILE_TEST
> > +     select GENERIC_IRQ_CHIP
> > +     select IRQ_DOMAIN_HIERARCHY
> > +     help
> > +       Enable support for the Renesas RZ/G2L Interrupt Controller for external
> > +       devices.
> > +
> >  config SL28CPLD_INTC
> >       bool "Kontron sl28cpld IRQ controller"
> >       depends on MFD_SL28CPLD=y || COMPILE_TEST
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index f88cbf36a9d2..8017786fbdac 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -51,6 +51,7 @@ obj-$(CONFIG_RDA_INTC)                      += irq-rda-intc.o
> >  obj-$(CONFIG_RENESAS_INTC_IRQPIN)    += irq-renesas-intc-irqpin.o
> >  obj-$(CONFIG_RENESAS_IRQC)           += irq-renesas-irqc.o
> >  obj-$(CONFIG_RENESAS_RZA1_IRQC)              += irq-renesas-rza1.o
> > +obj-$(CONFIG_RENESAS_RZG2L_IRQC)     += irq-renesas-rzg2l.o
> >  obj-$(CONFIG_VERSATILE_FPGA_IRQ)     += irq-versatile-fpga.o
> >  obj-$(CONFIG_ARCH_NSPIRE)            += irq-zevio.o
> >  obj-$(CONFIG_ARCH_VT8500)            += irq-vt8500.o
> > diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
> > new file mode 100644
> > index 000000000000..abfaaa8a09af
> > --- /dev/null
> > +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> > @@ -0,0 +1,557 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/G2L IRQC Driver
> > + *
> > + * Copyright (C) 2020 Renesas Electronics Corporation.
> > + */
> > +
> > +#include <linux/init.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/ioport.h>
> > +#include <linux/io.h>
> > +#include <linux/irq.h>
> > +#include <linux/clk.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/err.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/slab.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#define RZG2L_IRQC_IRQ_MAX           41
> > +#define RZG2L_TINT_MAX_INTERRUPTS    32
> > +#define RZG2L_TINT_IRQ_START_INDEX   9
> > +
> > +#define TSCR         0x20
> > +#define TITSR0               0x24
> > +#define TITSR1               0x28
> > +#define TSSR(n)              (0x30 + ((n) * 4))
> > +#define IRQ_MASK     0x3
> > +
> > +#define RISING_EDGE  0
> > +#define FALLING_EDGE 1
> > +#define HIGH_LEVEL   2
> > +#define LOW_LEVEL    3
> > +
> > +#define RZG2L_TINT_EDGE_BOTH BIT(4)
> > +
> > +#define RZG2L_MAX_PINS_PER_PORT              8
> > +#define RZG2L_PIN_ID_TO_PORT(id)     ((id) / RZG2L_MAX_PINS_PER_PORT)
> > +#define RZG2L_PIN_ID_TO_PIN(id)              ((id) % RZG2L_MAX_PINS_PER_PORT)
> > +
> > +struct irqc_irq {
> > +     int hw_irq;
> > +     int requested_irq;
> > +     struct irqc_priv *p;
> > +     struct rzg2l_pin_info *pin;
> > +};
> > +
> > +struct rzg2l_pin_info {
> > +     u32 port;
> > +     u8 bit;
> > +     u32 id;
>
> Given the way you initialise things below, are these types the right
> ones?
>
Yes they are correct, port ranges from 0-48, bit ranges from 0-7 and
id ranges from 0-122

> > +     u32 trigger_type;
> > +     unsigned int type;
> > +     u8 pin_state;
> > +};
> > +
> > +struct irqc_priv {
> > +     void __iomem *iomem;
> > +     struct irqc_irq irq[RZG2L_IRQC_IRQ_MAX];
> > +     DECLARE_BITMAP(tint_slot, RZG2L_TINT_MAX_INTERRUPTS);
> > +     unsigned int number_of_irqs;
> > +     struct device *dev;
> > +     struct irq_chip_generic *gc;
> > +     struct irq_chip chip;
> > +     struct irq_domain *irq_domain;
> > +     struct irq_domain *parent_domain;
> > +     unsigned int tint_irq_start;
> > +     atomic_t wakeup_path;
> > +     struct clk *clk;
> > +     struct clk *pclk;
> > +};
> > +
> > +static const struct rzg2l_pin_info gpio_pin_info[] = {
> > +     { 0, 0, 0 }, { 0, 1, 1 },
> > +     { 1, 0, 2 }, { 1, 1, 3 },
> > +     { 2, 0, 4 }, { 2, 1, 5 },
> > +     { 3, 0, 6 }, { 3, 1, 7 },
> > +     { 4, 0, 8 }, { 4, 1, 9 },
> > +     { 5, 0, 10 }, { 5, 1, 11 }, { 5, 2, 12 },
> > +     { 6, 0, 13 }, { 6, 1, 14 },
> > +     { 7, 0, 15 }, { 7, 1, 16 }, { 7, 2, 17 },
> > +     { 8, 0, 18 }, { 8, 1, 19 }, { 8, 2, 20 },
> > +     { 9, 0, 21 }, { 9, 1, 22 },
> > +     { 10, 0, 23 }, { 10, 1, 24 },
> > +     { 11, 0, 25 }, { 11, 1, 26 },
> > +     { 12, 0, 27 }, { 12, 1, 28 },
> > +     { 13, 0, 29 }, { 13, 1, 30 }, { 13, 2, 31 },
> > +     { 14, 0, 32 }, { 14, 1, 33 },
> > +     { 15, 0, 34 }, { 15, 1, 35 },
> > +     { 16, 0, 36 }, { 16, 1, 37 },
> > +     { 17, 0, 38 }, { 17, 1, 39 }, { 17, 2, 40 },
> > +     { 18, 0, 41 }, { 18, 1, 42 },
> > +     { 19, 0, 43 }, { 19, 1, 44 },
> > +     { 20, 0, 45 }, { 20, 1, 46 }, { 20, 2, 47 },
> > +     { 21, 0, 48 }, { 21, 1, 49 },
> > +     { 22, 0, 50 }, { 22, 1, 51 },
> > +     { 23, 0, 52 }, { 23, 1, 53 },
> > +     { 24, 0, 54 }, { 24, 1, 55 },
> > +     { 25, 0, 56 }, { 25, 1, 57 },
> > +     { 26, 0, 58 }, { 26, 1, 59 },
> > +     { 27, 0, 60 }, { 27, 1, 61 },
> > +     { 28, 0, 62 }, { 28, 1, 63 },
> > +     { 29, 0, 64 }, { 29, 1, 65 },
> > +     { 30, 0, 66 }, { 30, 1, 67 },
> > +     { 31, 0, 68 }, { 31, 1, 69 },
> > +     { 32, 0, 70 }, { 32, 1, 71 },
> > +     { 33, 0, 72 }, { 33, 1, 73 },
> > +     { 34, 0, 74 }, { 34, 1, 75 },
> > +     { 35, 0, 76 }, { 35, 1, 77 },
> > +     { 36, 0, 78 }, { 36, 1, 79 },
> > +     { 37, 0, 80 }, { 37, 1, 81 }, { 37, 2, 82 },
> > +     { 38, 0, 83 }, { 38, 1, 84 },
> > +     { 39, 0, 85 }, { 39, 1, 86 }, { 39, 2, 87 },
> > +     { 40, 0, 88 }, { 40, 1, 89 }, { 40, 2, 90 },
> > +     { 41, 0, 91 }, { 41, 1, 92 },
> > +     { 42, 0, 93 }, { 42, 1, 94 }, { 42, 2, 95 }, { 42, 3, 96 }, { 42, 4, 97 },
> > +     { 43, 0, 98 }, { 43, 1, 99 }, { 43, 2, 100 }, { 43, 3, 101 },
> > +     { 44, 0, 102 }, { 44, 1, 103 }, { 44, 2, 104 }, { 44, 3, 105 },
> > +     { 45, 0, 106 }, { 45, 1, 107 }, { 45, 2, 108 }, { 45, 3, 109 },
> > +     { 46, 0, 110 }, { 46, 1, 111 }, { 46, 2, 112 }, { 46, 3, 113 },
> > +     { 47, 0, 114 }, { 47, 1, 115 }, { 47, 2, 116 }, { 47, 3, 117 },
> > +     { 48, 0, 118 }, { 48, 1, 119 }, { 48, 2, 120 }, { 48, 3, 121 }, { 48, 3, 122 },
> > +};
>
> Is there any reason why this information is not kept in DT instead?
> What does it describe exactly?
>
I will check if this can be moved to DT or handled in pinctrl driver.
This describes the GPIO pins which can be used as an interrupt.

> > +
> > +static int rzg2l_gpio_irq_validate_id(u32 port, u32 bit)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(gpio_pin_info); i++) {
> > +             if (gpio_pin_info[i].port == port && gpio_pin_info[i].bit == bit)
> > +                     return gpio_pin_info[i].id;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static struct irq_domain *rzg2l_get_pinctrl_domain(struct device *dev)
> > +{
> > +     struct device_node *pinctrl_np;
> > +     struct irq_domain *pinctrl_domain;
> > +
> > +     pinctrl_np = of_find_compatible_node(NULL, NULL, "renesas,r9a07g044-pinctrl");
> > +     if (!pinctrl_np)
> > +             return NULL;
> > +
> > +     pinctrl_domain = irq_find_host(pinctrl_np);
> > +     of_node_put(pinctrl_np);
> > +
> > +     return pinctrl_domain;
>
> What if you have multiple instances of this pinctrl? The information
> should directly come from DT in the form of a phandle.
>
agreed, said that this will go away when implemented as an interrupt controller.

> > +}
> > +
> > +static struct irqc_priv *irq_data_to_priv(struct irq_data *data)
> > +{
> > +     return data->domain->host_data;
> > +}
> > +
> > +static void rzg2l_tint_set_edge(struct irqc_priv *priv,
> > +                             u32 bit, unsigned int irq_type)
> > +{
> > +     u32 port_bit = bit;
> > +     u32 reg;
> > +
> > +     if (port_bit <= 15) {
> > +             reg = readl(priv->iomem + TITSR0);
> > +             reg &= ~(IRQ_MASK << (port_bit * 2));
> > +             reg |= irq_type << (port_bit * 2);
> > +             writel(reg, priv->iomem + TITSR0);
> > +     } else {
> > +             reg = readl(priv->iomem + TITSR1);
> > +             port_bit = port_bit / 2;
> > +             reg &= ~(IRQ_MASK << (port_bit * 2));
> > +             reg |= irq_type << (port_bit * 2);
> > +             writel(reg, priv->iomem + TITSR1);
> > +     }
>
> This will result in corruption if two interrupts change their type at
> the same time. Also, please use relaxed accessors.
>
agreed.

> > +}
> > +
> > +static int rzg2l_tint_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +     struct rzg2l_pin_info *pin_info = d->chip_data;
> > +     struct irqc_priv *priv = irq_data_to_priv(d);
> > +     u8 irq_type;
> > +
> > +     pin_info->trigger_type = type & GENMASK(15, 0);
> > +     pin_info->pin_state = ((type & ~GENMASK(15, 0)) >> 15);
>
> This shift is obviously wrong. Also, why are you tracking random
> information independently of the core?
>
To handle IRQ_TYPE_EDGE_BOTH which is not natively supported by the HW
we split the type and pass the current state of GPIO PIN BIT(16) to
the parent irqc domain and trigger it on rising/falling edge depending
on the PIN state.

> > +     pin_info->type = pin_info->trigger_type;
>
> More pointless tracking...
>
> > +
> > +     if (pin_info->trigger_type & BIT(0))
> > +             irq_type = RISING_EDGE;
> > +     else if (pin_info->trigger_type & BIT(1))
> > +             irq_type = FALLING_EDGE;
> > +     else if (pin_info->trigger_type & BIT(2))
> > +             irq_type = HIGH_LEVEL;
> > +     else if (pin_info->trigger_type & BIT(3))
> > +             irq_type = LOW_LEVEL;
> > +     else if (pin_info->trigger_type & BIT(4))
> > +             irq_type = pin_info->pin_state ? FALLING_EDGE : RISING_EDGE;
> > +     else
> > +             return -EINVAL;
>
> ... considering that this can fail. And please use the macros that
> already exist rather than these BIT(x).
>
sure will do.

> > +
> > +     pin_info->trigger_type = irq_type;
> > +     rzg2l_tint_set_edge(priv, pin_info->bit, irq_type);
> > +
> > +     return 0;
> > +}
> > +
> > +static irqreturn_t rzg2l_irqc_tint_irq_handler(int irq, void *dev_id)
> > +{
> > +     struct irq_domain *pctl_irq_domain;
> > +     struct rzg2l_pin_info *pin_info;
> > +     struct irqc_irq *i = dev_id;
> > +     struct irqc_priv *priv = i->p;
> > +     struct irq_data *irq_data;
> > +     unsigned int offset;
> > +     u32 reg;
> > +
> > +     offset = irq - priv->irq[RZG2L_TINT_IRQ_START_INDEX].requested_irq;
> > +     pin_info = priv->irq[offset + RZG2L_TINT_IRQ_START_INDEX].pin;
> > +     if (!pin_info)
> > +             return IRQ_NONE;
> > +
> > +     irq_data = irq_domain_get_irq_data(priv->parent_domain, i->requested_irq);
> > +     if (!irq_data)
> > +             return IRQ_NONE;
> > +
> > +     pctl_irq_domain = rzg2l_get_pinctrl_domain(priv->dev);
>
> Are you really comfortable with parsing the device tree on each
> interrupt you get? This is madness. It also makes no sense to resolve
> an interrupt in a foreign irqdomain. Why don't you allocate yours?
>
Making this as an interrupt controller, this will go away.

> > +     if (!pctl_irq_domain)
> > +             return IRQ_NONE;
> > +
> > +     reg = readl(priv->iomem + TSCR);
> > +     reg &= ~BIT(offset);
> > +     writel(reg, priv->iomem + TSCR);
> > +
> > +     generic_handle_irq(irq_find_mapping(pctl_irq_domain,
> > +                                         ((pin_info->port * 8) + pin_info->bit)));
>
> generic_handle_domain_irq() is your new friend.
>
Ok will switch to generic_handle_domain_irq().

> > +
> > +     if (pin_info->type & BIT(4)) {
> > +             pin_info->trigger_type = (pin_info->trigger_type == FALLING_EDGE) ?
> > +                                     RISING_EDGE : FALLING_EDGE;
> > +             rzg2l_tint_set_edge(priv, pin_info->bit, pin_info->trigger_type);
> > +     }
>
> This has hardly any chance of working reliably. Yes, plenty of drivers
> do that. They are all doomed to fail.
>
Agreed, for the first version will drop both edge support.

> > +
> > +     return IRQ_HANDLED;
>
> No way. This isn't a standard interrupt handler. This is a mux, with a
> number of inputs for each of the *49* outputs. Please implement this
> as a chained interrupt controller.
>
Ok will implement this as a chained interrupt controller.

> > +}
> > +
> > +static void rzg2l_tint_irq_disable(struct irq_data *d)
> > +{
> > +     struct rzg2l_pin_info *pin_info = d->chip_data;
> > +     struct irqc_priv *priv = irq_data_to_priv(d);
> > +     u32 reg;
> > +
> > +     reg = readl(priv->iomem + TSSR(pin_info->id / 4));
> > +     reg &= ~(GENMASK(7, 0) << (pin_info->id % 4));
> > +     writel(reg, priv->iomem + TSSR(pin_info->id / 4));
>
> More buggy RMW, magic numbers all over the shop. Does this act as a
> disable (pending state is lost) or as a mask (pending state is
> preserved)?
>
it acts as a mask, the pending state is preserved.

> > +}
> > +
> > +static void rzg2l_tint_irq_enable(struct irq_data *d)
> > +{
> > +     struct rzg2l_pin_info *pin_info = d->chip_data;
> > +     struct irqc_priv *priv = irq_data_to_priv(d);
> > +     u32 gpioint;
> > +     u32 reg;
> > +
> > +     gpioint = rzg2l_gpio_irq_validate_id(pin_info->port, pin_info->bit);
> > +
> > +     reg = readl(priv->iomem + TSSR(pin_info->id / 4));
> > +     reg |= (BIT(7) | gpioint) << (8 * (pin_info->id % 4));
> > +     writel(reg, priv->iomem + TSSR(pin_info->id / 4));
>
> On top of the buggy RMW, what happens when
> rzg2l_gpio_irq_validate_id() returns -EINVAL?
>
will use rmw, in rzg2l_tint_irq_enable() callback -EINVAL case wont
happen as this would have been already caught in alloc() callback. But
to keep it consistent will add a check for -EINVAL.

> > +}
> > +
> > +static int rzg2l_irqc_domain_translate(struct irq_domain *domain,
> > +                                    struct irq_fwspec *fwspec,
> > +                                    unsigned long *hwirq,
> > +                                    unsigned int *type)
> > +{
> > +     if (WARN_ON(fwspec->param_count < 2))
> > +             return -EINVAL;
> > +
> > +     *hwirq = fwspec->param[0];
> > +     *type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> > +
> > +     return 0;
> > +}
>
> This is irq_domain_translate_twocell().
>
agreed.

> > +
> > +static int rzg2l_irqc_domain_alloc(struct irq_domain *domain,
> > +                                unsigned int virq, unsigned int nr_irqs,
> > +                                void *arg)
> > +{
> > +     struct irqc_priv *priv = domain->host_data;
> > +     struct irq_fwspec parent_fwspec;
> > +     struct rzg2l_pin_info *pin_info;
> > +     struct irq_data *irq_data;
> > +     irq_hw_number_t hwirq;
> > +     unsigned int type;
> > +     int gpioint;
> > +     u32 port;
> > +     int irq;
> > +     int ret;
> > +     u8 bit;
> > +
> > +     ret = rzg2l_irqc_domain_translate(domain, arg, &hwirq, &type);
> > +     if (ret)
> > +             return ret;
> > +
> > +     port = RZG2L_PIN_ID_TO_PORT(hwirq);
> > +     bit = RZG2L_PIN_ID_TO_PIN(hwirq);
> > +
> > +     switch (type) {
> > +     case IRQ_TYPE_EDGE_RISING:
> > +     case IRQ_TYPE_LEVEL_HIGH:
> > +             break;
> > +     case IRQ_TYPE_EDGE_FALLING:
> > +             type = IRQ_TYPE_EDGE_RISING;
> > +             break;
> > +     case IRQ_TYPE_LEVEL_LOW:
> > +             type = IRQ_TYPE_LEVEL_HIGH;
>
> Really? How is that handled?
>
my bad this can be set to IRQ_TYPE_  eihter of one and the actual type
will be handled  in the irq_set_type() callback.

> I stopped reading at this stage. This needs to be redesigned from the
> ground up as an interrupt controller instead of an interrupt handler,
> have proper locking, data structures that are not redundant with that
> of the core code, and be written in a way that is self documenting.
>
Thank you for the feedback, I'll re-design this as an interrupt controller.

Cheers,
Prabhakar

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
