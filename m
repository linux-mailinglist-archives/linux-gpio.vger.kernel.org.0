Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FD9D76DB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 14:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfJOMvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 08:51:31 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35273 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfJOMvb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 08:51:31 -0400
Received: by mail-io1-f67.google.com with SMTP id q10so45665019iop.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2019 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mLy0xeUZbrBgiARc/BzGHOLxwErNQCC3EZbIIelmuPQ=;
        b=p+Pr2pCeX0e7+P7x8iQjgTc8rL7aSUnngrlYyQDNJpWysN1CzjbGYlMrNQL+rV9wDJ
         nzVrPXPEwGCesLGeBnJp8ZONPjVqfe0WeIKYUyhjmj6I4nUPji9mq1efEj99uCUDF7Yv
         27jgA11B7AfXOv0VG4w81nalIA1XL/Vy1O3Pl6EcYRsg6k69vAD0cNS43H14y6Z91AF2
         YaySpEwihvB+Cndn49ZBZeOaDD9mEXVgZTEEzmdyU/WDwfRTCyhCfcGezyxr2CnzaNrR
         SZ1JBypOS83PlbYcUOH/zT5m3sqJy7mgcLOn0JV8ccuJvpZNMb7wmLaaFCdDdH/39rhr
         vOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mLy0xeUZbrBgiARc/BzGHOLxwErNQCC3EZbIIelmuPQ=;
        b=c3Pap1qQ3m7nKR3QqvUB7syiTxrxQWNngJHYWo7AG0HD4595s6a9zKYbfctrhPQtx2
         X/GS9XRmOkMImxS4uNwp6Rhmy6gB0+6WjHK7xgFBelhNkBTU1xTmjls/VfZ/4+gRkcQ9
         aIQ2PX0njivKNffVLHJPORtWinWKka7DOWcPe4Y69fcSz2DDAqm2MtqNjFewxaoNGy66
         KuoUk2S5wi/VENKipBlkyo2kVxgotcS+nrXrHBP/K13ZAuhqVteKhLvGgOK+IUuuv3B+
         e2H7UtScMAGXBYp6P2dtFwhwq08S/6Xi8ezdpuKSxmNhbXADWhovhmkZy8/LmPupMq8e
         Ik2g==
X-Gm-Message-State: APjAAAXG1ZHngraIcLiNroqbMxGXLoRNrwbdJq1hhuDANjTRK+fFgJFS
        bSpswQU7NGpzAPhy7h9ujSz5XCPWVDTCYxXItbAkug==
X-Google-Smtp-Source: APXvYqwVGB0+wU/dfoQs/aWy/hDCukFwc9zEIurUMyRlKbqAOrPRs9be48kB2fp0vP5HouKp4lsWVg7sPaKkwzAu+II=
X-Received: by 2002:a05:6638:a1b:: with SMTP id 27mr37907746jan.102.1571143889334;
 Tue, 15 Oct 2019 05:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol> <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol>
In-Reply-To: <20191015005849.GA7970@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Oct 2019 14:51:18 +0200
Message-ID: <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 15 pa=C5=BA 2019 o 02:58 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski wrote:
> > pon., 14 pa=C5=BA 2019 o 15:04 Kent Gibson <warthog618@gmail.com> napis=
a=C5=82(a):
> > >
> > > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wrote:
> > > > sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.com> n=
apisa=C5=82(a):
> > > > >
> > > > > This patch allows pull up/down bias to be disabled, allowing
> > > > > the line to float or to be biased only by external circuitry.
> > > > > Use case is for where the bias has been applied previously,
> > > > > either by default or by the user, but that setting may
> > > > > conflict with the current use of the line.
> > > > >
> > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > ---
> > > > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > index 647334f53622..f90b20d548b9 100644
> > > > > --- a/drivers/gpio/gpiolib.c
> > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_dev=
ice *gdev, void __user *ip)
> > > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > > >                 return -EINVAL;
> > > > >
> > > > > -       /* Same with pull-up and pull-down. */
> > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > -               return -EINVAL;
> > > > > -
> > > > >         /*
> > > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a singl=
e request. If
> > > > >          * the hardware actually supports enabling both at the sa=
me time the
> > > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_devi=
ce *gdev, void __user *ip)
> > > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > > >                 return -EINVAL;
> > > > >
> > > > > -       /*
> > > > > -        * Do not allow both pull-up and pull-down flags to be se=
t as they
> > > > > -        *  are contradictory.
> > > > > -        */
> > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > -               return -EINVAL;
> > > > > -
> > > > >         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
> > > > >         if (!le)
> > > > >                 return -ENOMEM;
> > > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip=
 *gc, unsigned offset,
> > > > >         unsigned arg;
> > > > >
> > > > >         switch (mode) {
> > > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > >                 arg =3D 1;
> > > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc=
 *desc)
> > > > >         if (ret =3D=3D 0)
> > > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > > >
> > > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > > > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > >
> > > > From looking at the code: user-space can disable bias when setting
> > > > both PULL_UP and PULL_DOWN flags. I don't understand why it's done =
in
> > > > this implicit way? Why not a separate flag?
> > >
> > > An extra flag would waste a bit and add nothing but more sanity check=
ing.
> > >
> >
> > I disagree. The user API needs to be very explicit. Sanity checking is
> > alright - if there'll be too many ifdefs, we can start thinking about
> > adding some core library helpers for sanitizing conflicting flags, I'm
> > sure other frameworks could use something like this as well.
> >
> > Especially in this context: setting PULL_UP and PULL_DOWN together
> > disables bias - this doesn't make sense logically.
> >
> In a way it does make a weird kind of sense - they cancel.  Physically.
>

Yes, on some devices we set both bits to disable bias, but on others
the pull-up and pull-down bits need to be cleared and yet others have
a dedicated bit for that. It's not standardized and the pinctrl
framework defines all three values as separate bits to expose a common
programming interface.

> Did you read the cover letter?  The problem, as I see it,
> is that we're stuck using a flag field to encode a two bit enum.
> That fact the we only have a flag field to play with can't be
> changed due to ABI.

For some reason I haven't received the cover letter on my inbox. I'm
only now seeing it on linux-gpio archives.

Anyway: I don't understand why you insist on using two instead of
three bits. You have 32 bits in total that can be used and only 5 are
used so far. There's plenty left.

I'd prefer to see:

GPIOHANDLE_REQUEST_PULL_UP
GPIOHANDLE_REQUEST_PULL_DOWN
GPIOHANDLE_REQUEST_PULL_DISABLED

or maybe even

GPIOHANDLE_REQUEST_BIAS_PULL_UP
GPIOHANDLE_REQUEST_BIAS_PULL_DOWN
GPIOHANDLE_REQUEST_BIAS_DISABLED

to stay consistent with the pinctrl flags. No bit set among these
three would mean AS_IS.

Bart

> I'd be happier adding utils to pull bit fields out of flags.
>
> It makes no sense to me to add another flag, so I wont be doing that.
>
> Cheers,
> Kent.
>
