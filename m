Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3AF6AD46C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 10:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfIIIIC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 04:08:02 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42917 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfIIIIC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2019 04:08:02 -0400
Received: by mail-io1-f66.google.com with SMTP id n197so26594433iod.9
        for <linux-gpio@vger.kernel.org>; Mon, 09 Sep 2019 01:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EPO+JEAp3lllN7FD/A/K+0ZkOWtOPlRcQJal9iDBtSg=;
        b=MEwQZkzClMwDCop2v5Xs83+gbVEMMCcJQ1TgvtaAeDxgtgNhbqKzwnY2i0EQJMVvgX
         lY6X6Eecmo+dmLsCGaL3bIQ983WF14Aawe854EldQenGRIn0vrMXcpYlCaCPOgZFbCEH
         8t885pQD6I6RxTEQburNZvcZMGnboiepszEWgzWyVIsReqfTyGzzA5InybqhIPKG3cwH
         9dntZxZM1ez5HnjlPLCBSZypsMvzXTblugnGRDLWjp0FxVW4N8apaTBlHZg580EIYH+H
         34sK4vac8elr4R6kfYS6oK/k7+pfAenER2tj30YJaQcO/AxWfYPMy8skMAO6pcMg/1l9
         vhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EPO+JEAp3lllN7FD/A/K+0ZkOWtOPlRcQJal9iDBtSg=;
        b=Riq5A1auilqaKsRXDxiKNvxf3WPKO0w6LcVKpXolMa1m1Syb9DnTmWfmb9iUFq9qFW
         BqnwyVXu6PkrNVTEn4S8/F/6cbt6bXJx5DAyjJR5ZEACPgJR8IkotsFXHErlhZ/tvIP/
         L/N8tigbFr8e3u3aeVl+Zg4R6Gy6Wo8Ux2gr+YjybJxfP2IaTUHigmjy1/rTfhoaUC+u
         NjTxe1zBHFmJF4KBiGbdCgNSVFcnl6tCVCCx72eXx6UBGkIL0jXmrrvP2FI5UBhplwfh
         ihP4l/hqapw2MfM4+DG4RAq8yTdk88TraIhOECh4UPGLbobiF8V9WKcBJrjY3vmBiCWN
         IDPw==
X-Gm-Message-State: APjAAAUmljFqpTKJZ5KF6YPLEIha88lJBlWy0BNB0J3bIRSa40wSJEa8
        X+T3uJ27tyKjieYTAfFsviXGke4VcaXUG8txuQeLK/Vm
X-Google-Smtp-Source: APXvYqxSR2x72+P0eHPbTrMKD+swgFNs9R8udT6Q3RW91xpIbxn4U9/DY+t1GG/c6f5WVJNhFL/mulahb431EVJQx1I=
X-Received: by 2002:a02:a403:: with SMTP id c3mr23516886jal.93.1568016479725;
 Mon, 09 Sep 2019 01:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190909032406.1952-1-warthog618@gmail.com> <CAMRc=McNhsJ1r_uKCsL_1dLyrm2FoGxcs-1yBfs-SpBdKBFggw@mail.gmail.com>
In-Reply-To: <CAMRc=McNhsJ1r_uKCsL_1dLyrm2FoGxcs-1yBfs-SpBdKBFggw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Sep 2019 10:07:49 +0200
Message-ID: <CAMRc=MczkOy2b_NWJvkpOMgCd9g+RhFHZA3EVRqF4kFcKWOTvg@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix line flag validation in lineevent_create
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 9 wrz 2019 o 09:31 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> pon., 9 wrz 2019 o 05:24 Kent Gibson <warthog618@gmail.com> napisa=C5=82(=
a):
> >
>
> Hi Kent,
>
> thanks for spotting this. Just single nit below:
>
> > lineevent_create should not allow any of GPIOHANDLE_REQUEST_OUTPUT,
> > GPIOHANDLE_REQUEST_OPEN_DRAIN or GPIOHANDLE_REQUEST_OPEN_SOURCE to be s=
et.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index cca749010cd0..5499ec7bc783 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -918,7 +918,7 @@ static int lineevent_create(struct gpio_device *gde=
v, void __user *ip)
> >                 goto out_free_label;
> >         }
> >
> > -       /* Return an error if a unknown flag is set */
> > +       /* Return an error if an unknown flag is set */
>
> Please don't sneak in changes unrelated to the patch. If you want to
> fix the typo - do it in a separate one.
>
> >         if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
> >             (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS)) {
> >                 ret =3D -EINVAL;
> > @@ -926,7 +926,9 @@ static int lineevent_create(struct gpio_device *gde=
v, void __user *ip)
> >         }
> >
> >         /* This is just wrong: we don't look for events on output lines=
 */
> > -       if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
> > +       if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
> > +           (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> > +           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)) {
> >                 ret =3D -EINVAL;
> >                 goto out_free_label;
> >         }
> > @@ -940,10 +942,6 @@ static int lineevent_create(struct gpio_device *gd=
ev, void __user *ip)
> >
> >         if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
> >                 set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> > -       if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
> > -               set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> > -       if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
> > -               set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> >
> >         ret =3D gpiod_direction_input(desc);
> >         if (ret)
> > --
> > 2.23.0
> >

Ok, so seeing that we'll still have another week for fixes, I thought
it would be nice to get those in before v5.3. I eventually applied
both patches and simply removed the typo fix.

Bart
