Return-Path: <linux-gpio+bounces-2757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BACD3842577
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49D61B28E4A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F14812839C;
	Tue, 30 Jan 2024 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IZY4wbMF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567191272AC
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618940; cv=none; b=YGmDJfvTqXhFLpRLP0Iruumn9rLb32WATkQVS5M8FTCnLRA0ECfbX7k2iSWBztsPZUu6I8i48zTu252N3oPdSvvEDaFOMMbD3z4FiQbTIa2oIh6ctMTE1tfBSJQFnUI04zMVTByaJeEd9qDOGBRHIBhy2T6tRDvDz3j0gv7PR5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618940; c=relaxed/simple;
	bh=sy/Xo0aRUHnk7/3nrgS7gGYJagZE73KHjW0xjp0oa6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qqTpfPru+yZA3hurHtr/6DEGODRk0szpkL47sY73pJKVxiuofXQXZlZ5lOO3gMrGGondIP5a4NlcqJVsFzopUDbSf2aD7+vAQrqDdiZDw5exwfW50H4TjIodTsNLp9x5xCdyOGzmJYmbewr/cbWJJiYsfxA6fReqqd1xzdMD8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IZY4wbMF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33af4b34e2cso912546f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618936; x=1707223736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StD8NH+zPsAp2o0EPWyaBr2kizQ90EoPj1qPPjywTiQ=;
        b=IZY4wbMFgyoQffx16CZcwX4NdxnLjWZ+qBhSa+mMjcczZm4X3e4Ut2VdXamN39WYMo
         JG5yd+MYV+TncA+NY3tsHej4+9k3dS9TjSFOt0A4k2PjQ1h8fyh47WZShyr8afqmieg1
         +BLSuXXQgNI/NZqp8gsiLGzwtrTyW+RlnzHgSbbLfYQ8DiO1kIyyb10Xo7RVjpHexw/1
         51cC05yGD0Odsk+EBV1m7xIQWmvscF/iDb/hMdEYbG+qhlV/CKhoU8AkOMSLwPcGvyKu
         UNKxNxV24aTSjWxjY1fmaHiKYzBMutVxMPfnW7qYYSHiVrMeudYW50FLWXxhyZ3GWG9n
         YbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618936; x=1707223736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StD8NH+zPsAp2o0EPWyaBr2kizQ90EoPj1qPPjywTiQ=;
        b=EPlPHyby1eDM0rE0w2CvCvOneqsVhhNg2GBjY6Mo8Ks6mREJon9HC0Q9DrULErANyH
         E8ZvIEt0wE+SuKC+hfum0kG1U3ikNbf0angihQcDeSvqC/lQA54oHTwi9qrFObecd6d2
         3ilccvmEK67B2SDdAr/DoEFGp5NlNoLUTCdm0/x0u2SKqvpMyiF+uG1efa0jxR+0nB3R
         m4MEJ5FzeaSxss3+JwqqzLO2gEpRt5L+CWHO1ewQJq90GxkvtHVmCkwKocVk06KixdJC
         52+ZupREfWe98SeBaiuV675zx9sgVJI8SPz0GKX3oi7OAkpzuU3DL4G4szZ6DVmJF3KY
         Y3tA==
X-Gm-Message-State: AOJu0Yw8TfSeb1atxixqonzwlde3t/NSiZqFGIB5p/+4vH0Zbjjw5wJw
	iaF5CG4Nu7EE+bld0LiV7h6nBaEidsZjTVBRY2uCiglzP7XPBO3fkvwxoEOph+Mzm9DZGnQVcKH
	4
X-Google-Smtp-Source: AGHT+IEK+CtgyEutN0lQ32vsWLa28C5oQ2rimJRQ9UVGPvEAgDMcf45gw6nhyBnxCMbbvzZQUCtM+A==
X-Received: by 2002:adf:f285:0:b0:33a:f090:f758 with SMTP id k5-20020adff285000000b0033af090f758mr1518250wro.27.1706618936767;
        Tue, 30 Jan 2024 04:48:56 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:56 -0800 (PST)
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
Subject: [PATCH 19/22] gpio: add SRCU infrastructure to struct gpio_device
Date: Tue, 30 Jan 2024 13:48:25 +0100
Message-Id: <20240130124828.14678-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130124828.14678-1-brgl@bgdev.pl>
References: <20240130124828.14678-1-brgl@bgdev.pl>
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
---
 drivers/gpio/gpiolib.c | 13 ++++++++++---
 drivers/gpio/gpiolib.h |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9548c9e53197..a1a46f2127f8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -680,6 +680,7 @@ static void gpiodev_release(struct device *dev)
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
+	cleanup_srcu_struct(&gdev->srcu);
 	kfree(gdev);
 }
 
@@ -940,6 +941,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
 	init_rwsem(&gdev->sem);
 
+	ret = init_srcu_struct(&gdev->srcu);
+	if (ret)
+		goto err_remove_from_list;
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -947,15 +952,15 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
@@ -1035,6 +1040,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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


