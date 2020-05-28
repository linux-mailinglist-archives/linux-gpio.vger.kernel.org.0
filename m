Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59011E618A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 15:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389978AbgE1NAg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 09:00:36 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:59287 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389878AbgE1NAg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 09:00:36 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id A28B823E46;
        Thu, 28 May 2020 15:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590670832;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HnqwSqhEfKKElfbZhUYwQVFtjv0Sl5IiykXrrYQU2XU=;
        b=H+JUuohNjLZKG96hq3MTWzHEeHxlhZayBSCaOxLImMPoPyqvtiG+t2D2i21i3bku4fiYjo
        amw1JAGtdq6bE9XSUhEsfwkCCAtzFAaxU8hDBdEFpxI2R7ijTJk6sUmcu2pPAQ7Wa1gftP
        A6rK6cg+LxpOl1wFP/IUxI1cJBe6zMU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 28 May 2020 15:00:32 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [PATCH v5 2/2] gpio: add a reusable generic gpio_chip using
 regmap
In-Reply-To: <CAHp75VfQ64iz3qVPsZ+8z4fMQWphruB0FzzCTQPqZ9LkuhV6Ww@mail.gmail.com>
References: <20200528035841.16800-1-michael@walle.cc>
 <20200528035841.16800-3-michael@walle.cc>
 <CAHp75VfQ64iz3qVPsZ+8z4fMQWphruB0FzzCTQPqZ9LkuhV6Ww@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <fe83fd615eaae323dcc3d578b0e7d75a@walle.cc>
X-Sender: michael@walle.cc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2020-05-28 13:45, schrieb Andy Shevchenko:
> On Thu, May 28, 2020 at 7:04 AM Michael Walle <michael@walle.cc> wrote:
>> 
>> There are quite a lot simple GPIO controller which are using regmap to
>> access the hardware. This driver tries to be a base to unify existing
>> code into one place. This won't cover everything but it should be a 
>> good
>> starting point.
>> 
>> It does not implement its own irq_chip because there is already a
>> generic one for regmap based devices. Instead, the irq_chip will be
>> instantiated in the parent driver and its irq domain will be associate
>> to this driver.
>> 
>> For now it consists of the usual registers, like set (and an optional
>> clear) data register, an input register and direction registers.
>> Out-of-the-box, it supports consecutive register mappings and mappings
>> where the registers have gaps between them with a linear mapping 
>> between
>> GPIO offset and bit position. For weirder mappings the user can 
>> register
>> its own .xlate().
> 
> More comments from me below.

Thanks for the review.

> 
> ...
> 
> 
>>  # Device drivers. Generally keep list sorted alphabetically
> 
> Hmm...
> 
>> +obj-$(CONFIG_GPIO_REGMAP)      += gpio-regmap.o
>>  obj-$(CONFIG_GPIO_GENERIC)     += gpio-generic.o
> 
> ...is it?

That's because gpio-regmap.o seems not be a driver and more of a generic
thing (like gpio-generic.o) and gpio-generic.o has another rule two 
lines
below and I don't want to put gpio-regmap.o in between.

> 
> ...
> 
>> + * Copyright 2019 Michael Walle <michael@walle.cc>
> 
> 2020?
> 
> ...
> 
>> +#include <linux/gpio/driver.h>
>> +#include <linux/gpio-regmap.h>
> 
> Yes, I would like to see this as gpio/regmap.h (in gpio folder).
> 
> ...
> 
>> +static unsigned int gpio_regmap_addr(unsigned int addr)
>> +{
>> +       return (addr == GPIO_REGMAP_ADDR_ZERO) ? 0 : addr;
> 
> I would prefer rather to have
> if (...)
>  return 0;
> 
> return addr;
> 
> here, but any of them fine.

yes looks nicer.

> 
>> +}
> 
> ...
> 
>> +/**
>> + * gpio_regmap_simple_xlate() - translate base/offset to reg/mask
> 
> Don't you get plenty of complains from kernel doc validation script?

now that I know there is one, yes. there are many complains.

> 
> You forgot to describe all function parameters here.
> 
>> + *
>> + * Use a simple linear mapping to translate the offset to the 
>> bitmask.
>> + */

This is a leftover, I'm actually gonna remove it since its not exported
anymore.

> 
> ...
> 
>> +       return (val & mask) ? 1 : 0;
> 
> Hmm... many (new!) GPIO drivers are using !! instead of ternary. Can
> we do the same here?

ok

> 
> ...
> 
>> +static int gpio_regmap_get_direction(struct gpio_chip *chip,
>> +                                    unsigned int offset)
>> +{
> 
>> +       if (gpio->reg_dir_out_base) {
>> +               base = gpio_regmap_addr(gpio->reg_dir_out_base);
>> +               invert = 0;
>> +       } else if (gpio->reg_dir_in_base) {
>> +               base = gpio_regmap_addr(gpio->reg_dir_in_base);
>> +               invert = 1;
>> +       } else {
> 
>> +               return GPIO_LINE_DIRECTION_IN;
> 
> Hmm... Doesn't it an erroneous case and we basically shouldn't be here?

yeah, I'll return -EOPNOTSUPP. Better than just ignoring, right?

> 
>> +       }
> 
>> +       if (!!(val & mask) ^ invert)
>> +               return GPIO_LINE_DIRECTION_OUT;
> 
>> +       else
> 
> Redundant 'else'.

IMHO, That looks really strange. like it has nothing to do with the
if statement. I'd like to keep that one.

> 
>> +               return GPIO_LINE_DIRECTION_IN;
>> +}
> 
>> +static int gpio_regmap_set_direction(struct gpio_chip *chip,
>> +                                    unsigned int offset, bool output)
>> +{
> 
>> +       if (gpio->reg_dir_out_base) {
>> +               base = gpio_regmap_addr(gpio->reg_dir_out_base);
>> +               invert = 0;
>> +       } else if (gpio->reg_dir_in_base) {
>> +               base = gpio_regmap_addr(gpio->reg_dir_in_base);
>> +               invert = 1;
>> +       } else {
> 
>> +               return 0;
> 
> Question as above.

same answer ;)

> 
>> +       }
> 
>> +       if (!invert)
>> +               val = (output) ? mask : 0;
>> +       else
>> +               val = (output) ? 0 : mask;
> 
> Why not positive conditional?
> Also, too many parentheses.

ok

> 
>> +       return regmap_update_bits(gpio->regmap, reg, mask, val);
>> +}
> 
> ...
> 
>> +/**
>> + * gpio_regmap_register() - Register a generic regmap GPIO controller
> 
>> + *
> 
> Extra blank line.

didn't know that. so ok for all kind of these comments.

> 
>> + * @gpio: gpio_regmap device to register
>> + *
>> + * Returns 0 on success or an errno on failure.
>> + */
> 
> ...
> 
>> +       if (!config->label)
>> +               chip->label = dev_name(config->parent);
>> +       else
>> +               chip->label = config->label;
> 
> Why not positive or here even ternary may look good
> 
>         chip->label = config->label ?: dev_name(config->parent);

ok

> 
> ...
> 
>> +               ret = gpiochip_irqchip_add_domain(chip, 
>> config->irq_domain);
> 
>> +               if (ret < 0)
> 
> Does ' < 0' make sense?

more or less, I'll change it to "if (ret)"

> 
>> +                       goto err_remove_gpiochip;
> 
> ...
> 
>> +/**
>> + * gpio_regmap_unregister() - Unregister a generic regmap GPIO 
>> controller
> 
>> + *
> 
> Extra blank line
> 
>> + * @gpio: gpio_regmap device to unregister
>> + */
> 
> ...
> 
>> +/**
>> + * devm_gpio_regmap_register() - resource managed 
>> gpio_regmap_register()
> 
>> + *
> 
> Ditto.
> 
>> + * @dev: device that is registering this GPIO device
>> + * @gpio: gpio_regmap device to register
>> + *
>> + * Managed gpio_regmap_register(). For generic regmap GPIO device 
>> registered by
>> + * this function, gpio_regmap_unregister() is automatically called on 
>> driver
>> + * detach. See gpio_regmap_register() for more information.
>> + */
> 
> ...
> 
>> +       gpio = gpio_regmap_register(config);
> 
>> +
> 
> Extra blank line.

ok

>> +       if (!IS_ERR(gpio)) {
>> +               *ptr = gpio;
>> +               devres_add(dev, ptr);
>> +       } else {
>> +               devres_free(ptr);
>> +       }
> 
> ...
> 
>> +#ifndef _LINUX_GPIO_REGMAP_H
>> +#define _LINUX_GPIO_REGMAP_H
>> +
> 
> Missed a lot, i.e.
> 
> struct device;
> struct irq_domain;
> struct regmap;

oops. right.

> 
>> +struct gpio_regmap;
>> +
>> +#define GPIO_REGMAP_ADDR_ZERO ((unsigned long)(-1))
>> +#define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
>> +
>> +/**
>> + * struct gpio_regmap_config - Description of a generic regmap 
>> gpio_chip.
> 
>> + *
> 
> Extra blank line.
> 
>> + * @parent:            The parent device
>> + * @regmap:            The regmap used to access the registers
>> + *                     given, the name of the device is used
>> + * @label:             (Optional) Descriptive name for GPIO 
>> controller.
>> + *                     If not given, the name of the device is used.
>> + * @ngpio:             Number of GPIOs
> 
>> + * @names:             (Optional) Array of names for gpios
> 
> I don't see it. You really need to enable kernel doc validation 
> warnings.

I've already noticed that in another mail.

> 
>> + * @reg_dat_base:      (Optional) (in) register base address
>> + * @reg_set_base:      (Optional) set register base address
>> + * @reg_clr_base:      (Optional) clear register base address
>> + * @reg_dir_in_base:   (Optional) in setting register base address
>> + * @reg_dir_out_base:  (Optional) out setting register base address
>> + * @reg_stride:                (Optional) May be set if the registers 
>> (of the
>> + *                     same type, dat, set, etc) are not consecutive.
>> + * @ngpio_per_reg:     Number of GPIOs per register
>> + * @irq_domain:                (Optional) IRQ domain if the 
>> controller is
>> + *                     interrupt-capable
>> + * @reg_mask_xlate:     (Optional) Translates base address and GPIO
>> + *                     offset to a register/bitmask pair. If not
>> + *                     given the default gpio_regmap_simple_xlate()
>> + *                     is used.
>> + *
>> + * The reg_mask_xlate translates a given base address and GPIO offset 
>> to
> 
> 'reg_mask_xlate' ->  '->reg_mask_xlate()' or '@reg_mask_xlate' or
> special C function reference for kernel doc.
> 
>> + * register and mask pair. The base address is one of the given 
>> reg_*_base.
> 
> 'reg_*_base' -> 'register base addresses in this structure' ?
> 
>> + *
>> + * All base addresses may have the special value 
>> GPIO_REGMAP_ADDR_ZERO
>> + * which forces the address to the value 0.
> 
> Also, since we have no separate documentation, describe the rules,
> that some of the registers are actually required, and some maybe in
> conflict (these rules you have in register function).

ok

-michael
