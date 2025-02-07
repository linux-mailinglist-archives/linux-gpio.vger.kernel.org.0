Return-Path: <linux-gpio+bounces-15525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B420A2BFDD
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 10:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 201E316943A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B7F1DBB19;
	Fri,  7 Feb 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AuZiKwZC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58201A2381
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921688; cv=none; b=AgV3RfdCet4u6s7+rxcKUnFpxDGgGjoq0byObxjnofwr1my51RnkV0iWPqkSqVlLNLompe0MdpT5jUXikETOXqRTTMN5I36wCLmDVGYD565DNdONoID3nrzRn/+2GNExL+nodjgMh/8OCmRJPjnnyBFhS8po4X7+sVZkA4zJy78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921688; c=relaxed/simple;
	bh=ZJAYWDeAfSNuuTW5xNrl9dA60NGzl85UUJgwVt7HSzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhDhJgdBGCEREBnjtK7NOBZDsO9O3LahwHFTuHcxjY3hlZ2iV81BCF3CVBdve3sZp4FYsenxX2Dire6lRavYd5NHhIqH8MWV3XWXX+IPuaTZXFZlvIgKVYRJlCBWqJVuvm9+itdh/aWQ2BGbr6l5kQzws11Ycar09oC0g5U01B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AuZiKwZC; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5b41ee3065so1100694276.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 01:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738921684; x=1739526484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEK7srIgXJXdQr67Fg7HQYgRLAiGEeTLhNAT3vGh0e4=;
        b=AuZiKwZC05Shr83w87ulFDaS4v5ZirpQW/K6PwRoCZ+MMWO4vRxGyxNa7iJ1cuVIzP
         bypVtP51vqSMlNnXNoeRBK8LWdpzleq+/e/SFMd/TuvWA0HEq/osed9rNKMju9mDqu7h
         25GTZPezUQQYPSWZ7cb6CCTU7DZLOEPBzuEtq8/EgTuiy/UgIjvlyoY8p6tkwMd0+Ewb
         PEJQsq9EXBCC9pXUoEfLukqaldIfNjyTkyy2OAYXbMhO//vf/sF+TWqI5GnZXkKX3WPQ
         3wk/Rn0LiwIBjOrCVe5Whk2ZU6syJ8GSnq3Z59vM2DtPPGYA/pyDqw2jJT5ayJpYq1qM
         Ew+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921684; x=1739526484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEK7srIgXJXdQr67Fg7HQYgRLAiGEeTLhNAT3vGh0e4=;
        b=oNbLpcvEKmyZnM4NNAbtl0tjmfjtcVtyfV10U6qaf2ygAJVzQ9ZYElBNFH+ZBbyRQL
         q1kQ9DjLZvrFxq9CoGeGUszTYOsXkrxp79X1JkLegLHOKRy6j505XEyqDvq0rC6Wy3eZ
         UbJSo9ngubqzEuVrn0KGhg+2Xm6XVyI+2mB+v1i3qQ/A1XhD7/rY8qa+venvxy4+SLHu
         yD52HymUvgmjm2mxVH88jBAmoThgl8G8zbgjyoZPZqs03a1SIWoe+mj6ZD2tt/Dh18m6
         TszdrRGgYrlrcEZLq3+t5zWGMXXKReRp1Z/uAaSF1ejTHrU0UiRSDLC3mlAaC6HVpz0s
         DCfg==
X-Forwarded-Encrypted: i=1; AJvYcCXn/hvQfYDWXvgNhyN6YVEupzxxMzR5zRZUaTONS+mHudfG7edKSxrChEPg55PwMOKACQMlGXCUjHCa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxmoj+8lhhGNd19dOwHjzxNn5PIJ9NbV9Byuq2FVB2XNG64AED
	kFa/XyHkOgmcuLABUCyrDISqpjfje+Ze6aM6DQGQ62BxWA/gbbcRJny6fQd9zYve7HmQpZmtMrF
	iud9gMvkFsr9jtVQJOdmbSOQs0uffGDbY1PN4yQ==
X-Gm-Gg: ASbGncsTO/qsgsqgoyb2SZCko/9K9HSIxH7GUDxAWD0F2FTdJYOknBk6jFZ/nx7+qBg
	fUvpCoZ5Q9HKOcDC3E4iCw22Rca539cfvpNz0rAPNlgFoMMSumNaxmtLCtgig2BWT8+MZ/26LHQ
	==
X-Google-Smtp-Source: AGHT+IGaJbQYks+y9NqxM+qNlDYUH78x9F5VX2tG1O9YPe70PH5B1lWBp0wyp4yxEx4N6batSHVUPkLgj4MGDriydyE=
X-Received: by 2002:a05:690c:6810:b0:6f9:3e3d:3f2e with SMTP id
 00721157ae682-6f9b2a07006mr20703297b3.33.1738921684631; Fri, 07 Feb 2025
 01:48:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com> <CAMRc=Mf9WQjVXvea7tHx0MJG2H8Yqxw=zGqvjp7dfD7+=huDKw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf9WQjVXvea7tHx0MJG2H8Yqxw=zGqvjp7dfD7+=huDKw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 7 Feb 2025 10:47:28 +0100
X-Gm-Features: AWEUYZnfTmLhFuLgJjE2ppjqoqNxz5h92L1nmRlGKxGgOfCbaSg6_8WxaR2gtUA
Message-ID: <CAPDyKFoNuXpTEm1rLPvAgib+ugqr7XyETZhfrNr6ypOOKRwjXQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] gpiolib: add gpiod_multi_set_value_cansleep
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Lechner <dlechner@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Feb 2025 at 08:49, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Feb 6, 2025 at 11:48=E2=80=AFPM David Lechner <dlechner@baylibre.=
com> wrote:
> >
> > This series was inspired by some minor annoyance I have experienced a
> > few times in recent reviews.
> >
> > Calling gpiod_set_array_value_cansleep() can be quite verbose due to
> > having so many parameters. In most cases, we already have a struct
> > gpio_descs that contains the first 3 parameters so we end up with 3 (or
> > often even 6) pointer indirections at each call site. Also, people have
> > a tendency to want to hard-code the first argument instead of using
> > struct gpio_descs.ndescs, often without checking that ndescs >=3D the
> > hard-coded value.
> >
> > So I'm proposing that we add a gpiod_multi_set_value_cansleep()
> > function that is a wrapper around gpiod_set_array_value_cansleep()
> > that has struct gpio_descs as the first parameter to make it a bit
> > easier to read the code and avoid the hard-coding temptation.
> >
> > I've just done gpiod_multi_set_value_cansleep() for now since there
> > were over 10 callers of this one. There aren't as many callers of
> > the get and atomic variants, but we can add those too if this seems
> > like a useful thing to do.
> >
> > Maintainers, if you prefer to have this go through the gpio tree, pleas=
e
> > give your Acked-by:, otherwise I will resend what is left after the nex=
t
> > kernel release.
> >
> > ---
> > Changes in v2:
> > - Renamed new function from gpiods_multi_set_value_cansleep() to
> >   gpiod_multi_set_value_cansleep()
> > - Fixed typo in name of replaced function in all commit messages.
> > - Picked up trailers.
> > - Link to v1: https://lore.kernel.org/r/20250131-gpio-set-array-helper-=
v1-0-991c8ccb4d6e@baylibre.com
> >
> > ---
> > David Lechner (13):
> >       gpiolib: add gpiod_multi_set_value_cansleep()
> >       auxdisplay: seg-led-gpio: use gpiod_multi_set_value_cansleep
> >       bus: ts-nbus: validate ts,data-gpios array size
> >       bus: ts-nbus: use gpiod_multi_set_value_cansleep
> >       gpio: max3191x: use gpiod_multi_set_value_cansleep
> >       iio: adc: ad7606: use gpiod_multi_set_value_cansleep
> >       iio: amplifiers: hmc425a: use gpiod_multi_set_value_cansleep
> >       iio: resolver: ad2s1210: use gpiod_multi_set_value_cansleep
> >       mmc: pwrseq_simple: use gpiod_multi_set_value_cansleep
> >       mux: gpio: use gpiod_multi_set_value_cansleep
> >       net: mdio: mux-gpio: use gpiod_multi_set_value_cansleep
> >       phy: mapphone-mdm6600: use gpiod_multi_set_value_cansleep
> >       ASoC: adau1701: use gpiod_multi_set_value_cansleep
> >
> >  drivers/auxdisplay/seg-led-gpio.c           |  3 +--
> >  drivers/bus/ts-nbus.c                       | 10 ++++++----
> >  drivers/gpio/gpio-max3191x.c                | 18 +++++++-----------
> >  drivers/iio/adc/ad7606.c                    |  3 +--
> >  drivers/iio/adc/ad7606_spi.c                |  3 +--
> >  drivers/iio/amplifiers/hmc425a.c            |  3 +--
> >  drivers/iio/resolver/ad2s1210.c             |  8 ++------
> >  drivers/mmc/core/pwrseq_simple.c            |  3 +--
> >  drivers/mux/gpio.c                          |  4 +---
> >  drivers/net/mdio/mdio-mux-gpio.c            |  3 +--
> >  drivers/phy/motorola/phy-mapphone-mdm6600.c |  4 +---
> >  include/linux/gpio/consumer.h               |  7 +++++++
> >  sound/soc/codecs/adau1701.c                 |  4 +---
> >  13 files changed, 31 insertions(+), 42 deletions(-)
> > ---
> > base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
> > change-id: 20250131-gpio-set-array-helper-bd4a328370d3
> >
> > Best regards,
> > --
> > David Lechner <dlechner@baylibre.com>
> >
>
> I can provide an immutable branch for the entire series for everyone
> to pull or I can apply patch one, provide an immutable branch and
> every subsystem can take their respective patches. What do you prefer?

The changes look small and trivial to me. I wouldn't mind if you take
them all (at least for mmc). An immutable branch would be good, if it
turns out that we need to pull them.

Kind regards
Uffe

