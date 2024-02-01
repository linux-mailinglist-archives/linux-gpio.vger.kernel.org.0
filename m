Return-Path: <linux-gpio+bounces-2881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67980845D87
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 17:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1468B34AA8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 16:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007927E100;
	Thu,  1 Feb 2024 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0J/BUUBD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27705E230
	for <linux-gpio@vger.kernel.org>; Thu,  1 Feb 2024 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706804885; cv=none; b=W0htN9i4tRm9QYI623CxQEg1gQZMGFMuOPfx1N41IxGoFBqtHZ+gfEPQFbyCJ4AnHRFz2crvqj7CNINYc+uq1jSjT98CsPnEN4kNVkQhCDbg/xNJ9oOtXXkialfRiWei2YDMjan4NTF3af8Bq7z3umBakBLjSkfLKspkrURGAPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706804885; c=relaxed/simple;
	bh=0dL33Z8IzWy/mhm5Lu3goB/z7dH8jhdH8Ln94Ohl2Y8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y9aOa/4lb/0M5+isjgaUPhp2CAZe7diq6U4NGqWjgYmvNvAuZPaomh2ulGvbktNruZTPudInoTU4pUiE2bmWK3vgYxYwVEqWFq4vZTijCa4M26nOTiy0jCRYn35840fHd1k4MSvceKvXGUdPmF032ECt71qpxnMF4vIS/186VX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0J/BUUBD; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511234430a4so1807618e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Feb 2024 08:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706804881; x=1707409681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClezJrRGNQxozypAZkAn5qg08BvU4YaqeAiEmP8ZGPI=;
        b=0J/BUUBD0ZBqAr2j7KPnWqJCVz5Eov+lI/BThTpCR3Tg5UyTmf3ov+9Hq/DJWSV9d4
         MWZ2k28OJgbTLttQr45biyZM2cLPKbfc/V0wtoVWbijd+ON2izjXDLa21T1FTlJcNxzQ
         9vkcGGO9E384KyZDtz7xHAAIoZ2g5SfHGNpCj1GTENduhfnX3tLfNEDFUcsUreDJC+eG
         c+torkOjE+LYjhp+dOEmiB0xMjNqbIRxsoMvsBfZXI80ktJRo6DVt4xJYmuYNlb4BhGB
         iHqdymT9JgTonrrb6PwL4PAu2zyEqTdmAejNvByGT8jA7ALpEfiK61p7RM317t5M0zxS
         O9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706804881; x=1707409681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClezJrRGNQxozypAZkAn5qg08BvU4YaqeAiEmP8ZGPI=;
        b=Jo5yS8sXaPZCh4hGRjp86embo+VrMcTpSf919L8XEy+MmbVF/LXv8mREaWuoq96lFm
         PaUmuNBbjfEAG3XYWLShVUiaaxMeDHtnaY48PMQ9Il+w9VSxaRPpW4dSgO/yVZqHqEzz
         cEiomhFDGb6fOFC9802BPxnt2oE/uFM8yONrpFreYb1p0PiaklB69gsEyFqtZ2TVw9yF
         Rm0hNtpdj8fbNhoigNRDs6b7gnaXQImuXFRn4gvKUf2S4DExkWkodc1WgQsElMvsI5+L
         8rdWSsUPnGdir5AQ7s4wq9em/CoZVtO31CVruXtgVoj2jIfWjb+uK0odXFPYWAolel8F
         46pw==
X-Gm-Message-State: AOJu0Yy49eRl/1LteOOL0K6GO43jrrbNlPvEMTauHFsQFCdSBGvP9DCH
	ulHOFbzARoeCrSOxZSmFYD6hdiPvp63WFB8n3wqhiwALwqTZiu8889Y6C98OHDVQUrSl3xdoXko
	U
X-Google-Smtp-Source: AGHT+IHKzZsfuTZqoSUj+pCd6soemXtR7LJZpKOXOdiQf/vJ7sz7oreB9zWTsW/LtDf8yezbRs6uDg==
X-Received: by 2002:a19:3847:0:b0:511:3331:f999 with SMTP id d7-20020a193847000000b005113331f999mr170216lfj.9.1706804880810;
        Thu, 01 Feb 2024 08:28:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXJnI3TOqNVutexmTrbOX97gmmSjsX0rbkRRxW6G9Eozt5scvJ3N72SmgUrOF23up7OpEWGgFbzJLdB+RhCOWxC5zx/12DQAfr/hcia/TMdx3sX7soICw7DhIgn4hHfD65S0Z4OVZOL3+OGFhE=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:dd01:5dec:43e3:b607])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c358a00b0040ed49605a0sm4926902wmq.47.2024.02.01.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 08:28:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: set device type for GPIO chips
Date: Thu,  1 Feb 2024 17:27:58 +0100
Message-Id: <20240201162758.50733-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d50a786f8176..6b1f16c15deb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -663,6 +663,11 @@ static void gpiodev_release(struct device *dev)
 	kfree(gdev);
 }
 
+static struct device_type gpio_dev_type = {
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


