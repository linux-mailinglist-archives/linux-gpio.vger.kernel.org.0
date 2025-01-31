Return-Path: <linux-gpio+bounces-15139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C13A243CA
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 21:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAFBB3A699F
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 20:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC01B1F3D3F;
	Fri, 31 Jan 2025 20:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ShBjLv2U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAEA165EFC
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 20:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355089; cv=none; b=hM07zxEkbFYHdXNcwxaPt5531e45c0kKjifJTuVyy+AAiPmWYl/vPj2+QSO80ONCcwapdKLphaM6Tb9HWoCaRfshnTjteysPYl/p+pKW7QlSAniMMtBXM32zWRJ2e4M6E5tl0bW3MKWd5CJ0232QFWKGGATEXnxPoUxS4KOEWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355089; c=relaxed/simple;
	bh=a4ev7NI00M+pqHz/c63lKpZN/tT3RLqqfUA5HRJSMsg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YXgXymVYdpz8ZKEz/EmABXnqQ+PMDvS+1KZ/v5fTxWzWV++hykHUyi/SUs3w/NLRWQxgokT0iwb75UXuZKw3+sMqgzlAI0nt+y9UwKO9IdLS/xDiS9wm567Z5g4ahM75IbUE3ZUd6oHQtjqWNKGAN30ujBpuDcFZv9dHVcS/r04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ShBjLv2U; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-29fae583cc8so1184259fac.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 12:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355085; x=1738959885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn/Ny7UFv/UH6iRtjr6jsBabEKLnDl2l7pEqvfjMtFM=;
        b=ShBjLv2U1w+5zymjIFhU7poftN9OhcetisFQnk0H3B/pvg/7UdFSNU0zrwqwuqtNdA
         nsFDff8ZM5KVXkXnc8UpScWb89BwAuyXMKVtsCOJstyRg2PC849jMkHfoCMS0leb8Gyz
         fvxO4R7AG6gGp5b9COON2kYqJu2ZeP5sBPzS7zaFz/1jpuluYh/4xx9yPbLjX/Qn+z89
         AmQeZdxZxlt/15AIidokGNHek0k2zF7zFflb0NdXF5uOLh06aZ5OBhf3oD3JiK0wtQFG
         /yVyddYaQtIQKN5Cs1SZaxEAcf69u4iUJH9QTyWqP3aTZ/qc2kJA+J6kqXsdTyLmDf+f
         DDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355085; x=1738959885;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn/Ny7UFv/UH6iRtjr6jsBabEKLnDl2l7pEqvfjMtFM=;
        b=pC4mZ9ebRzj5inUlgbJ1LFLUhTYja4aEqG7EdHW5sUKxQhZ/XtMGlJmqClOuBFmubi
         Bq0xvCpJl2Syd02xMde7R9SH2S3EidlPt+HTs2301MBldNwtTl60mtNrOjtr3e2v8vGx
         Na+FqRgSkY8vTqHJfmLkwEu3CMO8G9HdMZpay++3Wrqs04Fi1Xdf01vVKX8Du2BCDtJC
         TauNaAfelMXNexyToeddcWbBQpfHVMHvvjj7HVyoKfqWBSgDA/W3EW0dkF//h6tdff41
         Jn2osR6rWDOTiu1OL2sUc/zAS/LVxebxfvOr7x93AatnwZyf5/o4zg1eMKvgAObxKZjT
         GMXA==
X-Gm-Message-State: AOJu0YwGBPzv9pSCbi7AYPr+KWEHtQ0D4mR92eEPToVAbbFHSrPd/U+H
	A/FTv+BDBoz6agnjpCMkMQHHZJI0hMtF3js32zsZwBfQB+RIoAC3FbQ/X2JkWW0=
X-Gm-Gg: ASbGnct6yIT/uBiT6cFsDiWkl2CzjibR0QsEeTVZNe0mTOKMXXRhK5SzHWe/VkdyCFC
	md6U1OSlxWcjRlTdVXJjdkBKLgItOokBfs2ou0qx/LS38zR9Ts1cc5i8BhHMXy0U5nxi4ctg2NH
	qd3j/p9ko/CsWeV3gEkw/8a13HguBNTCf1Ucy9p+XCOPIrLbmckAs0uG5BKD6L2/bQMGQUn9yBU
	21EcchlLwqbjF1bk8eHP2TOt4Groq7NcUTCvpM1xBae2Yho807OKpXZtwoi6iHQ7MZfB7KRXqsU
	1wLPukb3qKtQPWbIbBbzzVeGd8gRvFcqkWmeWhjIWPeWgBg=
X-Google-Smtp-Source: AGHT+IEA6MI3/eVAdqj25y/O52sPRoTGczW1O2gqmD31jZVU/w0qKc/rISzimaZq3KsB0lB7wfNBfQ==
X-Received: by 2002:a05:6871:a581:b0:2b3:8c07:6461 with SMTP id 586e51a60fabf-2b38c07814dmr1466360fac.19.1738355085268;
        Fri, 31 Jan 2025 12:24:45 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:24:44 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 00/13] gpiolib: add gpiods_set_array_value_cansleep
Date: Fri, 31 Jan 2025 14:24:40 -0600
Message-Id: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgxnWcC/x3M3QpAQBBA4VfRXJvaHyKvIhfLjjUltlmJ5N1tL
 r+Lcx5IJEwJuuIBoZMT71uGLguYFrcFQvbZYJSplbYaQ+QdEx3oRNyNC62RBEdfOWta2yhvIbd
 RaObr//bD+35rVoI+ZwAAAA==
X-Change-ID: 20250131-gpio-set-array-helper-bd4a328370d3
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

This series was inspired by some minor annoyance I have experienced a
few times in recent reviews.

Calling gpiod_set_array_value_cansleep() can be quite verbose due to
having so many parameters. In most cases, we already have a struct
gpio_descs that contains the first 3 parameters so we end up with 3 (or
often even 6) pointer indirections at each call site. Also, people have
a tendency to want to hard-code the first argument instead of using
struct gpio_descs.ndescs, often without checking that ndescs >= the
hard-coded value.

So I'm proposing that we add a gpiods_set_array_value_cansleep()
function that is a wrapper around gpiod_set_array_value_cansleep()
that has struct gpio_descs as the first parameter to make it a bit
easier to read the code and avoid the hard-coding temptation.

I've just done gpiods_set_array_value_cansleep() for now since there
were over 10 callers of this one. There aren't as many callers of
the get and atomic variants, but we can add those too if this seems
like a useful thing to do.

---
David Lechner (13):
      gpiolib: add gpiods_set_array_value_cansleep()
      auxdisplay: seg-led-gpio: use gpiods_set_array_value_cansleep
      bus: ts-nbus: validate ts,data-gpios array size
      bus: ts-nbus: use gpiods_set_array_value_cansleep
      gpio: max3191x: use gpiods_set_array_value_cansleep
      iio: adc: ad7606: use gpiods_set_array_value_cansleep
      iio: amplifiers: hmc425a: use gpiods_set_array_value_cansleep
      iio: resolver: ad2s1210: use gpiods_set_array_value_cansleep
      mmc: pwrseq_simple: use gpiods_set_array_value_cansleep
      mux: gpio: use gpiods_set_array_value_cansleep
      net: mdio: mux-gpio: use gpiods_set_array_value_cansleep
      phy: mapphone-mdm6600: use gpiods_set_array_value_cansleep
      ASoC: adau1701: use gpiods_set_array_value_cansleep

 drivers/auxdisplay/seg-led-gpio.c           |  3 +--
 drivers/bus/ts-nbus.c                       | 10 ++++++----
 drivers/gpio/gpio-max3191x.c                | 18 +++++++-----------
 drivers/iio/adc/ad7606.c                    |  3 +--
 drivers/iio/adc/ad7606_spi.c                |  3 +--
 drivers/iio/amplifiers/hmc425a.c            |  3 +--
 drivers/iio/resolver/ad2s1210.c             |  8 ++------
 drivers/mmc/core/pwrseq_simple.c            |  3 +--
 drivers/mux/gpio.c                          |  4 +---
 drivers/net/mdio/mdio-mux-gpio.c            |  3 +--
 drivers/phy/motorola/phy-mapphone-mdm6600.c |  4 +---
 include/linux/gpio/consumer.h               |  7 +++++++
 sound/soc/codecs/adau1701.c                 |  4 +---
 13 files changed, 31 insertions(+), 42 deletions(-)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250131-gpio-set-array-helper-bd4a328370d3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


