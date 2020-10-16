Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EDE290A0F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 18:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410936AbgJPQ4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 12:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410921AbgJPQ4g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 12:56:36 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07DBC061755
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 09:56:35 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 77so3808941lfl.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 09:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UCDm/leIjbm6cLrDBLzkAxcbDZIxq5LPj31J47YI3rA=;
        b=O6LseaGXZ01uMmh85FJbb8S6TDmvdQR1JiVmqSS2EeQkzJD00jfbHtD2//OXppDt6g
         blta4vTt9oEaP8e5p8zLjFuNp/LK/1yVu96vmTIhtP2npu3I7Ubxtdi08mXBNxUA2tJG
         gwguMYAuaTp+W8YQicdembgZ+5TCQBWd0TYcJzcBaippWvzZ5JCOomp+18GRd5jWQ24g
         Oi/26AeDGsOHA4+Ml/dFpG1xo+QITxDwNBmDBvGJgB06s5wLBQncR0N8VP5t7PKQke/7
         wwSguDm4IKVYt22wyUibb+bQSwjt/F+a1oa7y092pDDmwjt66IssANTGI+6w9CtWkR0I
         +w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UCDm/leIjbm6cLrDBLzkAxcbDZIxq5LPj31J47YI3rA=;
        b=e1UIt0h8uwKGHJLNxWPcX5t8YLzOTvF/MKIaJeyILxj+RmxCQvVWQUYm73brxpHGhi
         YArSM2o7/1htDuM5hsls3gQJwvBHU090FUODeJPmAztuHGBmRwUmhWOUQEt90ZsjJAe9
         EZlsQ8f/iT1IIn/GElCtJ8MmTOz3VjPgbpnNDlYsX1/NLgu0RYP43x5lFKyXpFDa+f7X
         YwkD3jo7qCeeJvgxRlV9nYwLwmC0p12rAgV6obOcvX5fYEkLgM0pgEOScx2SVJhOW6V5
         bhj9v8Sc3heMwHl7JFJ/c/uSzqJFAVgW2WA8veygmI/y9bk60mcEGKjYDA8gFkANhUD6
         DCaA==
X-Gm-Message-State: AOAM530YBekVWAJEN/cf8YNzwu/v5XDZbbt+PG8A44fKdc3rgC/cLa/v
        GvgZRkLtlKi8SR2QXH+StQoJ3YrBMlSBJPqPViwLlIV8eMsPqW6G
X-Google-Smtp-Source: ABdhPJwBags0upoB0AtgWGyaHa1X1EFsEyDexUT9+94xT5o8Q/DQpH5sMpNWildjk23EtnIYZuNGjMJXWyVpJ2NDNXI=
X-Received: by 2002:a19:824f:: with SMTP id e76mr1615966lfd.572.1602867394059;
 Fri, 16 Oct 2020 09:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201011024831.3868571-1-daniel@0x0f.com> <20201011024831.3868571-4-daniel@0x0f.com>
In-Reply-To: <20201011024831.3868571-4-daniel@0x0f.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Oct 2020 18:56:23 +0200
Message-ID: <CACRpkdYmdZ81q_tsXRQ56aFjGsvV3AwJ8_hiu31mD14DGiK84A@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Daniel,

thanks for your patch!

Some comments below, we need some work but keep at it.

On Sun, Oct 11, 2020 at 4:48 AM Daniel Palmer <daniel@0x0f.com> wrote:

> This adds a driver that supports the GPIO block found in
> MStar/SigmaStar ARMv7 SoCs.
>
> The controller seems to support 128 lines but where they
> are wired up differs between chips and no currently known
> chip uses anywhere near 128 lines so there needs to be some
> per-chip data to collect together what lines actually have
> physical pins attached and map the right names to them.
>
> The core peripherals seem to use the same lines on the
> currently known chips but the lines used for the sensor
> interface, lcd controller etc pins seem to be totally
> different between the infinity and mercury chips
>
> The code tries to collect all of the re-usable names,
> offsets etc together so that it's easy to build the extra
> per-chip data for other chips in the future.
>
> So far this only supports the MSC313 and MSC313E chips.
>
> Support for the SSC8336N (mercury5) is trivial to add once
> all of the lines have been mapped out.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

(...)

> +config GPIO_MSC313
> +       bool "MStar MSC313 GPIO support"
> +       default y if ARCH_MSTARV7
> +       depends on ARCH_MSTARV7
> +       select GPIO_GENERIC

Selecting GPIO_GENERIC, that is good.
But you're not using it, because you can't.
This chip does not have the bits lined up nicely
in one register, instead there seems to be something
like one register per line, right?
So skip GPIO_GENERIC.

> +#define MSC313_GPIO_IN  BIT(0)
> +#define MSC313_GPIO_OUT BIT(4)
> +#define MSC313_GPIO_OEN BIT(5)
> +
> +#define MSC313_GPIO_BITSTOSAVE (MSC313_GPIO_OUT | MSC313_GPIO_OEN)

Some comment here telling us why these need saving and
not others.

> +#define FUART_NAMES                    \
> +       MSC313_PINNAME_FUART_RX,        \
> +       MSC313_PINNAME_FUART_TX,        \
> +       MSC313_PINNAME_FUART_CTS,       \
> +       MSC313_PINNAME_FUART_RTS
> +
> +#define OFF_FUART_RX   0x50
> +#define OFF_FUART_TX   0x54
> +#define OFF_FUART_CTS  0x58
> +#define OFF_FUART_RTS  0x5c
> +
> +#define FUART_OFFSETS  \
> +       OFF_FUART_RX,   \
> +       OFF_FUART_TX,   \
> +       OFF_FUART_CTS,  \
> +       OFF_FUART_RTS

This looks a bit strange. The GPIO driver should not really
have to know about any other use cases for pins than
GPIO. But I guess it is intuitive for the driver.

> +#define SD_NAMES               \
> +       MSC313_PINNAME_SD_CLK,  \
> +       MSC313_PINNAME_SD_CMD,  \
> +       MSC313_PINNAME_SD_D0,   \
> +       MSC313_PINNAME_SD_D1,   \
> +       MSC313_PINNAME_SD_D2,   \
> +       MSC313_PINNAME_SD_D3
> +
> +#define OFF_SD_CLK     0x140
> +#define OFF_SD_CMD     0x144
> +#define OFF_SD_D0      0x148
> +#define OFF_SD_D1      0x14cchild_to_parent_hwirq
> +#define OFF_SD_D2      0x150
> +#define OFF_SD_D3      0x154
> +
> +#define SD_OFFSETS     \
> +       OFF_SD_CLK,     \
> +       OFF_SD_CMD,     \
> +       OFF_SD_D0,      \
> +       OFF_SD_D1,      \
> +       OFF_SD_D2,      \
> +       OFF_SD_D3
> +
> +#define I2C1_NAMES                     \
> +       MSC313_PINNAME_I2C1_SCL,        \
> +       MSC313_PINNAME_I2C1_SCA
> +
> +#define OFF_I2C1_SCL   0x188
> +#define OFF_I2C1_SCA   0x18c
> +
> +#define I2C1_OFFSETS   \
> +       OFF_I2C1_SCL,   \
> +       OFF_I2C1_SCA
> +
> +#define SPI0_NAMES             \
> +       MSC313_PINNAME_SPI0_CZ, \
> +       MSC313_PINNAME_SPI0_CK, \
> +       MSC313_PINNAME_SPI0_DI, \
> +       MSC313_PINNAME_SPI0_DO
> +
> +#define OFF_SPI0_CZ    0x1c0
> +#define OFF_SPI0_CK    0x1c4
> +#define OFF_SPI0_DI    0x1c8
> +#define OFF_SPI0_DO    0x1cc
> +
> +#define SPI0_OFFSETS   \
> +       OFF_SPI0_CZ,    \
> +       OFF_SPI0_CK,    \
> +       OFF_SPI0_DI,    \
> +       OFF_SPI0_DO

Same with all these. I suppose it is the offsets of stuff
that would be there unless we were using it for GPIO.

> +static int msc313_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> +> +

> +       return gpio->irqs[offset];
> +}

Please do not use custom IRQ handling like this.
As there seems to be one IRQ per line, look into using

        select GPIOLIB_IRQCHIP
        select IRQ_DOMAIN_HIERARCHY

See for example in gpio-ixp4xx.c how we deal with
hiearchical GPIO IRQs.

> +       gpiochip->to_irq = msc313_gpio_to_irq;
> +       gpiochip->base = -1;
> +       gpiochip->ngpio = gpio->gpio_data->num;
> +       gpiochip->names = gpio->gpio_data->names;
> +
> +       for (i = 0; i < gpiochip->ngpio; i++)
> +               gpio->irqs[i] = of_irq_get_byname(pdev->dev.of_node, gpio->gpio_data->names[i]);

Use hierarchical generic GPIO IRQs for these.

Assign ->fwnode, ->parent_domain, ->child_to_parent_hwirq,
and probably also ->handler on the struct gpio_irq_chip *.

Skip assigning gpiochip->to_irq, the generic code will
handle that.

Again see gpio-ixp4xx.c for an example.

Yours,
Linus Walleij
