Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4EED041E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 01:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfJHXaa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 19:30:30 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46281 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfJHXaa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 19:30:30 -0400
Received: by mail-io1-f65.google.com with SMTP id c6so722904ioo.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2019 16:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wpg6ZUwaXoBQyOBNxI7uuEthX854/7IBZjGhrLVTWqg=;
        b=EMll1R7r/p3m4y+iIzy/wY7RudZ0lftv5HHWM7OtnSvjjJfRGDinp7oJUHdyERoTUg
         07HeroDdms282GkF2+QTGa/GjqUq1uHNVzJU5iTHgoY+eNzV1okyRNRZez3iTsBIz6jF
         fsiQ1TXt/KLGIFSLeA+mPsVx8P9KBkbkQOgeZhAMzKNXqGfQkvZEn51IWEknNub40mw7
         oOQk3QZU29Rtayy0CwX5DOFQu1adRfNIaAXdIwhArSb/y81utaDNxmtgpTDzmdkQ4Yjc
         lIWD/70fL/A2nFV6DUmaf1cK4+gvgSxsgsRbYAgBdSHBT0Ma2Gp23pSQc6IWeNQfruxG
         HfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wpg6ZUwaXoBQyOBNxI7uuEthX854/7IBZjGhrLVTWqg=;
        b=KSEEM+fm1FgWBr3awz+3TwIzw952ars+loNkARHdjMqhWEjxAbvD5rwg3+dlqrGSEl
         DS4+EV0lGM4oOpATB7tzt7rXPxmDGz/yjI/GuamMC2sLYJy798DPBX5t04iVDv3H91ky
         AosvZ8kh1/agE3u4Tf30EGeYVCCxQxbzPIDDDKb4CDQLz8e5HgE1duON+eb1f7w2N6jc
         itpfphz+QIijfB2kPsGQFtNFpQIIVFyGxV33S6YQP+0jJdE7x61P3R7BfPWgm1Comji/
         CI9obek95Bj/v/L10ZHbh+ckrdMufjQIgQtIRe3141nJ9OhdN/5+xzB2l1DYZ977CT+7
         BkLg==
X-Gm-Message-State: APjAAAU+Hb9WyTp4Z4eMbu7ylE38DYbs6TxWSFZlzhoKwfs6WGXVC7gz
        bM4bjFJw+fACzhFCDYzu6IbZESioo3BAT1y1d/dJVbZ2Oks=
X-Google-Smtp-Source: APXvYqz5QQLDG3oxmDXxTFHZOu97QBEKnBIY9Q1hmYOudk3cipi0/1LMfUMzuvmNalwJMEfoUEMNyN6rl3ckFhqVbD0=
X-Received: by 2002:a5d:8543:: with SMTP id b3mr739505ios.220.1570577429384;
 Tue, 08 Oct 2019 16:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com> <20191008232120.GA9225@sol>
In-Reply-To: <20191008232120.GA9225@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Oct 2019 01:30:18 +0200
Message-ID: <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 9 pa=C5=BA 2019 o 01:21 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
>
> On Tue, Oct 08, 2019 at 10:56:18PM +0200, Bartosz Golaszewski wrote:
> > wt., 8 pa=C5=BA 2019 o 08:15 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > On Sat, Sep 21, 2019 at 12:25:23PM +0200, Drew Fustini wrote:
> > > > Add pull-up/pull-down flags to the gpio line get and
> > > > set ioctl() calls.  Use cases include a push button
> > > > that does not have an external resistor.
> > > >
> > > > Addition use cases described by Limor Fried (ladyada) of
> > > > Adafruit in this PR for Adafruit_Blinka Python lib:
> > > > https://github.com/adafruit/Adafruit_Blinka/pull/59
> > > >
> > > > Signed-off-by: Drew Fustini <drew@pdp7.com>
> > > > ---
> > > >  drivers/gpio/gpiolib.c    | 12 ++++++++++++
> > > >  include/uapi/linux/gpio.h |  4 ++++
> > > >  2 files changed, 16 insertions(+)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index d9074191edef..9da1093cc7f5 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -427,6 +427,8 @@ struct linehandle_state {
> > > >       (GPIOHANDLE_REQUEST_INPUT | \
> > > >       GPIOHANDLE_REQUEST_OUTPUT | \
> > > >       GPIOHANDLE_REQUEST_ACTIVE_LOW | \
> > > > +     GPIOHANDLE_REQUEST_PULL_UP | \
> > > > +     GPIOHANDLE_REQUEST_PULL_DOWN | \
> > > >       GPIOHANDLE_REQUEST_OPEN_DRAIN | \
> > > >       GPIOHANDLE_REQUEST_OPEN_SOURCE)
> > > >
> > > > @@ -598,6 +600,10 @@ static int linehandle_create(struct gpio_devic=
e *gdev, void __user *ip)
> > > >                       set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> > > >               if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
> > > >                       set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> > > > +             if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
> > > > +                     set_bit(FLAG_PULL_DOWN, &desc->flags);
> > > > +             if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
> > > > +                     set_bit(FLAG_PULL_UP, &desc->flags);
> > > >
> > > >               ret =3D gpiod_set_transitory(desc, false);
> > > >               if (ret < 0)
> > > > @@ -1102,6 +1108,10 @@ static long gpio_ioctl(struct file *filp, un=
signed int cmd, unsigned long arg)
> > > >               if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
> > > >                       lineinfo.flags |=3D (GPIOLINE_FLAG_OPEN_SOURC=
E |
> > > >                                          GPIOLINE_FLAG_IS_OUT);
> > > > +             if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > +                     lineinfo.flags |=3D GPIOLINE_FLAG_PULL_DOWN;
> > > > +             if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > +                     lineinfo.flags |=3D GPIOLINE_FLAG_PULL_UP;
> > > >
> > > >               if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> > > >                       return -EFAULT;
> > > > @@ -2475,6 +2485,8 @@ static bool gpiod_free_commit(struct gpio_des=
c *desc)
> > > >               clear_bit(FLAG_REQUESTED, &desc->flags);
> > > >               clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
> > > >               clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
> > > > +             clear_bit(FLAG_PULL_UP, &desc->flags);
> > > > +             clear_bit(FLAG_PULL_DOWN, &desc->flags);
> > > >               clear_bit(FLAG_IS_HOGGED, &desc->flags);
> > > >               ret =3D true;
> > > >       }
> > > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > > > index 4ebfe0ac6c5b..c2d1f7d908d6 100644
> > > > --- a/include/uapi/linux/gpio.h
> > > > +++ b/include/uapi/linux/gpio.h
> > > > @@ -33,6 +33,8 @@ struct gpiochip_info {
> > > >  #define GPIOLINE_FLAG_ACTIVE_LOW     (1UL << 2)
> > > >  #define GPIOLINE_FLAG_OPEN_DRAIN     (1UL << 3)
> > > >  #define GPIOLINE_FLAG_OPEN_SOURCE    (1UL << 4)
> > > > +#define GPIOLINE_FLAG_PULL_UP        (1UL << 5)
> > > > +#define GPIOLINE_FLAG_PULL_DOWN      (1UL << 6)
> > > >
> > > >  /**
> > > >   * struct gpioline_info - Information about a certain GPIO line
> > > > @@ -62,6 +64,8 @@ struct gpioline_info {
> > > >  #define GPIOHANDLE_REQUEST_ACTIVE_LOW        (1UL << 2)
> > > >  #define GPIOHANDLE_REQUEST_OPEN_DRAIN        (1UL << 3)
> > > >  #define GPIOHANDLE_REQUEST_OPEN_SOURCE       (1UL << 4)
> > > > +#define GPIOHANDLE_REQUEST_PULL_UP   (1UL << 5)
> > > > +#define GPIOHANDLE_REQUEST_PULL_DOWN (1UL << 6)
> > > >
> > > >  /**
> > > >   * struct gpiohandle_request - Information about a GPIO handle req=
uest
> > > > --
> > > > 2.20.1
> > > >
> > > Sorry for the late feedback, but I'm still not sure whether this patc=
h
> > > is on track to be applied or not.  I had thought not, at least not ye=
t,
> > > but just in case...
> > >
> >
> > It still needs some fixes, but Linus seems to be fine with the general =
idea.
> >
> > > You have added the flags to linehandle_create, but not lineevent_crea=
te.
> > > Given that your primary use case is push buttons, isn't the event req=
uest
> > > at least as important as the handle request?  Even ignoring your use
> > > case, I'd add them to lineevent_create just to maintain symmetry.
> > >
> > > Also, is it valid to set PULL_UP and PULL_DOWN simulaneously?
> > > I would think not, but I could be wrong.
> > > If not then that combination should be rejected with EINVAL.
> > >
> >
> > Yes, some validity checks of the flags must be added. I even did it in
> > my local branch[1].
> >
> Your changes for linehandle_create look ok, but for lineevent_create
> you explicitly disabled PULL_UP and PULL_DOWN, and in a block labelled
> "This is just wrong: we don't look for events on output lines" at that.
>

Yeah, feel free to change it.

> > Re: direction and configuration changes on requested lines: I think
> > it's quite useful to add in the form of a new ioctl():
> > GPIOHANDLE_SET_CONFIG_IOCTL or something. I started hacking on this
> > but eventually got more busy this week than I anticipated. I'm still
> > planning on sending an RFC by the end of the week though.
> >
> I have the reverse problem - bored and looking for something to do, so
> more than willing to help out - if you want it.
>

Sure, in that case let's just wait for your patches. You can just
extend what I started, if you wish.

> And while we're talking, does the gpio-mockup support pull up/down
> being set from the kernel side?
>

No, but feel free to add it.

Bart

> Cheers,
> Kent.
> >
> > [1] https://github.com/brgl/linux/commit/82fc38f6ab599ee03f7a8ed078de8a=
bb41e6e611
> >
> > > Cheers,
> > > Kent.
