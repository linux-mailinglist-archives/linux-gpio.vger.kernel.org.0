Return-Path: <linux-gpio+bounces-15464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A345FA2AB8B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 15:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5A1E3A989B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 14:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE27236428;
	Thu,  6 Feb 2025 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YRHHjnwK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1C0236430
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852647; cv=none; b=K/9+75rB6EfrUl0TOje5oMISF6AbknkAAtRUzF1GVjBrEw+tCsMgNagy/vTchEQjavPN34IOZfxEprbLK+gBQoViB8U+GdNvIeOvlVsBP9Olss3NrvTNKhtJferCz4+4I3ZcKA8SQq1wszvp4hmFe7nS7sEitN+CcBCEklsKKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852647; c=relaxed/simple;
	bh=cWW9uaj5btARuTOtAzQ7Ntg5bsR34Hrv1hOCWz5pJfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+20f3RwCMm6DBzkV0s7jL6+9iBRYuuWkgtemZgLjWPEwEsOAZw3i1OpZbjCcD5ZX8NCEYmeHvNqV+nbmJUiDl0gQAYemDaqYK0iBgcgR22JSy2frxF0T2GGA70ihoUoTVWTAxzsbrC154D6+lcyc4jfvRxRlN2axn3Pvl8RAmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YRHHjnwK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38db3a3cf1cso436913f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 06:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738852643; x=1739457443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF98C5d2ZTnvdUxMyQwmWIlQzv8/8YoukSIjQ9ItWNU=;
        b=YRHHjnwKbzC1bMTjFr3aED+pcoLHUR6hFwo478EOHb9d9ivzAKiNAeYOuzCn+GUgnj
         RPFVclpNbHHQQ3cUsGiKSMJPSG9Pvbp3/2qc2+7ehwb5YrGqSn16fvKOkWmh9oFWTLQ9
         7V+iZZhF71lZ8PPtrX4Yo4lXyCkOGAauSQqoHpkBIE6fI8emFDM0W6XrUa2i7avoMCFI
         f/akOU0dTtA4SzwZ/gPFQPoRti2WEhNuK8UFUspvpLgMlULrXcBmVuBZwTN+UJN+Ygbt
         nV8F+zx9qam17Olly3jT55VR4cmeZC6ruIo8tYSps9VhFlUa1242IjchW8in7OSXTjfo
         jJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852643; x=1739457443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF98C5d2ZTnvdUxMyQwmWIlQzv8/8YoukSIjQ9ItWNU=;
        b=D9j+7TacXnMrmmb37KUaKrkVqpdFKj9N2B9Wi1z8OOepBT/uy5Ussqy264ZJ3GvksL
         uYEW9Q38BNp6qw2ydrjzm8lD8fWtWCYONsk0BoEiJ+IpaeufEY3u/MuWAD494t5VpJ4D
         Kpnk3yAA9CXAp6oG4fus1DJcJIGnkwQH4U5H1Jy13xwhoW4xaW7kgNOPcXK5DF7LxS8A
         SbwZ0N/zN/4e4yHH2N9vw2JDr+UQX1svaawsWu21tWxMl74R6jqXq+5Sr6JjrzMlyug0
         cJoAqyr4DMUP1izjHvhTRBi6mCEPNYC1QHshGLlBVO8mW5SGgXk4jTUhg9uie3y436Rm
         bWEA==
X-Gm-Message-State: AOJu0YwQqfa+5vKXGkYBxxCPo65oSNdA4WtT7R6H5DVf5S4Ky9U8QtfM
	CfHD/ha4XVXEXjEQwlHP4XjDGkL1sKBacxlvIx+bB9JpMvnz8Og+cIh71y8ufFg=
X-Gm-Gg: ASbGncs//B1el4gyMIfV9IADNxOBRUirm5qrVJxWPpUjv06h7WD696vOkBtnv3uhGxb
	WATeeo1mSE71h+hS/Hp1LosDpfQmASMcFl/8AT5vDNVxfZc+reU0kLq4ZntdeaFoSqcjUZ7qgDr
	7ktK5EVDS16pDI29gOP6AWojJ1IjIcUKFgWs0LZAD+am83RkrLWtOoKdNjs9Ci/d+pgUZoJ6KpE
	BOGYXos4L/YGwEGouT9WNzfjCPRaWI5iQu0+J4SB+DTo1u/4R99/wybie1ee4hr5iEFxUu0eRV9
	aRZR2FRsfa+a
X-Google-Smtp-Source: AGHT+IFo/YE/ZtOR+lTWdRiCCfpRQ8d0qEwBCkSp6K2f24hkXXHc1rTYV9AZD/HJU1mRVqh7TuuJCw==
X-Received: by 2002:adf:f38f:0:b0:38d:b283:2c48 with SMTP id ffacd0b85a97d-38db4938a63mr4602821f8f.50.1738852642865;
        Thu, 06 Feb 2025 06:37:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd7e5f9sm1929769f8f.57.2025.02.06.06.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 06:37:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: don't build HTE code with CONFIG_HTE disabled
Date: Thu,  6 Feb 2025 15:37:14 +0100
Message-ID: <20250206143714.182230-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hardware timestamping is only used on tegra186 platforms but we include
the code and export the symbols everywhere. Shrink the binary a bit by
compiling the relevant functions conditionally.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        |  2 ++
 include/linux/gpio/consumer.h | 36 +++++++++++++++++++++--------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index be3351583508..0f4b31f4a995 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2908,6 +2908,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_HTE)
 /**
  * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
  *
@@ -2973,6 +2974,7 @@ int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
+#endif /* CONFIG_HTE */
 
 /**
  * gpiod_set_config - sets @config for a GPIO
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..2175f62e2178 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -110,8 +110,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
-int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -348,18 +346,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 	WARN_ON(desc);
 	return -ENOSYS;
 }
-static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
-					       unsigned long flags)
-{
-	WARN_ON(desc);
-	return -ENOSYS;
-}
-static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
-						unsigned long flags)
-{
-	WARN_ON(desc);
-	return -ENOSYS;
-}
 static inline int gpiod_get_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
@@ -560,6 +546,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #endif /* CONFIG_GPIOLIB */
 
+#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
+int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+#else
+static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
+					       unsigned long flags)
+{
+#if !IS_ENABLED(CONFIG_GPIOLIB)
+	WARN_ON(desc);
+#endif
+	return -ENOSYS;
+}
+static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
+						unsigned long flags)
+{
+#if !IS_ENABLED(CONFIG_GPIOLIB)
+	WARN_ON(desc);
+#endif
+	return -ENOSYS;
+}
+#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,
-- 
2.45.2


