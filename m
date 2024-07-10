Return-Path: <linux-gpio+bounces-8155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8492CC02
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 09:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055331F22FA3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 07:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A65D83A06;
	Wed, 10 Jul 2024 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jcnnFT/3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E083A07
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720597010; cv=none; b=hDhdzOuouDJNp7faLPi2b4zhPEgfSgSjACVfoRpeyvlWSR75z0gCbQm3s7j1Q54Qd89eg+vWUOXWoNo+6pai83zLCRF4JHvlPpPw6TGKreMu5HNWh6w6KltUHwWRtl1uHpxzjr/cVaNwu5UbYwAZoAXnrMO/1MrhkEpoGqoEj14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720597010; c=relaxed/simple;
	bh=A3kqLCCwUuJuzMrYfQCFrZqwKdRl1NzfEjEktKbftFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgLRAFIjzHnx2mJ06FcpS6gIzfGaY0oQCclkz0P4x8jrZK/2GpujnlD1kZ9ZfUbU8arKYJ+G2PgnF1pviB93hhIDJm3sKa7Gjanc96+2Q1TG5W14Sy+yQU38CamE4Qip7tKSyX2X478c7EUSEU6j/0Pf7vlC0M6NvtcxNL4HNlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jcnnFT/3; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eeb1051360so25055221fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 00:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720597007; x=1721201807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yanBj91mPN2P41yJnyEyGDttLBJBewn5PScwOilvMW4=;
        b=jcnnFT/3YIR931oXtiGQd4PYyao2fMkW7JGEwhlbv5PPNwVgPQBA6BJIpVqhMqQ+0S
         vFbINBS0Ehl3Oul81MW52vAOSO1UHUlLRyVBCGsdeuNBYiMcp2bPShzygbJukCs6RiMM
         ab1B5CEkyYimbrdMNppt6aRegaKB19j7GPW0EjbORbhDI/x00hQWSNshC4K4ZEMUlruA
         s3c3WtvEU3BCtErfTMPz4+Nh2rHA+KbqXotp5qBZv3jssU6BExYB9VNoD5braSU0BjUg
         +StWwkEwXu0MRKvWqsQyBRcD+K+6/zgmwR0RMCV6ZRut1LL/lEuX5fJ7yaykYqk66Xv4
         T+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720597007; x=1721201807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yanBj91mPN2P41yJnyEyGDttLBJBewn5PScwOilvMW4=;
        b=aFqzkUJAWwqRYFm9wxKJsoJ7PZhkgAyypf0FWC2VVr+VwR7bzkjDWngR1DzxMp/+Qa
         eMEIYdv3Vxb06CuJkeyPkQu/IB7pXKhvr7DMxCn/7U8LGMmH+Hb8WnlpZpm9j6baBikm
         EaQ4NRgzIkC5Xzy8RhQ/K2CxZgvodd5VrwVcquxBt70ROb8KFtnAIzGat9ez9ndCJ0Nq
         3v+XFdWHO0K0pyu5QYQTDMhXMKFM88/nhznn6mDVSak864MpK4L/QgIz/F2ss1pnyFht
         IEWJ0fG9AZkPxbwaDY9ckZsKn6IAh9CeOP2FWxr8NGc6fDrqyMMFvp4rtXX6Qj3RG7AA
         FrvA==
X-Forwarded-Encrypted: i=1; AJvYcCV5BdpXVGDYecsm6QNVJ9NgNtJRzDIp+Oh7pn1Oddg40WqpJQ7PbtrofdbcqDAIavDwmMknYpBb8C9/AQUMPB2zloiQbgJ4LIoSig==
X-Gm-Message-State: AOJu0YwyH1GiEJNHTos8wLAuFwtV8w3cnJy8hCxRARAwEU6zk4bfq8up
	zguuEiaw4u70aZ5OA4WTKlaweBZi20raEzXiBwetClxjJHyAGxgb2L26OsoArzAq4YIBtbcsK+I
	NdcBszQDMIr02JzEEXIPx3hgvMttLE72j1Trb6wjBd+4d9j30
X-Google-Smtp-Source: AGHT+IHZs0FPfAia+36yPoydAdjKd9uUEK7NtYAlPQW74MVYfWi86+EAwL5XKt/IjF+VmJLBrmsbpZnns7Y+ARRSQXY=
X-Received: by 2002:a2e:9892:0:b0:2ec:1810:e50a with SMTP id
 38308e7fff4ca-2eeb3188dcdmr29378621fa.32.1720597006848; Wed, 10 Jul 2024
 00:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710031108.2002416-1-nichen@iscas.ac.cn>
In-Reply-To: <20240710031108.2002416-1-nichen@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jul 2024 09:36:35 +0200
Message-ID: <CAMRc=Mc=z86zN-ReK9++piirOE6Wgeq6BnEy15Os5Fx7Lqazdw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mc33880: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 5:12=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpio/gpio-mc33880.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
> index 94f6fefc011b..5fb357d7b78a 100644
> --- a/drivers/gpio/gpio-mc33880.c
> +++ b/drivers/gpio/gpio-mc33880.c
> @@ -99,7 +99,7 @@ static int mc33880_probe(struct spi_device *spi)
>
>         mc->spi =3D spi;
>
> -       mc->chip.label =3D DRIVER_NAME,
> +       mc->chip.label =3D DRIVER_NAME;
>         mc->chip.set =3D mc33880_set;
>         mc->chip.base =3D pdata->base;
>         mc->chip.ngpio =3D PIN_NUMBER;
> --
> 2.25.1
>

Good catch, would you mind adding a Fixes tag?

Bart

