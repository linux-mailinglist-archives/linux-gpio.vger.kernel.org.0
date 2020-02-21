Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2313168395
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 17:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgBUQeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 11:34:14 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46488 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgBUQeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 11:34:14 -0500
Received: by mail-oi1-f194.google.com with SMTP id a22so2122755oid.13;
        Fri, 21 Feb 2020 08:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q0P9tu6IOsuIOQ9cj+JFMIkV9AXW3CYPDjGH2uYPm8M=;
        b=TQan+uI+buGQSXnVw9oHBVYIl68M0Y0nZhJSw3qYaBAcnViQ2WE+xmpF7EGWl0C5MG
         AFAYukVTvmPds0Yt1uZHImTdyhsE57op0/EoFBu7UANTInihLVOHjJ2LuuxNDyz+Jxt5
         7h/VB8CivGoN5BgC06wfIYUC2h3LJvDv/OxXHq4rZlUlfTTmDYkv9NBQzpq7VUdloguW
         8eoYJEWhtm6ny7lvbKekL9xfjF4BUUP+z6C8cw/H0tD/alyL93c0X4K1e5/SHII8ppNO
         iqn+eSP95Mm7EtABezqcGciJ5oFvwGqNYbrDzjkyPXDc7kyk+w1Xlz4yDWNfx67VQt1P
         BXJg==
X-Gm-Message-State: APjAAAUrHi/8Nfwh6StJyLqXLHMdvEPp2NO2ws7uODFnGje9uJdNbnzN
        3/JwM+hRTMVwoUN/M3rvgWXyaM5ZKqkYy8A6KLg=
X-Google-Smtp-Source: APXvYqzPNoAH+zVsto1+IiOMGfW8xsdQo0YD/gttJz8Iqi71pUo1KidDfXV90s/3JMzKKHdE/I36dl+GbJbfTmLaY4E=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr2773907oif.54.1582302853428;
 Fri, 21 Feb 2020 08:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be>
 <20200218151812.7816-5-geert+renesas@glider.be> <e2530fff-a17c-ae90-ba92-360b828582da@infradead.org>
In-Reply-To: <e2530fff-a17c-ae90-ba92-360b828582da@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 17:34:02 +0100
Message-ID: <CAMuHMdUFV0nbfrpxY60av2x+UUN62wDiVLbcEG83133aqfFcUQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] docs: gpio: Add GPIO Aggregator documentation
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Randy,

On Tue, Feb 18, 2020 at 7:30 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 2/18/20 7:18 AM, Geert Uytterhoeven wrote:
> > Document the GPIO Aggregator, and the two typical use-cases.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
> > @@ -0,0 +1,102 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +GPIO Aggregator
> > +===============
> > +
> > +The GPIO Aggregator allows to aggregate GPIOs, and expose them as a new
>
> "allows" really wants an object following the verb [although the kernel sources
> and docs have many cases of it not having an object].  Something like
>
>                        allows {you, one, someone, users, a user} to aggregate

Changing to:

    provides a mechanism to aggregate GPIOs

> > +gpio_chip.  This supports the following use cases.
> > +
> > +
> > +Aggregating GPIOs using Sysfs
> > +-----------------------------
> > +
> > +GPIO controllers are exported to userspace using /dev/gpiochip* character
> > +devices.  Access control to these devices is provided by standard UNIX file
> > +system permissions, on an all-or-nothing basis: either a GPIO controller is
> > +accessible for a user, or it is not.
> > +
> > +The GPIO Aggregator allows access control for individual GPIOs, by aggregating

Changing to:

    provides access control for a set of one or more GPIOs

> > +them into a new gpio_chip, which can be assigned to a group or user using
> > +standard UNIX file ownership and permissions.  Furthermore, this simplifies and
> > +hardens exporting GPIOs to a virtual machine, as the VM can just grab the full
> > +GPIO controller, and no longer needs to care about which GPIOs to grab and
> > +which not, reducing the attack surface.

> > +Generic GPIO Driver
> > +-------------------
> > +
> > +The GPIO Aggregator can also be used as a generic driver for a simple
> > +GPIO-operated device described in DT, without a dedicated in-kernel driver.
> > +This is useful in industrial control, and is not unlike e.g. spidev, which
> > +allows to communicate with an SPI device from userspace.
>
>    allows {choose an object} to communicate

Changing to:

    allows the user to communicate

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
