Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5C1290F59
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Oct 2020 07:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411803AbgJQFfK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Oct 2020 01:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411744AbgJQFem (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Oct 2020 01:34:42 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BB3C0610D4
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 18:57:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d3so5190137wma.4
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 18:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nuh/bmn3RkFq4gADcA0ZAUJL6az2qyr09AghLknddnE=;
        b=Hc8aQmwnLL+wERyyQ7CpO51Fsn3derfmkT8umMZkwXPkhXFcXuK1+srj5bzWdyGS8X
         w44FRI2rzKxxk+WBy/GE7xvWOVWLkwNIvcfxSm9c9uuhAX+67wPWEgXL3kgROKrUsuvf
         zsmczeVNeaUiEkBC4f+DsFxJ2lpdyqlb7kjm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nuh/bmn3RkFq4gADcA0ZAUJL6az2qyr09AghLknddnE=;
        b=W7rAjyD5KVxvC6JuluJKmzDIB+953/7lYUKw0Z/etd21EeQ+QMtPsIawFyQIAHyVe9
         1DS2wyK1EeTKTd/r+L5rj5XP85XqZ3XMv/66rwZegoNkf5etdKV92GJy340dlP19QY64
         cmQeEYFmXuqvZKANhgYH2Btb4eAvdU30wMKHqInAtp0Ah5ylOjVJMixM7PfssmCo9/Vq
         7mQfVNIlXwBso+9ePsub5KM/MZlrO9LIVUTKoJ/L7rLL86CjaH75qvNeX+4IqO7bMf7H
         nODV8RXQLHwf6aS5g8unPLFggsbt1kjBJ8oyfNomwtleduTqWCxq5Xw06grQ/JCj/vun
         tC8Q==
X-Gm-Message-State: AOAM530j2HON+wNYSMYnqenQ107ml7By8I/w8IFZy191ocogzhGFeIID
        sZIv91LQuY3WFTVk1IoJJu9QG+Xqd0rG5suGVKyzTQ==
X-Google-Smtp-Source: ABdhPJz2dwlicRXSki8sbde0WGJf342Dhw9U8otxbpBoITFVZF9Vdk/vRb8AtHXnj/BTbponqM3On9YyYJ9zovqDyQ0=
X-Received: by 2002:a7b:c935:: with SMTP id h21mr6120268wml.99.1602899865888;
 Fri, 16 Oct 2020 18:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201011024831.3868571-1-daniel@0x0f.com> <20201011024831.3868571-4-daniel@0x0f.com>
 <CACRpkdYmdZ81q_tsXRQ56aFjGsvV3AwJ8_hiu31mD14DGiK84A@mail.gmail.com>
In-Reply-To: <CACRpkdYmdZ81q_tsXRQ56aFjGsvV3AwJ8_hiu31mD14DGiK84A@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 17 Oct 2020 10:57:35 +0900
Message-ID: <CAFr9PX==5iqX6UfE7KOagkuYviUhM2cSuyHYNquhxcxJU5hFMA@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus

On Sat, 17 Oct 2020 at 01:56, Linus Walleij <linus.walleij@linaro.org> wrote:
> (...)
>
> > +config GPIO_MSC313
> > +       bool "MStar MSC313 GPIO support"
> > +       default y if ARCH_MSTARV7
> > +       depends on ARCH_MSTARV7
> > +       select GPIO_GENERIC
>
> Selecting GPIO_GENERIC, that is good.
> But you're not using it, because you can't.
> This chip does not have the bits lined up nicely
> in one register, instead there seems to be something
> like one register per line, right?
> So skip GPIO_GENERIC.

Well spotted. Copy/paste fail on my side :).

> > +#define MSC313_GPIO_IN  BIT(0)
> > +#define MSC313_GPIO_OUT BIT(4)
> > +#define MSC313_GPIO_OEN BIT(5)
> > +
> > +#define MSC313_GPIO_BITSTOSAVE (MSC313_GPIO_OUT | MSC313_GPIO_OEN)
>
> Some comment here telling us why these need saving and
> not others.

There is a comment near to the save function that explains it I think.
When the hardware goes into low power mode with the CPU turned off
the register contents are lost and those two bits are the only ones that are
writable from what I can tell. I'll add an extra comment above that line.

> > +#define FUART_NAMES                    \
> > +       MSC313_PINNAME_FUART_RX,        \
> > +       MSC313_PINNAME_FUART_TX,        \
> > +       MSC313_PINNAME_FUART_CTS,       \
> > +       MSC313_PINNAME_FUART_RTS
> > +
> > +#define OFF_FUART_RX   0x50
> > +#define OFF_FUART_TX   0x54
> > +#define OFF_FUART_CTS  0x58
> > +#define OFF_FUART_RTS  0x5c
> > +
> > +#define FUART_OFFSETS  \
> > +       OFF_FUART_RX,   \
> > +       OFF_FUART_TX,   \
> > +       OFF_FUART_CTS,  \
> > +       OFF_FUART_RTS
>
> This looks a bit strange. The GPIO driver should not really
> have to know about any other use cases for pins than
> GPIO. But I guess it is intuitive for the driver.
>
<snip>
>
> Same with all these. I suppose it is the offsets of stuff
> that would be there unless we were using it for GPIO.

The pad FUART_RX can't move but the function FUART_RX can.
If the function FUART_RX (or another function) isn't on the pad/pin
FUART_RX it's connected to the GPIO block.
Even more confusingly some of the other chips (SSD201/SSD202)
have pads called GPIO1, GPIO2 etc that only have GPIO functionality
but the offsets of the registers to control the GPIO on those pads might
not have a relation to the name.
GPIO1 isn't gpio_base + (1 * 4) and instead some random address.

Basically using the pad name as the name of the GPIO made sense
because it's fixed and the pad name and offset are the same with all
of the chips I've seen so far.

> > +static int msc313_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
> > +{
> > +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> > +> +
>
> > +       return gpio->irqs[offset];
> > +}
>
> Please do not use custom IRQ handling like this.
> As there seems to be one IRQ per line, look into using
>
>         select GPIOLIB_IRQCHIP
>         select IRQ_DOMAIN_HIERARCHY
>
> See for example in gpio-ixp4xx.c how we deal with
> hiearchical GPIO IRQs.

<snip>

> Use hierarchical generic GPIO IRQs for these.
>
> Assign ->fwnode, ->parent_domain, ->child_to_parent_hwirq,
> and probably also ->handler on the struct gpio_irq_chip *.
>
> Skip assigning gpiochip->to_irq, the generic code will
> handle that.
>
> Again see gpio-ixp4xx.c for an example.

I'll look into this.
I don't have datasheets so I'm working from some crusty header
files from the vendor kernel but there isn't one irq per line from
what I can tell.
There seems to have been 4 spare lines on an interrupt controller
so they wired GPIOs to them.

Thank you for the comments. I'll send a v2 in a few days.

Thanks,

Daniel
