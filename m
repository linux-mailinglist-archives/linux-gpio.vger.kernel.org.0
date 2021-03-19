Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F208134213A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 16:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCSPwJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 11:52:09 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:43286 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhCSPvl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 11:51:41 -0400
Received: from [IPv6:2a02:a03f:eaff:9f01:ffbc:9626:10f7:ec57] (unknown [IPv6:2a02:a03f:eaff:9f01:ffbc:9626:10f7:ec57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 2D2EA1E028B;
        Fri, 19 Mar 2021 16:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1616169093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KHu/bWBDWcOGFH8ElI16GIvRT2i23adhxH7rfaQXLL8=;
        b=EENJK7v3+SqmUS7WP2PHlCZn3urahuvIqWEuIZ8MrDbrqGm4tLYU7iGQaSFV+pI2pxmlTp
        +MHscDEmJyk8mwSM/MGWGRcNUVlhpH7lm32NtT2s9AK0krjQ7Si8cTti4rfAAVa0cOO2Ab
        dKEtKmqvDG1mmsPu7ByX/KzVeBh4YtO3yh8XXTpBaOO5REjE6KtrdsSzxoVaKwmDeb1neB
        InbPYzqywzXEDWul8fL9WZY0hVsduG8Dqmq3O5eBX+S+rXZzWIhzwGR6BqQy9gGfFavGNw
        /xA1LSP5N2/2xhFB6VcM4NXA5feN6jOaLpugx2gUDBbtDaXNFe8iaS4E0xxfJg==
Message-ID: <a7d410216d35ed2b3015bfdd8e21dafd9c42d9d4.camel@svanheule.net>
Subject: Re: [PATCH v2 2/2] gpio: Add Realtek Otto GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>
Date:   Fri, 19 Mar 2021 16:51:31 +0100
In-Reply-To: <CAHp75Vc6aaDhVN7LzvLNQjuOPguz+nbfmfpZ7TZHK=fNjCRz8w@mail.gmail.com>
References: <20210315082339.9787-1-sander@svanheule.net>
         <20210315190806.66762-1-sander@svanheule.net>
         <20210315190806.66762-3-sander@svanheule.net>
         <CAHp75Vc6aaDhVN7LzvLNQjuOPguz+nbfmfpZ7TZHK=fNjCRz8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Thanks for the review. I'll address the style comments in a v3. Some
further comments and discussion below.


On Wed, 2021-03-17 at 15:08 +0200, Andy Shevchenko wrote:
> On Mon, Mar 15, 2021 at 11:11 PM Sander Vanheule < 
> sander@svanheule.net> wrote:
> > +       depends on OF_GPIO
> 
> Don't see how it's used.

It isn't, so I'll remove it.


> > +#include <linux/of_irq.h>
> 
> Why?
> Perhaps what you need is property.h and mod_devicetable.h. See below.

With you suggestions, I was able to drop most explicit OF references.
Only of_device_id remains, for which I'll include mod_devicetable.h.


> > +#include <linux/swab.h>
> 
> Not sure why you need this? See below.

[snip]

> 
> > +
> > +static inline u32 realtek_gpio_isr_read(struct realtek_gpio_ctrl
> > *ctrl)
> > +{
> > +       return swab32(readl(ctrl->base + REALTEK_GPIO_REG_ISR));
> 
> Why swab?! How is this supposed to work on BE CPUs?
> Ditto for all swabXX() usage.

My use of swab32/swahw32 has little to do with the CPU being BE or LE,
but more with the register packing in the GPIO peripheral.

The supported SoCs have port layout A-B-C-D in the registers, where
firmware built with Realtek's SDK always denotes A0 as the first GPIO
line. So bit 24 in a register has the value for A0 (with the exception
of the IMR register).

I wrote these wrapper functions to be able to use the BIT() macro with
the GPIO line number, similar to how gpio-mmio uses ioread32be() when
the BGPIOF_BIG_ENDIAN_BYTE_ORDER flag is used.

For the IMR register, port A again comes first, but is now 16 bits wide
instead of 8, with A0 at bits 16:17. That's why swahw32 is used for
this register.

On the currently unsupported RTL9300-series, the port layout is
reversed: D-C-B-A. GPIO line A0 is then at bit 0, so the swapping
functions won't be required. When support for this alternate port
layout is added, some code will need to be added to differentiate
between the two cases.


> > +}
> > +
> > +static inline void realtek_gpio_isr_clear(struct realtek_gpio_ctrl
> > *ctrl,
> > +       unsigned int pin_mask)
> > +{
> > +       writel(swab32(pin_mask), ctrl->base +
> > REALTEK_GPIO_REG_ISR);
> > +}
> > +
> > +static inline void realtek_gpio_update_imr(struct
> > realtek_gpio_ctrl *ctrl,
> > +       unsigned int imr_offset, u32 type, u32 mask)
> > +{
> > +       unsigned int reg;
> > +
> > +       if (imr_offset == 0)
> > +               reg = REALTEK_GPIO_REG_IMR_AB;
> > +       else
> > +               reg = REALTEK_GPIO_REG_IMR_CD;
> > +       writel(swahw32(type & mask), ctrl->base + reg);
> > +}

[snip]

> > +       switch (flow_type & IRQ_TYPE_SENSE_MASK) {
> 
> > +       case IRQ_TYPE_NONE:
> > +               type = 0;
> > +               handler = handle_bad_irq;
> > +               break;
> 
> Why is it here? Make it default like many other GPIO drivers do.
> 
> > +       case IRQ_TYPE_EDGE_FALLING:
> > +               type = REALTEK_GPIO_IRQ_EDGE_FALLING;
> > +               handler = handle_edge_irq;
> > +               break;
> > +       case IRQ_TYPE_EDGE_RISING:
> > +               type = REALTEK_GPIO_IRQ_EDGE_RISING;
> > +               handler = handle_edge_irq;
> > +               break;
> > +       case IRQ_TYPE_EDGE_BOTH:
> > +               type = REALTEK_GPIO_IRQ_EDGE_BOTH;
> > +               handler = handle_edge_irq;
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       irq_set_handler_locked(data, handler);
> 
> handler is always the same. Use it directly here.

I'll drop the IRQ_TYPE_NONE case. Do I understand it correctly, that
IRQ_TYPE_NONE should never be used as the new value, but only as the
default initial value?


Best,
Sander




