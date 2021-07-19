Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CA93CCFDF
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 11:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbhGSIWE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 04:22:04 -0400
Received: from mail-qv1-f45.google.com ([209.85.219.45]:42541 "EHLO
        mail-qv1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbhGSIWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 04:22:04 -0400
Received: by mail-qv1-f45.google.com with SMTP id ck17so8006518qvb.9;
        Mon, 19 Jul 2021 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cGOQ+tHFFR3Lj7D9YmjuYRyBNzj2z0fXhnb3i5wHBdU=;
        b=Tuv4KBacoXGBFfhz3unVvZAsOpJYEE59bZCMw8zc6xo1kS6sY97c7tw/9rWHG7xqPO
         j6V9k5W+jiN0rRdnRKwpFJXlWCh60r+m6I3B7ZJGA/4pJ4zlopc+0z19BhOMnEYlGW5U
         U3t/jO5kw2mFtnHWhjWgYokgTK0F5tWjzPwkcjwKLbzXOJxz8Z00zV7uJnJ0v3gdov7+
         6ct09u//y/8/5TvhxNrLPxQh/g4Xew5zvPJHj/GXUWTKKA0idSOOenlKuXOZ6Dhin7Ei
         g6LBoMms879Ar6GmZ7NCT6G17wb6o5ppGMo4w0lYSVKgdHoRLGib2lRuIHrSg7om8R9Q
         iRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cGOQ+tHFFR3Lj7D9YmjuYRyBNzj2z0fXhnb3i5wHBdU=;
        b=b7V83+gf4JdTYV+YBezpbcYnfGjVeG2QX16IghLQ2lIwBRYQ+xKICfuQ3lZRaKaiio
         ywEGZr32c9KAFQL4Upie7onApBRbkPm52gstI8m0efnFGgfl0f35FmLm1zY8eVB4JPR2
         UCKe5n6yE0h4QUfRPk+FKgkasgtSrIb9jjAxZU5SqaRWEUIF5gvtC7EJXmm0QFE+6eRB
         fNlNvApelKE8lVFp8lDhUNDdCXpZ2YBnkJ7Pk2spehVg/84MoI1oUzYIbV+IkBWLTSSw
         5rr2Y0BQbxf2NOSiokbzD3m2gPbs/oqnu31ccjiTvfCVPOWojZGn7vF+VUOfbZyP23X5
         +1fA==
X-Gm-Message-State: AOAM531qeEgye0rvKRWI+hMUo+OPs2i7QB2WxRY7tzt/USiiDuv/LJU0
        6L/WDKYAKWrcfX9ol8BphUJROENsjhYGUj5nvwquKj6+MPJAJg==
X-Google-Smtp-Source: ABdhPJwbcOLmqqf3lpsjfNWi7POT2gx3i6SMG9gi91heJIOYE178GJ08/892lA+YWdl7zsfiX5LabOkUTfHft6/6NqY=
X-Received: by 2002:a05:6122:1041:: with SMTP id z1mr20802749vkn.5.1626683483673;
 Mon, 19 Jul 2021 01:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
 <20210708070429.31871-2-sergio.paracuellos@gmail.com> <20210719075723.GA8818@kessel>
In-Reply-To: <20210719075723.GA8818@kessel>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 19 Jul 2021 10:31:12 +0200
Message-ID: <CAMhs-H8QeRcY+EiCrN2Rw1A1-xDdpuDqr-knoQEAcQiTXvdBDw@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip baks per device
To:     Gregory Fong <gregory.0xf0@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Gregory,

Thanks for the feedback.

On Mon, Jul 19, 2021 at 9:57 AM Gregory Fong <gregory.0xf0@gmail.com> wrote:
>
> Hi Sergio,
>
> On Thu, Jul 08, 2021 at 09:04:27AM +0200, Sergio Paracuellos wrote:
> > The default gpiolib-of implementation does not work with the multiple
> > gpiochip banks per device structure used for example by the gpio-mt7621
> > and gpio-brcmstb drivers. To fix these kind of situations driver code
> > is forced to fill the names to avoid the gpiolib code to set names
> > repeated along the banks. Instead of continue with that antipattern
> > fix the gpiolib core function to get expected behaviour for every
> > single situation adding a field 'offset' in the gpiochip structure.
> > Doing in this way, we can assume this offset will be zero for normal
> > driver code where only one gpiochip bank per device is used but
> > can be set explicitly in those drivers that really need more than
> > one gpiochip.
>
> This is a nice improvement, thanks for putting this together!  A few
> remarks below:
>
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/gpio/gpiolib.c      | 34 ++++++++++++++++++++++++++++------
> >  include/linux/gpio/driver.h |  4 ++++
> >  2 files changed, 32 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 27c07108496d..f3f45b804542 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -382,11 +382,16 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> >       if (count < 0)
> >               return 0;
> >
> > -     if (count > gdev->ngpio) {
> > -             dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
> > -                      count, gdev->ngpio);
> > -             count = gdev->ngpio;
> > -     }
> > +     /*
> > +      * When offset is set in the driver side we assume the driver internally
> > +      * is using more than one gpiochip per the same device. We have to stop
> > +      * setting friendly names if the specified ones with 'gpio-line-names'
> > +      * are less than the offset in the device itself. This means all the
> > +      * lines are not present for every single pin within all the internal
> > +      * gpiochips.
> > +      */
> > +     if (count <= chip->offset)
> > +             return 0;
>
> This case needs a descriptive warning message.  Silent failure to assign
> names here will leave someone confused about what they're doing wrong.

Ok, I will add something like "All line names are not defined for bank
X.". Or any other suggestion would be also ok :).

>
> >
> >       names = kcalloc(count, sizeof(*names), GFP_KERNEL);
> >       if (!names)
> > @@ -400,8 +405,25 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> >               return ret;
> >       }
> >
> > +     /*
> > +      * When more that one gpiochip per device is used, 'count' can
> > +      * contain at most number gpiochips x chip->ngpio. We have to
> > +      * correctly distribute all defined lines taking into account
> > +      * chip->offset as starting point from where we will assign
> > +      * the names to pins from the 'names' array. Since property
> > +      * 'gpio-line-names' cannot contains gaps, we have to be sure
> > +      * we only assign those pins that really exists since chip->ngpio
> > +      * can be different of the chip->offset.
> > +      */
> > +     count = (count > chip->offset) ? count - chip->offset : count;
> > +     if (count > chip->ngpio) {
>
> In the multiple gpiochip case, if there are 3+ gpiochips this seems like
> it will yield an invalid warning. For example, if there are 3 gpiochips
> (banks 0, 1, and 2), and all gpios are given names in gpio-line-names,
> isn't this condition going to always evaluate to true for bank 1,
> resulting in an invalid warning?  In that case I would think setting
> count to chip->ngpio is the *expected* behavior.
>
> Since that's a "normal" behavior in the multiple gpiochip case, I'm not
> sure there's a simple way to detect an over-long gpio-line-names here
> in this function anymore.

Yes, in case of multiple chips with all lines names defined this
warning will be displayed but I wanted to maintain the warning for
normal cases and I was not able to find an easy way of distinc that
cases with those having multiple gpiochips internally. So I ended up
in "ok, will be displayed for those special cases and interpreted as
we are just assigning names within an offset along the gpiochips in
the device.". Any other suggestion of course is always welcome :)

Thanks,
    Sergio Paracuellos

>
> > +             dev_warn(&gdev->dev, "gpio-line-names is length %d but
> > should be at most length %d", +                        count,
> > chip->ngpio);
> > +             count = chip->ngpio; +  } + for (i = 0; i < count; i++)
> > -             gdev->descs[i].name = names[i]; +
> > gdev->descs[i].name = names[chip->offset + i];
> >
> >       kfree(names);
> >
> > [snip]
>
> Best regards,
> Gregory
