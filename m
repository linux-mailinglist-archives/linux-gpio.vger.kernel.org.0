Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 701C2AD3EB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 09:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388211AbfIIHcJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 03:32:09 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34032 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388209AbfIIHcI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2019 03:32:08 -0400
Received: by mail-io1-f68.google.com with SMTP id k13so11167324ioj.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Sep 2019 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LGrKmYRw35toj9rrH4FiEbc1loHvt62mN4GNxB9nt+w=;
        b=ZPCd4P/1gOrszCd/7ctKeyNf4hWx/7Mwse3OnYY2CkrwCQPt+iBkuDPutiE8Tzofxx
         Y5U85v53Pp68snw8lRF1QzZrqkmYGSdA/cuSKoaTtwNtMB7n8BrSIHKsrrWCJnLVy5CW
         Cj052VLoArFxSPi1VhsUFIXszpqLb9pBMvWi4CF/ZtwOqWGNLpqFWULRpvwsC5cM1LEV
         9aZPbn74dQs6pb7ZirR2lhI0bKjArUIlLBOXlubn3wV6QXTgLus+PDWlxnBQfJ9R5Ziw
         otllpzC0nKZLm5dR1KkrLgmRm0Df6OKrRrm+QxwWDf/E9Rg3Eah7f3C4CG89X/55947p
         +JKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LGrKmYRw35toj9rrH4FiEbc1loHvt62mN4GNxB9nt+w=;
        b=ZD8NXHHTS//NW3KzGiiO/6BB3XGwTMao9QYB84oX4BQY6ZFSR82JqKOoLnp8LYHV7/
         YK0CgEXw1IhjESStO3PXQYANaQnvCyUDgAVuG8IfvsI04w7EDF7UiZO/T+9hfbzoXHsy
         sbmOmU9is7DtTgmYWtkiIpLNzwOQijUhrPpxXzyg+iqcXDpcBgiWXtIybBKUYCCOKT7i
         zj1BgErY9agfVzspy3YbLytrxaTZ02+mTij+sSxVBKjwy0twOvKCf/e42DHO3z/cZW19
         jEVB5MaoQ8h/lZ6g0RzP2qRoeTGkHsGd4LSlL5fbSZDCciGEM5kiedyAWk9a6jEx+HS6
         ELKg==
X-Gm-Message-State: APjAAAVcV2QIvzL8kRjGsrQm01OQ2n3J/y8Jt9Vl3mZp6uH4R1Zh/QHb
        g5tpKPBAfHOzwXlaKUMhApRMXS3ApjJn0B+JCUi39/hg
X-Google-Smtp-Source: APXvYqyIw8kRh1tDtnHvU4PrlfeyCBghDxIC9LoSL3pE/db+Y5sm+WGCHTlgdPU4wY1gfWF1kTz/G4hP6OrVR7zZrlQ=
X-Received: by 2002:a5d:9a18:: with SMTP id s24mr1474248iol.40.1568014326005;
 Mon, 09 Sep 2019 00:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190909032406.1952-1-warthog618@gmail.com>
In-Reply-To: <20190909032406.1952-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Sep 2019 09:31:55 +0200
Message-ID: <CAMRc=McNhsJ1r_uKCsL_1dLyrm2FoGxcs-1yBfs-SpBdKBFggw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix line flag validation in lineevent_create
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 9 wrz 2019 o 05:24 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>

Hi Kent,

thanks for spotting this. Just single nit below:

> lineevent_create should not allow any of GPIOHANDLE_REQUEST_OUTPUT,
> GPIOHANDLE_REQUEST_OPEN_DRAIN or GPIOHANDLE_REQUEST_OPEN_SOURCE to be set=
.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index cca749010cd0..5499ec7bc783 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -918,7 +918,7 @@ static int lineevent_create(struct gpio_device *gdev,=
 void __user *ip)
>                 goto out_free_label;
>         }
>
> -       /* Return an error if a unknown flag is set */
> +       /* Return an error if an unknown flag is set */

Please don't sneak in changes unrelated to the patch. If you want to
fix the typo - do it in a separate one.

>         if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
>             (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS)) {
>                 ret =3D -EINVAL;
> @@ -926,7 +926,9 @@ static int lineevent_create(struct gpio_device *gdev,=
 void __user *ip)
>         }
>
>         /* This is just wrong: we don't look for events on output lines *=
/
> -       if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
> +       if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
> +           (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> +           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)) {
>                 ret =3D -EINVAL;
>                 goto out_free_label;
>         }
> @@ -940,10 +942,6 @@ static int lineevent_create(struct gpio_device *gdev=
, void __user *ip)
>
>         if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
>                 set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> -       if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
> -               set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> -       if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
> -               set_bit(FLAG_OPEN_SOURCE, &desc->flags);
>
>         ret =3D gpiod_direction_input(desc);
>         if (ret)
> --
> 2.23.0
>
