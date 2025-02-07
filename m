Return-Path: <linux-gpio+bounces-15513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD00A2BCEB
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CF56160F70
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 07:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8FB233136;
	Fri,  7 Feb 2025 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xRxOy3TK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06891A76DA
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 07:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914596; cv=none; b=XJwBu1FwYk1rZP7ly1JnxtgZryng9xDgoionRTrjf7g9jW2R5ebI3i+S1TUPfWGAm+VBBL59V6M77HxRRwHKUchGbrZDwQxUY3D9tTuHcikVpJARemQSvYNHqPDhefWJskFvKY+coMrzpYHyBgx8kJaMV6krVs8yemru12UNg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914596; c=relaxed/simple;
	bh=Ygym6BkiYRNRVTcjvqeMUfbvwZUuejhc3e16JsbSEyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0c3aMrfplLpHD8vg6PBNrqEzFY0ULfYJcmeubO/itGaP3kJspmgd4Z5zfBquSa3M7pQQz1D4sbqf6liWSydT1H29bbweSgM2NNs1Zq7fUNQFH1UlhLZ92uFgHlhOfX7FV8nIcoKsstihPPhwJ3ApLmQizHWTcRHX1OLXhWvWrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xRxOy3TK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54021daa6cbso1914104e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 23:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738914593; x=1739519393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YnJ+2PmTsfRhc+KXPzUKFsOLYmtdTuDzT6pXI9Dax4=;
        b=xRxOy3TKazuT/+N00yFHK2AMpqnNnjvi6VtAotQPdtxANrvIobd6xcardMunCAayWo
         pdF2TzifsGYZJwzOCRRof6xhnzgh2wSitTnmSSXVjYGkKkdUSc+SsGq4Un0k+1AO1zJE
         u3RV8S7YHV3jmgH9qIDx1t0BH2sKRJLYlWMG7OUp0WIkaRzY21YNhFlqZu0DCH8lndx4
         H14WrlmMZcSLFYXikk7KXcgoVZXupaWEeo4luT8AaCXQpRga3GwEuPul0wVXt7eYa+g9
         j4TJrslFQ6uz8PsWqKr52AOOKGORUFUky5QTgUA1RNhQkBvte8EEMagzkSnGt/eGgq9a
         T/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738914593; x=1739519393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YnJ+2PmTsfRhc+KXPzUKFsOLYmtdTuDzT6pXI9Dax4=;
        b=l8Fi6jPrVK8JXmcWfQ3A5aIoe7K7S14iECvqDix1qpGIakHGGEkyFv9SCLaxdvtgmN
         2GCe2hRMbag+NcbnD1rvsxc43RkecLj3C+bbZVEJfzTQZlWIaeTvaypax9U+5x02lnJZ
         7Zc+OchtS1Jp2RsIJeOM2WEXea4Yv+naYf5u2ySNiI3P6L80SYKPsDIvzZqepc1oYqmQ
         PkhWLA8n4j8ypXqP5GqPoQjbMQpASkP/EZs8Hafx2pygFldrmrew7iluUFNf4V4z8PTF
         MRjFBHTUhISmqNDRTMl7qsePqcSWQu6+XezOH+aaNASyUNUizAIjAaKQVcQaGEax4QSB
         YF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGXKiPu1UTQweJFtsMvwBCg4aHSOvIVSSPJAmYgYlquzP8i02rpVZvObBzHSTORR8pRTuR+u9g7fYU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4EvAr6vqfAoL7mzs2bV67qbDMlKmH3pgUEEjjXZM0M+eXRgV/
	mwsXvbnSN5DEovhM53k8hJIhPjkOQDzXxwk0N1NbY1j64Y7aZWFwsOdWjqFyoxQUa+LVmXVvwuX
	EaEfr7G6/+8TVZrZtOYLRbtN1MGbhgO619WOvfw==
X-Gm-Gg: ASbGncttBDjoresyQRdBUmF6LjneXbycrkOF3mBZjUkVXRJbSA1gsF0ADJumOLKGq+J
	ule9u6+oJWkwV9exg2aDO3YpsfNCUV8VK9R5Ga3sOu2DwWDKfI7yeV5Pipi8eal5Q7untSVEYQx
	/dulhvHctXjHYDoNbLYxJOh7LE1x0=
X-Google-Smtp-Source: AGHT+IHxfwDC2v+wc+kLsonGMp3GoKKzCthmXUYddx5+xjdW0P9Z9tmgYCfXp3s8UQ6aQdx9J+hIzu6ut5Mn8kOKlFE=
X-Received: by 2002:a05:6512:2348:b0:542:1ba3:984c with SMTP id
 2adb3069b0e04-54414a9656dmr486368e87.6.1738914592500; Thu, 06 Feb 2025
 23:49:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
In-Reply-To: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 08:49:41 +0100
X-Gm-Features: AWEUYZmvPOokVsveJHg1umO_SehF1d2PdlzyWo93hmjOZpSCnJ3bOhxNiJqJwrs
Message-ID: <CAMRc=Mf9WQjVXvea7tHx0MJG2H8Yqxw=zGqvjp7dfD7+=huDKw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] gpiolib: add gpiod_multi_set_value_cansleep
To: David Lechner <dlechner@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
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

On Thu, Feb 6, 2025 at 11:48=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> This series was inspired by some minor annoyance I have experienced a
> few times in recent reviews.
>
> Calling gpiod_set_array_value_cansleep() can be quite verbose due to
> having so many parameters. In most cases, we already have a struct
> gpio_descs that contains the first 3 parameters so we end up with 3 (or
> often even 6) pointer indirections at each call site. Also, people have
> a tendency to want to hard-code the first argument instead of using
> struct gpio_descs.ndescs, often without checking that ndescs >=3D the
> hard-coded value.
>
> So I'm proposing that we add a gpiod_multi_set_value_cansleep()
> function that is a wrapper around gpiod_set_array_value_cansleep()
> that has struct gpio_descs as the first parameter to make it a bit
> easier to read the code and avoid the hard-coding temptation.
>
> I've just done gpiod_multi_set_value_cansleep() for now since there
> were over 10 callers of this one. There aren't as many callers of
> the get and atomic variants, but we can add those too if this seems
> like a useful thing to do.
>
> Maintainers, if you prefer to have this go through the gpio tree, please
> give your Acked-by:, otherwise I will resend what is left after the next
> kernel release.
>
> ---
> Changes in v2:
> - Renamed new function from gpiods_multi_set_value_cansleep() to
>   gpiod_multi_set_value_cansleep()
> - Fixed typo in name of replaced function in all commit messages.
> - Picked up trailers.
> - Link to v1: https://lore.kernel.org/r/20250131-gpio-set-array-helper-v1=
-0-991c8ccb4d6e@baylibre.com
>
> ---
> David Lechner (13):
>       gpiolib: add gpiod_multi_set_value_cansleep()
>       auxdisplay: seg-led-gpio: use gpiod_multi_set_value_cansleep
>       bus: ts-nbus: validate ts,data-gpios array size
>       bus: ts-nbus: use gpiod_multi_set_value_cansleep
>       gpio: max3191x: use gpiod_multi_set_value_cansleep
>       iio: adc: ad7606: use gpiod_multi_set_value_cansleep
>       iio: amplifiers: hmc425a: use gpiod_multi_set_value_cansleep
>       iio: resolver: ad2s1210: use gpiod_multi_set_value_cansleep
>       mmc: pwrseq_simple: use gpiod_multi_set_value_cansleep
>       mux: gpio: use gpiod_multi_set_value_cansleep
>       net: mdio: mux-gpio: use gpiod_multi_set_value_cansleep
>       phy: mapphone-mdm6600: use gpiod_multi_set_value_cansleep
>       ASoC: adau1701: use gpiod_multi_set_value_cansleep
>
>  drivers/auxdisplay/seg-led-gpio.c           |  3 +--
>  drivers/bus/ts-nbus.c                       | 10 ++++++----
>  drivers/gpio/gpio-max3191x.c                | 18 +++++++-----------
>  drivers/iio/adc/ad7606.c                    |  3 +--
>  drivers/iio/adc/ad7606_spi.c                |  3 +--
>  drivers/iio/amplifiers/hmc425a.c            |  3 +--
>  drivers/iio/resolver/ad2s1210.c             |  8 ++------
>  drivers/mmc/core/pwrseq_simple.c            |  3 +--
>  drivers/mux/gpio.c                          |  4 +---
>  drivers/net/mdio/mdio-mux-gpio.c            |  3 +--
>  drivers/phy/motorola/phy-mapphone-mdm6600.c |  4 +---
>  include/linux/gpio/consumer.h               |  7 +++++++
>  sound/soc/codecs/adau1701.c                 |  4 +---
>  13 files changed, 31 insertions(+), 42 deletions(-)
> ---
> base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
> change-id: 20250131-gpio-set-array-helper-bd4a328370d3
>
> Best regards,
> --
> David Lechner <dlechner@baylibre.com>
>

I can provide an immutable branch for the entire series for everyone
to pull or I can apply patch one, provide an immutable branch and
every subsystem can take their respective patches. What do you prefer?

Bartosz

