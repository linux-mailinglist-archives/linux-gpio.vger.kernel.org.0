Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3EF3C30EB
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 12:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbfJAKIT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 06:08:19 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45582 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729841AbfJAKIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 06:08:19 -0400
Received: by mail-io1-f66.google.com with SMTP id c25so46303137iot.12
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2019 03:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PCxtfAg7LQABNfQBmGvWyBnE0MIvZ9FE/UUpYIrkUsg=;
        b=st4uDrWBkbHI/n/CZLaVegn/+UUPUzZ703FSR/odeNsoAv9lh3hyCKj/52gBqY/gWZ
         QxfnZJX0pu2d116yfS7PM9sVxJOdzvdJWItEG7pgRW0v85Wu525NHVL4DLaelLAWkAIM
         /YypkZ63p/MkEmmalgLOJmTMpTus8fTnU3yKc6iWUeml3UK3HAfU2DxdwjmXqI1YS9sM
         7xd6QrvXDaMgmWqfi4l2FbfAZ8V5mA5Kgb9iLfznmsRwQmKv5Q1nX/Vri+ZXBqucJ4x4
         ndDjbv6iMoKMo2h4Ty3auRUcajUk4ZpT08mweqfoTmqfwXUtfTI1tVCpuF7MrysvpViQ
         Wrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PCxtfAg7LQABNfQBmGvWyBnE0MIvZ9FE/UUpYIrkUsg=;
        b=nYgrVr51b5KAaeB3PJd9XSSVAcFlOwteb9OrSd71FfsXUij/VvX8ZN9ymXv2Yjz4lK
         RQ1R2o/oKFDPxFpKSlTP4EvlXsnDYAmRifgY86aUrbcKBJiAav7DccjBsSRkURzK7Poi
         mGBC/tTg6o61LPEkn4nm1lByGETK1lMw8OWVlDi097z7yD15nYcs5chLqSRKJnWv0QMw
         /FFMrNlgYiWx29gexur1KKSrSKSSUouCGEevdDXxm9/gIPWuAMC8D9+L2besT4G2Jl+m
         oDB6HtDqcengEpMMIvCwWtp6O6KEXj5Z3Jz8ihnQxrmA5N5OtQd3kbXWClq3VVI2GeEF
         N5kQ==
X-Gm-Message-State: APjAAAWkp7i0B7wEiK5gwV9NMqclPsIrct/bisd5c8XjdPhv8TBJlENr
        Iu9jv2hF4MDzmk4D13WhjSreqeRM1K2vWDUO5tWFXFZR
X-Google-Smtp-Source: APXvYqwYNV6m5Ou5z7joqOfKbAulc7VeKAz0Iyck67kDyRYHyxNjNIXkaVyG+RQpxLMtixf6hAXcCUNCICVH7D/whVY=
X-Received: by 2002:a92:d2d2:: with SMTP id w18mr24163782ilg.220.1569924497887;
 Tue, 01 Oct 2019 03:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190916094623.12125-1-brgl@bgdev.pl>
In-Reply-To: <20190916094623.12125-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 1 Oct 2019 12:08:06 +0200
Message-ID: <CAMRc=MdrWRgGAdHdKKo2T=A4+Q0+kxwRgLSx+xWurnn9qD0yMA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: sanitize flags before allocating memory in lineevent_create()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 16 wrz 2019 o 11:46 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Move all the flags sanitization before any memory allocation in
> lineevent_create() in order to remove a couple unneeded gotos.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 42 ++++++++++++++++++------------------------
>  1 file changed, 18 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d9074191edef..194b0bcdcfb7 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -899,6 +899,24 @@ static int lineevent_create(struct gpio_device *gdev=
, void __user *ip)
>
>         if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
>                 return -EFAULT;
> +
> +       offset =3D eventreq.lineoffset;
> +       lflags =3D eventreq.handleflags;
> +       eflags =3D eventreq.eventflags;
> +
> +       if (offset >=3D gdev->ngpio)
> +               return -EINVAL;
> +
> +       /* Return an error if a unknown flag is set */
> +       if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
> +           (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS))
> +               return -EINVAL;
> +
> +       /* This is just wrong: we don't look for events on output lines *=
/
> +       if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
> +           (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> +           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
> +               return -EINVAL;
>
>         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
>         if (!le)
> @@ -917,30 +935,6 @@ static int lineevent_create(struct gpio_device *gdev=
, void __user *ip)
>                 }
>         }
>
> -       offset =3D eventreq.lineoffset;
> -       lflags =3D eventreq.handleflags;
> -       eflags =3D eventreq.eventflags;
> -
> -       if (offset >=3D gdev->ngpio) {
> -               ret =3D -EINVAL;
> -               goto out_free_label;
> -       }
> -
> -       /* Return an error if a unknown flag is set */
> -       if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
> -           (eflags & ~GPIOEVENT_REQUEST_VALID_FLAGS)) {
> -               ret =3D -EINVAL;
> -               goto out_free_label;
> -       }
> -
> -       /* This is just wrong: we don't look for events on output lines *=
/
> -       if ((lflags & GPIOHANDLE_REQUEST_OUTPUT) ||
> -           (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> -           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)) {
> -               ret =3D -EINVAL;
> -               goto out_free_label;
> -       }
> -
>         desc =3D &gdev->descs[offset];
>         ret =3D gpiod_request(desc, le->label);
>         if (ret)
> --
> 2.21.0
>

Patch applied.

Bart
