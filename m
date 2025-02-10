Return-Path: <linux-gpio+bounces-15685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA8A2FD8B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ED2F3A5B5D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A712638AE;
	Mon, 10 Feb 2025 22:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sBoqBWii"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF6B262D19
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227100; cv=none; b=Tno1qMLmQxhF1UEVVv200lqyx0kAX0xfivBIWOns3BSQJeacQM1QIiuRQL18QWnX1rWq1U4YXXZuXaeN0vfbjOYBryGeFzMYOQbvRGMgTnvBDykT/Xc+2JbFEgs+ATIJ0Y7Xoz3WzVCvhF8WT9ye9sKsktP4HKlOCxyOrmC0scY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227100; c=relaxed/simple;
	bh=SREiuK3L9rZlfmn2CRPkgp1zixwI3ho4VDIygOej2Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPAFbkx0m+1AVc3KzJT+gGJSMDtXer7kQWRZv8epcsFhtqU8S7T1L+iP67i2PIz/BQj6WtkS5ofllJ+yoBNFSspqFjnaduvpvFprxlA6DbVcIhePi0jb/Ih4I/jsHYaQpJiywzUoleyMR7JDZiAomTlnwGRA/ZraqDp1OiQhqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sBoqBWii; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f3a6980ba7so1240120b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227097; x=1739831897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zrl0lG0s99SDBuGZ/+AcMLJIAJmPLy1NCd/dBoX8jU8=;
        b=sBoqBWiilrg6G6DcKncG/QpD3XTif6KLjw4bVZEcVRfSe0hlXDRNldE9YF2PAWEulM
         /sVf3tX5SwJe89Lj9M3MIJaCSs/jc++FpF8/lBpSXw2Rh4aJABVWPzB+mAbwOIK7QYhN
         6oPTUx7jplW5h1Q9Glmxas07OXMuPokCylYCVZrWgO1kbMVxEreyu7pT3Uos0DthgENZ
         qRm2huNp0aJC+MYKTFrjAeCcU0mMxdfCA6N5q8CvwJ9rjYFSF2MzzMa+Jy26pj/OKhJr
         5eOr6oS8AUK89BLsnCV0I9YsOlDgM+6fh0+hziadoBBOWYFT53YLUukUBy7sBwFkSFVY
         JHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227097; x=1739831897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrl0lG0s99SDBuGZ/+AcMLJIAJmPLy1NCd/dBoX8jU8=;
        b=QNS4Nja/+ubsuZX7ctwWud9cNC2FLu9KShhvCLNpikaK6O6O8fTRe9FbSlLX8u9eBt
         c4Ew7xh42yfRBzHcT8SvNUYzoybCly/TzfPqpnjXLmLF66TDBIyz6lBSDR/Po6XF9X+Q
         k7I+WyJTFks6oiTjBdgZfZcwRslmi4RyKQd8lKlrZsx+dCL32MPerc4LUsT5ntSRJlWi
         qJbUs61v+QWjYJzy0AN8GpEboVtZcJoG9/Kj99spKSYz+4Nlc7EcMXMfStKdIu5nGWhU
         rNqE8ByHPLhKUbTE8RdAXviBcsOCm31ql2pV/qzR36Ip3Gsm+Qczwi02ZRuIrI2/GkTC
         M8Mw==
X-Gm-Message-State: AOJu0YxDUZJNHtWnfQPCtUNGoaUuFlhH1JTXoK2KU68jAJluwAw9b6Dm
	v00FwvuD2QL8YAWZHjj0slnEv1HqjV7EivVsEIwPEunC/R4xK58b1PIkEa5PdEU=
X-Gm-Gg: ASbGncs06ZVbjSGKb3SqVtWZDFC6ujt9Mpa7qZrGkgK2iO/8sEPHqsA21ruyIzd14Pe
	sl4CfpehGyT8IoAdEfcKyXULvIOx0zFVXcPBl2EBbnhrD6D1nc5FJe/GCZJWy+WU3d8akwABrPG
	bQtVhrhxB4hbND/7REq4LKWMFftbQ7T1VqP7HIwJTOf+Dq6fJZD5V54o4z6O2lZ7T0Owpnfw6am
	sBe2I8aJPKvxAoHIoipB8HELoaOU2H+0teFoxQiI3Zf6EarEMMrEhtOam6hwWIako+9ofdnnBns
	nnZgXmKmpvgCoPUHAJ4PmPoeIPxBmkrlFyoA9budXbv+gcI=
X-Google-Smtp-Source: AGHT+IENohB4+Vdl15nvUdajyBJJbaG44s39TfMb4Zf97z1Hi7JTuCyMgAhZEnJb83znOkXtS3I7Kg==
X-Received: by 2002:a05:6808:10c7:b0:3f3:be50:2a69 with SMTP id 5614622812f47-3f3be502d24mr1971166b6e.17.1739227097004;
        Mon, 10 Feb 2025 14:38:17 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:38:15 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:41 -0600
Subject: [PATCH v3 15/15] ASoC: adau1701: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-15-d6a673674da8@baylibre.com>
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

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 sound/soc/codecs/adau1701.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 291249e0a2a32df7dde81904dce2f6be143fc2d7..6876462d8bdbb41d551f776c2d7fe6ed46115fa1 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -325,9 +325,7 @@ static int adau1701_reset(struct snd_soc_component *component, unsigned int clkd
 			__assign_bit(1, values, 1);
 			break;
 		}
-		gpiod_set_array_value_cansleep(adau1701->gpio_pll_mode->ndescs,
-				adau1701->gpio_pll_mode->desc, adau1701->gpio_pll_mode->info,
-				values);
+		gpiod_multi_set_value_cansleep(adau1701->gpio_pll_mode, values);
 	}
 
 	adau1701->pll_clkdiv = clkdiv;

-- 
2.43.0


