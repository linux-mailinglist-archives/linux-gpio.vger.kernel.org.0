Return-Path: <linux-gpio+bounces-15672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CEEA2FD44
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7F86188A0EC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C50F25743B;
	Mon, 10 Feb 2025 22:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NiddYB0j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B051254B03
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227058; cv=none; b=ekI0ZC3I1tEu0bkSn6GOI9/nmT1HKrPbejKew11AL7y9Pt4Oz9ak4b/+LzJfV7bQjvcaev6QlA/JYLy10cciDl+MsNY2U5oSIkBnYcL9cq6MlVSFFcbd9H+Z4CuKvasTXzHhdNKWYhE6lYALRqqsWPULqabWxGsoNPTUh/3Ofm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227058; c=relaxed/simple;
	bh=niyVa96MKYbn0/yX32i9Lb8f6xkttYKqAUie+rLFIpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxAYsb9aQPHlxENrXjfUi61pnuDFg7qweE6LakT12ttOVDR53nhJlSSQ2Dvx/He9yfAElOVIx1szvlRNTEMHM3vi2PpaMZiHc4bsCgaqN6fg4FbMNb/1bjeCI6NnhRWE8leHhc0Gdl4bjZWapJkLIGiHM3GRhDovcIa7hrrpz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NiddYB0j; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f3b1ebe6d9so847027b6e.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227056; x=1739831856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJrdF9PqOCsaQVoyXe6fXVbwa2pQeAvJKGzGuCxpxAQ=;
        b=NiddYB0jNhn//VaVWUzcWNGKWIeEyKfcIB2RGxGapk2Rsw7QuhJTHCJ4XwS/Nmfi0m
         wv4f2mthWm/UF4OJUKuECfl4tuSEVDfnuWTQkQpAWIZUaZxu8DMh3ph3evLpfuEw6IEK
         MoW9iB84yzBIHcsc2B7d9OBfcqiMCmZntNlfXoWvLZr9088w6ZY0uHXFK2r4TbQkUsq7
         PmnmEn0pl488AdriFRaZasKhpgeY0kWGFDrR/+guatUWgoUhgFzt4Tjg4u3vnJXp99Ce
         JkzEaOo5JuUjNYlQmHr+6wYvDKwooRd/S0wbt7IVT6hFs7Fv49vWVBAb+RTYfcws6sHi
         o4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227056; x=1739831856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJrdF9PqOCsaQVoyXe6fXVbwa2pQeAvJKGzGuCxpxAQ=;
        b=dZq4l+zHqw7j/vLAvQMcJ4WUbPc5AJPlavf7tIr/0R0htLd2HUnXmbFy4RcZSdzjCp
         xOhFgAtzarAaZTGtQCDa6L15Vf+bFw/4GaCQ3eAk/G/uo3CpTpTUADqArQ8UG8Piakmw
         /hQHiDSc+SsoM0ITedt73WuTPFXuKrdoxk4gHK1suE8JRUyui5HDizZ4n08c9AL5FN5b
         Yt8i5C43SXgqzUmmvgPDORP51UgyRT+YpQNsC+DwrYJjWkECNh3sqFP1qWoDjTzQ1rAC
         KvneGn+73tFr2vaUKR8km1RSvEd2195y3q11sofRiFKmLfTowX+pZJoAKvqzvLf5VqK/
         BsOw==
X-Gm-Message-State: AOJu0Yzu9E2w6h9CfsMmJU21Sw+/Dy7SDA/Vo7iaLBvFEtOzpoyPMNbk
	sc0mpgCXIQZRaJRQgnvoLy4DNfSG+nRBc+DTYJ+feH+EksxJx0LQC5Y41XGsa2g=
X-Gm-Gg: ASbGnct4iCJwCvog8lgpw14C9rkgSMKcVlgk5Pa33c2Ffcfo4eJ6e6/yyYQLdrfr4RX
	0yo1yik79hT9hddcMsAtjZAg6/hTBXLXM8oVIsKMUqhO7DxeDP6vlnjxrpvtlsLrRgsImgQmart
	mxJ5dGFGaL/k5vYC29Yz3B9foU3iN1m3h5ED2SjEjKnX6gorf+FfNc1POu2NZH21ZdjpLkQVPIV
	11mGUeoSHSqp5+5W2ICgp0FAkeQopcLlfJi6iAjobS6ub6xk4zuZVCSh3jjaO4FvOh0eCkQ0Ogs
	gQb3UXyhtUJ1fI/3/+3pdj7HVxze/5slAcTHouqZ1D9mS2Y=
X-Google-Smtp-Source: AGHT+IEaS15Bntym3mAt6zrku3a2Uko68yjmwMRgXiq6dPbA7MZZB8Aa64yOncDet1fFdEO8/9GX1g==
X-Received: by 2002:a05:6808:198f:b0:3f3:b6c2:a29 with SMTP id 5614622812f47-3f3b6c2115dmr3804142b6e.7.1739227056176;
        Mon, 10 Feb 2025 14:37:36 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:34 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:28 -0600
Subject: [PATCH v3 02/15] auxdisplay: seg-led-gpio: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-2-d6a673674da8@baylibre.com>
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
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

Acked-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/auxdisplay/seg-led-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/auxdisplay/seg-led-gpio.c b/drivers/auxdisplay/seg-led-gpio.c
index f10c25e6bf126cfaac3e4c353f8bfc6639d94a60..dfb62e9ce9b407fe356c3a7d2d25319b91a11a75 100644
--- a/drivers/auxdisplay/seg-led-gpio.c
+++ b/drivers/auxdisplay/seg-led-gpio.c
@@ -36,8 +36,7 @@ static void seg_led_update(struct work_struct *work)
 
 	bitmap_set_value8(values, map_to_seg7(&map->map.seg7, linedisp->buf[0]), 0);
 
-	gpiod_set_array_value_cansleep(priv->segment_gpios->ndescs, priv->segment_gpios->desc,
-				       priv->segment_gpios->info, values);
+	gpiod_multi_set_value_cansleep(priv->segment_gpios, values);
 }
 
 static int seg_led_linedisp_get_map_type(struct linedisp *linedisp)

-- 
2.43.0


