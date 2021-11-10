Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2DF44C174
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 13:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhKJMmc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 07:42:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:59978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231232AbhKJMma (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 07:42:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E0566115B;
        Wed, 10 Nov 2021 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636547983;
        bh=2aMPxi9dMpVfJV9G/eQWm/9lWLyBdOKB6AMmgvTpC4k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D1uJn1GslbL9tPmKhOonu0Ga9kfJmpLYkHysv6suZYGWvhJlaDs5v5GfteofQpbPO
         NRfmzOCzQbfaXXPlw/M7qEMJq7vjNaRGFqXMDYc2GU99jrbWh+zw5NTejOG2vzn06H
         Ou7Ni7QU/UttQXL+JaEEX7f3HiXtxYnN9GoOAxrsCM/lNHeEW0NAnmeifCfqHNuCo6
         mEqIMYAGzqDeD6gNJppwUTQmllaOu7hAMm6a62700Hv9cuuRAjpCpOLDDDDQAxz+cx
         Y6HvOtwduRVt4Sie0NFjEhqboXyWwpOP9TKT07CNzwGoYsFv6I1T5oGe1dzOmTfzfP
         W3XDYB7SvDMoQ==
Received: by mail-wr1-f41.google.com with SMTP id d5so3822561wrc.1;
        Wed, 10 Nov 2021 04:39:43 -0800 (PST)
X-Gm-Message-State: AOAM531p/YuIcGn9k7l5q1zo86xoNmJlvC/q805bHvPBc3aqbG8nqI63
        eireGPTQzq6bT96BjIqF4NO4VLujVA/OVr7P3JQ=
X-Google-Smtp-Source: ABdhPJzeCe1KX7rzTj0TxHfJGWDd8QbDLnPDbwIbUMbq+C2A3Y5qcdw6EeKjPm7idgcLxK83j/Cqkl82o16DyEea3aM=
X-Received: by 2002:adf:df89:: with SMTP id z9mr18955604wrl.336.1636547981498;
 Wed, 10 Nov 2021 04:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-6-arnd@kernel.org>
 <YYpMcKlcZ3JWqp5M@smile.fi.intel.com> <CAK8P3a0VsDG3af1YkRRb=5bmvZ4zP3Du492hE_jyUWOwnYph_w@mail.gmail.com>
 <CACRpkdacYt4kS2QS4-W83ZtWWtTaAETeH8Buer2wOXBOoBK=qA@mail.gmail.com>
In-Reply-To: <CACRpkdacYt4kS2QS4-W83ZtWWtTaAETeH8Buer2wOXBOoBK=qA@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 10 Nov 2021 13:39:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2jroy_0ad7BYb59s5Dz7kOZBRbL4mqj5oJ6M-W=v_RFw@mail.gmail.com>
Message-ID: <CAK8P3a2jroy_0ad7BYb59s5Dz7kOZBRbL4mqj5oJ6M-W=v_RFw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] gpiolib: shrink further
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 11:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Nov 9, 2021 at 12:18 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > Ideally we should only use linux/gpio/consumer.h, which is required for
> > gpiod_set_debounce(). of_gpio.h is still needed for of_get_named_gpio()
> > and should be taken out once we change this to gpiod_get(), while
> > linux/gpio.h is still needed for gpio_is_valid()/gpio_get_value() and should
> > be removed when those are changed to the gpiod_ versions.
> >
> > We could do an intermediate patch that converts one half of the
> > interface, something like
>
> When I convert stuff I try to go all the way when I can. It can
> be a bit daring if no one is there to test changes.
>
> The patch looks good though apart from:
>
> > -               ts->gpio_pendown = pdata->gpio_pendown;
> > +               ts->gpio_pendown = gpio_to_desc(pdata->gpio_pendown);
>
> I usually even go into the defined platform data and try to convert
> the boardfile to use a descriptor table so this is never needed.
> (But, more work.)

Yes, I noticed. I had done some conversions for pxa this way, I should
look in my tree if I should resend those.

My hope would be that by making the steps smaller, it's easier to find
people that are willing and able to help out. From looking at it so far,
I would partition the problem something like:

a) Remove the (now) trivial wrappers around gpiod_*() functions
by using open-coded gpio_to_desc() calls everywhere. This doesn't
improve the code, but it can be trivially scripted and it should help
by making it less practical to put new users in.

b) one driver/subsystem at a time, replace all calls to
{devm_,}gpio_{free,request{,_one}} with a new
struct gpio_desc *gpiod_get_legacy(struct device *dev, int gpio, enum
gpiod_flags flags);
This takes the conversion only half-way, but is much more manageable
for a random contributor or reviewer, and it undoes the ugly bits
added in step a), making it a clear improvement.

c) convert the boardfile/platform_data/of_get_named_gpio side along with
the corresponding s/gpiod_get_legacy/gpiod_get/, which is now a fairly simple
change on the driver side, while the platform side can be reviewed by
the platform
maintainers.

> Examples:
> git log -p --author=Walleij arch/arm/mach-pxa/
>
> > -       pdata->gpio_pendown = of_get_named_gpio(dev->of_node,
> > "pendown-gpio", 0);
> > +       ts->gpio_pendown = gpiod_get(dev, "pendown-gpio", GPIOD_IN);
>
> Needs to be just gpiod_get(dev, "pendown", GPIOD_IN); the new
> API tries the "-gpio[s]" suffixes when going into the device tree.

Ok, got it.

        Arnd
