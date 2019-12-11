Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F2E11A6A0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfLKJSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:18:51 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36638 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfLKJSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:18:50 -0500
Received: by mail-qk1-f195.google.com with SMTP id a203so8935852qkc.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DfZRQWtpxIT6RSKoJlvlm0/i04hYhmTOZJ2NW+P5URs=;
        b=bToq2n96hpmFkDblab3ofAU9M4i+2gR/uxr64y29yOGQaxYQJwCoHVMmRbO84DK62e
         kj3jjB0p6njbLxUhpv76KBh4XeKZHTUY3Y4vfUw+A3xVAAXc67iFi121Or5m4evj6HxG
         mqBYke6A0YtXi02OQW2dNaS/VrW5gctoM4YWjLY3YleFSYbp1yRlx0TTYKVQGt3CEvz4
         Wfbabr2NyMFW+p0CU2PWmpZVPGPHO/20a1+8ceaP0Qv9TpSAk9LijNGQZZBo1+tcWN9Q
         spF/wBac3wRUyAneP+69qYDNOuLeLe6mvbTTmhjnzwYllBOmwYOHr+qKZGg8agQeuH9o
         qyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DfZRQWtpxIT6RSKoJlvlm0/i04hYhmTOZJ2NW+P5URs=;
        b=BJyOpnbMKUTmUV4N69ph/1Oo44vy2ujfhqLw6AvhlKXQlZoAY45YfUga9VvuP7RjIw
         KXsNqLjREvFEHFRjHwoFlTr1wlJy86na28JJVUYWRBQ+uXpl7Qc1yaq7pEeUbw3BK/P7
         nROyFYeTn2po9h0Tft5e5pg1qM6wu/mr913+Ku46djhSTwULaLV3ZQ52CLeeWP3fSHUx
         FcL3nxLFBVnlomiV1q6Vz+9rS71cjWkM4mU6IAHYokvJR0X0UtROoaNJ8GuLCyL5lIZg
         WT1UFKZfy4ximz5gz4K+sZ8F7LsWKrOUpCpyDQBpiFPEMNuRnZ2XYD1FTLkX+n8edlh0
         /+dg==
X-Gm-Message-State: APjAAAVmDah5ANShURCXL4xxN4pRRUeYGpWf8DjiaFfdXnnSeVvi0ohc
        hQ3ndOKANMtUkt43Y2qFc4u3+PBcJVaXfVwONmhawg==
X-Google-Smtp-Source: APXvYqzetABNV9fOEWPJstn2UH9mbxj2Rci7QE/KLGNQ12XM3JYfa6yA6hoEFQmSb24qAQlpl64yEgC/1Rd3Adjp1Bo=
X-Received: by 2002:a05:620a:136e:: with SMTP id d14mr1711899qkl.263.1576055929922;
 Wed, 11 Dec 2019 01:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
 <20191210143902.GA3509@sol> <20191210165548.GY32742@smile.fi.intel.com>
In-Reply-To: <20191210165548.GY32742@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 10:18:39 +0100
Message-ID: <CAMpxmJVMW=3k2odB9UKEzeopZ0q7T48Cux6ux=1j72Hv5A4yOQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 10 gru 2019 o 17:55 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> > For Go the structs are aligned based on the size of their components so
> > that arrays of struct are naturally aligned.  The struct is given a
> > hidden trailing pad so that a subsequent struct will be correctly align=
ed.
> > The sizeof the struct includes this hidden pad.
> > I'm pretty sure the same is true for gcc.
> >
> > The gpioevent_data contains a __u64 which causes the whole struct to be
> > 64 bit aligned on 64 bit, so it actually looks like this internally:
> >
> > struct gpioevent_data {
> >       __u64 timestamp;
> >       __u32 id;
> >     __u32 pad; // hidden
> > };
> >
> > so 16 bytes.
> >
> > On 32 bit the struct is 32 bit aligned and the trailing pad is missing,
> > so 12 bytes. This causes grief for the read due to the size mismatch.
>
> Exactly.
>
> > (I'm sorry to say I had to add the pad to my Go gpiod library to get it
> > to read event data - but forgot to go back later and work out why -
> > until now :-()
> >
> > Your new info change struct has the same problem, as it also contains a
> > __u64 and ends up with an odd number of __u32s, so gets a trailing pad
> > on 64 bit.  Using __packed seems to inhibit the trailing pad.
> > Or you could explicitly add the pad so the struct will be 64bit aligned
> > even on 32bit.
>
> I spoke to colleague of mine and has been told that best option is to fil=
l all
> gaps explicitly to have all members in the struct + 8 bytes alignment at =
the
> end (also with explicit member).
>
> > Neither of those options are available for the
> > gpioevent_data, as that would break the ABI.
>
> ABI needs v2 actually.
>

I finally sat down to integrate this with my series and figured that
this can't go on top of it. It's a bug-fix actually and maybe even
stable material.

On the other hand - if we have so few users of GPIO chardev with
32-bit user-space and 64-bit kernel - maybe we should just bite the
bullet, not fix this one, deprecate it and introduce a proper v2 of
the API?

Bart
