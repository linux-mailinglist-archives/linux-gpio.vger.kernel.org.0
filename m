Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96692AE262
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 23:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732268AbgKJWAW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 17:00:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732257AbgKJWAU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 17:00:20 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714CFC0613D1;
        Tue, 10 Nov 2020 14:00:20 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id r10so11431592pgb.10;
        Tue, 10 Nov 2020 14:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZkeNKItXvG55Kf84CvoIRBs6Edwo+I3OqlGP+dGuXqE=;
        b=qeXZe4BA9SCO4hDnfzJwhsIzRf2xqQGyKDWlcBpxlE1NdOLxQSaZqpKkCNvM4WNMbb
         q8mVqYA49vkoPIXmtClIbZ5pvNY+uaE2KmgG7wIXLfJHc4Q1oC2t59wYKxLak79GSYe6
         swqejvNBa/nf2LCcfidaEsfX0eBJ9OdvyFv438HXth5WhrO/QH9Q2rdsc+pvlD18V8IM
         LA1whs8OttevAb6pZF75y4D8FTfqTXAMznR4aKWcF41UCz6OHUkIwe1FGXrUNmRlrrXI
         6FfnKKudv+hMtCamAHhxZmZRn/A2NAOGojYnR2uQOT8vbr6jZlPx8hU0FTh6kILDj4jl
         oDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZkeNKItXvG55Kf84CvoIRBs6Edwo+I3OqlGP+dGuXqE=;
        b=MjBs1WEMkdabCKf7wpWKM41agP1VdwqsYS0ty5zL7b448rmF1IQgK52/v49qd/oeo0
         0KDrRIalfTLYfgXES2ZsCC3g/mHftrt6x/3B38oqsbg/2+937vvZhd14q3omNQrI21Fk
         Dvb4EPoj3hOD3dz5DQUYFLIjmGvS7J6YCwLWKd2XmGbwgssF1zTZtbefpGRiF96xCr+C
         77Kc4VII3x93B8TpvkJKvYK8hKXGnvM5b/TO8reaCD6JnD+6PpOWAgvJjoI3/hiH3QJO
         S3p5n3rqHbpL1NO+2GUcqrcyAjU358imCfBtQAnjLHlFRNRztE6g/Vu6Kb0bR1DRcfnq
         69pA==
X-Gm-Message-State: AOAM533KrZJ++SFx7Hndw+u8Sqn9qRSZt3gdQasxABcxcSz4ZkuIfAB6
        +Ybr2+4dXs9vufbqd5GBjYE=
X-Google-Smtp-Source: ABdhPJzo+VhB1ql5vArn/z1a28Riu0xD0JYc/jpIkO899WCTKEu0UtJ+gQb0z0Rgyh795jEXYojMfQ==
X-Received: by 2002:a62:84d2:0:b029:18a:f574:fded with SMTP id k201-20020a6284d20000b029018af574fdedmr20647846pfd.31.1605045619959;
        Tue, 10 Nov 2020 14:00:19 -0800 (PST)
Received: from syed ([223.225.0.141])
        by smtp.gmail.com with ESMTPSA id w65sm113758pfw.145.2020.11.10.14.00.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 14:00:19 -0800 (PST)
Date:   Wed, 11 Nov 2020 03:30:04 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     arnd@kernel.org, vilhelm.gray@gmail.com
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201110220004.GA25801@syed>
References: <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name>
 <20201109171140.GA14045@shinobu>
 <20201109172220.GI4077@smile.fi.intel.com>
 <20201109173107.GA14643@shinobu>
 <fe1cfe4c-e4d7-f9fb-1218-7a1d48e6f68a@xilinx.com>
 <20201110123538.GA3193@shinobu>
 <CACG_h5p84sKjDnK5xYRNjGnRzwsbjZ-76P-cC13LKx=7x=4KqQ@mail.gmail.com>
 <20201110174316.GA12192@shinobu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110174316.GA12192@shinobu>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 12:43:16PM -0500, William Breathitt Gray wrote:
> On Tue, Nov 10, 2020 at 10:52:42PM +0530, Syed Nayyar Waris wrote:
> > On Tue, Nov 10, 2020 at 6:05 PM William Breathitt Gray
> > <vilhelm.gray@gmail.com> wrote:
> > >
> > > On Tue, Nov 10, 2020 at 11:02:43AM +0100, Michal Simek wrote:
> > > >
> > > >
> > > > On 09. 11. 20 18:31, William Breathitt Gray wrote:
> > > > > On Mon, Nov 09, 2020 at 07:22:20PM +0200, Andy Shevchenko wrote:
> > > > >> On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathitt Gray wrote:
> > > > >>> On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
> > > > >>>> On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
> > > > >>
> > > > >> ...
> > > > >>
> > > > >>>>  static inline void bitmap_set_value(unsigned long *map,
> > > > >>>> -                                    unsigned long value,
> > > > >>>> +                                    unsigned long value, const size_t length,
> > > > >>>>                                      unsigned long start, unsigned long nbits)
> > > > >>>>  {
> > > > >>>>          const size_t index = BIT_WORD(start);
> > > > >>>> @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long *map,
> > > > >>>>          } else {
> > > > >>>>                  map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
> > > > >>>>                  map[index + 0] |= value << offset;
> > > > >>>> +
> > > > >>>> +               if (index + 1 >= length)
> > > > >>>> +                       __builtin_unreachable();
> > > > >>>> +
> > > > >>>>                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> > > > >>>>                  map[index + 1] |= value >> space;
> > > > >>>>          }
> > > > >>>
> > > > >>> Hi Syed,
> > > > >>>
> > > > >>> Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'nbits'
> > > > >>> to value_width.
> > > > >>
> > > > >> length here is in longs. I guess this is the point of entire patch.
> > > > >
> > > > > Ah yes, this should become 'const unsigned long nbits' and represent the
> > > > > length of the bitmap in bits and not longs.
> > 
> > Hi William, Andy and All,
> > 
> > Thank You for reviewing. I was looking into the review comments and I
> > have a question on the above.
> > 
> > Actually, in bitmap_set_value(), the intended comparison is to be made
> > between 'index + 1' and 'length' (which is now renamed as 'nbits').
> > That is, the comparison would look-like as follows:
> > if (index + 1 >= nbits)
> > 
> > The 'index' is getting populated with BIT_WORD(start).
> > The 'index' variable in above is the actual index of the bitmap array,
> > while in previous mail it is suggested to use 'nbits' which represent
> > the length of the bitmap in bits and not longs.
> > 
> > Isn't it comparing two different things? index of array (not the
> > bit-wise-length) on left hand side and nbits (bit-wise-length) on
> > right hand side?
> > 
> > Have I misunderstood something? If yes, request to clarify.
> > 
> > Or do I have to first divide 'nbits' by BITS_PER_LONG and then compare
> > it with 'index + 1'? Something like this?
> > 
> > Regards
> > Syed Nayyar Waris
> 
> The array elements of the bitmap memory region are abstracted away for
> the covenience of the users of the bitmap_* functions; the driver
> authors are able to treat their bitmaps as just a set of contiguous bits
> and not worry about where the division between array elements happen.
> 
> So to match the interface of the other bitmap_* functions, you should
> take in nbits and figure out the actual array length by dividing by
> BITS_PER_LONG inside bitmap_set_value(). Then you can use your
> conditional check (index + 1 >= length) like you have been doing so far.
> 
> William Breathitt Gray

Hi Arnd,

Sharing a new version of bitmap_set_value(). Let me know if it looks
good and whether it suppresses the compiler warning.

The below patch is created against the v12 version of bitmap_set_value().

-static inline void bitmap_set_value(unsigned long *map,
-                                    unsigned long value,
-                                    unsigned long start, unsigned long nbits)
+static inline void bitmap_set_value(unsigned long *map, unsigned long nbits,
+                                   unsigned long value, unsigned long value_width,
+                                   unsigned long start)
 {
-        const size_t index = BIT_WORD(start);
+        const unsigned long index = BIT_WORD(start);
+        const unsigned long length = BIT_WORD(nbits);
         const unsigned long offset = start % BITS_PER_LONG;
         const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
         const unsigned long space = ceiling - start;
 
-        value &= GENMASK(nbits - 1, 0);
+        value &= GENMASK(value_width - 1, 0);
 
-        if (space >= nbits) {
-                map[index] &= ~(GENMASK(nbits - 1, 0) << offset);
+        if (space >= value_width) {
+                map[index] &= ~(GENMASK(value_width - 1, 0) << offset);
                 map[index] |= value << offset;
         } else {
                 map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
                 map[index + 0] |= value << offset;
-                map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
+
+               if (index + 1 >= length)
+                       __builtin_unreachable();
+
+                map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + value_width);
                 map[index + 1] |= value >> space;
         }
 }


