Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6744C155751
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2020 13:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgBGMFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Feb 2020 07:05:13 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45700 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgBGMFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Feb 2020 07:05:13 -0500
Received: by mail-lj1-f194.google.com with SMTP id f25so1843640ljg.12
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2020 04:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wLYUP31PBOEh7cgvfVxhY2FhnjbAgefpG5VYMnDXPck=;
        b=jhVJet1PfRnYadMEKgxbOX4/iHeQ4PrWBYSeJ69TSZVyF/qL6J2AvnqIr62fq/oJJn
         L29GPQZH/gDBQCOueRmPw4O+qxCWJKJZJjW6Vgc7RthS5GGn8RiHq8VcklYIu6EsdMBP
         PNUvlTzVNz4Qar+iwNUJTf/wrENAjDxDY8nk36N+8IQEceVeMidJ4DIl9z1FbuSf3zsT
         B1RlaAEeTuPHWbhnDHMZRQW6jSaqMDzmw5OgSes/Sluvh2OUg+bxqd3CoOpZ0CxNch3f
         0SEaP2Ni6M0XqAGa3SR3WOi5OpEly8+UeG4mu40vt2cGsexJU8+fpod1tRZZeihQHau5
         VIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wLYUP31PBOEh7cgvfVxhY2FhnjbAgefpG5VYMnDXPck=;
        b=KVUwHXiD0YYKQ3tBjlYyx2buwV6SEoOo90ECplfgPG9QT6FCEAfCie/gARNQCIZ4cQ
         i8uk2MNbwPtzhXMe7Njgyke05yrJr86dBkmLVw4bu0MFszsjVVZ7zvpE5xmnH7SSVUCI
         4ImdXqOlAz8lhtxx9CyR0/Tk4rNn3w0p+mdeNGFLl6vi+Dk4tX7D8hiafdsEuuQ4Yntz
         S31VYzmvO7UgvOPRo6lEZPB8lHjqDLJS9EKd01oom06izzKOsaBNs/ZTVf7ZQD3F3M61
         bAv3t0iV+Fmlu3mMBaXF5QLMqnexWY/C007QkK4K+Hy/qMf33P6cQuMXC/8tTqjVlFcO
         KhIw==
X-Gm-Message-State: APjAAAWe1OEE0zcVhvHom7i2wnapKOz4jYjFoWqDrfaT7tLVjI3ceZTN
        qe0+R78aDC645ElnFemqZDSAgv1Fvqo99kaouY8=
X-Google-Smtp-Source: APXvYqyxeNXfM5DJ9DRVm0DhHREwWejzG9cIi0aaEj5sEQvsH7V3L+x3+gEl3Io+vPw+Ev+ddxxAHoz0tAoRjVtmwIs=
X-Received: by 2002:a2e:808a:: with SMTP id i10mr5173719ljg.151.1581077111457;
 Fri, 07 Feb 2020 04:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJWWxuc6epswobHsHj9=FsP7D5gjtUAkEbEXHCsMjNfi8g@mail.gmail.com>
 <20200207103013.GJ10400@smile.fi.intel.com> <CAMpxmJUHyby59OOppzk2uWgF6BzOBZnwtKN+=mYKWts-7w68pw@mail.gmail.com>
 <20200207112816.GK10400@smile.fi.intel.com>
In-Reply-To: <20200207112816.GK10400@smile.fi.intel.com>
From:   =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bartekgola@gmail.com>
Date:   Fri, 7 Feb 2020 13:05:00 +0100
Message-ID: <CAFdkumjmz3pC0p5ei9Cmf79RB-kMB8050VMCFi2soa5ALs71PQ@mail.gmail.com>
Subject: Re: [PATCH v1] core: Relax gpiod_chip_open() for symbolic links
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 7 lut 2020 o 12:28 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Fri, Feb 07, 2020 at 12:01:46PM +0100, Bartosz Golaszewski wrote:
> > pt., 7 lut 2020 o 11:30 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > > On Fri, Feb 07, 2020 at 11:13:43AM +0100, Bartosz Golaszewski wrote:
> > > > czw., 6 lut 2020 o 19:14 Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> ...
>
> > > > thanks for this - it makes perfect sense. One nit though: could you
> > > > keep the includes ordered alphabetically?
> > >
> > > Probably not. The user space relies a lot on header ordering. And lim=
its.h
> > > sounds like one needed to be included first in many cases. That's why=
 I moved
> > > it to the top. I can do it if you insist, but I consider it wrong app=
roach for
> > > the record.
> >
> > Nah, if anything headers may rely on some preprocessor defines coming
> > before them, but the ordering should be of no importance.
>
> Okay, in any case, if you think it's better to be sorted, can you change =
it
> when applying? (I don't think we need another version simple for that)
>

Sure.

> > > > Also: it would be great if
> > > > you could add a test case for this to tests/tests-chip.c.
> > >
> > > I will look at it if I can do quickly something.
>
> > If not, don't worry - I can add it later myself.
>
> I briefly looked at this, but it seems not feasible to me in reasonable t=
ime,
> sorry.
>
> The problems I encountered are, but not limited to:
> - creating a symlink in a test case folder
> - understanding how to handle interrupt of the test case (we have to remo=
ve
>   link ourselves or framework does it for us?)
> - where to put the symbolic link creation: I think it might be a (boolean=
)
>   parameter to gpio-mockup testing API when we "make a chip" (when device=
 node
>   should appear) to enable symlink with a predefined name (like
>   $testpath/gpiochipX-link)
> - last time I did something (simple!) with GLib was several years ago
>

Sure, I can do it myself - it will probably take me much less time.

Bart
