Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2012A213B
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Nov 2020 21:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgKAUIr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Nov 2020 15:08:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:55876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726848AbgKAUIr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 1 Nov 2020 15:08:47 -0500
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B491821556;
        Sun,  1 Nov 2020 20:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604261326;
        bh=SIgTKd0N8nhDYNLTmY/hNqgtdgwC5P3F+kkl30geDQo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xj0Vr0OloDVIiak+8o1E1ZLBMrKXcEo4oGp7EfwYC0n8Kp4Dj2FkYTNKxSsKxJuX3
         PDij45UUKI9PerviJAQ4O9gxpo4a+NygiiUM2WxIOg4chxvcpnwS5Jri6fMDB/EbEd
         G43s90Bhy4YpP9VNYRnLLVA7PyxThGlOPT3TeKaA=
Received: by mail-qk1-f170.google.com with SMTP id s14so9806778qkg.11;
        Sun, 01 Nov 2020 12:08:46 -0800 (PST)
X-Gm-Message-State: AOAM5321odUFDCLBEcUX35/e8AAgzUYQ+yZ48fC/whiXvCyrMwPVGY6n
        eWtZHlu3f6mh7F8Wkos+Uvx8So6thxT2CpvPHFA=
X-Google-Smtp-Source: ABdhPJxhnYRlBcix9TfPYNQDdkwkJh1sZtaGL6/VFh5tr8iM23Pp8sqLnuw8PwNj+qi4eZfBqpSXNWo2ER1sOikOrEE=
X-Received: by 2002:a05:620a:22c9:: with SMTP id o9mr12026019qki.286.1604261325894;
 Sun, 01 Nov 2020 12:08:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1603055402.git.syednwaris@gmail.com> <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com> <20201101150033.GA68138@shinobu>
In-Reply-To: <20201101150033.GA68138@shinobu>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sun, 1 Nov 2020 21:08:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
Message-ID: <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 1, 2020 at 4:00 PM William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
>
> On Thu, Oct 29, 2020 at 11:44:47PM +0100, Arnd Bergmann wrote:
> > On Sun, Oct 18, 2020 at 11:44 PM Syed Nayyar Waris <syednwaris@gmail.com> wrote:
> > >
> > > This patch reimplements the xgpio_set_multiple() function in
> > > drivers/gpio/gpio-xilinx.c to use the new generic functions:
> > > bitmap_get_value() and bitmap_set_value(). The code is now simpler
> > > to read and understand. Moreover, instead of looping for each bit
> > > in xgpio_set_multiple() function, now we can check each channel at
> > > a time and save cycles.
> >
> > This now causes -Wtype-limits warnings in linux-next with gcc-10:
>
> Hi Arnd,
>
> What version of gcc-10 are you running? I'm having trouble generating
> these warnings so I suspect I'm using a different version than you.

I originally saw it with the binaries from
https://mirrors.edge.kernel.org/pub/tools/crosstool/, but I have
also been able to reproduce it with a minimal test case on the
binaries from godbolt.org, see https://godbolt.org/z/Wq8q4n

> Let me first verify that I understand the problem correctly. The issue
> is the possibility of a stack smash in bitmap_set_value() when the value
> of start + nbits is larger than the length of the map bitmap memory
> region. This is because index (or index + 1) could be outside the range
> of the bitmap memory region passed in as map. Is my understanding
> correct here?

Yes, that seems to be the case here.

> In xgpio_set_multiple(), the variables width[0] and width[1] serve as
> possible start and nbits values for the bitmap_set_value() calls.
> Because width[0] and width[1] are unsigned int variables, GCC considers
> the possibility that the value of width[0]/width[1] might exceed the
> length of the bitmap memory region named old and thus result in a stack
> smash.
>
> I don't know if invalid width values are actually possible for the
> Xilinx gpio device, but let's err on the side of safety and assume this
> is actually a possibility. We should verify that the combined value of
> gpio_width[0] + gpio_width[1] does not exceed 64 bits; we can add a
> check for this in xgpio_probe() when we grab the gpio_width values.
>
> However, we're still left with the GCC warnings because GCC is not smart
> enough to know that we've already checked the boundary and width[0] and
> width[1] are valid values. I suspect we can avoid this warning is we
> refactor bitmap_set_value() to increment map seperately and then set it:

As I understand it, part of the problem is that gcc sees the possible
range as being constrained by the operations on 'start' and 'nbits',
in particular the shift in BIT_WORD() that put an upper bound on
the index, but then it sees that the upper bound is higher than the
upper bound of the array, i.e. element zero.

I added a check

      if (start >= 64 || start + size >= 64) return;

in the godbolt.org testcase, which does help limit the start
index appropriately, but it is not sufficient to let the compiler
see that the 'if (space >= nbits) ' condition is guaranteed to
be true for all values here.

> static inline void bitmap_set_value(unsigned long *map,
>                                     unsigned long value,
>                                     unsigned long start, unsigned long nbits)
> {
>         const unsigned long offset = start % BITS_PER_LONG;
>         const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
>         const unsigned long space = ceiling - start;
>
>         map += BIT_WORD(start);
>         value &= GENMASK(nbits - 1, 0);
>
>         if (space >= nbits) {
>                 *map &= ~(GENMASK(nbits - 1, 0) << offset);
>                 *map |= value << offset;
>         } else {
>                 *map &= ~BITMAP_FIRST_WORD_MASK(start);
>                 *map |= value << offset;
>                 map++;
>                 *map &= ~BITMAP_LAST_WORD_MASK(start + nbits);
>                 *map |= value >> space;
>         }
> }
>
> This avoids adding a costly conditional check inside bitmap_set_value()
> when almost all bitmap_set_value() calls will have static arguments with
> well-defined and obvious boundaries.
>
> Do you think this would be an acceptable solution to resolve your GCC
> warnings?

Unfortunately, it does not seem to make a difference, as gcc still
knows that this compiles to the same result, and it produces the same
warning as before (see https://godbolt.org/z/rjx34r)

         Arnd
