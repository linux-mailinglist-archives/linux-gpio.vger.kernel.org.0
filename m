Return-Path: <linux-gpio+bounces-15828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE4A32271
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC33A3A7870
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98A8209681;
	Wed, 12 Feb 2025 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QrIgjLpE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9CF2080F3
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352989; cv=none; b=rAVlaanMeEELrvboEqw6bBmhUyIXyg1Ua53r66meicNiELHII0XYCjf7v+mCLOJ0Dbahuj96sB4up+lPa8kgnFRSeXMLCNYn8d9k3OEY7ih+xcE8sJlP5qXMiDuxFRyJDGr3LsLMWlOrUp0NzeTYEb6kSFAKAuAEtxFp0j6WV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352989; c=relaxed/simple;
	bh=I7CFgTkt0jzyGzG4M7RjYnnbGhlCBrEk+jlNQ3TAQts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzJQ0wCoeXAioPkZkdsO5eC4mlU3gDVlExq2FW2UDFGELKuh2AmLZMMtaQYZb20KRD+F2pMmM+4Y4pz/GoZPRUIieJkpQrQUkvtjat+PFAdmiHDBnab637xpcc2P1ZFbBysIIOceUuLpyoV668xAt025ROZcbZ6AilJ2KM2xTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QrIgjLpE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394829ef0fso3651835e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739352986; x=1739957786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrbuHpRRCn2ojY6FY2MTuNNVYvVFb7ykFJzn4YLtY68=;
        b=QrIgjLpEkIg4TvIfUDn3FaU9UtGn68UJuWXMMFjnw4pJIp7q01+sRhx2F0VZ4ntyrb
         DTrq8sVzdwrJu4TaGKOY7n4aBTY3xdvnVEV6RW6DqZIv/2RDmCOBhHwewUPWzzIrta00
         6z6P91/vFUQ0zF8LZCpJr9M3F5EY9/g8LjPGBEhOfymyTWlJxA4VzKyVrx12AKeSF+YZ
         N7DVbbx7q2oHHAL1uMEw6zDoSO2LbkqwINA0HKNuZ2PGQp0DLiZj+skDYbmiuEAiXFsf
         A0t/Z66W3OLN9cEEH23FX16CE5d+yhQDNxfHJo+KiM/hL2ihtEeKhNQeTCl+gYpINcHO
         cFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352986; x=1739957786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrbuHpRRCn2ojY6FY2MTuNNVYvVFb7ykFJzn4YLtY68=;
        b=HuGFyS+X7MUJilYoylmYPG+0btbNYddwiWLoy42kl99SmSviUQvJ6MQuvKLIYDwPqQ
         EQNBz0/fkGXDpanAqjqpmipCUtdCTzc8UUJCc4ocJbcSfnAxnuGM4K+ake/uDKC5ouBP
         yjlLEg6+upkjTMv/VnoPPV1WAgd4hqfZqpXbyQT1qNoz2kVVYkvyVQaOCfPOb0qsieoq
         ALz5cnOS/z8IoiiAbibzNGRhLuUnffUopCUt/TXDkbUT6LMfVjMfGDcsEiea6PVCvokK
         XzpeqZFwq013qWegZlfbwR/jeUDHvkVDJvLVo3oIlfeP+j5XqNWbvujo2RlwiLTGl38d
         RCtg==
X-Forwarded-Encrypted: i=1; AJvYcCUfuzzG/DyCc9Oyt/6RNW0xHwHy7ladROIcM15ArA4yf4BQzKZw/tG9Q4GIfCMlYoZ3wKNRD3nJAkpi@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRtkIbBsbNaT1pxTyyFXtm0DCOZKSBTeaTGg28n1+oU8Y/Nbr
	mZvPtxJ1g3I67zBrT1GP9/uDSnzCZ9XbdPnnIKN84s0nsNw2qkdf83aUH13v/fo=
X-Gm-Gg: ASbGncvFV5JymDXJFd0qhux6+DpO0pJqApqoIiM3sO6xZnoGdaAoFcxFFVUvlxxiOJ/
	OlqNMp3XGw+RJOY/Ukm+Y5PgeWDSn+E7ZPEiLE4lTzpBQ+AtZwrwsSddnT7SswZh6xyWCwPvm0V
	y5kC2bPC2SDEvVqjbs6F+itigJ63rAvo9ZTZUcYxe0wRmVsv1nPoBgCBDRGNeFpzaPK//7STSwk
	ETZwtKt/rO/xOIaWGTONGJYkx5tR8wl1Wl7LimYzHswt85U7hH7g1epbbbbsPCDEz567pdG/Y26
	ovCa3tDOJ40W1Fg=
X-Google-Smtp-Source: AGHT+IFudfgBGV0+IDygsdoLTA/5igyJSZtMJXjbCQPeBSc7oN4L55kdXKAZLq0JA2599sk+IrdqDA==
X-Received: by 2002:a05:600c:3ac4:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-439583b4e03mr18452935e9.7.1739352985575;
        Wed, 12 Feb 2025 01:36:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd8dee385sm9918965f8f.61.2025.02.12.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:36:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Lechner <dlechner@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sound@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: (subset) [PATCH v3 00/15] gpiolib: add gpiod_multi_set_value_cansleep
Date: Wed, 12 Feb 2025 10:36:23 +0100
Message-ID: <173935297467.10817.9536577313319553775.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 10 Feb 2025 16:33:26 -0600, David Lechner wrote:
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
> [...]

Applied, thanks!

[01/15] gpiolib: add gpiod_multi_set_value_cansleep()
        commit: 91931af18bd22437e08e2471f5484d6fbdd8ab93

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

