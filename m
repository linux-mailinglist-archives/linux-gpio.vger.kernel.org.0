Return-Path: <linux-gpio+bounces-11937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F180D9AE3E9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75D8D1F22A41
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7DD1CF7AE;
	Thu, 24 Oct 2024 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EQXZ5blY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048601B4F2B
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769580; cv=none; b=dM0mTEm13WiTygzuAxwstoJIF7MBLRZNKvQJlYniHdkZF6OEa4C9+wT0SWby77cxI32z5/Xy+zsuhLVIgP/sPsU/YcfzLIn49GBC5BShHLAbkYLPrwwZeClzYXOU9nZ8MTJQB8E6FWEyxRo9Zla/ApN5BF4LqPQiCnwb990vJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769580; c=relaxed/simple;
	bh=DXgv0hQbEavjEXHUJ7lWXUDCfXNq2OJv1JHzdTSsOv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLUMavHGQjHPEgLjzV27Vc9kMN07A1eRS5feReWtCkhEdJi1fQQczlT7OAlUoHQE1cFncwtnOOks2fDVMCDzgplqnHK41dbrXBK05OUMs7jFtMRp3jYqAEpgIfv98+q/7F9EF6N7JH382b24FcFb3SHNId9f7etyV++g2kwBd/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EQXZ5blY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43161c0068bso8229025e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729769576; x=1730374376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2XWx28w3iO+qAX/HKcN5qd2YZOsL+/Ftl84I6U0yX4=;
        b=EQXZ5blY4DHZU/37juVLrAOYg+o5INJZT5gjr8TuAPUt9VpAFcrbrfEEgsAGBXhNsQ
         kGS6Jh+FolnCEU0BfLURjvtC0iIzwDnl1v0TZeQQyPEjdxbgj6g31ejlmS71I9VtnrLQ
         BOSSDSwBlJOFZtOYxmmy5lpZAyRJFD61s3opkjQ76aNBpjWKB3d0d589eYUzhxhJJJDB
         EJMnMiK66FIZDwhCPzVxuGXVluyWxSL8u/2WMUEPWFoXhXBUbUshdzzcTNPHs6uZ5FnJ
         67D+1Hx9/SoI5oWL/6PNR3tGxv0aYybZqjAtl6+m55PuhLYFUUohiSHXsXwLetv/xjWB
         SCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769576; x=1730374376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2XWx28w3iO+qAX/HKcN5qd2YZOsL+/Ftl84I6U0yX4=;
        b=JruZQcz/R/eZJomy7pCKWCuXgmyZD7eMw+jg5MILpMKSUg+9R1k0Gz62LEtqxj8S2J
         lxjVYvwdQsbxweN+3AnLP+jrSNmxFzzevU9+qnd0tqz7P6UUluNoBHLV7nJVZzEiTEit
         T4K9XMI37I7PpMXB/udzT0SZvpWQSKuBcIVnhz33//PQN5vYJFM/+/enYYE4Mjhs5rzT
         TtK4E4gjXEPMfTvgu86n2YS54okV2HQct0Q1EbGxnWImGJdWw4GY5qZ0HQ3LyImbDFlt
         U8tY7k3erQ2/TL13zRub8vo1kEH4XY6IDvM5jN8jQRhUol+9Nzwzi7rUBc1dIc/n3ZB/
         fUgA==
X-Gm-Message-State: AOJu0YzwsGP/UyqfZO1fllB0qMPntiiOPdMAC7mCYfdgcVuq9E5gdDjp
	5yFPmy/9GcG9GdqCgP9Y5+Lk5t1Yx1EuwDVAEQBWe7V4itkHjmCO2NSgtDRIPok=
X-Google-Smtp-Source: AGHT+IG8UaV0m07KAHdYpd2CksFVwm3hIUl/RZ8jsVafhZ1o4Q3OfoXRd9b+pDvCLGdIwRm2jcmEOw==
X-Received: by 2002:a05:600c:19c7:b0:431:5ce5:4864 with SMTP id 5b1f17b1804b1-43184254536mr39428095e9.35.1729769576134;
        Thu, 24 Oct 2024 04:32:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:17a2:e679:56a4:a25a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f484sm14592705e9.13.2024.10.24.04.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:32:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 13:32:45 +0200
Subject: [PATCH 2/5] gpio: sysfs: use cleanup guards for the sysfs_lock
 mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-gpio-notify-sysfs-v1-2-981f2773e785@linaro.org>
References: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
In-Reply-To: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3494;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BcN9dryIsrJqG1KRF+BFPyvkm3ZgVKVdWwWtFpm+Vcs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnGjBkeLsVV/6Dj+k2jmzftuCgusZt+SfK9bVxN
 rPAPbhswlSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxowZAAKCRARpy6gFHHX
 cn3/D/90mHQdPWa+5+GniU7DYpq0BE1RF1HohTeJ5HMOO8rVivqfY9faq8LgJMZrcJTfnvTOb0D
 dQsLCF1W5PvLG5f/bhq3D5W3ITGQPoOA4MD8fjwmtnboASemjXYOTmBuZhGgkCCB7t35rkgslR0
 18kH2EgXfs4jHYROYLors4dsmsNFv0iqisRWJDbBemuc1rgI+beBh6uEvOXj/fBA8QQ3eadzh+i
 0qfnjXPmflUeFFp2b2PbdUn0i/aYm6UrH7IsxAoJ3uNwgMmGBVOM2L3lx90lwemrz9I092+00kd
 etBaJ9BhqwSWpNKE3yvvLTNklhVPznKNT/EvcbVTXAqMkwLtVEuYl5HLYApOAlCoFju+OuIjfMr
 VgZUWv7CJwNt1tuZiBxQfs9q95wrmBMCH08uEmZTKQCTIoWk7lCbN72k33PbUuwB8fPutuHEyIJ
 qWhXvofkeQVo9UVNlB2YUJLBDj4ohE6Tv0LqwraWCIKBLsQGvbp61iv1jck8AohRt+5GAFMR0zx
 08Zsbe3xcoN34xT1ISrRuY7Vqec07BMRIJ+szQfygTEYWzJe2lFZ1CshffduJTc/uPx6BcamF9c
 o9OJSlk6fSj9REJj4cGjnuETNHHIL8DYgmGO3fFa++6kW8gIjfpQs869afuNf8JyviJ1YsJ9Ai0
 ryZcSEG1Wg9r1ag==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Shrink the code and remove some goto labels by using guards around the
sysfs_lock mutex. While at it: use __free(kfree) when allocating sysfs
callback data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 64 ++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 3ccb41a93ea7..096f79bbfe42 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -550,7 +550,6 @@ static const struct class gpio_class = {
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
 	struct gpio_device *gdev;
-	struct gpiod_data *data;
 	struct device *dev;
 	int status;
 
@@ -574,24 +573,25 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	gdev = desc->gdev;
 
-	mutex_lock(&sysfs_lock);
+	guard(mutex)(&sysfs_lock);
 
 	/* check if chip is being removed */
 	if (!gdev->mockdev) {
 		status = -ENODEV;
-		goto err_unlock;
+		goto err_clear_bit;
 	}
 
 	if (!test_bit(FLAG_REQUESTED, &desc->flags)) {
 		gpiod_dbg(desc, "%s: unavailable (not requested)\n", __func__);
 		status = -EPERM;
-		goto err_unlock;
+		goto err_clear_bit;
 	}
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	struct gpiod_data *data __free(kfree) = kzalloc(sizeof(*data),
+							GFP_KERNEL);
 	if (!data) {
 		status = -ENOMEM;
-		goto err_unlock;
+		goto err_clear_bit;
 	}
 
 	data->desc = desc;
@@ -606,16 +606,13 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 					"gpio%u", desc_to_gpio(desc));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);
-		goto err_free_data;
+		goto err_clear_bit;
 	}
 
-	mutex_unlock(&sysfs_lock);
+	data = NULL;
 	return 0;
 
-err_free_data:
-	kfree(data);
-err_unlock:
-	mutex_unlock(&sysfs_lock);
+err_clear_bit:
 	clear_bit(FLAG_EXPORT, &desc->flags);
 	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 	return status;
@@ -679,36 +676,28 @@ void gpiod_unexport(struct gpio_desc *desc)
 		return;
 	}
 
-	mutex_lock(&sysfs_lock);
+	scoped_guard(mutex, &sysfs_lock) {
+		if (!test_bit(FLAG_EXPORT, &desc->flags))
+			return;
 
-	if (!test_bit(FLAG_EXPORT, &desc->flags))
-		goto err_unlock;
+		dev = class_find_device(&gpio_class, NULL, desc, match_export);
+		if (!dev)
+			return;
 
-	dev = class_find_device(&gpio_class, NULL, desc, match_export);
-	if (!dev)
-		goto err_unlock;
+		data = dev_get_drvdata(dev);
+		clear_bit(FLAG_EXPORT, &desc->flags);
+		device_unregister(dev);
 
-	data = dev_get_drvdata(dev);
-
-	clear_bit(FLAG_EXPORT, &desc->flags);
-
-	device_unregister(dev);
-
-	/*
-	 * Release irq after deregistration to prevent race with edge_store.
-	 */
-	if (data->irq_flags)
-		gpio_sysfs_free_irq(dev);
-
-	mutex_unlock(&sysfs_lock);
+		/*
+		 * Release irq after deregistration to prevent race with
+		 * edge_store.
+		 */
+		if (data->irq_flags)
+			gpio_sysfs_free_irq(dev);
+	}
 
 	put_device(dev);
 	kfree(data);
-
-	return;
-
-err_unlock:
-	mutex_unlock(&sysfs_lock);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
@@ -749,9 +738,8 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-	mutex_lock(&sysfs_lock);
+	guard(mutex)(&sysfs_lock);
 	gdev->mockdev = dev;
-	mutex_unlock(&sysfs_lock);
 
 	return 0;
 }

-- 
2.45.2


