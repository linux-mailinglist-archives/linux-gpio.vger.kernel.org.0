Return-Path: <linux-gpio+bounces-15157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4DA24849
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Feb 2025 11:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E8CA165BB2
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Feb 2025 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0970D154C17;
	Sat,  1 Feb 2025 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B3TxkcdW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA103153565
	for <linux-gpio@vger.kernel.org>; Sat,  1 Feb 2025 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738406185; cv=none; b=ZwBX2eqMW4KFyKz7bzdiRwFon0hUOd+Blxigs7YSc7RvsE+zZ9cX/UeFz+nnXtOXEd0OpsBFq7bG/uPtBidsUJ+xU/Zwz2kW0dS/I6aA+GAbZWRzFIp7uu6cdHHTQvZF+WZrVCkhk8qDMSDVr1gfgxOJBZDJDjHz1QYPYgEJwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738406185; c=relaxed/simple;
	bh=iqw5RHSV8S70QoypLHZQ6Q5vg7hJQNF5r+oQH6qoIxU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVAXbdWgOcM0lKLUDXptZCcs69FdRWpBYdsxpbQqFTNfTsPjCoTGiwHHUyQ2O7+IgN2NUTy1HoA8wvDKotPxWxqGh68kTwjsWGmnzK23RQyuZYDKs/d06/HlAdSur2HA0y5xYvUHgMKeAaJJ/p0blcxYXchejFprAgpA3ZBAqE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B3TxkcdW; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3076262bfc6so30097011fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 01 Feb 2025 02:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738406182; x=1739010982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oDdRJ+I4mzWc8IF8+OQqo1T57d81vrjPzSqlTDqBnks=;
        b=B3TxkcdWKwGPBOebL9pA5bUQHLxQuAutZ9kfu1oWUILNs1QWrlQXhOyuzxUr0gh/eJ
         SJ63Wv/UJwk1Ps/NEArGZHSuscrrZS4vKqLe1fCpUrqsnfWrXZOTxh/Dh+hxUOl86YyK
         7ZgXgGo0ACYpgHJwUeKltsykq5LC0yK0DSO+z4y26SgYhQzgKYU8MBxVekRvZ0NImO5v
         CghEyVL8L+nUWr9eq8FaxlbOfp9FQLnoN4hNgeVRnJC6EG/Wixrbxe37hOPAgyCMjxaH
         TrI0p8Wgd8C0VN6xGZY+b1Ou2WNfyyS6UAhbR5narGWCYbrCFHblg0vcpe87QjXaXVHL
         mXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738406182; x=1739010982;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDdRJ+I4mzWc8IF8+OQqo1T57d81vrjPzSqlTDqBnks=;
        b=FASata1zL7iiw3v3HyhA5Km7BAE1Bf18zAqpNssEsstDovDLLbmhuDJ5H294zZJ4gI
         f5ZnXSMRUoyV4ABVLgB4VaQV/CzqDp2+/NFjA8/0e5GRlYK2Hb2jrQl7KSBoBfaKwI3t
         KVQhO1EMxyT4kNFivcOBJY80g3pElOGOy6/6XTfL9JImAg2VFnrlE4rT4NluL4CTpMAm
         qGRJytk+leHB434Cvby4RM1bnTbgr4cdwxtkrT64M9g3NL9uT3RG1aWXDizwAZbPdH7b
         c9Tq5ZhzaBYoT9ZkYSX9D2WpUziUH/lx01krWfMOgReN/Og2EDoA82cinfxZZWb6wx6G
         EgaQ==
X-Gm-Message-State: AOJu0Yyj5SgzRg86RfITAIMuMPrXYHe1lqloAFt7Ur6b+XUROgh2qKmm
	co0UeETyCWqP+Dts53uaWyvmeauASkUCaNtWWf1DvUzDgMj0pM0GItxM2Zrz96s8GCAprMSbdtI
	6bCmWLP3BsmXdCgpQ0Uyr32PjwilLHrJkwtix9g==
X-Gm-Gg: ASbGncstaORBSU43jlKUboMJil2jAb9PfkVNxyTPOInVcKjshFRwo0TNt1OMT/Mqq04
	L+duLHAmtLI0my+gtOoXzGnYuY/W5+5tLIYChgDBNd+hjnSZWxKG3UbnDPa25/H9InsVWDw8Q
X-Google-Smtp-Source: AGHT+IG/TVS8htf084OR17kIjfzG2VfKKdd+Zm7iyJX53veJ+z8OFO/m1mmCuR205oUFZ0hgVzWPIgYd5gwR9N1dJcc=
X-Received: by 2002:a05:651c:2116:b0:2ff:d044:61fc with SMTP id
 38308e7fff4ca-3079690e02amr50683871fa.33.1738406181352; Sat, 01 Feb 2025
 02:36:21 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 1 Feb 2025 02:36:20 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 1 Feb 2025 02:36:20 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
Date: Sat, 1 Feb 2025 02:36:20 -0800
X-Gm-Features: AWEUYZlUDyMyvD5QqatzuRcJ92GC2-lApzNfXLMZZCZq3wVbhWt8z_DF3wi7h90
Message-ID: <CAMRc=MdwQL8dWU5zF5fp+KUbC2RA2Q264by8HGXMg2k1rxhsTA@mail.gmail.com>
Subject: Re: [PATCH 00/13] gpiolib: add gpiods_set_array_value_cansleep
To: David Lechner <dlechner@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Peter Rosin <peda@axentia.se>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 21:24:40 +0100, David Lechner <dlechner@baylibre.com> said:
> This series was inspired by some minor annoyance I have experienced a
> few times in recent reviews.
>
> Calling gpiod_set_array_value_cansleep() can be quite verbose due to
> having so many parameters. In most cases, we already have a struct
> gpio_descs that contains the first 3 parameters so we end up with 3 (or
> often even 6) pointer indirections at each call site. Also, people have
> a tendency to want to hard-code the first argument instead of using
> struct gpio_descs.ndescs, often without checking that ndescs >= the
> hard-coded value.
>
> So I'm proposing that we add a gpiods_set_array_value_cansleep()
> function that is a wrapper around gpiod_set_array_value_cansleep()
> that has struct gpio_descs as the first parameter to make it a bit
> easier to read the code and avoid the hard-coding temptation.
>
> I've just done gpiods_set_array_value_cansleep() for now since there
> were over 10 callers of this one. There aren't as many callers of
> the get and atomic variants, but we can add those too if this seems
> like a useful thing to do.
>
> ---
> David Lechner (13):
>       gpiolib: add gpiods_set_array_value_cansleep()
>       auxdisplay: seg-led-gpio: use gpiods_set_array_value_cansleep
>       bus: ts-nbus: validate ts,data-gpios array size
>       bus: ts-nbus: use gpiods_set_array_value_cansleep
>       gpio: max3191x: use gpiods_set_array_value_cansleep
>       iio: adc: ad7606: use gpiods_set_array_value_cansleep
>       iio: amplifiers: hmc425a: use gpiods_set_array_value_cansleep
>       iio: resolver: ad2s1210: use gpiods_set_array_value_cansleep
>       mmc: pwrseq_simple: use gpiods_set_array_value_cansleep
>       mux: gpio: use gpiods_set_array_value_cansleep
>       net: mdio: mux-gpio: use gpiods_set_array_value_cansleep
>       phy: mapphone-mdm6600: use gpiods_set_array_value_cansleep
>       ASoC: adau1701: use gpiods_set_array_value_cansleep
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
>

This looks good to me except for one thing: the function prefix. I would
really appreciate it if we could stay within the existing gpiod_ namespace and
not add a new one in the form of gpiods_.

Maybe: gpiod_multiple_set_ or gpiod_collected_set...?

Bartosz

