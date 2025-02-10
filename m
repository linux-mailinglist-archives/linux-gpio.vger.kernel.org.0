Return-Path: <linux-gpio+bounces-15644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B6A2E94F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E36A7A226C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B491E9901;
	Mon, 10 Feb 2025 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LSPS7zza"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C01E633C
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183044; cv=none; b=EP8RwmDY26nsxsIHhqsOvHa33D695CtiIDCJ1bK+h21sABzhXu0JCQ/YKGW47s2uOc6Re+rXvsc4NuxHKSCsztyhW7zENuHvISbvXXeoGSmuD8Xw7nTMSnHjQRv8AJ13nNtLYvW/xVKby2AqS6K8iTM/+6A/eXtfmoV4WmKL0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183044; c=relaxed/simple;
	bh=SEuHiZ39nk3R/OgrwDMMKMgLaelHjpgsvFZR3Gv2erU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWW8JE5pqyxKU/W2zuLciiswEz4YqTTLwXA84gFXhFM7pvYZJk5dKxJD+r/UWDdgH6MCxacVT1x+EVcPkiC5yER5kNCcXc3af93h3HIhyGJ+Z5cDZvst3207PgYOULE9PpuzVLqqYUDWL0wi039cK5Q106+Re8whiOsyIojnG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LSPS7zza; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38de1a5f039so334455f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739183040; x=1739787840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAs2LZ2NWgql1gIfsJGw/9zwhaFBmE7zJ8vE+7MhjGA=;
        b=LSPS7zza+7KrmBbCn7pmjIINN5kt4DTvmk6ce/CYU9GxPJ0RjSODXXcLjOb0FlC1LE
         R6VzRXhR9p/YNOoxZ+5NMqkMFCzaZFCruas0fLKqG7w1qZQntrmUX18COdoDD/Gz1Y7j
         vYOSRhGQfXRDJwNwunMRTfLz5BLjvzvYJtDB6NXO05EEI95JXqEDixgan02b2GtFFsBb
         RHOyX84cpWtcnnyGa2PmsSmNJX/vrB9JUJbQ9Xn61ECH8xoNkTKkipvf+xxAR4EtzZFf
         bpTw7FzjbPD009mCkjzeyejFBfusjUi/gXdHERrKa6owlnT9tq4eo9R+GnrKDzHShAhG
         W+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183040; x=1739787840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAs2LZ2NWgql1gIfsJGw/9zwhaFBmE7zJ8vE+7MhjGA=;
        b=rLbvJC5Q2cV5s83cKeojDYYzprRm1kYSRbXg777IJgV+fF/vLGdN9hJby4RGxwVp5r
         YN25aQTWtUogQIwrmOMZNg3dTUTL3kGpj7Y8UhczZKRcSVaZrhACZQCbd38az0ZzdBW1
         ukqYepIdwr9hu0R/hGcyeT6VvcCm8oC40iNQoKHE439mkZG4NM7/ob01T9vPu27rYW79
         HToebd1qA4bU7g8sktOHiYs75upKKJXu0Mee7Jn2D2hj2uUQPIpYlgU7TuvN+EUCQ1Q2
         Jd4tz/6xLNF/0e9p7qLc1B6tOorzxPdPbynUNxPURH+mqxopzPbqZP4rIZ3nu4BlQoct
         icHQ==
X-Gm-Message-State: AOJu0YwWOXdOHAA8KsdRRL1ZTwTiWu1j7tCpYu5bTCnOzNqQJmokuuAE
	vaYCLfCPLZ9aPNk8yLYZG95lho8L20q200v0+FzcPnn2VzfSl+qHtDekOIJ255T9wYOMCi7+SdP
	mQ2I=
X-Gm-Gg: ASbGnctZDKRhuf+Bm6CDBRqPkHPr1LGwCebINyzGk+08yAqBmsSkzwqtUvnN2jFeOxa
	TO1eTobNnQtlzVQ8femHyX7amugpzoZGezpsl2AlqxEw2lZaCVAL/c6Hl+5xp+4D+9w2eJfKos2
	F6IhFloYrCpEjfiQd4aH5epZnckDUM4EJiDfYumI2p2QSJDFk45jkAXINGp7VckA88LIJ0tJ48a
	mokovyvCxRtvHTi3gWR9u9z1DImiGWJjScmsJzWAgoavk+VwZwwkvLUb3jRoLQC94dT+3Knialq
	uPLM6jM3h6767yQ=
X-Google-Smtp-Source: AGHT+IEvwcW7az1HIBBu0fJmkVOZLB7gEKv2EGnPMa5hQfRCyWQYPs3/QVHnYwuk7OBqTXYHsRMJkw==
X-Received: by 2002:a05:6000:144d:b0:38d:df21:a51a with SMTP id ffacd0b85a97d-38ddf21a881mr3009109f8f.16.1739183040177;
        Mon, 10 Feb 2025 02:24:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6080926sm5846535f8f.83.2025.02.10.02.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:23:59 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 2/2] gpiolib: don't build HTE code with CONFIG_HTE disabled
Date: Mon, 10 Feb 2025 11:23:53 +0100
Message-ID: <20250210102353.83132-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210102353.83132-1-brgl@bgdev.pl>
References: <20250210102353.83132-1-brgl@bgdev.pl>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- add patch 1/2 that fixes header issues with stubs

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
index 8d467344528f..ade8a0b52373 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -114,8 +114,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
-int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -347,18 +345,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
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
@@ -559,6 +545,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
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


