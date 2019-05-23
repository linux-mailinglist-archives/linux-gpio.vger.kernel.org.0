Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961C92778C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 09:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfEWH5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 03:57:13 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39783 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfEWH5N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 03:57:13 -0400
Received: by mail-ot1-f68.google.com with SMTP id r7so4580964otn.6
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sYZ3enp20XrSZdyI55mRcQRGaPisKQrcms2lHaLmhv0=;
        b=zpLWVcPZCEmWq3gBwa+x5aLw7/pLLpYFipZWclUvkkQvjE2KEWoigYbEB7Wwy0DUkR
         nDLNe+iA7W1THry7BlOcOcvq4uEaSIeusVMpHk7y9GrPDGUvfnFovhBYh4oh3g4QqeM+
         4e3z78zi3+I8PqfQl6vhSalOa0qV4f3js+XxLL4yB5l6inpNQWylfGvhiI2YY7p1atxP
         nsw6/HAZt5FZ+K8l4GMhE/fdwdR8aZYA30S1qMWlU9nGNyJqKES+5cevZj1ivWjIBDBT
         5Gac2WId/CJiami4eOg+iN7TqLFkB8cNxt1WQVKikQZEOKE6YHByNYBQ602Knm8BJ1Bz
         /F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sYZ3enp20XrSZdyI55mRcQRGaPisKQrcms2lHaLmhv0=;
        b=DkXNJPFVyWW4M1Ik+1tZFvFRFIbii6VndsT4IP2qLM3tIL9HmopLW2GbhWIv6zzySi
         ndlAwUM1Uf3VQiNq+L9HsBufT51ddLA8kvCIOdXBhSJveL1zIzPjjKn0KkiYkC7uq/+v
         zagXmZe1Yy4D8KNCyFt4MuamJ91JdUC3iJ9V65zZw6jQU+Sf1aGfoGYU1Jp4i23eWm76
         mnhiH499JEvGzeJruWM8pSUi/BFogIxXZXIEu5bVVtJE6onEqsYerxFIc6mD3lpwk/9l
         CMCVmfrUSY7GN9Oyq+o+oCxJ0W7AokI9qnWL4Yv9OFQvb5qT4X+A7t4CYT0bDztCRdNj
         p/wQ==
X-Gm-Message-State: APjAAAXtC2p5u4pjT4cioMO8SUqcLCgeyhbiStO8uHbC6ufMUTc8mUAi
        9WMLa//1S82S5pTbQdM7sNgqw0rkOmWnEh9dDq+o3w==
X-Google-Smtp-Source: APXvYqyE5RAlubAAQlKpTgbmqEkcxsR21OZdW1NeFMUD79gcE/eXYbDfUtq79+Vk4HqarCnSuU9PkW3Rejug41FPmK4=
X-Received: by 2002:a9d:6c5a:: with SMTP id g26mr1910019otq.194.1558598232715;
 Thu, 23 May 2019 00:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190523065623.5993-1-linus.walleij@linaro.org>
In-Reply-To: <20190523065623.5993-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 23 May 2019 09:57:01 +0200
Message-ID: <CAMpxmJXS3dmMfm7o2iWXRyfJ2SskZArO6La0t-G+hRCW6LrR5w@mail.gmail.com>
Subject: Re: [PATCH] gpio: Update Kconfig text for GPIO_SYSFS
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 23 maj 2019 o 08:56 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> This feature is deprecated, it is helpful to inform users about
> this. I'm resisting the temptation to add "depends on BROKEN"
> to this, but saving that for later.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 8023d03ec362..a10b821e1d92 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -61,16 +61,12 @@ config GPIO_SYSFS
>         bool "/sys/class/gpio/... (sysfs interface)"
>         depends on SYSFS
>         help
> -         Say Y here to add a sysfs interface for GPIOs.
> +         Say Y here to add the legacy sysfs interface for GPIOs.
>
> -         This is mostly useful to work around omissions in a system's
> -         kernel support.  Those are common in custom and semicustom
> -         hardware assembled using standard kernels with a minimum of
> -         custom patches.  In those cases, userspace code may import
> -         a given GPIO from the kernel, if no kernel driver requested it.
> -
> -         Kernel drivers may also request that a particular GPIO be
> -         exported to userspace; this can be useful when debugging.
> +         This ABI is deprecated. If you want to use GPIO from userspace,
> +         use the character device /dev/gpiochipN with the appropriate
> +         ioctl() operations instead. The character device is always
> +         available.
>
>  config GPIO_GENERIC
>         depends on HAS_IOMEM # Only for IOMEM drivers
> --
> 2.20.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I strongly believe that in a couple releases we should WARN_ONCE()
when sysfs is used. :)

Bart
