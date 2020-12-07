Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182652D109C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 13:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgLGMfL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 07:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgLGMfL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 07:35:11 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC582C0613D0
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 04:34:30 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id f11so2879759ljn.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 04:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=boKMjDjJa5tRLm1VPCUmtsYmlC2fesJJoaLCTYk8EUo=;
        b=XRCkYUCdOmvRRAtRW3hi67kI3cSeDfNcypHvLS8jdjZZe/bAI5psCeUuTET6Ap9u/a
         5vY1eRHmi2x5zg4MXni5dltguovscn5Vx3S8VYcRZaFkS6Xh6yKIhlvAz9GaKMKYZ2jL
         bypClOGEwkbSDSCtYJUpOdXlkMHCfpDbv5lgyAMEqIRY6tCKHpMjxBMym9nMiaNZpZ4r
         qkGb4ZLSq7dUPqVo0McnPOil2TXOvm33hPJK/S4rEnAIB7HVJ2nl+1UdMreUuvqDVSgl
         bAs2J7FdEnjl0ku+0IfuhgiDcU/fYPx1YUxP0BS5VEkva4tHgDXe73Iv5BD+lKX1cXYe
         hkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boKMjDjJa5tRLm1VPCUmtsYmlC2fesJJoaLCTYk8EUo=;
        b=ZBxepKeA+P6h6grTwBMmV5vOnCDhStp6+bAW7vYmeX5WBvibZ8jwQPfsZLJx7EpnjO
         2tEB5MXbgBD32RsXdoIAfuAdzNiOvb/GwpJBHBlhBvPRr5ZhbFjFR76cvPIeDayQfRqu
         gap3Yc9bTUtGnfKicr3cVO7vZBDs04HvA6mLYMUe4ouxbGl0Jx7H8Fc/u0j1Zb6sCqUL
         zqKFZEmT/0MOSU1zBtAWMJAYGZ3SbvkdYaGtKDE2oO49H/diySvhqJIg+42Dk89UfkYG
         YvPrWYCSqxeOaLvk9oIGJOqWeEIQ1hqgRqpksrW4qZhrufJ7HiFMcXlTvTeSzuxa8AG7
         QROg==
X-Gm-Message-State: AOAM532KsIjYinN8fyRJBzQBal6ueXJ3ZqvZnu0IvMNdEV4wQZ8mfX/e
        H4ZlqTvz6BtHw2aV+4EjgWU4sna6qGc4H3dL03DS1A==
X-Google-Smtp-Source: ABdhPJxCMdxWp9BFOclJM4l0os50hx76oBCQDWSP9Mz1ISgEte4ORw7PcLsLj6UH4DkqJ6zlcpFPOuTE9rfLfpwTh4Y=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr8487351ljy.293.1607344469350;
 Mon, 07 Dec 2020 04:34:29 -0800 (PST)
MIME-Version: 1.0
References: <tencent_220963AF059847E1171B4AB9@qq.com> <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com> <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
 <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Dec 2020 13:34:18 +0100
Message-ID: <CACRpkdZmM3GK6mebmm6nT-XXfdTB5KGwArAFk-1Gx6noZDxVAw@mail.gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
To:     Jerome Brunet <jbrunet@baylibre.com>, Marc Zyngier <maz@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>,
        khilman <khilman@baylibre.com>,
        narmstrong <narmstrong@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 12:07 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Mon 07 Dec 2020 at 11:18, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Dec 4, 2020 at 4:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >> On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> >> This HW only has 8 irqs that can each be mapped to a pin. No direct
> >> translation can be made, we have to allocate an irq to monitor the line.
> >> So when gpio_to_irq() was called, we had to do that allocation dynamically
> >> to return a valid irq number. Since there was no counter part to
> >> gpio_to_irq(), those allocation cannot be freed during the lifetime of
> >> the device.

gpio_to_irq() is just a helper really and should not really be used to allocate
anything.

In device tree systems, the GPIO provider should nominally present itsel
as a dual-mode gpio-controller and interrupt-controller for example:

                gpio1: gpio@4e000000 {
                        compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
                        reg = <0x4e000000 0x100>;
                        interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
                        resets = <&syscon GEMINI_RESET_GPIO1>;
                        clocks = <&syscon GEMINI_CLK_APB>;
                        gpio-controller;
                        #gpio-cells = <2>;
                        interrupt-controller;
                        #interrupt-cells = <2>;
                };

The GPIOs are normally *not* translated to IRQs in this set-up. Rather the
interrupts are requested by consumers using request_[threaded_]irq()
which means you should be using the irqchip callbacks such as
.irq_request_resources() and .irq_release_resources() to allocate one
of the free irq lines to use. These will be called at the right points if a
properly written driver requests an IRQ and when the driver is removed.

In some rare cases gpio_to_irq() is used because all the driver knows is
a GPIO number and it want to try to obtain an IRQ for it, and if a 1-to-1
mapping exists it returns this number. This is not the norm, but the
exception.

So maybe the problem is that you need to go back and think about
updating the DT bindings for this thing to include interrupt-controller
as well?

>  * This HW has to create the mapping between GPIO and irq number
>    dynamically. The number of irqs available is very limited.

This should be done using irq_chip callbacks.

>  * We only get to know a mapping is required when gpio_to_irq() is called

No that callback should not be used for that.

>  * There is no way to know when it is safe to dispose of the created
>    mapping

The way that is done is when .irq_release_resources() is called.

>  * Some drivers require a trigger type we don't support. These will create
>    mappings and not use it because of the failure when .set_type() is
>    called

I don't quite understand this. Do you mean you are bombarded by pointless
requests for interrupts that will not work anyways? Then do not assign
interrupts to these drivers in the device tree. These requesting devices
and their requests are under your control. The drivers should be able to
back out and work without interrupt if request_irq() fails because it
can't provide the type on interrupt you want:

int irq = request_irq(irq, my_isr, IRQF_TRIGGER_RISING |
IRQF_TRIGGER_FALLING, "My ISR", cookie);
// This results in .irq_request_resources() and .irq_set_type()
if (irq < 0) {
   // Oopps out of IRQs or couldn't support double edges, bail out or
use polling
}

Just do it like this (you might have to augment your drivers) and you'll
be fine?

> To answer your question, there an API which lets us know a mapping is
> needed, but none to inform that it is not required anymore. The GPIO API
> was not meant to used like this. Not saying it is good or bad, this is
> just how it is.

So don't use it?

Yours,
Linus Walleij
