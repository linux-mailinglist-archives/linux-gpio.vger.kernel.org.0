Return-Path: <linux-gpio+bounces-15934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF94A34C3A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0216D3A3E89
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D99E2222B6;
	Thu, 13 Feb 2025 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YsnRVMjz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA22040B7
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739468554; cv=none; b=bt23dG8O4MxhO3m0+gM7BGMhcgPEj2Vevdd8MARb/ORwsVUgzd00Z5smERJCXKrzI31R771tDc+GSHttZw6ZOxl3NgEWbhXArJoR4NeqWzs5E8r7MwHFxi8fRahrW4Y7aF8vtfPNZu6LkQgyaQWYDWwqcwyOHr6vqqO01CdWeDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739468554; c=relaxed/simple;
	bh=ry5HU2b5JpTWT9D21OGSEN89Xcj4kAma40gpiFnwdJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFt+CO9vlea+9DKqT0HRS2U2P5wC74PHxVy9CtK4VMY82ptRcvDY6N4gWAnjEDiMi114AORGbf295+Y2nQdavkV9TBb9TbraW+DMv5FRoe6S4iYAccMAL+ygz9n7fHAHzohUxkvQLIh4CKTTjoCVV2l8v4ZCABBRhKX58miE9sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YsnRVMjz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54508b026d1so957135e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 09:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739468551; x=1740073351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7poaTbadceb30IF+pZHsHhZOoR9b8z1fPvVtB4cPUk=;
        b=YsnRVMjzJpPBywIoYZCkd40noCATJ91FhwUJPHKaTaC5FOJQEwcOwlDqAvaHXqvm0Z
         CU4elwzrofsWwdQSvQiYO1hWORw3Z+62DEHhDGrCmIbikCcknlRFciQXerV2e2i3cDA/
         AfD8pviyuSDCjbF5YE2hPy7fvBPLyJoLniHlKHa0DAvIUdNw1GLmZkpBZnIDjEfXfDfK
         dMIv3VUkCFRVc46vU67s46hNoz2AZu4WCp41nITN1eB4E3qkxQLyljvBIG97NDXub+Zs
         rPkwcTfCyY8cJ8mVpJr5xyE8ktDb017ab7j/XLJ7AYMKrfJXdki3HfDwesmN3gVeuFRh
         gO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739468551; x=1740073351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7poaTbadceb30IF+pZHsHhZOoR9b8z1fPvVtB4cPUk=;
        b=m6oM52LYLvMcTxnkBqE19VhiMHqT389gM8GkDxGD8U1TK8JSU4lERF4PzEv/MewWGm
         3QCwNEUZ8ArtP3Ox2sLgcjrQukmg8IFBKYvR9U5b+L/V816da6xHAZg4dSw1ojmSyaYr
         lKzGVsdfCrS1hbUFg0XIfNSOlhWY+gzrZt4wlLqhbjSrrG3uC+WPrlxs8caZWcdyL2Pq
         qrqyMJ9S4sx/EmJGK+ifwOh1/2wVXgHPJwhgkwYiTeybs4mtVZgGiM3jO80rzwajn02+
         7ftha0wXlr/ZaAkjLteSf4ohYx2HpYw4EfQV5PEzIK4DH35I+Nag7mmGcH+xKik7Nd8a
         B+eA==
X-Forwarded-Encrypted: i=1; AJvYcCWzfhjxDhn6IuBcm+SWPkwGTdEs7OdrKdnmbhMEobSo4nGkXRD8ibPaxk4bCepiw/wrmHnc1b7l1DG3@vger.kernel.org
X-Gm-Message-State: AOJu0YzTzmfVU31hsAgvFiUrzeJS6yFgxQetT9PYxJYOLazzDc5H8fIN
	rIYTEFSagiat8IVGcBV+RVHaely6ytJd2lwoANEAry1ka/hwEKI6BBAe8XL3xJtXpp+HMdHZqs5
	F8uAaupzCQ40BtdhiHxBc6Y6vPkGgRyks/LAATQ==
X-Gm-Gg: ASbGncsdEOwdnre54ztIFTuXBWGYRlpzI9YSCTyA+aIAI6kYPQ9hyWywzNurlPa0F+A
	azP3PQ0MnyftaEfWqSMKhMZ9gsuPoiRtHL6RxJoGuoDts3kgMatvDlmIXYNNpao3fs0rEbAjLSy
	ADQDk12Ds05NtjoUQ7VkahEsezu6d5
X-Google-Smtp-Source: AGHT+IF+fWjLMy4RC4fJfJhppdyGnDeRMMDIkKzyGd/CQOlFqBivCx8W/IGAYdJvOJJTC/43hOWG0nQaRr0ngZJNi/U=
X-Received: by 2002:a05:6512:3d88:b0:545:8cb:2183 with SMTP id
 2adb3069b0e04-54518122c71mr2468700e87.29.1739468550462; Thu, 13 Feb 2025
 09:42:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
 <173935301204.11039.10193374588878813157.b4-ty@linaro.org> <801b5364-129f-42e9-bf9a-a90d9eeb4629@baylibre.com>
In-Reply-To: <801b5364-129f-42e9-bf9a-a90d9eeb4629@baylibre.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Feb 2025 18:42:19 +0100
X-Gm-Features: AWEUYZkzHoDq5i_PpQBC_MEOqx6J4QYBMs6-RGY-gc-y6YI9Zv84ton-OV3XB6s
Message-ID: <CAMRc=MeXTvPnEPjOmPd5Vw0FYKHzndsB0SVjQErA4CY_0MGsMQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 00/15] gpiolib: add gpiod_multi_set_value_cansleep
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
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 6:25=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 2/12/25 3:36 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > On Mon, 10 Feb 2025 16:33:26 -0600, David Lechner wrote:
> >> This series was inspired by some minor annoyance I have experienced a
> >> few times in recent reviews.
> >>
> >> Calling gpiod_set_array_value_cansleep() can be quite verbose due to
> >> having so many parameters. In most cases, we already have a struct
> >> gpio_descs that contains the first 3 parameters so we end up with 3 (o=
r
> >> often even 6) pointer indirections at each call site. Also, people hav=
e
> >> a tendency to want to hard-code the first argument instead of using
> >> struct gpio_descs.ndescs, often without checking that ndescs >=3D the
> >> hard-coded value.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [06/15] gpio: max3191x: use gpiod_multi_set_value_cansleep
> >         commit: eb2e9c308d2882d9d364af048eb3d8336d41c4bb
> >
> > Best regards,
>
> Hi Bartosz,
>
> Do you plan to pick up the other patches that have been acked
> as well? It seems like most folks were OK with everything going
> though the gpio tree since the changes are small.
>

Jonathan requested a branch so I made one and sent out a PR. I figured
people would just pick the relevant patches into their respective
trees? For patches that won't be in next by rc5 - I will take them if
Acked - just remind me.

Bart

