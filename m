Return-Path: <linux-gpio+bounces-23875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A6B14C94
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 12:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE3AB176675
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 10:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D3428B3EB;
	Tue, 29 Jul 2025 10:53:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EAC227EA8;
	Tue, 29 Jul 2025 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786420; cv=none; b=Bjcf89LiPi6WNBXo5sIziLcYlyFis1dsjarrWAOtjMOSrv/v47xWSm1X4+CVUTtLb4vksjyJcGbGFvzc/89oKSf0YoZ1G6vwYwAQQaJ/t+hytf5u5PkwnfaB5sY5grFL/QFBjB1B3KQ2D4TvfHcrp56k6s8TgnAGg5ujxuFgUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786420; c=relaxed/simple;
	bh=+d1oFlygtYnY3YQHRCn/CocY7GrTw53GXvhZM4duu7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFvj4UvkIKasQ4XPEtSD+if4SfR/2a+q7GiffexPXvGuEfIiPK8Ej9VV8zAPhL6+t2HaqOdArLSbdEepCZLfprv/N0Z2x7pEig2w39yXHOT6bqzNt5vlLhBTeAjJ/irc8Z75tI/4dYOLipiQKDxy5i+qBkZrAaEGjpvEfLIAf94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-42a56f2e953so2421356b6e.2;
        Tue, 29 Jul 2025 03:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786415; x=1754391215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4bZ2YSDz9PcLt/y/YxbDypRm6SdmfKZh/m8NCUvhnc=;
        b=WeiNJzcLc1sUsuzmRNT7+H11miN6reS8q8iy5+3nMQctlvIu4OPgYRM1gIw1B+7ig+
         jPLjgHfYCYZRIdAyP880cbpstg9sjrE8MEQhVSAAocpPHsITUVHkwMvy9XeOCr8nvdQK
         Nyj5ZCoRZyaxQ1l0LecZghMId/zRn5nnR8idrLkgWU13Jko2ZfqnK/mYWi0e9tW0IR2V
         DhH1xCeZbvFLGgU2/k+WCvptKtWBcZYPi1EF1xlY9K28OUVwJfR50ORkQ0ZugZdJYNJO
         3v6pFdl0ec4kHbTw4ye6IUofO4DzjmL3yp9qumCaE1n4aIJzhV46eZ2W3HkJUCfTh7mc
         Mnyw==
X-Forwarded-Encrypted: i=1; AJvYcCVdp4dfGciqTm30ktB6FMybpdXQC9NcAWN3nKEwXbkn+39oAKajyrhjc0Vdjtwt69Y2EfH6zgW6tsxKKgQ4@vger.kernel.org, AJvYcCWmUyonxzlHvOIBrn81FlaOtYCS6cMYW7PAjcR/eoIZ2IScngvnQ80UEHzzhF5IrwU1U6Hi2eKN1E5R@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1aDZrlEaN28L8wBQsWqdvFk8dWzqbC9NQ1pGh6oopHm+h0uo
	GPZ72RDkvFp4O60+TtQLxu0iND3Xq/Mdynup33E/sgzax4OJF7Okw7cok+1nVLx9
X-Gm-Gg: ASbGncsWDe+gRHcGq1COe6n34XIXjFf3esz+4lY3gkE9l+wj/1ROqqELN6u053VJPZf
	YwwP+eRzF0jYEs9SGnwySBnUSXD9YiZKQF77/TRRfsdO6hhVNaeVqEZSyXUEe8fnxJvXMoFaJZ+
	W6FklcBlvdd8t7IujQEd3zlvg3CXdMSJJHw6fb9aKwdViHso5yKkO5WKkC8z9rbtLgmVjy9ersB
	MC4ppoPoxZT/9bGpI3rMnFQly4RAurgFNZucGgjDy9315rdWtj2j3xBvkBusfgwL3boKTkMU7Xl
	xWw69Sa6n6sImzdlTl325/xrcwUHQjlh0jmQjSA2HaBexdLa88MLLY48HrkWqvAzcq0WygVeUk/
	hhN/Trnidd5+nINvAsZXxXQyNXr5YguXDHNeg7reX7nn4zo3MQ0DBcf7xarOz
X-Google-Smtp-Source: AGHT+IHVBbqi8eag3by7f0Eu4hp+7d+6vfn4crgefLmRJZTxxglCx0m+quEyXXDLqD7+YguUo8xgkQ==
X-Received: by 2002:a05:6808:21a1:b0:406:67b7:8b62 with SMTP id 5614622812f47-42bb9ff4a2dmr8822768b6e.38.1753786414619;
        Tue, 29 Jul 2025 03:53:34 -0700 (PDT)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-42c7daaa9c4sm1490033b6e.35.2025.07.29.03.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 03:53:34 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-615ed9a4f38so2475313eaf.0;
        Tue, 29 Jul 2025 03:53:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3L/AXcptint1iHw8qcewkBKnHprg7jOm63tToatQvyuyRuif0eqqRvcU8gkMjSM+zpPoCAMtgdDUAgGUI@vger.kernel.org, AJvYcCWkRRlSrKy2GK5dj/RHMKVBtK/F/hj+choWCo3zh3TF1Hvr23j7dpZmjTPC1cdkPCjk3G72UwGBISqq@vger.kernel.org
X-Received: by 2002:a05:6102:4246:b0:4f9:69aa:60f with SMTP id
 ada2fe7eead31-4fa3ff027ccmr6928627137.26.1753786050206; Tue, 29 Jul 2025
 03:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726211053.2226857-1-arnd@kernel.org>
In-Reply-To: <20250726211053.2226857-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 12:47:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6Akz0GC2hooAxn=C2F0WjagPkzRKcH1SJiW0CBeUOaw@mail.gmail.com>
X-Gm-Features: Ac12FXyj-OpHRoejRi6VLyYEX-xLeBjx5FaeTUCLN5Csigg1GPqNt4MZlMB_WOQ
Message-ID: <CAMuHMdU6Akz0GC2hooAxn=C2F0WjagPkzRKcH1SJiW0CBeUOaw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Arnd Bergmann <arnd@arndb.de>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	kernel test robot <lkp@intel.com>, Peng Fan <peng.fan@nxp.com>, 
	Koichiro Den <koichiro.den@canonical.com>, Lee Jones <lee@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, Yixun Lan <dlan@gentoo.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Sat, 26 Jul 2025 at 23:11, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> A few drivers that use the legacy GPIOLIB interfaces can be enabled
> even when GPIOLIB is disabled entirely. With my previous patch this
> now causes build failures like:
>
>    drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
>         drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
>
> These did not show up in my randconfig tests because randconfig almost
> always has GPIOLIB selected by some other driver, and I did most
> of the testing with follow-up patches that address the failures
> properly.
>
> Move the symbol outside of the 'if CONFIG_GPIOLIB' block for the moment
> to avoid the build failures. It can be moved back and turned off by
> default once all the driver specific changes are merged.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507261934.yIHeUuEQ-lkp@intel.com/
> Fixes: 678bae2eaa81 ("gpiolib: make legacy interfaces optional")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit a86240a37d43fc22 ("gpiolib:
enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB") in linus/master

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -12,11 +12,11 @@ menuconfig GPIOLIB
>
>           If unsure, say N.
>
> -if GPIOLIB
> -
>  config GPIOLIB_LEGACY
>         def_bool y
>
> +if GPIOLIB
> +
>  config GPIOLIB_FASTPATH_LIMIT
>         int "Maximum number of GPIOs for fast path"
>         range 32 512

This won't work for everything.
While I now get CONFIG_GPIOLIB_LEGACY=y in all m68k defconfigs, and
simple inline functions like gpio_is_valid() are now available, more
complex functions will still fail, as drivers/gpio/gpiolib-legacy.c
is not built.

drivers/Makefile:

    obj-$(CONFIG_GPIOLIB)           += gpio/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

