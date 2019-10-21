Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDAEDF09B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 16:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbfJUO5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 10:57:15 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:44749 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbfJUO5P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 10:57:15 -0400
Received: by mail-il1-f194.google.com with SMTP id f13so12259898ils.11
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1x4aFvRRmRDQRkkZygUeehbRn0OfQMIXOF74ObIM6mE=;
        b=YhMrGMZWjd29AOM7IoHfh7kXt4B+sQFHbt+iPggUJ1DyORsMSP3ZOAEj1/9s2WV2g6
         CsHTF9ksGLJIkmsyZLHSP5q1VtPO3+7pcdkvRbeahkn7EoYhfbOuKT8O43pWaxV6Sf4k
         ByHreKkwZT3MZ6IUX15wWllnVe6ALB8xHvNCdm/ce9CVgzju+GVAIXgyy3xM38iIpztq
         paGdu51a/oDmP8JzhOykJbULo5l1cBKP4qNB8RaE6/UmRi+7PI0XauSoDUCGYKcBsH+E
         IFVDe/TCEERf7utIdYoqnztnsloGJLEO7RiuTldQ9nO2TJWNFBUKto8iW8hA5Xa6X+MY
         QXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1x4aFvRRmRDQRkkZygUeehbRn0OfQMIXOF74ObIM6mE=;
        b=fX/2bvNmlX4Gw6ZZ5YOpcYwMZGO4782cbBzEKqx3ocSj+BgCd7pqHQ6hhHxHd9hDfA
         d5W8KbBTLtUI2MdqXY1U1dmpMP7s/aV1yQ6/NSIOEKeeuRmfxaDmGAfqN7ifvYXP7wEY
         kCCExUKBw7Qa1PFSSKDLhCF51UT0Kk5wyvr5V42FMKU9hPazzKafLVsusyFb8kL8T285
         6RJUBrcvgAE7/lNBuH/UuCXph/equyuZC73aQiLdOUaH3NvGcTqk3l+kwbki7BtgS+CV
         LvbSx/a3GaT4ytva1Fw3rbmuXwby+gyA192yTY0DFikVgX1Bo6lIpDdfxPMXc0D+vsOe
         tkaQ==
X-Gm-Message-State: APjAAAUizVEcEo8CX5C965brSNm377tN79v6cC5w1JDL/8w2E3pZm14+
        9OE9EIwuz9cP1bgdofiJ7QBbLZYEqGRGHOkbMKcmJg==
X-Google-Smtp-Source: APXvYqw6eTv4W4bJ79isPRN7pFLEKbPq19QU1eu9dKjA0jMCLLZk6nXChRi6Jp+1/T6Z18u3df5T8ZGgVvlst+0x2Fc=
X-Received: by 2002:a92:48cf:: with SMTP id j76mr6555230ilg.189.1571669832732;
 Mon, 21 Oct 2019 07:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol> <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol> <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
 <20191016010104.GA8083@sol> <20191017050647.GA21551@sol> <CAMRc=Mdc4yVHP=LGgdujW8FbETadM1jFMeARBP-531Yoo-un-w@mail.gmail.com>
 <20191018101306.GB16347@sol>
In-Reply-To: <20191018101306.GB16347@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Oct 2019 16:57:01 +0200
Message-ID: <CAMRc=Md8CH-YTcDGhF7ODZTLO0hvE47XhaHFsXEe4ebcM-28uQ@mail.gmail.com>
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

pt., 18 pa=C5=BA 2019 o 12:13 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Fri, Oct 18, 2019 at 10:03:17AM +0200, Bartosz Golaszewski wrote:
> > czw., 17 pa=C5=BA 2019 o 07:06 Kent Gibson <warthog618@gmail.com> napis=
a=C5=82(a):
> > >
> > > On Wed, Oct 16, 2019 at 09:01:04AM +0800, Kent Gibson wrote:
> > > > On Tue, Oct 15, 2019 at 02:51:18PM +0200, Bartosz Golaszewski wrote=
:
> > > > > wt., 15 pa=C5=BA 2019 o 02:58 Kent Gibson <warthog618@gmail.com> =
napisa=C5=82(a):
> > > > > >
> > > > > > On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski w=
rote:
> > > > > > > pon., 14 pa=C5=BA 2019 o 15:04 Kent Gibson <warthog618@gmail.=
com> napisa=C5=82(a):
> > > > > > > >
> > > > > > > > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszews=
ki wrote:
> > > > > > > > > sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gm=
ail.com> napisa=C5=82(a):
> > > > > > > > > >
> > > > > > > > > > This patch allows pull up/down bias to be disabled, all=
owing
> > > > > > > > > > the line to float or to be biased only by external circ=
uitry.
> > > > > > > > > > Use case is for where the bias has been applied previou=
sly,
> > > > > > > > > > either by default or by the user, but that setting may
> > > > > > > > > > conflict with the current use of the line.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > > > > > > > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpio=
lib.c
> > > > > > > > > > index 647334f53622..f90b20d548b9 100644
> > > > > > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > > > > > @@ -539,11 +539,6 @@ static int linehandle_create(struc=
t gpio_device *gdev, void __user *ip)
> > > > > > > > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > > > > > > > >                 return -EINVAL;
> > > > > > > > > >
> > > > > > > > > > -       /* Same with pull-up and pull-down. */
> > > > > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > > > > -               return -EINVAL;
> > > > > > > > > > -
> > > > > > > > > >         /*
> > > > > > > > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags =
in a single request. If
> > > > > > > > > >          * the hardware actually supports enabling both=
 at the same time the
> > > > > > > > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct=
 gpio_device *gdev, void __user *ip)
> > > > > > > > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > > > > > > > >                 return -EINVAL;
> > > > > > > > > >
> > > > > > > > > > -       /*
> > > > > > > > > > -        * Do not allow both pull-up and pull-down flag=
s to be set as they
> > > > > > > > > > -        *  are contradictory.
> > > > > > > > > > -        */
> > > > > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > > > > -               return -EINVAL;
> > > > > > > > > > -
> > > > > > > > > >         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
> > > > > > > > > >         if (!le)
> > > > > > > > > >                 return -ENOMEM;
> > > > > > > > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct=
 gpio_chip *gc, unsigned offset,
> > > > > > > > > >         unsigned arg;
> > > > > > > > > >
> > > > > > > > > >         switch (mode) {
> > > > > > > > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > > > > > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > > > > >                 arg =3D 1;
> > > > > > > > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct=
 gpio_desc *desc)
> > > > > > > > > >         if (ret =3D=3D 0)
> > > > > > > > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > > > > > > > >
> > > > > > > > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > > > > > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > > > > > > +               gpio_set_config(chip, gpio_chip_hwgpio(=
desc),
> > > > > > > > > > +                               PIN_CONFIG_BIAS_DISABLE=
);
> > > > > > > > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > > >
> > > > > > > > > From looking at the code: user-space can disable bias whe=
n setting
> > > > > > > > > both PULL_UP and PULL_DOWN flags. I don't understand why =
it's done in
> > > > > > > > > this implicit way? Why not a separate flag?
> > > > > > > >
> > > > > > > > An extra flag would waste a bit and add nothing but more sa=
nity checking.
> > > > > > > >
> > > > > > >
> > > > > > > I disagree. The user API needs to be very explicit. Sanity ch=
ecking is
> > > > > > > alright - if there'll be too many ifdefs, we can start thinki=
ng about
> > > > > > > adding some core library helpers for sanitizing conflicting f=
lags, I'm
> > > > > > > sure other frameworks could use something like this as well.
> > > > > > >
> > > > > > > Especially in this context: setting PULL_UP and PULL_DOWN tog=
ether
> > > > > > > disables bias - this doesn't make sense logically.
> > > > > > >
> > > > > > In a way it does make a weird kind of sense - they cancel.  Phy=
sically.
> > > > > >
> > > > >
> > > > > Yes, on some devices we set both bits to disable bias, but on oth=
ers
> > > > > the pull-up and pull-down bits need to be cleared and yet others =
have
> > > > > a dedicated bit for that. It's not standardized and the pinctrl
> > > > > framework defines all three values as separate bits to expose a c=
ommon
> > > > > programming interface.
> > > > >
> > >
> > > Is there any documentation on this?  The pinctrl docs stay pretty hig=
h
> > > level and doesn't touch on this. And from the pinconf-generic.h
> > > documentation, I'd consider drivers that require both pull-up and
> > > pull-down set to disable bias to be non-compliant with the API - for
> > > BIAS_DISABLE it says "this setting disables all biasing", so you'd th=
ink
> > > the driver would support that and do any mapping (setting both pulls
> > > high or low or whatever) internally.
> > >
>
> So no answer for this one?
>
> I find it unsettling that we will have a user space API that doesn't
> provide a definitive way to disable bias, independent of the underlying
> hardware.  I thought the kernel was all about hardware abstraction?
>

If you expose three options to user-space: PULL-UP, PULL-DOWN and
DISABLE and then that gets translated by the driver to whatever the
driver understands - how is this not abstraction?

> > > > Ok. And, since gpiolib has no knowledge of what combinations are
> > > > appropriate for a given chip, we can't provide a higher level
> > > > abstraction and have no option but to expose that pinconf
> > > > complexity in the GPIO uapi?
> > > >
> > > > In fact, pinconf doesn't just define 3 bias bits - it defines 6:
> > > >
> > > > enum pin_config_param {
> > > >       PIN_CONFIG_BIAS_BUS_HOLD,
> > > >       PIN_CONFIG_BIAS_DISABLE,
> > > >       PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
> > > >       PIN_CONFIG_BIAS_PULL_DOWN,
> > > >       PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
> > > >       PIN_CONFIG_BIAS_PULL_UP,
> > > >
> > > > Do we need to support any of the remaining 3 in the GPIO uapi, eith=
er
> > > > now or possibly in the future?
> > > >
> > > > And what about the other PIN_CONFIG flags?  Some of these might be
> > > > candidates for controlling via SET_CONFIG_IOCTL, if not in the requ=
est
> > > > itself? (again this is contemplating the future, not suggesting bei=
ng part
> > > > of this patch)
> > > >
> > > > > > Did you read the cover letter?  The problem, as I see it,
> > > > > > is that we're stuck using a flag field to encode a two bit enum=
.
> > > > > > That fact the we only have a flag field to play with can't be
> > > > > > changed due to ABI.
> > > > >
> > > > > For some reason I haven't received the cover letter on my inbox. =
I'm
> > > > > only now seeing it on linux-gpio archives.
> > > > >
> > > > And for some reason I didn't get 0001, yet all 7 parts made it to t=
he mailing
> > > > list. Spam filters kicking in? Though it isn't in my spam folder ei=
ther.
> > > > Something odd going on.
> > > >
> > > > > Anyway: I don't understand why you insist on using two instead of
> > > > > three bits. You have 32 bits in total that can be used and only 5=
 are
> > > > > used so far. There's plenty left.
> > > > >
> > > > Cos it makes no sense to me to encode 4 values into 3 bits when 2 w=
ill
> > > > do.  But if you want to expose part of the pinconf API within the G=
PIO
> > > > uapi then that goes out the window - it's not 4 values anymore.
> > > >
> > > > And partly cos I'm frustrated that I'd asked questions regarding ho=
w the
> > > > API should look earlier and got no reply.  This is the sort of thin=
g I
> > > > usually deal with in the design stage, not review.
> > > >
> > > > I realise you guys are busy, but a little time spent clarifying des=
ign
> > > > would save a whole lot more time in coding, testing and review.
> > > >
> > > > > I'd prefer to see:
> > > > >
> > > > > GPIOHANDLE_REQUEST_PULL_UP
> > > > > GPIOHANDLE_REQUEST_PULL_DOWN
> > > > > GPIOHANDLE_REQUEST_PULL_DISABLED
> > > > >
> > > > > or maybe even
> > > > >
> > > > > GPIOHANDLE_REQUEST_BIAS_PULL_UP
> > > > > GPIOHANDLE_REQUEST_BIAS_PULL_DOWN
> > > > > GPIOHANDLE_REQUEST_BIAS_DISABLED
> > > > >
> > > > > to stay consistent with the pinctrl flags. No bit set among these
> > > > > three would mean AS_IS.
> > > > >
> > > > That makes sense, if we are exposing the pinctrl API here.
> > > >
> > >
> > > Looking at going with the naming including BIAS...
> > > What to do with constants defined in headers prior to this patch that
> > > don't include the BIAS?  e.g. FLAG_PULL_UP and FLAG_PULL_DOWN in gpio=
lib.h?
> >
> > But this has nothing to do with user-space. This was added so that
> > GPIO expanders can use this without pulling in the pinctrl framework.
> >
> > > Safe to assume they can't be renamed?
> >
> > What for?
> >
>
> For consistency and clarity.  I need to add a flag into the gpio_desc
> flags, which are usedf throughout gpiolib.c and aredefined in gpiolib.h,
> and those FLAG_PULL_UP and FLAG_PULL_DOWN are already there.
>
> To be consistent I'd be dropping the GPIOHANDLE_REQUEST_BIAS_ from your
> preferred names when determining the name for the new flag, but then it
> would be called FLAG_DISABLE, which is obviously too vague.
>
> I intend to use FLAG_BIAS_DISABLE, and for consistency it would be nice
> to rename FLAG_PULL_UP to FLAG_BIAS_PULL_UP, and similarly PULL_DOWN,
> but that may break things and so be unacceptable, right?
>

Yeah, not for device tree, no. It sounds fine for core gpiolib but I
wouldn't change it in this series though personally - let's try to
limit its scope and we can come back to it later.

> > > So ok to stay with the unBIASed names for both old (cos they are ther=
e)
> > > and also the new (to be consistent with the old)?
> >
> > There's no need for perfect naming consistency between user and kernel
> > space declarations. The difference is: you need to be sure to get the
> > user-space flags right the first time - unlike the kernel APIs, they
> > cannot be renamed later.
> >
>
> So it may be acceptable to change the gpiolib.h flag names?
>

As I said above - yes, but I'd wait until this series is at least in
Linus' or my for-next branch.

> This is one of those cases where I'd rather ask than guess and not find
> out until the patch gets rejected.
>
> > >
> > > Also, while the DT interface (gpiod_configure_flags) has GPIO_PULL_UP
> > > and GPIO_PULL_DOWN, it doesn't support DISABLE, and it explicitly rej=
ects
> > > both having both PULL_UP and PULL_DOWN set.  Should we be extending t=
he
> > > DISABLE support to the DT interface, and should the API behaviour als=
o
> > > mirror the pinctrl behaviour you describe above?
> >
> > Is someone needing it? Adding new features without users is frowned
> > upon for good reasons.
> >
>
> Not that I am aware of, so we can always add it later.
> And that is why I asked - my first instinct is to keep the APIs
> aligned, especially where we now have the user space API containing
> functionality not available to DT, but I am also aware that might be
> considered unimportant or even unacceptable.
>

In general: we're adding new interfaces when someone needs them, not
"just in case" someone needs them in the future.

> > >
> > > And are there any combinations that are guaranteed to be invalid,
> > > and so should be rejected, like DISABLE + PULL_UP??  In fact are ther=
e
> > > any combinations that are valid other then PULL_UP + PULL_DOWN?
> >
> > You mean invalid? You just said PULL_UP + PULL_DOWN is rejected.
> >
>
> No, I my example was  DISABLE + PULL_UP, which I assume is an invalid com=
bo.
> And then on reflection the only valid combo I could think of was
> PULL_UP + PULL_DOWN, and even then only because you said we need it to
> disable bias on some chips.

I think there's some misunderstanding. I said that on some chips there
are bits in control registers that are used to control the bias and
sometimes it's three (pull-up, pull-down and disable) and sometimes
it's two (pull-up, pull-down and both set =3D disabled) but that we
should only have a single interface in user-space where the
BIAS_DISABLE bit would be translated to whatever the hardware
understands by the driver. So in this case: only one of the bits could
be set.

I understand that this sounds like a task for an enum, but introducing
an enum in a separate field would modify the ABI while simply adding
new mutually-exclusive flags would not. Not to mention that encoding
this enum on two bits of a field that's normally used for flags and is
even called "flags" would introduce a lot of confusion.

I got your new patches - I'll take a look at them shortly.

Bart

>
> Cheers,
> Kent.
