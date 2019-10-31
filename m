Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4DAEEAADE
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 08:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbfJaHLN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 03:11:13 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46904 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfJaHLN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 03:11:13 -0400
Received: by mail-oi1-f195.google.com with SMTP id c2so4261146oic.13
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 00:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kvwpnK0xYMVJG8q2IUAIuhIq2977PzZ3j2aspgO5DR8=;
        b=kcSMisAIZoHPDYDuebzLm6H6juNsdqvcePDqNSUu4Zj6lP8zJtQzx+T95Pz6pvg0hf
         3wl1SJ/SUzXy+5oVb1A7SCN0CHjrFSyt8pV30MN+ns/PJtPM2nqT5nUUNf9beoRZtpmk
         +6m1tPj90OmdXNu4gxCA7y/it3O3tYApU9K58QTR9Q5HFKK9aCmdCt0IZgyHoXcWXGkK
         IarSuYKsNDVd1hZh2Bq+7+XSLyzU5gr9ypE2/2Zl7XPwts7Ul8XTjStJfz2U+FSk523Q
         1Jo4wGNBykOE3LCCAkHAVoO3xX9WST+SmIchHxVLNmikIDbInlKjETBnKtQgEr7BONtX
         F0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kvwpnK0xYMVJG8q2IUAIuhIq2977PzZ3j2aspgO5DR8=;
        b=Pq1gP8gbYeNjcLkQjaRmgcgZQ0yJD9MSNjF9MK4vdSshPRobZQrtcbjDRD+InOr512
         8LRTeNbqEKy8L9OCUFXz11RqqCXo0VQ1xq7I+I5ZZn7cZThh2Cqkc+Gcq5DURlgO5NBi
         e7W9fQ28MvMD2Z3WJp5fsyt7N2KNXwajL9n6IyzD9TdV7T3tyIbQmO74pHI/Baisg0cP
         AnMyebmCFi51xZHGG1CDvPXxDYkTW14sJ6aH5WxMkkVsYQEEw+zkVugKiYSUVcOBFNLd
         AOnwK3qJrU4E/CKtp5Lg/I8ZTZzh9tsrvy3kSKbFge2AvlPelUpicL2qrHcjf4Q0/4LT
         +DZQ==
X-Gm-Message-State: APjAAAVmm91o3SKYm5QFCSZU5n8A2k8XXURwdwziZGUDx8a2hJNUqCYw
        JmOLAj0OUgkEie1m097dPdF2lxKctwW9SuM93aBMCw==
X-Google-Smtp-Source: APXvYqzyNUr9BlBPkL/BIHsj56asw3dmZmmCvcShu0+R3uKXpbkSzZLD0Yysfe6OSXLmXkBUI073RojUA2xFd+x1SRU=
X-Received: by 2002:aca:cc11:: with SMTP id c17mr2867272oig.147.1572505871402;
 Thu, 31 Oct 2019 00:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191028073912.25743-1-warthog618@gmail.com>
In-Reply-To: <20191028073912.25743-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 31 Oct 2019 08:11:00 +0100
Message-ID: <CAMpxmJWb=6QQqMWNsDTJKMEr=cd8h1pq+zewc16cFfosFRwmDQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: add new SET_CONFIG ioctl() to gpio chardev
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 28 pa=C5=BA 2019 o 08:39 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> Add the GPIOHANDLE_SET_CONFIG_IOCTL to the gpio chardev.
> The ioctl allows some of the configuration of a requested handle to be
> changed without having to release the line.
> The primary use case is the changing of direction for bi-directional
> lines.
>
> Based on initial work by Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> The patch is against Bart's gpio/for-next branch[1] with v4 of my bias
> patch series "gpio: expose line bias flags to userspace" applied.
> This is necessary to support setting of the bias flags introduced
> there.
>
> The patch has been successfully tested against gpio-mockup using the
> feature/pud_set_config branch of my Go gpiod library[2], as libgpiod has
> not yet been updated with the uAPI change.
>
>  drivers/gpio/gpiolib.c    | 163 ++++++++++++++++++++++++++------------
>  include/uapi/linux/gpio.h |  18 +++++
>  2 files changed, 132 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index df27f05f9b8d..62a74e27ad02 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -427,23 +427,74 @@ struct linehandle_state {
>         GPIOHANDLE_REQUEST_OPEN_DRAIN | \
>         GPIOHANDLE_REQUEST_OPEN_SOURCE)
>
> +static int linehandle_validate_flags(u32 flags)
> +{
> +       /* Return an error if an unknown flag is set */
> +       if (flags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
> +               return -EINVAL;
> +
> +       /*
> +        * Do not allow both INPUT & OUTPUT flags to be set as they are
> +        * contradictory.
> +        */
> +       if ((flags & GPIOHANDLE_REQUEST_INPUT) &&
> +           (flags & GPIOHANDLE_REQUEST_OUTPUT))
> +               return -EINVAL;
> +
> +       /*
> +        * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single reques=
t. If
> +        * the hardware actually supports enabling both at the same time =
the
> +        * electrical result would be disastrous.
> +        */
> +       if ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
> +           (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
> +               return -EINVAL;
> +
> +       /* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mo=
de. */
> +       if (!(flags & GPIOHANDLE_REQUEST_OUTPUT) &&
> +           ((flags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> +            (flags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
> +               return -EINVAL;
> +
> +       /* Bias flags only allowed for input or output mode. */
> +       if (!((flags & GPIOHANDLE_REQUEST_INPUT) ||
> +             (flags & GPIOHANDLE_REQUEST_OUTPUT)) &&
> +           ((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
> +            (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
> +            (flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
> +               return -EINVAL;
> +
> +       /* Only one bias flag can be set. */
> +       if (((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
> +            (flags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
> +                       GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
> +           ((flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
> +            (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +

This is great but I'd prefer that it be put into a separate patch with
its own description that would come before the other changes.

>  static long linehandle_ioctl(struct file *filep, unsigned int cmd,
>                              unsigned long arg)
>  {
>         struct linehandle_state *lh =3D filep->private_data;
>         void __user *ip =3D (void __user *)arg;
>         struct gpiohandle_data ghd;
> +       struct gpiohandle_config gcnf;
> +       struct gpio_desc *desc;
>         DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
> -       int i;
> +       int i, ret;
> +       u32 lflags;
>
>         if (cmd =3D=3D GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
>                 /* NOTE: It's ok to read values of output lines. */
> -               int ret =3D gpiod_get_array_value_complex(false,
> -                                                       true,
> -                                                       lh->numdescs,
> -                                                       lh->descs,
> -                                                       NULL,
> -                                                       vals);
> +               ret =3D gpiod_get_array_value_complex(false,
> +                                                   true,
> +                                                   lh->numdescs,
> +                                                   lh->descs,
> +                                                   NULL,
> +                                                   vals);
>                 if (ret)
>                         return ret;
>
> @@ -477,6 +528,59 @@ static long linehandle_ioctl(struct file *filep, uns=
igned int cmd,
>                                               lh->descs,
>                                               NULL,
>                                               vals);
> +       } else if (cmd =3D=3D GPIOHANDLE_SET_CONFIG_IOCTL) {
> +               if (copy_from_user(&gcnf, ip, sizeof(gcnf)))
> +                       return -EFAULT;
> +
> +               lflags =3D gcnf.flags;
> +               ret =3D linehandle_validate_flags(lflags);
> +               if (ret)
> +                       return ret;
> +
> +               for (i =3D 0; i < lh->numdescs; i++) {
> +                       desc =3D lh->descs[i];
> +                       if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
> +                               set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +                       else
> +                               clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +                       if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
> +                               set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> +                       else
> +                               clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
> +                       if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
> +                               set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> +                       else
> +                               clear_bit(FLAG_OPEN_SOURCE, &desc->flags)=
;
> +                       if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
> +                               set_bit(FLAG_PULL_UP, &desc->flags);
> +                       else
> +                               clear_bit(FLAG_PULL_UP, &desc->flags);
> +                       if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
> +                               set_bit(FLAG_PULL_DOWN, &desc->flags);
> +                       else
> +                               clear_bit(FLAG_PULL_DOWN, &desc->flags);
> +                       if (lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE)
> +                               set_bit(FLAG_BIAS_DISABLE, &desc->flags);
> +                       else
> +                               clear_bit(FLAG_BIAS_DISABLE, &desc->flags=
);

Could you add some new lines between the if elses? I think it'll be
more readable.

> +
> +                       /*
> +                        * Lines have to be requested explicitly for inpu=
t
> +                        * or output, else the line will be treated "as i=
s".
> +                        */
> +                       if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
> +                               int val =3D !!gcnf.default_values[i];
> +
> +                               ret =3D gpiod_direction_output(desc, val)=
;
> +                               if (ret)
> +                                       return ret;
> +                       } else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
> +                               ret =3D gpiod_direction_input(desc);
> +                               if (ret)
> +                                       return ret;
> +                       }
> +               }
> +               return 0;
>         }
>         return -EINVAL;
>  }
> @@ -528,48 +632,9 @@ static int linehandle_create(struct gpio_device *gde=
v, void __user *ip)
>
>         lflags =3D handlereq.flags;
>
> -       /* Return an error if an unknown flag is set */
> -       if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
> -               return -EINVAL;
> -
> -       /*
> -        * Do not allow both INPUT & OUTPUT flags to be set as they are
> -        * contradictory.
> -        */
> -       if ((lflags & GPIOHANDLE_REQUEST_INPUT) &&
> -           (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> -               return -EINVAL;
> -
> -       /*
> -        * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single reques=
t. If
> -        * the hardware actually supports enabling both at the same time =
the
> -        * electrical result would be disastrous.
> -        */
> -       if ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
> -           (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
> -               return -EINVAL;
> -
> -       /* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mo=
de. */
> -       if (!(lflags & GPIOHANDLE_REQUEST_OUTPUT) &&
> -           ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
> -            (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
> -               return -EINVAL;
> -
> -       /* Bias flags only allowed for input or output mode. */
> -       if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
> -             (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
> -           ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
> -            (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
> -            (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
> -               return -EINVAL;
> -
> -       /* Only one bias flag can be set. */
> -       if (((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
> -            (lflags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
> -                       GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
> -           ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
> -            (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
> -               return -EINVAL;
> +       ret =3D linehandle_validate_flags(lflags);
> +       if (ret)
> +               return ret;
>
>         lh =3D kzalloc(sizeof(*lh), GFP_KERNEL);
>         if (!lh)
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 7cc21c3b0839..799cf823d493 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -100,6 +100,24 @@ struct gpiohandle_request {
>         int fd;
>  };
>
> +/**
> + * struct gpiohandle_config - Configuration for a GPIO handle request
> + * @flags: updated flags for the requested GPIO lines, such as
> + * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
> + * together
> + * @default_values: if the GPIOHANDLE_REQUEST_OUTPUT is set in flags,
> + * this specifies the default output value, should be 0 (low) or
> + * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
> + * @padding: reserved for future use and should be zero filled
> + */
> +struct gpiohandle_config {
> +       __u32 flags;
> +       __u8 default_values[GPIOHANDLES_MAX];
> +       __u32 padding[4]; /* padding for future use */
> +};
> +
> +#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_=
config)
> +
>  /**
>   * struct gpiohandle_data - Information of values on a GPIO handle
>   * @values: when getting the state of lines this contains the current
> --
> 2.23.0
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> [2] https://github.com/warthog618/gpiod.git

Bart
