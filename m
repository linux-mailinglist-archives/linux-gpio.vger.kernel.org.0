Return-Path: <linux-gpio+bounces-3087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB284DDA2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAB9128AB27
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBFF78B5E;
	Thu,  8 Feb 2024 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tXSp842q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC1A7691B
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386391; cv=none; b=oaC8Cl0PiQIBK/WGQOn+Fh+ejQsmil6joj+u6QNRKXuyzHdieH+DbPUYfPs4mtxN0Bsoe7m72dBYdb6CWR4xyE7PLDFJpHfbiXdhbSu1cmY/e31ZBAcEp4wmzNWaF2USqQEfdokoBnFZthFXm4vhrAA+Q1tbc2JfZJfJfz5OLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386391; c=relaxed/simple;
	bh=ix1NDNjlZCgQ+AyPAHUAD23avjxqKqI95b0uzY3jkfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RvkBIlVwtpifQs+9+RwQPwcr3U5adRJ5mQzEAUbyEgtVREWDzF39d4ccvTJWjXHIEGHR/kIvImEd1fCaIcoLWIeuS6dpUwHidXqOMiYhTsGOYhbXQJQsQHTAlIByPOQnCtxQIb4FRp/389juZYhH10+3kATpaMVBQ7ghaw2J1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tXSp842q; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51171c9f4c0so149513e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386387; x=1707991187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miEDCzzmUK7ZFiY500smqwcP1l0x+JqtxelPsuadET4=;
        b=tXSp842qD9Pz+jkpwOWfJkue+qMBR/rEaClQUoLEuU5gJ71adSj9UUJq3TMANRIOxY
         fKNqag9BENGfbPM/dyjOsePEzKNlcDuyUw22Gx5kqpOtUrV9wNgxudi5Yb6xRM4/W+yJ
         +R9xKxeXTCNZeFKE+JqFSkz6xWxxo1YRYUsoOc4jgHJN9Tzh1ElVUo56TT1F00815tsi
         DEMS7+8PSLrphN2JOvjTQN8/5YxuKctFKODip42Aihu+a+Ro/FnylPtajk2LyU7AqOFI
         mStAK2FpT041kNQPGVK7Hdf38EztMcE88qgGPywnkZt3li9xjOWi0o13y1ucv5G9ocx9
         BXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386387; x=1707991187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miEDCzzmUK7ZFiY500smqwcP1l0x+JqtxelPsuadET4=;
        b=JAS0vVw4wxwQjGkw38YIYBqJATtVUeN4F4wMRvpOnYByzN464Wjks/SjfPz4AdMmFb
         xsECeEL97EC/6JT9s0NS5w9/X55syCnQYkulCeaTyNWoBMSaR1bnxUFji6AC22z/oG0u
         iWuFFNYVEqxpatdTaPQF3bk45dJW9PfqoMAYqs/2bq5z0hrzWC+czoplKMOS4pW+0dpl
         XRNEI5DpzrBwuD9AfbNS/RfFWReSYvzxAUBsdJwt1X8WdPEUFTKRYuSgOw3km2BD8/hi
         KWgOT+1tR3ca5/9x2+wSX/kaj3J350IBF2rGfc0VNpxg9tfcOYnYNsh9gQ+hdigcgmGp
         2SFg==
X-Gm-Message-State: AOJu0YyCP6ZIDf572f0fGVjoXGDXe3NXqiISrgrg2ICq/buGMjQWk9oT
	si/Sw0h06TqPd6I3OKgF3EdRHeX3h12VAIHjyd8TTg2NHJJdwdK/pxLU0BTrL5k=
X-Google-Smtp-Source: AGHT+IEdpn6LGQp8OBAFzoOjlSEX9Ftw8yJ2XbLP1JUnK7lkUl5Y5jb8ffeZO4cAFqabnXqCUjG7fg==
X-Received: by 2002:a05:6512:684:b0:511:62f5:9068 with SMTP id t4-20020a056512068400b0051162f59068mr4182575lfe.11.1707386387052;
        Thu, 08 Feb 2024 01:59:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlasTr89EWG4MCypFP9JeKiFH4l+rVCnhBP8Uo4QVe68AxuApbgrgW9oW3GoWVf+5jPSkyRN7ulizA1N4OppzGlNkotGDWwR/XZd+JjJn8gGtZjf2A1Zh4DLokunxBbft2LRdhcMHryl67aBjshmGtpSxhBKfCSAJ+j0811gHTMqqwakknQWjNl8e1nz6N2KBOo/v1uorgrarthg2vKVxIfektlpDMxESFKooB9I6HLCqV/XN0Z9ZxyQxBjfHQd18sOGnDOv0Ng8JdsoujCNfY5ujCfH95F6EFiU397n05myztc5c7Pl0akzZLoL9oFBBjWntMQHYQcZz9LJ8ykg6RmI3gDr9LjA==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 21/24] gpio: add SRCU infrastructure to struct gpio_device
Date: Thu,  8 Feb 2024 10:59:17 +0100
Message-Id: <20240208095920.8035-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208095920.8035-1-brgl@bgdev.pl>
References: <20240208095920.8035-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the SRCU struct to GPIO device. It will be used to serialize access
to the GPIO chip pointer. Initialize and clean it up where applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 13 ++++++++++---
 drivers/gpio/gpiolib.h |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6b696087c7f5..9b1907f3e400 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -680,6 +680,7 @@ static void gpiodev_release(struct device *dev)
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
+	cleanup_srcu_struct(&gdev->srcu);
 	kfree(gdev);
 }
 
@@ -948,6 +949,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
 	init_rwsem(&gdev->sem);
 
+	ret = init_srcu_struct(&gdev->srcu);
+	if (ret)
+		goto err_remove_from_list;
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -955,15 +960,15 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (gc->names) {
 		ret = gpiochip_set_desc_names(gc);
 		if (ret)
-			goto err_remove_from_list;
+			goto err_cleanup_gdev_srcu;
 	}
 	ret = gpiochip_set_names(gc);
 	if (ret)
-		goto err_remove_from_list;
+		goto err_cleanup_gdev_srcu;
 
 	ret = gpiochip_init_valid_mask(gc);
 	if (ret)
-		goto err_remove_from_list;
+		goto err_cleanup_gdev_srcu;
 
 	ret = of_gpiochip_add(gc);
 	if (ret)
@@ -1043,6 +1048,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		gpio_device_put(gdev);
 		goto err_print_message;
 	}
+err_cleanup_gdev_srcu:
+	cleanup_srcu_struct(&gdev->srcu);
 err_remove_from_list:
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 43ff4931e2c3..35d71e30c546 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -49,6 +49,7 @@
  * @sem: protects the structure from a NULL-pointer dereference of @chip by
  *       user-space operations when the device gets unregistered during
  *       a hot-unplug event
+ * @srcu: protects the pointer to the underlying GPIO chip
  * @pin_ranges: range of pins served by the GPIO driver
  *
  * This state container holds most of the runtime variable data
@@ -73,6 +74,7 @@ struct gpio_device {
 	struct blocking_notifier_head line_state_notifier;
 	struct blocking_notifier_head device_notifier;
 	struct rw_semaphore	sem;
+	struct srcu_struct	srcu;
 
 #ifdef CONFIG_PINCTRL
 	/*
-- 
2.40.1


