Return-Path: <linux-gpio+bounces-15496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FAA2B5B5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 23:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 801C03A87FA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 22:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231D723CEF7;
	Thu,  6 Feb 2025 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wjbvpfe1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C73A23770C
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882116; cv=none; b=VNBOuJk5o3iR66naTS4u8V1X6lGWAamU+RnFhjDkzs+7f/8ZNBLDWlJKK6VzlfrP45BsWaAbc/3tloqjrAFKO+r4VV72TZzAPeyB1Aoc9MjII9Uv+bVuqod6yqOMCVQ4+quqcMt2f1tF/iRKvbFHX6aAmZJukagByg5RRWQXr9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882116; c=relaxed/simple;
	bh=dVRjAU54tx+uhyYX3p8irPZ6yP65YxRfaFsbht8BOc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSPS7Nha1JgrZhTzsERNfR3ASCtuV03AFQSEYyp7YKlQBqqgWHxu/hn5lAe3wgADDOfzkY/VPriHNyuJyS+NXBRNheh7O5r5fMNwmXs+0/24gm4Yyo2Bqw7D2UcAh81BfPI2+EGhVydzybbgOLHISKkKbiLo5aVwKz+KCy5z6Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wjbvpfe1; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71e2766994bso849773a34.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 14:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882112; x=1739486912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qt9BcvBwXw7VI7drRQ9jRI7HoN4iY1rdT776+r9izwk=;
        b=wjbvpfe1y9vbu9WfWQNJOmobf4evI0a0DTqd05GYZWCD+pM1oc7n1Pr8t/K2ePbKwY
         9h/gKre5OlfmXCw7nBB4j2zHdshTFR7WrNNDx9WEQpLUbvz+ozbm5/xTnZ66YBwvGIHa
         oo6Hzo40IoTI9+Py9Hxzi1zeyf1uIxrkfNnFGUE57jmPb80KqZkMBV5qek8E0x9MWsfa
         3mT8OhurrwEVP1aUbipi6IJnyVVDFyfjBTA/ZTAE9GFG7r0iSLInyyxgOGvyKGVZKZc+
         GRNIspbp8MyE7wOtYKSUf6v1a0tJzFDo39su0Cb+GCY+I5dnygCR+FzmQI4OpWEf6zeD
         Dn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882112; x=1739486912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qt9BcvBwXw7VI7drRQ9jRI7HoN4iY1rdT776+r9izwk=;
        b=jEDtbGM/yB1knewbvf70JMgNsd3xR6b+LJWdXKUhip/obM0RxK/Hagi5QtFxi7h9Ss
         FnPlsLh0pZMfXYvIx3c/uXjQX2pFMMSLjunnycnLBrBPEFDg1WpCzW4IHsFnt4NgzAIW
         7nyV6QhTugpFgDbQ2eJ2lNz6psE09328suxP1/a8qArePA/09G5F0SUjWcgbBidlNYHr
         TI/5Lf21lI2EljOWynvO3B18J3qzUM9+WmiNRX2OIuETE+BLPUNCH2bkuXtGmomqqj55
         zZUD3omy2yeseJU7tG5/WP/yjd3XwHk8O/cx2OPBMNct+j80nHm2U+t1NGyuMPXgXZ4E
         /Tqg==
X-Gm-Message-State: AOJu0YxcaWdLnguMCxMpQiwugoQPBcnxWZerij+cntjaziWLHalOfZrd
	GejBa24mnbnDqYOGZ5kNmuNQ3dFK20RC9Mn7SBTSjPdLVfcLc3QSXGqYlQdtp8k=
X-Gm-Gg: ASbGncvsNZ8LTP7OoKL8ro+rQq2eFbdKSJXi/iByc0Yb90iiPMZsivj+JZo2nm0ORdu
	MxUr6hvyYvhYhRz5BDXVZztmOlEbXz6mz1z/xhEnw5AZ4cUltAvOqZ8v0ZVdftCv8E9jatL+Ui/
	+ye9HFt4WcAyGvShsF5+4UlottJRWcAGMancspGYVuMvjArl8xLUKJSamkY2afi/cVMJfTmjFCr
	gI54AP+psb60jNObwjoAl84Diij4ZBLBNaGEiYy9SgW3s1hvMdCA2dvYussoAoDzm9V6qBFxz1P
	Vm6dqn2Xs+G6D2xRVWs/Ar7Ut+xKsW7SbO+55GObyMoZBC0=
X-Google-Smtp-Source: AGHT+IHXxKi2A/XYeV5UWyLNbvoQ8dEflCn5kPNBQNuzG5uM6VGTHdJPWbFF8OVEjlJC3/X0uqQhvA==
X-Received: by 2002:a05:6830:668e:b0:71e:48b1:ad28 with SMTP id 46e09a7af769-726b87b3665mr815075a34.4.1738882112753;
        Thu, 06 Feb 2025 14:48:32 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:32 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:22 -0600
Subject: [PATCH v2 08/13] iio: resolver: ad2s1210: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-8-1c5f048f79c3@baylibre.com>
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


