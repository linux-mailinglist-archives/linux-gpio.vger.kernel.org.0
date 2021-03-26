Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB03D34B118
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 22:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhCZVMA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 17:12:00 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:35244 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhCZVLn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 17:11:43 -0400
Received: from [IPv6:2a02:a03f:eaff:9f01:cce8:c5ff:8b8d:f8cb] (unknown [IPv6:2a02:a03f:eaff:9f01:cce8:c5ff:8b8d:f8cb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id A100F1E60C4;
        Fri, 26 Mar 2021 22:11:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1616793099;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=khl5Z4oSNwve2yBva/20MyIhKiwGzIOzGG+zJupOXk4=;
        b=X3V+AeuP13VDXyEH+N82jg44PnDNS8o0dktTnMEjqx8dYruxKDQJQ6sGJA0VEMGPBlGPCV
        4c6QRItCVn5X9lrB6cN6SGC8Lut1BFWRUSYlAyobmhn7mj3KoGDYx2wMipNttig4fd+X7F
        eRWiRITj842aW6EIsCSoaPuHQ0osrzudltXn+soEs4V3p7F1ipyGmJOOKHA/n9GV3eBj/W
        04dyogUCzTocon2Bdw+RUBsSCwfVodZ4ThTUTu1kjRdfLM3/ph9Whkh4MkYxOilIRMK/JQ
        hTBZ6YliDm5I/+DDK3hFb4y/s+bQrIHNTftbcNaVMF/3fikkYtIKlCh3bnoCmQ==
Message-ID: <f5059092c1d4f3a23683a2eebfa37cb739881a8a.camel@svanheule.net>
Subject: Re: [PATCH v4 2/2] gpio: Add Realtek Otto GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Fri, 26 Mar 2021 22:11:36 +0100
In-Reply-To: <CAHp75Vdi06dLxJNCo4f1CA=cS1MuPwG0nEAnVqt8BRrz9bnOtw@mail.gmail.com>
References: <cover.1616760183.git.sander@svanheule.net>
         <31e5a5aeb833c43c07daafcf939864497ff1c349.1616760183.git.sander@svanheule.net>
         <CAHp75Vdi06dLxJNCo4f1CA=cS1MuPwG0nEAnVqt8BRrz9bnOtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Replies inline below.

On Fri, 2021-03-26 at 20:19 +0200, Andy Shevchenko wrote:
> On Fri, Mar 26, 2021 at 2:05 PM Sander Vanheule <sander@svanheule.net>
> wrote:
> 
> > +config GPIO_REALTEK_OTTO
> > +       bool "Realtek Otto GPIO support"
> 
> Why not module?

This driver is only useful on a few specific MIPS SoCs, where this GPIO
peripheral is a part of that SoC. What would be the point of providing
this driver as a module?

> 
> > +       depends on MACH_REALTEK_RTL
> > +       default MACH_REALTEK_RTL
> > +       select GPIO_GENERIC
> > +       select GPIOLIB_IRQCHIP
> 
> > +       help
> > +         The GPIO controller on the Otto MIPS platform supports up
> > to two
> > +         banks of 32 GPIOs, with edge triggered interrupts. The 32
> > GPIOs
> > +         are grouped in four 8-bit wide ports.
> 
> When allowing module build, here you may add what will be the name of
> it.
> 
> ...
> 
> > +/*
> > + * Total register block size is 0x1C for four ports.
> > + * On the RTL8380/RLT8390 platforms port A, B, and C are
> > implemented.
> 
> D?

No port D on 8380/8390. Only 24 GPIO lines are present on these
platforms. I'll rephrase this comment.

> 
> > + * RTL8389 and RTL8328 implement a second bank with ports E, F, G,
> > and H.
> > + *
> > + * Port information is stored with the first port at offset 0,
> > followed by the
> > + * second, etc. Most registers store one bit per GPIO and should be
> > read out in
> > + * reversed endian order. The two interrupt mask registers store two
> > bits per
> > + * GPIO, and should be manipulated with swahw32, if required.
> > + */

This reference to swahw32 and the include of linux/swab.h will be
dropped.

> 
> > +/*
> 
> Seems like kernel doc format with missed ** header and properly formed
> summary and description.

I'll reformat.

> 
> > + * Realtek GPIO driver data
> > + * Because the interrupt mask register (IMR) combines the function
> > of
> > + * IRQ type selection and masking, two extra values are stored.
> > + * intr_mask is used to mask/unmask the interrupts for certain
> > GPIO,
> > + * and intr_type is used to store the selected interrupt types.
> > The
> > + * logical AND of these values is written to IMR on changes.
> > + *
> > + * @gc Associated gpio_chip instance
> > + * @base Base address of the register block
> > + * @lock Lock for accessing the IRQ registers and values
> > + * @intr_mask Mask for GPIO interrupts
> > + * @intr_type GPIO interrupt type selection
> > + */
> > +struct realtek_gpio_ctrl {
> > +       struct gpio_chip gc;
> > +       void __iomem *base;
> > +       raw_spinlock_t lock;
> > +       u16 intr_mask[REALTEK_GPIO_PORTS_PER_BANK];
> > +       u16 intr_type[REALTEK_GPIO_PORTS_PER_BANK];
> > +};
> > +
> > +enum realtek_gpio_flags {
> > +       GPIO_INTERRUPTS = BIT(0),
> > +};
> 
> ...

See below. I'll add a comment.

> 
> > +static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data
> > *data)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +
> > +       return container_of(gc, struct realtek_gpio_ctrl, gc);
> > +}
> 
> > +static unsigned int line_to_port(unsigned int line)
> > +{
> > +       return line / 8;
> > +}
> > +
> > +static unsigned int line_to_port_pin(unsigned int line)
> > +{
> > +       return line % 8;
> > +}
> 
> These are useless. Just use them inline.

I added these as the alternative of the /16 and %16 I had for the IMR
offsets in v2. The function names tell the reader _why_ I'm doing the
division and modulo operations, but I guess a properly named variable
would do the same.

> 
> > +static u8 read_u8_reg(void __iomem *reg, unsigned int port)
> > +{
> > +       return ioread8(reg + port);
> > +}
> > +
> > +static void write_u8_reg(void __iomem *reg, unsigned int port, u8
> > value)
> > +{
> > +       iowrite8(value, reg + port);
> > +}
> > +
> > +static void write_u16_reg(void __iomem *reg, unsigned int port, u16
> > value)
> > +{
> > +       iowrite16(value, reg + 2 * port);
> > +}
> 
> What's the point? You better provide a controller structure as a
> parameter. Look into other drivers. There are plenty of examples how
> to provide IO accessors in smarter way.

Since these are currently only really used for IMR and ISR, I'll fold
them into their accessor functions for v5.

> 
> > +static void realtek_gpio_write_imr(struct realtek_gpio_ctrl *ctrl,
> > +       unsigned int port, u16 irq_type, u16 irq_mask)
> > +{
> > +       write_u16_reg(ctrl->base + REALTEK_GPIO_REG_IMR, port,
> > +                  irq_type & irq_mask);
> 
> Can be one line.
> 
> > +}
> 
> ...
> 
> > +static int realtek_gpio_irq_set_type(struct irq_data *data,
> > +       unsigned int flow_type)
> 
> One line?

I thought checkpatch.pl would complain, but it doesn't. Folded onto one
line.

> > +       chained_irq_enter(irq_chip, desc);
> > +
> > +       for (lines_done = 0; lines_done < gc->ngpio; lines_done += 8)
> > {
> > +               port = line_to_port(lines_done);
> > +               status = read_u8_reg(reg_isr, port);
> > +               port_pin_count = min(gc->ngpio - lines_done, 8U);
> > +               for_each_set_bit(offset, &status, port_pin_count) {
> > +                       irq = irq_find_mapping(gc->irq.domain,
> > offset);
> > +                       generic_handle_irq(irq);
> 
> > +                       write_u8_reg(reg_isr, port, BIT(offset));
> 
> Shouldn't it be in the ->irq_ack() callback?

I think I added this line to deal with handle_bad_irq during
development. Like you say, handle_edge_irq() has it's specific ACK
logic, so this is probably even a bug. Will be removed.

> 
> > +               }
> > +       }
> 
> ...
> 
> > +static const struct of_device_id realtek_gpio_of_match[] = {
> > +       { .compatible = "realtek,otto-gpio" },
> > +       {
> > +               .compatible = "realtek,rtl8380-gpio",
> > +               .data = (void *)GPIO_INTERRUPTS
> 
> Not sure why this flag is needed right now. Drop it completely for
> good.
> > +       },
> > +       {
> > +               .compatible = "realtek,rtl8390-gpio",
> > +               .data = (void *)GPIO_INTERRUPTS
> 
> Ditto

Linus Walleij asked this question too after v1:
https://lore.kernel.org/linux-gpio/e9f0651e5fb52b7d56361ceb30b41759b6f2ec13.camel@svanheule.net/

Note that the fall-back compatible doesn't have this flag set.

> .
> 
> > +       },
> > +       {}
> > +};
> 
> > +
> 
> Extra blank line.

Add or drop? I see other drivers using no empty line between the
of_match table and the MODULE_DEVICE_TABLE macro.

> 
> > +MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
> 
> 
> ...
> 
> > +               iowrite32(GENMASK(31, 0), ctrl->base +
> > REALTEK_GPIO_REG_ISR);
> 
> This one perhaps needs a comment like "cleaning all IRQ states".
> Note, we have a proper callback for this, i.e. hw_init. Consider to use
> it.

Which "hw_init" are you referring too? I can't really find much, aside
from drivers implementing it themselves to differentiate between driver
and hardware set-up.

Since this is normally only called once, I can turn it into the more
readable:
	for (port = 0; (port * 8) < ngpios; port++) {
        	realtek_gpio_write_imr(ctrl, port, 0, 0);
                realtek_gpio_clear_isr(ctrl, port, GENMASK(7, 0));
        }

> 
> > +};
> 
> > +
> 
> Extra blank line.

I see the same use of one blank line in other drivers.


> > +builtin_platform_driver(realtek_gpio_driver);
> 
> ...
> 
> So, looking into the code, I think you may easily get rid of 30-50
> LOCs.
> So, expecting <= 300 LOCs in v5.

After trimming the file, sloccount puts me at 224, but the total line
count is still 310. :-)


Best,
Sander


