Return-Path: <linux-gpio+bounces-11979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DF19AEBF4
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 18:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AFC8B22B1E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 16:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D63B1F8F17;
	Thu, 24 Oct 2024 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V96nFQnU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B561F8190
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729787142; cv=none; b=jbBlCcvFS1ZRlsBUW7iIQdmBm7rl4AuxKhuGwWwfbDmBOGAUPfFLbQfvGTIbsEYFG6xzj3QYlj8Wcb0mWeZUVbI7U8LtOe+YMpgSk2oVq7yx6BO+iXsUjfXWd1cLf/FDMsHiB/FgSvCa6Go10pxNMeColvrNhqTbqFcuo0BeTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729787142; c=relaxed/simple;
	bh=OAPSpUedeEUckclFjG6DDdR8qgsIG62TaJs/5OaZsEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED7D3MvLrg2sTmw0a8A8NkKDQFXwLskuHqFXNliA1Th1TqIgJD8IwKwMTMT6ypnKhBmShntAf1PzOujnnoO6qAd+6l/uGRJX3UI/+eWwKMrxnUPMVaMPECoII5+Gt01kJ59QQH2sTflXJ2br9yNX5c0qw+jg5VKOqvL2FcqbgaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V96nFQnU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53a0c160b94so1407613e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729787137; x=1730391937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaVodWPgjcH8tsGxt8jb8nKhmhJWoF+LRkqvK6BBOGc=;
        b=V96nFQnUzfx31Rf0+DzkxdRsKOFTlZeMsho+sVCkIGQQsc9GQOW10a295sOqMDlDsL
         oFP0Y+A/NNuWd1x9jXsN/WoFHD75pNUm1rIivuSEgwB3Yg0iM1oL3aywH3imVPN3ENKH
         8A4apv0TpGO8r9H4VJh9igrLHswaknTcmGwlUJKiI6o/Zts0X91Jt4pQxrA4tUxqeXoV
         +iZTEADCWUQol8knKN+t2OXm83nS2byxcnnYEWYwTcpbsGNBqbSwKeZ0f1yf8XvAjbLK
         8Di5bhzCkCaAF4ralzYRGBFYIhZF84m9PWKYCnw4wgNbdZcCW4Rrjy0R9MVjvTZCD+yi
         +I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787137; x=1730391937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaVodWPgjcH8tsGxt8jb8nKhmhJWoF+LRkqvK6BBOGc=;
        b=ege6lMsNnKl+Nn9vVT83psFb1y/171uR26QnFBC62W2XNDUTc9wlEbQotIFQpNoavR
         +/jNA0rkGgK5dfaOGbUVQIe818JulZAzwM4u1/t13caxHkAwrazOSHey726aXphdW6CH
         trlJwJTFEy0usZlYUi/D47CfECC0o0V46C3kQKALY4yySOR8imkEIrk4mmDh8c1j2X/T
         aexB7EqqAL1HfS8fBVAVlTsESL8/7Ae0viK2x5OkjbW7Olo3X4vfB9eqBBAxPlhB36xh
         EqqR+gOjwDhH+hQbLa82SITYeofgcUmKdU0O81daxUilHBBugfQAhXGU+Nnqz5wAmrnV
         RTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdKwnUpBG+1t6r8JH/Mr1WFEY3LMrOIOuxngf6poHRDI2Rzg9xAT93U7EwvWgoY5lSQvlt3bHg7pUt@vger.kernel.org
X-Gm-Message-State: AOJu0YzFi+SHhMiLjgziX3DPGoVTfUXjtkXVIMDHwM+dMkzf6uUHxOD4
	qnSNVaOaiyDk6Dbgn2VUHSbxLGB6XybBuSTNaDLLxcQzDuNTfCENLJC3K/6uHPIPeEtdTXE4iOV
	NgvC87zEaGvX7pXt88z4rfZ0N40eI7qRNjx7sUg==
X-Google-Smtp-Source: AGHT+IF4Lq+2eXSfonx/SUOfJOhnw5xZtxyjdd8anPhybYw/WQef7jYKMZFrww6dEbKOQQqCgj/CR8usnWb1LqKYINc=
X-Received: by 2002:a05:6512:e83:b0:52e:9e70:d068 with SMTP id
 2adb3069b0e04-53b1a2f1fdfmr3816905e87.4.1729787137201; Thu, 24 Oct 2024
 09:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024133834.47395-1-brgl@bgdev.pl> <bcaa681e-7ea2-40b0-8f9f-0bcba5010b11@gmail.com>
In-Reply-To: <bcaa681e-7ea2-40b0-8f9f-0bcba5010b11@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 18:25:25 +0200
Message-ID: <CAMRc=Mf+rJPcQkGOF4cJAov8PpQeW1OQVr9Bqb9rJmksn5Bu0g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix a NULL-pointer dereference when setting direction
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Klara Modin <klarasmodin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 3:44=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> On 2024-10-24 15:38, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > For optional GPIOs we may pass NULL to gpiod_direction_(input|output)()=
.
> > With the call to the notifier chain added by commit 07c61d4da43f
> > ("gpiolib: notify user-space about in-kernel line state changes") we
> > will now dereference a NULL pointer in this case. The reason for that i=
s
> > the fact that the expansion of the VALIDATE_DESC() macro (which returns
> > 0 for NULL descriptors) was moved into the nonotify variants of the
> > direction setters.
> >
> > Move them back to the top-level interfaces as the nonotify ones are onl=
y
> > ever called from inside the GPIO core and are always passed valid GPIO
> > descriptors. This way we'll never call the line_state notifier chain
> > with non-valid descs.
> >
> > Fixes: 07c61d4da43f ("gpiolib: notify user-space about in-kernel line s=
tate changes")
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Closes: https://lore.kernel.org/all/d6601a31-7685-4b21-9271-1b76116cc48=
3@sirena.org.uk/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   drivers/gpio/gpiolib.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index ae758ba6dc3d1..6001ec96693c5 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2695,6 +2695,8 @@ int gpiod_direction_input(struct gpio_desc *desc)
> >   {
> >       int ret;
> >
> > +     VALIDATE_DESC(desc);
> > +
> >       ret =3D gpiod_direction_input_nonotify(desc);
> >       if (ret =3D=3D 0)
> >               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> > @@ -2707,8 +2709,6 @@ int gpiod_direction_input_nonotify(struct gpio_de=
sc *desc)
> >   {
> >       int ret =3D 0;
> >
> > -     VALIDATE_DESC(desc);
> > -
> >       CLASS(gpio_chip_guard, guard)(desc);
> >       if (!guard.gc)
> >               return -ENODEV;
> > @@ -2841,6 +2841,8 @@ int gpiod_direction_output(struct gpio_desc *desc=
, int value)
> >   {
> >       int ret;
> >
> > +     VALIDATE_DESC(desc);
> > +
> >       ret =3D gpiod_direction_output_nonotify(desc, value);
> >       if (ret =3D=3D 0)
> >               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> > @@ -2854,8 +2856,6 @@ int gpiod_direction_output_nonotify(struct gpio_d=
esc *desc, int value)
> >       unsigned long flags;
> >       int ret;
> >
> > -     VALIDATE_DESC(desc);
> > -
> >       flags =3D READ_ONCE(desc->flags);
> >
> >       if (test_bit(FLAG_ACTIVE_LOW, &flags))
>
> This patch fixes the issue for me, thanks!
>
> Tested-by: Klara Modin <klarasmodin@gmail.com>

Mark: if that fixes the issue for you as well, I'd like to pick up
quickly and fix linux-next ASAP. Let me know.

Thanks in advance,
Bartosz

