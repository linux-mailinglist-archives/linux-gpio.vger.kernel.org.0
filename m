Return-Path: <linux-gpio+bounces-1962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE3821F18
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 17:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4661C2224B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 16:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215B014F91;
	Tue,  2 Jan 2024 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I/F8dAhF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB93214ABD
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d560818b8so69638825e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 07:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704211194; x=1704815994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgJ68qs44Lcqe8TCw142wLnFP4mWeBCuDvsZcDC2Hj8=;
        b=I/F8dAhFXk0gDICtKIkqAqTnOg96FpLU0X46Glli0PXSC2kBkyfsfY1S5YqNULZXPI
         yPPQ57I2EQom14KzZ+ffs/HGpgeHfuEnDbP4wR8D4udgWEYefmk+4i2UBs2wjXgzjgnA
         /UnINcjnZdYKpb11EhtDot1WGNtDhANBfXT4eblPeC8QCmhf1o7r0BVOr787RqTU3k2z
         d8sJEfrmlrwxIR1Af6XCD76n5XYmf046A3X/vXhy0x8iG/amMqQVMiWGlaUO2XUa4rN9
         +16AIIattoOlPqoSlGKGiHViiq4rMlRVD+cgiKxIwhOA8G3Gmcoqf1m6VLPQRTld2OOX
         TWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211194; x=1704815994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgJ68qs44Lcqe8TCw142wLnFP4mWeBCuDvsZcDC2Hj8=;
        b=a6xSpUc1Ur/0QlNSLxEsFVd3DJZH96GXOq9RENh8NgPskklewDoXgc9ttytN9WweMg
         Sq9tV5J04jS2MIVqzr9rO4HZOo/xgKYvu6QWG1nVS+Z4E3qYTkVOpITPXZ0JQjx3fNOr
         Dd5mnoCCvgLlN1jmPoGla8dwNqJgwYkoNkC2L4SBBm0oLRupgYbCrQqpnMD28kwGRwAX
         mjbgjwsq/yfucicHA9MubuG7yYV6Da65G2UFgSx1yqqlkqyX48D/CAyhPPb60Ga+/TPo
         m79Wwm+vMfTsj2KbvIhqDVBd+2eA8PQTXL1Gp6QDupOhHwQwCQLNv8vW6t/9dpcBf+Vi
         96mg==
X-Gm-Message-State: AOJu0Yx6vk8RUwPc6Z/g9/MsWTTx7y0BFD9m2kn6IiybuTJd2rXY7Ayf
	1wAEWwtKllKqcy4VPPlp46fTzVQn5SjWCA==
X-Google-Smtp-Source: AGHT+IEIx7iO4O+2hI4WmFZMKnVPkhvLRQqC9aD3ixvuGIyV3qeFn4DGO8oPt33bW+FY9YKuPLQNTg==
X-Received: by 2002:a05:600c:2a8d:b0:40c:610e:3c69 with SMTP id x13-20020a05600c2a8d00b0040c610e3c69mr9638192wmd.36.1704211194128;
        Tue, 02 Jan 2024 07:59:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f51:fa47:f00a:a53c])
        by smtp.gmail.com with ESMTPSA id u14-20020a05600c138e00b0040d62f97e3csm20556641wmf.10.2024.01.02.07.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:59:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/3] gpiolib: remove the GPIO device from the list when it's unregistered
Date: Tue,  2 Jan 2024 16:59:47 +0100
Message-Id: <20240102155949.73434-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240102155949.73434-1-brgl@bgdev.pl>
References: <20240102155949.73434-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we wait until the GPIO device's .release() callback gets invoked
before we remove it from the global device list, then we risk that
someone will look it up using gpio_device_find() between where we
dropped the last reference and before .release() is done taking a
reference again to an object that's being released.

The device must be removed when it's being unregistered - just like how
we remove it from the GPIO bus.

Fixes: ff2b13592299 ("gpio: make the gpiochip a real device")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e21497b989a1..e019c4243809 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -651,9 +651,6 @@ static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
 
-	scoped_guard(mutex, &gpio_devices_lock)
-		list_del(&gdev->list);
-
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
@@ -1068,6 +1065,9 @@ void gpiochip_remove(struct gpio_chip *gc)
 		dev_crit(&gdev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
+	scoped_guard(mutex, &gpio_devices_lock)
+		list_del(&gdev->list);
+
 	/*
 	 * The gpiochip side puts its use of the device to rest here:
 	 * if there are no userspace clients, the chardev and device will
-- 
2.40.1


