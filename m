Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19609BAFBF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 10:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbfIWIi4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 04:38:56 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41334 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729373AbfIWIi4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 04:38:56 -0400
Received: by mail-io1-f65.google.com with SMTP id r26so31355805ioh.8
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2019 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z66RdQZHaR+LFy+7u3wSKlBb2kvT7TR/msSi0TmhaO8=;
        b=GSDf8XcZcj/M0eCtxhIR1y0CuHqRDf8/vYNi6vC6QDKqw2umXbrQTytViDT5lcn1K1
         f2uQeQ96ORPwLevtzwj6iEyQSk58O8ESuhUs3fiQKEhSqYBwWR6niVbH8mjV2uvJSIJf
         OHRsxS8elhcUkT8Kg98Egcr+VTMd+8FPjpLfhT2FjKurSJiOZURPB0Ens+U8PAPpTljq
         Cw/zyJF49blxSLuUKsmzrhTEEg8ICbS3eIRGx/8DmaLmOro1bRXxRd+1c2AzEAyG7UAB
         cvGiEGOXEPek61X8ylRgfBGtUla6Dwlofgl8MiV+k5CP3WXpAaBlZL9AxDRca0CFSYYB
         63TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z66RdQZHaR+LFy+7u3wSKlBb2kvT7TR/msSi0TmhaO8=;
        b=mxV/LRC4SNfR8/72kaiIr7wkIyZqwNZE2plq0KeuxfzOyO99oulVVMcElKHI8hpA9q
         rUIQcxLRIi6BWOl7wEgSAhZZw7MxHjwl59Nj85r9yisUIaObVMUmIkstNrd/n7jhYYSz
         xrWzl0q6lv7rbvQhrXZoYn3FVzKto03aerPlo9HkZKnpNl8nc9iRQXHTwN3Oebdl8TKG
         Zrv2g+PywL2kMZBahLEigOlH6tF3wcAR0SUATsh+0SwHk3pzzYRAenpkfSQMiK/1qAAs
         EXZr98yWKkf96YjuvVPFatfP91+EgYcs4yux2/hdpbT1IgK7XbAIwiepuxbjfThwuQQL
         leYw==
X-Gm-Message-State: APjAAAWLV50vP9HnVBwIplLOo6gce6FaCCno0JfXL8PkJXBaS9vc80BA
        lMUwPvBYCCfOFwC2ZaBxN3MqQm4qhmFTjyI+x0uo3w==
X-Google-Smtp-Source: APXvYqwommw18/whlR1YCZCLlPve/5YQoTF9NQaaC3N+EQmJx3oAfamEJfaE1y1bv0X2KE/IbHs7nousAls/iRtZYQg=
X-Received: by 2002:a05:6638:5ba:: with SMTP id b26mr32886006jar.57.1569227934765;
 Mon, 23 Sep 2019 01:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com>
In-Reply-To: <20190921102522.8970-1-drew@pdp7.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Sep 2019 10:38:44 +0200
Message-ID: <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Drew Fustini <drew@pdp7.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 21 wrz 2019 o 12:27 Drew Fustini <drew@pdp7.com> napisa=C5=82(a):
>
> Add pull-up/pull-down flags to the gpio line get and
> set ioctl() calls.  Use cases include a push button
> that does not have an external resistor.
>
> Addition use cases described by Limor Fried (ladyada) of
> Adafruit in this PR for Adafruit_Blinka Python lib:
> https://github.com/adafruit/Adafruit_Blinka/pull/59
>
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  drivers/gpio/gpiolib.c    | 12 ++++++++++++
>  include/uapi/linux/gpio.h |  4 ++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d9074191edef..9da1093cc7f5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -427,6 +427,8 @@ struct linehandle_state {
>         (GPIOHANDLE_REQUEST_INPUT | \
>         GPIOHANDLE_REQUEST_OUTPUT | \
>         GPIOHANDLE_REQUEST_ACTIVE_LOW | \
> +       GPIOHANDLE_REQUEST_PULL_UP | \
> +       GPIOHANDLE_REQUEST_PULL_DOWN | \
>         GPIOHANDLE_REQUEST_OPEN_DRAIN | \
>         GPIOHANDLE_REQUEST_OPEN_SOURCE)
>
> @@ -598,6 +600,10 @@ static int linehandle_create(struct gpio_device *gde=
v, void __user *ip)
>                         set_bit(FLAG_OPEN_DRAIN, &desc->flags);
>                 if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
>                         set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> +               if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
> +                       set_bit(FLAG_PULL_DOWN, &desc->flags);
> +               if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
> +                       set_bit(FLAG_PULL_UP, &desc->flags);
>
>                 ret =3D gpiod_set_transitory(desc, false);
>                 if (ret < 0)
> @@ -1102,6 +1108,10 @@ static long gpio_ioctl(struct file *filp, unsigned=
 int cmd, unsigned long arg)
>                 if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
>                         lineinfo.flags |=3D (GPIOLINE_FLAG_OPEN_SOURCE |
>                                            GPIOLINE_FLAG_IS_OUT);
> +               if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> +                       lineinfo.flags |=3D GPIOLINE_FLAG_PULL_DOWN;
> +               if (test_bit(FLAG_PULL_UP, &desc->flags))
> +                       lineinfo.flags |=3D GPIOLINE_FLAG_PULL_UP;
>
>                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>                         return -EFAULT;
> @@ -2475,6 +2485,8 @@ static bool gpiod_free_commit(struct gpio_desc *des=
c)
>                 clear_bit(FLAG_REQUESTED, &desc->flags);
>                 clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
>                 clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
> +               clear_bit(FLAG_PULL_UP, &desc->flags);
> +               clear_bit(FLAG_PULL_DOWN, &desc->flags);
>                 clear_bit(FLAG_IS_HOGGED, &desc->flags);
>                 ret =3D true;
>         }
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 4ebfe0ac6c5b..c2d1f7d908d6 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -33,6 +33,8 @@ struct gpiochip_info {
>  #define GPIOLINE_FLAG_ACTIVE_LOW       (1UL << 2)
>  #define GPIOLINE_FLAG_OPEN_DRAIN       (1UL << 3)
>  #define GPIOLINE_FLAG_OPEN_SOURCE      (1UL << 4)
> +#define GPIOLINE_FLAG_PULL_UP  (1UL << 5)
> +#define GPIOLINE_FLAG_PULL_DOWN        (1UL << 6)
>
>  /**
>   * struct gpioline_info - Information about a certain GPIO line
> @@ -62,6 +64,8 @@ struct gpioline_info {
>  #define GPIOHANDLE_REQUEST_ACTIVE_LOW  (1UL << 2)
>  #define GPIOHANDLE_REQUEST_OPEN_DRAIN  (1UL << 3)
>  #define GPIOHANDLE_REQUEST_OPEN_SOURCE (1UL << 4)
> +#define GPIOHANDLE_REQUEST_PULL_UP     (1UL << 5)
> +#define GPIOHANDLE_REQUEST_PULL_DOWN   (1UL << 6)
>
>  /**
>   * struct gpiohandle_request - Information about a GPIO handle request
> --
> 2.20.1
>

Hi Drew,

I remember discussing it with Linus some time ago. This may not be as
straightforward as simply adding new flags. Since PULL-UP/DOWN
resistors can - among other parameters - also have configurable
resistance, we'll probably need some kind of a structure for this
ioctl() to pass any additional information to the kernel. Since we
can't change ABI this may require adding a whole new ioctl() for
extended configuration. This in turn has to be as future-proof as
possible - if someone asks for user-space-configurable drive-strength,
the new ioctl() should be ready for it.

I should have some bandwidth in the coming days, so I'll try to give it a t=
ry.

Bart
