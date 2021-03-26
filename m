Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B11234AE69
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 19:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhCZSTi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 14:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbhCZSTc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 14:19:32 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7263C0613AA;
        Fri, 26 Mar 2021 11:19:30 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 32so5192236pgm.1;
        Fri, 26 Mar 2021 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPcULTxfGuBNGNfwpX/3ckVBfW9Rgj2GR4nKZtxg0Xk=;
        b=Dtvlg/5ZMJz5IBK5ODW3HoNDSP+NuYr1VNg0pO/GQj+GXdjd3nyAawWKUCAi3c2l/z
         3IU/RdoSqAVJUfG5nQVXnQurscDLJSN8CejzW1L8zhoAFsdTwJtvxhh80aiFjKKcYoC8
         ukjOvOOkYIk1cTfxH1fzUv7oAqYDa3eKm2vUj+JB9N2I8iRrnW6xFwQhi6/YrhXzYdnQ
         UQnGyEM94JQxGSIl4pXXsbE0jKEjfIIjuqTXHqXAvE3ngcJ7o5q84pvVcxA7GlExjNY6
         4LQ9Rm0tLw+JnpzxPFX8EStMdd4cKk0NrVhMWEpaaBp50L5qScb3RZ6BBGLtDomm0C8O
         g/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPcULTxfGuBNGNfwpX/3ckVBfW9Rgj2GR4nKZtxg0Xk=;
        b=fpARwFWHwPByCwqF5XbBR8JRyzTCSEm8vE2GC1cqeVYs7xXI/CIIAZ8Ir2yezqIC2U
         IO2Oci04hjiv50BsIdgDTiWjDSlcUG81CLBnqYyHydBtErOzDSwfMFJrM/ucxuMoBYVv
         4i1ff0MyxN5Cte+PHpiHnNOfU1rcpcamAYLCV5kzUBCNGr51ErO8Njgfdx57Y1DhRyxL
         VXGeV5D1BfI4v1iTbYtGjvWD9VbqMbHB7h+heAdbkO/obLMeIEEJeqdgl760fuTTwppC
         e7WVPMUS0KgPG0peWfDSRslSs0aL6KnJ3MlRd3tSMqNMXivvRfno1yfc17I3UDChpXHG
         i3HQ==
X-Gm-Message-State: AOAM533BmTnBAMUf00gOjrVylnHappXFgsM+/av7p43euNpo2IEhr3tW
        7IM/h6bi6RB8cN7q6uCr2Cl2tLVzIcKQ0Xyw2Ik=
X-Google-Smtp-Source: ABdhPJwpJ0VifO0DvAEnpGSW1wXyY6SlfUStROi7sFRd8LGyh7JcxjooQ5/YxnER1UR+BtbjE0dN9oLP+W5xQ2E9gz0=
X-Received: by 2002:a65:4bc5:: with SMTP id p5mr13178859pgr.74.1616782770001;
 Fri, 26 Mar 2021 11:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616760183.git.sander@svanheule.net> <31e5a5aeb833c43c07daafcf939864497ff1c349.1616760183.git.sander@svanheule.net>
In-Reply-To: <31e5a5aeb833c43c07daafcf939864497ff1c349.1616760183.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Mar 2021 20:19:13 +0200
Message-ID: <CAHp75Vdi06dLxJNCo4f1CA=cS1MuPwG0nEAnVqt8BRrz9bnOtw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 26, 2021 at 2:05 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> Realtek MIPS SoCs (platform name Otto) have GPIO controllers with up to
> 64 GPIOs, divided over two banks. Each bank has a set of registers for
> 32 GPIOs, with support for edge-triggered interrupts.
>
> Each GPIO bank consists of four 8-bit GPIO ports (ABCD and EFGH). Most
> registers pack one bit per GPIO, except for the IMR register, which
> packs two bits per GPIO (AB-CD).
>
> Although the byte order is currently assumed to have port A..D at offset
> 0x0..0x3, this has been observed to be reversed on other, Lexra-based,
> SoCs (e.g. RTL8196E/97D/97F).
>
> Interrupt support is disabled for the fallback devicetree-compatible
> 'realtek,otto-gpio'. This allows for quick support of GPIO banks in
> which the byte order would be unknown. In this case, the port ordering
> in the IMR registers may not match the reversed order in the other
> registers (DCBA, and BA-DC or DC-BA).

Thanks for the update!
My comments below.

...

> +config GPIO_REALTEK_OTTO
> +       bool "Realtek Otto GPIO support"

Why not module?

> +       depends on MACH_REALTEK_RTL
> +       default MACH_REALTEK_RTL
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP

> +       help
> +         The GPIO controller on the Otto MIPS platform supports up to two
> +         banks of 32 GPIOs, with edge triggered interrupts. The 32 GPIOs
> +         are grouped in four 8-bit wide ports.

When allowing module build, here you may add what will be the name of it.

...

> +/*
> + * Total register block size is 0x1C for four ports.
> + * On the RTL8380/RLT8390 platforms port A, B, and C are implemented.

D?

> + * RTL8389 and RTL8328 implement a second bank with ports E, F, G, and H.
> + *
> + * Port information is stored with the first port at offset 0, followed by the
> + * second, etc. Most registers store one bit per GPIO and should be read out in
> + * reversed endian order. The two interrupt mask registers store two bits per
> + * GPIO, and should be manipulated with swahw32, if required.
> + */

...

> +/*

Seems like kernel doc format with missed ** header and properly formed
summary and description.

> + * Realtek GPIO driver data
> + * Because the interrupt mask register (IMR) combines the function of
> + * IRQ type selection and masking, two extra values are stored.
> + * intr_mask is used to mask/unmask the interrupts for certain GPIO,
> + * and intr_type is used to store the selected interrupt types. The
> + * logical AND of these values is written to IMR on changes.
> + *
> + * @gc Associated gpio_chip instance
> + * @base Base address of the register block
> + * @lock Lock for accessing the IRQ registers and values
> + * @intr_mask Mask for GPIO interrupts
> + * @intr_type GPIO interrupt type selection
> + */
> +struct realtek_gpio_ctrl {
> +       struct gpio_chip gc;
> +       void __iomem *base;
> +       raw_spinlock_t lock;
> +       u16 intr_mask[REALTEK_GPIO_PORTS_PER_BANK];
> +       u16 intr_type[REALTEK_GPIO_PORTS_PER_BANK];
> +};
> +
> +enum realtek_gpio_flags {
> +       GPIO_INTERRUPTS = BIT(0),
> +};

...

> +static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *data)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +
> +       return container_of(gc, struct realtek_gpio_ctrl, gc);
> +}

> +static unsigned int line_to_port(unsigned int line)
> +{
> +       return line / 8;
> +}
> +
> +static unsigned int line_to_port_pin(unsigned int line)
> +{
> +       return line % 8;
> +}

These are useless. Just use them inline.

...

> +static u8 read_u8_reg(void __iomem *reg, unsigned int port)
> +{
> +       return ioread8(reg + port);
> +}
> +
> +static void write_u8_reg(void __iomem *reg, unsigned int port, u8 value)
> +{
> +       iowrite8(value, reg + port);
> +}
> +
> +static void write_u16_reg(void __iomem *reg, unsigned int port, u16 value)
> +{
> +       iowrite16(value, reg + 2 * port);
> +}

What's the point? You better provide a controller structure as a
parameter. Look into other drivers. There are plenty of examples how
to provide IO accessors in smarter way.

...

> +static void realtek_gpio_write_imr(struct realtek_gpio_ctrl *ctrl,
> +       unsigned int port, u16 irq_type, u16 irq_mask)
> +{
> +       write_u16_reg(ctrl->base + REALTEK_GPIO_REG_IMR, port,
> +                  irq_type & irq_mask);

Can be one line.

> +}

...

> +       write_u8_reg(ctrl->base + REALTEK_GPIO_REG_ISR, line_to_port(line),
> +               BIT(line_to_port_pin(line)));

line % 8 and line / 8 is much shorter. ANd then it becomes only one line.

...

> +static int realtek_gpio_irq_set_type(struct irq_data *data,
> +       unsigned int flow_type)

One line?

...

> +static void realtek_gpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +       struct realtek_gpio_ctrl *ctrl = gpiochip_get_data(gc);
> +       struct irq_chip *irq_chip = irq_desc_get_chip(desc);
> +       void __iomem *reg_isr = ctrl->base + REALTEK_GPIO_REG_ISR;
> +       unsigned int lines_done;
> +       unsigned int port_pin_count;
> +       unsigned int port;
> +       unsigned int irq;

> +       int offset;
> +       unsigned long status;

Rearrange them by swapping lines.

> +       chained_irq_enter(irq_chip, desc);
> +
> +       for (lines_done = 0; lines_done < gc->ngpio; lines_done += 8) {
> +               port = line_to_port(lines_done);
> +               status = read_u8_reg(reg_isr, port);
> +               port_pin_count = min(gc->ngpio - lines_done, 8U);
> +               for_each_set_bit(offset, &status, port_pin_count) {
> +                       irq = irq_find_mapping(gc->irq.domain, offset);
> +                       generic_handle_irq(irq);

> +                       write_u8_reg(reg_isr, port, BIT(offset));

Shouldn't it be in the ->irq_ack() callback?

> +               }
> +       }

...

> +static const struct of_device_id realtek_gpio_of_match[] = {
> +       { .compatible = "realtek,otto-gpio" },
> +       {
> +               .compatible = "realtek,rtl8380-gpio",
> +               .data = (void *)GPIO_INTERRUPTS

Not sure why this flag is needed right now. Drop it completely for good.

> +       },
> +       {
> +               .compatible = "realtek,rtl8390-gpio",
> +               .data = (void *)GPIO_INTERRUPTS

Ditto.

> +       },
> +       {}
> +};

> +

Extra blank line.

> +MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);


...

> +               iowrite32(GENMASK(31, 0), ctrl->base + REALTEK_GPIO_REG_ISR);

This one perhaps needs a comment like "cleaning all IRQ states".
Note, we have a proper callback for this, i.e. hw_init. Consider to use it.

...

> +};

> +

Extra blank line.

> +builtin_platform_driver(realtek_gpio_driver);

...

So, looking into the code, I think you may easily get rid of 30-50 LOCs.
So, expecting <= 300 LOCs in v5.

-- 
With Best Regards,
Andy Shevchenko
