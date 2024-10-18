Return-Path: <linux-gpio+bounces-11611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4989A3989
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA3D1C238E9
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2EC191F97;
	Fri, 18 Oct 2024 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0OrtOG6Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A51917FE
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242631; cv=none; b=Rx03sH1hg5TUx6irYxPs4W7hWi+BgJq//6clEUheA2/HHwUNKs40/it/eqlVU0mQhf64N129LNG9/e6daJT02AANEEEAmUlPiaApxv0Q62mJuYbnmubtAhRi0JuKsF6t6LqLxW79b7Aav5ofS3hzzdDno0gK/mdy2EnAjLyOHR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242631; c=relaxed/simple;
	bh=ShKnfVnA13yZAURxSbfkTfcYBLmCdqbi8FWGA7M737A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDQKFER263bm7jhGrEv9u7U6KlHKzkFKH2MuUPL0SNSsUG6O8wUrhnpk0vSKwKN2Oo7cjs6iLBeAbVxkxV2tmv0C6K8EnE7e1Fyv/zbVmiURILODelN5GMJdxIRpMtDvui1DMIpsEWV45eQmH4R+shgcY2rx7k8k+G6D5H+DYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0OrtOG6Y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so15386065e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729242627; x=1729847427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0tIf0jtJWFltu4ODvVnK3F2kIEgN0qMoeq7qRt5Wac=;
        b=0OrtOG6YydfSWJiPhZYVGmXhQP16KXqVllp5aPSNV8gJxOBCh/r1X+7TNHHJlcy/78
         5p3vK1jr2ZDmJH5phMOMMDyu8UzvL6kx8oYLrqzEyMjPohjRHvXMdLtYdA3QbSSWDadZ
         ifUAHDVQXy8z5Dzs+BtYnF2bkwM70GR3M16rjJd8lWVxwmjoBtfulXMm9ve6QIdhdcgo
         lhk4fQCrDn22iuYRhdDoy/04FUrzlgPEbNxLpxNpUoQR1YOKhhvN5rS2UluDGXDnPKu7
         ImcEsKWBPCjKCoSoDt9/QORN63Z/J1XLi/y2WzxMl1401KEx/5LlNBIJRSevHoeMhuJw
         OBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242627; x=1729847427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0tIf0jtJWFltu4ODvVnK3F2kIEgN0qMoeq7qRt5Wac=;
        b=iw8kbI0SIxJA/4JY/JmKVy6F1E/BQ7nmYl1r1Pq0HYtQRgUlJ9x5l6vyhNFHQQbEr+
         /2BgWlWr1hVg/hChAblPl9iA9svEfUXG2MmJAZmUWTEGZC2K+cUEX6vt/7KmyVvRh2fJ
         /JAmq2OziYukfp3XZWU9BUCSjTcyhl7uxpdH9Z4lHJRt5Q9G/0O6DqM/L3jbVnrJlEOu
         9tL37YMDPjTdkjnM6iSj8CCj0ird6qRERX7+Xlrc47UzLvJRa8HiRyLS2xb+h8fhWKoF
         v9gybzPBYrZLbAep3br0Inhh/Fb6moM3w7rYa9egCnRcGLYhU9fJG1tsJiZVfWK+KQCB
         lfeA==
X-Gm-Message-State: AOJu0Yx0Na7007yrswRC6qA3TbWtzh9B/lVDFYtwXBhYdwHbi82KbplD
	wmSkj5TFTh4ay/8BdmL2ySUfebliI+slXGh8oqWm0HjIz/4gXiT6iOG8qsuybLKF8/XAFBC5yTK
	b
X-Google-Smtp-Source: AGHT+IGzh7emw0kamIRsyCmcyboccj8tMVEfGoaug2/eeFdI230uT4IxNKyEXz3mEkzh8Ug8d7T5Ug==
X-Received: by 2002:a05:600c:35d3:b0:431:5f1c:8359 with SMTP id 5b1f17b1804b1-4316163bc87mr14364015e9.15.1729242627290;
        Fri, 18 Oct 2024 02:10:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:45a3:93e:5196:d8ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160dbe76bsm18700455e9.10.2024.10.18.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:10:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Oct 2024 11:10:13 +0200
Subject: [PATCH v5 5/8] gpiolib: add a per-gpio_device line state
 notification workqueue
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-gpio-notify-in-kernel-events-v5-5-c79135e58a1c@linaro.org>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
In-Reply-To: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0P2NY394anUazMVeFpGs/9LRMhoWr2qMp3sLio3SuhQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEiX6qgpb2193BrTFH70zRNYR224K0KltZ2UYm
 orfLeQF1HqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxIl+gAKCRARpy6gFHHX
 cm1uD/9V/+YzJf5zaldzKgAUqnBq0Kq0Zo1xnpIzc6qJF7vydT8E2DZZrUoEzon3SmCQeH21KS5
 0pAFsASGdyT5YjuYDs3ggyzxsU3vPg+uBrQSrk8yNpTuK3TeA6x6ZGDcJDnaafeZnIuLoZABETu
 yDi922XFAfFsTmRf3sZr0viwEgwbTjrtcuST7J0vk5eavz61PDU0wKxIcNHLsU1FBfpNKPBZdxP
 pXQK+5N1sZBKEWuk7KAWGkfxvx7AjbBDdMF2UPoYCMUgMLWvz/SIDOdKXKb2+YmDQwvGm2ST3gg
 4X0TRHoiU7MhlydTq7GxkJ+fYyede8QFU5qsuBrH4VNV+9Va9/GpJCbkCwrUIYtIKhJoqpJ0xan
 tCU6qiXUnkv5KYweMozJST3Hk114AmFjXmYU/Rlpkbew6mr52UqTP+eshSUhq8f68d8C02OGuwD
 adaErvEiFmGGiNbfWThiS4jx+Q3LvR5/pyJoS/ZL6L/B/SU28gbxZ6NcrN2Xlzrtb1Nkk50C4dQ
 2qwLbE+LLhOErOluTCcVTPbsnu8xYlNCXIGbECwy5Ooe14e6EFvWYkVoViG2xghKWNso0fl4ymz
 5LaatgZxIoQ++Jqv/lN5U91jwjVy/dUobjiOy70WR/HK1CI274BxMTUDjsEnIHgmlir9x8oize3
 D2yrXJ3bo4Fvs+A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to prepare the line state notification mechanism for working in
atomic context as well, add a dedicated, high-priority, ordered
workqueue to GPIO device which will be used to queue the events fron any
context for them to be emitted always in process context.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 6 ++++++
 drivers/gpio/gpiolib.h      | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 0cba74381687..b242fdb1ad28 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2749,6 +2749,11 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 	gdev->chrdev.owner = THIS_MODULE;
 	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
 
+	gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
+						      WQ_HIGHPRI);
+	if (!gdev->line_state_wq)
+		return -ENOMEM;
+
 	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
 	if (ret)
 		return ret;
@@ -2765,6 +2770,7 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
+	destroy_workqueue(gdev->line_state_wq);
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
 	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
 }
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 8daba06eb472..8737e1641278 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/srcu.h>
+#include <linux/workqueue.h>
 
 #define GPIOCHIP_NAME	"gpiochip"
 
@@ -44,6 +45,8 @@
  * @list: links gpio_device:s together for traversal
  * @line_state_notifier: used to notify subscribers about lines being
  *                       requested, released or reconfigured
+ * @line_state_wq: used to emit line state events from a separate thread in
+ *                 process context
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
  * @srcu: protects the pointer to the underlying GPIO chip
@@ -70,6 +73,7 @@ struct gpio_device {
 	void			*data;
 	struct list_head        list;
 	struct blocking_notifier_head line_state_notifier;
+	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
 	struct srcu_struct	srcu;
 

-- 
2.43.0


