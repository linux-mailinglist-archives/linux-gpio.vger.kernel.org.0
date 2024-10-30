Return-Path: <linux-gpio+bounces-12321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A459B6D88
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 21:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B93F1F20D22
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 20:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40491E4908;
	Wed, 30 Oct 2024 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FJqNFXy1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4071D0F74
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730319663; cv=none; b=mjvXV2yQ0hSnI1jkIFWilMKaLl+1l0APaq7AeYo4QxxjvmYYQFoLlTGqRnDnw5esv5qMIWZiyNnYwyuIw8BLVnWop6EerejH0fQut2WJSN25XRJyyPoJ98KM0uFvh67wqpSYfI5KJHTNZ8VuRFhgps/Q8WWhYd588XRwFe/ynNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730319663; c=relaxed/simple;
	bh=QQRhXpuiMT+Kilj5Hw1Rx6l+gTjEZ68hhbyrFkDjkvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZJShTJkBjyIJe7q/jh2XY5DyNO2GmUoOMqPw5HwaNe2necZ6+MvJGulUxe2KkF4tu/zWX+FL+8C6g9Bj08FuGfZdTSRF+m5RiaizDvf5eOsR71bLzQcUCogoo9+Pz8JBRlX2Xfumv7uzdqkr9+rMub1q93Gc3Oug12p3a7hd14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FJqNFXy1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e13375d3so291893e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730319657; x=1730924457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UdUJ1HarHJn1WZ7E/yY6PE6GpxT0s81fgwEBhh+BH4=;
        b=FJqNFXy15qwmv9Mrr8w1X4exeh4c27rEzQvfjQSf6XhHlkOrSbn1LQ4h6AOlP7Zu7Q
         hz/PVy4Rek9t/ErhsP0dAxo/Pw8UPHtrzByKyYDuNU0ndE+ut5h9j8yJohjPUFrp5No4
         CY/vneC5Djj7w5A6oMMAjKthD26bX2Y8gudZxeKkr8a8s6alPfcVc+AIAYPawJbHQ/0P
         JU3gx1arSzQZVa7n6aArU1RGxoPDBAxoJHprnh0OdaytPk6WekCXdskKjwhS9X6LjZr1
         HsokWkUkSEqv3qUoMvyjFz4GYo3kxH2ARoV9XvgbXwA4+A4GWWSgzsgApfl2FEQZtn5e
         zHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730319657; x=1730924457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UdUJ1HarHJn1WZ7E/yY6PE6GpxT0s81fgwEBhh+BH4=;
        b=WhetsP/XKMZ75rlAmJphmVOhNI3pZ5oj5n3v4l3du8O2oGc3na9ZHxSDB5AsQvuvWw
         1sZ0gIfCnvo4d/dQxBvIzw12OnPium76av2g428P+F9iuYk2lAkBZdm5B1nXhNCwLjWY
         IabdaVOBYi6ad33G1Vv//e925MqVGJftUHrriFaGyBwZxHzTmc1JeglBGXsijc0lhL/6
         DRrumyenLf0mvqXn/hac3EnSIwxD3yQC7lGKNocsnowAjuHB/7keIJ7ienFb2cgaQj+H
         uyyFlgLaL+AZ2kVcagBh7sucXlPzBdiHyqCihcMvJf7F2DW2DSmQh3QkaTovG5eAAHv0
         tceg==
X-Forwarded-Encrypted: i=1; AJvYcCUHoD+JLjrTgpBeVJiO8A33Y0mdfLhfl2XlX9Ctl5nPpxKp9One4zU5nGOyj9YQ0YsAeYoK/37bX9kd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2DD1ckjETW+EqS5fpQM5mHZAAABaIazQiC7/0F+IG5Kq5c0zL
	xrLfZ0uIrP0o1up4fi37ls5ReFJrBtEWU/1LRbrPi6Gqien1jgJ2G7iIMRMpTSDymNsGUBt7/s7
	dtDl7/CwNqEA7drH2DhIr4en4E883pmGCFTvUtg==
X-Google-Smtp-Source: AGHT+IHE5t34lQ/TJfFSkZ4O2EczePoP9pYLm0/rR3+rIL3etHSyZdnUbpS95AHX3qmTney8e/DDfhne2K7wS8xuqsI=
X-Received: by 2002:a05:6512:ac3:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-53c79e15746mr525773e87.5.1730319657020; Wed, 30 Oct 2024
 13:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028134454.1156852-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241028134454.1156852-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Oct 2024 21:20:45 +0100
Message-ID: <CAMRc=Mc_PW32jNO+C5AEQK6ej_CsCSV-HY76aJoQ6bjZ=JPOtg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Use traditional pattern when checking error codes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 2:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Instead of 'if (ret =3D=3D 0)' switch to "check for the error first" rule=
.

Well there's much more to this patch than that and I have some issues with =
it.

>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> While it gives a "+" (plus) statistics it makes the code easier to read

Not only does it increase the footprint but it also adds completely
unnecessary goto labels.

> and maintain (when, e.g., want to add somethning in between touched lines=
).
>

The single line calls to the notifier chain are unlikely to be
extended anytime soon but even then I think we should cross that
bridge when we get there.

>  drivers/gpio/gpiolib.c | 104 ++++++++++++++++++++++-------------------
>  1 file changed, 56 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5666c462248c..a9a3e032ed5b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2674,10 +2674,11 @@ int gpio_set_debounce_timeout(struct gpio_desc *d=
esc, unsigned int debounce)
>         ret =3D gpio_set_config_with_argument_optional(desc,
>                                                      PIN_CONFIG_INPUT_DEB=
OUNCE,
>                                                      debounce);
> -       if (!ret)
> -               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> +       if (ret)
> +               return ret;
>
> -       return ret;
> +       gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +       return 0;
>  }

I really don't see how this makes it better. The logic here is: if the
underlying set config worked fine - emit the event. Otherwise continue
with the function (even if there's nothing there now). If anything
you're making it more difficult to modify later because logically the
notification is just an optional step on the way to returning from the
function.

>
>  /**
> @@ -2697,16 +2698,17 @@ int gpiod_direction_input(struct gpio_desc *desc)
>         VALIDATE_DESC(desc);
>
>         ret =3D gpiod_direction_input_nonotify(desc);
> -       if (ret =3D=3D 0)
> -               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> +       if (ret)
> +               return ret;
>

Ok, for consistency I could take it but please put this into a
separate commit doing just that (here and elsewhere).

> -       return ret;
> +       gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +       return 0;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_direction_input);
>
>  int gpiod_direction_input_nonotify(struct gpio_desc *desc)
>  {
> -       int ret =3D 0;
> +       int ret;
>
>         CLASS(gpio_chip_guard, guard)(desc);
>         if (!guard.gc)
> @@ -2733,6 +2735,8 @@ int gpiod_direction_input_nonotify(struct gpio_desc=
 *desc)
>         if (guard.gc->direction_input) {
>                 ret =3D guard.gc->direction_input(guard.gc,
>                                                 gpio_chip_hwgpio(desc));
> +               if (ret)
> +                       goto out_trace_direction;
>         } else if (guard.gc->get_direction &&
>                   (guard.gc->get_direction(guard.gc,
>                                            gpio_chip_hwgpio(desc)) !=3D 1=
)) {
> @@ -2741,11 +2745,11 @@ int gpiod_direction_input_nonotify(struct gpio_de=
sc *desc)
>                            __func__);
>                 return -EIO;
>         }
> -       if (ret =3D=3D 0) {
> -               clear_bit(FLAG_IS_OUT, &desc->flags);
> -               ret =3D gpio_set_bias(desc);
> -       }
>
> +       clear_bit(FLAG_IS_OUT, &desc->flags);
> +       ret =3D gpio_set_bias(desc);
> +
> +out_trace_direction:

This makes it worse! We can't just apply the "return fast" rule
indiscriminately. Sometimes it does make sense to go "if the previous
step worked, do this, otherwise keep going".

Also: adding more labels for no reason?

>         trace_gpio_direction(desc_to_gpio(desc), 1, ret);
>
>         return ret;
> @@ -2774,6 +2778,8 @@ static int gpiod_direction_output_raw_commit(struct=
 gpio_desc *desc, int value)
>         if (guard.gc->direction_output) {
>                 ret =3D guard.gc->direction_output(guard.gc,
>                                                  gpio_chip_hwgpio(desc), =
val);
> +               if (ret)
> +                       goto out_trace_value_and_direction;
>         } else {
>                 /* Check that we are in output mode if we can */
>                 if (guard.gc->get_direction &&
> @@ -2790,8 +2796,9 @@ static int gpiod_direction_output_raw_commit(struct=
 gpio_desc *desc, int value)
>                 guard.gc->set(guard.gc, gpio_chip_hwgpio(desc), val);
>         }
>
> -       if (!ret)
> -               set_bit(FLAG_IS_OUT, &desc->flags);
> +       set_bit(FLAG_IS_OUT, &desc->flags);
> +
> +out_trace_value_and_direction:
>         trace_gpio_value(desc_to_gpio(desc), 0, val);
>         trace_gpio_direction(desc_to_gpio(desc), 0, ret);
>         return ret;
> @@ -2816,10 +2823,11 @@ int gpiod_direction_output_raw(struct gpio_desc *=
desc, int value)
>         VALIDATE_DESC(desc);
>
>         ret =3D gpiod_direction_output_raw_commit(desc, value);
> -       if (ret =3D=3D 0)
> -               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> +       if (ret)
> +               return ret;
>
> -       return ret;
> +       gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +       return 0;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
>
> @@ -2843,10 +2851,11 @@ int gpiod_direction_output(struct gpio_desc *desc=
, int value)
>         VALIDATE_DESC(desc);
>
>         ret =3D gpiod_direction_output_nonotify(desc, value);
> -       if (ret =3D=3D 0)
> -               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> +       if (ret)
> +               return ret;
>
> -       return ret;
> +       gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +       return 0;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_direction_output);
>
> @@ -2877,19 +2886,15 @@ int gpiod_direction_output_nonotify(struct gpio_d=
esc *desc, int value)
>                 if (!ret)
>                         goto set_output_value;
>                 /* Emulate open drain by not actively driving the line hi=
gh */
> -               if (value) {
> -                       ret =3D gpiod_direction_input_nonotify(desc);
> +               if (value)
>                         goto set_output_flag;
> -               }
>         } else if (test_bit(FLAG_OPEN_SOURCE, &flags)) {
>                 ret =3D gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_SOURC=
E);
>                 if (!ret)
>                         goto set_output_value;
>                 /* Emulate open source by not actively driving the line l=
ow */
> -               if (!value) {
> -                       ret =3D gpiod_direction_input_nonotify(desc);
> +               if (!value)
>                         goto set_output_flag;
> -               }
>         } else {
>                 gpio_set_config(desc, PIN_CONFIG_DRIVE_PUSH_PULL);
>         }
> @@ -2901,15 +2906,17 @@ int gpiod_direction_output_nonotify(struct gpio_d=
esc *desc, int value)
>         return gpiod_direction_output_raw_commit(desc, value);
>
>  set_output_flag:
> +       ret =3D gpiod_direction_input_nonotify(desc);

This can't be right. Or am I just not getting it? In any case it's
completely unreadable now. Go set output flag but start by setting
direction to input first?

> +       if (ret)
> +               return ret;
>         /*
>          * When emulating open-source or open-drain functionalities by no=
t
>          * actively driving the line (setting mode to input) we still nee=
d to
>          * set the IS_OUT flag or otherwise we won't be able to set the l=
ine
>          * value anymore.
>          */
> -       if (ret =3D=3D 0)
> -               set_bit(FLAG_IS_OUT, &desc->flags);
> -       return ret;
> +       set_bit(FLAG_IS_OUT, &desc->flags);
> +       return 0;
>  }
>
>  /**
> @@ -2994,25 +3001,25 @@ int gpiod_set_config(struct gpio_desc *desc, unsi=
gned long config)
>         VALIDATE_DESC(desc);
>
>         ret =3D gpio_do_set_config(desc, config);
> -       if (!ret) {
> -               /* These are the only options we notify the userspace abo=
ut. */
> -               switch (pinconf_to_config_param(config)) {
> -               case PIN_CONFIG_BIAS_DISABLE:
> -               case PIN_CONFIG_BIAS_PULL_DOWN:
> -               case PIN_CONFIG_BIAS_PULL_UP:
> -               case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> -               case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> -               case PIN_CONFIG_DRIVE_PUSH_PULL:
> -               case PIN_CONFIG_INPUT_DEBOUNCE:
> -                       gpiod_line_state_notify(desc,
> -                                               GPIO_V2_LINE_CHANGED_CONF=
IG);
> -                       break;
> -               default:
> -                       break;
> -               }

If you really want to get rid of one level of indentation here, I
suggest moving it into a separate function.

> +       if (ret)
> +               return ret;
> +
> +       /* These are the only options we notify the userspace about */
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +       case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +       case PIN_CONFIG_INPUT_DEBOUNCE:
> +               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> +               break;
> +       default:
> +               break;
>         }
>
> -       return ret;
> +       return 0;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_set_config);
>
> @@ -3730,10 +3737,11 @@ int gpiod_set_consumer_name(struct gpio_desc *des=
c, const char *name)
>         VALIDATE_DESC(desc);
>
>         ret =3D desc_set_label(desc, name);
> -       if (ret =3D=3D 0)
> -               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> +       if (ret)
> +               return ret;
>
> -       return ret;
> +       gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +       return 0;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
>
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

Most of this is IMO pointless churn. You typically do a lot of great
cleanups but this just doesn't make sense. Sorry but NAK.

Bart

