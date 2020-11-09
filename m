Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAC42ABF2D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 15:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730984AbgKIOtD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 09:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729454AbgKIOtD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 09:49:03 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C073C0613CF;
        Mon,  9 Nov 2020 06:49:03 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id x20so8504717ilj.8;
        Mon, 09 Nov 2020 06:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oNlgGSd4DUOO7ImXU1icnXQvqkJjamhOW1OkMFarb5U=;
        b=uK+enZDFhy/SMpEp3qhJIFHoJZtxC6RI/WQ2psKrAP7h2nZj0JBKrE/a9GeHDn0LUO
         ASKKFUOeJ7b/vkVKuocr2b/0nqznUipdKsKK74GmxOazVJ9/267MHXRNBqMxbY1UZwkJ
         wIH4dyghn1GQDktkYsGtjyqDFNQYk26tuy6cYJtRb7sRJAS8IVbMNwSSq6+s7z5Bef6i
         AE+4P4mXgF73/AZYGCtiYUju2k/q99TEqBrkypL3ZFJNwe7eourpRUa8zmq/zZLXvvii
         TNXZ/Xb0ilBZRmPrr2DBmedmCo+b4Q9EeruFcP7trTgRlBWXpY2yK8xrxo2KRW52hvKO
         9Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oNlgGSd4DUOO7ImXU1icnXQvqkJjamhOW1OkMFarb5U=;
        b=twNSkr4WXNniYzSH8kB/dJLusDeNZxwxOJtf7KDMhTz9yPyj84Lr/OIrY3ZmTMB0sA
         8xwp4hfnwIXEYmPGCzNNqr/o73GNLXdZy1PhgUBoOl8wXo4qI3haqON2fNfIe4slLb1k
         ATdCexRCxB6z07IOVKRGEVGYvlNioTbu9nHJk9IgO2i+cNoNqioE5eDhjErCiKOyoct0
         RBWe3gQfPCWJssP4DWSc3rMhykpWDFCsWCD3pZBSX9rXaZmULhrW8QoXZTt5DdrHvDP+
         0ANk5JOdIrFH2IKNh0F8qmTmwMNWLPnyy38kEWIP6AFf2uN2wioAXjk/npvVBgVQ1DF/
         CNdg==
X-Gm-Message-State: AOAM531tpNOUvspXKbdJTcSTQHTW9CKEo3xda71pbYZ1EZ/uMIpdsnqJ
        Liryl1ccxARdZGATq8s+I2RBbCiYxHFCsR/p+EI=
X-Google-Smtp-Source: ABdhPJw+6D/c0g1Fi+kWXpK/atafVkUv54yQC5girCMCwLaA3ISwifhOSqBr1TkSbl2qYraX6BxYj3dkreJ50dk/xQc=
X-Received: by 2002:a92:6f0e:: with SMTP id k14mr11088502ilc.13.1604933342486;
 Mon, 09 Nov 2020 06:49:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1603055402.git.syednwaris@gmail.com> <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu> <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed> <20201109134128.GA5596@shinobu> <20201109143845.GA8636@shinobu>
In-Reply-To: <20201109143845.GA8636@shinobu>
From:   Syed Nayyar Waris <syednwaris@gmail.com>
Date:   Mon, 9 Nov 2020 20:18:51 +0530
Message-ID: <CACG_h5pkCizF2WOzU7Fb9TdCMbQxE1JoQZ=JPrBACTEwEb03OA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
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

On Mon, Nov 9, 2020 at 8:09 PM William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
>
> On Mon, Nov 09, 2020 at 08:41:28AM -0500, William Breathitt Gray wrote:
> > On Mon, Nov 09, 2020 at 06:04:11PM +0530, Syed Nayyar Waris wrote:
> > > On Sun, Nov 01, 2020 at 09:08:29PM +0100, Arnd Bergmann wrote:
> > > > On Sun, Nov 1, 2020 at 4:00 PM William Breathitt Gray
> > > > <vilhelm.gray@gmail.com> wrote:
> > > > >
> > > > > On Thu, Oct 29, 2020 at 11:44:47PM +0100, Arnd Bergmann wrote:
> > > > > > On Sun, Oct 18, 2020 at 11:44 PM Syed Nayyar Waris <syednwaris@gmail.com> wrote:
> > > > > > >
> > > > > > > This patch reimplements the xgpio_set_multiple() function in
> > > > > > > drivers/gpio/gpio-xilinx.c to use the new generic functions:
> > > > > > > bitmap_get_value() and bitmap_set_value(). The code is now simpler
> > > > > > > to read and understand. Moreover, instead of looping for each bit
> > > > > > > in xgpio_set_multiple() function, now we can check each channel at
> > > > > > > a time and save cycles.
> > > > > >
> > > > > > This now causes -Wtype-limits warnings in linux-next with gcc-10:
> > > > >
> > > > > Hi Arnd,
> > > > >
> > > > > What version of gcc-10 are you running? I'm having trouble generating
> > > > > these warnings so I suspect I'm using a different version than you.
> > > >
> > > > I originally saw it with the binaries from
> > > > https://mirrors.edge.kernel.org/pub/tools/crosstool/, but I have
> > > > also been able to reproduce it with a minimal test case on the
> > > > binaries from godbolt.org, see https://godbolt.org/z/Wq8q4n
> > > >
> > > > > Let me first verify that I understand the problem correctly. The issue
> > > > > is the possibility of a stack smash in bitmap_set_value() when the value
> > > > > of start + nbits is larger than the length of the map bitmap memory
> > > > > region. This is because index (or index + 1) could be outside the range
> > > > > of the bitmap memory region passed in as map. Is my understanding
> > > > > correct here?
> > > >
> > > > Yes, that seems to be the case here.
> > > >
> > > > > In xgpio_set_multiple(), the variables width[0] and width[1] serve as
> > > > > possible start and nbits values for the bitmap_set_value() calls.
> > > > > Because width[0] and width[1] are unsigned int variables, GCC considers
> > > > > the possibility that the value of width[0]/width[1] might exceed the
> > > > > length of the bitmap memory region named old and thus result in a stack
> > > > > smash.
> > > > >
> > > > > I don't know if invalid width values are actually possible for the
> > > > > Xilinx gpio device, but let's err on the side of safety and assume this
> > > > > is actually a possibility. We should verify that the combined value of
> > > > > gpio_width[0] + gpio_width[1] does not exceed 64 bits; we can add a
> > > > > check for this in xgpio_probe() when we grab the gpio_width values.
> > > > >
> > > > > However, we're still left with the GCC warnings because GCC is not smart
> > > > > enough to know that we've already checked the boundary and width[0] and
> > > > > width[1] are valid values. I suspect we can avoid this warning is we
> > > > > refactor bitmap_set_value() to increment map seperately and then set it:
> > > >
> > > > As I understand it, part of the problem is that gcc sees the possible
> > > > range as being constrained by the operations on 'start' and 'nbits',
> > > > in particular the shift in BIT_WORD() that put an upper bound on
> > > > the index, but then it sees that the upper bound is higher than the
> > > > upper bound of the array, i.e. element zero.
> > > >
> > > > I added a check
> > > >
> > > >       if (start >= 64 || start + size >= 64) return;
> > > >
> > > > in the godbolt.org testcase, which does help limit the start
> > > > index appropriately, but it is not sufficient to let the compiler
> > > > see that the 'if (space >= nbits) ' condition is guaranteed to
> > > > be true for all values here.
> > > >
> > > > > static inline void bitmap_set_value(unsigned long *map,
> > > > >                                     unsigned long value,
> > > > >                                     unsigned long start, unsigned long nbits)
> > > > > {
> > > > >         const unsigned long offset = start % BITS_PER_LONG;
> > > > >         const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
> > > > >         const unsigned long space = ceiling - start;
> > > > >
> > > > >         map += BIT_WORD(start);
> > > > >         value &= GENMASK(nbits - 1, 0);
> > > > >
> > > > >         if (space >= nbits) {
> > > > >                 *map &= ~(GENMASK(nbits - 1, 0) << offset);
> > > > >                 *map |= value << offset;
> > > > >         } else {
> > > > >                 *map &= ~BITMAP_FIRST_WORD_MASK(start);
> > > > >                 *map |= value << offset;
> > > > >                 map++;
> > > > >                 *map &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> > > > >                 *map |= value >> space;
> > > > >         }
> > > > > }
> > > > >
> > > > > This avoids adding a costly conditional check inside bitmap_set_value()
> > > > > when almost all bitmap_set_value() calls will have static arguments with
> > > > > well-defined and obvious boundaries.
> > > > >
> > > > > Do you think this would be an acceptable solution to resolve your GCC
> > > > > warnings?
> > > >
> > > > Unfortunately, it does not seem to make a difference, as gcc still
> > > > knows that this compiles to the same result, and it produces the same
> > > > warning as before (see https://godbolt.org/z/rjx34r)
> > > >
> > > >          Arnd
> > >
> > > Hi Arnd,
> > >
> > > Sharing a different version of bitmap_set_valuei() function. See below.
> > >
> > > Let me know if the below solution looks good to you and if it resolves
> > > the above compiler warning.
> > >
> > >
> > > @@ -1,5 +1,5 @@
> > >  static inline void bitmap_set_value(unsigned long *map,
> > > -                                    unsigned long value,
> > > +                                    unsigned long value, const size_t length,
> > >                                      unsigned long start, unsigned long nbits)
> > >  {
> > >          const size_t index = BIT_WORD(start);
> > > @@ -7,6 +7,9 @@ static inline void bitmap_set_value(unsigned long *map,
> > >          const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
> > >          const unsigned long space = ceiling - start;
> > >
> > > +       if (index >= length)
> > > +               return;
> > > +
> > >          value &= GENMASK(nbits - 1, 0);
> > >
> > >          if (space >= nbits) {
> > > @@ -15,6 +18,10 @@ static inline void bitmap_set_value(unsigned long *map,
> > >          } else {
> > >                  map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
> > >                  map[index + 0] |= value << offset;
> > > +
> > > +               if (index + 1 >= length)
> > > +                       return;
> > > +
> > >                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> > >                  map[index + 1] |= value >> space;
> > >          }
> >
> > One of my concerns is that we're incurring the latency two additional
> > conditional checks just to suppress a compiler warning about a case that
> > wouldn't occur in the actual use of bitmap_set_value(). I'm hoping
> > there's a way for us to suppress these warnings without adding onto the
> > latency of this function; given that bitmap_set_value() is intended to
> > be used in loops, conditionals here could significantly increase latency
> > in drivers.
> >
> > I wonder if array_index_nospec() might have the side effect of
> > suppressing these warnings for us. For example, would this work:
> >
> > static inline void bitmap_set_value(unsigned long *map,
> >                                   unsigned long value,
> >                                   unsigned long start, unsigned long nbits)
> > {
> >       const unsigned long offset = start % BITS_PER_LONG;
> >       const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
> >       const unsigned long space = ceiling - start;
> >       size_t index = BIT_WORD(start);
> >
> >       value &= GENMASK(nbits - 1, 0);
> >
> >       if (space >= nbits) {
> >               index = array_index_nospec(index, index + 1);
> >
> >               map[index] &= ~(GENMASK(nbits - 1, 0) << offset);
> >               map[index] |= value << offset;
> >       } else {
> >               index = array_index_nospec(index, index + 2);
> >
> >               map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
> >               map[index + 0] |= value << offset;
> >               map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> >               map[index + 1] |= value >> space;
> >       }
> > }
> >
> > Or is this going to produce the same warning because we're not using an
> > explicit check against the map array size?
> >
> > William Breathitt Gray
>
> After testing my suggestion, it looks like the warnings are still
> present. :-(
>
> Something else I've also considered is perhaps using the GCC built-in
> function __builtin_unreachable() instead of returning. So in Syed's code
> we would have the following instead:
>
> if (index + 1 >= length)
>         __builtin_unreachable();
>
> This might allow GCC to optimize better and avoid the conditional check
> all together, thus avoiding latency while also hinting enough context to
> the compiler to suppress the warnings.
>
> William Breathitt Gray

I also thought of another optimization. Arnd, William, let me know
what you think about it.

Since exceeding the array limit is a rather rare event, we can use the
gcc extension: 'unlikely'  for the boundary checks.
We can use it at the two places where 'index' and 'index + 1' is being
checked against the boundary limit.

It might help optimize the code. Wouldn't it?

Syed Nayyar Waris
