Return-Path: <linux-gpio+bounces-11507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C19A1CD3
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27BCA282A9D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92A21D358B;
	Thu, 17 Oct 2024 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WSkheO3q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864681D2F73
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152872; cv=none; b=eOORp1XCKYGsvAK//Mdl3eVGnGYad8XGVkmiNRwlTFeh1UyuQ3HbOt4N3ViliXoUWsVcH3GFKi3i70i2VlZ+3bBgq5cvv5jQ/RnY8UN622CZPwhBiE8wBD0DXIoP8vNwGgsftIK3k1Cgl+CwgBWzzt3Fyzwuvu8PHkkIOn08kLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152872; c=relaxed/simple;
	bh=z0csyQTjaj+C9yhlJD2YwA9SB2zPsh7lfK9AhF+081E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HDw7olezhEffDtLlovTPwoTKHeNAzwnCtAMzvwCIATRsZi+PNXyA2nfZqrNbZkbZ/AoVrZCcMueGd/DaB2U5G6POQU30atdhaooyVvSJ6XFXoQ7+AAY7dBjfgSsCIFZCNQZ+83BmZtilzdso6awATiEYwvfK4oqzQEgYFGYFBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WSkheO3q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431286f50e1so9458455e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729152868; x=1729757668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHDTJ05rGXvacOTESnBohjwJkgn6HYTuHVXiH2uivgs=;
        b=WSkheO3qyWCWj1gJb3YN/+wsjButcnQ0PDnEY3DeWFU+hD5T6VxUVbkBQzsXTiifAK
         w9JsGQ+PsZHlRMqAGLOYfx1i/2XPhxoCuQe4nEI1qWRQ0FxMFRVQCBSkT3M8qmXoBp//
         2CUSYBxr2yo6WWKW9R++FxXDCi5a1V0JUUYOV27hQV76PuH7XeCGhaJXb1MnKSfB1daS
         ROpYuZwzy+0QDXJbB9Or+3R6VLwPhn5ijHrMj79O6AC23xUOABROITrPilYdB8RFJ5NB
         IqKV16WElE0mLuOB7vOe3bB4pewZ8mn8Ffk/tIpM/fudYDkKMJQZm4oJhFvgIZddw2yQ
         7Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152868; x=1729757668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHDTJ05rGXvacOTESnBohjwJkgn6HYTuHVXiH2uivgs=;
        b=f2WOksrGnW1PqVqQi6TWalfwDAb7+SqlxDMbWwR5otRkGYusvpXJ1W0vRgdraL5DfZ
         tXeQ6CzwLmOULKBJEjGcGQyUBKU5bPObDa9yBo1bkvrNaYamqq72GNygKOAJMIbyVpo9
         MOZEllz3HIkWw6MCNVi0BmSk2Q3N3APwE437krVg472bFx52ilEOI+xlJ9AQVGtfB0wP
         t0Hd/QPgBVkHHzBaeVFlwccj5RhNk8yj238G5W4Zq7xsqZr9d3xoVCo43zAQbac4MOyT
         nVTJgF+THHLPo83N+ymCnot90T/QC8SRoMxNEvkDWSoZyiiiQ3VNRMUYCmtcTGgXpOGG
         gXBg==
X-Gm-Message-State: AOJu0YzAZiTMiETPXHlVgebFXDI99HfS5QatjlrxganMQzjyn/niWQrJ
	V7LPsQNkb6hoZ70IbTIJNVtNRT9MjJsZeyDRBHRO+huFfwKsgpkxeiz3UTQZUJ4=
X-Google-Smtp-Source: AGHT+IH3/1WlsDT6/Zc59vQeFvCFJ9N1TfZKMWDWbZ4p5wQUNtEVdd5EZt+NPo7ptrlLM6oENQXwTg==
X-Received: by 2002:a05:600c:1c9c:b0:42c:a8cb:6a5a with SMTP id 5b1f17b1804b1-431255df67amr189626375e9.15.1729152867674;
        Thu, 17 Oct 2024 01:14:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61ae2sm17855695e9.46.2024.10.17.01.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:14:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 10:14:12 +0200
Subject: [PATCH v4 4/8] gpio: cdev: prepare gpio_desc_to_lineinfo() for
 being called from atomic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-gpio-notify-in-kernel-events-v4-4-64bc05f3be0c@linaro.org>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
In-Reply-To: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+3Qa4JomiJeerbr48n315kA/cYd1bccbsc5mhXSvDl0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEMddCQpAjEI8dh0CULt+YwvGOirfxhaucWIq9
 KvpIPXrYSOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxDHXQAKCRARpy6gFHHX
 conID/48a3ILF52224ZoPRxXd4KVoBkI97PaXpLW+KZLSy70G88RZ4xw63FSkarcHkSBjGlp7tf
 trUOcNupRtdOnhrh1AE0wbRxZBpWaqROoUeQszN/rV1lfJQvaKBNkS2lMHfnZwnc662y4bW5sW/
 LA2s0SeySjZDfr/tv8egzUWylc6O/mxUb8K6y8eylFHCI5Vykb9yzhSd2j1dgcfjZ6ijw/336Ip
 Rd6IXhY6BV5+3FzG8ntnsTjUC0FiP5yonHH7n6SG+I2IsT7zbvMpuRTFB0vo7EyxXu/4cc+ky4b
 ZKDoEDyhxkADl99DIOGyp8BQ6UGqohoxs7/kRSvy7Ac12gDNWXPibdPILwgrSYo/n/63btBouvy
 qtWEmlCOk/fzbhqwD0dW5VmpgiU2CcfM3eCs3/CAJOM5izX9uS+jPwde9Kd+Ug0d+Ryvm3YuOHF
 K1dMTfqh/K1XfO1EbOoPo5FkVjuw2X8WazwBRAKVQk24TLoE9OWKyMM98C1smfClxE4QYPeHJ4Y
 VcnHQu95ft08yPwSgb1I4Cm2koldNk/a8+Sqa9Q3qkgl/wqi59D7mTaKXI0pxejsAcXvc1WAjA3
 DCLSSmjp2zSlAGNGCku1PnXUn8MrKPi2Q54Qe5umHNqDBcTIKazgfYW7PieYIqj084H88a6BGzN
 kJbyGX8zgMwyOIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to prepare gpio_desc_to_lineinfo() to being called from atomic
context, add a new argument - bool atomic - which, if set, indicates
that no sleeping functions must be called (currently: only
pinctrl_gpio_can_use_line()).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d55d2a246d41..0cba74381687 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2235,7 +2235,7 @@ static void gpio_v2_line_info_changed_to_v1(
 #endif /* CONFIG_GPIO_CDEV_V1 */
 
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
-				  struct gpio_v2_line_info *info)
+				  struct gpio_v2_line_info *info, bool atomic)
 {
 	u32 debounce_period_us;
 	unsigned long dflags;
@@ -2277,9 +2277,12 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	    test_bit(FLAG_USED_AS_IRQ, &dflags) ||
 	    test_bit(FLAG_EXPORT, &dflags) ||
 	    test_bit(FLAG_SYSFS, &dflags) ||
-	    !gpiochip_line_is_valid(guard.gc, info->offset) ||
-	    !pinctrl_gpio_can_use_line(guard.gc, info->offset))
+	    !gpiochip_line_is_valid(guard.gc, info->offset)) {
 		info->flags |= GPIO_V2_LINE_FLAG_USED;
+	} else if (!atomic) {
+		if (!pinctrl_gpio_can_use_line(guard.gc, info->offset))
+			info->flags |= GPIO_V2_LINE_FLAG_USED;
+	}
 
 	if (test_bit(FLAG_IS_OUT, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
@@ -2385,7 +2388,7 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
 			return -EBUSY;
 	}
 
-	gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+	gpio_desc_to_lineinfo(desc, &lineinfo_v2, false);
 	gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
@@ -2422,7 +2425,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 		if (test_and_set_bit(lineinfo.offset, cdev->watched_lines))
 			return -EBUSY;
 	}
-	gpio_desc_to_lineinfo(desc, &lineinfo);
+	gpio_desc_to_lineinfo(desc, &lineinfo, false);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
 		if (watch)
@@ -2514,7 +2517,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	memset(&chg, 0, sizeof(chg));
 	chg.event_type = action;
 	chg.timestamp_ns = ktime_get_ns();
-	gpio_desc_to_lineinfo(desc, &chg.info);
+	gpio_desc_to_lineinfo(desc, &chg.info, false);
 
 	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
 	if (ret)

-- 
2.43.0


