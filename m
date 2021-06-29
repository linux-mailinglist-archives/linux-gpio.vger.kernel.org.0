Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16CF3B707D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jun 2021 12:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbhF2KWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Jun 2021 06:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbhF2KWF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jun 2021 06:22:05 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A0DC061574;
        Tue, 29 Jun 2021 03:19:37 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q91so867988pjk.3;
        Tue, 29 Jun 2021 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3OkRkHizt0pIFF2nae2zayetiAfJYLbN66gAHLaoVdw=;
        b=CRhtikpflpdTCCVEeZytUhGjT4As9u4HQCmFlcgJ/n2QLXGKu5HweIWAY/s5hAXuyR
         7tfPnuPf4R0g8WpImwM5yYPBP7P9kxbjO7T9XYuelDmpITMhmW2KjDoGovkSd2HOlBxq
         3lWtsmwyYqUxjuc9pG3An7e10pn7MsDwdxV/19GediA+SklJ81CmkxUs+HtXiv1TLXee
         /jTdcaHWuF8jGoZrkagRjUT6YBrWq92OqsnzyZJcXLa6ccmzh1MZJLIOBIiLLxUPT0vi
         s1MV3xDwEkZBm3dRPFAVbeDlSYzn5pTvGxqJCFxFTUCR+mC0pN+5o/fX8Md8XdbK9aEU
         Zydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3OkRkHizt0pIFF2nae2zayetiAfJYLbN66gAHLaoVdw=;
        b=Yc7vDnQTLwbUfOMDRwxTsMzP1XR1l1Idng8Wfz9pEf4nOgQNRum8/nA1ytMIsEcXWQ
         D1UytHqvOljH6lk5Vc5wsTm9bS/Va9zgMVblixILa8zlQpsRuG9DTw7IcL5GP9jT2JCX
         xoPvHutiM/2YnrSFCOnnK8VSQlFXkq8ht0waX0ooYacjwYilQauCLSKxGIqmGb+HyW7d
         SDGWX5Hma8srVUqhTpwZVAR9564XEw08u1TrIgpBpaSX6/1w9pqn7sqvtyx5r6sW9oiD
         hVKa4R6zMoAcGJeXmeJLfNLUD6ET8YoQLe4lRuxB4MahGQTUW2WYDdyIVyPwvTZtXX3D
         K5rQ==
X-Gm-Message-State: AOAM533gUNXy4NTOjvngBDrK+eFEAZYcQm0RlTaQ5vwN+dnUTTAULW+J
        rtxwZj8X1S9FiGLqvNJ8BkqGgtLLVp6pTTEEX6o=
X-Google-Smtp-Source: ABdhPJxjxFoz08Ja5OaBGu6Tobx6MuahznJRKwGzUZreziP7AT2VU6jjhB0LxW58wN/wCXQFJSon5co6gQuXVp9Tdis=
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr43469772pjq.129.1624961976519;
 Tue, 29 Jun 2021 03:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
 <CAHp75VeZwUiK2v8HZ=MLGSkK8wLudDEJFhBSm--Wu9gzABhmSg@mail.gmail.com>
 <CAHp75Vd6M6D9baiGi8fU8a=pfXnSKtEgQ4+eMiwPh6P9cg1ojA@mail.gmail.com> <CAF78GY1PO3YwYHgQkEhYF1_FRQ=HVOOWFtECcHen9PFCR1=JOA@mail.gmail.com>
In-Reply-To: <CAF78GY1PO3YwYHgQkEhYF1_FRQ=HVOOWFtECcHen9PFCR1=JOA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Jun 2021 13:19:00 +0300
Message-ID: <CAHp75Vcp9ujZMRwUU30__4jv18A_dzdHNHahVMyygrbfRHR_=A@mail.gmail.com>
Subject: Re: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or
 feature ?
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 29, 2021 at 1:52 AM Vincent Pelletier <plr.vincent@gmail.com> wrote:
>
> On Mon, Jun 28, 2021 at 10:42 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > And one important note: do NOT use sysfs GPIO interface. Use a GPIO
> > character device instead.
>
> I am indeed aware of this. My IRQ issue is unrelated to the gpios
> being claimed by anything, and I was doing it while trying to get
> more information about the current state of the gpio driver.
>
> For more background, the context of my IRQ issue is:
>   PMIC (da9063) /irq -> GPIO pin 1 -> PLIC irq 24
> The PMIC has several internal interrupt sources, like the power
> button being pressed or the ADC conversion completion signal.

This is the usual case with PMIC. We have similar on x86 machines
(PMIC is represented by an MFD driver with regmap IRQ being involved).

> The first time after a boot that I press the power button, I do
> get an interrupt and the da9063-onkey driver produces a keypress
> input event.
> But any further button press does not produce an IRQ. So something
> is going wrong in the IRQ acknowledgement.
> AFAIK the PLIC (platform-level interrupt controller) works: it is
> used for PCIe interrupts, and those work.
> The PMIC driver exists since 2013, so I assume any bug would have
> been identified long ago.
> But I believe the GPIO level has not handled any interrupt until I
> enabled the power button event source, and this one is a lot more
> recent: gpio-sifive.c from late 2019. So this is where I turned my
> attention. Discovering that the pin is somehow only half-claimed
> made me wonder if there was some important initialisation step
> missing, which could maybe be related to these IRQ issues.
>
> While on this topic, there is a bullet point in
> Documentation/driver-api/gpio/driver.rst which I fail to understand:
>
> | - Nominally set all handlers to handle_bad_irq() in the setup call and pass
> |   handle_bad_irq() as flow handler parameter in
> gpiochip_irqchip_add() if it is
> |   expected for GPIO driver that irqchip .set_type() callback will be called
> |   before using/enabling each GPIO IRQ. Then set the handler to
> |   handle_level_irq() and/or handle_edge_irq() in the irqchip .set_type()
> |   callback depending on what your controller supports and what is requested
> |   by the consumer.
>
> - why the plural in "set all handlers to handle_bad_irq()" ? Isn't
>   there only a single handler in struct gpio_irq_chip ?

Each GPIO line may have its own handler (usually level or edge). I
guess it's written from the GPIO point of view.

> - I do not find a function named gpiochip_irqchip_add(), only
>   gpiochip_irqchip_add_domain()

Missed during update I suppose.
https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?h=gpio/for-next&id=f1f37abbe6fc2b1242f78157db76e48dbf9518ee
Feel free to submit a patch!

> - "Then set the handler to [...] in the irqchip .set_type() callback"
>   Isn't set_type per-pin, and isn't the interrupt handler chip-level ?

The idea behind that initially the chip-level IRQ handler is set to
BAD. It means any (spurious) IRQ will be served by it. Now, when one
requests IRQ the framework will call ->irq_set_type() of corresponding
IRQ chip and change the handler for the certain pin (pin-level). So,
the main handler is basically for spurious interrupts only.

-- 
With Best Regards,
Andy Shevchenko
