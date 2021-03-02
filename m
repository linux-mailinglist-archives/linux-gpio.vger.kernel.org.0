Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A8E32ACFE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448177AbhCBVS4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1578601AbhCBPZZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:25:25 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D130DC061356
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:20:47 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b1so21077613lfb.7
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cEfoHf83s/nppCpslFBm2JaQs5ooxd+wCNySTYqRLrg=;
        b=ZJvvs7YpZ/v82uircBUdvlFwywAJ6JQXf6yaNLeLEx1ezcq4xouLe1KiOdpmq2WO+K
         yQi5MUw3HpKmdjGCuYgV1N+z8daa6FmEwQiZyZk4fXbq1ygHmp71fIxcN6kPpnydM5PZ
         2Y8RQPe6RexZGPlKsqkbrFT+y5Ky68ZqFnnU75jnh8IJyCUtuOuVUhHaFsb3GbjnUHye
         TAmTMJ3NcUGrf1X359md9oPTRDV24QXbPhYpLP/nx0IoklMtgExYj1Il7aBxS3NQDver
         5Fyp0QZijh5mr6qw8zQvVBOpczZzL4ETPy6ZqrGQTNaOUCWX8VnIpI2JrAgnh42rBLxV
         0wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cEfoHf83s/nppCpslFBm2JaQs5ooxd+wCNySTYqRLrg=;
        b=rqy0rshlCy8o+l+u13oajsrJzKCN5j1VYe7DFQ9T4v3WCteg2Gt2Pbgt1JimfUA87n
         pZ++ZISQFqe/0G7hZeL/L3M6XVJgqTWxuvrgmxf2S5sa0zgw40h6DUQpnF2nT2Qdvg7c
         qUzZWJ/hEoVPIvBQQCX2UkmCdWhYyL9MbZJEm2SjURF+ZbzsqEX2O2vr//pk4wRa/iGi
         Zs6W7dVbkUwIay0qf9jYs3pTbr9Z8CYbqA5pkjXqa0JW8eUyxSiE3+xH02UaZFDec7Rq
         FlN54r+Bu5b8+W7rF+fE11Puu3SgGSBesYGb0OaxP0z4aziGEh8WJkLd5CyPiGZOSF4a
         bdHw==
X-Gm-Message-State: AOAM533lwLDJpG8N112Stm5sDe3q7bl4bW9OAro41GwAgx3hzK4/vauQ
        krgtQFKFo5Fpk/RuNMINpjUzMUCLFtSSbBO6paIgXw==
X-Google-Smtp-Source: ABdhPJzevMNFMunFXoFZ2HXPdNU9EPe6ZLvEUgVA+ngmmU2uY8vloaBM7p1WkOCz4RiwZbRP0gmr+zQUAQo/hObUIWA=
X-Received: by 2002:ac2:5d21:: with SMTP id i1mr12066700lfb.649.1614698446288;
 Tue, 02 Mar 2021 07:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-3-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-3-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:20:35 +0100
Message-ID: <CACRpkdbxAQTft8dapGqBDxM8nbkPvK4i95ND0JBFb_riafZSSg@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: add a pincontrol driver for BCM6328
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi =C3=81lvaro,

thanks for your patch!

On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add a pincontrol driver for BCM6328. BCM628 supports muxing 32 pins as
> GPIOs, as LEDs for the integrated LED controller, or various other
> functions. Its pincontrol mux registers also control other aspects, like
> switching the second USB port between host and device mode.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Thanks for working on this. This SoC definitely need to come upstream.

I think this driver can be simplified a bit and reuse some core infrastruct=
ure
to make it more maintainable. It might be a bit of challenge but definitely
worth it!

> +config PINCTRL_BCM6328
> +       bool "Broadcom BCM6328 GPIO driver"
> +       depends on OF_GPIO && (BMIPS_GENERIC || COMPILE_TEST)
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select MFD_SYSCON
> +       default BMIPS_GENERIC
> +       help
> +          Say Y here to enable the Broadcom BCM6328 GPIO driver.

I suggest

select GPIO_REGMAP
select GPIOLIB_IRQCHIP
select IRQ_DOMAIN_HIERARCHY

see below.

(...)
> +#include <linux/bitops.h>

Just <linux/bits.h> maybe, if you only use BIT() and GENMASK().

> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>

Do not include these, just:
#include <linux/gpio/driver.h>

> +#define BCM6328_DIROUT_REG     0x04
> +#define BCM6328_DATA_REG       0x0c
> +#define BCM6328_MODE_REG       0x18

This looks very much like it could use GPIO_REGMAP.
Can you look at:
drivers/gpio/gpio-regmap.c
drivers/gpio/gpio-sl28cpld.c

And see if you can do what that driver is doing and reuse
this core infrastructure?

> +static inline unsigned int bcm6328_bank_pin(unsigned int pin)
> +{
> +       return pin % PINS_PER_BANK;
> +}

I am generally reluctant about registering several banks/instances
of the GPIO if it is possible to just use more devices in the
device tree, like one for each instance.

> +static inline unsigned int bcm6328_reg_off(unsigned int reg, unsigned in=
t pin)
> +{
> +       return reg - (pin / PINS_PER_BANK) * BANK_SIZE;
> +}

Because it leads to this kind of weirdness to split out the devices
from the main device in practice.

> +static int bcm6328_gpio_direction_input(struct gpio_chip *chip,
> +                                       unsigned int pin)
> +{
(...)
> +       /*
> +        * Check with the pinctrl driver whether this pin is usable as
> +        * an input GPIO
> +        */
> +       ret =3D pinctrl_gpio_direction_input(chip->base + pin);
> +       if (ret)
> +               return ret;

This is very nice.

> +static int bcm6328_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
> +{
> +       char irq_name[7];
> +
> +       sprintf(irq_name, "gpio%d", gpio);
> +
> +       return of_irq_get_byname(chip->of_node, irq_name);
> +}

This is a clear indication that we are dealing with a hierarchical irqchip.

My assumption is that you have one IRQ per GPIO line, so each
GPIO has a dedicated IRQ on the interrupt controller. Correct?

This means:

- Do not add all the interrupts into the device tree by name.

- In Kconfig select GPIOLIB_IRQCHIP, select IRQ_DOMAIN_HIERARCHY

- Populate a simple struct gpio_irq_chip, if no local registers need
  updating on interrupts, just pass interrupts through
        .irq_mask       =3D irq_chip_mask_parent,
        .irq_unmask     =3D irq_chip_unmask_parent,
  etc.

- Implement bcm6328_gpio_child_to_parent_hwirq() for this chip
  with hardcoded mappings between the hardware GPIO and interrupt
  lines, using the parent interrupt controller hierarchically. This mapping
  is determined from the compatible-string, and part of the property
  of how the GPIO block is integrated with the SoC. If need be to
  tell different chips apart, more precise compatible strings are needed.

- Examples:
  drivers/gpio/gpio-ixp4xx.c
  drivers/gpio/gpio-sifive.c

If you do this you will notice the core is more helpful to cut down on the
code.

Yours,
Linus Walleij
