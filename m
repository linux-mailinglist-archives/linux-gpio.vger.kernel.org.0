Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3378410B173
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 15:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfK0Odr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 27 Nov 2019 09:33:47 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37618 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfK0Odr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 09:33:47 -0500
Received: by mail-oi1-f195.google.com with SMTP id 128so12195533oih.4;
        Wed, 27 Nov 2019 06:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p4HQ0sBvX9KwKME5QSEdWqGhxNVzafG2qhuy+QctP4M=;
        b=uIu88hPH1HKUcJ9FxgIQiprCpNhBB3D/sjX+Z3Buoc3AY63eSySYBxawinLs6HB6ak
         zufvG2EoASpJW4XPnzxzHwG1rlMVyeKe3ZNCeUEHK7NaAQEPF3hHHk/ZT6rbeQB3ct6r
         ELxVeKaPffJqNdMQnrI5XdNkjLZC8Rjz9wPZIeG+PZqXI7EQpkrCLxR3w7Luf9iDTPV5
         /quCP4xMzEftrmR/M6Gtrmkh1AlUIy7P9LNX9/hcFqFLk8M15dB6JogP3eYYNFrK4cNo
         H2vByTo8FwlazB57PN3FpoWbmHSaDHpdWyhrRK7Q/SY+v4kCx9+mtCuStIq08XIKNkMo
         s7sA==
X-Gm-Message-State: APjAAAXTwa0AZ28VipTYnZc8636eEGfZjcCxegeiRt/BV5yfvpHuyTBl
        pd46WN4VEFe4E4sOpkoN6hELorBye9nwkAivyhU=
X-Google-Smtp-Source: APXvYqxCCNIKdr71l4+aem/37DJmvPbfkWnFnSlhjT3Aiy6bb+myMARYI5vlJfzw8lh/LBhhdEQ2bi0iWvwnKGpu9eY=
X-Received: by 2002:a05:6808:b17:: with SMTP id s23mr4564212oij.102.1574865225731;
 Wed, 27 Nov 2019 06:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be> <20191127141529.GA18189@vmlxhi-102.adit-jv.com>
In-Reply-To: <20191127141529.GA18189@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Nov 2019 15:33:34 +0100
Message-ID: <CAMuHMdVMoo0rJ-Ji1ek-DqHEkRqM5Fk5o9RzQV08Z8SSdS9APA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Eugeniu,

On Wed, Nov 27, 2019 at 3:15 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Wed, Nov 27, 2019 at 09:42:51AM +0100, Geert Uytterhoeven wrote:
> > +static bool isrange(const char *s)
> > +{
> > +     size_t n = strlen(s);
>
> Cppcheck 1.40-18521-ge6d692d96058:
> drivers/gpio/gpio-aggregator.c:69:11: style: Variable 'n' is assigned a value that is never used. [unreadVariable]
>
> Smatch v0.5.0-6150-gc1ed13e4ee7b:
> drivers/gpio/gpio-aggregator.c:69 isrange() warn: unused return: n = strlen()

Correct, this is a remainder of code present temporarily during development.
Will drop.

(where are the days gcc itself warned about that?)

> > +     aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
> > +     if (!aggr->lookups) {
> > +             res = -ENOMEM;
> > +             goto remove_idr;
> > +     }
>
> s/aggr->lookups/aggr->lookups->dev_id/ ?

Thanks, will fix.

> > +static int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> > +                              unsigned long *bits)
> > +{
> > +     struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> > +     unsigned long *values, flags;
>
> gcc 9.2.1:
> warning: ‘flags’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>
> [..]
>
> > +static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> > +                               unsigned long *bits)
> > +{
> > +     struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> > +     unsigned long *values, flags;
>
> gcc 9.2.1, same as above:
> warning: ‘flags’ may be used uninitialized in this function [-Wmaybe-uninitialized]

So newer gcc is (again) no longer smart enough to notice the check is
the same for initializer and user...

> Should these be silenced like in 2bf593f101f3ca ("xilinx_uartps.c:
> suppress "may be used uninitialised" warning") ?

TBH, I'm not a big fan of silencing false positives.
But if people like to see flags preinitialized to zero, that can be done...

> I plan to do some runtime testing soon.

Thanks, looking forward to the results!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
