Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5902A44B5B4
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 23:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343537AbhKIWWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 17:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343542AbhKIWVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 17:21:02 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE95C061234
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 14:17:48 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so926533otf.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 14:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tm6yQehIZfxegQ8LQXmzpFcIGj8PrEgZNef1SIRm8V4=;
        b=gW0Q1vghMpdNvpEzqaYw/vBySsb/uRGOLQyXIpWbwKfyLOIK5TbfKgHgOHsomzNzQ1
         iqSUqrjeZ94H3uNw+UFDShc83N0fCNS6vZxdNtWsAMMAt48s6BUSzc31oLPZh5ZSz+NI
         oXhBndndVnFgNqFVoC2Tg0vcycUpR5I5FfGlec0wPa9/ylYz2GwNkIrTESXkqLDnMm7v
         mDstpsh66kKPpBp4PvtnTkI3ObI1NQmy4Ze1y008VeSMhqa4bu7wd2mCzot6zpNNDP8s
         JeX0a8SeaBdsRPlcN8Tj+AR44DQiLz/YA6CQggSwGYRajUI36iL/8V4mI9jnGtTxCeeU
         3h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tm6yQehIZfxegQ8LQXmzpFcIGj8PrEgZNef1SIRm8V4=;
        b=EKGagH0K6kuZ/I0a7mDx4nn3E5Ljonkb+6SK4oYlvTwa4/8IWY7Iq0UQVAp/AJ842r
         4qXQfvT7m1d/PRKeXiQQyXvYbQ8mtZGt4wmpc0nvV9ruMiLoWkPnu9io/5EFzqgpq3aK
         fhoMfsbu9/Zdjb4rbPTgq6Jikw/Ret8dmfwdWNqSX4PsnLE9JHG8n9qQbvXV22rb6l3e
         7ZcVFysIkytBguZEyuNc8IFNFqaX7Fa5HoGRPttIlIcUWpeVz8jJU4T5Vplv2Q3bG4Ah
         0E3Nzl/VoygwwiD/6Q34Q6DEmUJbFJeq2RC8kgKEqit0yFcs0hdJynFH9mLQbuMVcCDD
         0AkQ==
X-Gm-Message-State: AOAM533xXqZZmmiJ2wXftp/XBIjcw5yqTTk5ub7FzmYpsH6wsBMwBb/d
        oAnhFfu/tf3CZinlNzKhVqsucf41hEfvIdAraCgYeg==
X-Google-Smtp-Source: ABdhPJzo4LmUY1pFN2oW/gS3+tIDlYsTBZs9R18Xd1P3754m/dv0m7cnbD7ZvDQF9ZkQEmbRVyX6LHfPFNWuBda049M=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr9026567otk.179.1636496268074;
 Tue, 09 Nov 2021 14:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-6-arnd@kernel.org>
 <YYpMcKlcZ3JWqp5M@smile.fi.intel.com> <CAK8P3a0VsDG3af1YkRRb=5bmvZ4zP3Du492hE_jyUWOwnYph_w@mail.gmail.com>
In-Reply-To: <CAK8P3a0VsDG3af1YkRRb=5bmvZ4zP3Du492hE_jyUWOwnYph_w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 23:17:34 +0100
Message-ID: <CACRpkdacYt4kS2QS4-W83ZtWWtTaAETeH8Buer2wOXBOoBK=qA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] gpiolib: shrink further
To:     Arnd Bergmann <arnd@kernel.org>
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

On Tue, Nov 9, 2021 at 12:18 PM Arnd Bergmann <arnd@kernel.org> wrote:

> Ideally we should only use linux/gpio/consumer.h, which is required for
> gpiod_set_debounce(). of_gpio.h is still needed for of_get_named_gpio()
> and should be taken out once we change this to gpiod_get(), while
> linux/gpio.h is still needed for gpio_is_valid()/gpio_get_value() and should
> be removed when those are changed to the gpiod_ versions.
>
> We could do an intermediate patch that converts one half of the
> interface, something like

When I convert stuff I try to go all the way when I can. It can
be a bit daring if no one is there to test changes.

The patch looks good though apart from:

> -               ts->gpio_pendown = pdata->gpio_pendown;
> +               ts->gpio_pendown = gpio_to_desc(pdata->gpio_pendown);

I usually even go into the defined platform data and try to convert
the boardfile to use a descriptor table so this is never needed.
(But, more work.)

Examples:
git log -p --author=Walleij arch/arm/mach-pxa/

> -       pdata->gpio_pendown = of_get_named_gpio(dev->of_node,
> "pendown-gpio", 0);
> +       ts->gpio_pendown = gpiod_get(dev, "pendown-gpio", GPIOD_IN);

Needs to be just gpiod_get(dev, "pendown", GPIOD_IN); the new
API tries the "-gpio[s]" suffixes when going into the device tree.

Yours,
Linus Walleij
