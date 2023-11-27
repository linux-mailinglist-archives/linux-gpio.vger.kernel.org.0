Return-Path: <linux-gpio+bounces-535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAEA7FAA75
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Nov 2023 20:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9D04B2100E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Nov 2023 19:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51EE3FB20;
	Mon, 27 Nov 2023 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1FAJSW24"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF4F1BE2
	for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2023 11:37:24 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c897ba4057so56309361fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2023 11:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701113843; x=1701718643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+3yw4Nx5iHvqkKWy1CrBMmo9SCrgAxb4KbqilKfXTc=;
        b=1FAJSW24j7EAyvMc3oIynht23LHRkt4oybLWbnNGXBio2EwOklgJrlCco+adX8H1Pg
         qJMDUyhG6vUlIDOxpAQ9E+rMeGaprfPSaqOqbL1Pbm7WrFjBkmvHvoa5AHqMMrj/BIc6
         bIJDD1qbU8BLTZTCgMfn1pxOtQLM3B3Q6fhbNmGp2S0yfhafTOqVOlL7eYieBUbSPE4S
         ICS/H57xjoffY5LVXXNhKWoqy1d5mDj/HTlhqU0Os7LbY038mOt5Sj20QCRgqCGU/WZY
         xDPr/BdCcNVmaNIiCL+qi2g2rFGEaPHmUSBfU0lGOSMeNokwKCMkZMT9TdxCmsmdgAFF
         WtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701113843; x=1701718643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+3yw4Nx5iHvqkKWy1CrBMmo9SCrgAxb4KbqilKfXTc=;
        b=pwxKxVuPAsJdyF8qdoStfuGX3klsGacnqjg8EPWvxyTvNM4FDN+ig0ztQLHjYoS1o3
         y0XhVRc0fVhOXbTymXlSUUUcE4JYCvLhe7gtfZI8b1yd+Nm86gKVu7XhykBPXlYxU+u6
         W0rlRR32Sb6lkHUKJ8sA6nG8hh9+imGE5SXqI+6Ys0wn0ShePkDmf1xWOVgJEFEEba/F
         Bxe/dGQyETHVwul3ZabyvPwVbD5WA6c+042gCNS+l065Vub/2gTP5qMZXPFtgrl5wyU/
         Jmx3S3Lalrf00PIkD+xUOoqwjpBaLuzAdE3gvdz0IZeuIjvfcCXuYxAa2FjP9jjJl9Gf
         TNnQ==
X-Gm-Message-State: AOJu0YzhIyEv8/OqZCYzts3R9s77FRLXQD1Z1XId6OIr6eJfNSyaDW8y
	FsRsHHXOsJSGndFar1D4v/bINg==
X-Google-Smtp-Source: AGHT+IEc/FkN03AUn3exkNcPYCn+yIrRAT4pLmfihq5+N7WqSkWZiWdI/w3JVayDgMaEeeQRYoM8dw==
X-Received: by 2002:a2e:5007:0:b0:2c9:9968:2d4c with SMTP id e7-20020a2e5007000000b002c999682d4cmr5138406ljb.9.1701113842849;
        Mon, 27 Nov 2023 11:37:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b0040b3632e993sm15016610wmq.46.2023.11.27.11.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 11:37:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: sysfs: fix forward declaration of struct gpio_device
Date: Mon, 27 Nov 2023 20:37:15 +0100
Message-Id: <20231127193716.63143-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The forward declaration for struct gpio_device should be provided for
both branches of the #ifdef.

Fixes: 08a149c40bdb ("gpiolib: Clean up headers")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
index 0f213bdb4732..b794b396d6a5 100644
--- a/drivers/gpio/gpiolib-sysfs.h
+++ b/drivers/gpio/gpiolib-sysfs.h
@@ -3,10 +3,10 @@
 #ifndef GPIOLIB_SYSFS_H
 #define GPIOLIB_SYSFS_H
 
-#ifdef CONFIG_GPIO_SYSFS
-
 struct gpio_device;
 
+#ifdef CONFIG_GPIO_SYSFS
+
 int gpiochip_sysfs_register(struct gpio_device *gdev);
 void gpiochip_sysfs_unregister(struct gpio_device *gdev);
 
-- 
2.40.1


