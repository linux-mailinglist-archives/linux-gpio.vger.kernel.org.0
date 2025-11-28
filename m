Return-Path: <linux-gpio+bounces-29176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2ECC91427
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 09:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7DD3AF072
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 08:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E8E2F746C;
	Fri, 28 Nov 2025 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mJc5geUX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF992E8E13
	for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319229; cv=none; b=JxbDGFNz0l6UXz12tO+HLUQuAOBqtlnaAia7PiiummadZr4KtYDynrTC+x+0SH0PdMA4ltclSnfs+P9nEgkWINFy58lI54m0WdgWJiPID12IpDtRbVCt4W+hALu0J6vUdhD9JrsE2YpdKeXDDI6iVtf71RFG18lw3kx5Z9MDA1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319229; c=relaxed/simple;
	bh=3X8tyZWXTkjNYVdi07QB6cTqdnSusNZcaxQfhmtbFck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jskYiXd7OiHvZOpgMACxvvFdrnv35Y/NAj2SsUDSLzoPecshfBZWWvMUcmWNKfivVsScWh+7AMBty5jsQzHhyKq8V88MndWAVquyuifLZD4oIrYjUJwWHouapZGyQpY3/a1Io4yruCiJhFAthB84L2J5nIqTYWAdyZTXClgxYE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mJc5geUX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b32a5494dso924394f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 00:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764319219; x=1764924019; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv57BML390TluVq3G2un1REvxVC2ClNJmdiej8kENaU=;
        b=mJc5geUXoVaY/pBYFNIOYQ/Ty7HI7DQc0NKbfj+ayOZblg/nNtw3/wzK6d+KXAC0nP
         LA6mdNIMmJfzDiSbX/+UoTlOmxO9amCrDXSct0gaK9ftSDnfpFidX9QaXshYj/YPsWll
         bCTicbRAAPemw44Zfr9GG1C/T3moXspVXQpuTs2CMyjMJUJrREUBfcne85S6K+zxbLYr
         yPhAy+L+0trC7C5mqIGvkdeSl2THK9PG/X28ZfquGMO8YbTSztxefH+kqGcMuLSscTe1
         75dXRWM/DJd1jyXuFnS6uif0/0osP2ASRAZXLLAcd1m18QF/Z7E9yH781SSIQNDl7eac
         QL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319219; x=1764924019;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pv57BML390TluVq3G2un1REvxVC2ClNJmdiej8kENaU=;
        b=hxysomDYKSd+Bo+DTi9xU7xugksezmyf8hnjA+w69UkzVwwY1tztb1qWC8n0UQj/Vy
         Q6QNv1ESbrj+kfrA5kSBjkI/LQn1RXkKnJ5U5Zvs51OpnMWg8eO8srg2pYniLeOgDgA8
         xwoYF7viGCsyj80DDNfD+yq4vGfhmdki1RgO4G3Wt1HoiIORVh1A5FJ5MwDH4BD3qwkL
         mrGvUf8tzHF6Z6ajiCPW6p1xsrX8Kis6bYDXrDhYPEU9tIHWZfV+0ajb6ETVdbYDChOg
         UKWE0Or7YhmLdrBFOUTiy6DwPsFiK5C2v4JcgTHcrjasNiHiTXvLgTGKIDXdmifZPpGG
         vO2g==
X-Forwarded-Encrypted: i=1; AJvYcCW4/rRtrPisNvyD7ppmRhcTRHmIhjs/TdkgPTh0nxpcb9oYqHUsPLnPOz8gf2XvNBiMZ/iax/wS2K0W@vger.kernel.org
X-Gm-Message-State: AOJu0YxoLkoN2O1pqELMmNKTO6DApnPPABtUrZXNGlvriLbhdxiq/quz
	0dUBlW1PgG07Za9UC9jwXm6ONcMVzaiy4ZKLeW3+EHIcUW8W1YDdSB6xm9fxzLOSUaA=
X-Gm-Gg: ASbGncvBMxjCL/W4pnqeGhQ+XLQ9ZC/czj3GA+sxWJ2jg15kg0UueEfWQFGR155mAI+
	y6miZ1jHcooqHA8amNU4hYSn2paaawJFxTAJdeYsgnIC40ny4vie3PK3Vt6TV05wBoHIXAem0iL
	/FUZ6XcnNq6qxWHIdmt2ViSD9ht7Wc7P809GfqZlBDUbv0JeKhPFRueDBivT+RybL/5i7y/gaHq
	HpjsQ7NMQhZXVg5+Rm3b45DhzpWRPbc1W8zLfef8jL3O8F2WtT5vFW3pATLFDPng83441mJxzAL
	/w/HtSGIE4L5fgAwxuIFN6V3DFl30uG7BQObePE3Qlp7x3YWA8gDefYg+yAe6LouO4bLQz12iSO
	u9i5GrP3iSfcbG3n20/OVMqdzOb2X/05pwqi3vnCf7PsqsZdyuj9nqmnOJ8fxhIIMtrBqo+8Hwa
	TuxL+dOwtzsHde2zI=
X-Google-Smtp-Source: AGHT+IG6gmIEdZdrYij+Blr0UQRsnegWS77cDteB4jdM+Vo/iuKrHqMmj2kaDrtFyf6NlzMiQ9tl7A==
X-Received: by 2002:a05:6000:1887:b0:42b:2f90:bd05 with SMTP id ffacd0b85a97d-42cc1d3571amr27379548f8f.45.1764319218845;
        Fri, 28 Nov 2025 00:40:18 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca78f77sm8190005f8f.32.2025.11.28.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:40:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Nov 2025 09:40:11 +0100
Subject: [PATCH v2] gpio: shared: fix a deadlock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-gpio-shared-deadlock-v2-1-9f3ae8ddcb09@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOpfKWkC/4WNTQrCQAxGr1KyNtKJ/RFX3kO6iJ3YBkunZKQoZ
 e7u2Au4fA++920QxVQiXIoNTFaNGuYMdCigH3keBNVnBiqpdo5aHBYNGEc28eiF/RT6J5KvKip
 rpnPbQJ4uJg9979lbl3nU+Ar22V9W97N/gqtDh3xquKnLnvy9uk46s4VjsAG6lNIXezdmJ7kAA
 AA=
X-Change-ID: 20251127-gpio-shared-deadlock-2d44205a2876
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10636;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9lox0R+mgEuMYviCChf0yb+hjOX6OPa9S8ZAoFMys7k=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKV/t/H+vrv5MBitQhroKo8RSrginL8pRxQNoP
 T4F4WCzbF2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSlf7QAKCRAFnS7L/zaE
 w+EqD/kBapQ3KqcH+T1TjwWahDkgbatPSax2eDFdx51C58PcXv3o5Ltb5TiUXRp/YXNCT4Gl0kA
 7pfGaVEPR5qzuRcakLA1ZgcyGgvCBVBYBj3dkWxEFdYWs/QGutxAPYUgy/0sfTAsGxPV9N5RspB
 WX13Db9hcI/baPYz9DGTVY9oxluYVoADrXWz30pvQvyR7WeGuQn4ObAkd1d1pFUVr+QI6khk+Vf
 hBh/IUBDwrxBqEHP7YXA0cVkxyf537XMs9kW4sjMXKc3muUn54VTez8fm5KiFG9q1kNw94Kaklx
 28H4bzVIq54MPqp3oivWfeWj+cdD/1X7IEQuHFmqt6occAcA6WT+atxF6MAFXbdRDkq5osRPFXR
 Z1/acgNKzHNuMR5GPCkBNBNMeeXx3MbbtTk9kiPKCRd46aiGKlnwjzcLqdOpSD1dX6amTu0DLc4
 Z+gI+0DH+JPz1ooe9lO1pLdnPl8bFWXp5hErigwcAsYBpio1DGZbu69n2LSGnVVt7tgwFMDgtTE
 GXcVhcaWknWljjuBfbuFPaDGVsaCrlD7UA113fH8bp+KDGm7jEs2k9Sb3aHgWxBerv1JPH1OdUj
 MYEksoxOHxvmJlLzWaMChJO4s/KAnLF5lGX/sHvqX/RSAp2Jsvan9pEQ4q6rbmWbtFh4apmRAZX
 LWDGuFD2jEY37QA==
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Don't dereference entry->shared_desc until we take entry->lock in two
  places
- Link to v1: https://lore.kernel.org/r/20251127-gpio-shared-deadlock-v1-1-a36a650c2db4@linaro.org
---
 drivers/gpio/gpiolib-shared.c | 63 +++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index cd4dd6fc76abf32e7a437c3c54eec807478170f9..8bdd107b1ad1d2fbd9742de20cf59f0820a2b267 100644
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
@@ -495,10 +499,11 @@ static void gpio_shared_release(struct kref *kref)
 {
 	struct gpio_shared_entry *entry =
 		container_of(kref, struct gpio_shared_entry, ref);
-	struct gpio_shared_desc *shared_desc = entry->shared_desc;
+	struct gpio_shared_desc *shared_desc;
 
-	guard(mutex)(&gpio_shared_lock);
+	guard(mutex)(&entry->lock);
 
+	shared_desc = entry->shared_desc;
 	gpio_device_put(shared_desc->desc->gdev);
 	if (shared_desc->can_sleep)
 		mutex_destroy(&shared_desc->mutex);
@@ -521,6 +526,8 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
 	struct gpio_shared_desc *shared_desc;
 	struct gpio_device *gdev;
 
+	lockdep_assert_held(&entry->lock);
+
 	shared_desc = kzalloc(sizeof(*shared_desc), GFP_KERNEL);
 	if (!shared_desc)
 		return ERR_PTR(-ENOMEM);
@@ -541,57 +548,42 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
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
+
+		pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
+			 dev_name(dev), gpiod_hwgpio(shared_desc->desc),
+			 gpio_device_get_label(shared_desc->desc->gdev));
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
+	return shared_desc;
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_shared_get);
 
@@ -607,6 +599,7 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
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


