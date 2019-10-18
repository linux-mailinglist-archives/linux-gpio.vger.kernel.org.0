Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 397CCDC190
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 11:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387904AbfJRJmd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 05:42:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43917 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388364AbfJRJmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2019 05:42:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id a2so3524652pfo.10
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2019 02:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wVAQN38S2mxf2WA/GRsP+qymjE+xrY2zr+B40I9NcBg=;
        b=l17zOk8N0zTjUrqBYoPQrMsQgmDtVBDyKHgYKLk9V98P530YydhtxF5Kb06MYAsTF/
         OVWfPkqK816VL4l6R1LEVo+xxXao0BZHOT33IrjFaNKbLT6c2GAAr/B2eKIdAE5kF6kB
         6UR0JG8YloVkwe35P1SNOSOFgPnsEh76V362qQuCZZg1kaIzEBQ4AASTsVjA7F9C96N1
         kYc1+KbgSBLjMD9rtiqSejZoHTex4EKyh0ZuKaCBoiUhfLooy5RXm2y7rDlwP9GrLQNx
         CA/HIdBWe5/2M9cP7E/fe/91YEVbXhLQuhEQhdda1s5n09nt8tq8+vvuzP2Iyy9tgo1c
         Cpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wVAQN38S2mxf2WA/GRsP+qymjE+xrY2zr+B40I9NcBg=;
        b=BmnWQVR2XaRHOGsPo64gal/P1ziBvHevlcFwpx6+AgarLNvPwSlOh0bzY6TLXSiQDL
         zZVdjlWJQoB//B8RfrjH4KPgvPbXdo7P5x10Rn5GGcN3yIsWGnV1UG6mil/5Hcj7omJi
         MJ+aI8i8y38BhTg//t7IlDTY985gAe5w+i2wRjlTtntJapR4AvCw26iKWkE8kmOLzDyh
         0KBQRL28g+N6CEQ512aC8812kDf3zY8y6Tv1cklkqWZHuh+TnA40g7tqt3d7+sVv9pop
         dLqFOPbDKH51XIcWFvwC+wDFHjHQWjXbviL5ftOLlFVrSso3HFdyTNf2hF/dohX7MXrz
         aaeA==
X-Gm-Message-State: APjAAAUqzuQzSgzcJ+vzmcSpWDzqZTM0HHXn1LSIgqI0SPmPYTib/8cW
        JIEuq8RbcLHIfs+i+EydUFI=
X-Google-Smtp-Source: APXvYqxUI0c3Tru5rtuMKdeUEPCpKEgiulhGOjTsTuqiOSNpV636pZgjeapTaR81WDtNbMktfz+n1w==
X-Received: by 2002:a63:d246:: with SMTP id t6mr2615120pgi.5.1571391750985;
        Fri, 18 Oct 2019 02:42:30 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v35sm7508955pgn.89.2019.10.18.02.42.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 02:42:30 -0700 (PDT)
Date:   Fri, 18 Oct 2019 17:42:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
Message-ID: <20191018094224.GA16347@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol>
 <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol>
 <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
 <20191016010104.GA8083@sol>
 <CAMRc=MeayWxeAYVXfnd58t+-saU-6U37a6dLYTCsfB9sFZD=2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeayWxeAYVXfnd58t+-saU-6U37a6dLYTCsfB9sFZD=2Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 18, 2019 at 09:48:09AM +0200, Bartosz Golaszewski wrote:
> śr., 16 paź 2019 o 03:01 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Tue, Oct 15, 2019 at 02:51:18PM +0200, Bartosz Golaszewski wrote:
> > > wt., 15 paź 2019 o 02:58 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski wrote:
> > > > > pon., 14 paź 2019 o 15:04 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wrote:
> > > > > > > sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > >
> > > > > > > > This patch allows pull up/down bias to be disabled, allowing
> > > > > > > > the line to float or to be biased only by external circuitry.
> > > > > > > > Use case is for where the bias has been applied previously,
> > > > > > > > either by default or by the user, but that setting may
> > > > > > > > conflict with the current use of the line.
> > > > > > > >
> > > > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > > > > > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > > > > index 647334f53622..f90b20d548b9 100644
> > > > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> > > > > > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > > > > > >                 return -EINVAL;
> > > > > > > >
> > > > > > > > -       /* Same with pull-up and pull-down. */
> > > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > > -               return -EINVAL;
> > > > > > > > -
> > > > > > > >         /*
> > > > > > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> > > > > > > >          * the hardware actually supports enabling both at the same time the
> > > > > > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> > > > > > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > > > > > >                 return -EINVAL;
> > > > > > > >
> > > > > > > > -       /*
> > > > > > > > -        * Do not allow both pull-up and pull-down flags to be set as they
> > > > > > > > -        *  are contradictory.
> > > > > > > > -        */
> > > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > > -               return -EINVAL;
> > > > > > > > -
> > > > > > > >         le = kzalloc(sizeof(*le), GFP_KERNEL);
> > > > > > > >         if (!le)
> > > > > > > >                 return -ENOMEM;
> > > > > > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
> > > > > > > >         unsigned arg;
> > > > > > > >
> > > > > > > >         switch (mode) {
> > > > > > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > > > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > > >                 arg = 1;
> > > > > > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
> > > > > > > >         if (ret == 0)
> > > > > > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > > > > > >
> > > > > > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > > > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > > > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > > > > > > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > > > > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > >
> > > > > > > From looking at the code: user-space can disable bias when setting
> > > > > > > both PULL_UP and PULL_DOWN flags. I don't understand why it's done in
> > > > > > > this implicit way? Why not a separate flag?
> > > > > >
> > > > > > An extra flag would waste a bit and add nothing but more sanity checking.
> > > > > >
> > > > >
> > > > > I disagree. The user API needs to be very explicit. Sanity checking is
> > > > > alright - if there'll be too many ifdefs, we can start thinking about
> > > > > adding some core library helpers for sanitizing conflicting flags, I'm
> > > > > sure other frameworks could use something like this as well.
> > > > >
> > > > > Especially in this context: setting PULL_UP and PULL_DOWN together
> > > > > disables bias - this doesn't make sense logically.
> > > > >
> > > > In a way it does make a weird kind of sense - they cancel.  Physically.
> > > >
> > >
> > > Yes, on some devices we set both bits to disable bias, but on others
> > > the pull-up and pull-down bits need to be cleared and yet others have
> > > a dedicated bit for that. It's not standardized and the pinctrl
> > > framework defines all three values as separate bits to expose a common
> > > programming interface.
> > >
> > Ok. And, since gpiolib has no knowledge of what combinations are
> > appropriate for a given chip, we can't provide a higher level
> > abstraction and have no option but to expose that pinconf
> > complexity in the GPIO uapi?
> >
> > In fact, pinconf doesn't just define 3 bias bits - it defines 6:
> >
> > enum pin_config_param {
> >         PIN_CONFIG_BIAS_BUS_HOLD,
> >         PIN_CONFIG_BIAS_DISABLE,
> >         PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
> >         PIN_CONFIG_BIAS_PULL_DOWN,
> >         PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
> >         PIN_CONFIG_BIAS_PULL_UP,
> >
> > Do we need to support any of the remaining 3 in the GPIO uapi, either
> > now or possibly in the future?
> >
> > And what about the other PIN_CONFIG flags?  Some of these might be
> > candidates for controlling via SET_CONFIG_IOCTL, if not in the request
> > itself? (again this is contemplating the future, not suggesting being part
> > of this patch)
> >
> 
> Is anyone asking for these though? Users have been asking for adding
> support for PULL-UP/DOWN and since it seems like a reasonable
> use-case, we're now open to adding it. IMO this is all we need for now
> (plus direction changes on taken lines but it's unrelated to this
> series IMO) but we should make sure that adding additional options in
> the future will be feasible should we need it. Having a hidden
> functionality of disabling bias when pull-up and pull-down bits are
> set quickly becomes obscure once you add more flags.
> 

The point of the question was whether there may be other bias modes we
want to support in the future. That would put another nail in the
coffin of encoding the 4 values we currently want to support, and give
more reason to mirror the pinctrl API.

> > > > Did you read the cover letter?  The problem, as I see it,
> > > > is that we're stuck using a flag field to encode a two bit enum.
> > > > That fact the we only have a flag field to play with can't be
> > > > changed due to ABI.
> > >
> > > For some reason I haven't received the cover letter on my inbox. I'm
> > > only now seeing it on linux-gpio archives.
> > >
> > And for some reason I didn't get 0001, yet all 7 parts made it to the mailing
> > list. Spam filters kicking in? Though it isn't in my spam folder either.
> > Something odd going on.
> >
> > > Anyway: I don't understand why you insist on using two instead of
> > > three bits. You have 32 bits in total that can be used and only 5 are
> > > used so far. There's plenty left.
> > >
> > Cos it makes no sense to me to encode 4 values into 3 bits when 2 will
> > do.  But if you want to expose part of the pinconf API within the GPIO
> > uapi then that goes out the window - it's not 4 values anymore.
> >
> 
> It does make perfect sense if you want to stay as explicit as possible
> on the border between the kernel and user-space. And no, I don't want
> to expose the pinctrl API - I just want to follow its example.
> 

I'm not sure I see the distinction.
I said part of the pinctrl API, and the flags you want to follow
explicitly are part of it.

But we agree on the end result so moving on...

> > And partly cos I'm frustrated that I'd asked questions regarding how the
> > API should look earlier and got no reply.  This is the sort of thing I
> > usually deal with in the design stage, not review.
> >
> 
> I don't really have good news here. This is what kernel development is
> like: it's easier for maintainers to discuss existing code than
> hypothetical design concepts. Just to give you an idea: it recently
> took me 11 iterations of patches and several significant changes to
> get a relatively simple and - what I assumed was a rather -
> non-controversial pmic driver merged upstream. This is simply how it
> usually works: after some initial high-level discussion, there's an
> expectation that a patch series will be posted which can then be
> discussed and worked upon until a consensus is reached.
> 

I understand that, but conversely there are times when the may be clear
preferences or even hard rules as to what is acceptable or unacceptable,
and it wouldn't be that hard for a maintainer to just say a word to stop
development on a branch which is sure to be dead.  I thought this was
one of those cases, rather than the case you cite.

But anyway, moving on...

> Also remember that an idea that sounds good in theory can turn out to
> be wrong once the code is ready and there often is no way of
> predicting it.
> 
> > I realise you guys are busy, but a little time spent clarifying design
> > would save a whole lot more time in coding, testing and review.
> >
> > > I'd prefer to see:
> > >
> > > GPIOHANDLE_REQUEST_PULL_UP
> > > GPIOHANDLE_REQUEST_PULL_DOWN
> > > GPIOHANDLE_REQUEST_PULL_DISABLED
> > >
> > > or maybe even
> > >
> > > GPIOHANDLE_REQUEST_BIAS_PULL_UP
> > > GPIOHANDLE_REQUEST_BIAS_PULL_DOWN
> > > GPIOHANDLE_REQUEST_BIAS_DISABLED
> > >
> > > to stay consistent with the pinctrl flags. No bit set among these
> > > three would mean AS_IS.
> > >
> > That makes sense, if we are exposing the pinctrl API here.
> >
> 
> But we're not - we're just following the example of the in-kernel
> pinctrl API, making it easy on user-space programs and making this
> future-proof in that adding new options will be painless.
> 

Again, I'm not sure I see the distinction, but I agree going with the
pinctrl flags (PULL_UP, PULL_DOWN and DISABLE) is the way to go.

> > Wrt the patch series, before I take another go at it, I'd like some
> > guidance as to how you would like it structured.
> > Are you good, in principle, with the feature set in the existing patches?
> 
> Yes, as I understand it: the patches should add support for
> pull-up/down on inputs, the ability to disable bias and then
> additional support for pull-up/downs on outputs. This sounds like a
> self-contained set of changes.
> 
> > What branch would you like it based on?
> 
> For now rebase it on top of my gpio/for-next branch[1].
> 
> > It will begin with Drew's patch, either his original or with your
> > additions.
> 
> I don't want a series in which some things are added by earlier
> patches only to be removed by subsequent ones - this is nonsensical.
> If you know you'll change some parts of Drew's patch later, then
> change it right away: leave only the parts that will make it to the
> end and that make logical sense as a single patch while keeping the
> code bisectable (for instance flags definitions etc.) to give Drew
> credit and build on top of that. Be creative and try to imagine what
> code you'd want to review.
> 

Ironically I think it is your additions that are later removed.
So I'll start with Drew's original patch and see how that goes.

> > Other than that I'm open to your suggestions on number, ordering,
> > content, comments etc.
> >
> 
> Patch 5 is wrong to me, I want an explicit DISABLE flag. Patch 4
> should be part of an earlier patch. I'm fine with separate patches for
> lineevent and linehandle as long as the kernel never breaks when
> applying them one-by-one. Adding support for outputs separately is
> fine too.
> 

I do try to ensure that the kernel is never broken by any of my patches.
I believe that is the case with the patches in this series.

Wrt Patch 5 - agreed - DISABLE will be a separate flag as per pinctrl.
And I'll squash 4 into 2.

Cheers,
Kent.
