Return-Path: <linux-gpio+bounces-15671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5942A2FD3D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6140C1688D0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5B7253F3B;
	Mon, 10 Feb 2025 22:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UtsC4PU2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4BA253F0D
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227055; cv=none; b=kqTYKAEl653dW2Df9RJVIGLL70fYx05Sfx/3w61/y76eDh3sm6vEI9/PgPW98/JDpeRaKa2VwvLawlhjwuAmi1KuIFb4AhwApZ9VYFP7l2ksD0lN+2o7iBuL2SyOYWxZKZ1F8N/AUrlMszHPL8tJAx6DZ02+x6G8BrABFp7jsUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227055; c=relaxed/simple;
	bh=N0Em4RkHQUvBxoy2r74GZrWjDlivg7oqNPXmv4at8dI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKrZxxgBVJtf8L1+YTVdZz48QPmVksPOkGw8xldnSK8YGtLoIM9kxtTR4B/XdV9y/yw7TAcSCwC92wP/mOuwtNrQEhhROH4Raao+M/5CxOP5CaScjNk77j6ixiXCJoK93BM/QgApQ7hakrZaERNOwoLXsME0pBF0S1alj5Isfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UtsC4PU2; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f3ac0c8053so877243b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227053; x=1739831853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BdRdts91zZ1lBz7cZl7Oig3MKNc6jPxib3EI6sYvCw=;
        b=UtsC4PU2jEf6Iigi4rlnw6wcpWHJPn9dN1Y/ssJiTHPQO/CZtNRpsBzMfDZlyt/we0
         RHuvVN+hHYkiWa+JZ9v2hwWgZBkL9x+SieJHP5Ac/9ymC+T0V6fuZ9mDkfZyOmRAwJne
         uPbi8Z4raeikVNmyPxq48ndMS9AY4DnshSuYZQXcVYZAxWB6CLw/5yRRn7eHlEkcFFnI
         cWRNaWQ/SNXQXB/fEk3gZ3NBilf2Ay0p8Z3tmcIGDHXh9atrJO+I7wOKX6b+rD/P9Tw9
         bum8f285kxDjh+R4nDlD/oxghHe+83NmYNGeeyjmHMDgAXUxM9+gyp49TVcNafo13Xw1
         0qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227053; x=1739831853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BdRdts91zZ1lBz7cZl7Oig3MKNc6jPxib3EI6sYvCw=;
        b=TUHMK6pk6+z1Bei0OdiFsGZ61fISHkq1t/6xrllmadzH7QyGV+s35qUI2YQeAt1Hr9
         SvGqEXyh7pszCrjZnotX7l5LR6bfUMMWq0WnMxTFCa8P7xAwMBl1MtTuqsWytzlfwhYl
         Y1q/u2ehX1wDC4FfjMKbSnLnPHeVBhfqOghauDr7OBWKAoXzv0OF92Mt2Qgg9qoYQ2en
         8Rm6IsLFAEAQ/YuJaLYpP1vN7/KHodnR29cS+xCPPZway9N+mo1iTNRNgJ+cU8dasUnl
         gJuDSaVYW3IZ0s1L4ft3TWSuDAwv0+PfHDFV7ovk3xuvuDUusKZs3qBnhokDj0KgDAxT
         /9YQ==
X-Gm-Message-State: AOJu0Yzna8xgTr2pThe4zHL1xt7rlXa8HBw5v2FQ+GCJwERT2J/EI7rD
	6Vg2JjImCU2irc/Fml7KFIkUiBWgABRovfmgL4oiqTn4dkca2X9ACe7bUG+8LNA=
X-Gm-Gg: ASbGncviBQtKPshS9iVweDkgzgJJWO9aEGPxDCeo4mK1heXY6P/NIzHwcYgixuO4Xkp
	LvrMpmIT6S5mI3ZNLMpn2rf+119DSEqf0qAi29UEAQmR7605C5utzQ5hH/h+wYtiYzg7345+I2f
	taldE55kfebh0YrcIt07WUby3BbRJA3t0CSGGEb8SmlirOkwjsvlus+FdMYblm17010YsxplwZS
	iCLH4nILD5zKuLfhh3eCK/mYlBZB0U68RffclKoh9cnp4dhc9fObvWDDuqUVXovu/ka9uTsfBoV
	2asm7cMao55V/BtH2YusrHVrEoq0fwUBqlyhmqNG0ctQN8w=
X-Google-Smtp-Source: AGHT+IHsM3QlE/6UGVvIOu1IlhPnETs+gBtT/fIeOJD2BqtDOh052hlxzN8ugWj1HusAxyIKgoI2uA==
X-Received: by 2002:a05:6808:1590:b0:3f3:b8c5:4ff9 with SMTP id 5614622812f47-3f3b8c55799mr3309849b6e.28.1739227052973;
        Mon, 10 Feb 2025 14:37:32 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:31 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:27 -0600
Subject: [PATCH v3 01/15] gpiolib: add gpiod_multi_set_value_cansleep()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-1-d6a673674da8@baylibre.com>
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

Add a new gpiod_multi_set_value_cansleep() helper function with fewer
parameters than gpiod_set_array_value_cansleep().

Calling gpiod_set_array_value_cansleep() can get quite verbose. In many
cases, the first arguments all come from the same struct gpio_descs, so
having a separate function where we can just pass that cuts down on the
boilerplate.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

FYI, I dropped Linus' Reviewed-by: tag since adding the IS_ERR_OR_NULL()
check isn't exactly trivial.
---
 include/linux/gpio/consumer.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edbd12059826183b1c0f73c7a58ff40..5cbd4afd78625367a761e224acc3f7336d310dd0 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,7 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct acpi_device;
@@ -655,4 +656,14 @@ static inline void gpiod_unexport(struct gpio_desc *desc)
 
 #endif /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
 
+static inline int gpiod_multi_set_value_cansleep(struct gpio_descs *descs,
+						 unsigned long *value_bitmap)
+{
+	if (IS_ERR_OR_NULL(descs))
+		return PTR_ERR_OR_ZERO(descs);
+
+	return gpiod_set_array_value_cansleep(descs->ndescs, descs->desc,
+					      descs->info, value_bitmap);
+}
+
 #endif

-- 
2.43.0


