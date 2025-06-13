Return-Path: <linux-gpio+bounces-21563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66222AD94DB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 20:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B33563A1C43
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 18:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E90233736;
	Fri, 13 Jun 2025 18:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XEG/9Xy7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF671F2BAD
	for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840969; cv=none; b=KLUKaTJxZTITklkdZfyyQj6LAc7vzbaYSwvJ+R0dIViYhs896dTLCCalIIxMU7joszQsQ2vtKvXOluBz/zhhX1bwq0atd4JKLH5uNkt2TH0gYfqLEK2LxinlayB0pNjeUCU6kbELK4daGVLOaY07cCcm2fCOl8roNaH0vC5c/FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840969; c=relaxed/simple;
	bh=++uE2N5iG8oRabYWPvqc1xZ0NdyMvXJg7Pp68u6U0pM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nPfb6wlODYLhwENetpwpB2kj5FpCZQfp3/xAgNmGs/qz1akE5CuSqTffuOz4mxaKnaxygVhcgqxCK8GI/oEG5qPEVxUT0Yd1Go124GxmR6ezo9YWylWPh1axJ8COVYeFkL8oH4X6IcePQ5DMyXQTlKOMKAsmg6ZC/TjAm7rrkF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XEG/9Xy7; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6060a70ba80so1314375eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840965; x=1750445765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1TYF3o9MJosGx0HwGV/hmhcmkYfIUKomItVW1Sq2k0=;
        b=XEG/9Xy7FO1vU5/j+/WvQX1TgyX7jBXF0IAxcmzqC0N0A0K+/uXkRG7KjkBRaLKF5B
         vNfo3BjYW0Mdl2JEgsEdLXSXra1LK031HqsJLeHYpQoUXLEf/Jz5VFiT7+4wwufZC7SN
         5U3GhCY9KUs8lac0cNfPqBgFXt/Ehsb3ffimBVvtBqyIDhWJNSuL6azXvv/Xot3RMaYT
         Gj7Oq5FVIGJ9qz1sKR7QAKtbI2LggkcPzSkXFEXOnrKSslYMA0Pdr5ZuTwTTCXz2D340
         gv2HNZNwatBmMvGk+KqpRHyZcqrmM2D7q43h3CtGltviJ8tGS9PRt+ZzTfx09KPr/GOv
         EOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840965; x=1750445765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1TYF3o9MJosGx0HwGV/hmhcmkYfIUKomItVW1Sq2k0=;
        b=sODpAmeD+vBRJgeMhzBJH5+ChxqB+m7O037XKikyyZphviVDmA09F8fYkwANBGujOE
         hU2D6IPM3MDTzvb2uWJSjWHtVqlH5gsIDJEUUwWSA0pOhQO7PMwx+U4AsI5K2e7Q4lVX
         Gru92iSrKlI3TqCeXvMhaLauLhgrU8gxfgXZNzpl5iYnRJfiE4rtFtHYQCHLzDn1YIAD
         yJYeH1tp8abYsYj9YVv7y6JAGOvAoe0weis34pb/8UpufLmATeR1+cSXqkvBdXexofuJ
         5jp4q/I2g76jHj7aPNr7yfKU3dg/nXD7pcVjmcFcv2uvTtKmK8QtDNiXsKh4xFacqwRg
         6RpA==
X-Forwarded-Encrypted: i=1; AJvYcCWMtIlmMvKJtbFqyceRnoW0hBlneI9x8CxXoeJNxTeA3Q88SyySFSI0LH0Xg8aaGUu5RgLBxQ0g4unE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy1J5EResndYPL4mVJuQC9tDXUCSkgEAuBTjhNbvPcm4h1vNFn
	ztTC4K4QG4scfctaIe2ZPt89v9luA66hNN7iWjzlrAkJWB4qtHqaGCbqPKBqXG4S2mTNw9CDTvp
	y+l9o
X-Gm-Gg: ASbGncu2duzvn8btL1YccM3qnIYWLUL3TThsfnTyUTHo/PFKGTiuOW6w80PMtHnSAPn
	tFhWhW4bWaP2bVMZMaNyiofkHkNcnOX3TMkIIKMkSK3IHhTd6iRt49sxBrOMQWUn7+fZnPum6v6
	IZBWctUMNu0TeAec1Aj6Niv0Hh4g/xq+qEumHj9UAjBQkFa3xdGY2s/m3TBTjaeV9o7veQin4kN
	uO+TeDBuzL5gsEmQmRIermXnurX41XihwwutkTqwvBcMs0hvqVSA9BckfAuJ86OzpuyVSqwYlj+
	nYGFfuR+7JcjzYT4dStg0Mx9y9ONT3J/xl2M8m90cu7iEq1WRTyFB9DZTBTJnBZuBZs=
X-Google-Smtp-Source: AGHT+IH2MWQtTOQvVuN+GKtLbqMqE9OuQOP/DXYYureGIwrlvQ2mli5y2ygIXgHzv9OAPmZM88lIWg==
X-Received: by 2002:a05:6820:814:b0:60f:3442:96b9 with SMTP id 006d021491bc7-61110ff7a50mr540561eaf.3.1749840964805;
        Fri, 13 Jun 2025 11:56:04 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:03 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v5 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Date: Fri, 13 Jun 2025 13:55:27 -0500
Message-Id: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB90TGgC/4XPSwrCMBCA4atI1kbyapq48h7iYpJMbUBtSaRYp
 Hc37UYRi8t/YL5hniRjipjJfvMkCYeYY3crUW03xLdwOyONoTQRTFSMS07PfexoxjuFlGCkLV5
 6TNQFBVIYWbMgSdntEzbxsbjHU+k25nuXxuXMwOfpP3HglFFruTfeOxU0HhyMl+gS7nx3JTM6i
 DckmF6DRIG4rxqmTFNbL39A8gPibA2SBQoadC11rQKYH5B6Q5qvvqYK1DijwTplLbgvaJqmF0B
 RaAOYAQAA
X-Change-ID: 20250131-gpio-set-array-helper-bd4a328370d3
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=++uE2N5iG8oRabYWPvqc1xZ0NdyMvXJg7Pp68u6U0pM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQn8OH/6JMhZq0tcuH66PDJbaNGfuO8EYGYf
 bqSi4lTXkqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0JwAKCRDCzCAB/wGP
 wL11CACbdE4hxkOjFwtT6N/riTIylQaavW5TjgmkT2kDkqqVPKqqdQWBLEm2iIfONpmkvV381ux
 q/GgBKcW+hxEM9ILrT6MdgN1qyScmpXBTc/ra3ZJz2DSy9qJ5rXnscay+TKk4pir4VOAcHOxlPn
 yPtfIKBKbMX+KyfrGZPYgHNJ2P9juYzDw5q8IeOKwFhVmZcIfgA0LhxvYARl1BapQgrsdgZguIV
 IlkPzlwZJvp9EK1LdJzfM/YAZAU4vQL5+txUhPx3fPDe1WT4F3nqvc8FFjGYdDWhRnARqyh3K1F
 5U5hNpVM8/xLMR6ZpRqinew/FouDHnrMpFM7b716qLzHhw52
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
that didn't get applied yet for the bus subsystem. So I have changed
the subject line accordingly.

Arnd,

There was no maintainer listed in MAINTAINERS for the ts-nbus driver
and it looks like you have picked up patches for it in the past. Could
you please pick up these as well?

---
Changes in v5:
- Fix undeclared variable in ts_nbus_reset_bus()
- Link to v4: https://lore.kernel.org/r/20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com

Changes in v4:
- Dropped all non-ts-nbus patches.
- Fixed a reported issue with uninitialized variables.
- Link to v3: https://lore.kernel.org/r/20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com

Changes in v3:
- Added IS_ERR_OR_NULL() check to gpiod_multi_set_value_cansleep()
- Added new patches to clean up accessing bitmap directly (ts-nbus, ad2s1210).
- Added function prefix for max3191x.
- Removed unnecessary braces in ad7606 patch.
- Picked up additional trailers.
- Link to v2: https://lore.kernel.org/r/20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com

Changes in v2:
- Renamed new function from gpiods_multi_set_value_cansleep() to
  gpiod_multi_set_value_cansleep()
- Fixed typo in name of replaced function in all commit messages.
- Picked up trailers.
- Link to v1: https://lore.kernel.org/r/20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com

---
David Lechner (3):
      bus: ts-nbus: validate ts,data-gpios array size
      bus: ts-nbus: use gpiod_multi_set_value_cansleep
      bus: ts-nbus: use bitmap_set_value8()

 drivers/bus/ts-nbus.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)
---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250131-gpio-set-array-helper-bd4a328370d3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


