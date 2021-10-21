Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58856436B83
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 21:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhJUTxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 15:53:11 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:35651 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhJUTxJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 15:53:09 -0400
Received: by mail-pg1-f177.google.com with SMTP id q187so1274761pgq.2;
        Thu, 21 Oct 2021 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qcBk3DeZv7+MBr+DGak5KmAIKq22H5/grJVeSCeLaw=;
        b=ZjItPisPSDEL6cgmvUPYFaAZEy0N46bIWUjLpg8oJfA6tpA3SbC9C4EPghn/wGs4JD
         cII7/2xC3dnbGAMmhklBB7JA4bZ2psdJXPmFoOFLR4ujbiiUb7l4VhAawaMEELxMYJ42
         5Us60xzpB/f9V+wFNyPUoFur/ONjDcXD0xXb9wCy33GBIv3EQeTHDb4G/EYiWEK0ULtb
         /v1yXWtKMZF8753QsYsm5LMlABi592MQcK3lgHqL6uaMPyfWy1Te4HeWGtEaylxBejpx
         2q5fzejSLFYreio2lxOZ+shyweg+0PbM9ZWykT+W/wHWXxzCs4jKBjtNEODE+OO8J4xU
         B9Bw==
X-Gm-Message-State: AOAM533iLrDX8+dmEY3xez1WN3h0tALAHOWZuRq63VZ4EUPafgbABuR1
        ODeaC6W3dj3IGudUs0K97/8sPTTHRAZ3HjwUuB4=
X-Google-Smtp-Source: ABdhPJz2g45HVrm92zsQSGHVasZJ2oUSDzMsKNKTjLhfF9aY5UDp7p3S+/XUucIuf3UBNmD9xTaAgYYNmpQ1XqNUueI=
X-Received: by 2002:a63:2d46:: with SMTP id t67mr5876914pgt.15.1634845853245;
 Thu, 21 Oct 2021 12:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-13-kernel@esmil.dk>
 <20211021190118.GA1802180@x1>
In-Reply-To: <20211021190118.GA1802180@x1>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Thu, 21 Oct 2021 21:50:42 +0200
Message-ID: <CANBLGcy2WR2L_CE2FbLPBnDaHWaNgUySxyB4WyPYA1z8zsQAPQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Drew Fustini <dfustini@baylibre.com>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Oct 2021 at 21:01, Drew Fustini <dfustini@baylibre.com> wrote:
> On Thu, Oct 21, 2021 at 07:42:19PM +0200, Emil Renner Berthing wrote:
> > +/*
> > + * Interrupt Trigger Polarity. If set to 1 the interrupt is triggered on a
> > + * rising edge (edge-triggered) or high level (level-triggered). If set to 0 the
> > + * interrupt is triggered on a falling edge (edge-triggered) or low level
> > + * (level-triggered).
> > + */
> > +#define GPIOIEV              0x020
> > +
> > +/*
> > + * Interrupt Mask. If set to 1 the interrupt is disabled (masked). If set to 0
> > + * the interrupt is enabled (unmasked).
> > + */
> > +#define GPIOIE               0x028
>
> It bothered me that the datasheet used the term GPIOIE for the interrupt
> mask register. I had used a more verbose #define name because I worried
> someone reading GPIOIE in functions might mistake it for an interrupt
> enable register. This happened to me when I was originally working with
> the gpio driver.
>
> However I suppose the best solution would have been to get the datasheet
> updated as I can see how it is best to have #define names in the driver
> match the datasheet.
>
> > +static void starfive_irq_mask(struct irq_data *d)
> > +{
> > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > +     u32 mask = BIT(gpio % 32);
> > +     unsigned long flags;
> > +     u32 value;
> > +
> > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > +     value = readl_relaxed(ie) & ~mask;
> > +     writel_relaxed(value, ie);
> > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > +}
> > +
> > +static void starfive_irq_mask_ack(struct irq_data *d)
> > +{
> > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > +     void __iomem *ic = sfp->base + GPIOIC + 4 * (gpio / 32);
> > +     u32 mask = BIT(gpio % 32);
> > +     unsigned long flags;
> > +     u32 value;
> > +
> > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > +     value = readl_relaxed(ie) & ~mask;
> > +     writel_relaxed(value, ie);
> > +     writel_relaxed(mask, ic);
> > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > +}
> > +
> > +static void starfive_irq_unmask(struct irq_data *d)
> > +{
> > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > +     u32 mask = BIT(gpio % 32);
> > +     unsigned long flags;
> > +     u32 value;
> > +
> > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > +     value = readl_relaxed(ie) | mask;
> > +     writel_relaxed(value, ie);
> > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > +}
> > +

...

> > +static int starfive_gpio_init_hw(struct gpio_chip *gc)
> > +{
> > +     struct starfive_pinctrl *sfp = starfive_from_gc(gc);
> > +
> > +     /* mask all GPIO interrupts */
> > +     writel(0, sfp->base + GPIOIE + 0);
> > +     writel(0, sfp->base + GPIOIE + 4);
>
> Woudln't 0 in GPIOIE mean mask is disabled for all interrupts?
>
> In other words, wouldn't this enable all the interrupts?

Heh, you're right. The code does the exact opposite of what the
documentation says it should be doing. However I just tried and with
the code as it is now GPIO interrupts work fine, but with the logic
flipped the kernel fails to boot. I'm guessing because an interrupt
storm. So it seems to me the documentation might be wrong and GPIOIE
is actually a good name.

Michael Zhu: Can you confirm if a 1 or 0 enables the interrupt in the
GPIOIE registers?

/Emil
