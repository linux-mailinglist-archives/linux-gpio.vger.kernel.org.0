Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E62C2D07FB
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 00:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgLFXNm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 18:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbgLFXNm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Dec 2020 18:13:42 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC63AC0613D1
        for <linux-gpio@vger.kernel.org>; Sun,  6 Dec 2020 15:13:01 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id u19so15411660lfr.7
        for <linux-gpio@vger.kernel.org>; Sun, 06 Dec 2020 15:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sZQfoLnXFAPIemhCQbHqBClIHGxcIWwkYY30wVQIjgM=;
        b=G7cHQPLYzozXqUpT9OdSrGjS6i2rZK1/3iIJS+CiC2JlHZ+kweyfS/C/liYHX0+yZN
         2MrBUrEdvPvt2QsC0C4szIv5YEhlGv2SCP2E6vr9ZO83cTME4W7EUZ0uFEFVJN9/p7Ep
         J8ZG5p1L6/++32BsFj9AmMf1G4jc5saCu2DVImxrcyLxVBRbDh8I10NC4jesCWXlLhWw
         GTFqdfDX6uWmwMY3xtMwZA7yMaP6gAvi8GQNcZj6aFU2dgEHolFKZBnJd16rXT3hN1tP
         ngoOokyqhLfvb0CiZd8OqXBAv4+DKN0b+gGM4K9dEx01p9FqaymCpOcDocRFKYKLDmXV
         S/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sZQfoLnXFAPIemhCQbHqBClIHGxcIWwkYY30wVQIjgM=;
        b=HzSaR0U4PgxeHbCgKrOLpQYhQZGc0KS4nprnST8uT3lxeLduRLZRqZ7ZF3RIZ86+6r
         IG9TR61AJdCynk8WD8FNAkbs8iMEK0+tcuRblY7KNhstET8aGyDJcSkE2uVdDS7Lb1W/
         MOLIcQ85fUu0FXwgukbv15NtNKPkIbxxZHPB/9OT/wQFS+qc+yop0qE+BNgrO1AZ4cHR
         wsdWfH+CRVXBwOqTAOw9+QuzTUDS+Ca6s/FKTC6UtY3E9AiKa1kZJFfxmBZMV5oJi6OW
         qWYLmEE+7PmLGCs3P3bWk8pp+AOz4VsuYx3rc2DQH3IvgsQy/3UXZrBs633UlGSu+hcw
         fLow==
X-Gm-Message-State: AOAM531MxVtpqCTjhsTUqnZJFd7Dywd9jxPyduTt2Tu0zx6gS7zv43KP
        jtqW9IYLoLRgsHg/TNwVzdn0lfxLcSWr8LBYzG3ePw==
X-Google-Smtp-Source: ABdhPJynPRWRPOreE+TXZJ2tcTh8mBoVBiKYumIojnUQM1hD0jjPGLq+3v/aOXk/pB5RdMFpyMDKN/fXK1rySXjM5SE=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr6755975lfh.260.1607296379983;
 Sun, 06 Dec 2020 15:12:59 -0800 (PST)
MIME-Version: 1.0
References: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com> <1606901543-8957-2-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1606901543-8957-2-git-send-email-luojiaxing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Dec 2020 00:12:48 +0100
Message-ID: <CACRpkdbodato7AL4xv-oEO9+-Mo9fDaH+jZh+6T=3urE0tbULw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Luo!

thanks for your patch! I see that Andy already provided a crowd
of comments, here are some more!

On Wed, Dec 2, 2020 at 10:32 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:

> +config GPIO_HISI
> +       tristate "HISILICON GPIO controller driver"
> +       depends on (ARM64 && ACPI) || COMPILE_TEST
> +       select GPIO_GENERIC

Thanks for using the generic driver!

> +#include <linux/acpi.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +#include "gpiolib.h"
> +#include "gpiolib-acpi.h"

No GPIO drivers should include these files. If you need
gpiolib.h then describe in a comment right above the include
why you have to do this.

I don't know about gpiolig-acpi.h but not unless  Andy
says it is OK it is not OK.

> +#define HISI_GPIO_SWPORT_DR_SET_WX     0x0
> +#define HISI_GPIO_SWPORT_DR_CLR_WX     0x4
> +#define HISI_GPIO_SWPORT_DDR_SET_WX    0x10
> +#define HISI_GPIO_SWPORT_DDR_CLR_WX    0x14
> +#define HISI_GPIO_SWPORT_DDR_ST_WX     0x18
> +#define HISI_GPIO_INTEN_SET_WX         0x20
> +#define HISI_GPIO_INTEN_CLR_WX         0x24
> +#define HISI_GPIO_INTMASK_SET_WX       0x30
> +#define HISI_GPIO_INTMASK_CLR_WX       0x34
> +#define HISI_GPIO_INTTYPE_EDGE_SET_WX  0x40
> +#define HISI_GPIO_INTTYPE_EDGE_CLR_WX  0x44
> +#define HISI_GPIO_INT_POLARITY_SET_WX  0x50
> +#define HISI_GPIO_INT_POLARITY_CLR_WX  0x54
> +#define HISI_GPIO_DEBOUNCE_SET_WX      0x60
> +#define HISI_GPIO_DEBOUNCE_CLR_WX      0x64
> +#define HISI_GPIO_INTSTATUS_WX         0x70
> +#define HISI_GPIO_PORTA_EOI_WX         0x78
> +#define HISI_GPIO_EXT_PORT_WX          0x80
> +#define HISI_GPIO_INTCOMB_MASK_WX      0xa0
> +#define HISI_GPIO_INT_DEDGE_SET                0xb0
> +#define HISI_GPIO_INT_DEDGE_CLR                0xb4
> +#define HISI_GPIO_INT_DEDGE_ST         0xb8

Nice idea with the double edge register! Hats off to the hardware
engineer who created this simple yet powerful GPIO.

> +#define HISI_GPIO_REG_SIZE     0x4
> +#define HISI_GPIO_REG_MAX      0x100
> +#define HISI_GPIO_PIN_NUM_MAX 32

This seems like a bit surplus definitions, I prefer to just inline
these. Some use cases will go away after you start using
bgpio_init().

> +struct hisi_gpio {
> +       struct device           *dev;
> +       void __iomem            *reg_base;
> +       unsigned int            pin_num;

I prefer "line_num", the reason I usually use the term "lines"
rather than "pins" is that some GPIO lines are internal in
chips and do not always go out to external pins.

> +       struct gpio_chip        chip;
> +       struct irq_chip         irq_chip;
> +       int                     irq;

Do you need to keep irq around in the state?

> +static inline u32 hisi_gpio_read_reg(struct gpio_chip *chip,
> +                                    unsigned int off)
> +{
> +       struct hisi_gpio *hisi_gpio =
> +                       container_of(chip, struct hisi_gpio, chip);
> +
> +       return chip->read_reg(hisi_gpio->reg_base + off);
> +}
> +
> +static inline void hisi_gpio_write_reg(struct gpio_chip *chip,
> +                                      unsigned int off, u32 val)
> +{
> +       struct hisi_gpio *hisi_gpio =
> +                       container_of(chip, struct hisi_gpio, chip);
> +
> +       chip->write_reg(hisi_gpio->reg_base + off, val);
> +}

OK it is a bit of reusing the register accessors inside the
GPIO chip generic MMIO abstraction, but to me it is really
better if you just address the registers directly.
The indirections through read_reg/write_reg doesn't
really buy you anything.

> +static void hisi_gpio_set_debounce(struct gpio_chip *chip, unsigned int off,
> +                                  u32 debounce)
> +{
> +       unsigned long mask = BIT(off);
> +
> +       if (debounce)
> +               hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_SET_WX, mask);
> +       else
> +               hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_CLR_WX, mask);
> +}

So debounce is just on/off? No ability to set "how much" or a timer?
Someone must be guessing inside the block that a certain number
of ms is perfect(TM) debouncing or is there a register for this that
you are not showing us? Like register 0x68 or 0x6c...

> +static int hisi_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
> +static int hisi_gpio_direction_output(struct gpio_chip *chip,
> +                                     unsigned int gpio,
> +                                     int val)
> +static int hisi_gpio_direction_input(struct gpio_chip *chip,
> +                                    unsigned int gpio)

These get replaced by the appropriate parameters to bgpio_init().
Read the doc in gpio-mmci.c above the function
bgpio_init() for help. If you still can't figure it out, ask and
describe your problem and we'll hash it out.

> +       /*
> +        * The dual-edge interrupt and other interrupt's registers do not
> +        * take effect at the same time. The registers of the two-edge
> +        * interrupts have higher priorities, the configuration of
> +        * the dual-edge interrupts must be disabled before the configuration
> +        * of other kind of interrupts.
> +        */
> +       if (type != IRQ_TYPE_EDGE_BOTH) {
> +               unsigned int both = hisi_gpio_read_reg(chip, HISI_GPIO_INT_DEDGE_ST);
> +
> +               if (both & mask)
> +                       hisi_gpio_write_reg(chip, HISI_GPIO_INT_DEDGE_CLR, mask);
> +       }

Nice with this comment and overall the IRQ code looks very
good. Nice job!

> +static void hisi_gpio_irq_enable(struct irq_data *d)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +
> +       hisi_gpio_irq_clr_mask(d);
> +       hisi_gpio_write_reg(chip, HISI_GPIO_INTEN_SET_WX, BIT(irqd_to_hwirq(d)));
> +}
> +
> +static void hisi_gpio_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +
> +       hisi_gpio_irq_set_mask(d);
> +       hisi_gpio_write_reg(chip, HISI_GPIO_INTEN_CLR_WX, BIT(irqd_to_hwirq(d)));
> +}

Interesting with a GPIO hardware that both as enable and mask
bits. I can't see why, usually they just have masks but I suppose
there is some reason.

> +static void hisi_gpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct hisi_gpio *hisi_gpio = irq_desc_get_handler_data(desc);
> +       u32 irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip,
> +                                        HISI_GPIO_INTSTATUS_WX);
> +       struct irq_chip *irq_c = irq_desc_get_chip(desc);
> +
> +       chained_irq_enter(irq_c, desc);
> +       while (irq_msk) {
> +               int hwirq = fls(irq_msk) - 1;
> +               int gpio_irq = irq_find_mapping(hisi_gpio->chip.irq.domain,
> +                                               hwirq);
> +
> +               generic_handle_irq(gpio_irq);
> +               irq_msk &= ~BIT(hwirq);
> +       }

What about just:

     for_each_set_bit(hwirq, &irq_msk, gc->ngpio)

generic_handle_irq(irq_find_mapping(hisi_gpio->chip.irq.domain,
                                                            hwirq));

> +       device_for_each_child_node(dev, fwnode)  {
> +               if (fwnode_property_read_u32(fwnode, "hisi-ngpio",
> +                                            &hisi_gpio->pin_num)) {
> +                       dev_err(dev,
> +                               "failed to get number of gpios for port%d and use default value instead\n",
> +                               idx);
> +                       hisi_gpio->pin_num = HISI_GPIO_PIN_NUM_MAX;
> +               }

Since the registers are only 32 bits suppose this should emit a
fat warning if line_num is > 32.

> +       dat = hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX;
> +       set = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_SET_WX;
> +       clr = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX;
> +
> +       res = bgpio_init(&hisi_gpio->chip, hisi_gpio->dev, HISI_GPIO_REG_SIZE, dat, set,
> +                        clr, NULL, NULL, 0);

That's a lot of variables for my taste, I usually just pass the registers
to the bgpio_init() call directly, split across a few lines, but it is a
matter of taste. Make sure you get the direction setting to be handled
by gpio-mmio as well as described above.

> +       hisi_gpio->chip.direction_output = hisi_gpio_direction_output;
> +       hisi_gpio->chip.direction_input = hisi_gpio_direction_input;
> +       hisi_gpio->chip.get_direction = hisi_gpio_get_direction;

So these should be handled by generic GPIO.

> +       hisi_gpio->chip.set_config = hisi_gpio_set_config;
> +       hisi_gpio->chip.ngpio = hisi_gpio->pin_num;
> +       hisi_gpio->chip.base = -1;

But these are fine.

Apart from this address everything Andy commented on as well.

Yours,
Linus Walleij
