Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8026100307
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 11:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfKRK4l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 05:56:41 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:37483 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfKRK4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 05:56:41 -0500
Received: by mail-io1-f68.google.com with SMTP id 1so18233345iou.4
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 02:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BpjkydcILv4WRatAhMF8ID6gevL7eMvwGFbXOPEOTT8=;
        b=KQ5ze8tIdjs8igU04GRoglPdZXSB6Omi1Lgtu481bI2uLKnXgkwgQA0yf5N9lVpKKD
         /k5GQwzi+FIjlOKP9lHC5oB4xnYRnkx4rdzpuosu6C6Ak3fFp9ybKC33qahHuoSUfPHC
         qemRopZDWSLYVuxsVGNnjZ1DWR2RlKLP9IeG+YoPUYWqQ2Tr0L+68/Onk6xi4td5MUjf
         ORfTMmeS/wfdAAsP6p9g+SE/KpgrPUPNLHaaRw5V6yARCKv7KCK5TIzIqXAKRkKgoaCB
         mDr8N7mXKjncVx5m10JoX8Q5272M/EFFGZ26Yg5H5Da/+KjDqJrUGpJylYmKHdVeqLiP
         iFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BpjkydcILv4WRatAhMF8ID6gevL7eMvwGFbXOPEOTT8=;
        b=Ei6RyKTEiJJeh2thi5gEosaEbKsBPy/r+vcd0Wti1zav1OqkdbIrd65dmbt2Tv+lUn
         wZRG8hzlT8PgTbx9glbOws76YuTmg3FtryR31q6F9T7dpHSvTE2PQdz4dSCWmrrHuX4Y
         IcCpJ103ad2RYUEDlx2RqPlvlIWJQ3HQn6S17WI8B5OUbGlcmEPlcoZQ9lPg1BmkTHxC
         CBKGf4+m9+DBBFSYdWISqmb/cxNEF7q+DkGHZkirKt648XFC06Th1Dc51AUsFrcUydmG
         EZHD44Ch8fENp2ON2r3pKQFoo+FHNBhkvwKixdYaMlBMGL2fvZUZtbClWbA5+zZQ+EX6
         ttXg==
X-Gm-Message-State: APjAAAU0xdBdPOP7Nuw2uXCoqRYLNmXsUMA3/1Z3zz0CHV8J+RXzGDn1
        W2SWn+pvIx5/AGwzC9i0JWstVTllyOYZzsnfxK2epw==
X-Google-Smtp-Source: APXvYqys+DHRyHrExAkuVoqSvESVnhLyTrN6zzDEb2BCGFENYKMYYlQu22DMWnY0oiCxedTbQwzF2JUozTlFrD4Y+kI=
X-Received: by 2002:a6b:18c1:: with SMTP id 184mr12748500ioy.40.1574074600772;
 Mon, 18 Nov 2019 02:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20190916134344.26656-1-m.felsch@pengutronix.de>
 <CAMpxmJXYPSu85UmsWO2n01+fWBdw-1UeEyi3Z2LOFjNbg+m6kQ@mail.gmail.com> <20191118103332.bmafrl5izirbauqw@pengutronix.de>
In-Reply-To: <20191118103332.bmafrl5izirbauqw@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Nov 2019 11:56:29 +0100
Message-ID: <CAMRc=MeEQnoR3Y0gPPzRbf0Ya39z3ME4pgc0=_DVgVD=5X0Ecg@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix getting nonexclusive gpiods from DT
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        m.szyprowski@samsung.com,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 18 lis 2019 o 11:33 Marco Felsch <m.felsch@pengutronix.de> napisa=C5=
=82(a):
>
> Hi Bart,
>
> On 19-09-17 09:53, Bartosz Golaszewski wrote:
> > pon., 16 wrz 2019 o 15:43 Marco Felsch <m.felsch@pengutronix.de> napisa=
=C5=82(a):
> > >
> > > Since commit ec757001c818 ("gpio: Enable nonexclusive gpiods from DT
> > > nodes") we are able to get GPIOD_FLAGS_BIT_NONEXCLUSIVE marked gpios.
> > > Currently the gpiolib uses the wrong flags variable for the check. We
> > > need to check the gpiod_flags instead of the of_gpio_flags else we
> > > return -EBUSY for GPIOD_FLAGS_BIT_NONEXCLUSIVE marked and requested
> > > gpiod's.
> > >
> > > Fixes: ec757001c818 gpio: Enable nonexclusive gpiods from DT nodes
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/gpio/gpiolib.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index d9074191edef..e4203c1eb869 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -4303,7 +4303,7 @@ struct gpio_desc *gpiod_get_from_of_node(struct=
 device_node *node,
> > >         transitory =3D flags & OF_GPIO_TRANSITORY;
> > >
> > >         ret =3D gpiod_request(desc, label);
> > > -       if (ret =3D=3D -EBUSY && (flags & GPIOD_FLAGS_BIT_NONEXCLUSIV=
E))
> > > +       if (ret =3D=3D -EBUSY && (dflags & GPIOD_FLAGS_BIT_NONEXCLUSI=
VE))
> > >                 return desc;
> > >         if (ret)
> > >                 return ERR_PTR(ret);
> > > --
> > > 2.20.1
> > >
> >
> > Queued for fixes, thanks.
>
> I rebased my patch stack ontop of -rc8 and didn't saw this commit. Is
> this intended?
>

I'm not sure what you mean, it's been in mainline since v5.4-rc2 as
commit be7ae45cfea9 ("gpio: fix getting nonexclusive gpiods from DT").

Bart

> Regards,
>   Marco
>
> > Bart
> >
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
