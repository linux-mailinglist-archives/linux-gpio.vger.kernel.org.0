Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA253B6B14
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jun 2021 00:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhF1WzG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Jun 2021 18:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233746AbhF1WzF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jun 2021 18:55:05 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF93C061574;
        Mon, 28 Jun 2021 15:52:37 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id i5so28468041eds.1;
        Mon, 28 Jun 2021 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r7tlZtsBPeNaAbSj9MQWDyFr7yrmHlDxoloBGKnf6hw=;
        b=iJv6h2b/HU24CnnT4Idc3fSSEnU2BX+aBjk6IGawp3RzvqRM8l56MsApJH0tyIatkK
         iRX7EMdp/XeWfDE8lsATDFQ8bGxb+zS184dlDeq9bBJtHn81JER7iQYDT/7CRJ/c4i5d
         Jv6YeTEUq5gipxNiQlr1rJx/+Ht/RoI7OZW8C4qHPJ78OquY5QpQOjhtb9XgAWN30WBd
         DhNK3s0qWbg+vGaV8b2XryMdsqmqFQj8q/KsIz/5VVXWFQXk+yj5yc0UqA49etnXYHJG
         tUIbZlbgigu4EawmR83h31eB1vuxBqFG0u5VgultsN17CdSa3VPqiKUNaWY2Z2Bvbx2z
         66cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r7tlZtsBPeNaAbSj9MQWDyFr7yrmHlDxoloBGKnf6hw=;
        b=VJehBLVSuGSAHoyui5GLrGG1ADrWIAzX4jj7Nfq2YmNiU4cyu52rzo0HkBWDgEP9oG
         p8/ZPu6LD2F3PnbOv+Inalq3HJgbrn03iLnSCKOHrlG2rwPoLYY45COJvyRuPqdovB1h
         G4KKcExvPF5dG/ylSm36yAm/9ealtuJHmLxJhEIYKQl5xIV6EICBr3g98HOHm32Eo8y3
         /0U2v/BijC+ypMCP2mu7IIrGezvs8E9uAWIbeX1ipopGG0l3HxJdDxbORt8iwjayJFzZ
         vq1LNkyQio7e05jg5AYoOuXcfYFH+RL0USpReYBazcsDg9FzsHbAaGPY44FtFnBKVKWi
         PWBg==
X-Gm-Message-State: AOAM531WzrMWvoxPhJhWXPkKipBsFie6yAYU0RI8sUSVxfiMjWGNJFGg
        c+7tVcxdST7yVZPksM3fUgsTGBpz4Owb1EapQuQ=
X-Google-Smtp-Source: ABdhPJzwyaJdUa9LIVv2wGMaosgVbNqNvl0y+YfXBQHEykJVXXK/rkhZ8t66muJlihYvBZF+2lXoyRlklFxIIbBmGb8=
X-Received: by 2002:a05:6402:31b4:: with SMTP id dj20mr36658729edb.186.1624920755698;
 Mon, 28 Jun 2021 15:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
 <CAHp75VeZwUiK2v8HZ=MLGSkK8wLudDEJFhBSm--Wu9gzABhmSg@mail.gmail.com> <CAHp75Vd6M6D9baiGi8fU8a=pfXnSKtEgQ4+eMiwPh6P9cg1ojA@mail.gmail.com>
In-Reply-To: <CAHp75Vd6M6D9baiGi8fU8a=pfXnSKtEgQ4+eMiwPh6P9cg1ojA@mail.gmail.com>
From:   Vincent Pelletier <plr.vincent@gmail.com>
Date:   Tue, 29 Jun 2021 07:52:24 +0900
Message-ID: <CAF78GY1PO3YwYHgQkEhYF1_FRQ=HVOOWFtECcHen9PFCR1=JOA@mail.gmail.com>
Subject: Re: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or
 feature ?
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 28, 2021 at 10:42 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> And one important note: do NOT use sysfs GPIO interface. Use a GPIO
> character device instead.

I am indeed aware of this. My IRQ issue is unrelated to the gpios
being claimed by anything, and I was doing it while trying to get
more information about the current state of the gpio driver.

For more background, the context of my IRQ issue is:
  PMIC (da9063) /irq -> GPIO pin 1 -> PLIC irq 24
The PMIC has several internal interrupt sources, like the power
button being pressed or the ADC conversion completion signal.
The first time after a boot that I press the power button, I do
get an interrupt and the da9063-onkey driver produces a keypress
input event.
But any further button press does not produce an IRQ. So something
is going wrong in the IRQ acknowledgement.
AFAIK the PLIC (platform-level interrupt controller) works: it is
used for PCIe interrupts, and those work.
The PMIC driver exists since 2013, so I assume any bug would have
been identified long ago.
But I believe the GPIO level has not handled any interrupt until I
enabled the power button event source, and this one is a lot more
recent: gpio-sifive.c from late 2019. So this is where I turned my
attention. Discovering that the pin is somehow only half-claimed
made me wonder if there was some important initialisation step
missing, which could maybe be related to these IRQ issues.

While on this topic, there is a bullet point in
Documentation/driver-api/gpio/driver.rst which I fail to understand:

| - Nominally set all handlers to handle_bad_irq() in the setup call and pass
|   handle_bad_irq() as flow handler parameter in
gpiochip_irqchip_add() if it is
|   expected for GPIO driver that irqchip .set_type() callback will be called
|   before using/enabling each GPIO IRQ. Then set the handler to
|   handle_level_irq() and/or handle_edge_irq() in the irqchip .set_type()
|   callback depending on what your controller supports and what is requested
|   by the consumer.

- why the plural in "set all handlers to handle_bad_irq()" ? Isn't
  there only a single handler in struct gpio_irq_chip ?
- I do not find a function named gpiochip_irqchip_add(), only
  gpiochip_irqchip_add_domain()
- "Then set the handler to [...] in the irqchip .set_type() callback"
  Isn't set_type per-pin, and isn't the interrupt handler chip-level ?

Regards,
-- 
Vincent Pelletier
