Return-Path: <linux-gpio+bounces-29126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D42AC8DA45
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 10:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5721034DB3E
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 09:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F63F31ED65;
	Thu, 27 Nov 2025 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="deWJ3OuK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B992DA765
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764237247; cv=none; b=h2ZkLfjJJ+/U/xZsLIY4KwAPuo8tPznEM9VWrPAdqyDEIXd8Gs3Nk8IftwUPew2ZLh7YCQhVfFcoyeJCSlMJpia16xJ/DUJtZnWYhO169bQOEawgBcWs7AJZe/r2L6j7mL2UaZNmCdulpkKhDSucNw0mj4KLyXrEyOZsAOw36XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764237247; c=relaxed/simple;
	bh=SmQepX2FohqtF3MluLIJegTgJHdcb/+8oDYRx7aR+b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S/xinbKkuz+jXQQKZa4ro3chhM7WTLZORmQ6DG818UbycdIGea/x5ydTLlB9jOcChNceU8ibJN/+1A4TpVXixZfgybwlVxY5YzuQ9sXW2mx+vPIkETnJ8v8hq+kO7jtqkJkV2j2EBcWcHRnJ4ZpEDmsV+mNzVMrzk135QMsjPeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=deWJ3OuK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so1131113f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 01:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764237243; x=1764842043; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6A+tIBidzXcoSb/0YVkABngUvopb8wWgLfmcU6UTI7E=;
        b=deWJ3OuKc57Xn8g1UG7/3JiDCbSA3el3YPWQVbR8OFTDCfxWvb+fpZpc0tIJp+wSI/
         3ptoCCvsHb/DWpi1jo0/UzEnxDhyPhI8oJF6k0ePTxnKoWDKm3Dd1ZT3Aq5+ZQ0uv4vt
         IGUgqfXBDYIKa6h7TsJi67E+LXGuR3PNAipDwc6uBjpCMpZHzVLAoKAa3u+FwlKjj3HM
         9YVbmcyA+2okWIuPVRUOKBpO+5oDeYukD1EnIgxGua8ixeRI8xqM0ItUsR/p7Rx865Y6
         lYGkMQqLV3bkCNM4Ahvg7sPHrJHzwPppeurDFAtUsooaM4UFMttrQxgSn9kp80hELb3S
         uKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237243; x=1764842043;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A+tIBidzXcoSb/0YVkABngUvopb8wWgLfmcU6UTI7E=;
        b=xT8Flbd4W5YsajCKIhkS9bdkbShgBfe/5W9w2MRgu0Dn8aj6Qomn9Zab4hB07YyNnz
         JQ78civxxwA5t1ok8mweeZfO08A++A2Z8iq3OEWNGbfEq5JGyfFkwhq0CehkbsFm9mhM
         x3dfA685xwaFO1E4vs6oX3OI81yqig3WtpZNacL+nLRZUjHJDwMq8dy7MiKA1Vgt1+KQ
         W/Jh7mZEk45auli92Vg/wQZBMiNz4HHvxTl89/E2gFJcnkeIlNYCNph7Cn/8DITc2KS4
         fIUxnrX9NFCb1Pb6D03ho7vPnG4/3eT5tcp//mCxwC0DoX2A+lNcr9tZqm7KP9CPw6eO
         dd2g==
X-Forwarded-Encrypted: i=1; AJvYcCXyAlrHFCh75NRG3jY01vs6lcTnndpMKKcp0LYFWUO0LAoT1JNKyoKlxU747dNGtBJVPo98y4AqZEim@vger.kernel.org
X-Gm-Message-State: AOJu0YzPWpCwr/BEvTZTg9ruhi4+pAHyxZRBRiIi/tg6QsFUR9cf9aLx
	/VfA0zCX3El43pU/m/KBaA8g/2IrsZWycof5lmeBFOpQGZiGmwTmrA7IKFqWLDcNwHkk1Xgik3f
	OglApfQc=
X-Gm-Gg: ASbGnctZ9zuyxeDep3sIL5RxsiIzywQZdfB/s1A31QFIsWqtWuVlBIc4rUudZ/kURGO
	9zoDrcEhd3LJmG2yUgtHjclm1ELMg7H46vX/7BgKpZTyQwiSMXsWwOa0bVQvw53dU9E7OYVauKL
	x6P3wLD+cqUSPOznDfTH2pW/ji88IZ+lKyVsEPJtnWq3M0/l6VnqjUgnTgx7eIUhg2pAI3ELAU2
	PZmmC6DdPMox02HRVknYj9qJ7saXHlw8q4GK8WUt8BGPfC9CfHmWR/eqDFIYWMc4VGdjOrKhpvB
	UBZt9ZY5t16Sh7brGzO7NWgRAT1c7VIogKaj7ZeLk0/mEPl1vAhlIKwAMYxUhyYGRsbnT2hit1r
	I9amRfHRqV/kGQDOyED97Ua4PnZpG7yQF3AdVc8yaBTAreun/uEZe8NwV8pfn3yA6iGQpo6m0F7
	zMrhq4PjPtwVRpuTjs
X-Google-Smtp-Source: AGHT+IHkOlyEnIGEXyPPZYPUGcpdgTeuRmOgddnwYCp2yklrHECC9edBQL2lhgDj4/tC4CcgWLdjUQ==
X-Received: by 2002:a05:6000:26c7:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-42cc137bc77mr26273436f8f.21.1764237242889;
        Thu, 27 Nov 2025 01:54:02 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bd28:e1d9:5af3:b39d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a6fesm2914238f8f.20.2025.11.27.01.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:54:02 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Nov 2025 10:53:56 +0100
Subject: [PATCH] gpio: shared: fix a deadlock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-gpio-shared-deadlock-v1-1-a36a650c2db4@linaro.org>
X-B4-Tracking: v=1; b=H4sIALMfKGkC/x3MSwqAMAwA0auUrA3Y4A+vIi6KiRoUW1oQoXh3i
 8u3mMmQJKokGE2GKLcm9VeBrQwsu7s2QeVioJpaa6nHLajHtLsojCyOT78cSNw0VLeOhr6DkoY
 oqz7/dprf9wMoXXxAZgAAAA==
X-Change-ID: 20251127-gpio-shared-deadlock-2d44205a2876
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10136;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hHZ03h8lB5jLqpbGPeOHaSPwMZPgMUR0tjjC4rUbvBw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKB+2VDz/WoOdVciGxCuyUw6tBPyX9Ac6c0g/L
 0R4ZacHakuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSgftgAKCRAFnS7L/zaE
 w1Y5D/4sRfJ6Nt3pRgoqbLXNdPlQFfCejnEohBVXCNIQb7Nds/SRU3vqhQ80aRrpx854e7EWOq7
 m4ZviSUFhPeMiEl4LcSnwy94nm2z4WqpIF4a0UIFyfztQiYe/Uv0KnWFxKYgBbOJs3GEVLKKAP6
 WemV/DUl0VTkYWDelwmluxqHHx62lIrc4DVGrT+H3LXXLeWbh1cueYJ433ZAOsbI2IvB7KzcN1R
 LW/gpkEtjVPYOSZnfGzpszwKKCOM+9BDTgkSAbTNlnKPdxC4HsWm7eXdFAqdFA77QNZG/JuDQF9
 TxPF3Q4NlGY46pg+hDsePCToQFp7KyR21QRjTMoM6NyGqt+GsxJBvwn3T17g3PDsOndqhm0zVnK
 hJY8UKIrsypSk3OPxa3pfXyxtLwvjzXew5fTcvvthn5W1uP22WfxvzrfdJucRI0A9dU+CPzh1rQ
 XoAi0JQQlvkftQsZCN7bJ3AQjx9Em+AXuzmLVJwYhYPPN+iqeZ4/PeabI/ln5T0siYPbSvKJtvU
 VnxHnRR7OdYO1sZ6A2FfncywZ21aADkIQHjKnNazI1NT0lOBUgKGajTwp8JujIAYkNoRnYR+Epe
 0qJP+WAbMY26bY7ER/7gwyR2S68jFGhEpsIW8eRI9wzk9fFp4+90m2KqhFJWbrrtrOnlESq5x60
 58h3gNU2Q0S+WcQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's possible that the auxiliary proxy device we add when setting up the
GPIO controller exposing shared pins, will get matched and probed
immediately. The gpio-proxy-driver will then retrieve the shared
descriptor structure. That will cause a recursive mutex locking and
a deadlock because we're already holding the gpio_shared_lock in
gpio_device_setup_shared() and try to take it again in
devm_gpiod_shared_get() like this:

[    4.298346] gpiolib_shared: GPIO 130 owned by f100000.pinctrl is shared by multiple consumers
[    4.307157] gpiolib_shared: Setting up a shared GPIO entry for speaker@0,3
[    4.314604]
[    4.316146] ============================================
[    4.321600] WARNING: possible recursive locking detected
[    4.327054] 6.18.0-rc7-next-20251125-g3f300d0674f6-dirty #3887 Not tainted
[    4.334115] --------------------------------------------
[    4.339566] kworker/u32:3/71 is trying to acquire lock:
[    4.344931] ffffda019ba71850 (gpio_shared_lock){+.+.}-{4:4}, at: devm_gpiod_shared_get+0x34/0x2e0
[    4.354057]
[    4.354057] but task is already holding lock:
[    4.360041] ffffda019ba71850 (gpio_shared_lock){+.+.}-{4:4}, at: gpio_device_setup_shared+0x30/0x268
[    4.369421]
[    4.369421] other info that might help us debug this:
[    4.376126]  Possible unsafe locking scenario:
[    4.376126]
[    4.382198]        CPU0
[    4.384711]        ----
[    4.387223]   lock(gpio_shared_lock);
[    4.390992]   lock(gpio_shared_lock);
[    4.394761]
[    4.394761]  *** DEADLOCK ***
[    4.394761]
[    4.400832]  May be due to missing lock nesting notation
[    4.400832]
[    4.407802] 5 locks held by kworker/u32:3/71:
[    4.412279]  #0: ffff000080020948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x194/0x64c
[    4.422650]  #1: ffff800080963d60 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1bc/0x64c
[    4.432117]  #2: ffff00008165c8f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x198
[    4.440700]  #3: ffffda019ba71850 (gpio_shared_lock){+.+.}-{4:4}, at: gpio_device_setup_shared+0x30/0x268
[    4.450523]  #4: ffff0000810fe918 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x198
[    4.459103]
[    4.459103] stack backtrace:
[    4.463581] CPU: 6 UID: 0 PID: 71 Comm: kworker/u32:3 Not tainted 6.18.0-rc7-next-20251125-g3f300d0674f6-dirty #3887 PREEMPT
[    4.463589] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[    4.463593] Workqueue: events_unbound deferred_probe_work_func
[    4.463602] Call trace:
[    4.463604]  show_stack+0x18/0x24 (C)
[    4.463617]  dump_stack_lvl+0x70/0x98
[    4.463627]  dump_stack+0x18/0x24
[    4.463636]  print_deadlock_bug+0x224/0x238
[    4.463643]  __lock_acquire+0xe4c/0x15f0
[    4.463648]  lock_acquire+0x1cc/0x344
[    4.463653]  __mutex_lock+0xb8/0x840
[    4.463661]  mutex_lock_nested+0x24/0x30
[    4.463667]  devm_gpiod_shared_get+0x34/0x2e0
[    4.463674]  gpio_shared_proxy_probe+0x18/0x138
[    4.463682]  auxiliary_bus_probe+0x40/0x78
[    4.463688]  really_probe+0xbc/0x2c0
[    4.463694]  __driver_probe_device+0x78/0x120
[    4.463701]  driver_probe_device+0x3c/0x160
[    4.463708]  __device_attach_driver+0xb8/0x140
[    4.463716]  bus_for_each_drv+0x88/0xe8
[    4.463723]  __device_attach+0xa0/0x198
[    4.463729]  device_initial_probe+0x14/0x20
[    4.463737]  bus_probe_device+0xb4/0xc0
[    4.463743]  device_add+0x578/0x76c
[    4.463747]  __auxiliary_device_add+0x40/0xac
[    4.463752]  gpio_device_setup_shared+0x1f8/0x268
[    4.463758]  gpiochip_add_data_with_key+0xdac/0x10ac
[    4.463763]  devm_gpiochip_add_data_with_key+0x30/0x80
[    4.463768]  msm_pinctrl_probe+0x4b0/0x5e0
[    4.463779]  sm8250_pinctrl_probe+0x18/0x40
[    4.463784]  platform_probe+0x5c/0xa4
[    4.463793]  really_probe+0xbc/0x2c0
[    4.463800]  __driver_probe_device+0x78/0x120
[    4.463807]  driver_probe_device+0x3c/0x160
[    4.463814]  __device_attach_driver+0xb8/0x140
[    4.463821]  bus_for_each_drv+0x88/0xe8
[    4.463827]  __device_attach+0xa0/0x198
[    4.463834]  device_initial_probe+0x14/0x20
[    4.463841]  bus_probe_device+0xb4/0xc0
[    4.463847]  deferred_probe_work_func+0x90/0xcc
[    4.463854]  process_one_work+0x214/0x64c
[    4.463860]  worker_thread+0x1bc/0x360
[    4.463866]  kthread+0x14c/0x220
[    4.463871]  ret_from_fork+0x10/0x20
[   77.265041] random: crng init done

Fortunately, at the time of creating of the auxiliary device, we already
know the correct entry so let's store it as the device's platform data.
We don't need to hold gpio_shared_lock in devm_gpiod_shared_get() as
we're not removing the entry or traversing the list anymore but we still
need to protect it from concurrent modification of its fields so add a
more fine-grained mutex.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-shared.c | 60 +++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index cd4dd6fc76abf32e7a437c3c54eec807478170f9..5e67e642c46268a9b63563812a8df2d033fef142 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -49,6 +49,7 @@ struct gpio_shared_entry {
 	unsigned int offset;
 	/* Index in the property value array. */
 	size_t index;
+	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
 	struct kref ref;
 	struct list_head refs;
@@ -170,6 +171,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 				entry->offset = offset;
 				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
+				mutex_init(&entry->lock);
 
 				list_add_tail(&entry->list, &gpio_shared_list);
 			}
@@ -246,6 +248,7 @@ static void gpio_shared_adev_release(struct device *dev)
 }
 
 static int gpio_shared_make_adev(struct gpio_device *gdev,
+				 struct gpio_shared_entry *entry,
 				 struct gpio_shared_ref *ref)
 {
 	struct auxiliary_device *adev = &ref->adev;
@@ -258,6 +261,7 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	adev->id = ref->dev_id;
 	adev->name = "proxy";
 	adev->dev.parent = gdev->dev.parent;
+	adev->dev.platform_data = entry;
 	adev->dev.release = gpio_shared_adev_release;
 
 	ret = auxiliary_device_init(adev);
@@ -461,7 +465,7 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 			pr_debug("Setting up a shared GPIO entry for %s\n",
 				 fwnode_get_name(ref->fwnode));
 
-			ret = gpio_shared_make_adev(gdev, ref);
+			ret = gpio_shared_make_adev(gdev, entry, ref);
 			if (ret)
 				return ret;
 		}
@@ -497,7 +501,7 @@ static void gpio_shared_release(struct kref *kref)
 		container_of(kref, struct gpio_shared_entry, ref);
 	struct gpio_shared_desc *shared_desc = entry->shared_desc;
 
-	guard(mutex)(&gpio_shared_lock);
+	guard(mutex)(&entry->lock);
 
 	gpio_device_put(shared_desc->desc->gdev);
 	if (shared_desc->can_sleep)
@@ -521,6 +525,8 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
 	struct gpio_shared_desc *shared_desc;
 	struct gpio_device *gdev;
 
+	lockdep_assert_held(&entry->lock);
+
 	shared_desc = kzalloc(sizeof(*shared_desc), GFP_KERNEL);
 	if (!shared_desc)
 		return ERR_PTR(-ENOMEM);
@@ -541,57 +547,42 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
 	return shared_desc;
 }
 
-static struct gpio_shared_entry *gpiod_shared_find(struct auxiliary_device *adev)
+struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
 {
 	struct gpio_shared_desc *shared_desc;
 	struct gpio_shared_entry *entry;
-	struct gpio_shared_ref *ref;
+	int ret;
 
-	guard(mutex)(&gpio_shared_lock);
+	lockdep_assert_not_held(&gpio_shared_lock);
 
-	list_for_each_entry(entry, &gpio_shared_list, list) {
-		list_for_each_entry(ref, &entry->refs, list) {
-			if (adev != &ref->adev)
-				continue;
-
-			if (entry->shared_desc) {
-				kref_get(&entry->ref);
-				return entry;
-			}
+	entry = dev_get_platdata(dev);
+	if (WARN_ON(!entry))
+		/* Programmer bug */
+		return ERR_PTR(-ENOENT);
 
+	scoped_guard(mutex, &entry->lock) {
+		if (entry->shared_desc) {
+			kref_get(&entry->ref);
+			shared_desc = entry->shared_desc;
+		} else {
 			shared_desc = gpiod_shared_desc_create(entry);
 			if (IS_ERR(shared_desc))
 				return ERR_CAST(shared_desc);
 
 			kref_init(&entry->ref);
 			entry->shared_desc = shared_desc;
-
-			pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
-				 dev_name(&adev->dev), gpiod_hwgpio(shared_desc->desc),
-				 gpio_device_get_label(shared_desc->desc->gdev));
-
-
-			return entry;
 		}
 	}
 
-	return ERR_PTR(-ENOENT);
-}
-
-struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
-{
-	struct gpio_shared_entry *entry;
-	int ret;
-
-	entry = gpiod_shared_find(to_auxiliary_dev(dev));
-	if (IS_ERR(entry))
-		return ERR_CAST(entry);
-
 	ret = devm_add_action_or_reset(dev, gpiod_shared_put, entry);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return entry->shared_desc;
+	pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
+		 dev_name(dev), gpiod_hwgpio(shared_desc->desc),
+		 gpio_device_get_label(shared_desc->desc->gdev));
+
+	return shared_desc;
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_shared_get);
 
@@ -607,6 +598,7 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 static void gpio_shared_drop_entry(struct gpio_shared_entry *entry)
 {
 	list_del(&entry->list);
+	mutex_destroy(&entry->lock);
 	fwnode_handle_put(entry->fwnode);
 	kfree(entry);
 }

---
base-commit: 5920c057a2fe9f4f05f87b5f0ab647d40d4b5087
change-id: 20251127-gpio-shared-deadlock-2d44205a2876

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


