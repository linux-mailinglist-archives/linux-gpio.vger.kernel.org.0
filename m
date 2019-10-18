Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B390DC242
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 12:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404911AbfJRKNP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 06:13:15 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39091 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387545AbfJRKNP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2019 06:13:15 -0400
Received: by mail-pl1-f195.google.com with SMTP id s17so2617171plp.6
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2019 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QlhfI+Bfw5l4wZmWe28WVPXdyHkqJymjFZ0CaK0sYYM=;
        b=Nf5LpAQoRrxGTnQHaVkVS90OJUvznctOsvdChVjzswI3fMtJW6e3UerdMyCIfclbhE
         GnFDIi+inv+yUi+peRBt2O5O9OLN21ZZod5GehFGbe6hWeR4Yxhexm9N8Ql1plJq/iWu
         T4SEyH/xZ/JoXTaV7aGknS8YXymvv9c//6xdwBCHvwl9oCLHXsh1VQZJK8eYzlLDDutw
         1CAKnD7NhNCRxSlonFRF73PAIgYGBorrrO4OfzAnoGDcW7IqTOBBbP/T8SNtUNt+W7HO
         3kKxIjf8+Dbu5xnvME0nwJkxgPalmNi0FWlNthxx2EtCZMzKbjFnetrQtgywd8YxZCHD
         Poag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QlhfI+Bfw5l4wZmWe28WVPXdyHkqJymjFZ0CaK0sYYM=;
        b=EXBNHpdYTSTrg3r7oQyOEQJ4/OxszrIref3UHVadPVF3CHX+cgUwLtpZ/HiXVWNTaf
         ITxLh6gx355/e3EWf6JKNoqU1nlA0iBrAL+EARzM0tGNxeNeAQ8w/ZLPMFTzYpCLxoTU
         oAYZGe94ughPe3/iuVOB8ES/3tUKWkZHjrvG2sfmoPdE5idYidwk+RufsDEy5oXuXnyL
         7TI2tJKB7cu5IvnyreeWQTfzKjCUbjLtSizydmaTQv3w3VPrnKT3CEWwSY+Vk6f/9kvD
         y6RPIJLTUFFR+DfgoXSUVK3k4lzDMCdY1cEvxC0eS9eoB7ghjtg8I/x8OHqW2Z95LgIy
         BLyA==
X-Gm-Message-State: APjAAAVxUhrLPEFsp18O2CUo1C2dQ1ivw97alP44806QWI4aVZNi7x5Z
        962riw9WVcZRvpWhdNmqHYA=
X-Google-Smtp-Source: APXvYqwsKvfk5ZwOqbTPaBW53efpf6bdzG+Mewj7M6UqKK4K2X3ApR2T+EEajCZPbHvb8hgslfwkqA==
X-Received: by 2002:a17:902:bcc8:: with SMTP id o8mr9104294pls.256.1571393592480;
        Fri, 18 Oct 2019 03:13:12 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id a17sm5906053pfi.178.2019.10.18.03.13.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 03:13:11 -0700 (PDT)
Date:   Fri, 18 Oct 2019 18:13:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
Message-ID: <20191018101306.GB16347@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol>
 <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol>
 <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
 <20191016010104.GA8083@sol>
 <20191017050647.GA21551@sol>
 <CAMRc=Mdc4yVHP=LGgdujW8FbETadM1jFMeARBP-531Yoo-un-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdc4yVHP=LGgdujW8FbETadM1jFMeARBP-531Yoo-un-w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 18, 2019 at 10:03:17AM +0200, Bartosz Golaszewski wrote:
> czw., 17 paź 2019 o 07:06 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Oct 16, 2019 at 09:01:04AM +0800, Kent Gibson wrote:
> > > On Tue, Oct 15, 2019 at 02:51:18PM +0200, Bartosz Golaszewski wrote:
> > > > wt., 15 paź 2019 o 02:58 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > >
> > > > > On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski wrote:
> > > > > > pon., 14 paź 2019 o 15:04 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > >
> > > > > > > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wrote:
> > > > > > > > sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > >
> > > > > > > > > This patch allows pull up/down bias to be disabled, allowing
> > > > > > > > > the line to float or to be biased only by external circuitry.
> > > > > > > > > Use case is for where the bias has been applied previously,
> > > > > > > > > either by default or by the user, but that setting may
> > > > > > > > > conflict with the current use of the line.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > > > > > > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > > > > > index 647334f53622..f90b20d548b9 100644
> > > > > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > > > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> > > > > > > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > > > > > > >                 return -EINVAL;
> > > > > > > > >
> > > > > > > > > -       /* Same with pull-up and pull-down. */
> > > > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > > > -               return -EINVAL;
> > > > > > > > > -
> > > > > > > > >         /*
> > > > > > > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> > > > > > > > >          * the hardware actually supports enabling both at the same time the
> > > > > > > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> > > > > > > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > > > > > > >                 return -EINVAL;
> > > > > > > > >
> > > > > > > > > -       /*
> > > > > > > > > -        * Do not allow both pull-up and pull-down flags to be set as they
> > > > > > > > > -        *  are contradictory.
> > > > > > > > > -        */
> > > > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > > > -               return -EINVAL;
> > > > > > > > > -
> > > > > > > > >         le = kzalloc(sizeof(*le), GFP_KERNEL);
> > > > > > > > >         if (!le)
> > > > > > > > >                 return -ENOMEM;
> > > > > > > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
> > > > > > > > >         unsigned arg;
> > > > > > > > >
> > > > > > > > >         switch (mode) {
> > > > > > > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > > > > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > > > >                 arg = 1;
> > > > > > > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
> > > > > > > > >         if (ret == 0)
> > > > > > > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > > > > > > >
> > > > > > > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > > > > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > > > > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > > > > > > > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > > > > > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > >
> > > > > > > > From looking at the code: user-space can disable bias when setting
> > > > > > > > both PULL_UP and PULL_DOWN flags. I don't understand why it's done in
> > > > > > > > this implicit way? Why not a separate flag?
> > > > > > >
> > > > > > > An extra flag would waste a bit and add nothing but more sanity checking.
> > > > > > >
> > > > > >
> > > > > > I disagree. The user API needs to be very explicit. Sanity checking is
> > > > > > alright - if there'll be too many ifdefs, we can start thinking about
> > > > > > adding some core library helpers for sanitizing conflicting flags, I'm
> > > > > > sure other frameworks could use something like this as well.
> > > > > >
> > > > > > Especially in this context: setting PULL_UP and PULL_DOWN together
> > > > > > disables bias - this doesn't make sense logically.
> > > > > >
> > > > > In a way it does make a weird kind of sense - they cancel.  Physically.
> > > > >
> > > >
> > > > Yes, on some devices we set both bits to disable bias, but on others
> > > > the pull-up and pull-down bits need to be cleared and yet others have
> > > > a dedicated bit for that. It's not standardized and the pinctrl
> > > > framework defines all three values as separate bits to expose a common
> > > > programming interface.
> > > >
> >
> > Is there any documentation on this?  The pinctrl docs stay pretty high
> > level and doesn't touch on this. And from the pinconf-generic.h
> > documentation, I'd consider drivers that require both pull-up and
> > pull-down set to disable bias to be non-compliant with the API - for
> > BIAS_DISABLE it says "this setting disables all biasing", so you'd think
> > the driver would support that and do any mapping (setting both pulls
> > high or low or whatever) internally.
> >

So no answer for this one?

I find it unsettling that we will have a user space API that doesn't 
provide a definitive way to disable bias, independent of the underlying 
hardware.  I thought the kernel was all about hardware abstraction?

> > > Ok. And, since gpiolib has no knowledge of what combinations are
> > > appropriate for a given chip, we can't provide a higher level
> > > abstraction and have no option but to expose that pinconf
> > > complexity in the GPIO uapi?
> > >
> > > In fact, pinconf doesn't just define 3 bias bits - it defines 6:
> > >
> > > enum pin_config_param {
> > >       PIN_CONFIG_BIAS_BUS_HOLD,
> > >       PIN_CONFIG_BIAS_DISABLE,
> > >       PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
> > >       PIN_CONFIG_BIAS_PULL_DOWN,
> > >       PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
> > >       PIN_CONFIG_BIAS_PULL_UP,
> > >
> > > Do we need to support any of the remaining 3 in the GPIO uapi, either
> > > now or possibly in the future?
> > >
> > > And what about the other PIN_CONFIG flags?  Some of these might be
> > > candidates for controlling via SET_CONFIG_IOCTL, if not in the request
> > > itself? (again this is contemplating the future, not suggesting being part
> > > of this patch)
> > >
> > > > > Did you read the cover letter?  The problem, as I see it,
> > > > > is that we're stuck using a flag field to encode a two bit enum.
> > > > > That fact the we only have a flag field to play with can't be
> > > > > changed due to ABI.
> > > >
> > > > For some reason I haven't received the cover letter on my inbox. I'm
> > > > only now seeing it on linux-gpio archives.
> > > >
> > > And for some reason I didn't get 0001, yet all 7 parts made it to the mailing
> > > list. Spam filters kicking in? Though it isn't in my spam folder either.
> > > Something odd going on.
> > >
> > > > Anyway: I don't understand why you insist on using two instead of
> > > > three bits. You have 32 bits in total that can be used and only 5 are
> > > > used so far. There's plenty left.
> > > >
> > > Cos it makes no sense to me to encode 4 values into 3 bits when 2 will
> > > do.  But if you want to expose part of the pinconf API within the GPIO
> > > uapi then that goes out the window - it's not 4 values anymore.
> > >
> > > And partly cos I'm frustrated that I'd asked questions regarding how the
> > > API should look earlier and got no reply.  This is the sort of thing I
> > > usually deal with in the design stage, not review.
> > >
> > > I realise you guys are busy, but a little time spent clarifying design
> > > would save a whole lot more time in coding, testing and review.
> > >
> > > > I'd prefer to see:
> > > >
> > > > GPIOHANDLE_REQUEST_PULL_UP
> > > > GPIOHANDLE_REQUEST_PULL_DOWN
> > > > GPIOHANDLE_REQUEST_PULL_DISABLED
> > > >
> > > > or maybe even
> > > >
> > > > GPIOHANDLE_REQUEST_BIAS_PULL_UP
> > > > GPIOHANDLE_REQUEST_BIAS_PULL_DOWN
> > > > GPIOHANDLE_REQUEST_BIAS_DISABLED
> > > >
> > > > to stay consistent with the pinctrl flags. No bit set among these
> > > > three would mean AS_IS.
> > > >
> > > That makes sense, if we are exposing the pinctrl API here.
> > >
> >
> > Looking at going with the naming including BIAS...
> > What to do with constants defined in headers prior to this patch that
> > don't include the BIAS?  e.g. FLAG_PULL_UP and FLAG_PULL_DOWN in gpiolib.h?
> 
> But this has nothing to do with user-space. This was added so that
> GPIO expanders can use this without pulling in the pinctrl framework.
> 
> > Safe to assume they can't be renamed?
> 
> What for?
> 

For consistency and clarity.  I need to add a flag into the gpio_desc
flags, which are usedf throughout gpiolib.c and aredefined in gpiolib.h,
and those FLAG_PULL_UP and FLAG_PULL_DOWN are already there.

To be consistent I'd be dropping the GPIOHANDLE_REQUEST_BIAS_ from your
preferred names when determining the name for the new flag, but then it
would be called FLAG_DISABLE, which is obviously too vague.

I intend to use FLAG_BIAS_DISABLE, and for consistency it would be nice
to rename FLAG_PULL_UP to FLAG_BIAS_PULL_UP, and similarly PULL_DOWN, 
but that may break things and so be unacceptable, right?

> > So ok to stay with the unBIASed names for both old (cos they are there)
> > and also the new (to be consistent with the old)?
> 
> There's no need for perfect naming consistency between user and kernel
> space declarations. The difference is: you need to be sure to get the
> user-space flags right the first time - unlike the kernel APIs, they
> cannot be renamed later.
> 

So it may be acceptable to change the gpiolib.h flag names?

This is one of those cases where I'd rather ask than guess and not find
out until the patch gets rejected.

> >
> > Also, while the DT interface (gpiod_configure_flags) has GPIO_PULL_UP
> > and GPIO_PULL_DOWN, it doesn't support DISABLE, and it explicitly rejects
> > both having both PULL_UP and PULL_DOWN set.  Should we be extending the
> > DISABLE support to the DT interface, and should the API behaviour also
> > mirror the pinctrl behaviour you describe above?
> 
> Is someone needing it? Adding new features without users is frowned
> upon for good reasons.
> 

Not that I am aware of, so we can always add it later.
And that is why I asked - my first instinct is to keep the APIs
aligned, especially where we now have the user space API containing
functionality not available to DT, but I am also aware that might be
considered unimportant or even unacceptable.

> >
> > And are there any combinations that are guaranteed to be invalid,
> > and so should be rejected, like DISABLE + PULL_UP??  In fact are there
> > any combinations that are valid other then PULL_UP + PULL_DOWN?
> 
> You mean invalid? You just said PULL_UP + PULL_DOWN is rejected.
> 

No, I my example was  DISABLE + PULL_UP, which I assume is an invalid combo.
And then on reflection the only valid combo I could think of was
PULL_UP + PULL_DOWN, and even then only because you said we need it to
disable bias on some chips.

Cheers,
Kent.
