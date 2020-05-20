Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6834C1DB449
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 14:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgETM5S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 08:57:18 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46451 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgETM5S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 08:57:18 -0400
Received: by mail-oi1-f193.google.com with SMTP id b3so2760145oib.13;
        Wed, 20 May 2020 05:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJamwLm96ytvqLYKUjvZ9u/+2q4WNnQotOo2fde5CyY=;
        b=RYnh5AHn7EaIbWpJHztdHUvamESoormlMzEx+3VLrLoja9JM5+OB73jLEuj+quLM9x
         JINTDcwi+ZieErAw3P1lNU3Lr7zi6kZ5M3zZURm3nKhltNCAIv/CX/scDZH/QrM6NcPd
         AOQdKwaHL+spyQMipPI3l+nQwR/XnMqCuE9BuQwHDqzDsNlH4oqrVQbYAiWnjKVYqlW8
         LwxQIBdcSjAWvImclN8db/CBrHEGNtdWCenVQ3dV6rFF7k2YIecrb6w7+i2z6u14dfr7
         FVWEJk8vxHgksPNC/nYGlsBjlTYC6L5NlR2ymXD3lNQYiT2UZQ5LEvaALel0MXuGuGaW
         /08w==
X-Gm-Message-State: AOAM5337vv65OmtvByjKI96Obo1UlAOVdnxUb9CrUynf8jt7Xu3GwePh
        f1C+PE1EgWtJUIUWvuMtuZQzjNs0FcHR8aK8Yho=
X-Google-Smtp-Source: ABdhPJwu+X5b8qR/tGxmz/DLvGSkjMTN6arpme3EHT/9IgTdRR+s5gJsMua0uE/HtMU43Dl221Icff70S4LCyfQLDG4=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr3056906oic.54.1589979437182;
 Wed, 20 May 2020 05:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200511145257.22970-1-geert+renesas@glider.be>
 <20200520121420.GA1867563@smile.fi.intel.com> <CAMuHMdW9EsRLYYTL0pd-PqqZs5WcUfK8i2uceNwJnSvAQKuVgw@mail.gmail.com>
 <CAHp75Vc9=1cD81TDuaGuFQpBcHaKqEZKv8tA7ZGBbDJ6MKq6kw@mail.gmail.com> <CAHp75VcARgxf-Ty77mk2PJ0BUxJsXQdDLMffiDdv1gCkF_VMtg@mail.gmail.com>
In-Reply-To: <CAHp75VcARgxf-Ty77mk2PJ0BUxJsXQdDLMffiDdv1gCkF_VMtg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 May 2020 14:57:05 +0200
Message-ID: <CAMuHMdXA8skK86yM4uX=2=ib0PNZvuvVdu4GzoD7zYngwz1emg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] gpio: Add GPIO Aggregator
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
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

Hi Andy,

On Wed, May 20, 2020 at 2:41 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 20, 2020 at 3:40 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, May 20, 2020 at 3:38 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, May 20, 2020 at 2:14 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Mon, May 11, 2020 at 04:52:51PM +0200, Geert Uytterhoeven wrote:
> >
> > ...
> >
> > > > Sorry for late reply, recently noticed this nice idea.
> > > > The comment I have is, please, can we reuse bitmap parse algorithm and syntax?
> > > > We have too many different formats and parsers in the kernel and bitmap's one
> > > > seems suitable here.
> > >
> > > Thank you, I wasn't aware of that.
> > >
> > > Which one do you mean? The documentation seems to be confusing,
> > > and incomplete.
> > > My first guess was bitmap_parse(), but that one assumes hex values?
> > > And given it processes the unsigned long bitmap in u32 chunks, I guess
> > > it doesn't work as expected on big-endian 64-bit?
> > >
> > > bitmap_parselist() looks more suitable, and the format seems to be
>
> > > compatible with what's currently used, so it won't change ABI.
>
> What ABI? We didn't have a release with it, right? So, we are quite

ABI = the parameters it accepts currently.

> flexible for few more weeks to amend it.

Indeed, we have time to make changes until the release of v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
