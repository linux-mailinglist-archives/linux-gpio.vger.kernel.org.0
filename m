Return-Path: <linux-gpio+bounces-15487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28338A2B583
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 23:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C6BC3A5D04
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 22:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB2A22FF59;
	Thu,  6 Feb 2025 22:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e7YtTFBj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8C22FF42
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882104; cv=none; b=bIlt3E2YUicseuwMkohgDF/HJPYL2TqVXi0/t6iJHNvE1e0APRNX2+cWNimpkqBNpGy95I2CyF3jSdfWDbdb7gGaZEzpLfO/LZrxcNAAkkWbLfREqdStByv/gQFjVfhXiDsx6NV9o9FJzgKmxRu32w96Vgw3O9G0Q8AUHuhlY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882104; c=relaxed/simple;
	bh=zis4tQ7I07460hkbbniR15rXPSwxoQBpcub6c24O+rE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y87qN6hG0FjbNjbvzuZG5TUlTBnMJf4HlnBtObeywlrCykzvNzaHS6wFl6ll7LKVtG7qyAK5bUMxEe2YSTucxCbrHriTiZTB9Lm+f5g1sWziHfV9jGzYlPhvrfvOkN5au+a0zXYSUKDTLCoV5dnmrIpgXqPolF+uxyPYUpie88g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e7YtTFBj; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-71e15d9629bso499840a34.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 14:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882101; x=1739486901; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTjUVrGhE9LEkuAZwVXSbsr3BolYrhi8U68+FxZFaxQ=;
        b=e7YtTFBjy0uRy0vsgSxptxwfBMUs7cm3Q81BJzZuEGoce04DXOj2iKHnO/iJuLCXA0
         kHgWo5/x4hdC7kcSBkBGAxaFnvlBY8JDgW/o/o/oVwTtw3RfUkUZjk3rF8FujoWHmwYU
         Gd94Ko8GUAu+qr8VG7ANeqeIQ+G0ij6tTn2YSUWcTy/OwbA3H9Ss2nQ/rZ+ey5w+A+6Z
         8/J34qev7ibdViIyGLwB9NaMt51bgRSdoSVAtYiiKZtdpvwi7iOSl34DkzWunPa0wUzD
         V31wdC0bPvpK43WMpk6fgEvCVTQsFqu0pQbCNjeJZdg1BcwG30KxoUrLHuM6WrUd1ThY
         welA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882101; x=1739486901;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTjUVrGhE9LEkuAZwVXSbsr3BolYrhi8U68+FxZFaxQ=;
        b=H5ZCH0Y1R9LDOfduAZRw2rLbp0mC/ni05c1eq6M7SngFqGLvtvCZZDRVNT4HQsXX3n
         P0n8oazvBqVwBZq2dBMoKAwpKDbB9QjHcj0WRGGuTF3M4kDI8ueXWWCkP3hZjcghC09S
         T/6w7b0LZJou5Rztl7KWWSlttBob/q7Ep5a4nrsK3+XCFzkB43w5VqZVEms8mspTQTy3
         Es3bxB3gFVywclsSL4BbHqnDbO8X0JGfgy0+eLvGQeRVaAsmiOG1ahtZLfytHsG9xOeG
         vtWXEJQPuE7Yf82Pj/ovuQYbEBOl40f2JC6yx2t0OrVx0uiBfByG5K9uyvxUqZC26nLh
         9/8Q==
X-Gm-Message-State: AOJu0Yw6uYcCQOtQ931aLzjxq/tR6cE5WLOFr7x0Y01r5K+RGjG+e/CS
	9peb7IGCLB/jAgoU/k1NnQhIAX/IMkbSWYvFUgeX5uafdS+kdufwwNY3+601lyY=
X-Gm-Gg: ASbGncuLXRcMZHebH9CGZU16FbNLNr/iwjMDfduaOwSZt3iezxN9kzkkdp1Zmg3I8gm
	/N2XPLvK+41oV6zJHnM34rFdND6kwGt0fByOs64dyMeI+XRP2SpOQG3cL+tFIqpfz9SR5JDbRe7
	AKyjLj1llUN+DoSwY2HZBCnMCePcSPovwPSHsUjUeLG3k9nlEMvrbPZTlJE4YX+AERHwI9GYInu
	Ps0NT05gFcazE53F6BznbCsHgeyPysn1iLa58vfKO0BOg6vpXU+06xQqKPb6WlSdc3Gu6B/4phu
	VVy6dwAyGb0K8ie9gR5kx7cgP0infJMH1eUyyyulD7SnGRI=
X-Google-Smtp-Source: AGHT+IEe89bED7ukyh1rQCd1X1Mi1wrPA7ENfU7mpvKe6wSKoopBL7B45Hnhs3EJFS2hj21RE4OaAw==
X-Received: by 2002:a05:6830:6204:b0:71d:fe93:2570 with SMTP id 46e09a7af769-726b883e93emr835305a34.14.1738882101425;
        Thu, 06 Feb 2025 14:48:21 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:21 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 00/13] gpiolib: add gpiod_multi_set_value_cansleep
Date: Thu, 06 Feb 2025 16:48:14 -0600
Message-Id: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC48pWcC/4WNSw6CQBAFr0JmbZv5oIIr72FYzKeFTpAhPYRIy
 NzdkQu4rEpevV0kZMIk7tUuGFdKFKcC+lQJP9ipR6BQWGipL1IZBf1MERIuYJntBgOOMzK4UFu
 jG3OTwYiynRlf9Dm6z67wQGmJvB03q/rZf8VVgYS2Vb7x3tXhig9nt5Ec49nHt+hyzl9lqEWmv
 QAAAA==
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

So I'm proposing that we add a gpiod_multi_set_value_cansleep()
function that is a wrapper around gpiod_set_array_value_cansleep()
that has struct gpio_descs as the first parameter to make it a bit
easier to read the code and avoid the hard-coding temptation.

I've just done gpiod_multi_set_value_cansleep() for now since there
were over 10 callers of this one. There aren't as many callers of
the get and atomic variants, but we can add those too if this seems
like a useful thing to do.

Maintainers, if you prefer to have this go through the gpio tree, please
give your Acked-by:, otherwise I will resend what is left after the next
kernel release.

---
Changes in v2:
- Renamed new function from gpiods_multi_set_value_cansleep() to
  gpiod_multi_set_value_cansleep()
- Fixed typo in name of replaced function in all commit messages.
- Picked up trailers.
- Link to v1: https://lore.kernel.org/r/20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com

---
David Lechner (13):
      gpiolib: add gpiod_multi_set_value_cansleep()
      auxdisplay: seg-led-gpio: use gpiod_multi_set_value_cansleep
      bus: ts-nbus: validate ts,data-gpios array size
      bus: ts-nbus: use gpiod_multi_set_value_cansleep
      gpio: max3191x: use gpiod_multi_set_value_cansleep
      iio: adc: ad7606: use gpiod_multi_set_value_cansleep
      iio: amplifiers: hmc425a: use gpiod_multi_set_value_cansleep
      iio: resolver: ad2s1210: use gpiod_multi_set_value_cansleep
      mmc: pwrseq_simple: use gpiod_multi_set_value_cansleep
      mux: gpio: use gpiod_multi_set_value_cansleep
      net: mdio: mux-gpio: use gpiod_multi_set_value_cansleep
      phy: mapphone-mdm6600: use gpiod_multi_set_value_cansleep
      ASoC: adau1701: use gpiod_multi_set_value_cansleep

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


