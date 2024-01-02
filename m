Return-Path: <linux-gpio+bounces-1961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 041AE821F17
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 17:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C83F283926
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 16:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F9014F82;
	Tue,  2 Jan 2024 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PduPRUQs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC43814AB6
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d5f40ce04so49996085e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 07:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704211195; x=1704815995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3wf/pQ/AJWgbz0DcSp/EQGOfmOL52HnCJ3+CUimtjU=;
        b=PduPRUQsYm/KpfCIrEUCZUXYsQ7W+JTChiO0vxlA4tCt/TnMtN6KAmdNhvsJUnN1+9
         xk6NawI3a+MvdzLGPMnsSw2Ri/H0/Zkk2YL6tte1jfjHmTyySxByGhzaZiTecbsKmjVk
         DHsTPO+WwUPvfXF8/AxcogXxL6p0FZGsdPO+kr+yKEw28WVDfDcmyhUgqgzwuZoq1Cvx
         x3yfPJGfsSSFvl1deH43Mj17jFTX+vZ2ljdRKl6vgifEzzmRhzCGeEz5v5YwyioaEboQ
         UlVfdZgS40bP1AqxgpXDJMIkCndRDH+LzRHzxRhQ7AaIFcZsFmSW68eUSs7Wsju8//Cq
         sD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211195; x=1704815995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3wf/pQ/AJWgbz0DcSp/EQGOfmOL52HnCJ3+CUimtjU=;
        b=ljQegqeq5gBq/iNDqKnYdM/uZWaWPcIEtyZGL/MXfYitsYkhzo3PUzgysroUA/mkk3
         8SrayX0cZZl7h26kx98GaBeUuMtdcuOK3R/5wIV0w2VxQoKQR+CI5GWMo5DDgNbret+7
         4pBceFwnJQ1c+y8T/ylPN7/mxAf3JGtFpkmXceFEEXnhqBME+Dkct8SWVmqm0rBfIjw/
         qiAkCHjj6QHEtUI8xDwoZ0tvulsUWR0QRqSfFbRBwdyeoD3Q1WsAzgDPBgQXJT/47ax8
         mBaMrGBDu+tDYewqmHCSPuRrrA/YPRRnPcAReeMol8ZFbMFEYnI9fCcahgdN6sJ/KrQ4
         CW2A==
X-Gm-Message-State: AOJu0YzLY/iodWokFyngwtEe4y0Xb9RpOo7T7CrivGR5Yr5HK87HeDBT
	eBExk6sXTeVnYRTCmhlX2zv+qHaSrSSTVQ==
X-Google-Smtp-Source: AGHT+IHPuqgldGLMFnRYL6FhPI2YLi1Eg/NCz/1AQ9quf/p1eetr/TeWu+oHiX7d0d/zVPaZOgEOSA==
X-Received: by 2002:a05:600c:1ca9:b0:40d:5b0d:b105 with SMTP id k41-20020a05600c1ca900b0040d5b0db105mr6173715wms.117.1704211195108;
        Tue, 02 Jan 2024 07:59:55 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f51:fa47:f00a:a53c])
        by smtp.gmail.com with ESMTPSA id u14-20020a05600c138e00b0040d62f97e3csm20556641wmf.10.2024.01.02.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:59:54 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/3] gpiolib: replace the GPIO device mutex with a read-write semaphore
Date: Tue,  2 Jan 2024 16:59:48 +0100
Message-Id: <20240102155949.73434-3-brgl@bgdev.pl>
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

There are only two spots where we modify (add to or remove objects from)
the GPIO device list. Readers should be able to access it concurrently.
Replace the mutex with a read-write semaphore and adjust the locking
operations accordingly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c |  2 +-
 drivers/gpio/gpiolib.c       | 18 +++++++++---------
 drivers/gpio/gpiolib.h       |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 2d29ae37d953..4dbf298bb5dd 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -773,7 +773,7 @@ int gpiochip_sysfs_register_all(void)
 	struct gpio_device *gdev;
 	int ret;
 
-	guard(mutex)(&gpio_devices_lock);
+	guard(rwsem_read)(&gpio_devices_sem);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		if (gdev->mockdev)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e019c4243809..4c93cf73a826 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -85,7 +85,7 @@ static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 
 LIST_HEAD(gpio_devices);
-DEFINE_MUTEX(gpio_devices_lock);
+DECLARE_RWSEM(gpio_devices_sem);
 
 static DEFINE_MUTEX(gpio_machine_hogs_mutex);
 static LIST_HEAD(gpio_machine_hogs);
@@ -118,7 +118,7 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
 	struct gpio_device *gdev;
 
-	scoped_guard(mutex, &gpio_devices_lock) {
+	scoped_guard(rwsem_read, &gpio_devices_sem) {
 		list_for_each_entry(gdev, &gpio_devices, list) {
 			if (gdev->base <= gpio &&
 			    gdev->base + gdev->ngpio > gpio)
@@ -402,7 +402,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 	if (!name)
 		return NULL;
 
-	guard(mutex)(&gpio_devices_lock);
+	guard(rwsem_read)(&gpio_devices_sem);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		struct gpio_desc *desc;
@@ -871,7 +871,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	gdev->ngpio = gc->ngpio;
 
-	scoped_guard(mutex, &gpio_devices_lock) {
+	scoped_guard(rwsem_write, &gpio_devices_sem) {
 		/*
 		 * TODO: this allocates a Linux GPIO number base in the global
 		 * GPIO numberspace for this chip. In the long run we want to
@@ -1001,7 +1001,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_print_message;
 	}
 err_remove_from_list:
-	scoped_guard(mutex, &gpio_devices_lock)
+	scoped_guard(rwsem_write, &gpio_devices_sem)
 		list_del(&gdev->list);
 err_free_label:
 	kfree_const(gdev->label);
@@ -1065,7 +1065,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 		dev_crit(&gdev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
-	scoped_guard(mutex, &gpio_devices_lock)
+	scoped_guard(rwsem_write, &gpio_devices_sem)
 		list_del(&gdev->list);
 
 	/*
@@ -1114,7 +1114,7 @@ struct gpio_device *gpio_device_find(void *data,
 	 */
 	might_sleep();
 
-	guard(mutex)(&gpio_devices_lock);
+	guard(rwsem_read)(&gpio_devices_sem);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		if (gdev->chip && match(gdev->chip, data))
@@ -4730,7 +4730,7 @@ static void *gpiolib_seq_start(struct seq_file *s, loff_t *pos)
 
 	s->private = "";
 
-	guard(mutex)(&gpio_devices_lock);
+	guard(rwsem_read)(&gpio_devices_sem);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		if (index-- == 0)
@@ -4745,7 +4745,7 @@ static void *gpiolib_seq_next(struct seq_file *s, void *v, loff_t *pos)
 	struct gpio_device *gdev = v;
 	void *ret = NULL;
 
-	scoped_guard(mutex, &gpio_devices_lock) {
+	scoped_guard(rwsem_read, &gpio_devices_sem) {
 		if (list_is_last(&gdev->list, &gpio_devices))
 			ret = NULL;
 		else
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 0ce7451a6b24..97df54abf57a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -137,7 +137,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
 extern spinlock_t gpio_lock;
 extern struct list_head gpio_devices;
-extern struct mutex gpio_devices_lock;
+extern struct rw_semaphore gpio_devices_sem;
 
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
 
-- 
2.40.1


