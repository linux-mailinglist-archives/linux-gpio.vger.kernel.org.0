Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D744B1E5E9D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 13:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388496AbgE1LpV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 07:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388444AbgE1LpT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 07:45:19 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D812BC05BD1E;
        Thu, 28 May 2020 04:45:19 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q16so11461322plr.2;
        Thu, 28 May 2020 04:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGeU9nSSHvzDDz0Omr5isHstGao1ofJB+4/XFaj76qM=;
        b=loxfO3OR5kMvicgWjZZFDN3vshSCiiPd8CYfHEpAPukrV3fvZQctZZ6ypSLO3fIB/j
         GrQ9Ph7EsABaRXjpTz3WdSGg4EjJmFl8CvsGFGflclNPgV9OAkBLH93ENN6R9a9FdiGF
         1XTi02esZR+GfnaYhp5pVRAAtMZXh5fWmVWYPTlFRicP4gYCF4Gv6dIU0E8L1H/JiVPa
         JLDkc2xuuhip89HHz+QUOZB7fkyKuArB601M5wWkxl3zkwFfWRZzY7SXERxymaMQQnAh
         d2SBz66lYeOpwq6yPjWA5Qk18dJ727P+1bEd49rXBSpLtA3JqQothjdN96g0uwP5sf99
         hubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGeU9nSSHvzDDz0Omr5isHstGao1ofJB+4/XFaj76qM=;
        b=eIooubKXTJTIxwUE7dbVYVZO3Z9bb/KedChOJPdkmdhEof27qUrMCNVSu6W3gGxuw/
         oHMrjNbVoFh7w7u3ey2It+KQ/+eCUl1CXDiXnO+P9nBLGGfqm4dbOpnL/1DrwtTJS9zs
         AuhgPQqZIc9lNHpQAgKarlHwQzb9Vgu6k7DDnAEBeNHYajwvGlvZx2EHeMnRS2LYUypM
         qFVw2iSkam6SjZidyCS/e8N5CurmUVrL3Pe2+4flAERQe9O1oRXKwMYHxSuVF9TH0Tx8
         rhV9QfK+ZN7oqzfWi8Adg9yJmNGRiCYyDz+2469qRGnfSuA2fbe5BLanKkWxIyJsAzAh
         5qoQ==
X-Gm-Message-State: AOAM533B9B3u6q8vcoRTs+RYuEuu+0MK+DlEFpd5Vg+CSI8dt6zYS0fn
        AEb+9F4WGsZ05s2zQQO+bLvPeHjw0Nudo5436Vs=
X-Google-Smtp-Source: ABdhPJy/0xinA6Eh9954StG7SLYKKvaslfQVkPZryio0trpe1mSf/GoABL31SVZdAbE/Ztxbt7zpFfpqixE9H7GzGHw=
X-Received: by 2002:a17:90b:113:: with SMTP id p19mr3448621pjz.129.1590666319289;
 Thu, 28 May 2020 04:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200528035841.16800-1-michael@walle.cc> <20200528035841.16800-3-michael@walle.cc>
In-Reply-To: <20200528035841.16800-3-michael@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 May 2020 14:45:07 +0300
Message-ID: <CAHp75VfQ64iz3qVPsZ+8z4fMQWphruB0FzzCTQPqZ9LkuhV6Ww@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: add a reusable generic gpio_chip using regmap
To:     Michael Walle <michael@walle.cc>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 28, 2020 at 7:04 AM Michael Walle <michael@walle.cc> wrote:
>
> There are quite a lot simple GPIO controller which are using regmap to
> access the hardware. This driver tries to be a base to unify existing
> code into one place. This won't cover everything but it should be a good
> starting point.
>
> It does not implement its own irq_chip because there is already a
> generic one for regmap based devices. Instead, the irq_chip will be
> instantiated in the parent driver and its irq domain will be associate
> to this driver.
>
> For now it consists of the usual registers, like set (and an optional
> clear) data register, an input register and direction registers.
> Out-of-the-box, it supports consecutive register mappings and mappings
> where the registers have gaps between them with a linear mapping between
> GPIO offset and bit position. For weirder mappings the user can register
> its own .xlate().

More comments from me below.

...


>  # Device drivers. Generally keep list sorted alphabetically

Hmm...

> +obj-$(CONFIG_GPIO_REGMAP)      += gpio-regmap.o
>  obj-$(CONFIG_GPIO_GENERIC)     += gpio-generic.o

...is it?

...

> + * Copyright 2019 Michael Walle <michael@walle.cc>

2020?

...

> +#include <linux/gpio/driver.h>
> +#include <linux/gpio-regmap.h>

Yes, I would like to see this as gpio/regmap.h (in gpio folder).

...

> +static unsigned int gpio_regmap_addr(unsigned int addr)
> +{
> +       return (addr == GPIO_REGMAP_ADDR_ZERO) ? 0 : addr;

I would prefer rather to have
if (...)
 return 0;

return addr;

here, but any of them fine.

> +}

...

> +/**
> + * gpio_regmap_simple_xlate() - translate base/offset to reg/mask

Don't you get plenty of complains from kernel doc validation script?

You forgot to describe all function parameters here.

> + *
> + * Use a simple linear mapping to translate the offset to the bitmask.
> + */

...

> +       return (val & mask) ? 1 : 0;

Hmm... many (new!) GPIO drivers are using !! instead of ternary. Can
we do the same here?

...

> +static int gpio_regmap_get_direction(struct gpio_chip *chip,
> +                                    unsigned int offset)
> +{

> +       if (gpio->reg_dir_out_base) {
> +               base = gpio_regmap_addr(gpio->reg_dir_out_base);
> +               invert = 0;
> +       } else if (gpio->reg_dir_in_base) {
> +               base = gpio_regmap_addr(gpio->reg_dir_in_base);
> +               invert = 1;
> +       } else {

> +               return GPIO_LINE_DIRECTION_IN;

Hmm... Doesn't it an erroneous case and we basically shouldn't be here?

> +       }

> +       if (!!(val & mask) ^ invert)
> +               return GPIO_LINE_DIRECTION_OUT;

> +       else

Redundant 'else'.

> +               return GPIO_LINE_DIRECTION_IN;
> +}

> +static int gpio_regmap_set_direction(struct gpio_chip *chip,
> +                                    unsigned int offset, bool output)
> +{

> +       if (gpio->reg_dir_out_base) {
> +               base = gpio_regmap_addr(gpio->reg_dir_out_base);
> +               invert = 0;
> +       } else if (gpio->reg_dir_in_base) {
> +               base = gpio_regmap_addr(gpio->reg_dir_in_base);
> +               invert = 1;
> +       } else {

> +               return 0;

Question as above.

> +       }

> +       if (!invert)
> +               val = (output) ? mask : 0;
> +       else
> +               val = (output) ? 0 : mask;

Why not positive conditional?
Also, too many parentheses.

> +       return regmap_update_bits(gpio->regmap, reg, mask, val);
> +}

...

> +/**
> + * gpio_regmap_register() - Register a generic regmap GPIO controller

> + *

Extra blank line.

> + * @gpio: gpio_regmap device to register
> + *
> + * Returns 0 on success or an errno on failure.
> + */

...

> +       if (!config->label)
> +               chip->label = dev_name(config->parent);
> +       else
> +               chip->label = config->label;

Why not positive or here even ternary may look good

        chip->label = config->label ?: dev_name(config->parent);

...

> +               ret = gpiochip_irqchip_add_domain(chip, config->irq_domain);

> +               if (ret < 0)

Does ' < 0' make sense?

> +                       goto err_remove_gpiochip;

...

> +/**
> + * gpio_regmap_unregister() - Unregister a generic regmap GPIO controller

> + *

Extra blank line

> + * @gpio: gpio_regmap device to unregister
> + */

...

> +/**
> + * devm_gpio_regmap_register() - resource managed gpio_regmap_register()

> + *

Ditto.

> + * @dev: device that is registering this GPIO device
> + * @gpio: gpio_regmap device to register
> + *
> + * Managed gpio_regmap_register(). For generic regmap GPIO device registered by
> + * this function, gpio_regmap_unregister() is automatically called on driver
> + * detach. See gpio_regmap_register() for more information.
> + */

...

> +       gpio = gpio_regmap_register(config);

> +

Extra blank line.

> +       if (!IS_ERR(gpio)) {
> +               *ptr = gpio;
> +               devres_add(dev, ptr);
> +       } else {
> +               devres_free(ptr);
> +       }

...

> +#ifndef _LINUX_GPIO_REGMAP_H
> +#define _LINUX_GPIO_REGMAP_H
> +

Missed a lot, i.e.

struct device;
struct irq_domain;
struct regmap;

> +struct gpio_regmap;
> +
> +#define GPIO_REGMAP_ADDR_ZERO ((unsigned long)(-1))
> +#define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
> +
> +/**
> + * struct gpio_regmap_config - Description of a generic regmap gpio_chip.

> + *

Extra blank line.

> + * @parent:            The parent device
> + * @regmap:            The regmap used to access the registers
> + *                     given, the name of the device is used
> + * @label:             (Optional) Descriptive name for GPIO controller.
> + *                     If not given, the name of the device is used.
> + * @ngpio:             Number of GPIOs

> + * @names:             (Optional) Array of names for gpios

I don't see it. You really need to enable kernel doc validation warnings.

> + * @reg_dat_base:      (Optional) (in) register base address
> + * @reg_set_base:      (Optional) set register base address
> + * @reg_clr_base:      (Optional) clear register base address
> + * @reg_dir_in_base:   (Optional) in setting register base address
> + * @reg_dir_out_base:  (Optional) out setting register base address
> + * @reg_stride:                (Optional) May be set if the registers (of the
> + *                     same type, dat, set, etc) are not consecutive.
> + * @ngpio_per_reg:     Number of GPIOs per register
> + * @irq_domain:                (Optional) IRQ domain if the controller is
> + *                     interrupt-capable
> + * @reg_mask_xlate:     (Optional) Translates base address and GPIO
> + *                     offset to a register/bitmask pair. If not
> + *                     given the default gpio_regmap_simple_xlate()
> + *                     is used.
> + *
> + * The reg_mask_xlate translates a given base address and GPIO offset to

'reg_mask_xlate' ->  '->reg_mask_xlate()' or '@reg_mask_xlate' or
special C function reference for kernel doc.

> + * register and mask pair. The base address is one of the given reg_*_base.

'reg_*_base' -> 'register base addresses in this structure' ?

> + *
> + * All base addresses may have the special value GPIO_REGMAP_ADDR_ZERO
> + * which forces the address to the value 0.

Also, since we have no separate documentation, describe the rules,
that some of the registers are actually required, and some maybe in
conflict (these rules you have in register function).

> + */

-- 
With Best Regards,
Andy Shevchenko
