Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4689A2ABB76
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 14:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731112AbgKIN2Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 08:28:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:39908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733012AbgKINNs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 08:13:48 -0500
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 888C5221F1;
        Mon,  9 Nov 2020 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604927627;
        bh=C62EO4IC0tkPHza1Z5wLuwCPmHs9dymzQ6bTKN291E0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lu6ZloQxCpVK9XPcQeKzDCyoPfapyzr8TmXS1ZEQ5eLaXSQuhBcR94+nOWdM77AES
         kV44ekL3qEsJoQl40SCbzafHpHB/U5BDiFZlYsy1bDuBBjuiPNMvRlmyINyVtsgYHP
         +CZ44kZDC+mqx34R9oQDI2jfLLxSNjX09++Ubcyg=
Received: by mail-oi1-f178.google.com with SMTP id w188so4585167oib.1;
        Mon, 09 Nov 2020 05:13:47 -0800 (PST)
X-Gm-Message-State: AOAM533ghNW5C4wTcPw1BTBJ/wO7q05blkQ5kGYW8aF+6QmwHPWFBrsy
        dUT41dKrbdJymQJI6f5pIgDgRFwIDPQfe/6m6zA=
X-Google-Smtp-Source: ABdhPJxw91Hj0jZh5TbrSnMgwYuPfwA98iCODNQAPuLfkdT9c4QN2Zz2pIgElY5nW2+5lWSvP9BtJ7kmgCwWxxMgu9A=
X-Received: by 2002:aca:e0d7:: with SMTP id x206mr9417239oig.67.1604927626755;
 Mon, 09 Nov 2020 05:13:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1603055402.git.syednwaris@gmail.com> <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu> <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
In-Reply-To: <20201109123411.GA19869@syed>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 9 Nov 2020 14:13:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2_1xT7Jz_q-xZstnW6dSRkRp4Q9Cqyz1t7Bo189zgfaA@mail.gmail.com>
Message-ID: <CAK8P3a2_1xT7Jz_q-xZstnW6dSRkRp4Q9Cqyz1t7Bo189zgfaA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
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

On Mon, Nov 9, 2020 at 1:34 PM Syed Nayyar Waris <syednwaris@gmail.com> wrote:
> On Sun, Nov 01, 2020 at 09:08:29PM +0100, Arnd Bergmann wrote:
> > > This avoids adding a costly conditional check inside bitmap_set_value()
> > > when almost all bitmap_set_value() calls will have static arguments with
> > > well-defined and obvious boundaries.
> > >
> > > Do you think this would be an acceptable solution to resolve your GCC
> > > warnings?
> >
> > Unfortunately, it does not seem to make a difference, as gcc still
> > knows that this compiles to the same result, and it produces the same
> > warning as before (see https://godbolt.org/z/rjx34r)
> >
> >          Arnd
>
> Hi Arnd,
>
> Sharing a different version of bitmap_set_valuei() function. See below.
>
> Let me know if the below solution looks good to you and if it resolves
> the above compiler warning.

Thanks for the follow-up!

> @@ -1,5 +1,5 @@
>  static inline void bitmap_set_value(unsigned long *map,
> -                                    unsigned long value,
> +                                    unsigned long value, const size_t length,
>                                      unsigned long start, unsigned long nbits)
>  {
>          const size_t index = BIT_WORD(start);
> @@ -7,6 +7,9 @@ static inline void bitmap_set_value(unsigned long *map,
>          const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
>          const unsigned long space = ceiling - start;
>
> +       if (index >= length)
> +               return;
> +
>          value &= GENMASK(nbits - 1, 0);
>
>          if (space >= nbits) {
> @@ -15,6 +18,10 @@ static inline void bitmap_set_value(unsigned long *map,
>          } else {
>                  map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
>                  map[index + 0] |= value << offset;
> +
> +               if (index + 1 >= length)
> +                       return;
> +
>                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
>                  map[index + 1] |= value >> space;
>          }

Yes, this does address the warning: https://godbolt.org/z/3nsGzq

Not sure what the best calling conventions would be though, as the function
now has five arguments, and the one called 'nbits' appears to be what
all other helpers in include/linux/bitmap.h use for the length of the bitmap,
while this one uses it for the length of the value.

I'd prefer passing the number of bits in the bitmap rather than the number
of 'unsigned long' words in it, and calling that 'nbits', while renaming
the current 'nbits' to something else, e.g.:

static inline void bitmap_set_value(unsigned long *map,
                                    unsigned long value, unsigned long start,
                                    unsigned long clump_size, unsigned
long nbits);

Though I'm still unsure about the argument order. Having 'nbits'
right next to 'map' would be the most logical to me as they logically
belong together, but most other linux/bitops.h helpers seem to have
'nbits' as the last argument.

        Arnd
