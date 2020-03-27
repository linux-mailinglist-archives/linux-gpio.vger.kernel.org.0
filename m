Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2604F19532B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 09:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgC0IpX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 04:45:23 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40997 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgC0IpX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 04:45:23 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so8906097otf.8;
        Fri, 27 Mar 2020 01:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOBjyRt4JV8Fw0zzDZumBm7LVivMqi17PPfNiqHh3qk=;
        b=nNNtvb5JIc83n6idKlCJmdznoRwgO2XqukBnIqMVHR2iYiS1c0eQbQxNV+khns1Etz
         4a19wgV6Bu+yyQykC346Oc4laIsycpZmkDZQ0pAcfB7Tbbt/rWcA0IHWz6GZc4OK6RMH
         Tel2tXBp7fRhFyuFxu2Hh4l0hxBSQ+6kK6e0mQjk5I5SFffAaGKUCbxNcbeyzT+kCZFB
         TAVpLLmGR4zveD8PAUUZAp5yjfQmOs74roa7w2JDayt1VpGBdyhZdHgL4T2fRsOI0H3f
         QmTNvvo0o3CMGcyz2wtZWaabIwwkAwHjyuMDpl+xGCNnA+rR6ThX9QppUZPlgRaeVZPH
         V8Qg==
X-Gm-Message-State: ANhLgQ2yJ40qSCH3ljnZDz/B3IlhkWOVH4uThm15uwGHNJx/erY3xT64
        6UQMHcA8JUP371nKFCQblVc83c4CQTK89rUxvok=
X-Google-Smtp-Source: ADFU+vtagf4b+RAfGcuiioWln2gooMsQamKP8V2Ub80rkt/+u/ChxOOa1j8Iz++kwA+q3IcKZA+D0S4VCVlwIW0ISTU=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr9385922otk.250.1585298722494;
 Fri, 27 Mar 2020 01:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be> <20200324135653.6676-5-geert+renesas@glider.be>
 <CACRpkdZuQrPqFPyoop9pv6MVwqwz_C6ZNKMxWqSFXdAMkhbsvQ@mail.gmail.com>
In-Reply-To: <CACRpkdZuQrPqFPyoop9pv6MVwqwz_C6ZNKMxWqSFXdAMkhbsvQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Mar 2020 09:45:11 +0100
Message-ID: <CAMuHMdVpiO+KGRTF=83kubuuJF2p8TJhWe_X32amSTa6bXsCxg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] gpiolib: Introduce gpiod_set_config()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Mar 26, 2020 at 10:26 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 24, 2020 at 2:57 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > The GPIO Aggregator will need a method to forward a .set_config() call
> > to its parent gpiochip.  This requires obtaining the gpio_chip and
> > offset for a given gpio_desc.  While gpiod_to_chip() is public,
> > gpio_chip_hwgpio() is not, so there is currently no method to obtain the
> > needed GPIO offset parameter.
> >
> > Hence introduce a public gpiod_set_config() helper, which invokes the
> > .set_config() callback through a gpio_desc pointer, like is done for
> > most other gpio_chip callbacks.
> >
> > Rewrite the existing gpiod_set_debounce() helper as a wrapper around
> > gpiod_set_config(), to avoid duplication.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v6:
> >   - New.
>
> This is nice, I tried to actually just apply this (you also sent some
> two cleanups that I tried to apply) byt Yue's cleanup patch
> commit d18fddff061d2796525e6d4a958cb3d30aed8efd
> "gpiolib: Remove duplicated function gpio_do_set_config()"
> makes none of them apply :/

/me confused.

That commit was reverted later, so it shouldn't matter.

I have just verified, and both my full series and just this single
patch, do apply fine to all of current gpio/for-next, linus/master, and
next-20200327.  They even apply fine to gpio/for-next before or after
the two cleanups I sent, too.

What am I missing?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
