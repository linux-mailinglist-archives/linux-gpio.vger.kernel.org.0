Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA4C44ABDE
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243292AbhKIKx3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:53:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:49076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245455AbhKIKxU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:53:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17F71611F0;
        Tue,  9 Nov 2021 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636455035;
        bh=EQ2Y5pkSSbqTDlcZZ+vlV+jRlTkeuJkYjOzMF69zAo0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qS1n17lVGL0kEBUQiS9z+dUebAG5JndAxle9gkY6QJ6a4ZppPfdV96Q52ICuCXG2f
         7Pbsd/Cnh2ppvQDjbBoK7O2t9QSd0/wJRpiNI476jbk5s4xIjPD4O6oEZHJIK7aGBn
         uNFY/OVX/D9sCtwLIncBdo+ce7jBOA+7oRxeVkH3zFxMbq5yGRWKFKU+s2r3Ftuhjb
         mVtNgMC3ko3lP3uMhM+IpajSS+rLw3Siy2SVGmB9qTx/iTU7PX9Q/h+DfZYzhAeJ7X
         4KCSnnA1+r4sqWg9lFKs1jrj771S0/tDmxGx8ht+zYf1uhxOsLR6OD6XVygfvYwfcT
         pzhumg/d0UmQg==
Received: by mail-wm1-f48.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so1916039wmb.5;
        Tue, 09 Nov 2021 02:50:35 -0800 (PST)
X-Gm-Message-State: AOAM532V41LQelJnUQLE/Z+BluKlzW3mar7PIrsnnkQE02cOd+Ik/9PM
        c54kqCHYUBNGgL61qMLAEKlk4fJEYRxuLDOGmK4=
X-Google-Smtp-Source: ABdhPJwQBO/Ss3ZA0/3Ekr+aXKUm/5vIOjwi4khqDaKsRbKgRpm/1VlgiHZXFtkNE8I27My8QQVBY/+teVR+2z0Y2Rg=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr5881966wmi.173.1636455033495;
 Tue, 09 Nov 2021 02:50:33 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-7-arnd@kernel.org>
 <YYpN3LzXz638l6FG@smile.fi.intel.com>
In-Reply-To: <YYpN3LzXz638l6FG@smile.fi.intel.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 9 Nov 2021 11:50:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a24wkBEAnWG8=LYoVR1oiTo0VKZ3iME+FYbDuHXJDjMOw@mail.gmail.com>
Message-ID: <CAK8P3a24wkBEAnWG8=LYoVR1oiTo0VKZ3iME+FYbDuHXJDjMOw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] gpiolib: remove legacy gpio_export
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 11:30 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 09, 2021 at 11:02:05AM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > There are only a handful of users of gpio_export() and
> > related functions.
> >
> > As these are just wrappers around the modern gpiod_export()
> > helper, remove the wrappers and open-code the gpio_to_desc
> > in all callers to shrink the legacy API.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> What I wish to see meanwhile is a section in the TODO list somewhere to clean
> up those modules that have gpio.h. Linus, do we have one in the kernel or is
> it your personal TODO?
>
> In case we have one in the kernel, please add there modules you modified in
> a way that they still need further attention.

I think the TODO list is in Linus' head, but it would include all the files
that use one of the interfaces in linux/gpio.h. I found about 350 of them,
so there is little point in listing them one at a time. IIRC Linus is going
through those one subsystem at a time.

It might help to make it harder to get new users if we add some pattern
matching to scripts/checkpatch.pl, and/or something for scripts/coccinelle/.
I don't think it's possible to convert a gpio_request() user to gpio_get()
in a scripted way because you usually have to change the platform side
at the same time as the driver side.

I also found that we have a ton of users of linux/of_gpio.h, which is
somewhere inbetween the linux/gpio.h interface and the
linux/gpio/consumer.h version.

> > @@ -259,17 +259,19 @@ static int evm_sw_setup(struct i2c_client *client, int gpio,
> >       char label[10];
> >
> >       for (i = 0; i < 4; ++i) {
> > +             struct gpio_desc *desc = gpio_to_desc(gpio + i);
> > +
> >               snprintf(label, 10, "user_sw%d", i);
> > -             status = gpio_request(gpio, label);
> > +             status = gpio_request(gpio + i, label);
>
> Shouldn't be gpiod_get() or so at the end?

Yes, but that would be a more invasive change that I think should be done
separately.

        Arnd
