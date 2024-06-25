Return-Path: <linux-gpio+bounces-7672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD95916028
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 09:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497991C20B23
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 07:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509D4146A89;
	Tue, 25 Jun 2024 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JXKoLgBn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7A1DFFD
	for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 07:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719301101; cv=none; b=qdhoBZbUlobB8AUKAxCJE4WvIGCUOVltwwTlTuSyBqUyRJ8XMRL5okXSB6gzwftoB9NxB+nFRbEzkW7hsGn8wi6mXJ/yjwyi/kNhhEqy62Hi3HRuER75mKBmnYtXjk9IbfAVzUDThuo7XHo1IFnmhoGQlBm1zKlu+iVdxNFDcm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719301101; c=relaxed/simple;
	bh=xnd34nsHVB3Bb1w9b0swEF5Kneh0p23nUetcrUBUo+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PtJsi6FuYF7oUnZQVMy007tX83noSRZEcF0NwMeepLP+tDidXXOpvXJa4HYRKMdfVlcCYX4AcBSuTS1PpaDK0K6/kjaXKl2C0oXWVo9DuTmMQ42qWaly2h9poNXGpgiUSuHDzJhATdOImSzIKa6t5srw9Jr6lJfU5xGYjrR5qu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JXKoLgBn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-421b9068274so45687925e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 00:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719301098; x=1719905898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg+ROxAEkhG3YixyHjk8IESjY4JYPzhuw/Z95rZo6PY=;
        b=JXKoLgBnvKm0SWXb9T0dFGyGzC1GJeUSpGdFGmrwTqj1ZzGc3+rlxgZ1VRdKGHg9zQ
         HWxg1bvLSFTFhIPOoBgUXN/bGhQ6uIpkAyajqWz9orWcH3lHh0LjZLjraDfcl8fXkH3v
         ePCDU1nTwqm+TjFGenaG5BRfiZR5IADV8Nz174Kezz6TH4hQqWIJAmCFnaZcXLwCfEbq
         T/uXhNa4YxYIw4HlyUcazZHr/FqaTrMUstU0pYB4/DR/DyuUg5RqGrwMflBoSD+Zz2Ny
         tdEqTpwJq4OQan9V8epjXmQ+oXKxhbN0wkRbgpLvPZiho/SaSUS3RYRdq3fw8jdRPPAi
         7HaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719301098; x=1719905898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kg+ROxAEkhG3YixyHjk8IESjY4JYPzhuw/Z95rZo6PY=;
        b=eP9yU38q3zmb0ieYoHybm6eguu0etKxGZcoTmMXw6m5w51PbZlS7EJkBk/qZvolB0L
         LfqGNaQOnDKDufof9vCq1SPyao0M1aodh29brOfG5RXEmATCBgnn5yh51lG1QkOsxO/W
         mDSZtv4a+WGchC2bT8NnHex50E/Fu+BHXve9hyEZjqQt6H5PLPV//vftOXyIyHM8Wgjs
         A+ghQT3SHr3ANTx2y6ILNCIK8V0q9xmcIQn4LxaUA8R4qkJ6HJjjq+LQYNvQS2yPErmZ
         2VA8CgyVWScxYUovkVBM5oGswTGEBsdopsqN6ZPxIFqM6iMMXo8bPCRYwgVYl4NuMZR3
         xXVw==
X-Gm-Message-State: AOJu0YwY35RXK4Lz1AZv/p9XNZlffIcdGGvk3ecMMsTsAR3ITVKQTaxe
	DnM63Mo0g/nlu+oAwYJL9O4g45DeYjHyicYM/VGElIpAgcIxnD0QYAGfPtNZlxmqvFDZ0ChWbLi
	u
X-Google-Smtp-Source: AGHT+IGq5IuN9x17sYOYh81hjhx9M1UaQ7AfJsvFZGT4XI/Jx+CqnuM9j2WVotD0ag3CEpwFPVUmsg==
X-Received: by 2002:a05:600c:4f4d:b0:424:8ff5:67cb with SMTP id 5b1f17b1804b1-4248ff5681cmr33842205e9.39.1719301097768;
        Tue, 25 Jun 2024 00:38:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2b2c:4971:1887:588b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248e63a897sm83139275e9.44.2024.06.25.00.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:38:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: unexport gpiochip_get_desc()
Date: Tue, 25 Jun 2024 09:38:15 +0200
Message-ID: <20240625073815.12376-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function has been deprecated for some time and is now only used
within the GPIOLIB core. Remove it from the public header and unexport
it as all current users are linked against the compilation unit where
it is defined.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 1 -
 drivers/gpio/gpiolib.h      | 1 +
 include/linux/gpio/driver.h | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ed620442f32c..edaeee53db75 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -179,7 +179,6 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc,
 {
 	return gpio_device_get_desc(gc->gpiodev, hwnum);
 }
-EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 
 /**
  * gpio_device_get_desc() - get the GPIO descriptor corresponding to the given
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a75635891c6f..4de0bf1a62d3 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -243,6 +243,7 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
 int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev);
+struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
 const char *gpiod_get_label(struct gpio_desc *desc);
 
 /*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 6d31388dde0a..2dd7cb9cc270 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -787,7 +787,6 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 					    enum gpiod_flags dflags);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
-struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
 struct gpio_desc *
 gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum);
 
-- 
2.43.0


