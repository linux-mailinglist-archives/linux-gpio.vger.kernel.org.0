Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652252BC9B9
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Nov 2020 22:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgKVVtK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Nov 2020 16:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgKVVtK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Nov 2020 16:49:10 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46477C0613CF;
        Sun, 22 Nov 2020 13:49:10 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id v12so13023047pfm.13;
        Sun, 22 Nov 2020 13:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+kGNoLLnyvYj54sIYNg+yEQxr8OU1H3KIfMv0EVZHNc=;
        b=gAPL0Zd0tcbTyPHShleI5QTPJM5FZ8BZeX/kKAVCiMn6xPLCNzqV4Bv+1hj0wPmP0e
         bEYviEFF22VqkLh0zJ0/qqyNjH2Nw940qoYeADdw6FZURkBBv40r1e9vq2WWM2auqRgs
         XFyhC5bc3cfagFkKLuc5l1Y1/bckw8yQFauK7GeTWVaMa7fWJPy8ufX1sFl/OgjbpjWa
         rpU3Lg+n/0ItdLcX3gz36lFPlT/yjYJ2W80K2t1j/3/LauvAFyOCEL6/5OnzM24vnvfH
         sttEq/Bd34zpVetEXIvwgYN2FJWENbEf7i2q8WGtSsTMxalQBaxW2uzBQlT1b5XWB8oo
         lzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+kGNoLLnyvYj54sIYNg+yEQxr8OU1H3KIfMv0EVZHNc=;
        b=Y3e9yqcuHoVLKIzkt5DTU/1p/cv+a/puLnPVkwt/Bn+ONpoofUk4eY3AwTYdPUnw/x
         n/xha4Tq+vMseAj+XnnA0f6xA3tlQKW1l0DRjcz1ubsMz1qglu0ZDGOEmmFLFfJpxwE1
         RsepUcnCt6I3OzL+tXsrpBkhTnr49AzLxZZqa2eO2iTqb/dCmPA0rw/6/y+9aRo1xRkT
         Cl8oNoB6Kq7hjLGU+c852HpkGs34a4AfXDkcKLVt7movs0A5Fhi/x4aiHKPXWpNARtJc
         3NFSk3NNm8ho39lhnwEQVai5flvtdGby0O41A/vF4fwk/PI39xo47GOy8oEWc23rSROR
         DZ/w==
X-Gm-Message-State: AOAM530V1XlU7P2bQeSGnLGv7c5iHEjvHf6bpQjWqNybX+IRo8iHOwhY
        ynDLePnPgGTE6+T1i3VnaeD1E5vXfW099fKcQb8K76iMK+fFm7O4
X-Google-Smtp-Source: ABdhPJxV6lA6ghtou6EpKCE18fdMtuWx0iK+rbIJw372e6dZDjyUjLMB9YO7mnJJ6TdK8ZJQPw4lxQtRj7hrg4sLFHE=
X-Received: by 2002:a62:55c6:0:b029:197:f982:e980 with SMTP id
 j189-20020a6255c60000b0290197f982e980mr4549251pfb.40.1606081749791; Sun, 22
 Nov 2020 13:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20201122092548.61979-1-gnurou@gmail.com> <CAAVeFuJ+j5qDq457h-LESmd5CY+rXUFQqGpn960S2Cz0d1O0Jw@mail.gmail.com>
In-Reply-To: <CAAVeFuJ+j5qDq457h-LESmd5CY+rXUFQqGpn960S2Cz0d1O0Jw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 22 Nov 2020 23:48:52 +0200
Message-ID: <CAHp75Vf7OaaZZhsGg=PVQfVXCdfKozZzizdUBQOQ-YNXVySwXQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: fix typo and unclear legacy API section
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 22, 2020 at 11:31 AM Alexandre Courbot <gnurou@gmail.com> wrote:
>
> On Sun, Nov 22, 2020 at 6:25 PM Alexandre Courbot <gnurou@gmail.com> wrote:
> >
> > The "Interacting With the Legacy GPIO Subsystem" of the documentation
> > was unclear at best, and even included a sentence that seems to say the
> > opposite of what it should say about the lifetime of the return value of
> > the conversion functions.
> >
> > Try to clarify things a bit and hopefully make that section more
> > readable.
> >
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
>
> Realized after sending this should also have a
>
> Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Apologies for the omission Andy!

NP

And perhaps
BugLink: https://stackoverflow.com/q/64455505/2511795

>
> > ---
> >  Documentation/driver-api/gpio/consumer.rst | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
> > index 423492d125b9..173e4c7b037d 100644
> > --- a/Documentation/driver-api/gpio/consumer.rst
> > +++ b/Documentation/driver-api/gpio/consumer.rst
> > @@ -440,18 +440,20 @@ For details refer to Documentation/firmware-guide/acpi/gpio-properties.rst
> >
> >  Interacting With the Legacy GPIO Subsystem
> >  ==========================================
> > -Many kernel subsystems still handle GPIOs using the legacy integer-based
> > -interface. Although it is strongly encouraged to upgrade them to the safer
> > -descriptor-based API, the following two functions allow you to convert a GPIO
> > -descriptor into the GPIO integer namespace and vice-versa::
> > +Many kernel subsystems and drivers still handle GPIOs using the legacy
> > +integer-based interface. It is strongly recommended to update these to the new
> > +gpiod interface. For cases where both interfaces need to be used, the following
> > +two functions allow to convert a GPIO descriptor into the GPIO integer namespace
> > +and vice-versa::
> >
> >         int desc_to_gpio(const struct gpio_desc *desc)
> >         struct gpio_desc *gpio_to_desc(unsigned gpio)
> >
> > -The GPIO number returned by desc_to_gpio() can be safely used as long as the
> > -GPIO descriptor has not been freed. All the same, a GPIO number passed to
> > -gpio_to_desc() must have been properly acquired, and usage of the returned GPIO
> > -descriptor is only possible after the GPIO number has been released.
> > +The GPIO number returned by desc_to_gpio() can safely be used as a parameter of
> > +the gpio\_*() functions for as long as the GPIO descriptor `desc` is not freed.
> > +All the same, a GPIO number passed to gpio_to_desc() must first be properly
> > +acquired using e.g. gpio_request_one(), and the returned GPIO descriptor is only
> > +considered valid until that GPIO number is released using gpio_free().
> >
> >  Freeing a GPIO obtained by one API with the other API is forbidden and an
> >  unchecked error.
> > --
> > 2.29.2
> >



-- 
With Best Regards,
Andy Shevchenko
