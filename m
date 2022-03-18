Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39894DDC51
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 16:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237626AbiCRPBc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 11:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237491AbiCRPBc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 11:01:32 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A851A7743;
        Fri, 18 Mar 2022 08:00:09 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2e592e700acso93789387b3.5;
        Fri, 18 Mar 2022 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E765d6y2RPWhioxQ00s39Agi9RQuqzoN9dy2dFJZ/wI=;
        b=dSn3i+/BmlH6QYPaa6ukbLx9P/a7rjRvODaq2By+fqgP0jA0VuM75twSKGB+CzLJ7L
         q64wtyBGSALtiixIQdcYwpQJF/TGmbsPW1qC2RYOTro0OnxHep37w8zDdRRLRZLKBEOK
         ZS29TRKlZc+jESrWpj9au1fGRnKTw4od8gPDpAZQ5ANRY55j7FZ3oJM5ANs5blgZZaiZ
         3zFoJQMCopN9ZPTlit1rGwfgKG6i1zf0TghsXj/gDdmutGytGhyUkbL/Os1DmBchsP92
         2FD0fQxsJeoo3+mhy8JdRmwfyCuxNabneCVyE8VOTG8EmYrvNHMnhwMdmxAynbBf0QHK
         TQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E765d6y2RPWhioxQ00s39Agi9RQuqzoN9dy2dFJZ/wI=;
        b=04W34Bie6fPGCKSviPm9O6bKKquYwmlvOVCcu88rEHDrKu+edGmvqaswzvLFqLVu8o
         W7ViYgpr6/UzpsQe1QBfQFHFpffHgl23I6irVIeNjZCGHm2LIbcFXWIEq/TlPPzCG7Fk
         GlLIY5hvIoo46RbcW/39YbjUGia0IvKhTQpEfcu1hbu4Jp/FMyo2vcGUbVsXUGP7MpM7
         NuGZq6g0VRHH7qXrGc8S9VcZCu9BLW4rphn16ew/wb9M8n1ASdKpUghdYGePmnortHyL
         zRM4oFzQ/gelzpnjZFPNTT01faja/9L+ydeCggmCxw9+ssmIzBxxIyBpvFvblN3qcAUy
         xjMw==
X-Gm-Message-State: AOAM532HkFELyyQEZIxUQrC3mBxqE8YgTfJbDvkAyiAu1VGx0TSyWlAp
        AbchKKQ7TCqXwLQyeKXeDb/G9olFShTp0iNOf5A=
X-Google-Smtp-Source: ABdhPJy8TRg2ipv4TFRFjJj1iEjOT3EJG3dxLr15325mqPqmYHFpGc5f3xEpjj19OcwoPDaj2k+4I29N3cd1aiJiQN4=
X-Received: by 2002:a81:998c:0:b0:2d7:7e7d:877d with SMTP id
 q134-20020a81998c000000b002d77e7d877dmr11733542ywg.78.1647615608105; Fri, 18
 Mar 2022 08:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220317012404.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220317012404.8069-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <87pmmky2tw.wl-maz@kernel.org>
In-Reply-To: <87pmmky2tw.wl-maz@kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 18 Mar 2022 14:59:41 +0000
Message-ID: <CA+V-a8uw9wwnA=_n+1MUtUhdwCdMFNb22HOq0R3yEeqsfTJLBQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/5] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
To:     Marc Zyngier <maz@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc,

Thank you for the review.

On Thu, Mar 17, 2022 at 4:13 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 17 Mar 2022 01:24:01 +0000,
> Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Add a driver for the Renesas RZ/G2L Interrupt Controller.
> >
> > This supports external pins being used as interrupts. It supports
> > one line for NMI, 8 external pins and 32 GPIO pins (out of 123)
> > to be used as IRQ lines.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/irqchip/Kconfig             |   8 +
> >  drivers/irqchip/Makefile            |   1 +
> >  drivers/irqchip/irq-renesas-rzg2l.c | 462 ++++++++++++++++++++++++++++
> >  3 files changed, 471 insertions(+)
> >  create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c
> >
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index 7038957f4a77..afc5999f4955 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -242,6 +242,14 @@ config RENESAS_RZA1_IRQC
> >         Enable support for the Renesas RZ/A1 Interrupt Controller, to use up
> >         to 8 external interrupts with configurable sense select.
> >
> > +config RENESAS_RZG2L_IRQC
> > +     bool "Renesas RZ/G2L (and alike SoC) IRQC support" if COMPILE_TEST
> > +     select GENERIC_IRQ_CHIP
> > +     select IRQ_DOMAIN_HIERARCHY
> > +     help
> > +       Enable support for the Renesas RZ/G2L (and alike SoC) Interrupt Controller
> > +       for external devices.
> > +
> >  config SL28CPLD_INTC
> >       bool "Kontron sl28cpld IRQ controller"
> >       depends on MFD_SL28CPLD=y || COMPILE_TEST
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index c1f611cbfbf8..b536e514a7c9 100644
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
> > index 000000000000..be9741e88bd7
> > --- /dev/null
> > +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> > @@ -0,0 +1,462 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/G2L IRQC Driver
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation.
> > + *
> > + * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/irqchip.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/of_address.h>
> > +#include <linux/reset.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define IRQC_IRQ_START                       1
> > +#define IRQC_IRQ_COUNT                       8
> > +#define IRQC_TINT_START                      9
> > +#define IRQC_TINT_COUNT                      32
> > +#define IRQC_NUM_IRQ                 41
> > +
> > +#define ISCR                         0x10
> > +#define IITSR                                0x14
> > +#define TSCR                         0x20
> > +#define TITSR0                               0x24
> > +#define TITSR1                               0x28
> > +#define TITSR0_MAX_INT                       16
> > +#define TITSEL_WIDTH                 0x2
> > +#define TSSR(n)                              (0x30 + ((n) * 4))
> > +#define TIEN                         BIT(7)
> > +#define TSSEL_SHIFT(n)                       (8 * (n))
> > +#define TSSEL_MASK                   GENMASK(7, 0)
> > +#define IRQ_MASK                     0x3
> > +
> > +#define TSSR_OFFSET(n)                       ((n) % 4)
> > +#define TSSR_INDEX(n)                        ((n) / 4)
> > +
> > +#define TITSR_TITSEL_EDGE_RISING     0
> > +#define TITSR_TITSEL_EDGE_FALLING    1
> > +#define TITSR_TITSEL_LEVEL_HIGH              2
> > +#define TITSR_TITSEL_LEVEL_LOW               3
> > +
> > +#define IITSR_IITSEL(n, sense)               ((sense) << ((n) * 2))
> > +#define IITSR_IITSEL_LEVEL_LOW               0
> > +#define IITSR_IITSEL_EDGE_FALLING    1
> > +#define IITSR_IITSEL_EDGE_RISING     2
> > +#define IITSR_IITSEL_EDGE_BOTH               3
> > +#define IITSR_IITSEL_MASK(n)         IITSR_IITSEL((n), 3)
> > +
> > +#define TINT_EXTRACT_HWIRQ(x)                ((x) & ~GENMASK(31, 16))
> > +#define TINT_EXTRACT_GPIOINT(x)              ((x) >> 16)
> > +
> > +struct rzg2l_irqc_priv {
> > +     void __iomem *base;
> > +     struct of_phandle_args map[IRQC_NUM_IRQ];
> > +     raw_spinlock_t lock;
> > +};
> > +
> > +struct rzg2l_irqc_chip_data {
> > +     int tint;
> > +};
> > +
> > +static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
> > +{
> > +     return data->domain->host_data;
> > +}
> > +
> > +static void rzg2l_irq_eoi(struct irq_data *d)
> > +{
> > +     struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> > +     unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
> > +     u16 bit = BIT(hw_irq);
> > +     unsigned long flags;
> > +     u32 reg;
> > +
> > +     raw_spin_lock_irqsave(&priv->lock, flags);
>
> Why the irqsave flavour? Is there any case where EOI isn't performed
> in a context that has interrupts already disabled?
>
Agreed this callback will be called with IRQ's disabled, so we can use
raw_spin_lock() instead.

> > +     reg = readl_relaxed(priv->base + ISCR);
> > +     if (reg & bit)
> > +             writel_relaxed(GENMASK(IRQC_IRQ_COUNT - 1, 0) & ~bit,
> > +                            priv->base + ISCR);
> > +     raw_spin_unlock_irqrestore(&priv->lock, flags);
> > +     irq_chip_eoi_parent(d);
> > +}
> > +
> > +static void rzg2l_tint_eoi(struct irq_data *d)
> > +{
> > +     struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> > +     unsigned int hw_irq = irqd_to_hwirq(d);
> > +     u32 bit = BIT(hw_irq - IRQC_TINT_START);
> > +     unsigned long flags;
> > +     u32 reg;
> > +
> > +     raw_spin_lock_irqsave(&priv->lock, flags);
> > +     reg = readl_relaxed(priv->base + TSCR);
> > +     if (reg & bit)
> > +             writel_relaxed(GENMASK(IRQC_TINT_COUNT - 1, 0) & ~bit,
> > +                            priv->base + TSCR);
> > +     raw_spin_unlock_irqrestore(&priv->lock, flags);
> > +     irq_chip_eoi_parent(d);
> > +}
> > +
> > +static void rzg2l_irqc_eoi(struct irq_data *d)
> > +{
> > +     unsigned int hw_irq = irqd_to_hwirq(d);
> > +
> > +     if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
> > +             return rzg2l_irq_eoi(d);
>
> return function_returning_void()? No, please.
>
Agreed will drop that.

> > +     else if (hw_irq >= IRQC_TINT_START && hw_irq <= IRQC_TINT_COUNT)
> > +             return rzg2l_tint_eoi(d);
>
> Move the locking and the call to irq_chip_eoi_parent() here, as there
> is no need to duplicate any of this.
>
OK, will move the locking and irq_chip_eoi_parent() here.

> > +}
> > +
> > +static void rzg2l_irqc_irq_disable(struct irq_data *d)
> > +{
> > +     unsigned int hw_irq = irqd_to_hwirq(d);
> > +
> > +     if (hw_irq >= IRQC_TINT_START && hw_irq <= IRQC_TINT_COUNT) {
> > +             struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> > +             u32 offset = hw_irq - IRQC_TINT_START;
> > +             u32 tssr_offset = TSSR_OFFSET(offset);
> > +             u8 tssr_index = TSSR_INDEX(offset);
> > +             unsigned long flags;
> > +             u32 reg;
> > +
> > +             raw_spin_lock_irqsave(&priv->lock, flags);
> > +             reg = readl_relaxed(priv->base + TSSR(tssr_index));
> > +             reg &= ~(TSSEL_MASK << tssr_offset);
> > +             writel_relaxed(reg, priv->base + TSSR(tssr_index));
> > +             raw_spin_unlock_irqrestore(&priv->lock, flags);
> > +     }
> > +     irq_chip_disable_parent(d);
> > +}
> > +
> > +static void rzg2l_irqc_irq_enable(struct irq_data *d)
> > +{
> > +     unsigned int hw_irq = irqd_to_hwirq(d);
> > +
> > +     if (hw_irq >= IRQC_TINT_START && hw_irq <= IRQC_TINT_COUNT) {
> > +             struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> > +             struct rzg2l_irqc_chip_data *chip_data = d->chip_data;
> > +             u32 offset = hw_irq - IRQC_TINT_START;
> > +             u32 tssr_offset = TSSR_OFFSET(offset);
> > +             u8 tssr_index = TSSR_INDEX(offset);
> > +             unsigned long flags;
> > +             u32 reg;
> > +
> > +             raw_spin_lock_irqsave(&priv->lock, flags);
> > +             reg = readl_relaxed(priv->base + TSSR(tssr_index));
> > +             reg |= (TIEN | chip_data->tint) << TSSEL_SHIFT(tssr_offset);
> > +             writel_relaxed(reg, priv->base + TSSR(tssr_index));
> > +             raw_spin_unlock_irqrestore(&priv->lock, flags);
> > +     }
> > +     irq_chip_enable_parent(d);
> > +}
> > +
> > +static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +     unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
> > +     struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> > +     unsigned long flags;
> > +     u16 sense, tmp;
> > +
> > +     switch (type & IRQ_TYPE_SENSE_MASK) {
> > +     case IRQ_TYPE_LEVEL_LOW:
> > +             sense = IITSR_IITSEL_LEVEL_LOW;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_FALLING:
> > +             sense = IITSR_IITSEL_EDGE_FALLING;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_RISING:
> > +             sense = IITSR_IITSEL_EDGE_RISING;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_BOTH:
> > +             sense = IITSR_IITSEL_EDGE_BOTH;
> > +             break;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     raw_spin_lock_irqsave(&priv->lock, flags);
>
> This already happens in an irq disabled context.
>
> > +     tmp = readl_relaxed(priv->base + IITSR);
> > +     tmp &= ~IITSR_IITSEL_MASK(hw_irq);
> > +     tmp |= IITSR_IITSEL(hw_irq, sense);
> > +     writel_relaxed(tmp, priv->base + IITSR);
> > +     raw_spin_unlock_irqrestore(&priv->lock, flags);
>
> What about the parent irqchip? If this is a hierarchical setup, it
> definitely should be told.
>
Ok, I will add a call for it.

> > +
> > +     return 0;
> > +}
> > +
> > +static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
> > +{
> > +     struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> > +     unsigned int hwirq = irqd_to_hwirq(d);
> > +     u32 titseln = hwirq - IRQC_TINT_START;
> > +     unsigned long flags;
> > +     u32 offset;
> > +     u8 sense;
> > +     u32 reg;
> > +
> > +     switch (type & IRQ_TYPE_SENSE_MASK) {
> > +     case IRQ_TYPE_EDGE_RISING:
> > +             sense = TITSR_TITSEL_EDGE_RISING;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_FALLING:
> > +             sense = TITSR_TITSEL_EDGE_FALLING;
> > +             break;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (titseln < TITSR0_MAX_INT) {
> > +             offset = TITSR0;
> > +     } else {
> > +             titseln /= TITSEL_WIDTH;
> > +             offset  = TITSR1;
> > +     }
> > +
> > +     raw_spin_lock_irqsave(&priv->lock, flags);
> > +     reg = readl_relaxed(priv->base + offset);
> > +     reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
> > +     reg |= sense << (titseln * TITSEL_WIDTH);
> > +     writel_relaxed(reg, priv->base + offset);
> > +     raw_spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +     unsigned int hw_irq = irqd_to_hwirq(d);
> > +
> > +     if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
> > +             return rzg2l_irq_set_type(d, type);
> > +     else if (hw_irq >= IRQC_TINT_START && hw_irq <= IRQC_TINT_COUNT)
> > +             return rzg2l_tint_set_edge(d, type);
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static struct irq_chip irqc_chip = {
> > +     .name                   = "rzg2l-irqc",
> > +     .irq_eoi                = rzg2l_irqc_eoi,
> > +     .irq_mask               = irq_chip_mask_parent,
> > +     .irq_unmask             = irq_chip_unmask_parent,
> > +     .irq_disable            = rzg2l_irqc_irq_disable,
> > +     .irq_enable             = rzg2l_irqc_irq_enable,
>
> So this looks a bit odd. irq_mask only calls the parent and does nothing
> locally, while irq_disable does something locally and calls into the
> parent. If the parent is a GIC, this is turned into a mask (GIC has no
> notion of disabled).
>
My understanding for enable callback is one time call during irq setup
and for the disable callback it will be called during irq shutdown.
During enable/disable callback we config the required registers.
For mask callback this will be called when an interrupt occurs and for
unmask we want to re-enable the interrupt. Since there are no specific
registers to mask/unmask on RZ/G2L the callbacks point to
irq_chip_mask_parent/irq_chip_unmask_parent.

I could move all the code from enable/disable callbacks to mask/unmask
callbacks and drop setting irq_enable/irq_disable completely. Please
let me know what should be the correct approach.

> If that's the flow you expect, good. But please check this is the case.
>
> > +     .irq_get_irqchip_state  = irq_chip_get_parent_state,
> > +     .irq_set_irqchip_state  = irq_chip_set_parent_state,
> > +     .irq_retrigger          = irq_chip_retrigger_hierarchy,
> > +     .irq_set_type           = rzg2l_irqc_set_type,
> > +     .flags                  = IRQCHIP_MASK_ON_SUSPEND |
> > +                               IRQCHIP_SET_TYPE_MASKED |
> > +                               IRQCHIP_SKIP_SET_WAKE,
> > +};
> > +
> > +static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
> > +                         unsigned int nr_irqs, void *arg)
> > +{
> > +     struct rzg2l_irqc_priv *priv = domain->host_data;
> > +     struct rzg2l_irqc_chip_data *chip_data = NULL;
> > +     struct irq_fwspec spec;
> > +     irq_hw_number_t hwirq;
> > +     int tint = -EINVAL;
> > +     unsigned int type;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     ret = irq_domain_translate_twocell(domain, arg, &hwirq, &type);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * For TINIT interrupts ie where pinctrl driver is child of irqc domain
> > +      * the hwirq and TINT are encoded in fwspec->param[0].
> > +      * hwirq for TINIT range from 9-40, hwirq is embedded 0-15 bits and TINT
> > +      * from 16-31 bits. TINIT from the pinctrl driver needs to be programmed
> > +      * in IRQC registers to enable a given gpio pin as interrupt.
> > +      */
> > +     if (hwirq > IRQC_IRQ_COUNT) {
> > +             tint = TINT_EXTRACT_GPIOINT(hwirq);
> > +             hwirq = TINT_EXTRACT_HWIRQ(hwirq);
> > +     }
> > +
> > +     if (hwirq > (IRQC_NUM_IRQ - 1))
> > +             return -EINVAL;
> > +
> > +     if (tint != -EINVAL && (hwirq < IRQC_TINT_START || hwirq > (IRQC_NUM_IRQ - 1)))
> > +             return -EINVAL;
> > +
> > +     chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
> > +     if (!chip_data)
> > +             return -ENOMEM;
> > +     chip_data->tint = tint;
> > +
> > +     ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &irqc_chip,
> > +                                         chip_data);
> > +     if (ret) {
> > +             kfree(chip_data);
> > +             return ret;
> > +     }
> > +
> > +     spec.fwnode = domain->parent->fwnode;
> > +     spec.param_count = priv->map[hwirq].args_count;
> > +     for (i = 0; i < spec.param_count; i++)
> > +             spec.param[i] = priv->map[hwirq].args[i];
> > +
> > +     ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &spec);
> > +     if (ret)
> > +             kfree(chip_data);
> > +
> > +     return ret;
> > +}
> > +
> > +static void rzg2l_irqc_domain_free(struct irq_domain *domain, unsigned int virq,
> > +                                unsigned int nr_irqs)
> > +{
> > +     struct irq_data *d;
> > +
> > +     d = irq_domain_get_irq_data(domain, virq);
> > +     if (d) {
> > +             struct rzg2l_irqc_chip_data *chip_data = d->chip_data;
> > +
> > +             kfree(chip_data);
> > +     }
> > +     irq_domain_free_irqs_common(domain, virq, nr_irqs);
> > +}
> > +
> > +static const struct irq_domain_ops rzg2l_irqc_domain_ops = {
> > +     .alloc = rzg2l_irqc_alloc,
> > +     .free = rzg2l_irqc_domain_free,
> > +     .translate = irq_domain_translate_twocell,
> > +};
> > +
> > +static int rzg2l_irqc_parse_map(struct rzg2l_irqc_priv *priv,
> > +                             struct device_node *np,
> > +                             struct device_node *parent)
> > +{
> > +     unsigned int len, j;
> > +     const __be32 *range;
> > +
> > +     range = of_get_property(np, "interrupts", &len);
> > +     if (!range)
> > +             return -EINVAL;
> > +
> > +     for (len /= sizeof(*range), j = 0; len >= 3; len -= 3) {
> > +             if (j >= IRQC_NUM_IRQ)
> > +                     return -EINVAL;
> > +
> > +             priv->map[j].args[0] = be32_to_cpu(*range++);
> > +             priv->map[j].args[1] = be32_to_cpu(*range++);
> > +             priv->map[j].args[2] = be32_to_cpu(*range++);
> > +             priv->map[j].args_count = 3;
> > +             j++;
> > +     }
>
> I'm confused. Why do you have to invent a new interrupt parser? What
> is wrong with of_irq_parse_one() populating the of_phandle_args array?
> I expected to see something like:
>
> static void rzg2l_irqc_parse_map(struct rzg2l_irqc_priv *priv,
>                                  struct device_node *np)
> {
>         int i;
>
>         for (i = 0; i < IRQC_NUM_IRQ; i++)
>                 of_irq_parse_one(np, i, &priv->map[i]);
> }
>
> and that's it.
>
Agreed of_irq_parse_one() already does this (and ofcourse I need to
check the return value of of_irq_parse_one()).

Cheers,
Prabhakar

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
