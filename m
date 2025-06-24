Return-Path: <linux-gpio+bounces-22054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D24AE6396
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22D4C3B5B80
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 11:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704F1279DCF;
	Tue, 24 Jun 2025 11:31:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2FB8F5B;
	Tue, 24 Jun 2025 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764719; cv=none; b=iDADxVcRQB6FaGv+NMOmaxi71Y+PztECI0jAS3tubx5xQPQ7nJyQXAIB825P+pkP7KK+6BqLSNi5svJvmA/1PjUEEmKCBOP983qziW7nJuTZ/wKMNkP5oi+722yGLKnIafwtwvxvSH07pl8S1XiQPlPA0Hdof1QOKHHg3YYMwfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764719; c=relaxed/simple;
	bh=2ix86K+vswD1kB1r5fq4O5afvhxAVPsw/9mCx7uD4yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCZv3wOsNuwApeahKEDHPyT31ymH+BaLM93Bu/R2q5VIoFeI93XwexucEBqqnlemeM67iz/VamI4iQw0nG18pwtodcmBd0XMIoay1jYs8hSww2TNAwupomDvuqmxXLaRq8J7Hqlt4ECF99aETWKjIHfxofSOABJ+uNQyysyLMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e9c6b44477so2485705137.3;
        Tue, 24 Jun 2025 04:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750764714; x=1751369514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8yRZ3F7uXYry7oEC+lchLqsK2A+yzNnqswlmUPTZhs=;
        b=SoR/gwdl9lVhCz8LI/oqjBpIsaBAI0fP+gUfgvHwv3bcZFWlKQ2OJq5yHYkz2g5o0c
         4cdjQmDFV4ntsVIyKqOJURlXRtvHmB6aaTa0c3hSn/pk/QbvJAJIhOUFZnCbZ/mywvUi
         nKNQCYz2k0NbN3x5Tu1EUyUUDECwJIOgLtbPI6oKAKzq1/jo5Kkk66GPOZag+E9tkEvN
         oWFgk9YGLuNPj062hAVzaSb9BJuiHLDj+xPAzKoWr8HV1Wck+sYhY9MeD971PxjWAFkb
         cgkYp+gp1+9slPGv8qXaAtiqWNewB09gsRfrYrlXIVDcaLvGDtc+1yQ/6OeASDUPW0zQ
         V8tw==
X-Forwarded-Encrypted: i=1; AJvYcCUthKzB3P+qMea2KGdyuPsTpkn/4DiW5MHKA7Z3ywlYouq9+U0yDNAlidOj3yTYwX1HB2oSDcTXWraspi9w@vger.kernel.org, AJvYcCWAxRtyhiM5SpMXyBARwJW+yIqbAE3S0M/3Rnuy9MbD5NkKyMQPrs4bVSiDnFUBFwtB7SWVRK5rWOc0@vger.kernel.org
X-Gm-Message-State: AOJu0YxFfOpC+Qjh0nLY1IXU1RvM7/gC42PakyNvaznhkYVng7McX6xC
	XtQodcA0UDrU8JBVFseu8PTY1iUrVklxvVhBPjNuffMR5VYnPNgL2zWwIlVGFLmO
X-Gm-Gg: ASbGnctFGFrFdBV63o7Qdw+NWUycrmGoaiLXDezEDkwpl/rZrLZZyq1xxvzc1M9Frqo
	eLsuDYnl1c/saAy5uY5366eRrERB/5/w/dtFfiPBK6obRtNBR64FNnL9IVWajxdwAOywY+ftARl
	NlmMypUOi07oQaiGevMYY5nkitsEMoDJd5Sxs5YZ+Mp/xwIyYdihzINhew9Tp6jydOZTSbDPEZt
	8yJIFCF9CJagV66C1AGqeVK3LBFNUJz3U5/G/rDQ13XLniRvHoIsPvujyNMYkOpX9SLdiCqH+YR
	k1GCZbpNRj+Q1HMYYit1iJbPyxDndrLr9kLl0F6ND5wvxk3LYEUZcf/qp5hL/OISI8DRZzutSWm
	+N1zkXfh+uwZshFM8Xl0mMA7IxlLV+gCQqUE=
X-Google-Smtp-Source: AGHT+IHWpMlzDToW5PKwTEQGOBqT4Ax0odlHhK2QKdsyvb0aKxsG/Hw/BJw3taAkUvkEj3hUH6JSlg==
X-Received: by 2002:a05:6102:570e:b0:4e7:866c:5cd2 with SMTP id ada2fe7eead31-4e9c2a2d75amr10025444137.2.1750764714109;
        Tue, 24 Jun 2025 04:31:54 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e9c2d198d0sm1605756137.5.2025.06.24.04.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 04:31:53 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87f161d449dso3564315241.3;
        Tue, 24 Jun 2025 04:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxREXlonfE8ApAffg2Qv/j8OCw+R6s1lD1nmHRaN/LVN4bjwZEM6tZp4SILA0TsUBsEZfw/5FGd6CJk91+@vger.kernel.org, AJvYcCVbsfcdv/LhrSkNIiH0x+WGo8X6qxIS4AcXHmDpmrheiD2jVMmvl7x1S5MjXqZ0I6OInKRuIV8UlODw@vger.kernel.org
X-Received: by 2002:a67:e95a:0:b0:4e6:d7af:a7b1 with SMTP id
 ada2fe7eead31-4e9c2abb06emr8275997137.10.1750764712984; Tue, 24 Jun 2025
 04:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jun 2025 13:31:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0W8u30yYfYd2zXhVJn_RZB0ZXj2Qyxasd-XUA4eZJpQ@mail.gmail.com>
X-Gm-Features: Ac12FXy_H1_Hsj5u-Vk1f1AwQvSuxU4H5mRe_zS6ZcUTz99wb3VN5EsL_uI8z6M
Message-ID: <CAMuHMdV0W8u30yYfYd2zXhVJn_RZB0ZXj2Qyxasd-XUA4eZJpQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] gpio: sysfs: allow disabling the legacy parts of
 the GPIO sysfs interface
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Mon, 23 Jun 2025 at 11:01, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a Kconfig switch allowing to disable the legacy parts of the GPIO
> sysfs interface. This means that even though we keep the
> /sys/class/gpio/ directory, it no longer contains the global
> export/unexport attribute pair (instead, the user should use the
> per-chip export/unpexport) nor the gpiochip$BASE entries. This option
> default to y if GPIO sysfs is enabled but we'll default it to n at some
> point in the future.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks for your patch!

> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c

> @@ -968,6 +994,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
>
>         guard(mutex)(&sysfs_lock);
>
> +#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
>         /* use chip->base for the ID; it's already known to be unique */
>         data->cdev_base =3D device_create_with_groups(&gpio_class, parent=
,
>                                                     MKDEV(0, 0), data,
> @@ -979,13 +1006,16 @@ int gpiochip_sysfs_register(struct gpio_device *gd=
ev)
>                 kfree(data);
>                 return err;
>         }
> +#endif /* CONFIG_GPIO_SYSFS_LEGACY */

"err" is always declared, but only used in this block.
Hence if CONFIG_GPIO_SYSFS_LEGACY=3Dn:

    drivers/gpio/gpiolib-sysfs.c: In function =E2=80=98gpiochip_sysfs_regis=
ter=E2=80=99:
    drivers/gpio/gpiolib-sysfs.c:962:13: error: unused variable =E2=80=98er=
r=E2=80=99
[-Werror=3Dunused-variable]
      962 |         int err;
          |             ^~~

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

