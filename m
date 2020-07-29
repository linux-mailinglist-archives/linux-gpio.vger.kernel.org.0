Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BD5232141
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 17:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgG2PKm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 11:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2PKm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2020 11:10:42 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C339C061794;
        Wed, 29 Jul 2020 08:10:42 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k4so11906444pld.12;
        Wed, 29 Jul 2020 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOtZ7EqjDCXsIq7hoMDqDlNiXk9wOFEEwluDG54GFaU=;
        b=T4YYgVGE8s9en8SUnnk2Ec6jLd9R6hndr87rhw5uCVARunyaEwiAaLWgCcXvzmKYpj
         GMgwe68UGm/ylwPl+pbPg6m9PTv7Fq+wflCiQ0BqjnzljmAGkn5m6Duo7XlVBZqzlfbO
         DtOm2qpu0DPUsjvgBQ7Xlloej+VpYZd4hi/dYrnTL/CVd1MKW9R//lYIy1CjlZL03n4F
         8gywEoMXKhro3seRxx2mWGlL/rinca34S6aqFtl37xPjuqV6N/AurOMINO4x8ytVRuB6
         IO0Alq5GG0bvxeJo4gfOLmR5e9dMj38nzSNQ9bMMZoszQp7jjffshHspvH7uyMkI5CQ/
         lM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOtZ7EqjDCXsIq7hoMDqDlNiXk9wOFEEwluDG54GFaU=;
        b=MgNyD9ZdByRkQshz5ggOc0c9/QFaof6Vze71+cz4EbI+CJ9re/VhJLs3PHiK3223KO
         IQJCo/KTJrErqJ6cvuJZikCsziRUXRaUn8V7OpwWmR7IY8ygk1zbOaXjM4s9IINCwZzj
         /kcZ7Fr8+YOJ+LfzRAqxZ5bXhFbXhOf8ArouWf1kWkFXDGdDrMMUawdpS9Pz49ARdk2z
         F96MAD109kEVF9DjLGmVObCQ79tKVwhopGIVps+LEqrGApuqu8pCndLrkjq6tRv8dr6/
         sJKCdrtRZkPKroG7axw1kV2T2NCnQfyvHabYkS7UqdFN6jBW2ycI8HiVFeHwbffr82xq
         m9WQ==
X-Gm-Message-State: AOAM532DUxPdOXrL0PRMyd4t8uyCnArU/vpHIVybA00kK6985Le2EzNT
        dGuX4uQ7KeC2WH3dcotX+j07FvpeXFdFOdCAoTI1wCFPzuY=
X-Google-Smtp-Source: ABdhPJxTRrOX6fcgELQcqEzCUB3WuHTlcisuPDgGxh2QlnetAenE1lnRK3pXzKMrUEfjrONaKC6Qi+qQ4j/qWHEpXl8=
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr10487618pjp.228.1596035441419;
 Wed, 29 Jul 2020 08:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com> <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
 <CACRpkdZarVTeBbSqZ-N6iGC4fj2-tdtfxuuxJO=YvO29-uHAuA@mail.gmail.com> <20200729125837.b27ncvd2eeixstba@mobilestation>
In-Reply-To: <20200729125837.b27ncvd2eeixstba@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jul 2020 18:10:24 +0300
Message-ID: <CAHp75VfekW-aQhyCQJhzqJ+jSvmzJ-Otdh0jwoLt662CopwyTQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 29, 2020 at 3:58 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
> On Mon, Jul 27, 2020 at 12:22:28AM +0200, Linus Walleij wrote:

...

> Sorry for a delay with a response to this issue. I had to give it a more thorough
> thought since the problem is a bit more complex than it seemed originally. As I
> see it now It might be wrong to implement the cases 2) and 3), but 1) is more
> appropriate.
>
> First of all we need to note that GPIOlib framework provides the next parameters
> to describe the IRQ-chip:
> gc->irq.num_parents - number of parental IRQ numbers.
> gc->irq.parents[] - array of parental IRQ numbers.
> *gc->irq.valid_mask - a mask of IRQ/GPIO lines describing a valid IRQ.
> *gc->irq.map - mapping of hw IRQ/GPIO ID -> parental IRQ numbers.
>
> Using that set we can handle any case of linear and sparse parental IRQs. Here
> is how it can be implemented in the framework of DW APB GPIO controller.
>
> DW APB GPIO can be synthesized with two configs:
> 1) Combined IRQ line (GPIO_INTR_IO == True),
> 2) Multiple interrupt signals for each GPIO (GPIO_INTR_IO == False).
>
> Obviously the former case is trivial:
>
>      IRQ_combined
>     ______^________
>    /_ _ _ _ _ ___ _\
>    |_|_|_|_|_|...|_| - GPIOs
>
> In that case
> gc->irq.num_parents = 1;
> gc->irq.parents[0] = IRQ_combined;
> *gc->irq.valid_mask = GENMASK(ngpio - 1, 0); // This is done by the GPIOlib core itself.
>
> The later one (when multiple interrupt signals are involved) can be a bit more
> complicated. It can be also split up into two cases:
> 2a) One-on-one GPIO-IRQ mapping.
> 2b) Sparse GPIO-IRQ mapping.
>
> It's straightforward to implement 2a):
>
>    i1i2i3i4i5 ... iN
>     _ _ _ _ _ ___ _
>    |_|_|_|_|_|...|_| - GPIOs
>
> In that case
> gc->irq.num_parents = ngpio;
> gc->irq.parents[] = {i1, i2, i3, i4, i5, ... iN};
> gc->irq.map = {i1, i2, i3, i4, i5, ... iN};
> *gc->irq.valid_mask = GENMASK(ngpio - 1, 0);
>

This case puzzles me. Why is it not NULL and 0 and actually you handle
everything as a nested case?

> The complication starts when we get to implementing 2b):
>
>    i1 xi3i4 x ... iN
>     _ _ _ _ _ ___ _
>    |_|_|_|_|_|...|_| - GPIOs

So does this.

Valid mask will define exactly GPIOs that are IRQs. So, we will handle
only nested IRQs which are valid.

> In order to cover this case we need to answer on two question.
> Firstly how to get such platform config? I am not sure about ACPI, but
> aside from straightforward platform_data-based setup such configuration
> can be reached by setting up the "interrupts-extended" DT-property with
> zeroed phandle.
>
> Ok, since it's possible to meet such platform config, we need to think
> how to handle it and here is the second question. How to describe such
> case in the framework of GPIOlib-IRQchip?
>
> So from my side it was wrong to set the sparse IRQs array to
> gc->irq.parents. Instead I should have scanned the sparse IRQs array,
> calculated the number of non-empty parental IRQs, created an array of linear
> (non-sparse) IRQs, initialized *gc->irq.valid_mask in accordance with the
> sparse parental IRQs array. In other words it was wrong to assume, that
> each gc->irq.parents entry corresponds to the IRQ/GPIO line. The gc->irq.parents
> array just describes the parental IRQs and nothing else.
>
> Shortly speaking here is how the GPIOlib IRQchip parameters should be
> initialized in this case:
> gc->irq.num_parents - number of valid parental IRQs.
> gc->irq.parents - non-sparse, linear array of valid IRQs.
> *gc->irq.valid_mask - mask initialized by means of the gc->irq.init_valid_mask()
> callback, which indicates valid IRQ/GPIO IDs.
> *gc->irq.map - sparse array of parental IRQ numbers (which I mistakenly tried to
> pass through the gc->irq.parents pointer).
>
> After that GPIOlib IRQchip should work just fine without need to be patched
> in order to check whether the passed parental IRQs are valid or not.
>
> Please correct me if I am wrong in some aspects of the solution described above.
> I'll send a fix of the problem shortly.

Maybe I'm missing something, but looks like you are solving the issue
which is not so complex / doesn't exist.

-- 
With Best Regards,
Andy Shevchenko
