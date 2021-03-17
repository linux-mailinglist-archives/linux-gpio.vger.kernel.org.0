Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C33333F0DF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 14:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbhCQNIc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 09:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhCQNIW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 09:08:22 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F07C06174A;
        Wed, 17 Mar 2021 06:08:22 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q5so12090512pgk.5;
        Wed, 17 Mar 2021 06:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDYCEwdNWPewAeosgbIIkjpNIF4er8m+MwlavNwzRnA=;
        b=ZablnC3OpBVNeaeo5aj/H8fnJ3DpRcMk4hvfT4ahbnv0FKpE7+7EPWh9nL8JipFFHP
         owhwgtBK9VjG3YWAHmTqCTOj1dqZBGqS1QVnV2A+oDneo4GL5utyVNUumL254WGyd6CA
         oEgGtdWu1eSxG6mUd++C+tPEgEjcCXFwWga0/G3aRDk8WBv58J5b7orWMZXPyr+XXH5f
         TTiesLHS3Z3FkNdfIuR5FOMD6KJqV3pViTsQhMdt26vKrm7UUTleGoREm7KT+42ZZRU1
         UJMVJhfN6B/A9XKfxEzxUHG2+WDc7uCPthOXtCrw6GMM0IeMrYGG/dOr9uV3g6VPe/99
         XflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDYCEwdNWPewAeosgbIIkjpNIF4er8m+MwlavNwzRnA=;
        b=oFKptQoFmMYFk0zpns6Dk7kk+oFjKnYiy+HeLPF7/d2p05xmIHjZ3SHkxW9H9GSFqF
         h+6pBsuWTbM40TWfrePpdFRm4um7jGxu1CfGMCb0lbj+rZ/6OOO0YwdOWOgbK1ssf1ZX
         NU/5WcVM1apUocQUTvmh5oud/MpfL2ThOFlC6sr7SHNf4b+Rsc2N6XDjkr/zRjfUTXa0
         1NLhhDQWAxy1tPot09L1sVHEy7E+I0s5RVmtv3tdhwf+fKAMUopPK0wWw2u5GeL67Wma
         +nW6Lq1mBFjiqjRvh9yz8OUNeYEZaWfG/PoSkBhMCvYisTNP+zcTXKV9dx/ret7mg2kt
         nW2Q==
X-Gm-Message-State: AOAM532IqtC28i1eRc+yMODGociLCsisepJ0zToqlAeoV5ei8ULexSEK
        Zv+OrkucSd8tWY0fJ2vAf7SzyexTs7Boiqwt64Q=
X-Google-Smtp-Source: ABdhPJxR4P49jAD80Ndi7CNlIr9jZ+JUMsM+9HRSiVGkyTAXzQEDsloFLjPrSv06d1RiqSOhsjMtO8PvOKnEYQHx0ek=
X-Received: by 2002:a65:4bc5:: with SMTP id p5mr2569919pgr.74.1615986501557;
 Wed, 17 Mar 2021 06:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210315082339.9787-1-sander@svanheule.net> <20210315190806.66762-1-sander@svanheule.net>
 <20210315190806.66762-3-sander@svanheule.net>
In-Reply-To: <20210315190806.66762-3-sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Mar 2021 15:08:00 +0200
Message-ID: <CAHp75Vc6aaDhVN7LzvLNQjuOPguz+nbfmfpZ7TZHK=fNjCRz8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 11:11 PM Sander Vanheule <sander@svanheule.net> wrote:
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

I have few comments.

> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig             |  12 ++
>  drivers/gpio/Makefile            |   1 +
>  drivers/gpio/gpio-realtek-otto.c | 331 +++++++++++++++++++++++++++++++
>  3 files changed, 344 insertions(+)
>  create mode 100644 drivers/gpio/gpio-realtek-otto.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e3607ec4c2e8..fedf1e49469e 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -502,6 +502,18 @@ config GPIO_RDA
>         help
>           Say Y here to support RDA Micro GPIO controller.
>
> +config GPIO_REALTEK_OTTO
> +       bool "Realtek Otto GPIO support"
> +       depends on MACH_REALTEK_RTL

> +       depends on OF_GPIO

Don't see how it's used.

> +       default MACH_REALTEK_RTL
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         The GPIO controller on the Otto MIPS platform supports up to two
> +         banks of 32 GPIOs, with edge triggered interrupts. The 32 GPIOs
> +         are grouped in four 8-bit wide ports.
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
> index 000000000000..818412687346
> --- /dev/null
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>

> +#include <linux/of_irq.h>

Why?
Perhaps what you need is property.h and mod_devicetable.h. See below.

> +#include <linux/platform_device.h>

> +#include <linux/swab.h>

Not sure why you need this? See below.

> +/*
> + * Total register block size is 0x1C for four ports.
> + * On the RTL8380/RLT8390 platforms port A, B, and C are implemented.
> + * RTL8389 and RTL8328 implement a second bank with ports E, F, G, and H.
> + *
> + * Port information is stored with the first port at offset 0, followed by the
> + * second, etc. Most registers store one bit per GPIO and should be read out in
> + * reversed endian order. The two interrupt mask registers store two bits per
> + * GPIO, and should be manipulated with swahw32, if required.
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
> +/* Two bits per GPIO */
> +#define REALTEK_GPIO_REG_IMR_AB                0x14
> +#define REALTEK_GPIO_REG_IMR_CD                0x18

> +#define REALTEK_GPIO_IMR_LINE_MASK     3

GENMASK() ?

> +#define REALTEK_GPIO_IRQ_EDGE_FALLING  1
> +#define REALTEK_GPIO_IRQ_EDGE_RISING   2
> +#define REALTEK_GPIO_IRQ_EDGE_BOTH     3
> +
> +#define REALTEK_GPIO_MAX               32
> +
> +/*
> + * Realtek GPIO driver data
> + * Because the interrupt mask register (IMR) combines the function of
> + * IRQ type selection and masking, two extra values are stored.
> + * intr_mask is used to mask/unmask the interrupts for certain GPIO,
> + * and intr_type is used to store the selected interrupt types. The
> + * logical AND of these values is written to IMR on changes.
> + *
> + * @dev Parent device
> + * @gc Associated gpio_chip instance
> + * @base Base address of the register block
> + * @lock Lock for accessing the IRQ registers and values
> + * @intr_mask Mask for GPIO interrupts
> + * @intr_type GPIO interrupt type selection
> + */
> +struct realtek_gpio_ctrl {
> +       struct device *dev;
> +       struct gpio_chip gc;
> +       void __iomem *base;
> +       raw_spinlock_t lock;
> +       u32 intr_mask[2];
> +       u32 intr_type[2];
> +};
> +
> +enum realtek_gpio_flags {
> +       GPIO_INTERRUPTS = BIT(0),
> +};
> +
> +static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *data)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +
> +       return container_of(gc, struct realtek_gpio_ctrl, gc);
> +}
> +
> +static inline u32 realtek_gpio_isr_read(struct realtek_gpio_ctrl *ctrl)
> +{
> +       return swab32(readl(ctrl->base + REALTEK_GPIO_REG_ISR));

Why swab?! How is this supposed to work on BE CPUs?
Ditto for all swabXX() usage.

> +}
> +
> +static inline void realtek_gpio_isr_clear(struct realtek_gpio_ctrl *ctrl,
> +       unsigned int pin_mask)
> +{
> +       writel(swab32(pin_mask), ctrl->base + REALTEK_GPIO_REG_ISR);
> +}
> +
> +static inline void realtek_gpio_update_imr(struct realtek_gpio_ctrl *ctrl,
> +       unsigned int imr_offset, u32 type, u32 mask)
> +{
> +       unsigned int reg;
> +
> +       if (imr_offset == 0)
> +               reg = REALTEK_GPIO_REG_IMR_AB;
> +       else
> +               reg = REALTEK_GPIO_REG_IMR_CD;
> +       writel(swahw32(type & mask), ctrl->base + reg);
> +}
> +
> +/*
> + * Since the IMRs contain two bits per GPIO, only 16 GPIO lines fit in a 32-bit
> + * register.
> + * Use realtek_gpio_pin_to_imr_offset() to select the correct IMR offset, and
> + * realtek_gpio_imr_bits() to put the GPIO line's new value in the right place.
> + */
> +static inline u32 realtek_gpio_pin_to_imr_offset(unsigned int pin)
> +{
> +       return pin/16;

Too few spaces.

> +}
> +
> +static inline u32 realtek_gpio_imr_bits(unsigned int pin, u32 value)
> +{
> +       return ((value & REALTEK_GPIO_IMR_LINE_MASK) << 2*(pin % 16));

Too many parentheses.
Too few spaces.

> +}
> +
> +static void realtek_gpio_irq_ack(struct irq_data *data)
> +{
> +       struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
> +       u32 pin = irqd_to_hwirq(data);

irq_hwnum_t (or how is it called? check the return type of
irqd_to_hwirq() function).

> +       realtek_gpio_isr_clear(ctrl, BIT(pin));
> +}
> +
> +static void realtek_gpio_irq_unmask(struct irq_data *data)
> +{
> +       struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
> +       unsigned int pin = irqd_to_hwirq(data);
> +       unsigned int imr_offset = realtek_gpio_pin_to_imr_offset(pin);
> +       unsigned long flags;
> +       u32 m;
> +
> +       raw_spin_lock_irqsave(&ctrl->lock, flags);
> +       m = ctrl->intr_mask[imr_offset];
> +       m |= realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
> +       ctrl->intr_mask[imr_offset] = m;
> +       realtek_gpio_update_imr(ctrl, imr_offset, ctrl->intr_type[imr_offset], m);
> +       raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> +}
> +
> +static void realtek_gpio_irq_mask(struct irq_data *data)
> +{
> +       struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
> +       unsigned int pin = irqd_to_hwirq(data);
> +       unsigned int imr_offset = realtek_gpio_pin_to_imr_offset(pin);
> +       unsigned long flags;
> +       u32 m;
> +
> +       raw_spin_lock_irqsave(&ctrl->lock, flags);
> +       m = ctrl->intr_mask[imr_offset];
> +       m &= ~realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
> +       ctrl->intr_mask[imr_offset] = m;
> +       realtek_gpio_update_imr(ctrl, imr_offset, ctrl->intr_type[imr_offset], m);
> +       raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> +}
> +
> +static int realtek_gpio_irq_set_type(struct irq_data *data,
> +       unsigned int flow_type)
> +{
> +       struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
> +       irq_flow_handler_t handler;
> +       unsigned int pin = irqd_to_hwirq(data);
> +       unsigned int imr_offset = realtek_gpio_pin_to_imr_offset(pin);
> +       unsigned long flags;
> +       u32 type, t;
> +
> +       switch (flow_type & IRQ_TYPE_SENSE_MASK) {

> +       case IRQ_TYPE_NONE:
> +               type = 0;
> +               handler = handle_bad_irq;
> +               break;

Why is it here? Make it default like many other GPIO drivers do.

> +       case IRQ_TYPE_EDGE_FALLING:
> +               type = REALTEK_GPIO_IRQ_EDGE_FALLING;
> +               handler = handle_edge_irq;
> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               type = REALTEK_GPIO_IRQ_EDGE_RISING;
> +               handler = handle_edge_irq;
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               type = REALTEK_GPIO_IRQ_EDGE_BOTH;
> +               handler = handle_edge_irq;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       irq_set_handler_locked(data, handler);

handler is always the same. Use it directly here.

> +       raw_spin_lock_irqsave(&ctrl->lock, flags);
> +       t = ctrl->intr_type[imr_offset];
> +       t &= ~realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
> +       t |= realtek_gpio_imr_bits(pin, type);
> +       ctrl->intr_type[imr_offset] = t;
> +       realtek_gpio_update_imr(ctrl, imr_offset, t, ctrl->intr_mask[imr_offset]);
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
> +       int offset;
> +       unsigned long status;
> +
> +       chained_irq_enter(irq_chip, desc);
> +
> +       status = realtek_gpio_isr_read(ctrl);
> +       for_each_set_bit(offset, &status, gc->ngpio) {

> +               dev_dbg(ctrl->dev, "gpio irq %d\n", offset);

Why? Drop this development-phase line.

> +               generic_handle_irq(irq_find_mapping(gc->irq.domain, offset));
> +               realtek_gpio_isr_clear(ctrl, BIT(offset));
> +       }
> +
> +       chained_irq_exit(irq_chip, desc);
> +}
> +
> +static struct irq_chip realtek_gpio_irq_chip = {
> +       .name = "realtek-otto-gpio",
> +       .irq_ack = realtek_gpio_irq_ack,
> +       .irq_mask = realtek_gpio_irq_mask,
> +       .irq_unmask = realtek_gpio_irq_unmask,

> +       .irq_set_type = realtek_gpio_irq_set_type

+ comma

> +};
> +
> +static const struct of_device_id realtek_gpio_of_match[] = {
> +       { .compatible = "realtek,otto-gpio" },
> +       {
> +               .compatible = "realtek,rtl8380-gpio",
> +               .data = (void *)GPIO_INTERRUPTS
> +       },
> +       {
> +               .compatible = "realtek,rtl8390-gpio",
> +               .data = (void *)GPIO_INTERRUPTS
> +       },

> +       {},

Drop comma. They are not needed for terminator lines.

> +};
> +
> +MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
> +
> +static int realtek_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np = dev->of_node;
> +       struct gpio_irq_chip *girq;
> +       struct realtek_gpio_ctrl *ctrl;
> +       const struct of_device_id *match;
> +       unsigned int match_flags;
> +       u32 ngpios;
> +       int err, irq;
> +
> +       ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->dev = dev;
> +
> +       if (!np) {
> +               dev_err(&pdev->dev, "no DT node found\n");
> +               return -EINVAL;
> +       }
> +

> +       match = of_match_node(realtek_gpio_of_match, np);
> +       match_flags = (unsigned int) match->data;

device_get_match_data();

> +       if (of_property_read_u32(np, "ngpios", &ngpios) != 0)

' != 0' can be replaced by ''

device_property_read_u32()

> +               ngpios = REALTEK_GPIO_MAX;
> +
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
> +       irq = of_irq_get(np, 0);

Why not platform_get_irq_optional() ?

> +       if ((match_flags & GPIO_INTERRUPTS) && irq > 0) {
> +               girq = &ctrl->gc.irq;
> +               girq->chip = &realtek_gpio_irq_chip;
> +               girq->parent_handler = realtek_gpio_irq_handler;
> +               girq->num_parents = 1;
> +               girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),

1 -> girq->num_parent

> +                                       GFP_KERNEL);
> +               if (!girq->parents)
> +                       return -ENOMEM;
> +               girq->default_type = IRQ_TYPE_NONE;
> +               girq->handler = handle_bad_irq;
> +               girq->parents[0] = irq;
> +
> +               /* Disable and clear all interrupts */
> +               realtek_gpio_update_imr(ctrl, 0, 0, 0);
> +               realtek_gpio_update_imr(ctrl, 1, 0, 0);
> +               realtek_gpio_isr_clear(ctrl, BIT(ngpios)-1);
> +       }

> +       err = gpiochip_add_data(&ctrl->gc, ctrl);
> +       return err;

Fold it.

> +}
> +
> +static struct platform_driver realtek_gpio_driver = {
> +       .driver = {
> +               .name = "realtek-otto-gpio",
> +               .of_match_table = realtek_gpio_of_match,
> +       },
> +       .probe = realtek_gpio_probe,
> +};
> +
> +builtin_platform_driver(realtek_gpio_driver);
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
