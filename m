Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0426293D49
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 15:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407330AbgJTN0S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 09:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407291AbgJTN0S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2020 09:26:18 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C243CC0613CE
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 06:26:17 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d3so1869312wma.4
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jiEZwt1UVrshiu353nvFC1zKZwvPuTjPD9AQIUaHUPQ=;
        b=YK2Jal9lJPuDGvNZgEhVpYxQR6C0JKOZhXubZAtjOGmvnFZUULMyZXNg1aDkkedl0N
         fa106fGFd/uUlgBz50Ae0VGRitHCgNs7vqRFtFEPu81PCfWYZBefOnit0JiEki37WKKy
         ZNIgHsL5bQyV4iQHk3Iz3TYlegkjKWreRKVL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jiEZwt1UVrshiu353nvFC1zKZwvPuTjPD9AQIUaHUPQ=;
        b=DIx/E3rp6WJ60UjwfAlIHtkZnXw/RAGo755q235GvQskkO8/q8FTP+OQXe9dj0m2pP
         HY76ZgMlbrP1K83uJ4JeE6bmwsbPP+OZtxMBQ5e0a+9tt6YhjzNZpmQiZfaZaJMd63He
         HHX60K6pGwocohXVc2UL6r979M3H0gaGZIwm7jHEL0FmN0vUnjkov20ALXNl72fjdhUM
         lqO+1hQC4tyajZmYlr0Q9Uu72OC3uM71CnwcO6LINPhMlyZ9ZgEKwXgMHM3uYwn6kMq5
         ONGFxDdYPfm4KcSEUZc/9a/PExPDaM5mKiFPlAmiS318LjNmRVFaOpKVYbRr7rUEgIQL
         EL9Q==
X-Gm-Message-State: AOAM533RjVRtGWa8jTLtMIKoY9FJ236bsdqQABsE4i77iif9WEkwEU8E
        jXTOmSpG6YrqwUACC8Y9FRr3uVWq+rQ0KjiQOb4Log==
X-Google-Smtp-Source: ABdhPJxOSCaohNlotFC3fJ/SO8FGZ+IX/HeJ18+Z+rLPcpFl4yVk1/rmqgj7plCYZ+/rQ6+2hKvySr4nP9kWyidWceU=
X-Received: by 2002:a1c:7518:: with SMTP id o24mr3045570wmc.137.1603200376398;
 Tue, 20 Oct 2020 06:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201019141008.871177-1-daniel@0x0f.com> <20201019141008.871177-4-daniel@0x0f.com>
 <CAHp75Vf5iUzKp32CqBbv_5MRo8q8CyBPsBcgzKsww6BFtGJwUA@mail.gmail.com>
In-Reply-To: <CAHp75Vf5iUzKp32CqBbv_5MRo8q8CyBPsBcgzKsww6BFtGJwUA@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 20 Oct 2020 22:26:50 +0900
Message-ID: <CAFr9PXnhqS+3nbt8ZG8PKpkp=tFraxFQUb5ym1a2FtzmRgF4VA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Tue, 20 Oct 2020 at 20:59, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > +config GPIO_MSC313
> > +       bool "MStar MSC313 GPIO support"
>
> Why boolean?

Because it's a built in driver. I could change it to tristate/a module
but I didn't think it needed to be one.
The machines this is used on generally only have 64 or 128MB of RAM so
the kernel is usually built without modules and only the totally
required stuff built in.

> > +       default y if ARCH_MSTARV7
>
> Simply
>        default ARCH_MSTARV7
> should work as well.
>
> Are you planning to extend this to other boards?

I think I copy/pasted the block above there. I'll fix this up.

As for other boards. I think this GPIO controller is only present in
MStar's SoCs and some MediaTek SoCs that inherited parts from MStar
after MediaTek bought them. Like the MStar interrupt controller is
present in some MediaTek TV chips.

>
> > +       depends on ARCH_MSTARV7
> > +       select GPIOLIB_IRQCHIP
> > +       help
> > +         Say Y here to support GPIO on MStar MSC313 and later SoCs.
>
> Please, be more specific. Also it's recommended to have a module name
> to be included (but let's understand first why it's not a module)

Ok. I'll rework that. As for it not being a module. I can make it
possible to build it
as a module. I just didn't really think it needed to be one.

> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/gpio/driver.h>
>
> I believe this should be reworked.
> For example, it misses mod_devicetable.h, bits.h, io.h, types.h, etc, but has

I'll look at this again.

> > +/* These bits need to be saved to correctly restore the
> > + * gpio state when resuming from suspend to memory.
> > + */
>
> /*
>  * For this subsystem the comment style for multi-line
>  * like this.
>  */

Sorry, I'll fix these up.

> > +#ifdef CONFIG_MACH_INFINITY
>
> Does it make any sense?
>
> > +#endif

It doesn't make a lot of sense right now but it makes a bit more sense
when the support for the mercury chips is added. They have their own
set of offsets
for the used pins. I cut that out of this series because I haven't
fully reverse engineered all of the pins for those chips yet so the
support for them has a lot of guesses and notes in the code.

Anyhow, with only 64MB of RAM I thought it made sense to not compile
in the mercury tables when support for those machines isn't enabled.
I'll drop the if/defs for the next version.

> > +static struct irq_chip msc313_gpio_irqchip = {
> > +       .name = "GPIO",
>
> Is this name good enough?
>

There is only one GPIO block in the chips this is for so I think it's
unique at least.

> > +       gpiochip->label = DRIVER_NAME;
>
> Not good. When you use user space how do you distinguish if more than
> one chip appears in the system?

So far there is only ever one of these GPIO controller for the whole system.
There is another GPIO block in the system but it uses another driver
as the register layout is totally different.

Thank you for all of the comments. Sorry about the multiple style issues.
I thought checkpatch had my back on that.

Thanks,

Daniel
