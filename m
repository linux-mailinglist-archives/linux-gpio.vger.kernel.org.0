Return-Path: <linux-gpio+bounces-23672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 009DEB0ED73
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E0A4962721
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5091928000C;
	Wed, 23 Jul 2025 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Pee1uEMv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F727FD49
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259988; cv=none; b=kdWKYD2lDZahTTOdO9oaEDroHqyjY5jUFxyvK1WG18EXluz7TUcaB2PaHotZrnAT9TbpSSeeuDuxCOGQtjj31dCkut+/yACygcd0PKP3Qt+d4Xrh1HEQ4O72t4ykzUtvvNqljs9PyTxE1gEYLbAMpN2vd6TeDeRa3y9VbtJj0JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259988; c=relaxed/simple;
	bh=1AjvjJS9v/RU79Y2L27EordX4bGQ6WagU8X+BGgVibg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qs3RRMlDVyJ0Myv3bcILjovFX2UPj5XxqMCG0gh21RGNZ0VmMOmN6ezZOLqctCXhdYSVviMSeR8XTMjpbFa3g/opzFbh5qLWi5J7gssk5XFukQ5YbWYHpd2alI2Uwix37Ynrjzw/NRlDChJ775fz+cj/muQFiWCATEV3sqbEXJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Pee1uEMv; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32f1df5703aso50621691fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753259984; x=1753864784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU3YHppfEwgLlzQmPzEMgC+cmd2aor7tnr8gGHNlsXI=;
        b=Pee1uEMvjOYM3t38VIu1jxJgiB8icyqxHWvnSkPcGqD1HwAQ2gkLLzH1OmWAs2e95+
         iOxc+2NY+0zX1ln/aOSmdrXa4lquogIi3sPFGgUnpMooZPXJ3N7duahoXJNTzXOlpy0x
         ByTt7+EVSzeVTGETtTjTbWTmPfidScPUkvGy/pZpfwQipB0E+OJMmgFPDL03QtzhaEDN
         /ejvVQj0D7Knu/ym4MQS7AWoqmRGgFRygMFtnqWaYogVPZrT2KaFGwghGWLZxOSq6jQp
         tEkIkmITknd8/XuwSh5SUji25yZk5ajCqlwXez/gBLeDtjyqSd0/sXpf+T3Upb0sP8Tp
         bvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259984; x=1753864784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BU3YHppfEwgLlzQmPzEMgC+cmd2aor7tnr8gGHNlsXI=;
        b=pV2z19KmicA0n8D5OsGor2DVeKGsODJahwZaaa6uERG64ZjH1JM7RsgDItwdAZgJqz
         Bkht+tl2nvh4GKrnl3YBoU8wxU6me7wEfQYJdSTVOiz3fIbOK7mGOE48quE6QaOZvGES
         BNS180oEZBydEniuTHFziBpEr61JPYYPM4MCKfFmh0udlWgvJUdA5v1Y0GlCCnwDpj+V
         q8mW5xe/GZ8b0ySFMiBgcJ/u/qXxo4CPu+ov/gPEK+wh61/kQQOY0ITAMJvZ7ZTRJUvv
         MLI66MyNuZc0JBOGGdx6Ofx8CL8RKt2gPxpY0Gh78kPV7+Cd6ZSze9azhu1e89mVdvnE
         6vIA==
X-Forwarded-Encrypted: i=1; AJvYcCV7auT/73yCrtBTiCc3ZAv6WX5YdZq5ST7YG0YkE5nJ/GNUP938HQmJ0P9JFqULGdx90d1xF45tuYpx@vger.kernel.org
X-Gm-Message-State: AOJu0YxwWOK41TgDYZuCUU6NlpfGywwrl8CgYI8PMtxbkplURgzNXjlv
	ftY1gi9oOPUcfLmoYHPVgBee7nH/tZ6d/M593GM0qvcKA2FXVZActWGjqEH0D+sl/pE4e1X+t2Q
	J4CNe5aszn6pGH0IStT6YBS2ibAF9quOy/HiUe2GH1PfTMmLjCE4+
X-Gm-Gg: ASbGncvvm+naZgp6QA1EZ+C3IcI3/iCcNAhYUREV2EeEg/f8fk8GcOZ+slTSMdoSBSA
	jKugOB+FOJwuzvPSAUafaESjzYGZFn5XbX8mO5CMXVceDrVqIwCcdZp97PvOLTYJR6SW+MRuasm
	0ifrJaPzrVA4O1VLhlb250xB/ljOrWYr7xx6ET/gsj6ycNLjT4qh0Xq80AHKudriSCKIxkf2Alk
	xHPrFW+OHAmYAN7s3LPWZtCvaynfo+wCzdJyw==
X-Google-Smtp-Source: AGHT+IFugxx33V2IVP47SCGYIErHvS07pbcdF/mE/z9tJyMMD44yLv/pqTHyTGVndOZ3XhTEc+cnZUrA7NWAS69FBGM=
X-Received: by 2002:a05:6512:4002:b0:54b:117b:b54e with SMTP id
 2adb3069b0e04-55a513e5ad2mr726883e87.57.1753259984459; Wed, 23 Jul 2025
 01:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722153634.3683927-1-arnd@kernel.org>
In-Reply-To: <20250722153634.3683927-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Jul 2025 10:39:32 +0200
X-Gm-Features: Ac12FXxdSKzhtSe3prQ9Qy5T-yWlCnomkS5z5uJ4MEj3ZIWOP-wTvZ2ujZX9cGM
Message-ID: <CAMRc=Mejnr8UzN93X=CWcV5jDTt9-U+Nxcm3qb=6uVV0PMiZVQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: make legacy interfaces optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Peng Fan <peng.fan@nxp.com>, 
	Lee Jones <lee@kernel.org>, Koichiro Den <koichiro.den@canonical.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 5:36=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The traditional interfaces are only used on a small number of ancient
> boards. Make these optional now so they can be disabled by default.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is the first patch of a series to turn off the legacy interfaces
> by default. If we can still have this one in linux-6.17, we can more
> easily merge the other patches for 6.18.
>
> See for the longer series:
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?=
h=3Dconfig-gpio-legacy
>
> I'm sure there are still problems in the other patches, but it
> does pass my randconfig build tests on the three architectures
> I'm testing on. I plan to post them after some more testing
> once -rc1 is out.
>
>  drivers/gpio/Kconfig  |  3 +++
>  drivers/gpio/Makefile |  2 +-
>  include/linux/gpio.h  | 10 ++++++----
>  3 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 12bdf6e965f1..8bda3c9d47b4 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -14,6 +14,9 @@ menuconfig GPIOLIB
>
>  if GPIOLIB
>
> +config GPIOLIB_LEGACY
> +       def_bool y
> +
>  config GPIOLIB_FASTPATH_LIMIT
>         int "Maximum number of GPIOs for fast path"
>         range 32 512
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 88dedd298256..b01ff2b68bf6 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -5,7 +5,7 @@ ccflags-$(CONFIG_DEBUG_GPIO)    +=3D -DDEBUG
>
>  obj-$(CONFIG_GPIOLIB)          +=3D gpiolib.o
>  obj-$(CONFIG_GPIOLIB)          +=3D gpiolib-devres.o
> -obj-$(CONFIG_GPIOLIB)          +=3D gpiolib-legacy.o
> +obj-$(CONFIG_GPIOLIB_LEGACY)   +=3D gpiolib-legacy.o
>  obj-$(CONFIG_OF_GPIO)          +=3D gpiolib-of.o
>  obj-$(CONFIG_GPIO_CDEV)                +=3D gpiolib-cdev.o
>  obj-$(CONFIG_GPIO_SYSFS)       +=3D gpiolib-sysfs.o
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index ff99ed76fdc3..8f85ddb26429 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -13,6 +13,11 @@
>  #define __LINUX_GPIO_H
>
>  #include <linux/types.h>
> +#ifdef CONFIG_GPIOLIB
> +#include <linux/gpio/consumer.h>

I want to queue this ASAP but do we really need this guard here?
consumer.h already guards against !CONFIG_GPIOLIB internally, right?

Bart

> +#endif
> +
> +#ifdef CONFIG_GPIOLIB_LEGACY
>
>  struct device;
>
> @@ -22,9 +27,6 @@ struct device;
>  #define GPIOF_OUT_INIT_HIGH    ((0 << 0) | (1 << 1))
>
>  #ifdef CONFIG_GPIOLIB
> -
> -#include <linux/gpio/consumer.h>
> -
>  /*
>   * "valid" GPIO numbers are nonnegative and may be passed to
>   * setup routines like gpio_request().  Only some valid numbers
> @@ -170,5 +172,5 @@ static inline int devm_gpio_request_one(struct device=
 *dev, unsigned gpio,
>  }
>
>  #endif /* ! CONFIG_GPIOLIB */
> -
> +#endif /* CONFIG_GPIOLIB_LEGACY */
>  #endif /* __LINUX_GPIO_H */
> --
> 2.39.5
>

