Return-Path: <linux-gpio+bounces-15517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59CA2BDF3
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07083AA871
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E7F1B4224;
	Fri,  7 Feb 2025 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ByAFKKEV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA531B042D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917113; cv=none; b=JvLDwFmqzVpSP78pkjbBn5pvwYCPTpiJYIUHk0igMCo39Xp7QWInOyToawyR2EOXA/eaZR2xoF0FVEZAe2F3ur7Yy8FUhWp9h/UnMFxawVYj+2ufryMv92msUliH5PAdDj1f6nN0HpnrIltpALOBtpqv+GHIGUwyaqzQ/ZieAYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917113; c=relaxed/simple;
	bh=NFcvsTr2jMTbG67gbqmy+1fBOe2tK1hIOagDIIPVIjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3EkRQzUQ7ei4mjZy4XwfSZ1HlIEzM0Dy/sqc2TnvDIUBjVGYheUtvEdkwkLuqiYAF4PbHnSmw2y/CCyleWUTUCaEEjzqd3E3pN18u+RHfwH325Sh/EpQUWUwnzruqIAykL9VDRfbOlPe2GQfloC0g6pZCBUDaa8PGDO63xohZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ByAFKKEV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dcab4b0e1so300086f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 00:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917109; x=1739521909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hiP/lIM/V6E17F8R7p0zjqfLH9MnBXnboKjp+6HCK8=;
        b=ByAFKKEVe0jTf41yC9uqtbmFnW0l2Kur5nGwDXm9XRzemWseQuXrmyvLGVbG6kLk8j
         EjpPtrwt3qgowpRRKHG7cBNw0yjINaWp2P7317+MyOzFd2H3CmvvrMfWCKlrqtubxO7i
         yaKpvLkUGkz5IXsY3QSI4c4EpDQ5zovu3B5QvrfnLjEBqFPKEeVEBH9ZcGtXcsGX355+
         1+SNsWRxm9AiwqJYdna88VhY/HlD5OhodCgbI5d6kMLksf08blwl8C57XrXy65I6bvIN
         iz+qQSJQv9WikGMDd4JldqdVRHLwFJxu8ZpdD5p+1blTC4enTS7EpblIgN0pU1oTRxNH
         ib2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917109; x=1739521909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hiP/lIM/V6E17F8R7p0zjqfLH9MnBXnboKjp+6HCK8=;
        b=vZoPO3EnNYOiy42CENxgOZME4q4w4yWhPwnGUL5cTACBnU0u2dUeo6onANOUJ032gU
         OhP42a4VWTvlom8xENA6hPNDUtb2iOB6p0X4dmHjfZdozD1tnnxlGxsmDdOjMWJphbrA
         D7ymi6o9CIISgI4ifpAn51koayUNK0+1I9Ct9RPkCVGO9lJvZ2OZy6IGIA2+rNTcjLhO
         f5lyWmz824EZj9JTEsfe6zu6MPoVEwSHHbkEMHNxAvC92YsjOmEIseZJWy9wF63Yvs+m
         wO+kI1VsG4J8rhgto4HXAhBWpmuLQQ3mqqq/9InfaVNCcn3vd6x9iLbkljNJu4q6HzIZ
         XvWQ==
X-Gm-Message-State: AOJu0YxuQZjITif5QIM7gjp6CjFbpj3Y8A8H9nki8/sT8wXNHrrOfIMe
	HhSK8Bq6rP0tgF8IirvTA5ILtpGGLTSF8gESWwnC8POnFk8g6Q22HJLCgqKPVq0=
X-Gm-Gg: ASbGncspNmE4D4Eb8XZCgScb4R8dXitDPKqh7YWoTqczKJyEZh7pyA9mewV9bC+eJW9
	30QLp7JrQam2Wv2XBMf9qDbRbvJMx0CPUuY5ZSmU+85xNENpNVeGjabISNhl0DtjhU7i2Jn7Ufx
	3UT1iDunKz1mHqt1pzCnu+b1+KXBdUEjsQHYNdP0wcVsqimjPxWPlYjvDBv8wl8rAVrpZP5jUFW
	PsDeUV7YTiW5lqakuwsCKamEo4Bn8lRSdf8siY+8l/67fkYv7nyITnmbst8Mmj88xRJxejiQcoX
	IPKq/ALFzDmyhg==
X-Google-Smtp-Source: AGHT+IFOlZiM3R6pqOc8wdbixGurSPRs6W4HzpwA+czNqsoQykv2dpkhOJF/Zj4Aws45Gicc3f+vOQ==
X-Received: by 2002:a5d:6d0d:0:b0:38d:b229:87ff with SMTP id ffacd0b85a97d-38dc8db1d53mr1416604f8f.14.1738917109114;
        Fri, 07 Feb 2025 00:31:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ae69:c28e:8e23:dca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca0041sm46003075e9.14.2025.02.07.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:31:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
Date: Fri,  7 Feb 2025 09:31:46 +0100
Message-ID: <20250207083146.17872-1-brgl@bgdev.pl>
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
Changes in v2:
- reduce preprocessor ifdiffery

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
index 0b1acd014186..bc670f98faa6 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -111,8 +111,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
-int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -349,18 +347,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
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
@@ -561,6 +547,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #endif /* CONFIG_GPIOLIB */
 
+#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
+int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+#else
+static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
+					       unsigned long flags)
+{
+	if (!IS_ENABLED(CONFIG_GPIOLIB))
+		WARN_ON(desc);
+
+	return -ENOSYS;
+}
+static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
+						unsigned long flags)
+{
+	if (!IS_ENABLED(CONFIG_GPIOLIB))
+		WARN_ON(desc);
+
+	return -ENOSYS;
+}
+#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,
-- 
2.45.2


