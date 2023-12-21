Return-Path: <linux-gpio+bounces-1766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20AF81B28C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 10:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B91B28497B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 09:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A157224C7;
	Thu, 21 Dec 2023 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wPttn67a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12824C608
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-466a7b271a1so26284137.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 01:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703151147; x=1703755947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyY4mdyAupWFIlLPs9X7YkxcEJUGvfcgSLNoWs9Uhs4=;
        b=wPttn67aQ4F6f373BIdfEdYCMa5QlhAaSxS+ymj7z0QVQVuzteToTcJz8gc+aZiPWn
         +9C3titwRmRKk+vocLX/4PKbyQlf6q/oz1D3Egrc6Bdzha5kJ/MIBW/a/CEze3PcY99+
         OSdH26W6HxoC7yEjh5esph7dYdR+mkEUQ7cifoWqmDrq/Ry6YcWBeMGHbTlY2sFmEZWq
         jXkfsgMlwDWbmUcrCWCvxdTZ/F13qdwBi9Lzc/dlzInrOznt7+dpGaVzMliPiOI/cjkh
         TH/ccxFjL7H7RpiSH9G+Lfl/UZPNhGoOAiEa7R7WJ1+k3gmepW0mP2tGOKhJvLR0Isx6
         MrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703151147; x=1703755947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyY4mdyAupWFIlLPs9X7YkxcEJUGvfcgSLNoWs9Uhs4=;
        b=WWImWxubtLatyewIX9yxVo5d9QSv7F2r9ubxEg20VpoXeLb8wtyC1UcSDLXp66C+pc
         N12e0XYumplflLQ6fuLtVSISGKLPnv2yti0JGduBW/dVP05FmWQNGY3RBB+2DZjXWLcH
         jK1qAQiGrdo90WEWGoHgJC/t43XaEtxsdC55+g67OKz6dLFXuAdlsbwIW3428kvrCWPe
         hijwIbcM7piptL+CLhphwwQmzmXlvEyPD603Dge0Ga+X8CYiMtSy2zQ1RJ28AWdKJik/
         FRuxugeh5U56xfko77lRRihPxRIcmEKf5NP9C5fy/M4FR+Kg3kY/isJ8UjUgyxoRvLEg
         8pCA==
X-Gm-Message-State: AOJu0YxNskM8CUc1UiFGqvpleuSKk/1daQ1+xlO1bMeyZ3UtugH9Hv8G
	nYKJc4OXVNAZ0B/KwpLCpC5E2rbPT2uHzceliJSSg0Ks1tw214Mz
X-Google-Smtp-Source: AGHT+IEkwVPubXgzWg5dFIkGFVTlHElpt879SUONLleVKD7u5tPDhhN0keFPSGT1s9u0e5UucfnwJXN2XmsLPsDjGfw=
X-Received: by 2002:a05:6102:441d:b0:466:3496:b66f with SMTP id
 df29-20020a056102441d00b004663496b66fmr310132vsb.35.1703151146804; Thu, 21
 Dec 2023 01:32:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221012040.17763-1-warthog618@gmail.com> <20231221012040.17763-2-warthog618@gmail.com>
In-Reply-To: <20231221012040.17763-2-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Dec 2023 10:32:15 +0100
Message-ID: <CAMRc=McSOij2kChZh-zCLBP75cxmnnHSqKg2=uk9dEDJquKZhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpiolib: cdev: add gpio_device locking wrapper
 around gpio_ioctl()
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 2:21=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> While the GPIO cdev gpio_ioctl() call is in progress, the kernel can
> call gpiochip_remove() which will set gdev->chip to NULL, after which
> any subsequent access will cause a crash.
>
> gpio_ioctl() was overlooked by the previous fix to protect syscalls
> (bdbbae241a04), so add protection for that.
>
> Fixes: bdbbae241a04 ("gpiolib: protect the GPIO device against being drop=
ped while in use by user-space")
> Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines"=
)
> Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and G=
PIO_V2_LINE_GET_VALUES_IOCTL")
> Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL a=
nd GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 744734405912..9155c54acc1e 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2598,10 +2598,7 @@ static int lineinfo_unwatch(struct gpio_chardev_da=
ta *cdev, void __user *ip)
>         return 0;
>  }
>
> -/*
> - * gpio_ioctl() - ioctl handler for the GPIO chardev
> - */
> -static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned lon=
g arg)
> +static long gpio_ioctl_unlocked(struct file *file, unsigned int cmd, uns=
igned long arg)
>  {
>         struct gpio_chardev_data *cdev =3D file->private_data;
>         struct gpio_device *gdev =3D cdev->gdev;
> @@ -2638,6 +2635,17 @@ static long gpio_ioctl(struct file *file, unsigned=
 int cmd, unsigned long arg)
>         }
>  }
>
> +/*
> + * gpio_ioctl() - ioctl handler for the GPIO chardev
> + */
> +static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned lon=
g arg)
> +{
> +       struct gpio_chardev_data *cdev =3D file->private_data;
> +
> +       return call_ioctl_locked(file, cmd, arg, cdev->gdev,
> +                                gpio_ioctl_unlocked);
> +}
> +
>  #ifdef CONFIG_COMPAT
>  static long gpio_ioctl_compat(struct file *file, unsigned int cmd,
>                               unsigned long arg)
> --
> 2.39.2
>

I applied this. I'll send it upstream tomorrow and once it's in
master, I'll pick up the rest on Monday.

Bart

