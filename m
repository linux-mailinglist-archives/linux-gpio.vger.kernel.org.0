Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63811118C98
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 16:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfLJPee (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 10:34:34 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:36718 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727524AbfLJPee (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 10:34:34 -0500
Received: by mail-il1-f194.google.com with SMTP id b15so16513869iln.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 07:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FGyjYTdu5ZHfhBTYWa8rY8PUU33rrbDpvrkOm5yDTKU=;
        b=zsi7BXLZHizQ/ZIdGHk1obNgb9g5EtEzg1WCUE/CFWb/TfvqW8pzY+TGw/g/ciM9iV
         xvc2rZQZu94so3EXcA5h9HThj/wJe5oDwUDTSSL2vqv5C423zz6VJwAvnvHv226Q6X1z
         BbtVZBbhxtuvbeSP5WaA6bqMqUu6t1SXf64SVmI492DuNoJ87VixAy9KECN9qe6airKJ
         y9MyNlbZVZdxQtwAAOd+LAb2qT1UvvxQDVUEWAvwLdwVudg5Le01IxP50oTy04o+IRqp
         MMK/x1HVGZEd6yDpqyrcVAQrnv7KSofV/In1ibOuRau1nP0YzXeYx0cKUBODlErPEv8K
         3m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FGyjYTdu5ZHfhBTYWa8rY8PUU33rrbDpvrkOm5yDTKU=;
        b=YMQ0v6MnbtY5w1qdJfBWyKhKtOVx8I9OMszj0UCS47vNQIvryMuPzekZVfopXRKj1o
         jy7v+bTmiEDef6Bx3OLTXUm/JfuqN+rdqfQu8ijrEnaREI0g6iJKz2hX4kOtL7z1krhi
         EL7Ilxn7v9ttNjvZ15H7ybOSi1vM6Eg2AUZePSounbi3qu8oAxSV57U3/1CLbvRNA5sC
         4yGiNWKYbn8QC9VMHf2cMTeCCNzdVkiL6DP+xPDMbaDRrFRnUWPcyXnRIZKkaO2rgDfV
         gMH2tiN7vEye3kgbOuAyNmB+2KV35/bEV5tkCVjGeHdtoeU34G/hWU00kr5wfA8ncKaW
         LolA==
X-Gm-Message-State: APjAAAVprdVpVBu95rln+ETAxLkXOvmeGJ8cF62Oli6R/TU9wvrVgKsM
        XhLX6iPbtsjKsDGHEaD8qhQlUsjZFBBDdPhfYFhOrg==
X-Google-Smtp-Source: APXvYqxR6yL60usvgtnxayjCw7D66FdmmysWcML2rqCAD7Jj4eV7h4xdg0eGxLK1ndOT2EpRQNCwnViaykhRbnK+7Do=
X-Received: by 2002:a05:6e02:beb:: with SMTP id d11mr33169519ilu.220.1575992073058;
 Tue, 10 Dec 2019 07:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20191210021525.13455-1-warthog618@gmail.com> <CAMRc=Md4PmbcGAKxP1LG08bREtWCtsXbt=ZgL50PrizF4F4pxg@mail.gmail.com>
 <20191210145515.GB3509@sol>
In-Reply-To: <20191210145515.GB3509@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Dec 2019 16:34:21 +0100
Message-ID: <CAMRc=MemKDFDHpEdq2OKvEduBTdi2c3oQmgeYF8qX1rcc-rk8A@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-mockup: Fix usage of new GPIO_LINE_DIRECTION
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 10 gru 2019 o 15:55 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Tue, Dec 10, 2019 at 03:11:12PM +0100, Bartosz Golaszewski wrote:
> > wt., 10 gru 2019 o 03:15 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > Restore the external behavior of gpio-mockup to what it was prior to =
the
> > > change to using GPIO_LINE_DIRECTION.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >
> > > Fix a regression introduced in v5.5-rc1.
> > >
> > > The change to GPIO_LINE_DIRECTION reversed the polarity of the
> > > dir field within gpio-mockup.c, but overlooked inverting the value on
> > > initialization and when returned by gpio_mockup_get_direction.
> > > The latter is a bug.
> > > The former is a problem for tests which assume initial conditions,
> > > specifically the mockup used to initialize chips with all lines as in=
puts.
> > > That superficially appeared to be the case after the previous patch d=
ue
> > > to the bug in gpio_mockup_get_direction.
> > >
> > >  drivers/gpio/gpio-mockup.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > > index 56d647a30e3e..c4fdc192ea4e 100644
> > > --- a/drivers/gpio/gpio-mockup.c
> > > +++ b/drivers/gpio/gpio-mockup.c
> > > @@ -226,7 +226,7 @@ static int gpio_mockup_get_direction(struct gpio_=
chip *gc, unsigned int offset)
> > >         int direction;
> > >
> > >         mutex_lock(&chip->lock);
> > > -       direction =3D !chip->lines[offset].dir;
> > > +       direction =3D chip->lines[offset].dir;
> > >         mutex_unlock(&chip->lock);
> > >
> > >         return direction;
> > > @@ -395,7 +395,7 @@ static int gpio_mockup_probe(struct platform_devi=
ce *pdev)
> > >         struct gpio_chip *gc;
> > >         struct device *dev;
> > >         const char *name;
> > > -       int rv, base;
> > > +       int rv, base, i;
> > >         u16 ngpio;
> > >
> > >         dev =3D &pdev->dev;
> > > @@ -447,6 +447,9 @@ static int gpio_mockup_probe(struct platform_devi=
ce *pdev)
> > >         if (!chip->lines)
> > >                 return -ENOMEM;
> > >
> > > +       for (i =3D 0; i < gc->ngpio; i++)
> > > +               chip->lines[i].dir =3D GPIO_LINE_DIRECTION_IN;
> > > +
> > >         if (device_property_read_bool(dev, "named-gpio-lines")) {
> > >                 rv =3D gpio_mockup_name_lines(dev, chip);
> > >                 if (rv)
> > > --
> > > 2.24.0
> > >
> >
> > Hi Kent,
> >
> > I was applying and testing your libgpiod series and noticed that the
> > gpio-tools tests fail after applying patches 16 & 17 (with linux
> > v5.5-rc1). Is this fix related to this?
> >
>
> I don't think so.  I've only been able to trip this problem with a
> couple of corner cases in my Go uapi test suite.
> I have been unable to reproduce it with the tools as it requires
> multiple requests with the same chip fd, including an as-is, to trip.
>
> And running the libgpiod tests against v5.5-rc1 works for me.
> Can you provide more details as to the errors you are seeing?
>

Hmm whatever that was, it's gone now. Must have been some leftovers
from previous builds. All works now.

> Btw, I was writing tests for your LINEINFO_WATCH patch v2, which I was
> applying to v5.5-rc1, when I ran across this.  That works ok if I
> __packed the changed struct.

These things can still change, so don't spend too much time on it yet. :)

Since the lineinfo struct is not __packed, I'd prefer to not use it
for any struct embedding it. I'll just add appropriate padding for
64-bit alignment.

> And I can confirm that patch v2 doesn't isolate watches on different
> chip fds.
>

Yeah, I'll fix this.

Bart

> Kent.
