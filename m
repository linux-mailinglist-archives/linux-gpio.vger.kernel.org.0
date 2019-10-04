Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEA1CC388
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 21:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730447AbfJDT16 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 15:27:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44404 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfJDT16 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 15:27:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id m13so7589108ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=axnij1y7FO8cXnb92aV+0qai4cKt140DN5gamj9hPfE=;
        b=ObR7AiEE5/zKN72wYmXDP+pegzvZELL/zjK6DehC4kCmB6fyHvpVInVt1O/Aq7eFls
         FWYrYwfTcG8O2tKuqjqBF8Fh83IwVc/eue1B7Pi6dcNO5b3ollxUKLIJXZga6kAtt+/b
         zKhhcITs4ourJFGnZMTY/2wbK0A/K/ep1IaEaX+rrgi35X1U3HrFhS0lDrQmjm4tourS
         Peh8xy6KnXgOuS1b4vUw0QkjvlB0lPgpu15OVfWjhFQcsZVbDsPvUs1fMHEC2wriNOeb
         /d+v7oTFAcpIzqQOpN/zBDKnu4uVEbMSlU1J9tylSiQTPuuNzDV4jrm8uHIstjsOyQiS
         7ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=axnij1y7FO8cXnb92aV+0qai4cKt140DN5gamj9hPfE=;
        b=TtND1152hZXNBtBfIDaZ3F1C35vvnKRMMMTdWSq86r3BHGO/6nbQ1zE44YE1rBkTPF
         3MdFWvAEnW6pH08DQUJS7YtyGJQ5lfsL9nhbB2JvCyqBf5XOulEJBfBNZYTazzju5kUm
         bm3U+QqnZeQnUfQyaPGTXg1ZmmaNP/WMVtWTnnIis3o0RHZUo8d6O76ltznahKdQaOCD
         9RJBSBoKK9H86pTGqqLkICJKNUz4TrKxAhe3NNIJnWQOepdVjBK50sg9DnNDhNJh75ZD
         9kDCDvkS/pznhLMLl5XANNmnJHSHHZaYAv6oHzICGp6NEfLWKp7jQ2vNrgbxKluU3gbB
         RweA==
X-Gm-Message-State: APjAAAXIp5nSz/RdQ/6g6PWWk5fRQO8Uf7r/43kwaZMIPkBRn78eUdev
        5toPkuCx+4joV6btbTQONt8IEQgU9QUysNdArtsHCw==
X-Google-Smtp-Source: APXvYqxkfoGOWQM8kSaXwz6sx32rmLZokTiTPvY72qNNOaDtrSDbtX2FfQakGUtFsX3FSyw6/zi7oNcbGSYQbiAnUBM=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr9166616ljc.99.1570217275180;
 Fri, 04 Oct 2019 12:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190917105902.445-1-m.felsch@pengutronix.de> <20190917105902.445-4-m.felsch@pengutronix.de>
In-Reply-To: <20190917105902.445-4-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 21:27:43 +0200
Message-ID: <CACRpkdbbmVo3hem1xFqtmq9-htg9+QUXQpZoSyffdTZQ5kUo5Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: da9062: add driver support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 17, 2019 at 12:59 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> be used as input, output or have a special use-case.
>
> The patch adds the support for the normal input/output use-case.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Nice to get this covered!

> +#define DA9062_TYPE(offset)            (4 * (offset % 2))
> +#define DA9062_PIN_SHIFT(offset)       (4 * (offset % 2))
> +#define DA9062_PIN_ALTERNATE           0x00 /* gpio alternate mode */

The there is pin control related to the DA9062, we should put the driver
in drivers/pinctrl/pinctrl-da9062.c from day one.

I am not saying you have to implement pin control from scratch, just
have it there and look at sibling drivers to make sure we don't
screw something up for also adding pin control later on.

> +int da9062_gpio_get_hwgpio(struct gpio_desc *desc)
> +{
> +       return gpio_chip_hwgpio(desc);
> +}
> +EXPORT_SYMBOL_GPL(da9062_gpio_get_hwgpio);

I would have to look at the other patch to see why this is needed.
Normally other drivers should just have their GPIOs assigned
like anyone else, no shortcuts into the hardware offsets
like this.

> +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> +       struct regmap *regmap = gpio->da9062->regmap;
> +       int gpio_dir, val;
> +       int ret;
> +
> +       gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);

This includes other things than the direction of the pin so call
the variable gpio_mode or something rather than gpio_dir.

> +       if (gpio_dir < 0)
> +               return gpio_dir;
> +
> +       switch (gpio_dir) {
> +       case DA9062_PIN_ALTERNATE:
> +               return -ENOTSUPP;

This is fine for now. Toss in a comment that we may add pin muxing
later.

> +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)

Same comments as above.

> +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> +                                      unsigned int offset)
> +{
> +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> +       struct regmap *regmap = gpio->da9062->regmap;
> +       struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
> +       unsigned int gpi_type;
> +       int ret;
> +
> +       ret = da9062_gpio_set_pin_mode(regmap, offset, DA9062_PIN_GPI);
> +       if (ret)
> +               return ret;

Fair enough.

> +       /*
> +        * If the gpio is active low we should set it in hw too. No worries
> +        * about gpio_get() because we read and return the gpio-level. So the
> +        * gpiolob active_low handling is still correct.

gpiolib?

> +        *
> +        * 0 - active low, 1 - active high
> +        */
> +       gpi_type = !gpiod_is_active_low(desc);
> +       return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >> 1),
> +                               DA9062AA_GPIO0_TYPE_MASK << DA9062_TYPE(offset),
> +                               gpi_type << DA9062_TYPE(offset));
> +}

So this does not affect the value out set by da9062_gpio_set()?

What is the electrical effect of this then, really? To me that seems like
something that is mostly going to be related to how interrupts
trigger (like whether to trig on rising or falling edge) and then it
should really be in the .set_type() callback, should it not?

> +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> +                                       unsigned int offset, int value)
> +{
> +       /* Push-Pull / Open-Drain options are configured during set_config */
> +       da9062_gpio_set(gc, offset, value);
> +
> +       return 0;
> +}

You probably want to make sure to clear the active low bit in this function,
right?

> +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> +                                 unsigned long config)
> +{
> +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> +       struct regmap *regmap = gpio->da9062->regmap;
> +       int gpio_dir;

Name this gpio_mode

> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +               /* PD only if pin is input */

Info from datasheet? Electrical limitation? Add to comment!

> +               gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> +               if (gpio_dir < 0)
> +                       return -EINVAL;
> +               else if (gpio_dir != DA9062_PIN_GPI)
> +                       return -ENOTSUPP;
> +               return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> +                                         BIT(offset), BIT(offset));
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +               /* PU only if pin is output open-drain */

Dito.

> +               gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> +               if (gpio_dir < 0)
> +                       return -EINVAL;
> +               else if (gpio_dir != DA9062_PIN_GPO_OD)
> +                       return -ENOTSUPP;
> +               return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> +                                         BIT(offset), BIT(offset));
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +               return da9062_gpio_set_pin_mode(regmap, offset,
> +                                               DA9062_PIN_GPO_OD);
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +               return da9062_gpio_set_pin_mode(regmap, offset,
> +                                               DA9062_PIN_GPO_PP);
> +       default:
> +               return -ENOTSUPP;
> +       }

Overall very nice use of this callback.

> +static int da9062_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> +       struct da9062 *da9062 = gpio->da9062;
> +
> +       return regmap_irq_get_virq(da9062->regmap_irq,
> +                                  DA9062_IRQ_GPI0 + offset);
> +}

That's interesting. I never saw that before. It's fine, I guess,
I can't figure out whether these slow expanders could be set as
hierarchical though, what do you think? Saw a comment on this
from Bartosz as well. But I generally trust his comment on that
it should be fine unless you have subnodes (i.e. hierarchy).

> +++ b/include/linux/mfd/da9062/gpio.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#ifndef __MFD_DA9062_GPIO_H__
> +#define __MFD_DA9062_GPIO_H__
> +
> +struct gpio_desc;
> +
> +int da9062_gpio_get_hwgpio(struct gpio_desc *desc);
> +
> +#endif /* __MFD_DA9062_GPIO_H__ */

So I'm sceptical about this and it needs a very good motivation.

Yours,
Linus Walleij
