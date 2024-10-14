Return-Path: <linux-gpio+bounces-11308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B200B99CF57
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 16:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FAA11F22E0C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 14:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFAE1C331A;
	Mon, 14 Oct 2024 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uvAXqHrY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48A1C3F0A
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917424; cv=none; b=W/EGOfnlfpyS82eS5zk2vJXRSaxd4OuvbMZKcb5i4EIqc/PvBkli7mgHvReXjInRIsnJhauERgEZfLQt8GhkndrC1WG6Ck1P80kH2LBaNkPqaFhFNXIPvbPw8XSH047ClsNi89fF8M6AopnRf/C0KzFG8Bfj2+8ZJ2VkG70CTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917424; c=relaxed/simple;
	bh=Trrsi/1o9flLYLZyOmEYFpYG5mAtmBzFeoelpiRrHHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7nmJHj4o10A3MCrwRkipssW4gbvvtE6UjJdB1/rHBHBJAk30LWkHTk8NOhjQgVmJBaNsjLNi5xNPojCfGZdwurFo2K1Zp/7pMg+dCT+FapNbtMNKSqRmrRaHXyCG3PH1hWtBG9cwkn6dIccCfeUfNGdv7RlxZmJodVrJWCMo+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uvAXqHrY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so2377460a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728917422; x=1729522222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIcR5NMxedzEz0Rtm+vXdoPtFq9+tXtK//uLKs8wDjY=;
        b=uvAXqHrYytYdoOOAUhBsQXvV6q21qAhv/yVjQg10dFbCvlyPJQrqQtwI1nK9ARDN1t
         L5Y+zKajbDcn3MXD10kRGCc8vqdfYSDw3uJ0zj/wOYKR173NPjC9b6LJgvnfngYdtg5e
         A35AsDplv71NUokIRr6gXAvkknKAgu3d5HXu/VU8Vhn1dSSJEMg4c+gvJtoZZEH0cyO8
         9l7u1lAuS34xIL5FNw6U9tYRY323rQ1SEbsj/ITTCJoCp7mo///FykbtWvcb6tawiPd8
         NtcDvSRXXzlUWw6OU9VMMbiCAGTgtWrwEZ4fVUK6MG2tBZ3Xen/q9OLQ+1Vl5XeR/2HI
         8Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728917422; x=1729522222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIcR5NMxedzEz0Rtm+vXdoPtFq9+tXtK//uLKs8wDjY=;
        b=Jhl8NmAOdi5Q5MpuRYrz6FBYnvijbQyRQM4qsGKZOhanZPUBnxEYpqpVXmGHRjIOtp
         LM/CZNdp8xikcxo0AjVG45ECHnU36N07WDdwTf0X2xdsNVGLh/1ksIxDAUH1PrmCpcnS
         wYSpikcItSYY8MVA8Qh4Jk/VHneLfunpgkysLuRXphKGDIThoGbd/rK64DnMiv+pZfew
         Gb+Ixmg/owfImM2OUIrIsc1c7dzZBenNtApzWY1IY59T4+2m8R/Fbc+ujRi+ldQcbUpF
         3CGoZ83kJx32ZOAWZZ7G0zZTwtkmgh76VBFdZ0lGh9dwyiHahngwuj64RtAFZHMmgzia
         yh4Q==
X-Gm-Message-State: AOJu0YxYhtPRu2LICNuQmRcWhbVikbuHMqcGwxQZVp0eXNFsBNGtz7ta
	5vGynfiXjo6cLqeIUniz3kxbe6dZ3BKWKndxL2Dzpnhk6aboaFBVca9Oeeec/HxfDhgVbGLInDp
	WkC7llROZ4gIbpSHpxE3nkGeZaY1cnvHCELe5Dg==
X-Google-Smtp-Source: AGHT+IG8l3FuScfy0oU94qvypN2fKUFHSDDYJcYPq2rf5sSrETEcw3n899lt8XGJDq2RbOj3IUsonleGQBO6ebdV6GI=
X-Received: by 2002:a17:90b:4b83:b0:2e3:191e:7ef7 with SMTP id
 98e67ed59e1d1-2e3191e80d7mr10242613a91.12.1728917422345; Mon, 14 Oct 2024
 07:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014121047.103179-1-brgl@bgdev.pl>
In-Reply-To: <20241014121047.103179-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 16:50:09 +0200
Message-ID: <CAMRc=McG9a9CKXAdyAwQ=65SUOg32ExgY-YGyCs7Rxb_XjEqDg@mail.gmail.com>
Subject: Re: [PATCH] gpio: create empty /sys/class/gpio with SYSFS disabled
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 2:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> User-space may want to use some kind of a compatibility layer for the
> deprecated GPIO sysfs ABI. This would typically involve mounting
> a fuse-based filesystem using the GPIO character device to emulate the
> sysfs behavior and layout.
>
> With GPIO_SYSFS disabled, the /sys/class/gpio directory doesn't exist
> and user-space cannot create it. In order to facilitate moving away from
> the sysfs, add a new Kconfig option that indicates to GPIOLIB that is
> should create an empty directory where the GPIO class interface would
> exist and enable it by default.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> As I've mentioned under a different patch, I'm working on a user-space
> compatibility layer for the sysfs GPIO interface. FUSE allows us to
> emulate almost all its functionalities using libgpiod except for
> mounting it under /sys/class/gpio if GPIO_SYSFS is disabled. User-space
> cannot create directories in sysfs so if we want to allow users to mount
> the FUSE emulator under the old location, we need to create an empty
> /sys/class/gpio directory from the kernel and this is what is patch is
> for.
>
>  drivers/gpio/Kconfig   | 18 ++++++++++++++++++
>  drivers/gpio/gpiolib.c | 12 ++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index bfa6b5a2c537..f2e7163cb46c 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -69,6 +69,24 @@ config GPIO_SYSFS
>           use the character device /dev/gpiochipN with the appropriate
>           ioctl() operations instead.
>
> +config GPIO_SYSFS_CLASS_DIR_STUB
> +       bool "Create empty /sys/class/gpio directory" if EXPERT
> +       depends on !GPIO_SYSFS
> +       default y
> +       help
> +         Say Y here to create an empty /sys/class/gpio directory.
> +
> +         User-space may want to use some kind of a compatibility layer f=
or the
> +         deprecated GPIO sysfs ABI. This would typically involve mountin=
g
> +         a fuse-based filesystem using the GPIO character device to emul=
ate
> +         the sysfs behavior and layout.
> +
> +         This option makes GPIOLIB create an empty directory at /sys/cla=
ss/gpio
> +         where user-space can mount the sysfs replacement and avoid havi=
ng to
> +         change existing programs to adjust to different filesystem path=
s.
> +
> +         If unsure, say Y.
> +
>  config GPIO_CDEV
>         bool
>         prompt "Character device (/dev/gpiochipN) support" if EXPERT
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 97346b746ef5..31efb580beb8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4873,6 +4873,12 @@ static struct device_driver gpio_stub_drv =3D {
>         .probe =3D gpio_stub_drv_probe,
>  };
>
> +#if IS_ENABLED(CONFIG_GPIO_SYSFS_CLASS_DIR_STUB)
> +static const struct class gpio_class_stub =3D {
> +       .name =3D "gpio",
> +};
> +#endif /* CONFIG_GPIO_SYSFS_CLASS_DIR_STUB */
> +
>  static int __init gpiolib_dev_init(void)
>  {
>         int ret;
> @@ -4899,6 +4905,12 @@ static int __init gpiolib_dev_init(void)
>                 return ret;
>         }
>
> +#if IS_ENABLED(CONFIG_GPIO_SYSFS_CLASS_DIR_STUB)
> +       ret =3D class_register(&gpio_class_stub);

Gah I forgot to unregister the class. Also now that I think about it
we should maybe expose the class kobject in the kobject.h header and
use sysfs_create_mount_point() like what we do for debugfs, configfs
and other mountpoints at /sys/kernel?

In any case: please let me know what you think about this change in general=
.

Bart

> +       if (ret)
> +               pr_err("gpiolib: failed to create the empty gpio class di=
rectory\n");
> +#endif /* CONFIG_GPIO_SYSFS_CLASS_DIR_STUB */
> +
>         gpiolib_initialized =3D true;
>         gpiochip_setup_devs();
>
> --
> 2.43.0
>

