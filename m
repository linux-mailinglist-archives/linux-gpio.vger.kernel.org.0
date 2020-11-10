Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1915F2ADCCE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 18:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgKJRWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 12:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKJRWy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 12:22:54 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98262C0613CF;
        Tue, 10 Nov 2020 09:22:54 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id n129so15044160iod.5;
        Tue, 10 Nov 2020 09:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymdeH6UQdyI8NAbmNLWcxMfQ6gny4+rGsj5PUTg+nhw=;
        b=tzIeTtjwELZhgX+4rfp0R+hHQIAxEncFCjjo6r0eixZY2HjN9XEkz94/yZTI39Sa4u
         O/v1yc6nfeIsKUoU6bI7L3SIgRRykuFp1/jkIf5aVpPPPS9SrmEeVZZ+6Pk5fif2T+W0
         PrIMlYE1JnT2OhJxWyBT0DWzAhjwgHeUQR/RaeZWhAqefT6DZZkz6/3JC4nUu1mpEirk
         yH46ZlL1mvI3mNLxF/VnmxcwGDgStv+Vr8Cj+K7LodNvdN6qibQkszKQTvNvOaKA5iSE
         UjYKU+amavKHs8lGs7V0C0vbRKiVjFbUddCHRTgqlUZQMeH5Dx+VKAqcwod+PJcgb/Tn
         k8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymdeH6UQdyI8NAbmNLWcxMfQ6gny4+rGsj5PUTg+nhw=;
        b=lSsu8OPN2/aTGHbXKmUUHKZOZAZ1kjFS6OZycOzYBbgaQvkk3AQyOll/gQu8f72lH2
         zFEsWiLMXAKp9BU4/I0O7lMzOzavoNh3kSkxnvzc7i/Gtgh6p7KT7Tx1QE/ipf1u4rQG
         DlSUCmIpCbIiLq+C+uZudHaL6EpMEOlV4NzkRJvyVzw1qWHN+MX1Hd5fGQLL7nC/CYiT
         u2tIirQEX9pvYtfx69HyOmk2eTmGGxw1qeN+90DWnMBgsMV8ihdoF5A0ZKfWehZdJ0z8
         hyQGEwIsfhobAZ2J+jqAsFSrWHLYdIaPr1KJboeJYSJ81E+zFgxV4cCMmwhe7h+LNFpj
         hfOw==
X-Gm-Message-State: AOAM532KSvDYA9tLZ6dYmyGJkfRx3ha+6mIoYIemE8k0WDX31sKkxqgu
        dU+bOy5I5wtmx0MItcdi+rVS35n2Qe1t8tz+LL4=
X-Google-Smtp-Source: ABdhPJwX7lrVjtLUVsjSFhMTT2ZgFPm7sLH4OSZ+FHqM9SlKrc1CLeI9iWMI0JyUABuldPUhkrBFQ9xXmyjzDepsvMI=
X-Received: by 2002:a5e:8206:: with SMTP id l6mr14668423iom.126.1605028973897;
 Tue, 10 Nov 2020 09:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20201101150033.GA68138@shinobu> <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed> <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name> <20201109171140.GA14045@shinobu>
 <20201109172220.GI4077@smile.fi.intel.com> <20201109173107.GA14643@shinobu>
 <fe1cfe4c-e4d7-f9fb-1218-7a1d48e6f68a@xilinx.com> <20201110123538.GA3193@shinobu>
In-Reply-To: <20201110123538.GA3193@shinobu>
From:   Syed Nayyar Waris <syednwaris@gmail.com>
Date:   Tue, 10 Nov 2020 22:52:42 +0530
Message-ID: <CACG_h5p84sKjDnK5xYRNjGnRzwsbjZ-76P-cC13LKx=7x=4KqQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 6:05 PM William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 11:02:43AM +0100, Michal Simek wrote:
> >
> >
> > On 09. 11. 20 18:31, William Breathitt Gray wrote:
> > > On Mon, Nov 09, 2020 at 07:22:20PM +0200, Andy Shevchenko wrote:
> > >> On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathitt Gray wrote:
> > >>> On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
> > >>>> On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
> > >>
> > >> ...
> > >>
> > >>>>  static inline void bitmap_set_value(unsigned long *map,
> > >>>> -                                    unsigned long value,
> > >>>> +                                    unsigned long value, const size_t length,
> > >>>>                                      unsigned long start, unsigned long nbits)
> > >>>>  {
> > >>>>          const size_t index = BIT_WORD(start);
> > >>>> @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long *map,
> > >>>>          } else {
> > >>>>                  map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
> > >>>>                  map[index + 0] |= value << offset;
> > >>>> +
> > >>>> +               if (index + 1 >= length)
> > >>>> +                       __builtin_unreachable();
> > >>>> +
> > >>>>                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> > >>>>                  map[index + 1] |= value >> space;
> > >>>>          }
> > >>>
> > >>> Hi Syed,
> > >>>
> > >>> Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'nbits'
> > >>> to value_width.
> > >>
> > >> length here is in longs. I guess this is the point of entire patch.
> > >
> > > Ah yes, this should become 'const unsigned long nbits' and represent the
> > > length of the bitmap in bits and not longs.

Hi William, Andy and All,

Thank You for reviewing. I was looking into the review comments and I
have a question on the above.

Actually, in bitmap_set_value(), the intended comparison is to be made
between 'index + 1' and 'length' (which is now renamed as 'nbits').
That is, the comparison would look-like as follows:
if (index + 1 >= nbits)

The 'index' is getting populated with BIT_WORD(start).
The 'index' variable in above is the actual index of the bitmap array,
while in previous mail it is suggested to use 'nbits' which represent
the length of the bitmap in bits and not longs.

Isn't it comparing two different things? index of array (not the
bit-wise-length) on left hand side and nbits (bit-wise-length) on
right hand side?

Have I misunderstood something? If yes, request to clarify.

Or do I have to first divide 'nbits' by BITS_PER_LONG and then compare
it with 'index + 1'? Something like this?

Regards
Syed Nayyar Waris

> > >
> > >> But to me sounds like it would be better to have simply bitmap_set_value64() /
> > >> bitmap_set_value32() with proper optimization done and forget about variadic
> > >> ones for now.
> > >
> > > The gpio-xilinx driver can have arbitrary sizes for width[0] and
> > > width[1], so unfortunately that means we don't know the start position
> > > nor the width of the value beforehand.
> >
> > Start position should be all the time zero. You can't configure this IP
> > to start from bit 2. Width can vary but start is IMHO all the time from
> > 0 bit.
> >
> > Thanks,
> > Michal
>
> Hi Michal,
>
> I'm referring to the mask creation, not the data bus transfer; see the
> implementation of the xgpio_set_multiple() function in linux-next for
> reference:
> <https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpio/gpio-xilinx.c?h=akpm>.
>
> To generate the old mask we call the following:
>
>         bitmap_set_value(old, state[0], 0, width[0]);
>         bitmap_set_value(old, state[1], width[0], width[1]);
>
> Here, width[0] and width[1] can vary, which makes the exact values of
> the start and nbits parameters unknown beforehand (although we do know
> they are within the bitmap boundary).
>
> Regardless, this is not an issue because we know the bitmap_set_value()
> is supposed to be called with valid values. We just need a way to hint
> to GCC that this is the case, without increasing the latency of the
> function -- which I think is possible if we use __builtin_unreachable()
> for the conditional path checking the index against the length of the
> bitmap.
>
> William Breathitt Gray
