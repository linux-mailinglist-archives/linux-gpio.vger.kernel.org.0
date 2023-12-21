Return-Path: <linux-gpio+bounces-1789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E769781BE64
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 19:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17ECE1C24493
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 18:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DC164AA3;
	Thu, 21 Dec 2023 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XARgSbdu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5F1F601
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so11074275e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 10:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703184202; x=1703789002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Q+b8wqRYdeT/k9zOecma8OzQDizS0i1OJX7YWZXzlI=;
        b=XARgSbduESI25dQ+m3yC9TGoNDJ5wTGbWexTt0rzwxyQJtwqAQipl5JM8JSrTnsDVN
         /iUrGFHiVWUJlzUk1AnTG/mpym2pd2TKJdJ7Bnp764vM4ztiCTZjZtO3woEufVfVHbva
         L3SfcND19OKQrt6JW1cfbAojKGgZD9rAtyCj/GBBcVDom4ADGP/JZjAQrPa8Fl4jGxZG
         X29JK4pXu/A4ED7PExFYJDFYicTpMStskNL/H6dIMlHQy6GsXJFyh28uqZzmIzsRiu2q
         KDO0jagMOAPUb+42uZ2yULaZ269Py4mure484qDhfMdVlNhlIxi01liK9Ass3hNlIBkJ
         tjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184202; x=1703789002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Q+b8wqRYdeT/k9zOecma8OzQDizS0i1OJX7YWZXzlI=;
        b=ZwMbCATf+oUjBc1uW4UXJSvqHLRiri3pVa/znwT4LAxTuG8DPZXxOMwDgDNFMSnrcw
         TKT3Pyuhq98XlB6wr6fsA06c5fJvzIcKYMVkj5zoDR+aD8McP4VL1dSMmU9ZDnq8Sqf9
         VfF/f3TbszSj8FUl0LD9VFQHp3t4irBwS9WtJRj+aqjlPEirPrSdhMI+AHZJbSySfbYz
         1FjB3Lff0KLcsG1Jy9lbC2JN/RL+BqzTFvAWnh3NjTL0j4s5Pl9cNee/Nj4LjjtO1Q6g
         xz7OnIlrZa24T33OF4MKdt51KDEz2pfxqpwbwOmiN2lRkobn7cm6MpdyYSZ1mom8ZUKv
         Bsvw==
X-Gm-Message-State: AOJu0YzEyLI61HcpNzAf29Bb8KiFBn/oPNEfv4jViREg9SMmcp4KYqtX
	eX+KTeASPyn1lg55XwuFfEbhMq4BbdfVvw==
X-Google-Smtp-Source: AGHT+IF0uPlgDGW1mQSUSQjVUv6wHrWs9d4zgygbAZgEleT0uOWDAR0Gl33bGvpoR6Ie9mooUPVFlw==
X-Received: by 2002:a05:600c:19cf:b0:40d:3159:9303 with SMTP id u15-20020a05600c19cf00b0040d31599303mr80995wmq.155.1703184201920;
        Thu, 21 Dec 2023 10:43:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7701:a2c3:cba4:74db])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0040c42681fcesm4188059wmq.15.2023.12.21.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:43:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpiolib: replace the GPIO device mutex with a read-write semaphore
Date: Thu, 21 Dec 2023 19:43:15 +0100
Message-Id: <20231221184316.24506-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221184316.24506-1-brgl@bgdev.pl>
References: <20231221184316.24506-1-brgl@bgdev.pl>
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
index ae4fc013b675..e4159344a0ea 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -771,7 +771,7 @@ int gpiochip_sysfs_register_all(void)
 	struct gpio_device *gdev;
 	int ret;
 
-	guard(mutex)(&gpio_devices_lock);
+	guard(rwsem_read)(&gpio_devices_sem);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		if (gdev->mockdev)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c9ca809b55de..1baeb6778ec6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -98,7 +98,7 @@ static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 
 LIST_HEAD(gpio_devices);
-DEFINE_MUTEX(gpio_devices_lock);
+DECLARE_RWSEM(gpio_devices_sem);
 
 static DEFINE_MUTEX(gpio_machine_hogs_mutex);
 static LIST_HEAD(gpio_machine_hogs);
@@ -131,7 +131,7 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
 	struct gpio_device *gdev;
 
-	scoped_guard(mutex, &gpio_devices_lock) {
+	scoped_guard(rwsem_read, &gpio_devices_sem) {
 		list_for_each_entry(gdev, &gpio_devices, list) {
 			if (gdev->base <= gpio &&
 			    gdev->base + gdev->ngpio > gpio)
@@ -415,7 +415,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 	if (!name)
 		return NULL;
 
-	guard(mutex)(&gpio_devices_lock);
+	guard(rwsem_read)(&gpio_devices_sem);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		struct gpio_desc *desc;
@@ -664,7 +664,7 @@ static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
 
-	scoped_guard(mutex, &gpio_devices_lock)
+	scoped_guard(rwsem_write, &gpio_devices_sem)
 		list_del(&gdev->list);
 
 	ida_free(&gpio_ida, gdev->id);
@@ -887,7 +887,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	gdev->ngpio = gc->ngpio;
 
-	scoped_guard(mutex, &gpio_devices_lock) {
+	scoped_guard(rwsem_write, &gpio_devices_sem) {
 		/*
 		 * TODO: this allocates a Linux GPIO number base in the global
 		 * GPIO numberspace for this chip. In the long run we want to
@@ -1017,7 +1017,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_print_message;
 	}
 err_remove_from_list:
-	scoped_guard(mutex, &gpio_devices_lock)
+	scoped_guard(rwsem_write, &gpio_devices_sem)
 		list_del(&gdev->list);
 err_free_label:
 	kfree_const(gdev->label);
@@ -1127,7 +1127,7 @@ struct gpio_device *gpio_device_find(void *data,
 	 */
 	might_sleep();
 
-	guard(mutex)(&gpio_devices_lock);
+	guard(rwsem_read)(&gpio_devices_sem);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		if (gdev->chip && match(gdev->chip, data))
@@ -4745,7 +4745,7 @@ static void *gpiolib_seq_start(struct seq_file *s, loff_t *pos)
 
 	s->private = "";
 
-	guard(mutex)(&gpio_devices_lock);
+	guard(rwsem_read)(&gpio_devices_sem);
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		if (index-- == 0)
@@ -4760,7 +4760,7 @@ static void *gpiolib_seq_next(struct seq_file *s, void *v, loff_t *pos)
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


