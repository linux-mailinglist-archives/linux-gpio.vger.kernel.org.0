Return-Path: <linux-gpio+bounces-3259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D9854430
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50C041F2815E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1BC12E44;
	Wed, 14 Feb 2024 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F3LNjgJj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB9BE5A
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707900270; cv=none; b=H2X/zJ5nrba4GkAaWcs1YtEZNSnSvtbHq2cb4x32gE3tOcbWGh1shD9P7CNRB9oAFLhWLBmGwm68wx6pENIFsi6c61UHY8Gqz7i1F6qCRSXomZulN213sL+pvhnmxSp6qFxFMSZlD1YdhTA9F82sEP6j4Qb8Lx92ZwHxOYlWXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707900270; c=relaxed/simple;
	bh=nI1sU4z1CFEN5Iy/28K2xqVSyRcEQoCVuY9LCoaM61Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eMoHbQHS+epX9mJCw54ZiTv9KIkOeaSkYmDno6TJVwZRd1X8ww8ARnCy3NkF6eK4k3hnx5AiqgzKGdMRhXJfdNIImTWfGdG/zxhCDXSZqt+u4xYI6oCpAbxY5ux4Ix2mLalcP4YyOxjwdAiRtfP5qveq8wBavu7NwqLilkV5uMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F3LNjgJj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-337d05b8942so4225578f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 00:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707900267; x=1708505067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFhIIzAiY74bCQSacBGTi9CNjb/LwvQSA/13OOoGG+s=;
        b=F3LNjgJjE3Gtl+wbyos0mkRY16B7WgdRSnxDCeT+Z2K6WEPJfdrpr8P5N5jiIJr2lS
         m+wt7uYap0fKsF6QGUEucE+TZodp36dKW1BFdMsawXAyHgshLW7wMoj78kOqSSn1i+rZ
         YoyjNtSmoi2yQ3sZ2zhFP3iTi/GraVBqZ8hPnwx8cJ4KfptLfizWXfEA9uDJXR9j6O7h
         e71MxmFouwTiXXQjfmjXA78M6VTZ1fZ4q/E+vzA9g09SgZIRP5+ftgNRQfjhwpXIjpTZ
         JgC98+PdXpF/OC6CsDDAb4nRP2dAxCCzTjkKDfgw9gq0gqDdfHAE4Gsr5C9XpYGtfo03
         MRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707900267; x=1708505067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFhIIzAiY74bCQSacBGTi9CNjb/LwvQSA/13OOoGG+s=;
        b=rSpo6grKSZxKYzbufRc2IUpaSqnrB3lCj1PtpdH28pO4wTvXQZ2MstZvCgPmzLYTM8
         sIA24bIy2lOw/b+MC21Z7I1Vz+mhrk6ZncJrekVDMl0th2KTYIvVzsf06IE4DasUed57
         EAQIeUN8AtlmWhil6gRsQYCJgg4h25p83yz0TJ+yywQtD2OA+zqMknFUBhFUilRAjoPy
         Lbm3pZg64Fd7f30mqYeVYNPFuLqwbkVF+8aRMPQHAppIxadQzOQwatrixSl8FU8eQR5F
         0VdkJn50TIsMc6oBH+0V3oSSrREm9lBRKvACAQUBZZuxARRlYlzmXgYIZVoLpSe8W7Zy
         p6sg==
X-Gm-Message-State: AOJu0Ywe+RZB7RS6ebZI5FFDNO0Xc6PifQKVPPhv24PaNkj+rZmqtYCX
	cyfSkcbDD1gpHO6CWulZlANa/DaS6L/eNrBeb5VnmEvl55oHADu7kQ6yEZHX2Dk=
X-Google-Smtp-Source: AGHT+IF/YAUk1OG52T8jc3CcxwlwaMSDlCc32WrAAgr48Qwu9fO5aNWtZ0rbDX9MsEQNdE+jJNtkfQ==
X-Received: by 2002:a05:6000:128a:b0:33b:1b72:e7ed with SMTP id f10-20020a056000128a00b0033b1b72e7edmr1115836wrx.53.1707900266947;
        Wed, 14 Feb 2024 00:44:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoPbcCe6PNsTWj8h/GSUEFbxQElEGZMLqXu2DHrW5EMLtMHnzCKCV6kFHaYNCE185mAbTN5QQ0qKZi2liMUyV/cDZD3U8o0HlsRCdwP6HVkjUWLmmH4nISVt6x/PLaW2REw/cuSX4WQaapjkuE8G2sA425R5PHzJtOfevPgfAT6cU3o8QncN9u5kH9FvNOaGNsK7cS3pWVEMOscJRMYo/MWxTk75Fe1tyPuRbE5vI6QCTGfunG4M92REVX184vLt35v1G2UOLp2H4ow59f+DRFRtT86vt3hkGV2f1tWGZoR3be/ajbm1ze/8s7QKNayPOl62Jb+Uc/o/GHa1/rVx41WVCmmkdvKn9n8iCBa+2RN3RBT46gEkT/4QQn0Rtp3xCxkaCWZghMD88G4pytqj9vsoaz6CFDloHHuDyn
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:cfee:a5b6:1f9b:9c9b])
        by smtp.gmail.com with ESMTPSA id fa1-20020a056000258100b0033b79d385f6sm9494731wrb.47.2024.02.14.00.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 00:44:26 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Mark Brown <broonie@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH v2 4/4] gpio: don't let lockdep complain about inherently dangerous RCU usage
Date: Wed, 14 Feb 2024 09:44:19 +0100
Message-Id: <20240214084419.6194-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240214084419.6194-1-brgl@bgdev.pl>
References: <20240214084419.6194-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are two legacy, deprecated functions - gpiod_to_chip() and
gpio_device_get_chip() - that still have users in tree. They return the
address of the SRCU-protected chip outside of the read-only critical
sections. They are inherently dangerous and the users should convert to
safer alternatives. Let's explicitly silence lockdep warnings by using
rcu_dereference_check(ptr, 1). While at it: reuse
gpio_device_get_chip() in gpiod_to_chip().

Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202402122234.d85cca9b-lkp@intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b095f475805f..02be0ba1a402 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -221,7 +221,8 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
 	if (!desc)
 		return NULL;
-	return rcu_dereference(desc->gdev->chip);
+
+	return gpio_device_get_chip(desc->gdev);
 }
 EXPORT_SYMBOL_GPL(gpiod_to_chip);
 
@@ -291,7 +292,7 @@ EXPORT_SYMBOL(gpio_device_get_label);
  */
 struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
 {
-	return rcu_dereference(gdev->chip);
+	return rcu_dereference_check(gdev->chip, 1);
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_chip);
 
-- 
2.40.1


