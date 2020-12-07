Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AB52D11E2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 14:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgLGN01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 08:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgLGN01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 08:26:27 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEE2C061A53
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 05:25:22 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id g185so13647018wmf.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 05:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=saexyCJf1GbqWUkiP2yMQP3x3pHqTsfM/ykC2r7v4yE=;
        b=GnkapeRVF5Nkadd2mPkjPfgvA2XcIFLcl5ecBTO8innbDyqonlubd1adXncBQ4QqN1
         2/HhRJcHLErWRxS5DlCrDG8kU8BbPxh523SoUHdmuZH5Dt0tPOS96eYKvMuv3a5mFDOU
         We2WuGHdxRRNDgvI6RBld6jYoWMMxNIJXvKjKEG4S8ARaQJR5q9P75IQPkSQoCbA39Pc
         gDnmmvF+GPK4he2i6D9b5Z4nuJl9KnLpzHOkBQrmUJ2blQmvWgiT0Tj6XXiT1bwLdh1l
         E7YfFD3GE74HTMu+g898b+FfPKjaFfB9lY8CW+ANp+0tdWNsw7zei/ueGfqcIYIjz0z1
         KyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=saexyCJf1GbqWUkiP2yMQP3x3pHqTsfM/ykC2r7v4yE=;
        b=Qxg9KFL+J9T7MOPRmuFsQiIAXpYQZsfDdNCmcB81qtv3WVLFcYx+zEr+vTraP5f9oK
         2IY9nx0UIiM+zeh5iFRilEdgIXdVKbhPEKC6fN31b36Pnq9mRmewBgyH1W86q/kRQss1
         Agvrv4cj683SfJGzzLd5+/f3TM9E+zAnWLGUwvoizfBb+6r6Gh8IIej7ThgYeiIOh8tW
         ZMCGiN/NtJO4qJKPEJIh0jZZj1M32nYoJt/Ph+KJkHyWzECJsnX7YS+Qj2N+yB218stP
         L7olaHBci9GDfjetBgcj7PCB/shcWA2ftj01zuLhceiOCMcBW4sRSCVj/mZTGl3K5cqB
         Nahg==
X-Gm-Message-State: AOAM530/JzxbcKt5UBn8edu7X1P+FbBJmXY+EnYFVoLR3dv1ofw9OVeD
        Mbes6oW34/C0Y2m6kUwdKCekEg==
X-Google-Smtp-Source: ABdhPJx33fRb/hFSGTHG5aiJYDcuF4kPeym+Gd8dMK8baE94WXb262rD9EDNnhmMAbLNcNHw7Ln0WA==
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr3891023wmi.143.1607347521332;
        Mon, 07 Dec 2020 05:25:21 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id l11sm13497956wmh.46.2020.12.07.05.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 05:25:20 -0800 (PST)
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
 <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
 <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
 <CACRpkdZmM3GK6mebmm6nT-XXfdTB5KGwArAFk-1Gx6noZDxVAw@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?utf-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>,
        khilman <khilman@baylibre.com>,
        narmstrong <narmstrong@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: 0001-add-amlogic-gpio-to-irq
In-reply-to: <CACRpkdZmM3GK6mebmm6nT-XXfdTB5KGwArAFk-1Gx6noZDxVAw@mail.gmail.com>
Message-ID: <1jr1o1katc.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 07 Dec 2020 14:25:19 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Mon 07 Dec 2020 at 13:34, Linus Walleij <linus.walleij@linaro.org> wrote:

> On Mon, Dec 7, 2020 at 12:07 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Mon 07 Dec 2020 at 11:18, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>> > On Fri, Dec 4, 2020 at 4:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> >> On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:
>> >
>> >> This HW only has 8 irqs that can each be mapped to a pin. No direct
>> >> translation can be made, we have to allocate an irq to monitor the line.
>> >> So when gpio_to_irq() was called, we had to do that allocation dynamically
>> >> to return a valid irq number. Since there was no counter part to
>> >> gpio_to_irq(), those allocation cannot be freed during the lifetime of
>> >> the device.
>
> gpio_to_irq() is just a helper really and should not really be used to allocate
> anything.

Agreed

>
> In device tree systems, the GPIO provider should nominally present itsel
> as a dual-mode gpio-controller and interrupt-controller for example:
>
>                 gpio1: gpio@4e000000 {
>                         compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
>                         reg = <0x4e000000 0x100>;
>                         interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
>                         resets = <&syscon GEMINI_RESET_GPIO1>;
>                         clocks = <&syscon GEMINI_CLK_APB>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
>                 };
>
> The GPIOs are normally *not* translated to IRQs in this set-up. Rather the
> interrupts are requested by consumers using request_[threaded_]irq()
> which means you should be using the irqchip callbacks such as
> .irq_request_resources() and .irq_release_resources() to allocate one
> of the free irq lines to use. These will be called at the right points if a
> properly written driver requests an IRQ and when the driver is removed.
>
> In some rare cases gpio_to_irq() is used because all the driver knows is
> a GPIO number and it want to try to obtain an IRQ for it, and if a 1-to-1
> mapping exists it returns this number. This is not the norm, but the
> exception.

Sure

>
> So maybe the problem is that you need to go back and think about
> updating the DT bindings for this thing to include interrupt-controller
> as well?

We do
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-meson-gpio.c

That's actually the only thing we provide, on purpose.

>
>>  * This HW has to create the mapping between GPIO and irq number
>>    dynamically. The number of irqs available is very limited.
>
> This should be done using irq_chip callbacks.
>

Yes

>>  * We only get to know a mapping is required when gpio_to_irq() is called
>
> No that callback should not be used for that.

Agreed ... I was trying explain why we did *not* push a patch similar to what
was proposed here, or use gpiolib irqchip.

>
>>  * There is no way to know when it is safe to dispose of the created
>>    mapping
>
> The way that is done is when .irq_release_resources() is called.
>
>>  * Some drivers require a trigger type we don't support. These will create
>>    mappings and not use it because of the failure when .set_type() is
>>    called
>
> I don't quite understand this. Do you mean you are bombarded by pointless
> requests for interrupts that will not work anyways?

When we tried the approach suggested in this patch (again I agree it is
bad, which is why I'm against it), some drivers out there (I don't
remember which one TBH - that was 3 years ago) parsed the "gpio"
property and tried gpio_to_irq() and if it did not work then go
something else (like polling).

However the allocation stayed behind. It does not take much
"bombardment" when you only have 8.

> Then do not assign
> interrupts to these drivers in the device tree.

We don't.

> These requesting devices and their requests are under your control.

We control the ressources of the devices through DT, not the necessarily
drivers (which may be generic)

Some device needs the gpio, even if we don't want the irq.
We can't always prevent the driver to try gpio_to_irq().

This why I don't want gpio_to_irq() to be enabled on this HW, because it
would not be under our control anymore.


> The drivers should be able to
> back out and work without interrupt if request_irq() fails because it
> can't provide the type on interrupt you want:
>
> int irq = request_irq(irq, my_isr, IRQF_TRIGGER_RISING |
> IRQF_TRIGGER_FALLING, "My ISR", cookie);
> // This results in .irq_request_resources() and .irq_set_type()
> if (irq < 0) {
>    // Oopps out of IRQs or couldn't support double edges, bail out or
> use polling
> }
>
> Just do it like this (you might have to augment your drivers) and you'll
> be fine?
>

Again agreed. I'm really sorry if I have been that unclear about my
motive here. We already had that discussion 3 years ago, I totally
understand your point and agree. I was trying (and failing) to tell the
author of the patch that this approach had already been discussed in
past and that, unless gpiolib dramatically changed since then,
gpio_to_irq() should be used in this way and he should use irqchip we
already provide.

>> To answer your question, there an API which lets us know a mapping is
>> needed, but none to inform that it is not required anymore. The GPIO API
>> was not meant to used like this. Not saying it is good or bad, this is
>> just how it is.
>
> So don't use it?

Exactly

>
> Yours,
> Linus Walleij

