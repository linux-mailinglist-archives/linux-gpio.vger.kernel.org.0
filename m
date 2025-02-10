Return-Path: <linux-gpio+bounces-15679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D86A2FD67
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E952168E1E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A94E25EFB6;
	Mon, 10 Feb 2025 22:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EX6Geyr2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B49A25EF98
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227080; cv=none; b=EfDdXtM2n7sl3f5JKrfTgj3m60L+ljWhKJcDHxCf66024w/buZ/1YsZdbpKdqFwIju0Zu+muaCOjFOc99W+nNHmSPfdVyBw8eR12ZP3POhQV0f6SBRHmxckHzXFduhZ9h536fz54n3q2ftHM6cHXWWyI/zC8Eywta3KBCUGS4MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227080; c=relaxed/simple;
	bh=w2oc7RoPm/sb7RYTc8soBDQAfVbctsAzru+e/xVugio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1CbTX15fnmoUFrurSOQQQCeoS6SpcWdxnLATR74lb0B41j+vNWYdcDZM8HZ9aPPa7erFus3N+bPbUK8A54efLcDTuQKHe2ONHZMV68kcIDqd9do4Gaq/UR/RBc5DymLta4MTOqRk/ZrRTHzyz3xHb6yQXS56kIp2dmOKid5CXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EX6Geyr2; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3f3b83185d6so601154b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227078; x=1739831878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teHDghklDJ1V7cAi8g37Bvg2ko8a0NpXKiatSq796/g=;
        b=EX6Geyr2f5PrlcFQSDLNi8nG/h2PCdswLOTbPl4cfWLsKNV2v0DyC90gNZ3HcnGcC7
         WLFTD6vVne9vl9xZfLrI850yPkknlKXY+s9FoBjWe0o6kfDt05hvDX6Z4xPtx2twLoDu
         Gg5/75WgIukUpmgSmbfgiekGaK/Uz2lI3X3FXAvJDPj3bqjUqSCBLtBayYCCwiM+d6P7
         8wFqrDDLd/EwGgjGGVqn1XWvp23Ng9elYqsFt7WQrjcFELX6uRC5J6xC+yKawGNvuLEN
         loDm8yXQayJvC4kj+QCMv0rbMw2wPJCXPEWGTqZgBHuVYhUPwJg1c1WoYlntxYKYpzUR
         40sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227078; x=1739831878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teHDghklDJ1V7cAi8g37Bvg2ko8a0NpXKiatSq796/g=;
        b=N2dtz8waMeR+L/+/XR8dI5e/LCdeslM+tzwntiyy+7MFJ+dGk9+1uhb0n3mNIpD7Hk
         S76jAwnHKdDOVbab7cnIJuTD8vQkjhsYmGQMtvuQd2rENpGepmG8s5aGfpYe9tSR0i5A
         hBUBGh0v55AFsPTTCBF3pXSLNepugqJCe6p6SH/IfvUmYpKIutcIo2CXkf0Jj/VmlR7L
         obAF0khE+DnKbwkSoWvSzJiPdtPlhC33Zl0yGdCsvTtJ8aImMeSa4KZ0yyibwhGeO19c
         DYD5cBKtN41QHZ3Yoh6s2lCdnC+uvPjb+iUu0mF1bySktClvWFppup3JKpV/eoNFXiaW
         UIgw==
X-Gm-Message-State: AOJu0Yy+r7wu/7sR8h/G6HMpLPzJJ7lLneaeMN/QlWXfMow+s1YQ/Q/+
	QPln0OKL3FvPje/6NKsbKWiqvrwGGoQ7lDSI4sJ8ZQp799IyBKhpUD7j9F/KaOQ=
X-Gm-Gg: ASbGnctIhkShQdyOPn1b8slABhtf/dLz/Giw5knORuadCtZvgsdtUiyFf/sojoPEewk
	87h4jUyX5pfjkTR0qOBwh8dNDlXbym8uD3heCzyy8/a+N2A73GWrRm4EOCVz/jI540K4ptkYfGr
	DT7Mnrs2aK67d686sbPfoX7VD00ETeul3b5QqLUdlx702j6vzYVlKU7vwoOGMpV/TItZjAA+gUv
	CO04SVwLSQJ3BV2zcuScTmYNaL6mI+rZyQ34EUj8hoxtZZ0CuyUM09fs0LKh1AH4MkVPDNy/wmZ
	xF3uB5NaFlJZQHEC829sSLE3bU45l3Hk2Xq5ZYzin0UoyYM=
X-Google-Smtp-Source: AGHT+IG3DTzAWvVW4SJ21A/SRgFk31074gXMN9+oGlJqzs/MtMc8XsiOogFgKzSWDZ9AZ40PkdjrRg==
X-Received: by 2002:a05:6808:3c8e:b0:3f3:bda5:5739 with SMTP id 5614622812f47-3f3bda570bamr2064722b6e.17.1739227077726;
        Mon, 10 Feb 2025 14:37:57 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:56 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:35 -0600
Subject: [PATCH v3 09/15] iio: resolver: ad2s1210: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-9-d6a673674da8@baylibre.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
In-Reply-To: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
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
 linux-sound@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value().

These are not called in an atomic context, so changing to the cansleep
variant is fine.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/resolver/ad2s1210.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/resolver/ad2s1210.c b/drivers/iio/resolver/ad2s1210.c
index b681129a99b6cf399668bf01a1f5a15fbc4f95b8..7f18df790157f1e411fb70de193a49f0677c999f 100644
--- a/drivers/iio/resolver/ad2s1210.c
+++ b/drivers/iio/resolver/ad2s1210.c
@@ -182,8 +182,7 @@ static int ad2s1210_set_mode(struct ad2s1210_state *st, enum ad2s1210_mode mode)
 
 	bitmap[0] = mode;
 
-	return gpiod_set_array_value(gpios->ndescs, gpios->desc, gpios->info,
-				     bitmap);
+	return gpiod_multi_set_value_cansleep(gpios, bitmap);
 }
 
 /*
@@ -1473,10 +1472,7 @@ static int ad2s1210_setup_gpios(struct ad2s1210_state *st)
 
 		bitmap[0] = st->resolution;
 
-		ret = gpiod_set_array_value(resolution_gpios->ndescs,
-					    resolution_gpios->desc,
-					    resolution_gpios->info,
-					    bitmap);
+		ret = gpiod_multi_set_value_cansleep(resolution_gpios, bitmap);
 		if (ret < 0)
 			return dev_err_probe(dev, ret,
 					     "failed to set resolution gpios\n");

-- 
2.43.0


