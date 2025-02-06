Return-Path: <linux-gpio+bounces-15493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27273A2B5A8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 23:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B0E3A7DF6
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 22:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEA6246321;
	Thu,  6 Feb 2025 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hJqIGHmB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503C2397AA
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 22:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882114; cv=none; b=gC2XFhS0T6apdfvjV0i2DYf7K2jlvM9bHZCi33tr092UneuxxqGQGS6CGZVNEG0bie1GZIR7IMzKKEJWkqAzRSMQIVKO2azK1xpO1+Bi1BKcO4113O8iHn8HDqwDIYcTWW/lOktkHDiw5Ro9LKlRsFi8mQz+JvzPd94I1Hd6Q2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882114; c=relaxed/simple;
	bh=Vy0Sg5/yfIQxGTiF+YsLYiZrGZGxLfxXhS+B2ZRsujg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSJhxjZaCUxHB2J2RoNfdJ7gNPE5gZF6hRgtkZP8t+cHn2KVBJ7U+vY+HPLAOfmkERpK6hY7hi2aNyPOcnMCVqAV2swaQIizL+w+tIh9lpUI3VI3RW4ER14yWx61VkkQzchdByDwxTw3xXXschQ2VpMOKW0DnNYs9pNQkMG+DQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hJqIGHmB; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71e15717a2dso763044a34.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 14:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882110; x=1739486910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7U1tr86Bxzg8KMxqprTIoKXgh7O+YeZXgnU26M/an4=;
        b=hJqIGHmBbg7GV++307TnlCnNUt4Ks0z26mmVNcG695DwU2laOBo4AsjyyvvmokN3DK
         hBzsZrKDks/R/wdOemNM5x9MfD5eDe0Z78IjwGKy49AvJHPzFFrSHmWKAwdZmto95lWP
         JEoS3bOHyiGm0iNoIeWKKuY+g4Df9zQae1KUVqE8kYUR1/h605jEsaSoBQkS2FGDwYpz
         KucYjdgWEaPTVa9thJk49G/LcG/QGIkbiQQmAF+D1HapnieeGo4QkD55gjm+caNQcGHX
         YPev2CQCaCYMSG9IWw5LAOEkiZuVeej8qMjI00STsqmvsl38qosPDAUO+uXZMglyxcE1
         UQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882110; x=1739486910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7U1tr86Bxzg8KMxqprTIoKXgh7O+YeZXgnU26M/an4=;
        b=TguTDHv+h5a7tO322r3L56KNoXVUtwF3eidu6TrFW7kljUkSnkdhnHJbHL3Al3UOGQ
         BusojtCDd2EW+z8MQt+49yTyWt9WD/FdlCO723W3ChP5H+2d6FCM82i/2IWiDDcYORST
         qi196w47OtwNvzuVDnF06ofF30uLSc0JqIRIE+9HkhA+PM7VODoiC+Mvgfh3gSSTliqF
         pv2EGGoJ/7mIlrxgqy4riPlVo4E+5tUZY+qVgwl49OsNglKjNGOsypjsIDETw6ZBiyBK
         b51732W6fNopzw9x/H3311tAj+B5yh93iD6O/BmJToVvxG60zWGtJCyxbdJK4bIyIFrC
         vIZw==
X-Gm-Message-State: AOJu0YyzKB5AHQwN7pKR9BsN6MNFPFVkjI7QHUXMjtgGPfSY4UfkuHtP
	oKN5UrRdlNHWCX6pltP9cPljfbyoBa1N4zpnZU1nS4uvgirTWdgX87D8QRkUseA=
X-Gm-Gg: ASbGncu9emhlnvJRt95EcphS3pgVe4MTCXe179Q63SNJO+ab+68kmEcN8QTT20FR9rd
	iXQQeqFaeMp2N4b3BhmevML0Kc5trdaNA+T5VuAokH5n9px9TDMRSBmQ3czGhg0qJre/K7bWSgg
	m7gPrv0VkmJheJ5kZDCbBA3YOoJ5eagSiw4MJrCRDsdH1JVL3VMGBo8lMtNcP2cK52ToJO2kFqW
	rOLyV+lTpsAXGyqRH7auB6LRzpUCmGaOzF4H2ttrnIFfMgUnDbvCXy9d5iaVEZYtbmdhv0W0xYX
	gHpHnw1CO4G+IHPlLFxdsQak2heTX7pSwsRaXvNTeOOY0JY=
X-Google-Smtp-Source: AGHT+IH50vqJ+UKd/x8agnmRsrebnsoHILBPEML/hHVzdaMwyiH1jtZh+WCDNiEdIClFYG2pC1GB1g==
X-Received: by 2002:a05:6830:6710:b0:715:3258:4ea9 with SMTP id 46e09a7af769-726b88023b4mr646049a34.16.1738882110277;
        Thu, 06 Feb 2025 14:48:30 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:28 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:20 -0600
Subject: [PATCH v2 06/13] iio: adc: ad7606: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-6-1c5f048f79c3@baylibre.com>
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
In-Reply-To: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
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

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value().

These are not called in an atomic context, so changing to the cansleep
variant is fine.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7606.c     | 3 +--
 drivers/iio/adc/ad7606_spi.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index d8e3c7a43678c57470a5118715637a68b39125c1..9a124139924e4a4fbbbd234a8514eb77024442b3 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -818,8 +818,7 @@ static int ad7606_write_os_hw(struct iio_dev *indio_dev, int val)
 
 	values[0] = val & GENMASK(2, 0);
 
-	gpiod_set_array_value(st->gpio_os->ndescs, st->gpio_os->desc,
-			      st->gpio_os->info, values);
+	gpiod_multi_set_value_cansleep(st->gpio_os, values);
 
 	/* AD7616 requires a reset to update value */
 	if (st->chip_info->os_req_reset)
diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index e2c1475257065c98bf8e2512bda921d6d88a3002..0fc41275e79f3af282c0ee4f31e222bbe8d8c1d2 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -297,8 +297,7 @@ static int ad7606B_sw_mode_config(struct iio_dev *indio_dev)
 	 * otherwise, they must be hardwired to VDD
 	 */
 	if (st->gpio_os) {
-		gpiod_set_array_value(st->gpio_os->ndescs,
-				      st->gpio_os->desc, st->gpio_os->info, os);
+		gpiod_multi_set_value_cansleep(st->gpio_os, os);
 	}
 	/* OS of 128 and 256 are available only in software mode */
 	st->oversampling_avail = ad7606B_oversampling_avail;

-- 
2.43.0


