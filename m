Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4202B20E7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 17:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgKMQwg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 11:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgKMQwg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 11:52:36 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16CF3C0613D1;
        Fri, 13 Nov 2020 08:52:36 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id k1so9050066ilc.10;
        Fri, 13 Nov 2020 08:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yx0+3eC29sVDUQRfGVQWQP2YqTI3HJ256v1HQL/cKuE=;
        b=aK0wTxi4G00Q+WxwOewNjiNmnOTwmrvb/vVczLp0kbzrKCVsIIwIa1Om33YRcac7bM
         SdvZqQlMuz9OH5evusQDO8tcZ3sXqGEKpjxW3HTeCnNQ6WvpDc/9RikWjE4O+rdNsy+f
         Hl3UKTX9CVqXb+/zZjBRpGsvvL/zT9ZFhyfDAE6LgKOilJVvLnciofhKQng3edNAWQ48
         Kw0d/8iWs3oZo3Hfts5Rs7siaTD6NoSeSku2EValLpT+SbWz/H71yEY9a4WDg8qfF5eJ
         Vgzu7z9N+9oOQn1rMoCyn1zJIORYKNkRyUd0Xym24djpD2gHGoFRhHgP/kIQFW8S4JZj
         SfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yx0+3eC29sVDUQRfGVQWQP2YqTI3HJ256v1HQL/cKuE=;
        b=OCw8pvc8fjj8kIETc/aSpARss/hLYjkA+F3ONZHf1aQ8eWKZbe9sDpDc8yzJDsNVL4
         kkA8Si2/V1X/sgMjJC84weBLUtUDdAxuhs6HrTczCkhUBcVw268UXm0eOvMl50ATUNdz
         NVnckIW5zJh+d6cM6sd1TcjXZI9AOhDW72Wz00cQS00B2PduweWAUeWzKD9Lp9AH54/m
         kT/saHpmmns56Kd7UzLPQRBmnJ/FcMpClUK/4bpzXHZBnmzV3VPH1CQSLKzItbNQl4Ju
         Sp5aFj7QYflEXsWfxcwxFwVxVqSL0EUPmsAEF+WP54H+df3CVF2Jtn5KvD6Ws6xwUPTz
         xxjg==
X-Gm-Message-State: AOAM532wYFFof0T53RS3g1fl/v4oQQxZeOWFuRK8aDNEGy1uyw3VnVu9
        yu7MS+amdqcwupHfjIug6ZARoXRiBucgytTWbnY=
X-Google-Smtp-Source: ABdhPJw/a4KByzgaJwS0pewRoJ7rbUGlzU3faAbcbx2N6ME39o9YcYVdr9mGW+stRWe7tDpq68HxQvD/hFbdwPE+1Yw=
X-Received: by 2002:a92:5f1a:: with SMTP id t26mr616421ilb.0.1605286350554;
 Fri, 13 Nov 2020 08:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20201109134128.GA5596@shinobu> <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name> <20201109171140.GA14045@shinobu>
 <20201109172220.GI4077@smile.fi.intel.com> <20201109173107.GA14643@shinobu>
 <fe1cfe4c-e4d7-f9fb-1218-7a1d48e6f68a@xilinx.com> <20201110123538.GA3193@shinobu>
 <CACG_h5p84sKjDnK5xYRNjGnRzwsbjZ-76P-cC13LKx=7x=4KqQ@mail.gmail.com>
 <20201110174316.GA12192@shinobu> <20201110220004.GA25801@syed>
In-Reply-To: <20201110220004.GA25801@syed>
From:   Syed Nayyar Waris <syednwaris@gmail.com>
Date:   Fri, 13 Nov 2020 22:22:18 +0530
Message-ID: <CACG_h5orr+smPGFdHbEDAgYS=RUJYZCvf10KjGkkvS9rkbzQFA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
To:     Arnd Bergmann <arnd@kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Wed, Nov 11, 2020 at 3:30 AM Syed Nayyar Waris <syednwaris@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 12:43:16PM -0500, William Breathitt Gray wrote:
> > On Tue, Nov 10, 2020 at 10:52:42PM +0530, Syed Nayyar Waris wrote:
> > > On Tue, Nov 10, 2020 at 6:05 PM William Breathitt Gray
> > > <vilhelm.gray@gmail.com> wrote:
> > > >
> > > > On Tue, Nov 10, 2020 at 11:02:43AM +0100, Michal Simek wrote:
> > > > >
> > > > >
> > > > > On 09. 11. 20 18:31, William Breathitt Gray wrote:
> > > > > > On Mon, Nov 09, 2020 at 07:22:20PM +0200, Andy Shevchenko wrote:
> > > > > >> On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathitt Gray wrote:
> > > > > >>> On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
> > > > > >>>> On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
> > > > > >>
> > > > > >> ...
> > > > > >>
> > > > > >>>>  static inline void bitmap_set_value(unsigned long *map,
> > > > > >>>> -                                    unsigned long value,
> > > > > >>>> +                                    unsigned long value, const size_t length,
> > > > > >>>>                                      unsigned long start, unsigned long nbits)
> > > > > >>>>  {
> > > > > >>>>          const size_t index = BIT_WORD(start);
> > > > > >>>> @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long *map,
> > > > > >>>>          } else {
> > > > > >>>>                  map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
> > > > > >>>>                  map[index + 0] |= value << offset;
> > > > > >>>> +
> > > > > >>>> +               if (index + 1 >= length)
> > > > > >>>> +                       __builtin_unreachable();
> > > > > >>>> +
> > > > > >>>>                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> > > > > >>>>                  map[index + 1] |= value >> space;
> > > > > >>>>          }
> > > > > >>>
> > > > > >>> Hi Syed,
> > > > > >>>
> > > > > >>> Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'nbits'
> > > > > >>> to value_width.
> > > > > >>
> > > > > >> length here is in longs. I guess this is the point of entire patch.
> > > > > >
> > > > > > Ah yes, this should become 'const unsigned long nbits' and represent the
> > > > > > length of the bitmap in bits and not longs.
> > >
> > > Hi William, Andy and All,
> > >
> > > Thank You for reviewing. I was looking into the review comments and I
> > > have a question on the above.
> > >
> > > Actually, in bitmap_set_value(), the intended comparison is to be made
> > > between 'index + 1' and 'length' (which is now renamed as 'nbits').
> > > That is, the comparison would look-like as follows:
> > > if (index + 1 >= nbits)
> > >
> > > The 'index' is getting populated with BIT_WORD(start).
> > > The 'index' variable in above is the actual index of the bitmap array,
> > > while in previous mail it is suggested to use 'nbits' which represent
> > > the length of the bitmap in bits and not longs.
> > >
> > > Isn't it comparing two different things? index of array (not the
> > > bit-wise-length) on left hand side and nbits (bit-wise-length) on
> > > right hand side?
> > >
> > > Have I misunderstood something? If yes, request to clarify.
> > >
> > > Or do I have to first divide 'nbits' by BITS_PER_LONG and then compare
> > > it with 'index + 1'? Something like this?
> > >
> > > Regards
> > > Syed Nayyar Waris
> >
> > The array elements of the bitmap memory region are abstracted away for
> > the covenience of the users of the bitmap_* functions; the driver
> > authors are able to treat their bitmaps as just a set of contiguous bits
> > and not worry about where the division between array elements happen.
> >
> > So to match the interface of the other bitmap_* functions, you should
> > take in nbits and figure out the actual array length by dividing by
> > BITS_PER_LONG inside bitmap_set_value(). Then you can use your
> > conditional check (index + 1 >= length) like you have been doing so far.
> >
> > William Breathitt Gray
>
> Hi Arnd,
>
> Sharing a new version of bitmap_set_value(). Let me know if it looks
> good and whether it suppresses the compiler warning.
>
> The below patch is created against the v12 version of bitmap_set_value().
>
> -static inline void bitmap_set_value(unsigned long *map,
> -                                    unsigned long value,
> -                                    unsigned long start, unsigned long nbits)
> +static inline void bitmap_set_value(unsigned long *map, unsigned long nbits,
> +                                   unsigned long value, unsigned long value_width,
> +                                   unsigned long start)
>  {
> -        const size_t index = BIT_WORD(start);
> +        const unsigned long index = BIT_WORD(start);
> +        const unsigned long length = BIT_WORD(nbits);
>          const unsigned long offset = start % BITS_PER_LONG;
>          const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
>          const unsigned long space = ceiling - start;
>
> -        value &= GENMASK(nbits - 1, 0);
> +        value &= GENMASK(value_width - 1, 0);
>
> -        if (space >= nbits) {
> -                map[index] &= ~(GENMASK(nbits - 1, 0) << offset);
> +        if (space >= value_width) {
> +                map[index] &= ~(GENMASK(value_width - 1, 0) << offset);
>                  map[index] |= value << offset;
>          } else {
>                  map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
>                  map[index + 0] |= value << offset;
> -                map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> +
> +               if (index + 1 >= length)
> +                       __builtin_unreachable();
> +
> +                map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + value_width);
>                  map[index + 1] |= value >> space;
>          }
>  }
>
>

Hi Arnd,

What do you think of the above solution ( new version of
bitmap_set_value() )? Does it look good?

Regards
Syed Nayyar Waris
