Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A83815563F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2020 12:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgBGLB7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Feb 2020 06:01:59 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39013 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgBGLB7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Feb 2020 06:01:59 -0500
Received: by mail-qk1-f194.google.com with SMTP id w15so1757831qkf.6
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2020 03:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jYEmBNpBTgMzRQs7gdedKfJYbwJLLYBirDJd/dMJQwA=;
        b=WWBB6N/q8n4HLzrndVvAccQSpt0l8SV31lI6ZwT6Qz4xM7mWHdAQ6xzaKzu6+523EL
         fDlFO4Wxt/kvZyLIZl0aaUlOOH34NjvJVTV2Jnu9wEliW8GxWxVJPXIiNCvOo9O3CkTV
         O1KVO6U09X1OfWqpCcepuzm6JkioDLEENzxWkCqEopsUk4Xt8MJ/RPIwHM4rR+g8U0Z6
         m+8nfCiC59zeo7cn8e7ilIH8zTbq3gUznAnk5w19LhjjSOgkSGVZNJreDi1YALEtvRbj
         GzUWTjFkbJbPIo+T0fhcyo3Q21jcLKOJZ5lP1qxjy0KaIaSr7OBRsw4M0Hu9kogyWrzt
         rPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jYEmBNpBTgMzRQs7gdedKfJYbwJLLYBirDJd/dMJQwA=;
        b=gV7uNDipMyzco3cUhVLMlGac2jPXKyCxtXlVXcsvr03DX8x1yXOc7euBAnErU/YRyB
         OK736cjrMxZx6aMv4ps6cZVUeSWDtYqfpITGIlq8MyLJOXU3V+CD2CvaAy6ZL+cPNfQS
         eTQTJbMz6807SvO7YycbxgIgx4PCTBgIT7z075z55mgX/6KzCX7Z21s0C/OaUpHZUDwW
         UyJSjaVaaXjegV+Md1/R5ZJyd6JmdDHMhIZDbGDbq4pgH65IQJ7h8G4AJXlITlgc/s0d
         trQW8uoWDuBbLmwycRSZnd1FgBjDAu5lz28sbEknnPDGJAFxwVIk8mk7O7TSqnXUxFo2
         QXjQ==
X-Gm-Message-State: APjAAAUzNYCEQ15qHhvrZuF6Jsn0YNjkGK3tMagGcf24HRTDww0ZqFqj
        KDe+Tlji+KuqxMuA0PwWEPGQtvpNpts6gG1xT+Xoz+Zr
X-Google-Smtp-Source: APXvYqxH6y8kQyLOeMarSJ2WTTeJfNVMyTE7edAcMwWJ0ffwrUeZVwGu8bxtIVFUqFNw72Sls3Rsyagl3q7BnolsCdc=
X-Received: by 2002:a05:620a:12cf:: with SMTP id e15mr6837567qkl.120.1581073317276;
 Fri, 07 Feb 2020 03:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJWWxuc6epswobHsHj9=FsP7D5gjtUAkEbEXHCsMjNfi8g@mail.gmail.com> <20200207103013.GJ10400@smile.fi.intel.com>
In-Reply-To: <20200207103013.GJ10400@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 7 Feb 2020 12:01:46 +0100
Message-ID: <CAMpxmJUHyby59OOppzk2uWgF6BzOBZnwtKN+=mYKWts-7w68pw@mail.gmail.com>
Subject: Re: [PATCH v1] core: Relax gpiod_chip_open() for symbolic links
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 7 lut 2020 o 11:30 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Fri, Feb 07, 2020 at 11:13:43AM +0100, Bartosz Golaszewski wrote:
> > czw., 6 lut 2020 o 19:14 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > >
> > > User may ask device helper tool, for example, udev, to create a speci=
fic
> > > symbolic link to a device node. GPIO chip character device node is no=
t
> > > exceptional. However, libgpiod in the commit d9b1c1f14c6b
> > > ("core: harden gpiod_chip_open()") went way too far in the hardening =
device
> > > node check.
> > >
> > > Relax that hardening for symbolic link to fix the regression.
> > >
> > > Reproducer:
> > >
> > >   % gpioinfo /dev/gpiochip5
> > >   gpiochip5 - 16 lines:
> > >       line   0:  "MUX33_DIR" "uart1-rx-oe" output active-high [used]
> > >       ...
> > >
> > >   % ln -sf /dev/gpiochip5 /dev/MyGPIO_5
> > >
> > >   % gpioinfo /dev/MyGPIO_5
> > >   gpioinfo: looking up chip /dev/MyGPIO_5: Inappropriate ioctl for de=
vice
> > >
> > > Link: https://stackoverflow.com/questions/60057494/gpio-issue-with-sy=
m-link
> > > Fixes: d9b1c1f14c6b ("core: harden gpiod_chip_open()")
> > > Cc: Bartosz Golaszewski <bartekgola@gmail.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Hi Andy,
> >
> > thanks for this - it makes perfect sense. One nit though: could you
> > keep the includes ordered alphabetically?
>
> Probably not. The user space relies a lot on header ordering. And limits.=
h
> sounds like one needed to be included first in many cases. That's why I m=
oved
> it to the top. I can do it if you insist, but I consider it wrong approac=
h for
> the record.

Nah, if anything headers may rely on some preprocessor defines coming
before them, but the ordering should be of no importance.

>
> > Also: it would be great if
> > you could add a test case for this to tests/tests-chip.c.
>
> I will look at it if I can do quickly something.
>

If not, don't worry - I can add it later myself.

Bartosz

> For the record I have tested it on Intel Edison with real GPIO chips (so,
> that's how reproducer code appears in the commit message).
>
> Thanks for review!
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
