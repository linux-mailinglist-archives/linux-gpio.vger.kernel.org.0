Return-Path: <linux-gpio+bounces-2965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D833084976E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 11:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6B29B29E7E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AF414A90;
	Mon,  5 Feb 2024 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lpP8kp3I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40413FF6
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707127698; cv=none; b=h09Zd3swYutqZQGPe9OHbVosacVoghYRAzfZosHa3ra/wTXYX4Tabqtofxz/K7mOSmWHPEnEKYQutYgyHwZXzloXljGfSKpuoLvC1bZULg/Ri0vankiEhYm0ApfeiAIbjoUXGxUkdf0Y9N7RhcdT4ZKR2dNwtJEbY+PtE3ERxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707127698; c=relaxed/simple;
	bh=0z04N92JTbhCAT8TybwVJZOggK4E3i1iymyAeKj0gio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E4QCrXTtHGsOnLOXi0BDb6PjP3+PsS4zDenU6I6hTGCxT1OQVExzw54+/LjMWoTkwaREbMOinq5/g4Ko72jhdYJVO+M9zpNYW57E8wSRt4J5B5DDFiVRHU6NHmb9oESCARmin86eflWJvTVCk/5a4O1tDx+F/bg+JV8Mfgxb73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lpP8kp3I; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33b1b21c020so2450133f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 02:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707127695; x=1707732495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz6rJ7dESCISpbZrnxE3XoKAl8aY4yf2DGxOhoFvQU4=;
        b=lpP8kp3IHHdVXingprrzGFCAovM/dWFNF+OibzejuVdRt/q+NqFZ8RI66L2yJwveDh
         BhIFeikqGIMTW5B1bciXadC4o3qa2Q6MnMxu/UJ/dHUo94H0gjGLM+yRhYS8YfuLgqUX
         YbcHtyEQpF+dURdDsZtLJFJw01VVTzJ8SpQMMtOxs4SDD7MlsHjkJ4nbWziP5VNhqNy6
         AiNT60p3N2uNnQFA+oZwij4276esviYigr60j+uvcV2GU02ngMK5Sx2+WvdC8zaq80DK
         Uhnd3QTRkyBFCwvZClBK13rIAjHR/GRwOYgBu/KKgn2q7aGEXQl84jpLNm/Orj6yTyZK
         35Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707127695; x=1707732495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bz6rJ7dESCISpbZrnxE3XoKAl8aY4yf2DGxOhoFvQU4=;
        b=TlEovEX7PrWV5WS73MFRksdV25fQmRqDOjxGARcCIlijSdDfa8tCS+os4ak4MpnKCg
         IJNQBVjGuxdW9l1yTK8N7wXFXydFY5QOvG6m3ta0UfCncEk46hzL2WKGAaKH1qctCbC7
         GVwf7Y3Ql4It5GaGQH/Tx+GHCEQSHfBPUA084Spjkc7dY7MOx19SHo6V507THTfxcuGc
         d2GRg3b1eu9engX2qsBaLr+DS3ZuaYIcu4NtTY8VtwYV55OqmXQIS1Fvkb1VyDs045EZ
         osjPOgVZkWunONJgC5wfhjpUW+VjOrKgdE43hnKa/cGNXJYcNQ0/M+ZfW1W8TjDwob+8
         LCLg==
X-Gm-Message-State: AOJu0YxmOOqMHE6ABd330FV6ViP/Aad1F9Lz2bdrEx6xjeK3FKCGOLLb
	s16aGbHChm0wx5PI/YNoF3THJpD/s6Y+c6Wm+rO4DrjDH9InI8FG2/fNTiR1Xpw=
X-Google-Smtp-Source: AGHT+IEuZryyRoYPtYSM3bmwThxgDpx+5aPtb6v/9reV37Ahag/GK5mGv86OJHOYzjFTfiHlxuMjlQ==
X-Received: by 2002:adf:fa0b:0:b0:33b:1823:284a with SMTP id m11-20020adffa0b000000b0033b1823284amr6764142wrr.14.1707127695058;
        Mon, 05 Feb 2024 02:08:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVLVNXZfhlwl8CwCpO6CxjlAu5kWuWPsW8ZHZOfWZ5EO/nGeWi/cj2ryDCLLNvdYH4pdSVjDTJTO9Lu7yfYGjyLWGNm8vYhTcS1GTZQoXkQ8nnKWv6m3sgqZYNnRbEIaDQFVTqfiZ6HPJrAsJsxNxAtfQx+vK+DRuTOZATmuWdA4ha3
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe88f000000b0033ae50e2c6asm7729830wrm.83.2024.02.05.02.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 02:08:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] gpio: set device type for GPIO chips
Date: Mon,  5 Feb 2024 11:08:11 +0100
Message-Id: <20240205100811.41534-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's useful to have the device type information for those sub-devices
that are actually GPIO chips registered with GPIOLIB. While at it: use
the device type struct to setup the release callback which is the
preferred way to use the device API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1-> v2:
- make struct device_type constant

 drivers/gpio/gpiolib.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d52b340562ce..caec861cfa5d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -663,6 +663,11 @@ static void gpiodev_release(struct device *dev)
 	kfree(gdev);
 }
 
+static const struct device_type gpio_dev_type = {
+	.name = "gpio_chip",
+	.release = gpiodev_release,
+};
+
 #ifdef CONFIG_GPIO_CDEV
 #define gcdev_register(gdev, devt)	gpiolib_cdev_register((gdev), (devt))
 #define gcdev_unregister(gdev)		gpiolib_cdev_unregister((gdev))
@@ -680,6 +685,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
 
+	device_initialize(&gdev->dev);
+
 	/*
 	 * If fwnode doesn't belong to another device, it's safe to clear its
 	 * initialized flag.
@@ -691,9 +698,6 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	if (ret)
 		return ret;
 
-	/* From this point, the .release() function cleans up gpio_device */
-	gdev->dev.release = gpiodev_release;
-
 	ret = gpiochip_sysfs_register(gdev);
 	if (ret)
 		goto err_remove_device;
@@ -825,6 +829,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gdev = kzalloc(sizeof(*gdev), GFP_KERNEL);
 	if (!gdev)
 		return -ENOMEM;
+
+	gdev->dev.type = &gpio_dev_type;
 	gdev->dev.bus = &gpio_bus_type;
 	gdev->dev.parent = gc->parent;
 	gdev->chip = gc;
@@ -851,7 +857,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_free_ida;
 
-	device_initialize(&gdev->dev);
 	if (gc->parent && gc->parent->driver)
 		gdev->owner = gc->parent->driver->owner;
 	else if (gc->owner)
-- 
2.40.1


