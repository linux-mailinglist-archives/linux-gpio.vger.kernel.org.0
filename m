Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB2C3D8669
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 06:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhG1EFR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 00:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhG1EFQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 00:05:16 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38F0C061757;
        Tue, 27 Jul 2021 21:05:15 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id e4so654629vsr.13;
        Tue, 27 Jul 2021 21:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJP5hyy2+cqaFRte0iA2P2olaW3FGV8BempEDrLyejQ=;
        b=u+RD1lm+4/qgHvwL9FM90AZ3uo3DkBuucU5sgpCwmIG+v+BpsMVRqnXilgl5YeZ5KA
         lbX2034XOYXyr0rrI74a+6qbLiz486Tz+v5kLrohZpchc1OvI/92zmnFtcFoLk4GWqmv
         u6shlrr22ePNj7vfTS1noVpM6cBXqMZQUdfA5IMNkrv5MJhLGk5b3ufUZ+iE6OqmPx8D
         SQIEmwg+1EWupeNZ4cFzESvMzVeps5D9naddQVN9u9qk1ydxICl9BxUk4iz8hVsxKf2W
         R4hOXb+9i83oD9T0xtaT5tirIcZY0Jxxx0yFvapXZ6SwZFZIGHvQMgQKFvzqGIIJ1g4W
         EUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJP5hyy2+cqaFRte0iA2P2olaW3FGV8BempEDrLyejQ=;
        b=Q1cUZOPy+c3Qv2kitf7FQaCM3am/oN9WY0rAni2nw4c0lBOOEF4td1E6MwnGUPiPNz
         2tyGh2rBa5l5OKfF+0hBuIRpJQoV5d4c0qOYilINXsZ9SjCwlNP0A5toxC1SZmhyHofR
         BgNb0+1SSZZju6s0dUo6mUzuD8rA3QJBTvZarwAE7ZuEXuGQlr2uqOVXuINtR95bUOCg
         CVs5dWONQr+ZGJ9RDauR3KvoPHa5UU3noIMWas8N+9i2PpdwlVfe97gRBJ/NRGorD50p
         tL2ZmQK2J9eVJwtnt5ldBfl/J2s+f8HiPyyBwmcx/3eDQTQb2vLxpScd7wVG6QUdjtBF
         pZlQ==
X-Gm-Message-State: AOAM531JQ9jIrR2wx+GuAPXqkcSbXkZMKQRmZCJemHAjMGJvcG+G1v7C
        ePBS3SxA4J+sTqe44bpNc1EdScY2dUc5pqT+diQ=
X-Google-Smtp-Source: ABdhPJwpU67ydgbUWC4eFE0ZdVvWGOdb52bXfmIoxXcCo4XTVy6Q6xdEMfdfHufKZF6/UyEem9eVeMSeYX5SMo5pEzw=
X-Received: by 2002:a67:6915:: with SMTP id e21mr19794869vsc.44.1627445114871;
 Tue, 27 Jul 2021 21:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210727152026.31019-1-sergio.paracuellos@gmail.com>
 <20210727152026.31019-2-sergio.paracuellos@gmail.com> <CADtm3G5vMnFzxZV2hijZ3daVOgJ=0MnMJmkLyxe0+bNew5g_TA@mail.gmail.com>
In-Reply-To: <CADtm3G5vMnFzxZV2hijZ3daVOgJ=0MnMJmkLyxe0+bNew5g_TA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Wed, 28 Jul 2021 06:05:03 +0200
Message-ID: <CAMhs-H-cXSAEBqLehdJ0vGEUYiH2pcnSs06hMhLQ=10Cg4m+Hw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip banks per device
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

On Wed, Jul 28, 2021 at 1:15 AM Gregory Fong <gregory.0xf0@gmail.com> wrote:
>
> On Tue, Jul 27, 2021 at 8:20 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
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
> >
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> One minor comment below, then this looks great:
> Reviewed-by: Gregory Fong <gregory.0xf0@gmail.com>
>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/gpio/gpiolib.c      | 32 +++++++++++++++++++++++++++-----
> >  include/linux/gpio/driver.h |  4 ++++
> >  2 files changed, 31 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 27c07108496d..84ed4b73fa3e 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -382,10 +382,18 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> >         if (count < 0)
> >                 return 0;
> >
> > -       if (count > gdev->ngpio) {
> > -               dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
> > -                        count, gdev->ngpio);
> > -               count = gdev->ngpio;
> > +       /*
> > +        * When offset is set in the driver side we assume the driver internally
> > +        * is using more than one gpiochip per the same device. We have to stop
> > +        * setting friendly names if the specified ones with 'gpio-line-names'
> > +        * are less than the offset in the device itself. This means all the
> > +        * lines are not present for every single pin within all the internal
> > +        * gpiochips.
> > +        */
> > +       if (count <= chip->offset) {
> > +               dev_warn(&gdev->dev, "gpio-line-names too short (length %d) cannot map names for the gpiochip at offset %u\n",
>
> nit: there should be some punctuation after "(length %d)", otherwise
> with parentheticals removed it reads as
>
> "gpio-line-names too short cannot map names ..."
>
> but we need to provide a space between these thoughts for clarity.  A
> comma should be ok:
>
> "gpio-line-names too short (length %d), cannot map names ..."

Will add it, thanks.

Best regards,
     Sergio Paracuellos
>
> Best regards,
> Gregory
