Return-Path: <linux-gpio+bounces-3908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0286C442
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E791F245E9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D6755792;
	Thu, 29 Feb 2024 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mCNdjvcB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0776F54BD3
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709196871; cv=none; b=p4YuDqIfQAAMc2McgzRzMIRmTNP284sMx3hMjr7VwWLeJW9gjzgDy9tTgCcfBfH5yQQWRu57b89UCsoVXRvNfayzHcLI8TLnvQpQfnCVjrZxl/qp1UWUpB1ZZt93VH+fhIgihM+awcKip+A39xLfGGlpoaHjzJyToYlLnoG0CbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709196871; c=relaxed/simple;
	bh=C1F2Ot/uuDkqnCmlWjA10L6hOD4/wEZFsiSfuMKB0h8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O86FBc1C35hHu+7rx46jL6vMMLADGbAmG8+RL3sAUusMor3jDqeswtO6NMXiitrstPZZga+6XsVklTzEpbTVoAds29xXLgOGONBUUt9avR7m/Je2BVtYheOTig2aSO4/7Jw3gjeL+Lm1xjw5PqBx8mF3lg0Egi0Dfqs/Qslgv+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mCNdjvcB; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4706ea080a1so176426137.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 00:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709196868; x=1709801668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ivoGOjqE6+MRAhBQTZ0x3vwRP2KnVaf9z7bWvGe1CQ=;
        b=mCNdjvcBOLunjXt7EwMN8p+IhJRtz0aKHcntqG+3ZLEakgQF1VFWcA2VYsGw5uNh31
         gqHP7X77x+4Wz9QwqikIb3hi/oXbthVG6DExwJ7iBigZWgfcrLuyob/H5H95TXCI+6tO
         QLQLDKZC+c8HNq20X9DPuWzgtBa8PnElTqNccZI//DUQVDjESD5nYbXeLpz8lEpAKmuQ
         p3Aa1dKptXTY42sW7mbeiHKOt9CXRIXvIVaBAZKfjzjXmPbCQIoLy0BKFwNS9XduM/Nh
         ln/nSLutDoXZ9U8DjkgaLEFcfuvGy0zKNSZgjEgwImsfAN23DusxAJnWm3Tybga/KGsb
         mVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709196868; x=1709801668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ivoGOjqE6+MRAhBQTZ0x3vwRP2KnVaf9z7bWvGe1CQ=;
        b=d0QVT2k0YEXY1hKDa1uOc5/E+8iMtNcqk77HmKEHXdxhl8PwbIo2uhEosDX6nlniqX
         jG0sgpu8tg9+dbORFZdwNjgTJpcXJenqzN8r4B63X+1zjGe+fv/rwoZbBG06XyW/fIsN
         nncQ+OuZIlYwzjO66aKqZs7Qgtlxm/lKzQkAj+t5g9MYva7tr8tB6iH0NhjIOOYWtbwM
         YBLjrlPNG8pG4qmxsAKZE4gX4wGlPtC8+zM9DjpKuH11X32xHzgPWHH077L4fQpwkLU0
         mwlklOPBZmAdVctoR+N/1wB93gLx1favS4vbSFHWeQe4em+zt0KWSfBpBiORyH+cZBbT
         w+yg==
X-Forwarded-Encrypted: i=1; AJvYcCVnD1nB0n0FZ+THN2F63rCiS3UuSYZ54/8dUVPwakUJALGRThVSd0JbNGwK/X7s2uWtiP08kYneyhNxEe/Jmhqw3PyAqpmA3CbPYQ==
X-Gm-Message-State: AOJu0YxgDD88iJXJS0KF0xwBCCgiIj83ydydSVLg5UE1+Wakz74n1qXQ
	5xKYaTECKdS8FX4Lnqsu2D7Ons+er6pvPHFkz29wFornODoNAUjuzcAJhppAJILmTfsX69SLB7a
	jt9dLh4I0OYoSvnmN8Bp2fXga4LoWJdXizppOiw==
X-Google-Smtp-Source: AGHT+IE8KR0hqNGhiSGQT0yvEfNj2h1/XVWsiLkv68dkCjqTMzMmkNY8p8YJ7bhmOEX6w30P6C13O0TOFaoQft4qnsg=
X-Received: by 2002:a05:6102:3166:b0:470:6d8a:a8f9 with SMTP id
 l6-20020a056102316600b004706d8aa8f9mr984804vsm.34.1709196868030; Thu, 29 Feb
 2024 00:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229084555.43701-2-arturas.moskvinas@gmail.com>
In-Reply-To: <20240229084555.43701-2-arturas.moskvinas@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 29 Feb 2024 09:54:17 +0100
Message-ID: <CAMRc=MfTo7MnfMhRQsjeFsLv3yjEtP0C3ytqACN+nuGw0Sr-Bg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: 74x164: Enable output pins after registers are reset
To: Arturas Moskvinas <arturas.moskvinas@gmail.com>
Cc: linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de, 
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 9:47=E2=80=AFAM Arturas Moskvinas
<arturas.moskvinas@gmail.com> wrote:
>
> Chip outputs are enabled[1] before actual reset is performed[2] which mig=
ht
> cause pin output value to flip flop if previous pin value was set to 1 in=
 chip.
> Change fixes that behavior by making sure chip is fully reset before all =
outputs
> are enabled.
>

Use imperative mood in commit messages - make it: "Fix that behavior
by making sure ...".

> Flip-flop can be noticed when module is removed and inserted again and on=
e of
> the pins was changed to 1 before removal. 100 microsecond flipping is
> noticeable on oscilloscope (100khz SPI bus).
>
> For a properly reset chip - output is enabled around 100 microseconds (on=
 100khz
> SPI bus) later during probing process hence should be irrelevant behavior=
al
> change.
>
> [1] - https://elixir.bootlin.com/linux/v6.7.4/source/drivers/gpio/gpio-74=
x164.c#L130
> [2] - https://elixir.bootlin.com/linux/v6.7.4/source/drivers/gpio/gpio-74=
x164.c#L150
>
> Signed-off-by: Arturas Moskvinas <arturas.moskvinas@gmail.com>

This looks much better, can you add a Fixes: tag as well?

Bartosz

>
> ---
> v1 -> v2
> * Updated commit message to contain more information why a change is made=
.
> ---
>  drivers/gpio/gpio-74x164.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
> index e00c33310517..753e7be039e4 100644
> --- a/drivers/gpio/gpio-74x164.c
> +++ b/drivers/gpio/gpio-74x164.c
> @@ -127,8 +127,6 @@ static int gen_74x164_probe(struct spi_device *spi)
>         if (IS_ERR(chip->gpiod_oe))
>                 return PTR_ERR(chip->gpiod_oe);
>
> -       gpiod_set_value_cansleep(chip->gpiod_oe, 1);
> -
>         spi_set_drvdata(spi, chip);
>
>         chip->gpio_chip.label =3D spi->modalias;
> @@ -153,6 +151,8 @@ static int gen_74x164_probe(struct spi_device *spi)
>                 goto exit_destroy;
>         }
>
> +       gpiod_set_value_cansleep(chip->gpiod_oe, 1);
> +
>         ret =3D gpiochip_add_data(&chip->gpio_chip, chip);
>         if (!ret)
>                 return 0;
>
> base-commit: d206a76d7d2726f3b096037f2079ce0bd3ba329b
> --
> 2.44.0
>

