Return-Path: <linux-gpio+bounces-8300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 009779378F9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 16:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 215C01C21336
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 14:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E495144D16;
	Fri, 19 Jul 2024 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Tdj1A2+s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BD913B587
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721398221; cv=none; b=lEqpGtElRYVQzTuuB0LXbUFODa8W1cCkZijdpsf/Kh3hw8CnHfxPM5aHyXivpt8rpklzgzlwYNjshMtsoihFfaHHa8G9gWAJnENRI+D0jfB04t4QciN2WwEsCxYgszWDWDQxAxfJN3dumKt2U7ZJRa0J+X7XKPys01GB9CevwDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721398221; c=relaxed/simple;
	bh=XXNq/TIrKJmEsbi3WIUrww8lQ9Bn3FIeaeeUxRgcivs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJdXlAcedNmJtZRlR8Lx49vjXBQ2WdmRhXLIN1oOJGyj/+nf6t5ROfHEXDKgmHrlsL8yO7b9AE71VqETyVHw5d3WDX0gnBGZ63kddcf7RYXxVCT1SxUBC66motEUhWku78BWY35mZb9Hj1s/EGk/U9/FPFWtBomEgzJH+9xAOw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Tdj1A2+s; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea16b429dso1167216e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721398217; x=1722003017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPJYhxD5QUZ1YTn+CTEj8tB7Wyj+H85ogIQ6PPNzWYA=;
        b=Tdj1A2+sAu6L3ovRD6VVvlxQZP7A0Pbp+ElD5a0dH7aKAGe9NO2LRUjUsMKoFrbehi
         AX7dNqcmutob7XPsGEhv+GUbdc8kFnuQjDX5uIsln0JlmWKPPZ5XFeR9BdK5gdvjgdEO
         zYz1nSDQQjTaMzAwX+m4zh1Zo0R2brBqoP5B/PtlazboKxlZv+328bjOPXV3YMp8ZUtB
         WjhTv3Jh1FtB+k6Rq9bDdKPjRJ/akgAdSpb+85RkTgFTpWkTfwIXtMP30z5ga5/kWYLo
         4aASaA9GBdztfQNk/+Mo8cdyJNdlBzmwE6QkuMW67uqjfi6Nrp8pZ2LuGRUP+OYS/KPn
         kpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721398217; x=1722003017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPJYhxD5QUZ1YTn+CTEj8tB7Wyj+H85ogIQ6PPNzWYA=;
        b=ifL254EuRMlwpTnXZ1PiLIDS7lfGkRdupCsYXatfLZ3e8WGamTB2S4XI61axE+O+rq
         ijfMrARMTEILgur93YH0KveIygPxihPT+VdqMUK2etpa34EkvcnmjPQpLXphsPEGZguW
         JoNWYZ1hnYsEc65Tr8/hbM3Xcx4ULiCEoOI2joNxfQFnUNpFHaT6qV/b4chPlKkmyxSX
         6qWUqpAnj/ZIfu09tHv4fXRyVfkGWonVKMyEGkoj0hJ/1ef9LRc6xXDMLnGXi3R2CrEZ
         in24vqY6Yx+MmoQ/Grr7fJPnJMHowF8OW4taYD3UpQFuorbsjNuxpokFeKDumkag4H0r
         WmMg==
X-Forwarded-Encrypted: i=1; AJvYcCXeu0U4e2lEzNSFblZqsPY92OJPnXDb5Sv1Iwz+hPR0QycVKxMtFQjoU8Mu75RWMJZ4G5wIBqhKAiXNJBdDJ8/Fi5hLJzi82c6VtA==
X-Gm-Message-State: AOJu0Yyywbpw7VsfZS47FWskNSVHkJp7QXwA/gcBY+9zsuURFkP8KHhx
	vYP996QLEslUKPQJTIpMlpsC4byhRn14KwyutFuI9wmf3HoCxF2Rz7fLrdoLXarBVumbIrbX8wo
	dNblzzdcjHOS2M+L53Q9b6tZreRHTVC3HIt1F9w==
X-Google-Smtp-Source: AGHT+IEvx+h7obyL4rWNE0Wtb6miat17+rY08TFzpYjvkXbER1T0Hesjn6pqvW3OkxwFsyWHX0xMc3jKLoyxXvCZYsM=
X-Received: by 2002:a2e:9f4c:0:b0:2ec:73d:4f8f with SMTP id
 38308e7fff4ca-2ef06350c39mr17663191fa.6.1721398217058; Fri, 19 Jul 2024
 07:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719114650.1551478-1-arnd@kernel.org>
In-Reply-To: <20240719114650.1551478-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 19 Jul 2024 16:10:05 +0200
Message-ID: <CAMRc=MexLwZqoc-ymuu3OSu5YXcqdmfLuX88kK0uR_6WqHgp_w@mail.gmail.com>
Subject: Re: [PATCH] gpio: virtuser: avoid non-constant format string
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 1:46=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Using a string variable as an sprintf format is potentially
> dangerous, and gcc can warn about this:
>
> drivers/gpio/gpio-virtuser.c: In function 'gpio_virtuser_dbgfs_init_line_=
attrs':
> drivers/gpio/gpio-virtuser.c:808:9: error: format not a string literal an=
d no format arguments [-Werror=3Dformat-security]
>   808 |         sprintf(data->consumer, id);
>       |         ^~~~~~~
>
> Change this instance to use a "%s" format instead to print the string
> argument.
>
> Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the =
GPIO API")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpio/gpio-virtuser.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> index 0e0d55da4f01..c55b72e426c7 100644
> --- a/drivers/gpio/gpio-virtuser.c
> +++ b/drivers/gpio/gpio-virtuser.c
> @@ -805,7 +805,7 @@ static int gpio_virtuser_dbgfs_init_line_attrs(struct=
 device *dev,
>                 return -ENOMEM;
>
>         data->ad.desc =3D desc;
> -       sprintf(data->consumer, id);
> +       sprintf(data->consumer, "%s", id);
>         atomic_set(&data->irq, 0);
>         atomic_set(&data->irq_count, 0);
>
> --
> 2.39.2
>

I know this should not happen as the string is checked for length when
it is set over configfs but while we're at it: maybe make it 100%
correct by using snprintf(data->consumer, sizeof(data->consumer), ...
?

Bart

