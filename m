Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732AF162F69
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 20:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgBRTJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 14:09:25 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33125 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgBRTJY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 14:09:24 -0500
Received: by mail-oi1-f196.google.com with SMTP id q81so21273981oig.0;
        Tue, 18 Feb 2020 11:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4zbrnNvTNHgXxwjMJnfhT5sGHXVeYA3py+fC4nnQX1g=;
        b=hxHpfGZ1eg9pnSfPg5YL2okaL4jIsS3ewInVnRJIojrOl5G/z0s1qZnXQGBlQykB0f
         hSlxBgqWb6BCYu8bIp24/4I7qlQDPuGIv4AI3vUioZ4UzFg8hxphPf0RRLzr+cldvXl3
         7C8RA+QYFKhThMLd+tcMT8v+n/yY//kQik1u4j95VqkNDyWyFsfU3abb2imPh0UvuMRy
         JAZWUXCnV6nEgfNcW+hu2OWemlrp55oaqJSU+18nZ18z8euYMqrz5sAdol8ixHfddVpH
         mlgv/p2nYrTIhUd4U29RfZ7i9N/eqnMUsC2KR+zyUnzpgKnXfQXQ4qa6nu1qDTLsG3i4
         IzWQ==
X-Gm-Message-State: APjAAAUCcdYj7HXVOR0jJtNGE+s7v2r1hNaO/oyoyr0yqCNQEBSmwIdM
        3efZyMZ+BPjiTA5E+uxUwe6QBHivcrjFlUSxGH4=
X-Google-Smtp-Source: APXvYqwnKTCIB9GTLLpEL5W7g+LauaFKN7iZKQPh2++RZaJoaT+SssBYOvEoCXI/Jb080pGI7GySD9qCX6q6Z+PF39M=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr2308514oia.102.1582052963942;
 Tue, 18 Feb 2020 11:09:23 -0800 (PST)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be>
 <20200218151812.7816-5-geert+renesas@glider.be> <e2530fff-a17c-ae90-ba92-360b828582da@infradead.org>
In-Reply-To: <e2530fff-a17c-ae90-ba92-360b828582da@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Feb 2020 20:09:12 +0100
Message-ID: <CAMuHMdU9=vgO6ohoYTQMGjoFzhRy=4hYGjVyRsTK2uoNsU08XQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] docs: gpio: Add GPIO Aggregator documentation
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

Thanks for the hint!

> > +             Example: Instantiate a new GPIO aggregator by aggregating GPIO
> > +             19 of "e6052000.gpio" and GPIOs 20-21 of "gpiochip2" into a new
> > +             gpio_chip:
> > +
> > +             .. code-block:: bash
> > +
> > +                 echo 'e6052000.gpio 19 gpiochip2 20-21' > new_device
> > +
>
> Does the above command tell the user that the new device is named
> "gpio-aggregator.0", as used below?

Yes, it will be printed through the kernel log, cfr. the sample session in
the cover letter.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
