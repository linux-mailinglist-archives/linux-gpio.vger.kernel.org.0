Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECD43D67B5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 18:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388253AbfJNQux (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 12:50:53 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36653 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730192AbfJNQux (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 12:50:53 -0400
Received: by mail-io1-f67.google.com with SMTP id b136so39342575iof.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=emZrLv86Gki4PJTlLSFEcBCPqfIx3db/nHeNZKlYtTY=;
        b=vvDuu+1Jw3rpYvOh7Q8sqBgAUQZvfef6TVY0XpyKTHXDaC20zdXgRV3Q1l636/DMe7
         hFEtU6yzeS1B8/H1XMObkYc4QUvd6C+TKVakNeegsxQ5eGgDW33shG60IZubqyyCsLAn
         x1gsuET8lEhyjZo2u7BEma7QrqjHzFIwXPHZgdrnljXJitkej5kQOBiNJHk5NDpMw05F
         NtRa7f2zFtzyqBvYwvs4sFEe6MzlL+5yj+ez5LMf66ac9PGQN45CLrlLwn/bAYcPHPkj
         0EmKfolpZNDN8GPN3sWeqrO6LvnuR5O/OzN/oHLcp1C/R25l2HpB5HVSu6BTN5Rnl8qR
         kVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=emZrLv86Gki4PJTlLSFEcBCPqfIx3db/nHeNZKlYtTY=;
        b=RICamtzabGZUpZkb3WP0lFf3Gs5Q9QFA8rR8UBJR2ifDoqOARBCSwA/VL6XNC2AvMd
         lwswhP7+WrVTx3c1axSNj22j/djpa+P2leXuPW5BBqqJ7xgO2bo47P2cyvtocATomgtx
         6anMZhx9Fp9nDPyyXsXl1E5gWDrwnOxMX5MG9BFMWdBS7UPK11yR955us9HZefh6NQL4
         FiTcnVxbE+ZpvTh2D5SiU97oD+AxRULGSfCgz1t6ALqmdeK9XHHPbg5YFdqcfLDpJKz+
         pBI1ysV6QFpWJsFIM5Hz87jR0cOoDcyH802aiLKclE4piv77Rec2uuSeybDigZK3lYlD
         Y6PA==
X-Gm-Message-State: APjAAAUR0mOxf8uHVut7DGNN61yvX1IqOe8PtwTpgs1vp/DkqvqbOPV0
        UlaqCXfnhFfYFCMbZm2jOmElNp75CzIwI81HWqjMZg==
X-Google-Smtp-Source: APXvYqzdkwhVQBpb8BexZYuMLLOkHvGjGaJZ8nX/aJmdRR9DjrLwj+UsLhmMUNJOnva/cCCmS0KXUdv6mssegcspJ84=
X-Received: by 2002:a5e:9b0b:: with SMTP id j11mr4759443iok.189.1571071851768;
 Mon, 14 Oct 2019 09:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com> <20191014130425.GC28012@sol>
In-Reply-To: <20191014130425.GC28012@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Oct 2019 18:50:41 +0200
Message-ID: <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
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

pon., 14 pa=C5=BA 2019 o 15:04 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wrote:
> > sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napis=
a=C5=82(a):
> > >
> > > This patch allows pull up/down bias to be disabled, allowing
> > > the line to float or to be biased only by external circuitry.
> > > Use case is for where the bias has been applied previously,
> > > either by default or by the user, but that setting may
> > > conflict with the current use of the line.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index 647334f53622..f90b20d548b9 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device =
*gdev, void __user *ip)
> > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > >                 return -EINVAL;
> > >
> > > -       /* Same with pull-up and pull-down. */
> > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > -               return -EINVAL;
> > > -
> > >         /*
> > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single re=
quest. If
> > >          * the hardware actually supports enabling both at the same t=
ime the
> > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *=
gdev, void __user *ip)
> > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > >                 return -EINVAL;
> > >
> > > -       /*
> > > -        * Do not allow both pull-up and pull-down flags to be set as=
 they
> > > -        *  are contradictory.
> > > -        */
> > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > -               return -EINVAL;
> > > -
> > >         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
> > >         if (!le)
> > >                 return -ENOMEM;
> > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc=
, unsigned offset,
> > >         unsigned arg;
> > >
> > >         switch (mode) {
> > > +       case PIN_CONFIG_BIAS_DISABLE:
> > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > >         case PIN_CONFIG_BIAS_PULL_UP:
> > >                 arg =3D 1;
> > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *de=
sc)
> > >         if (ret =3D=3D 0)
> > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > >
> > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> >
> > From looking at the code: user-space can disable bias when setting
> > both PULL_UP and PULL_DOWN flags. I don't understand why it's done in
> > this implicit way? Why not a separate flag?
>
> An extra flag would waste a bit and add nothing but more sanity checking.
>

I disagree. The user API needs to be very explicit. Sanity checking is
alright - if there'll be too many ifdefs, we can start thinking about
adding some core library helpers for sanitizing conflicting flags, I'm
sure other frameworks could use something like this as well.

Especially in this context: setting PULL_UP and PULL_DOWN together
disables bias - this doesn't make sense logically.

Bart

> Kent.
> > Also: I don't like that
> > this patch deletes code added by earlier patches in this series. If we
> > really need this, then it should be rearranged.
> >
> > Bart
> >
> > >                 gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > >                                 PIN_CONFIG_BIAS_PULL_UP);
> > >         else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > @@ -4462,7 +4454,7 @@ int gpiod_configure_flags(struct gpio_desc *des=
c, const char *con_id,
> > >
> > >         if (lflags & GPIO_PULL_UP)
> > >                 set_bit(FLAG_PULL_UP, &desc->flags);
> > > -       else if (lflags & GPIO_PULL_DOWN)
> > > +       if (lflags & GPIO_PULL_DOWN)
> > >                 set_bit(FLAG_PULL_DOWN, &desc->flags);
> > >
> > >         ret =3D gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY)=
);
> > > --
> > > 2.23.0
> > >
