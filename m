Return-Path: <linux-gpio+bounces-5049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C7896DD6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 13:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A7751C24EC4
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 11:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0294D1419A0;
	Wed,  3 Apr 2024 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X56YSJfu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CCA1386C9
	for <linux-gpio@vger.kernel.org>; Wed,  3 Apr 2024 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712142886; cv=none; b=DscKjNpGC1g6a4IoYH0AAMgWAGetvFLH2nHDNDqI7XXX3QuqGl50ctzKrb2ZlR9hAKnXNbGUxMBy7aIQJblHLZsKEeLxYWJ4AflCmlq5fcxSvuUPWOaEbtUwPKqAyYHahSAGtaI+vWI3QyFHbK4QNjQSVIi5EJA0oNthvYhcVxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712142886; c=relaxed/simple;
	bh=4dHen/LG9VvUA4vaNwOXfwrjtdQI8Ef8IuzweWNrq8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eC9mVf0izZ9C0zTsm/jYHhQOyi4JHocMdSSISBBnwFah53Ahp1aToCoi5u1876cLAv5m6KLgaOK0FXfXy8dYILlRm2D01lzff2rTDEVNvzeFcXrm+i7jKlfjU9cNYghxhXbqnbOL61EV5plCRS1gkZf6VQVvtLFCk2DqXX/serA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X56YSJfu; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516c1f534caso12263e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Apr 2024 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712142883; x=1712747683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0nFW594aT7o5X9JZAIpTWGMmhMtKBdSxH8O2b6eDQs=;
        b=X56YSJfuNQOKfWw3DIDCM7V0NtwzalBu++KLxpmSthF5Acf8qgZ1hYPKOvSi8wh1gX
         Yp6xLEE2sO5Cs4tNJmaJp8FMzSKmubUoP3KjSEgOjCwjED9LJpft2CdMcoblsJkrJ9dC
         +/SHvkuzFtkwyZx1QXUzKht0IWA6ZJrtQ8wwyZNd7fh1/9EHHW1SJ4NGgbxwhKr/ruC+
         1lIzUVKobSBcZLk+T5+Jz7U53ksYZXlOPrWJc3MpXYxucuXltmqjQM6+CBtJJ1yefQjD
         q9ISYQvmDyTZR5CMryjcKjlnwgnT4fJ7++VXvDvJc9brrlhdpruyO+iOeGYSi75UTNAx
         8q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712142883; x=1712747683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0nFW594aT7o5X9JZAIpTWGMmhMtKBdSxH8O2b6eDQs=;
        b=Py4UlMCMZwKKPBB06NkB2WOZKt/a3idzR9HSw5y5xRT6lh47OAB8QhChOtRxGwrbpg
         NDcQ81y2asVjkeZJMNdv8Swux6J62jUKr7ZIAx3b48IMmBF0mxXhfb4tXTk9enx2/cJx
         G58+5l+ZvTyLDAmh/tItiopSiw/L2KqCB3sTQm2sqLFwLKIz8ulW2WqGnQmYOPd5FVMZ
         n5GA7uBd99mEnhBQVi9uCKLUenLY6+lmJCHL5xO3F8vqF14wDNe1NOM/vCYiGa5Wcr53
         HUyHQ3hUTxLOTWOWMvX0YW3a84tWu8Tl8xUcE1EWkDtpUKapJBCiSRJVMUEsP1aCMwf7
         LF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrtyS5C2lieTTYtABPqsx8YXGhwi1TC0Ams6Tbx6fvAO/VO7qeRItTIEO2MEnkhKhK155TJIE7uPXwdHYrU3mWvb1Y0Hppl2dyjg==
X-Gm-Message-State: AOJu0YyX0xRyISms1IjDgEGPpvfOqgvdgNkEKiZACgg4J+yGOnoX/+Fh
	xVjq/OC/a46hDU0Avod32htFPRz81/sk+M6255hbbOtlGTeUYnURtKjppIiO0CElKEbDJjN8FaI
	5gfsqPxKeNu3QsCKIAH4FeCKv7t+rOqGydqiyCg==
X-Google-Smtp-Source: AGHT+IG4z+4Ndr++qcPD3IhaBePnk545Jp4QWd/wFfePEK48Nb2+1h6x3A0lxSuntNtHpaS9ouWx4IHGkN/0YtNh8WA=
X-Received: by 2002:a05:6512:1044:b0:515:c9cf:7245 with SMTP id
 c4-20020a056512104400b00515c9cf7245mr4927235lfb.38.1712142883469; Wed, 03 Apr
 2024 04:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326181247.1419138-1-andriy.shevchenko@linux.intel.com> <20240326181247.1419138-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240326181247.1419138-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 13:14:32 +0200
Message-ID: <CAMRc=Mea+avqmdRgUhAuZPuEh9F3ET_6gYOGGwb1LunkLv4uVw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Do not mention legacy GPIOF_* in the code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 7:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We are going to remove legacy API from kernel, don't mention
> it in the code that does not use it already for a while.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5589e085ba25..f749ece2d3cd 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -364,7 +364,10 @@ int gpiod_get_direction(struct gpio_desc *desc)
>         if (ret < 0)
>                 return ret;
>
> -       /* GPIOF_DIR_IN or other positive, otherwise GPIOF_DIR_OUT */
> +       /*
> +        * GPIO_LINE_DIRECTION_IN or other positive,
> +        * otherwise GPIO_LINE_DIRECTION_OUT.
> +        */
>         if (ret > 0)
>                 ret =3D 1;
>
> --
> 2.43.0.rc1.1.gbec44491f096
>

Applied, thanks!

Bart

