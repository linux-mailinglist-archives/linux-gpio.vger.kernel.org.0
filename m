Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8182EE489
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 17:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbfKDQT0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 11:19:26 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36221 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbfKDQTZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 11:19:25 -0500
Received: by mail-oi1-f193.google.com with SMTP id j7so14617747oib.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 08:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1UYdilF5C85MgWTCVVhC6Tb2+FFPhhV9V98ZiCRIIig=;
        b=EOr1q+L7f7R9yg1N9btR0xbIE8t5NNlFW9E01UQrX16iFrsMxWPfRUYxZ4vC0R/78p
         Pzcc2Wz3jih+tie7/X1SfXVdRtFYPjywy8pqAs6hP6c2H6FUBrtVcc6zvqD/xFF8XnFF
         gZKPWCxHEBQqueRfc2UGs3Tb06q+URsA/V7cyo1dvMpkn5gI95fKCb1h/86R6O8ebP3M
         T9lUoCqGT5eR5iPVazCjq/AMXLhu4AfKcu/g2PNvE+6fNExPikYTNtLRDbmTlFChSEph
         ZIZiatWpRMGpPq9PvEbv34NZ/Mu1Z4kSHS+304lmHUobTnIOInQQDmVGXtlisIe7Dlyo
         g4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1UYdilF5C85MgWTCVVhC6Tb2+FFPhhV9V98ZiCRIIig=;
        b=Iej3iFd/wTh2vd2tRQqBNfnm84HfwBvF4BSz0EGDE598CSb7Ox2qcbYntTfLNaOdUY
         2dqUsmGFCVNPmnw7/ngcIlxOQUl4qwcFR+fvxwUm0639SEza++SW5g0HIisI4PuYGlNV
         EY+sE/rpP7Gi1uxsDz1ripXnx2iuuIXRlFqfA2bsD5oS7wXM9vHGir4zTRk9FJ1/McmR
         kxHXCKqs6ij0NVdCdcEsvdU66Yak+qK0yQRR6z2GPqtaHoF0+asoev3dDOd5NROeR2UH
         4j6v/S2ZdaTXV5FSCvAO7fn1Fhi+VImjEKVBlOzuIhIPebyG2WW8jZEwRvosX75NdAIp
         As6w==
X-Gm-Message-State: APjAAAWTEZd+B8x8JUB6vz0P+y8dxqe0BwzOYLaoGiW8QuIzx45pUsC4
        Z/McmE2rCoeVUkGQvmqfkfMrAywOmLZEeP2jLijWjA==
X-Google-Smtp-Source: APXvYqwCkr5Q1nrvvnYEDtfbc/HRP/JQBs2/Oa+O4QqQSj5wwu//RYmOm5hBxXzVqo/KnyBimwI2+t8VZNOQXCFo6+g=
X-Received: by 2002:aca:451:: with SMTP id 78mr4412219oie.170.1572884364849;
 Mon, 04 Nov 2019 08:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20191104153841.16911-1-warthog618@gmail.com> <20191104153841.16911-5-warthog618@gmail.com>
 <CAMpxmJUExXZ=ptMyRczvdujc7x9JP62Zy9m+WByYD4=w=1180w@mail.gmail.com> <20191104155927.GA17106@sol>
In-Reply-To: <20191104155927.GA17106@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Nov 2019 17:19:14 +0100
Message-ID: <CAMpxmJUTFb_Bxsc8e006ohP6D3PP+kQgFYAPoZA2T1-HA41vSA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] gpiolib: add support for biasing output lines
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 4 lis 2019 o 16:59 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Mon, Nov 04, 2019 at 04:50:30PM +0100, Bartosz Golaszewski wrote:
> > pon., 4 lis 2019 o 16:39 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > Allow pull up/down bias to be set on output lines.
> > > Use case is for open source or open drain applications where
> > > internal pull up/down may conflict with external biasing.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >  drivers/gpio/gpiolib.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index 7d8ff52ada42..de08d1a4a3fb 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -555,8 +555,9 @@ static int linehandle_create(struct gpio_device *=
gdev, void __user *ip)
> > >              (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
> > >                 return -EINVAL;
> > >
> > > -       /* Bias flags only allowed for input mode. */
> > > -       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> > > +       /* Bias flags only allowed for input or output mode. */
> > > +       if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
> > > +             (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
> > >             ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
> > >              (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
> > >              (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
> > > @@ -3144,6 +3145,9 @@ int gpiod_direction_output(struct gpio_desc *de=
sc, int value)
> > >         }
> > >
> > >  set_output_value:
> > > +       ret =3D gpio_set_bias(gc, desc);
> > > +       if (ret)
> > > +               return ret;
> > >         return gpiod_direction_output_raw_commit(desc, value);
> >
> > Ugh, I missed one thing here - my for-next branch doesn't contain the
> > following commit e735244e2cf0 ("gpiolib: don't clear FLAG_IS_OUT when
> > emulating open-drain/open-source") which happens to modify this
> > function.
> >
> > If I provided you with a branch containing it - would it be a lot of
> > effort on your part to rebase it on top of it? If so - I can do it
> > myself.
> >
>
> I can do a rebase - though not until tomorrow (it is getting late here).
> I would like that commit in as well - I suspect it being missing is
> the reason a couple of the gpiod tests I was working on are failing.
> I was in the process of tracking that down when I switched back to this.
>
> Cheers,
> Kent.
>
>

No problem, it can wait until tomorrow. Please use the following
branch - gpio/for-kent - from my tree.

Bart
