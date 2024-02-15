Return-Path: <linux-gpio+bounces-3327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09186855BC7
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 08:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90FA81F29E8E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 07:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FC5101CE;
	Thu, 15 Feb 2024 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V7+8B+sz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA2E64A
	for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707982978; cv=none; b=n42Z1dNHEs8BY9lzvdstYT9uY7kG4yO59yWuvNOny41j7ETDxEHIz5T7kwfTJSfyUQ2IQ1J3IBEESQalgTIGfwJ/9odTz6Kd2m4bfaRbJ5E5vqm4N5r7XTptG/e0wjtnJ/1amOYrqNYLsej1BIGVPz1tM3fdiXkce5f6xC6PxUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707982978; c=relaxed/simple;
	bh=7ATovh8Zrf+AwZ4JzRRGlxF09Y1ihfaCoTBUGRElC5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csae8C0YGuhhTbixsNHSIA00ckPXcAAO42Dr0HmmOjg8mToPkOcUPQIVr3xKmXSCZtwBQoxDqwjAc0BDfLtW7prY9g2oHEkooCKpTSWMe5ffyZJ1UXd5ALMXbQ7TQJpH0xAYhHGTAarSdsIzSchTwDtha1YRBebMkXUPKMqwIjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V7+8B+sz; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d6024b181bso180744241.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707982974; x=1708587774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3gVXOoEIsBekobrNYILlo8Y5CWblU12NL0RUb1vlGw=;
        b=V7+8B+szq5a/CqDzoO2AESzjfnYpBoOnGWJXiEhPfZDVQ0gs8YdIo7xmEJDI7KQCcf
         jeKlbM86BkFXbs7mdzCJFsujQ7HuwCYPitRDl37ztiFc6+0rMfw1GBU71nQKaTKPUl6y
         PdgadwkS+znM89ZhZIwWeLdWSi5lyxAWeP40bSd6vNKf8tK/g6JjVNz0Th0hjA/PUKxR
         qz+Oc8Lo3fkmyNMI+2YZGPg0pqK27qV6Lflgl+cpdQL/6qz7ZQzTJEp+0LpZnnv3o+oi
         4llbRVGX6n8CjA2z125QRi8G93NYnSSkSF7z3d7kW2kNuQ75LM20D2POI696MkqLREVj
         ET1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707982974; x=1708587774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3gVXOoEIsBekobrNYILlo8Y5CWblU12NL0RUb1vlGw=;
        b=gbd/UccM6FXPyu0JSYDeLvG0ADDJeGP/SQy8UbPGcF6vW/ENMvNcW6xLetQz9smioo
         0atORh9gli80t7KSzacWXYgSDKFRo2QlhGxskSaaEHS9JHD0CbW3Gms4DHtvLRlEg/0q
         s8c0jtznpiiU+WE92/x3UWXHJ9tVBeRct9A2Z+KessyJE0AKKWIOSkf7FVuXl03yNK/V
         2p/Iy2+9V6o+40FC7MEYVKEK9L032J3cqBJ5TtkyrLKwj7KVy0LXajwCMFYYWgXynr0j
         wXbkxReeA9kzhz6dri95TjPZEKIgwJ+Q+iwb92uA/53AxyxSro8qMf4dj8Ud7OimU8zj
         us6w==
X-Gm-Message-State: AOJu0YydEhASaX0ltJJm75mpMJ1K0E/JXIaCRUUNR9EizPnvcbFcMAtm
	KdRYd9rsipJ9zrwNLxBL2m2Ok8yAtHcRosynZ5KMLi1J893f4gWGxPGtgkJSLIZJKvYiB5aE7WC
	g/nb2PGup9Of4pW6yOtE5tyUb9elIBRMYsYdOlg==
X-Google-Smtp-Source: AGHT+IFAlRhKqIPfjRV7uMjuMrLjenZLw85BDQYZzQiiiKcQEWhjQrfyP3Pz1uxk1YHe2aHokf1HB+xX/1qJrqagbxA=
X-Received: by 2002:a1f:dd02:0:b0:4c0:1937:d29d with SMTP id
 u2-20020a1fdd02000000b004c01937d29dmr910895vkg.6.1707982974572; Wed, 14 Feb
 2024 23:42:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214085248.6534-1-brgl@bgdev.pl>
In-Reply-To: <20240214085248.6534-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 15 Feb 2024 08:42:43 +0100
Message-ID: <CAMRc=Mcn_vGBy0h6ZmiD922JUYRuXDSPSn19Wk5RRyFrU+31Fw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: fix inverted pointer logic
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 9:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The logic is inverted, we want to return if the chip *IS* NULL.
>
> Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_devi=
ce with SRCU")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-gpio/15671341-0b29-40e0-b487-0a4cdc=
414d8e@moroto.mountain/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 6285fa5afbb1..e4a6df2b317d 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -801,7 +801,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gd=
ev)
>         guard(srcu)(&gdev->srcu);
>
>         chip =3D rcu_dereference(gdev->chip);
> -       if (chip)
> +       if (!chip)
>                 return;
>
>         /* unregister gpiod class devices owned by sysfs */
> --
> 2.40.1
>

Patch applied.

Bart

