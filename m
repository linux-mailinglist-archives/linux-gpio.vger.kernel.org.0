Return-Path: <linux-gpio+bounces-12091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D619C9B0202
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6997A2815D1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 12:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F4A2036E6;
	Fri, 25 Oct 2024 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nkPHKZyL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C3F1FF7B9
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729858754; cv=none; b=pRN4QZUmL9iCQ2hiKdUDsil4aI2RcvSoyaHWjxNHiyrDymxancMpR6O+HscMPUwfUVtHS2WGEasfoTGz3XuUw8qfXo0RjFzyOBXw34sY82QMAQSbYJu0ZGU0oY368KZyJs3AtWU3HQWvwzcoDkH2NZKYdTNtYSA74TsXO3KKCmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729858754; c=relaxed/simple;
	bh=2ZMPPBrPIR6OFsivfIz/Hhg/QV+K5tiWBJQ2SMqFVXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUmncCXFFl/gdYeJGwH1Rq0K5MdhpVVoYMCJ07k3ZAS/xOz5qtTedHs98BFsdsGLuuIUm2UUL96D9pP1xJSwVx5K6SsFsmpVObWXr/cDBpn9Q12CmCg9vq0ZZpchqaKYTyLjlWmkUgpDZ0qGSIK4QqJBX5jArV5kHLhj/wiSxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nkPHKZyL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so1363540f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 05:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729858751; x=1730463551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWkyCSkH6r+vh7Zw7+g8GLRQLpunLm9PHHlFKHQOP/Q=;
        b=nkPHKZyL8zqgqanmIqazIS7wi19mWS7WAUbA8DJVcx2x4cu8zrQncYbRo99JwmupEP
         iMREWHT4v9WVEwrKXfO6hYFQoYoMhsIBiqGwrkYnO5SoPtkr1azleyfzt5P73UiVX/pC
         eyYKVygUm6wWcyTcWxfNC6Baj9rfPKI4D4oqGo6LtncVdKLCBqW/Km6HJspbP59dQtAM
         Vkj2kkYt3FqqL0L084PLCZCn5LcevBhgAKZ1hXsJmCGFeTzTxuj3MojYt45SLjQWEnMb
         p2CKYDIkstC0ktKm+Rg18OWfjx6cN9Jw327kfB/ZyLh6FJlJcLhnM3O/1TAk289qalRL
         x+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729858751; x=1730463551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWkyCSkH6r+vh7Zw7+g8GLRQLpunLm9PHHlFKHQOP/Q=;
        b=kqaVlArWc5djzRlgq7pr/AQPztzISKR54wwC0LX0FWZG3fLBDGhPd7QyA7qGLdH8gU
         WkYYs3yrUunZIoe+sQiw+pascgdETND6S0fAhR2oM6LNHWCwJZWZVxckIW1RMQGxjqL4
         XjE78Q/qUoAv/YNO+46LTEQB2FzebDGH+kXB/dtzJGj+YG68sLnB0ws2IQHCkIUbW6hl
         l778grAORrOtQlKiaNcTj78fgTsgXegBbKNwsuEO8Vq4j/I5eR1at2qMPIiTS0db5zCT
         ry1FFOqdxmHcxoKk9wiXa5QCgCHdLmfsQ/rMHPhhyTeiIsvD4DrWbM2CQja2tuZoHSzJ
         GByQ==
X-Gm-Message-State: AOJu0Yx8okR6apRu51zYFDfDoqmGEja253igw25Y9zut4dr79x14o7fY
	Gab/LV6tKRtOBLFygslN7Eu+eercqQRC5bIFL2cupHIi7AShYuLNSBOuqSeQmn0=
X-Google-Smtp-Source: AGHT+IFG66VEZ7W+9XoTmQWsxRUyaKo7vGevjU0SqPe60IKsppnTLpaoZ8ob+knlW28WD5QWdZzehA==
X-Received: by 2002:adf:8bda:0:b0:37c:cc4b:d1ea with SMTP id ffacd0b85a97d-37efcf93402mr5931790f8f.53.1729858750525;
        Fri, 25 Oct 2024 05:19:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a207:5d17:c81:613b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132ecsm1388966f8f.5.2024.10.25.05.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 05:19:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 14:18:51 +0200
Subject: [PATCH v2 1/5] gpio: sysfs: use cleanup guards for
 gpiod_data::mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-gpio-notify-sysfs-v2-1-5bd1b1b0b3e6@linaro.org>
References: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
In-Reply-To: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4315;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QfhBP0l+q4VJTcBdTviOIrwQSOC56R7Bx8OaJCyJOn8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnG4y8ZojQ0UAcqBduOQbwHRaa6TDilR5anHsc1
 kKRvX0nJheJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxuMvAAKCRARpy6gFHHX
 cli/EACbHTxf5NyfWsPTBm7gbIK5K/IiKkVSPdqGpTKmt0ijvA4jYxcqmS8ceBrmH46QWymQ7FU
 t9WPGf9NEm6oU45LAQK/jp4RSgnJ3WAXiQs/j8Ia8OC9asX1ofaVqam1UjgzEJoOsrJTTcI9RHW
 Ol36ccQLyqkvDKCSpKcmGNfdWGLOAUIpUpf9qbhnwmFH3dTskz+tJFZ2clgHWX6LawWRHiRv6+H
 V1NMLm0pK0yMPoIImFof1jCOubgKH4HD0yylULY4yjj2/HUokU5dfLnXfCuQRFjIo/6R/zHIqMd
 SevF8cTBh/2HiuMIKSzDsY1ZYv1dQd7h/eVKkxr5EEwLWro8git21qj27pYTvRZSJjnVXiLWENN
 HO4twOsDSDQ/maWGngp4wCqMT4fTFLafH/vbUM5b19LhQ6d8hxqzvJCYmDmaxrfW5rkWDywHbgO
 3yialtKzcG2DMNXL0PC2lc+qH1ek23g/0EVVh/a5Rclr9lQ/1ua7CpiWq1eDsOt0paH58345Yeq
 k117JOwV5QAiAwRoHbn+UEzj4sfQDBu7plZMZj7WvWSjyqGl06hJALSyrl4Cn8iW9Y8c3cUyFml
 c2A043UzrIEfHXYPB4JF0wzrlGvaIsVxmTJG0HJ1LXBSO6ZLKICzEwXwIluEsSv3cJaJFgTwRNG
 +n23nOCa3RTAN4w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Shrink the code and drop some goto labels by using lock guards around
gpiod_data::mutex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 81 ++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 52 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 0c713baa7784..e11b322d8e72 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -77,12 +77,10 @@ static ssize_t direction_show(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	int value;
 
-	mutex_lock(&data->mutex);
-
-	gpiod_get_direction(desc);
-	value = !!test_bit(FLAG_IS_OUT, &desc->flags);
-
-	mutex_unlock(&data->mutex);
+	scoped_guard(mutex, &data->mutex) {
+		gpiod_get_direction(desc);
+		value = !!test_bit(FLAG_IS_OUT, &desc->flags);
+	}
 
 	return sysfs_emit(buf, "%s\n", value ? "out" : "in");
 }
@@ -94,7 +92,7 @@ static ssize_t direction_store(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	if (sysfs_streq(buf, "high"))
 		status = gpiod_direction_output_raw(desc, 1);
@@ -105,8 +103,6 @@ static ssize_t direction_store(struct device *dev,
 	else
 		status = -EINVAL;
 
-	mutex_unlock(&data->mutex);
-
 	return status ? : size;
 }
 static DEVICE_ATTR_RW(direction);
@@ -118,11 +114,8 @@ static ssize_t value_show(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	ssize_t			status;
 
-	mutex_lock(&data->mutex);
-
-	status = gpiod_get_value_cansleep(desc);
-
-	mutex_unlock(&data->mutex);
+	scoped_guard(mutex, &data->mutex)
+		status = gpiod_get_value_cansleep(desc);
 
 	if (status < 0)
 		return status;
@@ -139,19 +132,17 @@ static ssize_t value_store(struct device *dev,
 	long value;
 
 	status = kstrtol(buf, 0, &value);
+	if (status)
+		return status;
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
-	if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
-		status = -EPERM;
-	} else if (status == 0) {
-		gpiod_set_value_cansleep(desc, value);
-		status = size;
-	}
+	if (!test_bit(FLAG_IS_OUT, &desc->flags))
+		return -EPERM;
 
-	mutex_unlock(&data->mutex);
+	gpiod_set_value_cansleep(desc, value);
 
-	return status;
+	return size;
 }
 static DEVICE_ATTR_PREALLOC(value, S_IWUSR | S_IRUGO, value_show, value_store);
 
@@ -253,11 +244,8 @@ static ssize_t edge_show(struct device *dev,
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	int flags;
 
-	mutex_lock(&data->mutex);
-
-	flags = data->irq_flags;
-
-	mutex_unlock(&data->mutex);
+	scoped_guard(mutex, &data->mutex)
+		flags = data->irq_flags;
 
 	if (flags >= ARRAY_SIZE(trigger_names))
 		return 0;
@@ -276,26 +264,22 @@ static ssize_t edge_store(struct device *dev,
 	if (flags < 0)
 		return flags;
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
-	if (flags == data->irq_flags) {
-		status = size;
-		goto out_unlock;
-	}
+	if (flags == data->irq_flags)
+		return size;
 
 	if (data->irq_flags)
 		gpio_sysfs_free_irq(dev);
 
-	if (flags) {
-		status = gpio_sysfs_request_irq(dev, flags);
-		if (!status)
-			status = size;
-	}
+	if (!flags)
+		return size;
 
-out_unlock:
-	mutex_unlock(&data->mutex);
+	status = gpio_sysfs_request_irq(dev, flags);
+	if (status)
+		return status;
 
-	return status;
+	return size;
 }
 static DEVICE_ATTR_RW(edge);
 
@@ -330,11 +314,8 @@ static ssize_t active_low_show(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	int value;
 
-	mutex_lock(&data->mutex);
-
-	value = !!test_bit(FLAG_ACTIVE_LOW, &desc->flags);
-
-	mutex_unlock(&data->mutex);
+	scoped_guard(mutex, &data->mutex)
+		value = !!test_bit(FLAG_ACTIVE_LOW, &desc->flags);
 
 	return sysfs_emit(buf, "%d\n", value);
 }
@@ -350,13 +331,9 @@ static ssize_t active_low_store(struct device *dev,
 	if (status)
 		return status;
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
-	status = gpio_sysfs_set_active_low(dev, value);
-
-	mutex_unlock(&data->mutex);
-
-	return status ? : size;
+	return gpio_sysfs_set_active_low(dev, value) ?: size;
 }
 static DEVICE_ATTR_RW(active_low);
 

-- 
2.45.2


