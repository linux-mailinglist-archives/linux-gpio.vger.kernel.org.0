Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B19D6792
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 18:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731999AbfJNQoN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 12:44:13 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37347 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfJNQoN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 12:44:13 -0400
Received: by mail-io1-f67.google.com with SMTP id b19so39360452iob.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P9BF3Cnb+eUjNmch0DMfUtsHCLSHllVF4mfXYlOM/54=;
        b=voQpOWUwu5DrduB9BPRDj2VAraNLbNctNkmNolLYCHQ2D4SsGg1VRK7608ZHdmAx0K
         edfNGqSZlUr42Kc+2BIV5nzmc0BMU/FdI6e2gy0XapZO01SPuKT9i3iz8cUWwB6HyD1V
         e10/fmiMFNX8boKBgVMF39nQ75PSiVc42sXOkrpbKGYohNkuyc0f8lxLf+qVD70t8acj
         QgKleN5HMYTHVjidlDGZ1TDRm/fPDW2vVmZVEHBor4dA9F24QoXzJwIEFHiuo7pscMB/
         qxmejwP4lD3+uzPcYTFEEK5g83URnxP3q7swZ30bVErwWL8pjvZZN+G30MrA2l3bGkC/
         EHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P9BF3Cnb+eUjNmch0DMfUtsHCLSHllVF4mfXYlOM/54=;
        b=lCARj04qnpVPr3/wP6ZK3uVjCybVxGtWt5eL4EYr0enm/rSQx8vL9Gk7RxPGpqjCOY
         Umiy0o+YcSf5T4aWTK4UqBk51vXcJjU69VbLi5cVVTXtmZ7a85/ddECygGr74FGCKPqy
         IUswKHLn/x8CcZhHF32elMxMmObfy9jEOkaVvNTV1NtH27GaTL0JkLiJIkuPc5PpUhUj
         +IRRcRnnwzOY3PRVQ4ehEb8SmU41Fc5/AGKtJOLyRV7mOLy7H82z+6GubTSWgKu/02HY
         ICfNrKAGXeCPloKFVLGDVJy4VHAtealRw7BiuJbqM4KfZWPDtCY37InL8VOnXFv2g9Wu
         JYbg==
X-Gm-Message-State: APjAAAWTx6e1x0+4xdDq/mRkjj84vkpnE3cBgoLoxzywfOG/jBn2G3A4
        Ocm+XfZPhY3nJpBjeo/JP9EKVl48ne+Eb4AHdpTWVg==
X-Google-Smtp-Source: APXvYqz/LtM73yKxRgms6C+9964tIjQ9IgXmaUlCyhoYzvt2CcYz7qQcyzy1oZ3fMHmj2mLheDeo9CSE6ikFvOOYMXo=
X-Received: by 2002:a6b:7d4b:: with SMTP id d11mr36998771ioq.40.1571071452598;
 Mon, 14 Oct 2019 09:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-3-warthog618@gmail.com>
 <CAMRc=McVXbZHbRATN9A6ffDgjB8Bc=gGRYLpbfeqzrNLVeNReg@mail.gmail.com> <20191014125859.GB28012@sol>
In-Reply-To: <20191014125859.GB28012@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Oct 2019 18:44:01 +0200
Message-ID: <CAMRc=MdyvansJ2L=YCf_pQhqubVYH=WPSWkY7wci_9Fq=S7bxg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpiolib: add support for pull up/down to lineevent_create
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

pon., 14 pa=C5=BA 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Mon, Oct 14, 2019 at 02:35:38PM +0200, Bartosz Golaszewski wrote:
> > sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napis=
a=C5=82(a):
> > >
> > > This patch adds support for pull up/down to lineevent_create.
> > > Use cases include receiving asynchronous presses from a
> > > push button without an external pull up/down.
> > >
> > > Move all the flags sanitization before any memory allocation in
> > > lineevent_create() in order to remove a couple unneeded gotos.
> > > (from Bartosz Golaszewski <bgolaszewski@baylibre.com>)
> > >
> >
> > The patch you pulled in into your commit already sits in my for-next br=
anch.
> > I didn't know you would be modifying the code I touched earlier. In thi=
s case
> > you can rebase the series on top of gpio/for-next from my tree[1]
> >
> You explicitly told me to rebase it onto the latest release candidate,

Yes, because - as you can find out in
Documentation/process/5.Posting.rst - the general rule is to rebase
the series against the latest release candidate tag from mainline, but
it may become necessary to rebase against the maintainer's tree, which
is the case here.

> and to squash the incomplete changes from your branch into my changes.
> How did you think that was going to pan out?
>

When saying that you can squash my change if you like, I referred to
the unfinished patch[1], not an applied, self-contained change
from[2].

[1] https://github.com/brgl/linux/commit/99b85d1c26ea51b7b6841b2f2971c31d1d=
544c2f
[2] https://github.com/brgl/linux/commit/f6cfbbe2950b2f7ae6a99d5e13285c8fad=
5975d2

> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >  drivers/gpio/gpiolib.c | 60 +++++++++++++++++++++++++---------------=
--
> > >  1 file changed, 36 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index 9d2a5e2f6e77..053847b6187f 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -905,6 +905,38 @@ static int lineevent_create(struct gpio_device *=
gdev, void __user *ip)
> > >         if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
> > >                 return -EFAULT;
> > >
> > > +       offset =3D eventreq.lineoffset;
> > > +       lflags =3D eventreq.handleflags;
> > > +       eflags =3D eventreq.eventflags;
> > > +
> > > +       if (offset >=3D gdev->ngpio)
> > > +               return -EINVAL;
> > > +
> > > +       /* Return an error if a unknown flag is set */
> > > +       if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
> > > +           (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS))
> > > +               return -EINVAL;
> > > +
> > > +       /* This is just wrong: we don't look for events on output lin=
es */
> > > +       if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
> > > +           (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> > > +           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
> > > +               return -EINVAL;
> > > +
> > > +       /* PULL_UP and PULL_DOWN flags only make sense for input mode=
. */
> > > +       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> > > +           ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
> > > +            (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > +               return -EINVAL;
> > > +
> > > +       /*
> > > +        * Do not allow both pull-up and pull-down flags to be set as=
 they
> > > +        *  are contradictory.
> > > +        */
> > > +       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > +           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > +               return -EINVAL;
> > > +
> > >         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
> > >         if (!le)
> > >                 return -ENOMEM;
> > > @@ -922,30 +954,6 @@ static int lineevent_create(struct gpio_device *=
gdev, void __user *ip)
> > >                 }
> > >         }
> > >
> > > -       offset =3D eventreq.lineoffset;
> > > -       lflags =3D eventreq.handleflags;
> > > -       eflags =3D eventreq.eventflags;
> > > -
> > > -       if (offset >=3D gdev->ngpio) {
> > > -               ret =3D -EINVAL;
> > > -               goto out_free_label;
> > > -       }
> > > -
> > > -       /* Return an error if a unknown flag is set */
> > > -       if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
> > > -           (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS)) {
> > > -               ret =3D -EINVAL;
> > > -               goto out_free_label;
> > > -       }
> > > -
> > > -       /* This is just wrong: we don't look for events on output lin=
es */
> > > -       if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
> > > -           (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> > > -           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)) {
> > > -               ret =3D -EINVAL;
> > > -               goto out_free_label;
> > > -       }
> > > -
> > >         desc =3D &gdev->descs[offset];
> > >         ret =3D gpiod_request(desc, le->label);
> > >         if (ret)
> > > @@ -955,6 +963,10 @@ static int lineevent_create(struct gpio_device *=
gdev, void __user *ip)
> > >
> > >         if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
> > >                 set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> > > +       if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
> > > +               set_bit(FLAG_PULL_DOWN, &desc->flags);
> > > +       if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
> > > +               set_bit(FLAG_PULL_UP, &desc->flags);
> > >
> >
> > Correct me if I'm wrong but this looks like it should be part of
> > Drew's patch (1/6) in this series right? You can modify it and add
> > your Signed-off-by tag. In fact your Signed-off-by is needed anyway if
> > you're sending someone else's patches.
> >
> No problem - you are wrong.  Drew's patch added support on handle request=
s.
> This patch adds support on event requests.
>
> Or are you do you want me to squash the whole series down to 2 - gpiolib
> and mockup?
>
