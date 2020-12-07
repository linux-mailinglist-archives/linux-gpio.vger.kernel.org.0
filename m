Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E37252D1263
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 14:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgLGNo3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 08:44:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgLGNo2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 08:44:28 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A217C0613D0
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 05:43:48 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id y19so6013785lfa.13
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 05:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gP0uJhQTgF/+63+6gB2l+pnsCV2YV5kIdg6VVuH/EPg=;
        b=wIwEnnsZNQshljsYBE4lem1wlantjPxjdyfhvVc5xSyfwo/p1r3xY4FFmPmRbkP3Ji
         TDPOtFp7oYMFl1jRnDGJRFvwN6eNJvWA9YMsEQUzwT+c26CRjCY03kenMQSZV5D7uKAy
         oOgEBb/0wcKQZWP2BoYXl4f5ifuyJLym4cMeY94MgOo9Pj3Rab7X/5dkEirUjfA1paHE
         8tPdH4aToNawRR7X1A4J+0NWY86ZbfcwMW18bAi6WNUAT/3xGwfvLnCbbLQzGctEH+PE
         0dOEnClsuG/3DQ585xyUwWTDbpFln1ceL4kyoMfP4Y3CtmjkaZsFJkW4U6rrSIJ+pG91
         H9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gP0uJhQTgF/+63+6gB2l+pnsCV2YV5kIdg6VVuH/EPg=;
        b=QQpj7Hnc0/Isp/q6Jt+eCJIlKlVbKUC93mi7D5Oe2DtFxeNCcgjmyi8PIMYtOBYSUn
         ssxdjE2x5r47QCMqi3HeFnsQ2yi0wxJw4jjWoaX+BjL1Fu5TchVJIy75e+3rp0f17uJl
         RZiQF9c+OTuyiOOfZDLzoXIhPaPsX5MlguFchRuttxCWIHZTNTVXtNTEWhUvlxNInj2x
         FwW++X7+SSR2PflvlRL62CdNVALoKP53RUmTm0dB032F4TIrLBtGqCV5/1QzJLXHig+M
         cfA8izI7m8Q6chdUnukNi0tt49s7zbCRGhImrxMPlpujqH7h0hgtgQ8ATxPX7rd+4dtb
         wFZw==
X-Gm-Message-State: AOAM532iumjWjDb4gIy+kLlOcRyCF9Tp7pSObgdbrlsg8cekKxOywW+3
        pJHWaMLALPkO1xQ7cKmh6iPmYSaffJd+s2dcpzGeIQ==
X-Google-Smtp-Source: ABdhPJzLSJLiAu+AIBChoSsaNDZ5Zux7SKhh0tTGmJJ86OXT69+jxhMioDzwzNkdyd8WY2fO4ut19U3EPJxorUBCyMU=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr7872928lfh.260.1607348626724;
 Mon, 07 Dec 2020 05:43:46 -0800 (PST)
MIME-Version: 1.0
References: <tencent_220963AF059847E1171B4AB9@qq.com> <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com> <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
 <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com> <CACRpkdZmM3GK6mebmm6nT-XXfdTB5KGwArAFk-1Gx6noZDxVAw@mail.gmail.com>
 <1jr1o1katc.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jr1o1katc.fsf@starbuckisacylon.baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Dec 2020 14:43:36 +0100
Message-ID: <CACRpkdbZxPwGNF427T85hmNHw6ncnYExKmXzLJM1rq8FCZOpxw@mail.gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
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

On Mon, Dec 7, 2020 at 2:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [Me]

> > So maybe the problem is that you need to go back and think about
> > updating the DT bindings for this thing to include interrupt-controller
> > as well?
>
> We do
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-meson-gpio.c
>
> That's actually the only thing we provide, on purpose.

Aha I see now.

> >>  * We only get to know a mapping is required when gpio_to_irq() is called
> >
> > No that callback should not be used for that.
>
> Agreed ... I was trying explain why we did *not* push a patch similar to what
> was proposed here, or use gpiolib irqchip.

The gpiolib irqchip kind of suppose there is a 1-to-1 mapping between a
GPIO line and an IRQ, so I see the reasoning. That said, the callbacks
are code so a deviant remapping irq line "pool" could possibly be used.

> > I don't quite understand this. Do you mean you are bombarded by pointless
> > requests for interrupts that will not work anyways?
>
> When we tried the approach suggested in this patch (again I agree it is
> bad, which is why I'm against it), some drivers out there (I don't
> remember which one TBH - that was 3 years ago) parsed the "gpio"
> property and tried gpio_to_irq() and if it did not work then go
> something else (like polling).
>
> However the allocation stayed behind. It does not take much
> "bombardment" when you only have 8.

I don't see any problem with gpio_to_irq() always returning -EINVAL
in situations like this.

> We control the ressources of the devices through DT, not the necessarily
> drivers (which may be generic)
>
> Some device needs the gpio, even if we don't want the irq.
> We can't always prevent the driver to try gpio_to_irq().

True. But you can say "no" to anything trying to do that, that way you
will only hand out the irqs on a first-come-first serve basis to the clients
that use the irqs directly and thus you get it under control.

> This why I don't want gpio_to_irq() to be enabled on this HW, because it
> would not be under our control anymore.

I think you can enable it and use gpiolibs hierarchical irqchip but let
gpio_to_irq() say no to everything.

> Again agreed. I'm really sorry if I have been that unclear about my
> motive here. We already had that discussion 3 years ago, I totally
> understand your point and agree. I was trying (and failing) to tell the
> author of the patch that this approach had already been discussed in
> past and that, unless gpiolib dramatically changed since then,
> gpio_to_irq() should be used in this way and he should use irqchip we
> already provide.

OK I get it.

It's just that from my point of view using the hierarchical gpiolib irqchip
has a value in itself even if gpio_to_irq() isn't used at all because it brings
the criss-cross under control.

If the author wants to get some driver to work, such as MMC card detect
or ethernet phy or similar, what s/he should do is to go and fix the driver
to ask for an irq directly from the platform device or similar if it
can't get an
IRQ from the GPIO line by using gpiod_to_irq().

Yours,
Linus Walleij
