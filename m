Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAF3DA4EF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 07:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390693AbfJQFG4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 01:06:56 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41236 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395034AbfJQFGz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 01:06:55 -0400
Received: by mail-pf1-f195.google.com with SMTP id q7so817218pfh.8
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 22:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Ysq3HNWFxHuaIU5hScRoWkkDMyN+lTeQJa8S35qTxZQ=;
        b=Sqvdm206uiDImWE+rO+oR7+vTgHm//7cZIfwOeLRz/pVRQe2yxrv/6D6humBgHkmzs
         Tm8QGyCj7yXvzxbgw/M23cuePK3SjID4Yauv+Lmgs567L34XfliXlj2RWg8L5FSQzbMZ
         NDgYBAEFOXdIkA6xP89IAEGfc4ndt9WuC3T9u5DJAOnTBLX3zPPpkaReZxMd+6/CVOvi
         zboJwDSLPZcIV2Re0npLHOEWMNp/+nR8AQs+Ugg6x5GTVAR/86U7y4307qQXJRE6x4X4
         YG7/QQ4oZ6igAj4eS8fR5SU5GG3t1J3XPM4HPOJ1SmQOPu9tl7sBVzgOvD2zo8hR1D8+
         RkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Ysq3HNWFxHuaIU5hScRoWkkDMyN+lTeQJa8S35qTxZQ=;
        b=ad8f13Kbt/Q9p4QefZ1MITS93ucSASRQdpa+kBvEgh3o5cOyRTddT5AR5JL2tCu4Lo
         PKslqRzK9WxTaonT0EXy/Nv3Zq6dWDiOcmssAxuqQKOkh4kHLj25BUpTa13w358CPAXG
         ZaifAcpA0dxFuFuXrOsvAwyHylFYkDJw2pixQ9o2v/TX2BBsw0GtFCzeL6o/LYDDFQ1r
         tQVWDoXyK1rzVeIWQ1WxbCOr60DaksfCBZUP7bt38pTP9ld7nyHqc9XeKuYWdbqMLQKF
         MAEhdDT+getmautEOxuT7s3Bcse6mbLMt0ImklFGVQzv5zucY2X6USlBhaUhMIu3wYJT
         8+zQ==
X-Gm-Message-State: APjAAAUXRnG14oIrUrk2yzJ4uAwEyJW8QLjyidGiDqpXGgaTlQ/Khh6X
        B2+BBY8q17yRnx3Yx2Z52b0=
X-Google-Smtp-Source: APXvYqw+7yxRwa7O0r94eB/X+NOj3cZ6Cfaqb8/NrF/dmkl7FC9LdBiAtowG4hT7WgXyO5nzxVEDpw==
X-Received: by 2002:a17:90a:bb0a:: with SMTP id u10mr2048828pjr.14.1571288813892;
        Wed, 16 Oct 2019 22:06:53 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id z20sm1137795pfj.156.2019.10.16.22.06.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 22:06:53 -0700 (PDT)
Date:   Thu, 17 Oct 2019 13:06:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
Message-ID: <20191017050647.GA21551@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol>
 <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol>
 <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
 <20191016010104.GA8083@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191016010104.GA8083@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 16, 2019 at 09:01:04AM +0800, Kent Gibson wrote:
> On Tue, Oct 15, 2019 at 02:51:18PM +0200, Bartosz Golaszewski wrote:
> > wt., 15 paź 2019 o 02:58 Kent Gibson <warthog618@gmail.com> napisał(a):
> > >
> > > On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski wrote:
> > > > pon., 14 paź 2019 o 15:04 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > >
> > > > > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wrote:
> > > > > > sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > >
> > > > > > > This patch allows pull up/down bias to be disabled, allowing
> > > > > > > the line to float or to be biased only by external circuitry.
> > > > > > > Use case is for where the bias has been applied previously,
> > > > > > > either by default or by the user, but that setting may
> > > > > > > conflict with the current use of the line.
> > > > > > >
> > > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > > > > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > > > index 647334f53622..f90b20d548b9 100644
> > > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> > > > > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > > > > >                 return -EINVAL;
> > > > > > >
> > > > > > > -       /* Same with pull-up and pull-down. */
> > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > -               return -EINVAL;
> > > > > > > -
> > > > > > >         /*
> > > > > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> > > > > > >          * the hardware actually supports enabling both at the same time the
> > > > > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> > > > > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > > > > >                 return -EINVAL;
> > > > > > >
> > > > > > > -       /*
> > > > > > > -        * Do not allow both pull-up and pull-down flags to be set as they
> > > > > > > -        *  are contradictory.
> > > > > > > -        */
> > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > -               return -EINVAL;
> > > > > > > -
> > > > > > >         le = kzalloc(sizeof(*le), GFP_KERNEL);
> > > > > > >         if (!le)
> > > > > > >                 return -ENOMEM;
> > > > > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
> > > > > > >         unsigned arg;
> > > > > > >
> > > > > > >         switch (mode) {
> > > > > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > >                 arg = 1;
> > > > > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
> > > > > > >         if (ret == 0)
> > > > > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > > > > >
> > > > > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > > > > > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > > > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > >
> > > > > > From looking at the code: user-space can disable bias when setting
> > > > > > both PULL_UP and PULL_DOWN flags. I don't understand why it's done in
> > > > > > this implicit way? Why not a separate flag?
> > > > >
> > > > > An extra flag would waste a bit and add nothing but more sanity checking.
> > > > >
> > > >
> > > > I disagree. The user API needs to be very explicit. Sanity checking is
> > > > alright - if there'll be too many ifdefs, we can start thinking about
> > > > adding some core library helpers for sanitizing conflicting flags, I'm
> > > > sure other frameworks could use something like this as well.
> > > >
> > > > Especially in this context: setting PULL_UP and PULL_DOWN together
> > > > disables bias - this doesn't make sense logically.
> > > >
> > > In a way it does make a weird kind of sense - they cancel.  Physically.
> > >
> > 
> > Yes, on some devices we set both bits to disable bias, but on others
> > the pull-up and pull-down bits need to be cleared and yet others have
> > a dedicated bit for that. It's not standardized and the pinctrl
> > framework defines all three values as separate bits to expose a common
> > programming interface.
> > 

Is there any documentation on this?  The pinctrl docs stay pretty high
level and doesn't touch on this. And from the pinconf-generic.h 
documentation, I'd consider drivers that require both pull-up and 
pull-down set to disable bias to be non-compliant with the API - for 
BIAS_DISABLE it says "this setting disables all biasing", so you'd think
the driver would support that and do any mapping (setting both pulls
high or low or whatever) internally.

> Ok. And, since gpiolib has no knowledge of what combinations are
> appropriate for a given chip, we can't provide a higher level
> abstraction and have no option but to expose that pinconf
> complexity in the GPIO uapi?
> 
> In fact, pinconf doesn't just define 3 bias bits - it defines 6:
> 
> enum pin_config_param {
> 	PIN_CONFIG_BIAS_BUS_HOLD,
> 	PIN_CONFIG_BIAS_DISABLE,
> 	PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
> 	PIN_CONFIG_BIAS_PULL_DOWN,
> 	PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
> 	PIN_CONFIG_BIAS_PULL_UP,
> 
> Do we need to support any of the remaining 3 in the GPIO uapi, either
> now or possibly in the future?
> 
> And what about the other PIN_CONFIG flags?  Some of these might be
> candidates for controlling via SET_CONFIG_IOCTL, if not in the request
> itself? (again this is contemplating the future, not suggesting being part
> of this patch)
> 
> > > Did you read the cover letter?  The problem, as I see it,
> > > is that we're stuck using a flag field to encode a two bit enum.
> > > That fact the we only have a flag field to play with can't be
> > > changed due to ABI.
> > 
> > For some reason I haven't received the cover letter on my inbox. I'm
> > only now seeing it on linux-gpio archives.
> > 
> And for some reason I didn't get 0001, yet all 7 parts made it to the mailing
> list. Spam filters kicking in? Though it isn't in my spam folder either.
> Something odd going on.
> 
> > Anyway: I don't understand why you insist on using two instead of
> > three bits. You have 32 bits in total that can be used and only 5 are
> > used so far. There's plenty left.
> > 
> Cos it makes no sense to me to encode 4 values into 3 bits when 2 will
> do.  But if you want to expose part of the pinconf API within the GPIO
> uapi then that goes out the window - it's not 4 values anymore.
> 
> And partly cos I'm frustrated that I'd asked questions regarding how the
> API should look earlier and got no reply.  This is the sort of thing I
> usually deal with in the design stage, not review.
> 
> I realise you guys are busy, but a little time spent clarifying design 
> would save a whole lot more time in coding, testing and review.
> 
> > I'd prefer to see:
> > 
> > GPIOHANDLE_REQUEST_PULL_UP
> > GPIOHANDLE_REQUEST_PULL_DOWN
> > GPIOHANDLE_REQUEST_PULL_DISABLED
> > 
> > or maybe even
> > 
> > GPIOHANDLE_REQUEST_BIAS_PULL_UP
> > GPIOHANDLE_REQUEST_BIAS_PULL_DOWN
> > GPIOHANDLE_REQUEST_BIAS_DISABLED
> > 
> > to stay consistent with the pinctrl flags. No bit set among these
> > three would mean AS_IS.
> > 
> That makes sense, if we are exposing the pinctrl API here.
> 

Looking at going with the naming including BIAS...
What to do with constants defined in headers prior to this patch that 
don't include the BIAS?  e.g. FLAG_PULL_UP and FLAG_PULL_DOWN in gpiolib.h?
Safe to assume they can't be renamed?
So ok to stay with the unBIASed names for both old (cos they are there)
and also the new (to be consistent with the old)?

Also, while the DT interface (gpiod_configure_flags) has GPIO_PULL_UP
and GPIO_PULL_DOWN, it doesn't support DISABLE, and it explicitly rejects
both having both PULL_UP and PULL_DOWN set.  Should we be extending the 
DISABLE support to the DT interface, and should the API behaviour also 
mirror the pinctrl behaviour you describe above?

And are there any combinations that are guaranteed to be invalid,
and so should be rejected, like DISABLE + PULL_UP??  In fact are there
any combinations that are valid other then PULL_UP + PULL_DOWN?

Cheers,
Kent.
