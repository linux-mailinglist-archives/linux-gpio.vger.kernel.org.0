Return-Path: <linux-gpio+bounces-3257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1DC85442C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C460B24F4F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CB4AD4B;
	Wed, 14 Feb 2024 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K2kq0q/W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D96FAD
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707900268; cv=none; b=TrLBFj9ph5V8g7qb8QcAYZL8rPiX46TDqDXGhTfUbB+atb9HqQ8zS8eNbLsQ32lE5z1ITd1hy6n/4ZdXYx5+SlW0c2IE/TnVlm5AVzueBqvzafvyocvHybgRL9mFywPJlcY4XsbzPWNAXQk0QiBoKQ0y8iKFXjSEdnVLWZwRomI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707900268; c=relaxed/simple;
	bh=eHN5AciwJywXX0m6TsYOtY6ESMLvZ8fD9s43NIeL+yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rWCvHZ5Z0LHuvfZB57fYpcvb+CVDialjBCTr+Rj3rF3FjKoAU3IvlQ8OyulPwZ6JPnIE4o7TCc/dq0uD1ZvaR3lBuBJvnWVJD930JsPAgBtt27gIW5oB16U1UaQQ6nCdvyF7aahFBrRfA0nvjXn3N8AVSukj/wUpNBPCOqLzPLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K2kq0q/W; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-411e698e679so2807425e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 00:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707900265; x=1708505065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlRaYTHTwVLuz49BQFz01SyvMwXYPLiItdhT/I/i6Zw=;
        b=K2kq0q/WYe599EKhJ1soeKgfSsfd+AT0WcsN1LJYcq3UlkkXMBoNgvW7PZoO7aIkDn
         OPPFkdIoKWp5ltH+1gHwbraYREKuExRfgx/R5o5pB1GFbOtxK1pQp/VmqjeU+/BpGqCe
         VCfb1YAlsetONNJDjNOCpBJJM67yaliuMKPhy1ED+7r0yhxb6w823ozrm4dsHPo5HOI+
         9Z9px+cpTASePhg9Srvh+VXJ2wcFwzrAMMuXsMPPj5NCDNI1VKH5L4Espr9Dmc/GyB0W
         9IahnMSFIxqds925LuyJMPI+5OW05L5px4b8yujZcRrxtAZ/2xGF3Euj0TKRTNXbU3Vc
         ioCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707900265; x=1708505065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlRaYTHTwVLuz49BQFz01SyvMwXYPLiItdhT/I/i6Zw=;
        b=CoouxXgqxfhMqNkE2ZRKBT9TfKFgOKRCbgUTMzeCIaOJXsa3vsHlVCXXD99VGPN+1+
         3SKVyQZNEmNg9FyHQNGr32o5gvpkITW+lwdPg3xgmMu/pzLFrNQDATihSkAajjlijCPE
         U6NJUW+Z6s6iR7L82IGAJydvB4QDCGN3qje4B9kgR51j/JeMg31eUP+sN93uhCU2OmWJ
         0CfPGtSt6aokyDPvrN3Yh48VvCwPet4YXjEi5PKTlzieFrh+6Gd8qw34G8vGJL6CnRmd
         R+irrdFfY9Jh6izyeRZeaWH/Cym6z9LCWvjEEWNZKaSDScJ5oF3j1pQIebXTUZpJ5IdJ
         aIUA==
X-Gm-Message-State: AOJu0YyQF5i2uicaws26z53Z8zLPX+UdKv5ne0zXQiSZ55PD2ot5FUw/
	eW50fEnmtIcPUPEkagMNd2phUjdUu15W4Y8LM8Q8tCkT2Kz5UckorEi1yR4xsnE=
X-Google-Smtp-Source: AGHT+IE9Y0aDThi0m9FCFrZ2H0WgSTwbVQ87NKAxgxch35L/9BGa6QjKFs3y3Iq6+Fc5CS5VDIsL4w==
X-Received: by 2002:adf:f045:0:b0:33c:dda0:769f with SMTP id t5-20020adff045000000b0033cdda0769fmr1309649wro.31.1707900264940;
        Wed, 14 Feb 2024 00:44:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdI49F1wLkvPpe1eeM7hCZ9ooqpYJNUeF9/P4R+2xyjXh+U97RIFK1/yqqldvbX443WJz0H3+whFgrPSpbpnN7qKl0/xvCX9MWRexo9LttF3GNs+3mmjpB3N2rrNQ+KevxVfruRtikGlPzl5Wm/EYEJlFGgpiVc9iIVp/TRhvNAF+v0Tz5fjmdMuIEoQCMSgdd7PTLIVEkQq8G1GSKzDeQTHPS3OdVH3xMN6VNMMbHBMQZV8bYrsKZQT2t9PbzVjIUBBtA1Bma/uOrNOlXeNlqmlSZEoYeqM4LfnV60YkhGA+Jwe9kVjsjHcsTwNIEqL48fAiWt1YTpgGZFzWnmTFMf+aD/kcrQUo/cc2VWDzXFmoWWybfDmxkOtlv4/AnJln5EUiYQu9WUutWu1z+TxtTi4mqjp1c99uaSGwO
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:cfee:a5b6:1f9b:9c9b])
        by smtp.gmail.com with ESMTPSA id fa1-20020a056000258100b0033b79d385f6sm9494731wrb.47.2024.02.14.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 00:44:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Mark Brown <broonie@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH v2 2/4] gpio: cdev: use correct pointer accessors with SRCU
Date: Wed, 14 Feb 2024 09:44:17 +0100
Message-Id: <20240214084419.6194-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240214084419.6194-1-brgl@bgdev.pl>
References: <20240214084419.6194-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We never dereference the chip pointer in character device code so we can
use the lighter rcu_access_pointer() helper. This also makes lockep
happier as it no longer complains about suspicious rcu_dereference()
usage.

Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202402122234.d85cca9b-lkp@intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9323b357df43..85037fa4925e 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -206,7 +206,7 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 
 	guard(srcu)(&lh->gdev->srcu);
 
-	if (!rcu_dereference(lh->gdev->chip))
+	if (!rcu_access_pointer(lh->gdev->chip))
 		return -ENODEV;
 
 	switch (cmd) {
@@ -1521,7 +1521,7 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	guard(srcu)(&lr->gdev->srcu);
 
-	if (!rcu_dereference(lr->gdev->chip))
+	if (!rcu_access_pointer(lr->gdev->chip))
 		return -ENODEV;
 
 	switch (cmd) {
@@ -1552,7 +1552,7 @@ static __poll_t linereq_poll(struct file *file,
 
 	guard(srcu)(&lr->gdev->srcu);
 
-	if (!rcu_dereference(lr->gdev->chip))
+	if (!rcu_access_pointer(lr->gdev->chip))
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &lr->wait, wait);
@@ -1574,7 +1574,7 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 
 	guard(srcu)(&lr->gdev->srcu);
 
-	if (!rcu_dereference(lr->gdev->chip))
+	if (!rcu_access_pointer(lr->gdev->chip))
 		return -ENODEV;
 
 	if (count < sizeof(le))
@@ -1875,7 +1875,7 @@ static __poll_t lineevent_poll(struct file *file,
 
 	guard(srcu)(&le->gdev->srcu);
 
-	if (!rcu_dereference(le->gdev->chip))
+	if (!rcu_access_pointer(le->gdev->chip))
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &le->wait, wait);
@@ -1913,7 +1913,7 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 
 	guard(srcu)(&le->gdev->srcu);
 
-	if (!rcu_dereference(le->gdev->chip))
+	if (!rcu_access_pointer(le->gdev->chip))
 		return -ENODEV;
 
 	/*
@@ -1996,7 +1996,7 @@ static long lineevent_ioctl(struct file *file, unsigned int cmd,
 
 	guard(srcu)(&le->gdev->srcu);
 
-	if (!rcu_dereference(le->gdev->chip))
+	if (!rcu_access_pointer(le->gdev->chip))
 		return -ENODEV;
 
 	/*
@@ -2510,7 +2510,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	guard(srcu)(&gdev->srcu);
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
-	if (!rcu_dereference(gdev->chip))
+	if (!rcu_access_pointer(gdev->chip))
 		return -ENODEV;
 
 	/* Fill in the struct and pass to userspace */
@@ -2595,7 +2595,7 @@ static __poll_t lineinfo_watch_poll(struct file *file,
 
 	guard(srcu)(&cdev->gdev->srcu);
 
-	if (!rcu_dereference(cdev->gdev->chip))
+	if (!rcu_access_pointer(cdev->gdev->chip))
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &cdev->wait, pollt);
@@ -2618,7 +2618,7 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 
 	guard(srcu)(&cdev->gdev->srcu);
 
-	if (!rcu_dereference(cdev->gdev->chip))
+	if (!rcu_access_pointer(cdev->gdev->chip))
 		return -ENODEV;
 
 #ifndef CONFIG_GPIO_CDEV_V1
@@ -2696,7 +2696,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	guard(srcu)(&gdev->srcu);
 
 	/* Fail on open if the backing gpiochip is gone */
-	if (!rcu_dereference(gdev->chip))
+	if (!rcu_access_pointer(gdev->chip))
 		return -ENODEV;
 
 	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
@@ -2796,8 +2796,7 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 
 	guard(srcu)(&gdev->srcu);
 
-	gc = rcu_dereference(gdev->chip);
-	if (!gc)
+	if (!rcu_access_pointer(gdev->chip))
 		return -ENODEV;
 
 	chip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
-- 
2.40.1


