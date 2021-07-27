Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124133D707C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 09:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235629AbhG0Hj7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 03:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235518AbhG0Hj6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 03:39:58 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C470BC061757;
        Tue, 27 Jul 2021 00:39:57 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u3so20101509lff.9;
        Tue, 27 Jul 2021 00:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c39xROEkMx0ItgvX0WijTEqPXUbVNB8FEDIIWLk669k=;
        b=qCgZaK0tofoCRWeTQbMZl1TxXxJUXfHge5CX3mVRqX3uEApn4y1bMFVVW5cs9ITJUQ
         D0nWl3SVMDz3mc/MA4zbmGAsXWlsZmmsaxyt12q1WCuVJKr7b7j/vKhmUYDVeeexHgkS
         d9j8BQ7D68oYR0cx8b+NDz3oJLV92URT4AVXRUj6Piia9Mxs+2vPFfYiN1ByjUq2dUWS
         VlWX2N36hK/8pmh6ObWzVXyEgKlYpMNeYo3SAQSC8NX+7wnqTy6OD7yzD/NOJLCLAcU8
         MLJ4KIaNZVM/p6mNQXWTPNJXOzyd5rI4f7ggkslMjLKptuq8wx9ogrEaOW7B8HJXVAjZ
         a13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c39xROEkMx0ItgvX0WijTEqPXUbVNB8FEDIIWLk669k=;
        b=bOn/hnb1fT/OVQ4jdUjM4Jc39ntOZA2j6XdKEedN8y8U5de2I0N9enPnRJN1C7pbvS
         ZW3F4zWwyws/B/QwouVWyiqy0TDARD7SdodztV4m3/lL2D6vG4fKqXAmyWXERP90rXcs
         oj7VSFAAgZM/kwSyVXtSenFRVSFMpkGVq5VUjalWClYMhDMXG1cHeO/LyUb7QSZYHBJg
         XbctXioB5Dwanpl7FIv7MTXpUIFdY+e+NUqWKDRhpFniFtiaNuUqLrtas80VLG1F1evC
         Qzh3sCtkRH30ETKh7D8olQUABtCgu80e4gZmVP0IFvfSWL2uk79YU/yO9ni28hq2m61N
         9glA==
X-Gm-Message-State: AOAM530iAq+5LImpWecclGzXHsw8injbhFwvQLXEc9pDgnrBXO1IIQDC
        kpyTieXsTntB0dGojLhpTuncoDr1xs9sYERS38Q=
X-Google-Smtp-Source: ABdhPJy3RKzcok35qAY1iMgnNQKFZz3zzExveSHxy5EGgqtg2FP5ok/oXtKVHgM7wIDr66Nq6/Ox2fkf8COc7xDVCSw=
X-Received: by 2002:a19:f815:: with SMTP id a21mr16486897lff.507.1627371596138;
 Tue, 27 Jul 2021 00:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
 <20210708070429.31871-2-sergio.paracuellos@gmail.com> <20210719075723.GA8818@kessel>
 <CAMhs-H8QeRcY+EiCrN2Rw1A1-xDdpuDqr-knoQEAcQiTXvdBDw@mail.gmail.com>
In-Reply-To: <CAMhs-H8QeRcY+EiCrN2Rw1A1-xDdpuDqr-knoQEAcQiTXvdBDw@mail.gmail.com>
From:   Gregory Fong <gregory.0xf0@gmail.com>
Date:   Tue, 27 Jul 2021 00:39:27 -0700
Message-ID: <CADtm3G50HbOe_0RpWYYOVZSZfSdkF7Z0TXzEfAM0AQUqVgvpNQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip baks per device
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
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

On Mon, Jul 19, 2021 at 1:31 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Mon, Jul 19, 2021 at 9:57 AM Gregory Fong <gregory.0xf0@gmail.com> wrote:
> > On Thu, Jul 08, 2021 at 09:04:27AM +0200, Sergio Paracuellos wrote:
> [snip]
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index 27c07108496d..f3f45b804542 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -382,11 +382,16 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> > >       if (count < 0)
> > >               return 0;
> > >
> > > -     if (count > gdev->ngpio) {
> > > -             dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
> > > -                      count, gdev->ngpio);
> > > -             count = gdev->ngpio;
> > > -     }
> > > +     /*
> > > +      * When offset is set in the driver side we assume the driver internally
> > > +      * is using more than one gpiochip per the same device. We have to stop
> > > +      * setting friendly names if the specified ones with 'gpio-line-names'
> > > +      * are less than the offset in the device itself. This means all the
> > > +      * lines are not present for every single pin within all the internal
> > > +      * gpiochips.
> > > +      */
> > > +     if (count <= chip->offset)
> > > +             return 0;
> >
> > This case needs a descriptive warning message.  Silent failure to assign
> > names here will leave someone confused about what they're doing wrong.
>
> Ok, I will add something like "All line names are not defined for bank
> X.". Or any other suggestion would be also ok :).

I'd like this to name the gpio-line-names property like the other
warning does.  Not sure there's a good way to generically determine
what the bank number is, since some driver might not populate at
regular offsets.

We do have the count and offset available, so maybe something like
"gpio-line-names too short (length <count>), cannot map names for the
gpiochip at offset <offset>"?

>
> >
> > >
> > >       names = kcalloc(count, sizeof(*names), GFP_KERNEL);
> > >       if (!names)
> > > @@ -400,8 +405,25 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> > >               return ret;
> > >       }
> > >
> > > +     /*
> > > +      * When more that one gpiochip per device is used, 'count' can
> > > +      * contain at most number gpiochips x chip->ngpio. We have to
> > > +      * correctly distribute all defined lines taking into account
> > > +      * chip->offset as starting point from where we will assign
> > > +      * the names to pins from the 'names' array. Since property
> > > +      * 'gpio-line-names' cannot contains gaps, we have to be sure
> > > +      * we only assign those pins that really exists since chip->ngpio
> > > +      * can be different of the chip->offset.
> > > +      */
> > > +     count = (count > chip->offset) ? count - chip->offset : count;
> > > +     if (count > chip->ngpio) {
> >
> > In the multiple gpiochip case, if there are 3+ gpiochips this seems like
> > it will yield an invalid warning. For example, if there are 3 gpiochips
> > (banks 0, 1, and 2), and all gpios are given names in gpio-line-names,
> > isn't this condition going to always evaluate to true for bank 1,
> > resulting in an invalid warning?  In that case I would think setting
> > count to chip->ngpio is the *expected* behavior.
> >
> > Since that's a "normal" behavior in the multiple gpiochip case, I'm not
> > sure there's a simple way to detect an over-long gpio-line-names here
> > in this function anymore.
>
> Yes, in case of multiple chips with all lines names defined this
> warning will be displayed but I wanted to maintain the warning for
> normal cases and I was not able to find an easy way of distinc that
> cases with those having multiple gpiochips internally. So I ended up
> in "ok, will be displayed for those special cases and interpreted as
> we are just assigning names within an offset along the gpiochips in
> the device.". Any other suggestion of course is always welcome :)

There are millions of parts with this gpio hardware in the wild; I'd
much prefer we didn't issue a warning for every chip using it.

If there is a good way to detect the multiple gpiochip case, then that
could be used to determine whether to issue the warning.  Otherwise,
it seems like it would be better to remove the warning altogether.

Best regards,
Gregory
