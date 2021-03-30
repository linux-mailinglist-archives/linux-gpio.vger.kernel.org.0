Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C974F34EE20
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 18:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbhC3QoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 12:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhC3Qn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 12:43:57 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAB0C061574;
        Tue, 30 Mar 2021 09:43:56 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so9751058pjb.4;
        Tue, 30 Mar 2021 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aI0kKJOFMUBNOyyp/aEGkWxY/8kbGM6Csi0uKmp/Ds8=;
        b=PGtNbzzoJ3WPTmq3Ucxez8HIr63kXuzvjmfGIiais/RyKJCjGb6rJ14bSwIICQG+6u
         eSGu1/foNDyDFIRtWYleAEeCrpTtohhF+73aUTkDxgMsB9avbuWscxclE1rKW0RsIn4N
         ugY7Nwymt8HAzxu621q1yP8Gc9pKRLnqtVUbH/ywxsrETq+Pvwejn7hc8l6SQHETAfX+
         i/pUrORR8xhHJDYVU8RN/4J9GZ70W3SUFgciCk0/mXJ+LlFyFl20aPpT77b60g6keua1
         0RC9iEpFb76w3brj25n8PxU/GdzAS5wELCWTQp5SCi1U3JlK2QDFqTI57+Z7VEam8UxD
         qGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aI0kKJOFMUBNOyyp/aEGkWxY/8kbGM6Csi0uKmp/Ds8=;
        b=M3EwE9ZkxRavlN5X0pGyToBJIa/CkQTDLRuptsK0MN4iyUuuBeKoPNi4UDX0ayQE3J
         cfYQ8QNtneNHOAnZs5GBfSiz6bVWaqtFPO2G1pIlDpI0Mo3HJ4PcU0bVjBEl9OY8YeeN
         /u6AaJkhvgdymUVLQPFP/uEEwarMH9qTxx9/tzGi60874TwwqosLo7jc4Bkzf8kTnFsC
         U0Z4o30HzR18PL3Sn5IoGO3xX1eIKXGT3VNUkLjRWhEbveNa0z+Nh7t1uVuUxkS0eemI
         8vjMIykq4nWeOK0qborihxilYwALe/Foint/THNC+x6LdLpyM72nkICwBq3IUR0hR4QX
         N2jA==
X-Gm-Message-State: AOAM531n5198YpeswqbL2IpwGuJXcVxww5AP3QwMdShlnwvgXQwaBx3d
        SVKF/WQ33m9Fv/u7fh8wC7ZT1av/AOax2JT0DIc=
X-Google-Smtp-Source: ABdhPJxyVDBqrLKmc4vJqZuM2Gx0FVIgxmhTf0M+5qrRtJvI7d25r4xurHAvqV2HGKdBNuqs+WScJWhLuUFayyfFXus=
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr33835156plq.17.1617122636125; Tue, 30
 Mar 2021 09:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617117762.git.sander@svanheule.net> <a41b04f4f92eacc98f51549f5ef35ecc28485255.1617117762.git.sander@svanheule.net>
In-Reply-To: <a41b04f4f92eacc98f51549f5ef35ecc28485255.1617117762.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 19:43:38 +0300
Message-ID: <CAHp75Vc_VzP_jxBmj3dYS9gYss-vVRrP1WAm1XRYxVNTzW5WTw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 6:27 PM Sander Vanheule <sander@svanheule.net> wrote:
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

Thanks for an update. Much better now!
My comments below.

After addressing them,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig             |  13 ++
>  drivers/gpio/Makefile            |   1 +
>  drivers/gpio/gpio-realtek-otto.c | 326 +++++++++++++++++++++++++++++++
>  3 files changed, 340 insertions(+)
>  create mode 100644 drivers/gpio/gpio-realtek-otto.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e3607ec4c2e8..6fb13d6507db 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -502,6 +502,19 @@ config GPIO_RDA
>         help
>           Say Y here to support RDA Micro GPIO controller.
>
> +config GPIO_REALTEK_OTTO
> +       tristate "Realtek Otto GPIO support"
> +       depends on MACH_REALTEK_RTL
> +       default MACH_REALTEK_RTL
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         The GPIO controller on the Otto MIPS platform supports up to two
> +         banks of 32 GPIOs, with edge triggered interrupts. The 32 GPIOs
> +         are grouped in four 8-bit wide ports.
> +
> +         When built as a module, the module will be called realtek_otto_gpio.
> +
>  config GPIO_REG
>         bool
>         help
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index c58a90a3c3b1..8ace5934e3c3 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -124,6 +124,7 @@ obj-$(CONFIG_GPIO_RC5T583)          += gpio-rc5t583.o
>  obj-$(CONFIG_GPIO_RCAR)                        += gpio-rcar.o
>  obj-$(CONFIG_GPIO_RDA)                 += gpio-rda.o
>  obj-$(CONFIG_GPIO_RDC321X)             += gpio-rdc321x.o
> +obj-$(CONFIG_GPIO_REALTEK_OTTO)                += gpio-realtek-otto.o
>  obj-$(CONFIG_GPIO_REG)                 += gpio-reg.o
>  obj-$(CONFIG_ARCH_SA1100)              += gpio-sa1100.o
>  obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)       += gpio-sama5d2-piobu.o
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
> new file mode 100644
> index 000000000000..05ce5d48e121
> --- /dev/null
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/irq.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>

In sorter order this goes before module.h.

> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +/*
> + * Total register block size is 0x1C for one bank of four ports (A, B, C, D).
> + * An optional second bank, with ports E, F, G, and H, may be present, starting
> + * at register offset 0x1C.
> + */
> +
> +/*
> + * Pin select: (0) "normal", (1) "dedicate peripheral"
> + * Not used on RTL8380/RTL8390, peripheral selection is managed by control bits
> + * in the peripheral registers.
> + */
> +#define REALTEK_GPIO_REG_CNR           0x00
> +/* Clear bit (0) for input, set bit (1) for output */
> +#define REALTEK_GPIO_REG_DIR           0x08
> +#define REALTEK_GPIO_REG_DATA          0x0C
> +/* Read bit for IRQ status, write 1 to clear IRQ */
> +#define REALTEK_GPIO_REG_ISR           0x10
> +/* Two bits per GPIO in IMR registers */
> +#define REALTEK_GPIO_REG_IMR           0x14
> +#define REALTEK_GPIO_REG_IMR_AB                0x14
> +#define REALTEK_GPIO_REG_IMR_CD                0x18
> +#define REALTEK_GPIO_IMR_LINE_MASK     GENMASK(1, 0)
> +#define REALTEK_GPIO_IRQ_EDGE_FALLING  1
> +#define REALTEK_GPIO_IRQ_EDGE_RISING   2
> +#define REALTEK_GPIO_IRQ_EDGE_BOTH     3
> +
> +#define REALTEK_GPIO_MAX               32
> +#define REALTEK_GPIO_PORTS_PER_BANK    4
> +
> +/**
> + * realtek_gpio_ctrl - Realtek Otto GPIO driver data
> + *
> + * @gc: Associated gpio_chip instance
> + * @base: Base address of the register block for a GPIO bank
> + * @lock: Lock for accessing the IRQ registers and values
> + * @intr_mask: Mask for interrupts lines
> + * @intr_type: Interrupt type selection
> + *
> + * Because the interrupt mask register (IMR) combines the function of IRQ type
> + * selection and masking, two extra values are stored. @intr_mask is used to
> + * mask/unmask the interrupts for a GPIO port, and @intr_type is used to store
> + * the selected interrupt types. The logical AND of these values is written to
> + * IMR on changes.
> + */
> +struct realtek_gpio_ctrl {
> +       struct gpio_chip gc;
> +       void __iomem *base;
> +       raw_spinlock_t lock;
> +       u16 intr_mask[REALTEK_GPIO_PORTS_PER_BANK];
> +       u16 intr_type[REALTEK_GPIO_PORTS_PER_BANK];
> +};
> +
> +/* Expand with more flags as devices with other quirks are added */
> +enum realtek_gpio_flags {
> +       /*
> +        * Allow disabling interrupts, for cases where the port order is
> +        * unknown. This may result in a port mismatch between ISR and IMR.
> +        * An interrupt would appear to come from a different line than the
> +        * line the IRQ handler was assigned to, causing uncaught interrupts.
> +        */
> +       GPIO_INTERRUPTS_DISABLED = BIT(0),
> +};
> +
> +static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *data)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +
> +       return container_of(gc, struct realtek_gpio_ctrl, gc);
> +}
> +
> +/*
> + * Normal port order register access
> + *
> + * Port information is stored with the first port at offset 0, followed by the
> + * second, etc. Most registers store one bit per GPIO and use a u8 value per
> + * port. The two interrupt mask registers store two bits per GPIO, so use u16
> + * values.
> + */
> +static void realtek_gpio_write_imr(struct realtek_gpio_ctrl *ctrl,
> +       unsigned int port, u16 irq_type, u16 irq_mask)

Okay, you use 1 TAB as indentation. I prefer a different style: under
the first character after (, but it's up to you. I'm fine with either.

> +{
> +       iowrite16(irq_type & irq_mask, ctrl->base + REALTEK_GPIO_REG_IMR + 2 * port);
> +}
> +
> +static void realtek_gpio_clear_isr(struct realtek_gpio_ctrl *ctrl,
> +       unsigned int port, u8 mask)
> +{
> +       iowrite8(mask, ctrl->base + REALTEK_GPIO_REG_ISR + port);
> +}
> +
> +static u8 realtek_gpio_read_isr(struct realtek_gpio_ctrl *ctrl,
> +       unsigned int port)
> +{
> +       return ioread8(ctrl->base + REALTEK_GPIO_REG_ISR + port);
> +}
> +
> +/* Set the rising and falling edge mask bits for a GPIO port pin */
> +static u16 realtek_gpio_imr_bits(unsigned int pin, u16 value)
> +{
> +       return (value & REALTEK_GPIO_IMR_LINE_MASK) << 2 * pin;
> +}
> +
> +static void realtek_gpio_irq_ack(struct irq_data *data)
> +{
> +       struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
> +       irq_hw_number_t line = irqd_to_hwirq(data);
> +       unsigned int port = line / 8;
> +       unsigned int port_pin = line % 8;
> +
> +       realtek_gpio_clear_isr(ctrl, port, BIT(port_pin));
> +}
> +
> +static void realtek_gpio_irq_unmask(struct irq_data *data)
> +{
> +       struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
> +       unsigned int line = irqd_to_hwirq(data);
> +       unsigned int port = line / 8;
> +       unsigned int port_pin = line % 8;
> +       unsigned long flags;
> +       u16 m;
> +
> +       raw_spin_lock_irqsave(&ctrl->lock, flags);
> +       m = ctrl->intr_mask[port];
> +       m |= realtek_gpio_imr_bits(port_pin, REALTEK_GPIO_IMR_LINE_MASK);
> +       ctrl->intr_mask[port] = m;
> +       realtek_gpio_write_imr(ctrl, port, ctrl->intr_type[port], m);
> +       raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> +}
> +
> +static void realtek_gpio_irq_mask(struct irq_data *data)
> +{
> +       struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
> +       unsigned int line = irqd_to_hwirq(data);
> +       unsigned int port = line / 8;
> +       unsigned int port_pin = line % 8;
> +       unsigned long flags;
> +       u16 m;
> +
> +       raw_spin_lock_irqsave(&ctrl->lock, flags);
> +       m = ctrl->intr_mask[port];
> +       m &= ~realtek_gpio_imr_bits(port_pin, REALTEK_GPIO_IMR_LINE_MASK);
> +       ctrl->intr_mask[port] = m;
> +       realtek_gpio_write_imr(ctrl, port, ctrl->intr_type[port], m);
> +       raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> +}
> +
> +static int realtek_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
> +{
> +       struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
> +       unsigned int line = irqd_to_hwirq(data);
> +       unsigned int port = line / 8;
> +       unsigned int port_pin = line % 8;
> +       unsigned long flags;
> +       u16 type, t;
> +
> +       switch (flow_type & IRQ_TYPE_SENSE_MASK) {
> +       case IRQ_TYPE_EDGE_FALLING:
> +               type = REALTEK_GPIO_IRQ_EDGE_FALLING;
> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               type = REALTEK_GPIO_IRQ_EDGE_RISING;
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               type = REALTEK_GPIO_IRQ_EDGE_BOTH;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       irq_set_handler_locked(data, handle_edge_irq);
> +
> +       raw_spin_lock_irqsave(&ctrl->lock, flags);
> +       t = ctrl->intr_type[port];
> +       t &= ~realtek_gpio_imr_bits(port_pin, REALTEK_GPIO_IMR_LINE_MASK);
> +       t |= realtek_gpio_imr_bits(port_pin, type);
> +       ctrl->intr_type[port] = t;
> +       realtek_gpio_write_imr(ctrl, port, t, ctrl->intr_mask[port]);
> +       raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> +
> +       return 0;
> +}
> +
> +static void realtek_gpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +       struct realtek_gpio_ctrl *ctrl = gpiochip_get_data(gc);
> +       struct irq_chip *irq_chip = irq_desc_get_chip(desc);
> +       unsigned int lines_done;
> +       unsigned int port_pin_count;
> +       unsigned int irq;
> +       unsigned long status;
> +       int offset;
> +
> +       chained_irq_enter(irq_chip, desc);
> +
> +       for (lines_done = 0; lines_done < gc->ngpio; lines_done += 8) {
> +               status = realtek_gpio_read_isr(ctrl, lines_done / 8);
> +               port_pin_count = min(gc->ngpio - lines_done, 8U);
> +               for_each_set_bit(offset, &status, port_pin_count) {
> +                       irq = irq_find_mapping(gc->irq.domain, offset);
> +                       generic_handle_irq(irq);
> +               }
> +       }
> +
> +       chained_irq_exit(irq_chip, desc);
> +}
> +
> +static int realtek_gpio_irq_init(struct gpio_chip *gc)
> +{
> +       struct realtek_gpio_ctrl *ctrl = gpiochip_get_data(gc);
> +       unsigned int port;
> +
> +       for (port = 0; (port * 8) < gc->ngpio; port++) {
> +               realtek_gpio_write_imr(ctrl, port, 0, 0);
> +               realtek_gpio_clear_isr(ctrl, port, GENMASK(7, 0));
> +       }
> +
> +       return 0;
> +}
> +
> +static struct irq_chip realtek_gpio_irq_chip = {
> +       .name = "realtek-otto-gpio",
> +       .irq_ack = realtek_gpio_irq_ack,
> +       .irq_mask = realtek_gpio_irq_mask,
> +       .irq_unmask = realtek_gpio_irq_unmask,
> +       .irq_set_type = realtek_gpio_irq_set_type,
> +};
> +
> +static const struct of_device_id realtek_gpio_of_match[] = {
> +       {
> +               .compatible = "realtek,otto-gpio",
> +               .data = (void *)GPIO_INTERRUPTS_DISABLED,
> +       },
> +       {
> +               .compatible = "realtek,rtl8380-gpio",
> +       },
> +       {
> +               .compatible = "realtek,rtl8390-gpio",
> +       },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
> +
> +static int realtek_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       unsigned int dev_flags;
> +       struct gpio_irq_chip *girq;
> +       struct realtek_gpio_ctrl *ctrl;
> +       u32 ngpios;
> +       int err, irq;
> +
> +       ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       dev_flags = (unsigned int) device_get_match_data(dev);
> +
> +       if (device_property_read_u32(dev, "ngpios", &ngpios))
> +               ngpios = REALTEK_GPIO_MAX;

You may actually drop the conditional and do like this:

       ngpios = REALTEK_GPIO_MAX;
       device_property_read_u32(dev, "ngpios", &ngpios);
       if (ngpios > ...)

> +       if (ngpios > REALTEK_GPIO_MAX) {
> +               dev_err(&pdev->dev, "invalid ngpios (max. %d)\n",
> +                       REALTEK_GPIO_MAX);
> +               return -EINVAL;
> +       }
> +
> +       ctrl->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(ctrl->base))
> +               return PTR_ERR(ctrl->base);
> +
> +       raw_spin_lock_init(&ctrl->lock);
> +
> +       err = bgpio_init(&ctrl->gc, dev, 4,
> +               ctrl->base + REALTEK_GPIO_REG_DATA, NULL, NULL,
> +               ctrl->base + REALTEK_GPIO_REG_DIR, NULL,
> +               BGPIOF_BIG_ENDIAN_BYTE_ORDER);
> +       if (err) {
> +               dev_err(dev, "unable to init generic GPIO");
> +               return err;
> +       }
> +
> +       ctrl->gc.ngpio = ngpios;
> +       ctrl->gc.owner = THIS_MODULE;
> +
> +       irq = platform_get_irq_optional(pdev, 0);
> +       if (!(dev_flags & GPIO_INTERRUPTS_DISABLED) && irq > 0) {
> +               girq = &ctrl->gc.irq;
> +               girq->chip = &realtek_gpio_irq_chip;
> +               girq->default_type = IRQ_TYPE_NONE;
> +               girq->handler = handle_bad_irq;
> +               girq->parent_handler = realtek_gpio_irq_handler;
> +               girq->num_parents = 1;
> +               girq->parents = devm_kcalloc(dev, girq->num_parents,
> +                                       sizeof(*girq->parents), GFP_KERNEL);
> +               if (!girq->parents)
> +                       return -ENOMEM;
> +               girq->parents[0] = irq;
> +               girq->init_hw = realtek_gpio_irq_init;
> +       }
> +
> +       return gpiochip_add_data(&ctrl->gc, ctrl);

Either you have to have ->remove() callback defined or use
devm_gpiochip_add_data() here.

> +}
> +
> +static struct platform_driver realtek_gpio_driver = {
> +       .driver = {
> +               .name = "realtek-otto-gpio",
> +               .of_match_table = realtek_gpio_of_match,
> +       },
> +       .probe = realtek_gpio_probe,
> +};
> +module_platform_driver(realtek_gpio_driver);
> +
> +MODULE_DESCRIPTION("Realtek Otto GPIO support");
> +MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.30.2
>


-- 
With Best Regards,
Andy Shevchenko
