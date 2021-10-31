Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180A8440EAF
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Oct 2021 14:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhJaNmM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 09:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhJaNmM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 09:42:12 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF99C061570;
        Sun, 31 Oct 2021 06:39:40 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g8so55669186edb.2;
        Sun, 31 Oct 2021 06:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HlMh35IhqIvGxxgOt31fGBtNAf8lyJLuXm2KrWmpoQY=;
        b=fIXezh6FIQdOq6A5ScpnfkFvsR8z+jhViy/eHjJOxwEAW2Js7Pbo7LOWsftM1b3MT0
         l9REuu/hBPWne+/qrtLjm+9/v33MZiXTiLqHhuHaReD6qS61U7sMsFWrK5gvfrKn6Mef
         jI5x/HxuV088g3pWzYEVY8gzP81PBcijRwEmPGxtzpWhel1cWdv8+4cArRWAAB+H8XkG
         p97dMMQ1faCVJ8+c775P6nqk5smHD2wqcVRaUF1Prw4hx6/mVCOLvD0hOeobY1+ydDn3
         aTtsetejf3eGmhrL50DtDUYC5Ka1zUi1s6wtEt/l/8U7NyhVffmLB4R/f9MUo/l024jX
         UoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HlMh35IhqIvGxxgOt31fGBtNAf8lyJLuXm2KrWmpoQY=;
        b=ZxKmHUvdB8R2irCcX4107GMSoAnbXq9wFHtEzJQPEkcHyHZG0hu60sGMk4w65WCK4Y
         e2ANhngPTEf3t8d1UOc07PyhmzJzXVzg7ItA2WLYCELoUhMe96yMxRG2olntYGNU9XHx
         GRdphxJanNxa+noP+pg3FNsy1hxGzab34SdUs4hp9obHEUKNEMeNxOJBT30TIVBVwWgN
         g1zwaQc8/64g7eL4meFThPE5wrqWr4G1yWkF89doNAzY6INBpBQyOKr7LqwNiR2G93PS
         wAWAaCpyvtXg6a4uP8QXxoErUhCgw1AHZxF9jVYn7Ed9EAMV6kureo8VEVYO6IbHeqln
         ZICA==
X-Gm-Message-State: AOAM532LRjWbtEYJab1QlzczccDg1v6ILKN4YhdDVNP5qwanYhzJ3B1Y
        dpHGyEjjOPDc0NEDlnXc9lO9wFfqjQ8PdYbIYI0=
X-Google-Smtp-Source: ABdhPJyqXbqAUnEL9XFKsNv9cd0DxL6zpCd3jmuJqoKmiy5Msq+cHTvCh8UuGU8iS5nlTm8QqnHQDzdvrjMSrogsbf0=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr26708325edf.224.1635687578842;
 Sun, 31 Oct 2021 06:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211026175815.52703-1-joey.gouly@arm.com> <20211026175815.52703-5-joey.gouly@arm.com>
In-Reply-To: <20211026175815.52703-5-joey.gouly@arm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 31 Oct 2021 15:39:01 +0200
Message-ID: <CAHp75Vc8-sZX-aMtR9o5_=_X0y6ALYCXR2W3Y4389=xD7c__nw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 27, 2021 at 5:28 AM Joey Gouly <joey.gouly@arm.com> wrote:
>
> This driver adds support for the pinctrl / GPIO hardware found
> on some Apple SoCs.

...

> +#include <dt-bindings/pinctrl/apple.h>

bits.h is missed

> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

...

> +struct regmap_config regmap_config = {
> +       .reg_bits = 32,
> +       .val_bits = 32,
> +       .reg_stride = 4,
> +       .cache_type = REGCACHE_FLAT,
> +       .max_register = 512 * sizeof(u32),
> +       .num_reg_defaults_raw = 512,
> +       .use_relaxed_mmio = true

Would be good to have a comma.

> +};

...

> +// No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register.

Wrong style.

...

> +static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
> +                                  unsigned int pin)
> +{
> +       unsigned int val = 0;
> +
> +       regmap_read(pctl->map, REG_GPIO(pin), &val);
> +       return val;

Better

unsigned int val;
int ret;

ret = regmap_read(...);
if (ret)
  return 0;

return val;

> +}

...

> +       ret = of_property_count_u32_elems(node, "pinmux");
> +       if (ret <= 0) {
> +               dev_err(pctl->dev,
> +                       "missing or empty pinmux property in node %pOFn.\n",
> +                       node);
> +               return ret;

This is incorrect. It always happens when somebody is in hurry :-)

> +       }

...

> +       apple_gpio_set_reg(
> +               pctl, group, REG_GPIOx_PERIPH | REG_GPIOx_INPUT_ENABLE,
> +               FIELD_PREP(REG_GPIOx_PERIPH, func) | REG_GPIOx_INPUT_ENABLE);

Strange indentation.

...

> +       return (FIELD_GET(REG_GPIOx_MODE, reg) == REG_GPIOx_OUT) ?
> +                      GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;

Easier to read with
 if ()
   return X
return Y

...

> +       apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA,
> +                          value ? REG_GPIOx_DATA : 0);

One line?

> +}


...

> +       struct apple_gpio_pinctrl *pctl =
> +               gpiochip_get_data(irq_data_get_irq_chip_data(data));

One line?

> +       unsigned int irqgrp =
> +               FIELD_GET(REG_GPIOx_GRP, apple_gpio_get_reg(pctl, data->hwirq));

Ditto.

> +       writel(BIT(data->hwirq & 31),

% 32 can also do and be more specific.

> +              pctl->base + REG_IRQ(irqgrp, data->hwirq));

One line?

...

> +static void apple_gpio_irq_mask(struct irq_data *data)
> +{
> +       struct apple_gpio_pinctrl *pctl =
> +               gpiochip_get_data(irq_data_get_irq_chip_data(data));

Missed blank line.

> +       apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
> +                          FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF));
> +}

...

> +       if (!of_property_read_bool(pctl->dev->of_node, "gpio-controller"))
> +               return dev_err_probe(pctl->dev, -ENODEV,
> +                                    "No gpio-controller property\n");

Still not sure why we need this check.

...

> +       pctl->gpio_chip.of_node = pctl->dev->of_node;

It should be done by the OF GPIO library.


> +               for (i = 0; i < girq->num_parents; i++) {

> +                       ret = platform_get_irq(to_platform_device(pctl->dev),
> +                                              i);

This looks ugly even if you take the 80 char rule to your heart (it
has exceptions and here is one of them).

...

> +       ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
> +out:

out_free_irq_data:

(or alike)

> +       kfree(girq->parents);
> +       kfree(irq_data);

...

> +       static const char* pinmux_functions[] = {
> +               "gpio", "periph1", "periph2", "periph3"
> +       };

...

I see it seems pending, so some of the above may be addressed with
follow up, some may be left unconsidered.

-- 
With Best Regards,
Andy Shevchenko
