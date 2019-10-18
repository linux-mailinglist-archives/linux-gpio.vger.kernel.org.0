Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46D3DBEB3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 09:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfJRHsW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 03:48:22 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:37149 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504686AbfJRHsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2019 03:48:21 -0400
Received: by mail-il1-f194.google.com with SMTP id l12so4685654ilq.4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2019 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HnlZwDlyTUyYtr/MYazpVJ73IBFoqVdMnfnAAfXLYa4=;
        b=WyHgiflAiOa3TvDcPNao2KAe7fTzKpHkI7VtP5fSU/XlBfIWKRhUMXuD5VFZ3pNEDr
         s+gGRqdCbWzyOq2OlJOB5fLys92C5pkAZnxjgfZb8cYCwhtVxrATY1YrrSqCZq2PYYei
         Nuxh4Baas5U+UEfUFuCUk4zzIhl3qIpjQ82VUzeYJUIeISUwiZDkDV5Vf+WBTMs7DJHZ
         iz1aqQ6ruqtgmU7IduYo1ZUFh9ONDbL2+6P7CILnOC9u+g+vZnXlQjvT25l5E0vOxQQL
         tKAcjQHv9nI6kYoBPZumoUvwOjHZJayPojpXxC1KwV18TP2HKijoVHOQZiOoPnR90s9y
         o/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HnlZwDlyTUyYtr/MYazpVJ73IBFoqVdMnfnAAfXLYa4=;
        b=cAzsvNOcITbDEH87RBkwxMCrWjTg7jpFynrc39Gy80V276UtFIfNzCEGJ///m2PKN+
         kygscSh1GWrsjzIzP0ylB6YMkAvpir+1d2+MCwTQf6VJ1IdLfvq/4ZFriMVSa+1emcsG
         719ZCl53Bx7sN/3DE1LVbukOTyxcY3r51FRSUXYyV70dmaQcg3MKIDmnIAD2adpmbmkm
         t410a8NeMyeb8z5oF35oze96udPRGi/T59W9roRqwg73tgX6VTgBTFiEbyvkMyrB9jOo
         KCXeN08jJPH5a84ePicgiS1dAq4l3IFK1iGYiG5B21kKc1j3vvEbOsl+KZmQbnlxdEGV
         LprA==
X-Gm-Message-State: APjAAAWG0fEnw5XOY+qSB1JPWU8NRlgtOrbudpjbI41JX2Qb1IdMmeJ0
        PND038wtxQdXFz6Wau3ITF8pRsw+ZMUqzsAstnM3LQ==
X-Google-Smtp-Source: APXvYqwbX4EVrgPsjkd0FRuXslhs3tfVzdYdETxrI1yggTeg2lHShULLENsSpBlMzNSXqouOqU6yfmfEgaPSduVmnu8=
X-Received: by 2002:a92:88cf:: with SMTP id m76mr8847910ilh.40.1571384900163;
 Fri, 18 Oct 2019 00:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol> <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol> <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
 <20191016010104.GA8083@sol>
In-Reply-To: <20191016010104.GA8083@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Oct 2019 09:48:09 +0200
Message-ID: <CAMRc=MeayWxeAYVXfnd58t+-saU-6U37a6dLYTCsfB9sFZD=2Q@mail.gmail.com>
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

=C5=9Br., 16 pa=C5=BA 2019 o 03:01 Kent Gibson <warthog618@gmail.com> napis=
a=C5=82(a):
>
> On Tue, Oct 15, 2019 at 02:51:18PM +0200, Bartosz Golaszewski wrote:
> > wt., 15 pa=C5=BA 2019 o 02:58 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski wrote:
> > > > pon., 14 pa=C5=BA 2019 o 15:04 Kent Gibson <warthog618@gmail.com> n=
apisa=C5=82(a):
> > > > >
> > > > > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wro=
te:
> > > > > > sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.co=
m> napisa=C5=82(a):
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
> > > > > > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio=
_device *gdev, void __user *ip)
> > > > > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > > > > >                 return -EINVAL;
> > > > > > >
> > > > > > > -       /* Same with pull-up and pull-down. */
> > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > -               return -EINVAL;
> > > > > > > -
> > > > > > >         /*
> > > > > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a s=
ingle request. If
> > > > > > >          * the hardware actually supports enabling both at th=
e same time the
> > > > > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_=
device *gdev, void __user *ip)
> > > > > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > > > > >                 return -EINVAL;
> > > > > > >
> > > > > > > -       /*
> > > > > > > -        * Do not allow both pull-up and pull-down flags to b=
e set as they
> > > > > > > -        *  are contradictory.
> > > > > > > -        */
> > > > > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > > > > -               return -EINVAL;
> > > > > > > -
> > > > > > >         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
> > > > > > >         if (!le)
> > > > > > >                 return -ENOMEM;
> > > > > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_=
chip *gc, unsigned offset,
> > > > > > >         unsigned arg;
> > > > > > >
> > > > > > >         switch (mode) {
> > > > > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > >                 arg =3D 1;
> > > > > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_=
desc *desc)
> > > > > > >         if (ret =3D=3D 0)
> > > > > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > > > > >
> > > > > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > > > > > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > > > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > >
> > > > > > From looking at the code: user-space can disable bias when sett=
ing
> > > > > > both PULL_UP and PULL_DOWN flags. I don't understand why it's d=
one in
> > > > > > this implicit way? Why not a separate flag?
> > > > >
> > > > > An extra flag would waste a bit and add nothing but more sanity c=
hecking.
> > > > >
> > > >
> > > > I disagree. The user API needs to be very explicit. Sanity checking=
 is
> > > > alright - if there'll be too many ifdefs, we can start thinking abo=
ut
> > > > adding some core library helpers for sanitizing conflicting flags, =
I'm
> > > > sure other frameworks could use something like this as well.
> > > >
> > > > Especially in this context: setting PULL_UP and PULL_DOWN together
> > > > disables bias - this doesn't make sense logically.
> > > >
> > > In a way it does make a weird kind of sense - they cancel.  Physicall=
y.
> > >
> >
> > Yes, on some devices we set both bits to disable bias, but on others
> > the pull-up and pull-down bits need to be cleared and yet others have
> > a dedicated bit for that. It's not standardized and the pinctrl
> > framework defines all three values as separate bits to expose a common
> > programming interface.
> >
> Ok. And, since gpiolib has no knowledge of what combinations are
> appropriate for a given chip, we can't provide a higher level
> abstraction and have no option but to expose that pinconf
> complexity in the GPIO uapi?
>
> In fact, pinconf doesn't just define 3 bias bits - it defines 6:
>
> enum pin_config_param {
>         PIN_CONFIG_BIAS_BUS_HOLD,
>         PIN_CONFIG_BIAS_DISABLE,
>         PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
>         PIN_CONFIG_BIAS_PULL_DOWN,
>         PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
>         PIN_CONFIG_BIAS_PULL_UP,
>
> Do we need to support any of the remaining 3 in the GPIO uapi, either
> now or possibly in the future?
>
> And what about the other PIN_CONFIG flags?  Some of these might be
> candidates for controlling via SET_CONFIG_IOCTL, if not in the request
> itself? (again this is contemplating the future, not suggesting being par=
t
> of this patch)
>

Is anyone asking for these though? Users have been asking for adding
support for PULL-UP/DOWN and since it seems like a reasonable
use-case, we're now open to adding it. IMO this is all we need for now
(plus direction changes on taken lines but it's unrelated to this
series IMO) but we should make sure that adding additional options in
the future will be feasible should we need it. Having a hidden
functionality of disabling bias when pull-up and pull-down bits are
set quickly becomes obscure once you add more flags.

> > > Did you read the cover letter?  The problem, as I see it,
> > > is that we're stuck using a flag field to encode a two bit enum.
> > > That fact the we only have a flag field to play with can't be
> > > changed due to ABI.
> >
> > For some reason I haven't received the cover letter on my inbox. I'm
> > only now seeing it on linux-gpio archives.
> >
> And for some reason I didn't get 0001, yet all 7 parts made it to the mai=
ling
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

It does make perfect sense if you want to stay as explicit as possible
on the border between the kernel and user-space. And no, I don't want
to expose the pinctrl API - I just want to follow its example.

> And partly cos I'm frustrated that I'd asked questions regarding how the
> API should look earlier and got no reply.  This is the sort of thing I
> usually deal with in the design stage, not review.
>

I don't really have good news here. This is what kernel development is
like: it's easier for maintainers to discuss existing code than
hypothetical design concepts. Just to give you an idea: it recently
took me 11 iterations of patches and several significant changes to
get a relatively simple and - what I assumed was a rather -
non-controversial pmic driver merged upstream. This is simply how it
usually works: after some initial high-level discussion, there's an
expectation that a patch series will be posted which can then be
discussed and worked upon until a consensus is reached.

Also remember that an idea that sounds good in theory can turn out to
be wrong once the code is ready and there often is no way of
predicting it.

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

But we're not - we're just following the example of the in-kernel
pinctrl API, making it easy on user-space programs and making this
future-proof in that adding new options will be painless.

> Wrt the patch series, before I take another go at it, I'd like some
> guidance as to how you would like it structured.
> Are you good, in principle, with the feature set in the existing patches?

Yes, as I understand it: the patches should add support for
pull-up/down on inputs, the ability to disable bias and then
additional support for pull-up/downs on outputs. This sounds like a
self-contained set of changes.

> What branch would you like it based on?

For now rebase it on top of my gpio/for-next branch[1].

> It will begin with Drew's patch, either his original or with your
> additions.

I don't want a series in which some things are added by earlier
patches only to be removed by subsequent ones - this is nonsensical.
If you know you'll change some parts of Drew's patch later, then
change it right away: leave only the parts that will make it to the
end and that make logical sense as a single patch while keeping the
code bisectable (for instance flags definitions etc.) to give Drew
credit and build on top of that. Be creative and try to imagine what
code you'd want to review.

> Other than that I'm open to your suggestions on number, ordering,
> content, comments etc.
>

Patch 5 is wrong to me, I want an explicit DISABLE flag. Patch 4
should be part of an earlier patch. I'm fine with separate patches for
lineevent and linehandle as long as the kernel never breaks when
applying them one-by-one. Adding support for outputs separately is
fine too.

> Though if you change your mind later I'll probably be cranky.
> Or should I say crankier.
>

This is unnecessary and I won't comment on that.

Bart

> Cheers,
> Kent.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
