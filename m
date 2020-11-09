Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1291B2AB853
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 13:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729723AbgKIMe2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 07:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgKIMe1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 07:34:27 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C360C0613CF;
        Mon,  9 Nov 2020 04:34:27 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id h6so7049984pgk.4;
        Mon, 09 Nov 2020 04:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=76lz9d6Ii6PSYL2HYWk36/bgrPK9Hw3WkIKIrFJBsLw=;
        b=IE+kPuHYp/jcZKjdVvYSKxkhdqKUpcIFOBE5yX2koIZYHk8ZWHQzKMfgvT/OrmU2/J
         Eud0TDB8QDKA/z2pHm6VdA1Q4xrST8xASR5URzIWygHQp3a7xpZ8zACj5PH/WogPn87F
         QxbDzek8tgp6qNxnKs0HkQmU54SnDi6s5U6w4GfjL2a4rdZeIZXDM87SB0Zo5pJZnyyR
         km02YilQ0oRMR7+H78s8qp1Ec7Cud+iNE+rGozPALZmj38DZgsyxHRjfZ9wNHraxAHEO
         ZvSvFB+/p2wXm1R9/1hG5rcGq6US/iSUknzkuJtZJexW/rdM9mbOHOw5HSWsq7Zy4Z6V
         7l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=76lz9d6Ii6PSYL2HYWk36/bgrPK9Hw3WkIKIrFJBsLw=;
        b=llkr7uBJxqgFvUYCp0dR/d7p2gkfUC/yAV3eLrtgqbOux25umW8ABhcB5fihMMdq3Y
         dU2zBC6JJDSMl+O5Ek2uvChWq2sACmEImRtmViqyxCGNJ+zmdp8xblqZHwZb89q46Pw2
         XUW5xAs1qrZ679XqEb+lgYGQBjhXHoc/5AHHY0E4kWHVfGidquE0zIlqYP1eOXCL/UrJ
         TQ1tFkDwDAmSsGkGBlZpeOHxUewhqSYKb+ilGnhxClmM18i0mI3l/xOb9vTNu0cbQTvl
         J4O4urb1bcBrljE1sIU6Qq7EcYAhYE2xqE5XpeA4wgMWz0g7ER1aXI9Rf6P5mNtti87D
         fpwQ==
X-Gm-Message-State: AOAM530C+cK4GrG87jzaRJ5n9AcogThA7f6WYIlLYieWaL7D1XFFrAeH
        m8JndQI0FdOwgwF0NTVTjXk=
X-Google-Smtp-Source: ABdhPJxl/vCsqHlmlJiHL6amNEf2zZqT92aOPveveVj4LTo1dT08gogXympMqcWcPc3wGR1HcGDfbQ==
X-Received: by 2002:a62:54c2:0:b029:156:4e4c:ff49 with SMTP id i185-20020a6254c20000b02901564e4cff49mr13494150pfb.26.1604925266688;
        Mon, 09 Nov 2020 04:34:26 -0800 (PST)
Received: from syed ([223.225.3.45])
        by smtp.gmail.com with ESMTPSA id v18sm11297148pfn.35.2020.11.09.04.34.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2020 04:34:25 -0800 (PST)
Date:   Mon, 9 Nov 2020 18:04:11 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201109123411.GA19869@syed>
References: <cover.1603055402.git.syednwaris@gmail.com>
 <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 01, 2020 at 09:08:29PM +0100, Arnd Bergmann wrote:
> On Sun, Nov 1, 2020 at 4:00 PM William Breathitt Gray
> <vilhelm.gray@gmail.com> wrote:
> >
> > On Thu, Oct 29, 2020 at 11:44:47PM +0100, Arnd Bergmann wrote:
> > > On Sun, Oct 18, 2020 at 11:44 PM Syed Nayyar Waris <syednwaris@gmail.com> wrote:
> > > >
> > > > This patch reimplements the xgpio_set_multiple() function in
> > > > drivers/gpio/gpio-xilinx.c to use the new generic functions:
> > > > bitmap_get_value() and bitmap_set_value(). The code is now simpler
> > > > to read and understand. Moreover, instead of looping for each bit
> > > > in xgpio_set_multiple() function, now we can check each channel at
> > > > a time and save cycles.
> > >
> > > This now causes -Wtype-limits warnings in linux-next with gcc-10:
> >
> > Hi Arnd,
> >
> > What version of gcc-10 are you running? I'm having trouble generating
> > these warnings so I suspect I'm using a different version than you.
> 
> I originally saw it with the binaries from
> https://mirrors.edge.kernel.org/pub/tools/crosstool/, but I have
> also been able to reproduce it with a minimal test case on the
> binaries from godbolt.org, see https://godbolt.org/z/Wq8q4n
> 
> > Let me first verify that I understand the problem correctly. The issue
> > is the possibility of a stack smash in bitmap_set_value() when the value
> > of start + nbits is larger than the length of the map bitmap memory
> > region. This is because index (or index + 1) could be outside the range
> > of the bitmap memory region passed in as map. Is my understanding
> > correct here?
> 
> Yes, that seems to be the case here.
> 
> > In xgpio_set_multiple(), the variables width[0] and width[1] serve as
> > possible start and nbits values for the bitmap_set_value() calls.
> > Because width[0] and width[1] are unsigned int variables, GCC considers
> > the possibility that the value of width[0]/width[1] might exceed the
> > length of the bitmap memory region named old and thus result in a stack
> > smash.
> >
> > I don't know if invalid width values are actually possible for the
> > Xilinx gpio device, but let's err on the side of safety and assume this
> > is actually a possibility. We should verify that the combined value of
> > gpio_width[0] + gpio_width[1] does not exceed 64 bits; we can add a
> > check for this in xgpio_probe() when we grab the gpio_width values.
> >
> > However, we're still left with the GCC warnings because GCC is not smart
> > enough to know that we've already checked the boundary and width[0] and
> > width[1] are valid values. I suspect we can avoid this warning is we
> > refactor bitmap_set_value() to increment map seperately and then set it:
> 
> As I understand it, part of the problem is that gcc sees the possible
> range as being constrained by the operations on 'start' and 'nbits',
> in particular the shift in BIT_WORD() that put an upper bound on
> the index, but then it sees that the upper bound is higher than the
> upper bound of the array, i.e. element zero.
> 
> I added a check
> 
>       if (start >= 64 || start + size >= 64) return;
> 
> in the godbolt.org testcase, which does help limit the start
> index appropriately, but it is not sufficient to let the compiler
> see that the 'if (space >= nbits) ' condition is guaranteed to
> be true for all values here.
> 
> > static inline void bitmap_set_value(unsigned long *map,
> >                                     unsigned long value,
> >                                     unsigned long start, unsigned long nbits)
> > {
> >         const unsigned long offset = start % BITS_PER_LONG;
> >         const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
> >         const unsigned long space = ceiling - start;
> >
> >         map += BIT_WORD(start);
> >         value &= GENMASK(nbits - 1, 0);
> >
> >         if (space >= nbits) {
> >                 *map &= ~(GENMASK(nbits - 1, 0) << offset);
> >                 *map |= value << offset;
> >         } else {
> >                 *map &= ~BITMAP_FIRST_WORD_MASK(start);
> >                 *map |= value << offset;
> >                 map++;
> >                 *map &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> >                 *map |= value >> space;
> >         }
> > }
> >
> > This avoids adding a costly conditional check inside bitmap_set_value()
> > when almost all bitmap_set_value() calls will have static arguments with
> > well-defined and obvious boundaries.
> >
> > Do you think this would be an acceptable solution to resolve your GCC
> > warnings?
> 
> Unfortunately, it does not seem to make a difference, as gcc still
> knows that this compiles to the same result, and it produces the same
> warning as before (see https://godbolt.org/z/rjx34r)
> 
>          Arnd

Hi Arnd,

Sharing a different version of bitmap_set_valuei() function. See below.

Let me know if the below solution looks good to you and if it resolves
the above compiler warning.


@@ -1,5 +1,5 @@
 static inline void bitmap_set_value(unsigned long *map,
-                                    unsigned long value,
+                                    unsigned long value, const size_t length,
                                     unsigned long start, unsigned long nbits)
 {
         const size_t index = BIT_WORD(start);
@@ -7,6 +7,9 @@ static inline void bitmap_set_value(unsigned long *map,
         const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
         const unsigned long space = ceiling - start;
 
+       if (index >= length)
+               return;
+
         value &= GENMASK(nbits - 1, 0);
 
         if (space >= nbits) {
@@ -15,6 +18,10 @@ static inline void bitmap_set_value(unsigned long *map,
         } else {
                 map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
                 map[index + 0] |= value << offset;
+
+               if (index + 1 >= length)
+                       return;
+
                 map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
                 map[index + 1] |= value >> space;
         }





