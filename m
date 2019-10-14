Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 923F0D62A3
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 14:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbfJNMfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 08:35:51 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45935 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfJNMfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 08:35:51 -0400
Received: by mail-io1-f65.google.com with SMTP id c25so37431488iot.12
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HlcGnY4YLYk3Lqh+gE9Jv8XUpCMvj9mtRuo2xnM6qFo=;
        b=AQlCe/Yx80d1SvzoCfallkzRqWTl0d+x9wqBOTI6e0AyVcPJ2T5Dcj4HVVDutDOw0g
         msuvgUd37PscgUqAx4cjEzgnQBCpcR2G24RElGsYWAV6G8CdMITz3velMfx0xTBnZyjH
         IGQHH8GQETLtWdNJQ4TrO86F+9LNTxX89odYqO/D+dcwmE/sy+VJPUMtBtvNFY3Mjbju
         o+9g5AZWNEUFJxcpBiBJ1HbNQRp5wdiAyzX23xK9d/jevxcRSNo1HdIjMLlIxAbYgvZ+
         w+uQBvceOFJ4c/lVzI0VuGRO2aW4404stFwZqpkJTJzzTfjvV7ySNn7gq5L0dYhYuiuX
         AaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HlcGnY4YLYk3Lqh+gE9Jv8XUpCMvj9mtRuo2xnM6qFo=;
        b=rpuvC5FMNzbUpFrS6OtNojnz1kVs6y0woDt5cTaSHKBPaNePHaDm8jluZnfk1Wsx1b
         midVm2Lz5uAeG9vfPEhERsZMmEqDQI/T9bVDpdlWcZg/vYd0X2MfHBGnE4A48wugTPER
         J/LuytQVlVDv9esQBbGtMOHFEMW9GUndiARLav+4Vh0g8DD29VuJ1vDNTs6oL7hWEVQ7
         qJq/P0aTQJiGzTfPRba6PS0Yzpng/o0IhNz0AlJHW8veMTCEY0bN2NRTUWcolEqHhPx7
         OxXhnW26rKMaQoHyp1ZaWyIYb8MTkmN3gYqf+HgrtYGYEkLC7CCzxVpRtJTCT3vNosz4
         RlyQ==
X-Gm-Message-State: APjAAAXoWuss6IjRxz31iWpKATWnFVSCu1HnPGm4iE7hWfPaKJBoM+q7
        erB8ZJPTl5cerHXX+yLdrmPhlGsqZE8ExZvp9Ad5IA==
X-Google-Smtp-Source: APXvYqzmWk4iFpGVHTBgG8K+9sOadrOPlUsuF/9wnwTukPt35SFeNcNazgtIfIUr6OzTa34X5kuNPqtMYyqwvGWwi0M=
X-Received: by 2002:a02:6309:: with SMTP id j9mr38272504jac.136.1571056549524;
 Mon, 14 Oct 2019 05:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-3-warthog618@gmail.com>
In-Reply-To: <20191012015628.9604-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Oct 2019 14:35:38 +0200
Message-ID: <CAMRc=McVXbZHbRATN9A6ffDgjB8Bc=gGRYLpbfeqzrNLVeNReg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpiolib: add support for pull up/down to lineevent_create
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

sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> This patch adds support for pull up/down to lineevent_create.
> Use cases include receiving asynchronous presses from a
> push button without an external pull up/down.
>
> Move all the flags sanitization before any memory allocation in
> lineevent_create() in order to remove a couple unneeded gotos.
> (from Bartosz Golaszewski <bgolaszewski@baylibre.com>)
>

The patch you pulled in into your commit already sits in my for-next branch=
.
I didn't know you would be modifying the code I touched earlier. In this ca=
se
you can rebase the series on top of gpio/for-next from my tree[1]

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 60 +++++++++++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9d2a5e2f6e77..053847b6187f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -905,6 +905,38 @@ static int lineevent_create(struct gpio_device *gdev=
, void __user *ip)
>         if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
>                 return -EFAULT;
>
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
> +
> +       /* PULL_UP and PULL_DOWN flags only make sense for input mode. */
> +       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> +           ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
> +            (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> +               return -EINVAL;
> +
> +       /*
> +        * Do not allow both pull-up and pull-down flags to be set as the=
y
> +        *  are contradictory.
> +        */
> +       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> +           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> +               return -EINVAL;
> +
>         le =3D kzalloc(sizeof(*le), GFP_KERNEL);
>         if (!le)
>                 return -ENOMEM;
> @@ -922,30 +954,6 @@ static int lineevent_create(struct gpio_device *gdev=
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
> @@ -955,6 +963,10 @@ static int lineevent_create(struct gpio_device *gdev=
, void __user *ip)
>
>         if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
>                 set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +       if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
> +               set_bit(FLAG_PULL_DOWN, &desc->flags);
> +       if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
> +               set_bit(FLAG_PULL_UP, &desc->flags);
>

Correct me if I'm wrong but this looks like it should be part of
Drew's patch (1/6) in this series right? You can modify it and add
your Signed-off-by tag. In fact your Signed-off-by is needed anyway if
you're sending someone else's patches.

>         ret =3D gpiod_direction_input(desc);
>         if (ret)
> --
> 2.23.0
>

Bart

[1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/
