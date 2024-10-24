Return-Path: <linux-gpio+bounces-11936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89EB9AE3E8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 256ACB229F5
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1A91D0171;
	Thu, 24 Oct 2024 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PIQRFXyP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A571C878A
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769579; cv=none; b=EvQfK2TQfzVa22WKwdMBk7L/EkPXR9SGKQPQFRdlyw5T6AjZ656Jlk5B4ac9KB1u8MZjOpTPRaTRV/uEYh3SLx4t7+4RejUFHR+9dYdE09oUrn1Axo+JrM5Y/dKa0HRr/i//KVqlOlKWPL+DK6r4FRB0aj7qHGzFORtonTUwRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769579; c=relaxed/simple;
	bh=EtR59e/+9h+je4mbWsdv/8tBtr6ipuedGd537vHWyEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khhhRwfy0gs+sCq259UJxMFEDPrQjJxF1086J1yHGFFIp4+brKAKHlxT7ICLkxCElvmisWxgmA/v8XBwuZQrOQ7QSF9ly+y7Zz5OI8wt7z+eaInlhP8Smp8q5wG4i1+HFHuFfscqO95SY5JUu3H+mnvIvVDruD9WdBuZLF0bWgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PIQRFXyP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so8284935e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729769575; x=1730374375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZ/mirgwgAjZlQMvPm+2FBmAjsoLyei227snBkMmziQ=;
        b=PIQRFXyPWRXp8mNpc2Rk23+VNS5vUqTK3yJdAHJr1YpQRy6gfetdtY8j1tkXc0UlmU
         8LnRr0r+G8/9R69ezYeeelMbwBw9ns9qJXgoN3pzuhOzO7MNvQR2fYSMVrbhyX9NWOMq
         I8Z5LptX4Fp+jf1hnuK0eJk/7xgOIiZDpdiI64tssm2U86Gt1qn4/Qwgj/XaKH9VihCH
         O5rLZRDwMeK65KvymsDv6C+mqclMXfwZp7meodSQcRF/8u9pAh+JkDrHIt/a67PnafUs
         60am9Yb2lFOL5ubsZu1vG6WJj1jBEgjprhmwPx4gyPskoyNeHFfhSSnUp1HvtEU0Ra8I
         +kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769575; x=1730374375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZ/mirgwgAjZlQMvPm+2FBmAjsoLyei227snBkMmziQ=;
        b=KTxzmtWKIrcZwk2uTAXXWhQklBUZba30Xc3Cv+pklRkmxKziPJSLlLV77zsSYnlVmw
         xipYHehx4hBQRKnj54N7m2oWmVEIpVkQFs/UUlUypm0xAl5UQHjviQ6sWPD1F0iQC2pE
         9Qr21UOqFStubyp7iJ9ha8lA7+NpIghhw/7m37mbSNBwTkRGy5tAz8VpvvryIdt1CwQw
         3OJ/IaqDQzfaGd15ZTwFNmvn+Vqwo/UmfgdklEH6fL9N5oxzJrVG3pZTtgAftGHUAwVQ
         5bpI3cgn/9mV+/6+1k4ElRCJI6GLe3/lPie9Urlz0VLtYRaBGJCZMPSCaUA7Fj2MZJMt
         YU/A==
X-Gm-Message-State: AOJu0Yy4wbhePdDxhfmdFQyI/batDy/bYaUvgj5oignPCHeGuwmXSlDn
	DCgrL3AAhz5vXw7yttIs93twmMiiJe/agq1G4CPumGeTJAsSsbunFiAclHwjqxY=
X-Google-Smtp-Source: AGHT+IFZeRwqNw1uDsh6gIlNZ1JNVdIwXELyLjzTQeBUZCZZdjd5Qppprx6oSMT7zHC4UJfL+x8U3A==
X-Received: by 2002:a05:600c:350b:b0:431:46fe:4cad with SMTP id 5b1f17b1804b1-4318c6e8c1fmr12383515e9.9.1729769575100;
        Thu, 24 Oct 2024 04:32:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:17a2:e679:56a4:a25a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f484sm14592705e9.13.2024.10.24.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:32:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 13:32:44 +0200
Subject: [PATCH 1/5] gpio: sysfs: use cleanup guards for gpiod_data::mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-gpio-notify-sysfs-v1-1-981f2773e785@linaro.org>
References: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
In-Reply-To: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3945;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wbHVTkTm1C0gUmYkzNOsSMYN8WOIj6nu1O2fyjTM1Kw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnGjBk1alXs/1HXQjNSnjKs1lDzlGar0/GrDJIT
 a9gq7H7jPSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxowZAAKCRARpy6gFHHX
 cs2hEACKFi/0C62knN5BYjVREi89SqnFlqdsJp8T0Cgk7D/3XvulNT2VQEkMOhaFYFHoJdo4pZF
 JemLjv1Rk5hWGe9RWktQT2Ye5Tokk95g0yjOB09oJSMira3SfQXkIUwvac5NXgss5Jd17MrQvdm
 l7bSR6tZHho0iEqBNv1yP2kPhnmPgfJ4XJzoWKwkPYo33dN+4+QIcN7MpnsqkDycDRGPKzN3l5d
 EGcLcL4e1Xm1eaVqxH7kF0MSMwd+9XNaObseTrAEUZSxFhwSQ/flZLrb33mSxh3tMDc15lXX3eA
 /Im7VTzY/O926NCka1ytp5cg951uve1cMX6D3DR/ijWETQnHUCDMHS/HqmhBgIYcTN01S94sQ6g
 0onoNOeU4xa2DZ9ZrjoeLbaE+z6KntxSsUXCiWvd0JoOOD7uixocy2a46VN72XUE3+s1iqMxS6K
 qHL7FApV1mK79Kt3tLncRwoPUBbDazy9SVUM+bM9jG+qJympC2q9tCDhNTFI4as/8nRVW3S0yvk
 UjYP9Mxhq2s60IHwIJRvC8n0L1KXp6WK+JMwjmoJj6TnM4HEOxwhaGScJjJ+QG5Zm3uaP+j0An+
 V07WY77DDSDSvONAYhde1oZwUxl2F8eAAAmoLsT8hJ0WYCz9NWp0jd04CUm1chsT1r55ZOfG1Pj
 tkgi61lFZmckrfg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Shrink the code and drop some goto labels by using lock guards around
gpiod_data::mutex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 57 +++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 0c713baa7784..3ccb41a93ea7 100644
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
@@ -140,7 +133,7 @@ static ssize_t value_store(struct device *dev,
 
 	status = kstrtol(buf, 0, &value);
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
 		status = -EPERM;
@@ -149,8 +142,6 @@ static ssize_t value_store(struct device *dev,
 		status = size;
 	}
 
-	mutex_unlock(&data->mutex);
-
 	return status;
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
@@ -276,12 +264,10 @@ static ssize_t edge_store(struct device *dev,
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
@@ -292,9 +278,6 @@ static ssize_t edge_store(struct device *dev,
 			status = size;
 	}
 
-out_unlock:
-	mutex_unlock(&data->mutex);
-
 	return status;
 }
 static DEVICE_ATTR_RW(edge);
@@ -330,11 +313,8 @@ static ssize_t active_low_show(struct device *dev,
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
@@ -350,11 +330,8 @@ static ssize_t active_low_store(struct device *dev,
 	if (status)
 		return status;
 
-	mutex_lock(&data->mutex);
-
-	status = gpio_sysfs_set_active_low(dev, value);
-
-	mutex_unlock(&data->mutex);
+	scoped_guard(mutex, &data->mutex)
+		status = gpio_sysfs_set_active_low(dev, value);
 
 	return status ? : size;
 }

-- 
2.45.2


