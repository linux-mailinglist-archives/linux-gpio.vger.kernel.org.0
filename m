Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9F9E6EE41
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 09:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfGTHgt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 03:36:49 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34030 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfGTHgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 03:36:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so32838269ljg.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2019 00:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+o2We0O4O1K3O8X45oW49z43JEjChY/ZotlUWlRzMeY=;
        b=N9T4Hgn2olyla091p0rCbp8MGppeNCcuzLHkOg4et/yXeODxWgkgOpQ5JfaWF6yr7p
         BgtkGV3pNk0iPL0TBtKXBw2VgN2fvhBN+J3Wt8HaFDdVEDuu7mll40N2fYh6qZCR25+P
         vpABL19mgPfAIXXoYnNa4vSulALLIIB++7KRUJAkULPvnVI8VDRiL2qQeLJQ/6v3TFV3
         CkQDeTQ01WqrJx/ZFBebwamcrNSIXMDP92yDnECrA30PthrrbGdFytXOixqFOK+KL9JN
         0kMOsWxnidDmU+v5xf6hmq8gV3JP6Rmc1d0+Z+CNlI/FIVZR/dh/s2sHQi2GFeKqEYyB
         Y/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+o2We0O4O1K3O8X45oW49z43JEjChY/ZotlUWlRzMeY=;
        b=oXpBFSM+TyAtH7N8N8GNLGjfoV09cMi40INhjg3Qkbv4PMCiNNOECe2DQhhCBcXN+5
         aKToS1kBrYuqDviAiumMUjVAOVFM8Wd7+9YEQesDvIix/NRrSUUb9fcfo8+m997LWZo/
         de7fVMf4uUFdoqqDigJmfe1kx0zaZbBqOnhzMBcBhdWOSU2a2Kobo2UTOel5xyz2cKWV
         IWKBT8OJ2VpVcAToUjo2jWCngadUnX7c8NXtM7K5odEh90doQeYvwNsvZihdlswgEtlG
         nsnsVBoLCuIQ3WfTe31L1sg1tUtf/pFBRmYlImuAjqEOkJiTU8sKL1N/UkCFyz93lme1
         VKyw==
X-Gm-Message-State: APjAAAU6pc345U5fOwdptF31O5ofbgTY4GtS3hKq2/+cwqLr87SSM26D
        oh01zb2TPnt1btC49FBByM4cO2YMj7b+Yv2CEAJqhA==
X-Google-Smtp-Source: APXvYqzVrTCraoTk8bHhcemevK3zYW7sXOXRysGnUpnwuwErcRyoe5XAsks0BR3u0l9gfYUHHH8w+VinvMvmaGr4J9w=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr28263938ljg.62.1563608206402;
 Sat, 20 Jul 2019 00:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com> <1563564291-9692-3-git-send-email-hongweiz@ami.com>
In-Reply-To: <1563564291-9692-3-git-send-email-hongweiz@ami.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jul 2019 09:36:34 +0200
Message-ID: <CACRpkdYrJkROvPaR51gXzOQW_TtCtpbhbARpgwAqoC77rAhF+g@mail.gmail.com>
Subject: Re: [v5 2/2] gpio: aspeed: Add SGPIO driver
To:     Hongwei Zhang <hongweiz@ami.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hongwei,

thanks for your patch!

some comments and nitpicking below:

On Fri, Jul 19, 2019 at 9:25 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPIO driver support for Aspeed AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

> +// SPDX-License-Identifier: GPL-2.0+

I think the SPDX people prefer GPL-2.0-or-later

> +#include <linux/gpio.h>

Do not include this header in any new code using or
providing GPIOs.

> +#include <linux/gpio/driver.h>

This should be enough.

> +/*
> + * Note: The "value" register returns the input value when the GPIO is
> + *      configured as an input.
> + *
> + *      The "rdata" register returns the output value when the GPIO is
> + *      configured as an output.
> + */
> +static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
> +       {
> +               .val_regs = 0x0000,
> +               .rdata_reg = 0x0070,
> +               .irq_regs = 0x0004,
> +               .names = { "A", "B", "C", "D" },
> +       },
> +       {
> +               .val_regs = 0x001C,
> +               .rdata_reg = 0x0074,
> +               .irq_regs = 0x0020,
> +               .names = { "E", "F", "G", "H" },
> +       },
> +       {
> +               .val_regs = 0x0038,
> +               .rdata_reg = 0x0078,
> +               .irq_regs = 0x003C,
> +               .names = { "I", "J" },
> +       },
> +};

I guess you have been over the reasons why this is one big GPIO
chip instead of  10 individual gpio_chips?

It is usally better to have the individual chips, because it is easier
to just cut down the code to handle one instance and not having
to offset around the different address ranges.

Even if they all have the same clock, the clocks are reference
counted so it will just be referenced 10 times at most.

If they share a few common registers it is not good to split it
though. So there may be a compelling argument for keeping them
all together.

> +/* This will be resolved at compile time */

I don't see why that matters.

> +static inline void __iomem *bank_reg(struct aspeed_sgpio *gpio,
> +                                    const struct aspeed_sgpio_bank *bank,
> +                                    const enum aspeed_sgpio_reg reg)

You don't need inline. The compiler will inline it anyway if it
see the need for it.

The only time we really use inline is in header files, where we
want to point out that this function will be inlined as there is no
compiled code in header files.

> +#define GPIO_BANK(x)    ((x) >> 5)
> +#define GPIO_OFFSET(x)  ((x) & 0x1f)
> +#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))

OK seems fairly standard.

> +static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
> +static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
> +static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)

These are fairly standard.

> +static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
> +{
> +       struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gpio->lock, flags);
> +       gpio->dir_in[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> +       spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +       return 0;
> +}

There is a bug here. You fail to write the "val" to the output
line, which is the expected semantic of this call.

> +static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)

These are all very simple MMIO accessors.

If you made one gpio_chip per bank, you could just use gpio-mmio.c
to control the lines by

select GPIO_GENERIC

        ret = bgpio_init(chip, dev, 4,
                         base + GPIO_VAL_VALUE ,
                         NULL,
                         NULL,
                         NULL,
                         NULL,
                         0);

The MMIO gpio library takes care of shadowing the direction and all.
It also will implement get/set_multiple() for you for free.

So seriously consider making one gpio_chip per bank.

> +static inline void irqd_to_aspeed_sgpio_data(struct irq_data *d,
> +static void aspeed_sgpio_irq_ack(struct irq_data *d)
> +static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
> +static void aspeed_sgpio_irq_mask(struct irq_data *d)
> +static void aspeed_sgpio_irq_unmask(struct irq_data *d)
> +static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
> +static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +       struct irq_chip *ic = irq_desc_get_chip(desc);
> +       struct aspeed_sgpio *data = gpiochip_get_data(gc);
> +       unsigned int i, p, girq;
> +       unsigned long reg;
> +
> +       chained_irq_enter(ic, desc);
> +
> +       for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> +               const struct aspeed_sgpio_bank *bank = &aspeed_sgpio_banks[i];
> +
> +               reg = ioread32(bank_reg(data, bank, reg_irq_status));
> +
> +               for_each_set_bit(p, &reg, 32) {
> +                       girq = irq_find_mapping(gc->irq.domain, i * 32 + p);
> +                       generic_handle_irq(girq);
> +               }
> +
> +       }

This also gets really complex with one driver for all the banks.

> +       /* Disable IRQ and clear Interrupt status registers for all SPGIO Pins. */
> +       for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {

(...)
> +static int __init aspeed_sgpio_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_sgpio *gpio;
> +       u32 nr_gpios, sgpio_freq, sgpio_clk_div;
> +       int rc;
> +       unsigned long apb_freq;
> +
> +       /* initialize allocated memory with zeros */

No need for this comment, developers know what "kzalloc" means.

> +       rc = of_property_read_u32(pdev->dev.of_node, "bus-frequency", &sgpio_freq);
> +       if (rc < 0) {
> +               dev_err(&pdev->dev, "Could not read bus-frequency property\n");
> +               return -EINVAL;
> +       }
> +
> +       gpio->pclk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(gpio->pclk)) {
> +               dev_err(&pdev->dev, "devm_clk_get failed\n");
> +               return PTR_ERR(gpio->pclk);
> +       }
> +
> +       apb_freq = clk_get_rate(gpio->pclk);
> +
> +       /*
> +        * From the datasheet,
> +        *      SGPIO period = 1/PCLK * 2 * (GPIO254[31:16] + 1)
> +        *      period = 2 * (GPIO254[31:16] + 1) / PCLK
> +        *      frequency = 1 / (2 * (GPIO254[31:16] + 1) / PCLK)
> +        *      frequency = PCLK / (2 * (GPIO254[31:16] + 1))
> +        *      frequency * 2 * (GPIO254[31:16] + 1) = PCLK
> +        *      GPIO254[31:16] = PCLK / (frequency * 2) - 1
> +        */
> +       if (sgpio_freq == 0)
> +               return -EINVAL;
> +
> +       sgpio_clk_div = (apb_freq / (sgpio_freq * 2)) - 1;
> +
> +       if (sgpio_clk_div > (1 << 16) - 1)
> +               return -EINVAL;
> +
> +       iowrite32(FIELD_PREP(ASPEED_SGPIO_CLK_DIV_MASK, sgpio_clk_div) |
> +                 FIELD_PREP(ASPEED_SGPIO_PINS_MASK, (nr_gpios / 8)) |
> +                 ASPEED_SGPIO_ENABLE,
> +                 gpio->base + ASPEED_SGPIO_CTRL);

This is a separate clock driver.

Break this out as a separate clk device that the other GPIOs
grab.

Put this in drivers/clk/clk-aspeed-gpio.c or wherever appropriate
with some
reg = <0xnnnnnn54 4>;

Then let the GPIO driver grab this clock. This makes it possible
to use a per-gpio-bank split of the GPIO chips.

It looks a bit complicated but this will work so much better because
the clock code is in the clock subsystem and the GPIO is split up
and becomes a very small driver since it can use gpio MMIO.

Yours,
Linus Walleij
