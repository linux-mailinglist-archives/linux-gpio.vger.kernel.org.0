Return-Path: <linux-gpio+bounces-12092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E39B0205
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AA3C1C21CA8
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 12:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C14203700;
	Fri, 25 Oct 2024 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C/HW1igv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE7E2003C1
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729858755; cv=none; b=LFtl9aETCw5KoV0z8Pd5Zz9cQjyUgTzYIFpyi4TuASI4TIRWqKToeCaAQ3aP7nA8d0tKGVrDfRLfRU0ZwUEQnL2ZfCK+O8zQ8erMhhFfh+YtX3g3TPtJMlfatt3nTcRL2z/GukfiE+8I5UbFw71UBSmm/SdImzqrkAZROeqt6kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729858755; c=relaxed/simple;
	bh=s/zWZNOpltjTQgPDkLMb/ESCpSOUcUF6G2vK/Vy6kws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q3X6ioyC3G0omePZ1OPhekEzB8Y3kfAEeI440xYDch8K6XlZs2qzZGt5urEJ+E1ePsr51m6FmKG3uoPSJtjzJiQPcWuWen1r+pyB3wJ1B37Dy824rqq1Snk9daMyWPUeHx4Cixg3LQFm4tCJic9EKXwDlK5ecFvZAXnGclzUMj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C/HW1igv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d50fad249so1411711f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 05:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729858751; x=1730463551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8u7wHoI6I5vyLiHlrP5BqxUBaWFX/5Pqb2gWKB4PZ4=;
        b=C/HW1igvKF+3Id2I2n9O1lgFgrA10Ki8K4gEX2g/fX3RxKd1qE3/bPw8KUN1GG3IUA
         ehOsDMh810iF6VS9N6GOO6oxQYXkczJX9KG2Cp2Rwdc4lxgNmNiaKmkZ/r+agob8+Xyt
         oiHp+vb/wrNTUi9vWs6ZbQ4Lw7dbi69uRiBBxCB2a6UWt8stqV9ydaCxTOBRA2cFru/T
         EV5OV20IhXt6aDzzpLlmQ/j6Z//YyvvzB7iItES92AlPkplrdc+BcerXa3b8BBwbTtCp
         aXcahl+Cxyfnb5b7r8dGUGibw1r9KIehfixUPhSfwYxa0VbToOofJXqXu/MIMFpPLvhU
         D8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729858751; x=1730463551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8u7wHoI6I5vyLiHlrP5BqxUBaWFX/5Pqb2gWKB4PZ4=;
        b=K9G9rinyiT/aOjONTOcA72nznO960mUqH+G3j18/Arj/hCd2J0rzr1mcBgl5DsjMtV
         fuJjobPVNOgWvT2dRPSGjOSDOmXruAPRl350CquhnpxIac0HbIxlkQNkQo55y6VM8PXh
         4iqmxoVs59roBImHpyT/4oqDrJ74EzwAPHn64Erj3o+ZFLUIxgH6Um8sy29ntkkR7qVW
         6xHiOLcMct8arKOeSDWaa/vUVgYL8+SynN8K7e05R/R921zjajwMNy8OCIyn5sED3M/l
         puye5crhIhTd/ZM1bKEGrugoEKNDPItfq+3L4aM69SrDIb8lm9ZIYZgdYgbtrhCCOzks
         j1mQ==
X-Gm-Message-State: AOJu0YzZx+721vXFChkyFlRJhxeDM8VDjHhBTYFvugy3tzeR0e7GSHo0
	RyGIKjEIpJ8SzJc3q7TMISYSBJU9XdU9Qkt+8aGLi4c1hEeTfH3vasIUELM41gw=
X-Google-Smtp-Source: AGHT+IHtdpdNKWD6DXd42kywbDL9gEe1sbhSuab5aaP+zfaquTM7RmR4AE08YNbvppwg0kPJtTn5sA==
X-Received: by 2002:adf:e386:0:b0:37d:4ab2:9cdc with SMTP id ffacd0b85a97d-3803ac957f8mr4009622f8f.13.1729858751303;
        Fri, 25 Oct 2024 05:19:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a207:5d17:c81:613b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132ecsm1388966f8f.5.2024.10.25.05.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 05:19:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 14:18:52 +0200
Subject: [PATCH v2 2/5] gpio: sysfs: use cleanup guards for the sysfs_lock
 mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-gpio-notify-sysfs-v2-2-5bd1b1b0b3e6@linaro.org>
References: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
In-Reply-To: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3494;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/q6I1rvAY1USpb6CHxAAJf2nHfni+nk27PyjShh4MqY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnG4y8eMUg1ki4/vpCFXu6e7YZnNuUHA7wB1+v9
 HMecdclMxaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxuMvAAKCRARpy6gFHHX
 csXSEACfAsKM2SJOo00AHbpWKtA0/76AZCBm2ozLA4J/fkG3ES46KbeLvjGD8PeBcZoj2nj+2yA
 92J11scBxnmgxPXP7iz24jBdvzxRG+bR3LqGDIbSF3qOZa/CKJ2ZFWQ8/cTJW77A7DAcrbNfBsC
 K4xqK4C26HyoxtJN4YGRxbjx0H9Vw15LWFtN38ikBpqJ89CqJmkvLfQ0rhcZN0sVhz8ViiK45bZ
 1NkAQyEVAzbcqSGr2uim/oIijLxqelDTKk0dFj2X2m/tanBxSawSk/wOUBcCae/ThuEdykfwEWg
 dByDY8JS5eA/uti9gYH6ZfJfUVGIsB/nEdCvfdjdFDjxJqsDvpuHmWtZRhv7t+p74C/Muu6i9gR
 nFbkH7Zpk0HyDdW7MsF+k3cCHBgspJ2hScR0gXFZ7zLKz0LOaXe0YgDBYfgRGBjeqQMxWl4hnAC
 eHnYm6QzxAdniuPIA3qhrSlFEP5g1nfDk9zfiy+IzKArGI5UwqyFBqkbHAtLqDbZMti3s0Z9Gxo
 1JqMQ5Z8LdjqlVpv8gmFEBAE6VoV7M2H4qfEde0V3nNjNuYnKU+hWYvUTJdF8+u0lN3yF7dZBgX
 q3NgaafjoihnPmmR9frsn41YT9KYqroT95N+VcebikxUOy5uT9ldaB2xXzOZqlqGXTQULVYK5Y7
 UjOE7FvKj6jplZQ==
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
index e11b322d8e72..a7a97458909f 100644
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


