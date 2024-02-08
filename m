Return-Path: <linux-gpio+bounces-3074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A384DD83
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70F69B26454
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E484B6F534;
	Thu,  8 Feb 2024 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z0PTXnye"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58516F080
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386377; cv=none; b=ayt4dDUxx9P3fVIVBkH4C2NBP0RdsAIIbvPuZtIoWyBdl7GQD6Au4I1ya7Z2xKJS1zslEEa0gj6THFeK9JTf+1iZZ9oGErtRlV7DJXAkHMGm0QlCw5x6X+8CDnnHE05n4m1972iKh1kKqX/npR/zdUb9BIQp5VneD/11jUihpS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386377; c=relaxed/simple;
	bh=aksQxZZdyKnID/LS00ptyFtfb3SKVLVyZGehn3vT7g8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nz/zoJJaNIzMyF1RwNz08C/3ieGUTvdkXSmMbafAq5LKy/Nshw04IItE1Myy5b3HPJasFs6bSYFrqJdaBM+mwMYXAInHXjOtPItbhm4J5Hs8lU5wqG6TkTmJCZV2YWSz1D+Icue6Twudd1GI/oDbfCC89WzH7GikCwnhJ7nmdQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z0PTXnye; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4101d4c5772so4012635e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386374; x=1707991174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWH2EaA/vWH0UVT8sf474qxL3ezIh0GZukTXWIvrUrM=;
        b=Z0PTXnyeWlKAzP3q4PLvK8C8gWoJhqTCMM9bawlwKFaxytVBryNfdPhqi6zRijmjZZ
         7rY4Ra5FzOqe3YYyqFggVpJIshQXbhnguMQM3jUlykMLkg6KE2ZkiHSFPSFe8RkRqA1C
         l9ZczCX+amk25/WLGBFEiY2vo6sXFX+CxTb6mvjSAXe7PvQ22d4/Rw4T4csBqBJrr+l+
         OMFtfux+5U3E8Umvu1egT3CHAqy6pLeQHgCoWimpG+rjFYXMMoGrCu4lU8i5Z43cFA31
         pObzKM5aQDU5CcIVseYtRXoKJdjgoURaJf3YzrxVhMYbOnuiz5HVUTomdGDTXI3cYY1B
         m7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386374; x=1707991174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWH2EaA/vWH0UVT8sf474qxL3ezIh0GZukTXWIvrUrM=;
        b=o+P8z4jqc/DNzrwASaiyxGTjcmQUh13ERc419K0oXlTDfvjZLnvZ6aKKH2cwMAdwOu
         y1KQuP3fh4YymxzZl/UYwbVnXCGpF6vZyRozIi3Mgo/Duwk3KVE1CwzaSoK4ZI+286s7
         kPBbLMtRv7lIzAsZ6lnPTRrbufR/vLqcE1e1CaIuhJANBbGBzMGSJuKejwY/KE2Gsgkb
         Xk8LeXDiDfPFUpKtNGQDKnKtHsm0kyaRA3KpEYA1gk/E4ybpL1rzYwCY9/wutCU1m+51
         d69IuROhDmzubwdhCReIPBJO8jidzhCGETjCxOBvXsfr0CDJxiCrxA0+Ss+Vd9xht+YF
         PDaA==
X-Gm-Message-State: AOJu0YxelpJknLle7TJSFMdYBSdMB4giUGz8OV6IKFiIzxeCkBvhreYO
	NpUtPqd+bis9l840J/FsMIfLui4YXIxXqExw2N3jNOKlPN/P8ZnqQWNKqzcLp4U=
X-Google-Smtp-Source: AGHT+IHSEx7dYDU6Nm8+6fF/5ptWjkqc7rf/FtoJps39u3rYAPUJYuFiAeqfbcA89AZ37q2l4wQJPg==
X-Received: by 2002:a05:600c:4f0f:b0:40f:c5cd:374f with SMTP id l15-20020a05600c4f0f00b0040fc5cd374fmr1621789wmq.15.1707386374105;
        Thu, 08 Feb 2024 01:59:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJejhuJw/mzF8+wEJoMlasnNl3EIKalgHU04nsbazGXhlYshC5tGYg2Oh+ZXT3o0ygxp8peg8kg00PW1uk2o+SKXx2a/pP8vyesNFt20ynEcWHrRzeyA4UYmYWKctxWI8aKpnsxhzSbRSzegsFRCH5KiNOQnJfapq7liqzFedcUjvOONi443PeEtWarzVwW+leCD23c8WGVlouyBcegj1r8JDlwc4eIdWae5JBjw+b5FMvrk3SAndxKy4cxCG2qinQiAlR0f5D46L/viEEfbos6VWNfPHaOeqA3PGjBO/C1us9nyClfx8y8+pwcATUsVda7Em8oyQ7AuPVGsyB41xiNvKd12HeiQ==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:33 -0800 (PST)
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
Subject: [PATCH v3 08/24] gpio: sysfs: use gpio_device_find() to iterate over existing devices
Date: Thu,  8 Feb 2024 10:59:04 +0100
Message-Id: <20240208095920.8035-9-brgl@bgdev.pl>
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

With the list of GPIO devices now protected with SRCU we can use
gpio_device_find() to traverse it from sysfs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 46 ++++++++++++++++++------------------
 drivers/gpio/gpiolib.c       |  2 +-
 drivers/gpio/gpiolib.h       |  1 -
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 6bf5332136e5..d6ff044ce887 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -790,11 +790,29 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 	}
 }
 
+/*
+ * We're not really looking for a device - we just want to iterate over the
+ * list and call this callback for each GPIO device. This is why this function
+ * always returns 0.
+ */
+static int gpiofind_sysfs_register(struct gpio_chip *gc, void *data)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+	int ret;
+
+	if (gdev->mockdev)
+		return 0;
+
+	ret = gpiochip_sysfs_register(gdev);
+	if (ret)
+		chip_err(gc, "failed to register the sysfs entry: %d\n", ret);
+
+	return 0;
+}
+
 static int __init gpiolib_sysfs_init(void)
 {
-	int		status;
-	unsigned long	flags;
-	struct gpio_device *gdev;
+	int status;
 
 	status = class_register(&gpio_class);
 	if (status < 0)
@@ -806,26 +824,8 @@ static int __init gpiolib_sysfs_init(void)
 	 * We run before arch_initcall() so chip->dev nodes can have
 	 * registered, and so arch_initcall() can always gpiod_export().
 	 */
-	spin_lock_irqsave(&gpio_lock, flags);
-	list_for_each_entry(gdev, &gpio_devices, list) {
-		if (gdev->mockdev)
-			continue;
+	(void)gpio_device_find(NULL, gpiofind_sysfs_register);
 
-		/*
-		 * TODO we yield gpio_lock here because
-		 * gpiochip_sysfs_register() acquires a mutex. This is unsafe
-		 * and needs to be fixed.
-		 *
-		 * Also it would be nice to use gpio_device_find() here so we
-		 * can keep gpio_chips local to gpiolib.c, but the yield of
-		 * gpio_lock prevents us from doing this.
-		 */
-		spin_unlock_irqrestore(&gpio_lock, flags);
-		status = gpiochip_sysfs_register(gdev);
-		spin_lock_irqsave(&gpio_lock, flags);
-	}
-	spin_unlock_irqrestore(&gpio_lock, flags);
-
-	return status;
+	return 0;
 }
 postcore_initcall(gpiolib_sysfs_init);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a87ab8f013c4..68543ab34fb6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -85,7 +85,7 @@ DEFINE_SPINLOCK(gpio_lock);
 static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 
-LIST_HEAD(gpio_devices);
+static LIST_HEAD(gpio_devices);
 /* Protects the GPIO device list against concurrent modifications. */
 static DEFINE_MUTEX(gpio_devices_lock);
 /* Ensures coherence during read-only accesses to the list of GPIO devices. */
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index d2e73eea9e92..2bf3f9e13ae4 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -136,7 +136,6 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
 extern spinlock_t gpio_lock;
-extern struct list_head gpio_devices;
 
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
 
-- 
2.40.1


