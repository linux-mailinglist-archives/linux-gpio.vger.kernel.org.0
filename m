Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92439D8524
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 03:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfJPBBM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 21:01:12 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46882 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfJPBBM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 21:01:12 -0400
Received: by mail-pg1-f194.google.com with SMTP id e15so5186963pgu.13
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2019 18:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Kpae+Gtm1ss98oUzxH1ELgS7uo8kJ0m4uxXghe9jubc=;
        b=RcIJTUKjNcDf0OnrWevwMQu4c42IJ459kTkcAzkX78QsU1XtmTV6huLLcT9n02KXgo
         dzjSKyRQP+/Cj4Kb8Kc3YG0zEE07GFbnxf0JZSymRLndiRDhlDPB0exjhGyEz1IEg7zT
         /opzukAeojjdFbSwa6nUBVEArBnyjw7FZrAG6LWC0jcivM8wmlo2wJV8UC0FkRVV9FV7
         falC94SYq79emCzaROCIfb0ilIsy6+XLI5G4N9H1kMBNdRvs5HSf15AtFrmuA15OAw8O
         hJASzerwGTVZe59bQWkueNwooMbKRjLgo8H8LRRow40h8SiR7MyZz2kNxAVMOyvw2wIw
         SgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Kpae+Gtm1ss98oUzxH1ELgS7uo8kJ0m4uxXghe9jubc=;
        b=ll8lMBc7E4KzoZNIEhP3FL+TklJ00L76oTWJdEZUe1IL3+OxaBBnCf1yNes2msAJhV
         JZyzoP7nE52n0YYG1ML9d7Er9QN+5jwoojl3F8zrP3B+v4N4MEUfTu3iWrISanAHt2zI
         Ftpdew6PIx+6GREiW4lVrUsr7fs3mUrtf95DdY7OGW0K2fPw7NWR8dOqh3mgFGbEDnFy
         qEDyjvaaIO4pwtp8xVdi6knuOjFgM69NheLzCXMqfPEgiw4j4/QUxun5NF39DKZp3vJ1
         pMxTxgvSkD9wweVgs+8Zezh0HOoSuWxLl7SsLrvMrc0PY3c2pUlBd1lD1Y6QgvHxIUkB
         jOVw==
X-Gm-Message-State: APjAAAWQKiK3qVZ3xhyGG46/ZXo32v0h8i4pUaFu01cpxgIEuOmEXzg0
        dVd+eLyKJclFJ2Myd79m0yg=
X-Google-Smtp-Source: APXvYqww3/EFm7qxXr8oAwxM1UFE5x/GUEOAQDlscLeJCGlZwnYEZIroJyHdkUsecX+KAZQkG4ZNmA==
X-Received: by 2002:a17:90a:d152:: with SMTP id t18mr1494950pjw.111.1571187670950;
        Tue, 15 Oct 2019 18:01:10 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v35sm288746pgn.89.2019.10.15.18.01.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2019 18:01:09 -0700 (PDT)
Date:   Wed, 16 Oct 2019 09:01:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
Message-ID: <20191016010104.GA8083@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol>
 <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol>
 <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 15, 2019 at 02:51:18PM +0200, Bartosz Golaszewski wrote:
> wt., 15 paź 2019 o 02:58 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski wrote:
> > > pon., 14 paź 2019 o 15:04 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wrote:
> > > > > sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > This patch allows pull up/down bias to be disabled, allowing
> > > > > > the line to float or to be biased only by external circuitry.
> > > > > > Use case is for where the bias has been applied previously,
> > > > > > either by default or by the user, but that setting may
> > > > > > conflict with the current use of the line.
> > > > > >
> > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > > > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > > index 647334f53622..f90b20d548b9 100644
> > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> > > > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > > > >                 return -EINVAL;
> > > > > >
> > > > > > -       /* Same with pull-up and pull-down. */
> > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > -               return -EINVAL;
> > > > > > -
> > > > > >         /*
> > > > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> > > > > >          * the hardware actually supports enabling both at the same time the
> > > > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> > > > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > > > >                 return -EINVAL;
> > > > > >
> > > > > > -       /*
> > > > > > -        * Do not allow both pull-up and pull-down flags to be set as they
> > > > > > -        *  are contradictory.
> > > > > > -        */
> > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > -               return -EINVAL;
> > > > > > -
> > > > > >         le = kzalloc(sizeof(*le), GFP_KERNEL);
> > > > > >         if (!le)
> > > > > >                 return -ENOMEM;
> > > > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
> > > > > >         unsigned arg;
> > > > > >
> > > > > >         switch (mode) {
> > > > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > > >                 arg = 1;
> > > > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
> > > > > >         if (ret == 0)
> > > > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > > > >
> > > > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > > > > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > >
> > > > > From looking at the code: user-space can disable bias when setting
> > > > > both PULL_UP and PULL_DOWN flags. I don't understand why it's done in
> > > > > this implicit way? Why not a separate flag?
> > > >
> > > > An extra flag would waste a bit and add nothing but more sanity checking.
> > > >
> > >
> > > I disagree. The user API needs to be very explicit. Sanity checking is
> > > alright - if there'll be too many ifdefs, we can start thinking about
> > > adding some core library helpers for sanitizing conflicting flags, I'm
> > > sure other frameworks could use something like this as well.
> > >
> > > Especially in this context: setting PULL_UP and PULL_DOWN together
> > > disables bias - this doesn't make sense logically.
> > >
> > In a way it does make a weird kind of sense - they cancel.  Physically.
> >
> 
> Yes, on some devices we set both bits to disable bias, but on others
> the pull-up and pull-down bits need to be cleared and yet others have
> a dedicated bit for that. It's not standardized and the pinctrl
> framework defines all three values as separate bits to expose a common
> programming interface.
> 
Ok. And, since gpiolib has no knowledge of what combinations are
appropriate for a given chip, we can't provide a higher level
abstraction and have no option but to expose that pinconf
complexity in the GPIO uapi?

In fact, pinconf doesn't just define 3 bias bits - it defines 6:

enum pin_config_param {
	PIN_CONFIG_BIAS_BUS_HOLD,
	PIN_CONFIG_BIAS_DISABLE,
	PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
	PIN_CONFIG_BIAS_PULL_DOWN,
	PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
	PIN_CONFIG_BIAS_PULL_UP,

Do we need to support any of the remaining 3 in the GPIO uapi, either
now or possibly in the future?

And what about the other PIN_CONFIG flags?  Some of these might be
candidates for controlling via SET_CONFIG_IOCTL, if not in the request
itself? (again this is contemplating the future, not suggesting being part
of this patch)

> > Did you read the cover letter?  The problem, as I see it,
> > is that we're stuck using a flag field to encode a two bit enum.
> > That fact the we only have a flag field to play with can't be
> > changed due to ABI.
> 
> For some reason I haven't received the cover letter on my inbox. I'm
> only now seeing it on linux-gpio archives.
> 
And for some reason I didn't get 0001, yet all 7 parts made it to the mailing
list. Spam filters kicking in? Though it isn't in my spam folder either.
Something odd going on.

> Anyway: I don't understand why you insist on using two instead of
> three bits. You have 32 bits in total that can be used and only 5 are
> used so far. There's plenty left.
> 
Cos it makes no sense to me to encode 4 values into 3 bits when 2 will
do.  But if you want to expose part of the pinconf API within the GPIO
uapi then that goes out the window - it's not 4 values anymore.

And partly cos I'm frustrated that I'd asked questions regarding how the
API should look earlier and got no reply.  This is the sort of thing I
usually deal with in the design stage, not review.

I realise you guys are busy, but a little time spent clarifying design 
would save a whole lot more time in coding, testing and review.

> I'd prefer to see:
> 
> GPIOHANDLE_REQUEST_PULL_UP
> GPIOHANDLE_REQUEST_PULL_DOWN
> GPIOHANDLE_REQUEST_PULL_DISABLED
> 
> or maybe even
> 
> GPIOHANDLE_REQUEST_BIAS_PULL_UP
> GPIOHANDLE_REQUEST_BIAS_PULL_DOWN
> GPIOHANDLE_REQUEST_BIAS_DISABLED
> 
> to stay consistent with the pinctrl flags. No bit set among these
> three would mean AS_IS.
> 
That makes sense, if we are exposing the pinctrl API here.

Wrt the patch series, before I take another go at it, I'd like some 
guidance as to how you would like it structured.
Are you good, in principle, with the feature set in the existing patches?
What branch would you like it based on?
It will begin with Drew's patch, either his original or with your
additions.
Other than that I'm open to your suggestions on number, ordering,
content, comments etc.

Though if you change your mind later I'll probably be cranky.
Or should I say crankier.

Cheers,
Kent.
