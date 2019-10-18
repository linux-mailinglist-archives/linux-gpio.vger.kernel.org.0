Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD345DBF4C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 10:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbfJRIDb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 04:03:31 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:40306 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391356AbfJRIDa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2019 04:03:30 -0400
Received: by mail-il1-f196.google.com with SMTP id o16so4717781ilq.7
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2019 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8a2oyRpjYeQMbSL+9YVvbIzIWmAVui1iBcvsQ8Gqu28=;
        b=o4722TL8MUuPiC5SIg7kZdS76VmCH57Cf/6k+haKfofOsUP7FASegXzLYNEzvgAjr4
         5t6OA0iY5lnGelRqbXrO0NkYMNvyrxpf/JRui44/dAs9kkGLCEtuD3Ugqd5ADaMuudwx
         ZuWn5BtnbQEMPBqXxZKZxHnpVuI0D9+KLw7nlCcGwdrYvZ0JAT3271mvi42MQK82UQIU
         bXIVcm7JDZ8NtjOasIVDXmBRUbg9uQb02R+qy0ZNgG9kpKtmKUyuLYyHmdAi0Pomuuqf
         sJUrPaV7hbDVSBZRIEwAjoxjbxuBIp1fi0AG7duDuXANWB5Hni+ixDzmWLv5NB2OnvHM
         051A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8a2oyRpjYeQMbSL+9YVvbIzIWmAVui1iBcvsQ8Gqu28=;
        b=NEqQFddjrc6fhlwobZw94ofJh+TTluRhcbc2OacgOEr2imLSb+fxMdLUd5cZIHrzgT
         8ih50ndT8UmiLyvxmS2akdAF9KNV5s2SONeNIC1Yk8dzLyLaU2up551Pb1S+l07+SdC9
         g1Ymwdx3vvZUYpnlBAO/sa2bznzgXCsRZk59MTivv0SGddzZY50EJrseRbJ8H0LBQpSG
         Pf9TwkVNuAHdCIU2FEP9p+f0YWHtdkF4bGL60b2ZJAxJ+Jig+UjDpU2xRFX9qFIT1NK4
         XBUPiz6u0b+iNuvz09HZn9djh3h3q3WuHrcqO8LgvzRO2D2hd9I2nN5kk6ceWDOj5fQB
         1SDA==
X-Gm-Message-State: APjAAAUtuMJtgkLXYJ44OX/MywH0Nsj9dDZKEOK2LMy3/LVEjYnt+MVi
        JBfR82oWA63JIxlnFzh0TiVxWjIqKUBDEFqhP1p+ZA==
X-Google-Smtp-Source: APXvYqzGcM078kzYIGxsjs88v9HdgGbEU3lm1j/VZjiuEt+eHsx/QuAlgMw4LZM0aDGV+q2l+ySb13S+fplCaJDcAlY=
X-Received: by 2002:a92:5f4c:: with SMTP id t73mr8548623ilb.220.1571385808504;
 Fri, 18 Oct 2019 01:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol> <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol> <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
 <20191016010104.GA8083@sol> <20191017050647.GA21551@sol>
In-Reply-To: <20191017050647.GA21551@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Oct 2019 10:03:17 +0200
Message-ID: <CAMRc=Mdc4yVHP=LGgdujW8FbETadM1jFMeARBP-531Yoo-un-w@mail.gmail.com>
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

czw., 17 pa=C5=BA 2019 o 07:06 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Wed, Oct 16, 2019 at 09:01:04AM +0800, Kent Gibson wrote:
> > On Tue, Oct 15, 2019 at 02:51:18PM +0200, Bartosz Golaszewski wrote:
> > > wt., 15 pa=C5=BA 2019 o 02:58 Kent Gibson <warthog618@gmail.com> napi=
sa=C5=82(a):
> > > >
> > > > On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski wrote=
:
> > > > > pon., 14 pa=C5=BA 2019 o 15:04 Kent Gibson <warthog618@gmail.com>=
 napisa=C5=82(a):
> > > > > >
> > > > > > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski w=
rote:
> > > > > > > sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.=
com> napisa=C5=82(a):
> > > > > > > >
> > > > > > > > This patch allows pull up/down bias to be disabled, allowin=
g
> > > > > > > > the line to float or to be biased only by external circuitr=
y.
> > > > > > > > Use case is for where the bias has been applied previously,
> > > > > > > > either by default or by the user, but that setting may
> > > > > > > > conflict with the current use of the line.
> > > > > > > >
> > > > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > > > > > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.=
c
> > > > > > > > index 647334f53622..f90b20d548b9 100644
> > > > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gp=
io_device *gdev, void __user *ip)
> > > > > > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > > > > > >                 return -EINVAL;
> > > > > > > >
> > > > > > > > -       /* Same with pull-up and pull-down. */
> > > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > > -               return -EINVAL;
> > > > > > > > -
> > > > > > > >         /*
> > > > > > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a=
 single request. If
> > > > > > > >          * the hardware actually supports enabling both at =
the same time the
> > > > > > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpi=
o_device *gdev, void __user *ip)
> > > > > > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > > > > > >                 return -EINVAL;
> > > > > > > >
> > > > > > > > -       /*
> > > > > > > > -        * Do not allow both pull-up and pull-down flags to=
 be set as they
> > > > > > > > -        *  are contradictory.
> > > > > > > > -        */
> > > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > > -               return -EINVAL;
> > > > > > > > -
> > > > > > > >         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
> > > > > > > >         if (!le)
> > > > > > > >                 return -ENOMEM;
> > > > > > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpi=
o_chip *gc, unsigned offset,
> > > > > > > >         unsigned arg;
> > > > > > > >
> > > > > > > >         switch (mode) {
> > > > > > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > > > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > > >                 arg =3D 1;
> > > > > > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpi=
o_desc *desc)
> > > > > > > >         if (ret =3D=3D 0)
> > > > > > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > > > > > >
> > > > > > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > > > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > > > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc=
),
> > > > > > > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > > > > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > >
> > > > > > > From looking at the code: user-space can disable bias when se=
tting
> > > > > > > both PULL_UP and PULL_DOWN flags. I don't understand why it's=
 done in
> > > > > > > this implicit way? Why not a separate flag?
> > > > > >
> > > > > > An extra flag would waste a bit and add nothing but more sanity=
 checking.
> > > > > >
> > > > >
> > > > > I disagree. The user API needs to be very explicit. Sanity checki=
ng is
> > > > > alright - if there'll be too many ifdefs, we can start thinking a=
bout
> > > > > adding some core library helpers for sanitizing conflicting flags=
, I'm
> > > > > sure other frameworks could use something like this as well.
> > > > >
> > > > > Especially in this context: setting PULL_UP and PULL_DOWN togethe=
r
> > > > > disables bias - this doesn't make sense logically.
> > > > >
> > > > In a way it does make a weird kind of sense - they cancel.  Physica=
lly.
> > > >
> > >
> > > Yes, on some devices we set both bits to disable bias, but on others
> > > the pull-up and pull-down bits need to be cleared and yet others have
> > > a dedicated bit for that. It's not standardized and the pinctrl
> > > framework defines all three values as separate bits to expose a commo=
n
> > > programming interface.
> > >
>
> Is there any documentation on this?  The pinctrl docs stay pretty high
> level and doesn't touch on this. And from the pinconf-generic.h
> documentation, I'd consider drivers that require both pull-up and
> pull-down set to disable bias to be non-compliant with the API - for
> BIAS_DISABLE it says "this setting disables all biasing", so you'd think
> the driver would support that and do any mapping (setting both pulls
> high or low or whatever) internally.
>
> > Ok. And, since gpiolib has no knowledge of what combinations are
> > appropriate for a given chip, we can't provide a higher level
> > abstraction and have no option but to expose that pinconf
> > complexity in the GPIO uapi?
> >
> > In fact, pinconf doesn't just define 3 bias bits - it defines 6:
> >
> > enum pin_config_param {
> >       PIN_CONFIG_BIAS_BUS_HOLD,
> >       PIN_CONFIG_BIAS_DISABLE,
> >       PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
> >       PIN_CONFIG_BIAS_PULL_DOWN,
> >       PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
> >       PIN_CONFIG_BIAS_PULL_UP,
> >
> > Do we need to support any of the remaining 3 in the GPIO uapi, either
> > now or possibly in the future?
> >
> > And what about the other PIN_CONFIG flags?  Some of these might be
> > candidates for controlling via SET_CONFIG_IOCTL, if not in the request
> > itself? (again this is contemplating the future, not suggesting being p=
art
> > of this patch)
> >
> > > > Did you read the cover letter?  The problem, as I see it,
> > > > is that we're stuck using a flag field to encode a two bit enum.
> > > > That fact the we only have a flag field to play with can't be
> > > > changed due to ABI.
> > >
> > > For some reason I haven't received the cover letter on my inbox. I'm
> > > only now seeing it on linux-gpio archives.
> > >
> > And for some reason I didn't get 0001, yet all 7 parts made it to the m=
ailing
> > list. Spam filters kicking in? Though it isn't in my spam folder either=
.
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
> > And partly cos I'm frustrated that I'd asked questions regarding how th=
e
> > API should look earlier and got no reply.  This is the sort of thing I
> > usually deal with in the design stage, not review.
> >
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
> Looking at going with the naming including BIAS...
> What to do with constants defined in headers prior to this patch that
> don't include the BIAS?  e.g. FLAG_PULL_UP and FLAG_PULL_DOWN in gpiolib.=
h?

But this has nothing to do with user-space. This was added so that
GPIO expanders can use this without pulling in the pinctrl framework.

> Safe to assume they can't be renamed?

What for?

> So ok to stay with the unBIASed names for both old (cos they are there)
> and also the new (to be consistent with the old)?

There's no need for perfect naming consistency between user and kernel
space declarations. The difference is: you need to be sure to get the
user-space flags right the first time - unlike the kernel APIs, they
cannot be renamed later.

>
> Also, while the DT interface (gpiod_configure_flags) has GPIO_PULL_UP
> and GPIO_PULL_DOWN, it doesn't support DISABLE, and it explicitly rejects
> both having both PULL_UP and PULL_DOWN set.  Should we be extending the
> DISABLE support to the DT interface, and should the API behaviour also
> mirror the pinctrl behaviour you describe above?

Is someone needing it? Adding new features without users is frowned
upon for good reasons.

>
> And are there any combinations that are guaranteed to be invalid,
> and so should be rejected, like DISABLE + PULL_UP??  In fact are there
> any combinations that are valid other then PULL_UP + PULL_DOWN?

You mean invalid? You just said PULL_UP + PULL_DOWN is rejected.

Bart

>
> Cheers,
> Kent.
