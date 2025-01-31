Return-Path: <linux-gpio+bounces-15146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13080A243ED
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 21:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E836167855
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 20:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0671F707C;
	Fri, 31 Jan 2025 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i3p50MoR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1778B1F6675
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 20:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355107; cv=none; b=AVLD+O7Y0ST77tg/FWD5pHaIxt/2UsfPvFNXangh+M8ck4bzfeXGPKjSDhhFGBF7YuBumF5WZCJ0OPRBXyHl0Xc1xBiliTY4OYPIZtk9w3J67fS3c4yA6NkXynG+tP9vYYNojWBU8/czLSq/gBFHzwXMDRVaVTfAUart8hm+FIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355107; c=relaxed/simple;
	bh=a4UCT4/NNPETnikiY/3/IXvAqgQyANJWQskJKLdiZxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4SqokMLoVrfHZwItZeZm9CyScIH2Rxr5FsJvyGHgY8D6K5TwNTwJCkn6GGl3pdwDv7KYThIdip+uvf040lgCvzcsDuLDufPZGeljcuY5FZ3iYnrnaMo0RXLysjWGGQe4QxGSGaWv2yCtvcC78cthft+Bb987nKe1t138rHdYSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=i3p50MoR; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3ebb1652729so1227909b6e.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 12:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355104; x=1738959904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNU4SR73NkzT5flFO6XZzV58Nb+8n8xP048rFGpOLNA=;
        b=i3p50MoRqTck66HqRmjce02FFEVCLPd1WryuRoM8Vuk+27DcmPvbT5L1dLrth8Rspe
         SEJB+O8mrL3HlRbKg5VFYWuQCDhd9iOd4J+Lt4BFQJljF4pHcQrCLAKdvLDtw0FlJGV1
         7dEVAyPkdLMXt20S1aFiNAknpOWcDXQLBiMeQMF6UQLyyjAzwVOLhiheBRWtvlGJLrkT
         YS2GUkU7S1H9uADGOi9+20YUVkUG5taerhoyFL8T8fFl/7yBhswxXr+dFp1bwdy7n38P
         1IXFmSQrGkvfN+yZ77Yu/R9POZDUUjLQtzpE/7EtjT2Db+Ut9M+aCRHdVkFBw5e8e1N8
         FszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355104; x=1738959904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNU4SR73NkzT5flFO6XZzV58Nb+8n8xP048rFGpOLNA=;
        b=Z2uEq0D9lh8E//CiEFK7aJXWmOVXXKysm1WzaufIQV2NQCpCDuaT7CHu+vo6yO5moH
         g3VXV82D6Lg5orX4EChwlaqdkUmasXMjtEiRnfuctkdCjJsScU7mRYpUHoJS4vNJITLR
         0I1esbgM2lYA7VQEVh1z0B+v7gyYfPu/DV22V+ZZFAXk8rQGwBVm0uJcWTLWfB+xe3Oc
         1GQwDZsseQRg8eb2qJRfe/rrTdSRaX5fbne1ore5VgA2tEl1+LfXz2b5mtF8i37PKqB8
         Da8ucOOkliBF5z8mc2UHEYqLLUpaDAmsvzS9fpMEFRlWU4/VEhN6Abg6jc9wP5ClgNN0
         UYaQ==
X-Gm-Message-State: AOJu0YwDc6TNpaI1bVBVBzPSx71IHy+pBTFbwXXcy9gHMioFzrJIlcQ0
	Dd7nkO4tekJMKHrCVXbYZ1d/STi6BO9WdgUdgcx/a4oe9t4mj3C20jMl1qLZ8Ek=
X-Gm-Gg: ASbGncuX1DlqWbQ2UOerP/CyY+hJG/mLtnYUd3gV8Nkk4dVByJ/UJN4mRNPGTAvOYpD
	+WqsjAPa1FuGUMb172yOrGRoV1xPt0wlLUkbq5xR2/oTPYnjI1f3cK+sIUQ2LR1k+klnUazcui/
	3TiEGmPwdXaTNL5hrPe/azwwEAFrVqksueT3rxnOgLxYldm0+NwfCl5LLCl0WS5BZzxDLZXh8AW
	enibZMlv42VarWUnKM/dnVOeLOjv/Ie0bV3RBZh6YEt9kxmjGff5xH8pUjjG+xW0+4XpOCl4E53
	4IHb3RI5M3+F2o/r2t139S1B/3HqOeDu93fEPYQ4s+OwSxU=
X-Google-Smtp-Source: AGHT+IEjjM8UkUItH0qBBqM7/8yjcARln6tFWMQk1I1vtwY7yg+bjxT3tjK0CN1AwA297vbCg45WVA==
X-Received: by 2002:a05:6871:7891:b0:29e:48d6:2e62 with SMTP id 586e51a60fabf-2b32f06986amr8146491fac.9.1738355104164;
        Fri, 31 Jan 2025 12:25:04 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:02 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:47 -0600
Subject: [PATCH 07/13] iio: amplifiers: hmc425a: use
 gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-7-991c8ccb4d6e@baylibre.com>
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
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

Reduce verbosity by using gpiods_set_array_value_cansleep() instead of
gpiods_set_array_value_cansleep().

Passing NULL as the 3rd argument to gpiod_set_array_value_cansleep()
only needs to be done if the array was constructed manually, which is
not the case here. This change effectively replaces that argument with
st->gpios->array_info. The possible side effect of this change is that
it could make setting the GPIOs more efficient.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/amplifiers/hmc425a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
index 2ee4c0d70281e24c1c818249b86d89ebe06d4876..e8c67c8145b1b9ccb9b70ccd3ce4f5de08f96e69 100644
--- a/drivers/iio/amplifiers/hmc425a.c
+++ b/drivers/iio/amplifiers/hmc425a.c
@@ -161,8 +161,7 @@ static int hmc425a_write(struct iio_dev *indio_dev, u32 value)
 
 	values[0] = value;
 
-	gpiod_set_array_value_cansleep(st->gpios->ndescs, st->gpios->desc,
-				       NULL, values);
+	gpiods_set_array_value_cansleep(st->gpios, values);
 	return 0;
 }
 

-- 
2.43.0


