Return-Path: <linux-gpio+bounces-15997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642FA35B6D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DCA67A1E0A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D15F2586C2;
	Fri, 14 Feb 2025 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VGYh8Spi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF123A9B4
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528465; cv=none; b=HLg2OBdQREWIrHu8pfhKNbOWdjaXpMPcqczs4d9T92AqEw6/xruvibgLcgtAC9MCPgsjk74Iih1NgUFfqGFegcftiQ7PJ/0+JJVypJxtrBERW6rJ9NeXC+gbxONboXmJaxxxB6jvigRQzUMtCBg0rQL/rHvS3SH8JpXP7HnsD8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528465; c=relaxed/simple;
	bh=1lGizCsR7R+FyokmykNTUGHY1lzSxjHAe9z+jj/6a1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W1BImtrACQHS2QwUqkd7/b3TDDeaq1xFtLtd1OfEo8Au6x24etbmkc8ka1Kxh+LjSkHnmE3QVd5dkuI4OBdo9P1Aavtb5IqMwqW6smXmiyNcMfF7kZA/btec8igqQ7x5RjVVCLSs5/WojN5Lz2aDt54F6yTGfpcxgOfh18xLHw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VGYh8Spi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-439685e14f1so3213565e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 02:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739528462; x=1740133262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLnRVw8CXaL8aivm+oTTQCZPxIVCt8DWL00ds7O1e6U=;
        b=VGYh8SpiUpS/S1XOqhPcF+0eTnGV9rIy6ItXmOglkxFdbEzXe5CiPX6VCBQhsWVFIm
         MxhWRAGP7beu+fAEe7tq75ziIXAqo9B5NrK/xsMNTTFjCWSwe3R38CD58IfVpxVvRWsq
         S/UqOzaAeefpmnUCSaH5yIeqeWeDzHZ6ttI6a5TN8+86DpF7cgzEjMXXVnyGmE8OoQPA
         +uInOqbOs6NDQWi4RXlB2+kW4z5BGBux307L3RpXUDhqydHAKsheawYAPO+doAqgvutK
         UdcWSOMD9xVSbivv67M5YNLZ5Cf4XpgSeloT6ndMjMk3UnFEyy5s9uUPdTbiMFOtYaWg
         8V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528462; x=1740133262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLnRVw8CXaL8aivm+oTTQCZPxIVCt8DWL00ds7O1e6U=;
        b=iweHAlLNDSWvb1sSDBXX+FOpGwB6IjKgf895MYYLx9Z+uHArrhbrMK167w/6pCafYT
         BWovT1Yp2Y6jn3Oo/z6iIaghwHdnduZSvGAKfefjMt6H4Ug1gkaQfPxLgSNSnpXUaoSV
         6IJCNZXQ+HmA5DyewB/X9u53TpBb6ZCkXbolichlu3q4/ZVUpvqk9KFA7jk4Rp0edK2l
         lXtDVQhtLbu9A4bX8xxN3ryD/uh11AfmxBFEFAGC8kHoUd34hKmuKpl8s1UKTzSJjRKR
         ItMSJS381lBidgIvY4npIfw0DxcZKvC9Pqlfg8XvaZOEcSr0noeR7q7ORJK55X6KkS+i
         SqWg==
X-Forwarded-Encrypted: i=1; AJvYcCXWVe00oMnCObzzaYxWILfO4Lx2cDiIPqMdFtV8ukqwS1gSE7bbYa9UJ/MqwuyKp1JWu2tyNWdQ26q/@vger.kernel.org
X-Gm-Message-State: AOJu0YyAJFZYJxhLzVbjSyz0bRpSTYMvTFiLCxJ1sf+sbDV0ZdIamIgI
	Xr2myfZ8hTKudz8Uxj58ipEeRh2iNkrXvy01zByTE99cf5GPaWxIOovEZ3FoZk0=
X-Gm-Gg: ASbGncvhWgTwUWgA33LRO6+pvumJqqOEda82MmB+z99Q4fzedjHpER5ptqOPJbtQLiV
	T3v0z9XxCRl4MXRl7Xu6lZrmGW8HZtDL2IZOCihiLJeQ9gocy1MhfQEORIfWAHvEBmuHCDArK6r
	tqoTNfr0qWfB+DGIuhrFkuSPy+xSo+ps9YFOi9Rvu5ydFET5St6hTkKRjP9Pftlc0T0x4EpnNN9
	4FGti32vu+NEx3HFEi+zM+aBJjqUOoBACxudymO5qaNbFyZf3khQjDjbi7hIdxGpVPD/A40SvtK
	yre3G4L2TRDTAQ==
X-Google-Smtp-Source: AGHT+IH0JLaEmWyKXH91k0R2F707+ITR4fD263SwynHCn2SZFyP0K4/kI1oydg9oxe4La6Y3ETiVQQ==
X-Received: by 2002:a05:600c:35c1:b0:439:69fd:34b7 with SMTP id 5b1f17b1804b1-43969fd35f7mr14374675e9.3.1739528461685;
        Fri, 14 Feb 2025 02:21:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62cc:da7:7c42:97ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06d237sm71463255e9.21.2025.02.14.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 02:21:00 -0800 (PST)
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
Date: Fri, 14 Feb 2025 11:20:58 +0100
Message-ID: <173952845012.57797.11986673064009251713.b4-ty@linaro.org>
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

[07/15] iio: adc: ad7606: use gpiod_multi_set_value_cansleep
        commit: 8203bc81f025a3fb084357a3d8a6eb3053bc613a
[08/15] iio: amplifiers: hmc425a: use gpiod_multi_set_value_cansleep
        commit: e18d359b0a132eb6619836d1bf701f5b3b53299b
[09/15] iio: resolver: ad2s1210: use gpiod_multi_set_value_cansleep
        commit: 7920df29f0dd3aae3acd8a7115d5a25414eed68f
[10/15] iio: resolver: ad2s1210: use bitmap_write
        commit: a67e45055ea90048372066811da7c7fe2d91f9aa
[11/15] mmc: pwrseq_simple: use gpiod_multi_set_value_cansleep
        commit: 2a5920429897201f75ba026c8aa3488c792b3bd7
[12/15] mux: gpio: use gpiod_multi_set_value_cansleep
        commit: 47a7c4f58e1f9967eb0ea6c1cb2c29e0ad2edb1a
[14/15] phy: mapphone-mdm6600: use gpiod_multi_set_value_cansleep
        commit: c88aa68297390695b16fd9b7a33612257d8ef548

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

