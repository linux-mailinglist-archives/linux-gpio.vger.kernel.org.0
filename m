Return-Path: <linux-gpio+bounces-12398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF079B8326
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 20:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 850ACB22025
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 19:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614B31CB324;
	Thu, 31 Oct 2024 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TonD/T6D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE513698B
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730402112; cv=none; b=sRqwVBwKwcjIt7owN97CmSv8ZEw+sG9osh7fqh9r5QBCcIZutN8AHf1Y9IyOOBiawyU7Kjj95vb+x203bwR4rlUjzE7zcd2k3W89CfCz0CIbn693ljSDxvrrj+p8ZMMMSKdIeZWh2vouZiuGXeW+oeY0SLCwIqGvy22nAwA6GsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730402112; c=relaxed/simple;
	bh=N1fYzkm6fzUz+e+vRiqxfL0N2wW6fQWiDTiPtOgJChY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzpoGakc5WvCyDEbY317hoSuU1mhOneQthIsiq6s4iOUlWLaNs/S1KR5R+aMXdHRWAi4jwsa+w24oXJMRGUSpBF0qHsSme5EQkqiObXa02Tu+IV4nA7s07Lqx+AbCPOuhaRDehTWqhyrn6wZBpXa8Cz2+f3LxCojNfkSvMQgOHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TonD/T6D; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e6c754bdso1271076e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730402108; x=1731006908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAwsPMZV145BtHwYn6jGE8nEqAn9J+nFJ3D93oIIBmw=;
        b=TonD/T6Dm0Rkag5OAc+Ynhdk8S5aQ7zu2hdfQ5IlEwXWc8WAjxk7wS7wHoKDxiPVOc
         R4lw+Cuizfx22Gf8ug1NfjEiPvoYutPaNI/iWtp91JZi/GT0KqURdzceHulwJYGkEsCb
         5iTFISI34A2K9JQ74Wpxin3zQBjSZKSmCzNX6MeN1Ogp836yeffykDkIaa70Ut+FHv0v
         8l2fyEQ11JtUmm5ybyzsLdRVdwg3j/bAxG5krBpo0z259CemcUDtcSDdlcZ3FeEz6lG2
         3MxXdW0snvpg8oUjnqreAzCjiMVvCBYerwEf5tXgnYTPtzrFWcAFdXKULiOnM3izjrRl
         3wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730402108; x=1731006908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAwsPMZV145BtHwYn6jGE8nEqAn9J+nFJ3D93oIIBmw=;
        b=giaVdo9xboT5NtB+04SbCmHVA0x4b3zUn1TlRZ7iZiUfHpSl/pLn6VOWyIfs5OsA2O
         poVTco8MWiZvUY4I5N+pvsXOEx3pehdQeB+cVD4Yj2Q7YeUsKJ1dUzzZXcXiAECX0Qs8
         NEOb0Vf8jLnPwlR2RprKiVDYipWw/EMmx89TUnzxEFzeuceY8LOXiWI4zeD24HSlUCnX
         Y5bfi6xt0cbEHyTQ/sr02EmKkCdPBHDE6ELyDO/0uUwvSe5DI/BmVsu/0WQxVebt3DwB
         g2Eg1TZfyLw3gYeUtmt946QnP1804nAOONbuUjfEsr2sDil1dhvVWhMTo8N5oppkkkxW
         f+1w==
X-Forwarded-Encrypted: i=1; AJvYcCX2LYl2eu1TDL8W+w0y7xsZOsm0rlCyQQ7WTXUq38hy7GGJqgJcro0oI6KmXIEn+5H486CVSelg+rc2@vger.kernel.org
X-Gm-Message-State: AOJu0YylA+JjrTrt7vMQ5GBIaai8htf1RGXaysoms6MDqUdardi9ExbO
	zRJVzEbrWqnnm3+JGPamBgG0p8EgRG2ZnA8/5bAJnPRW/9kp5feZ32BWoTAWrEyNkN89kt/161l
	4BVMcTS5i0WU/N5i5V/wJ53Yv2GK9Lk5Q9QevvA==
X-Google-Smtp-Source: AGHT+IFhGKzyho6e6TzBRPsG2H6OQLFu8aDknW6VG5e0GIr5eAiCAh62PBm4LRyEsQlB9wiETJ4VA9Ni8RZte4XtyxE=
X-Received: by 2002:a05:6512:3a91:b0:52e:e3c3:643f with SMTP id
 2adb3069b0e04-53c79e158c3mr2531913e87.2.1730402107655; Thu, 31 Oct 2024
 12:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031092154.2244728-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241031092154.2244728-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 20:14:56 +0100
Message-ID: <CAMRc=MeiZ_U0UoU1atWxyWxEhcKwUcCK_cbYu_p-DQar27Fw+A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate gpiod_direction_input_nonotify()
 call
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 10:22=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Deduplicate gpiod_direction_input_nonotify() call in
> gpiod_direction_output_nonotify() when emulating open-drain
> or open-source behaviour. It also aligns the error check
> approaches in set_output_value and set_output_flag labels.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5666c462248c..9376dd270344 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2877,19 +2877,15 @@ int gpiod_direction_output_nonotify(struct gpio_d=
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
> @@ -2901,15 +2897,17 @@ int gpiod_direction_output_nonotify(struct gpio_d=
esc *desc, int value)
>         return gpiod_direction_output_raw_commit(desc, value);
>
>  set_output_flag:

Ok, I'll take it but please change this label to "emulate_output" or
something similar that's more indicative on what the goal here is.

Bart

> +       ret =3D gpiod_direction_input_nonotify(desc);
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
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

