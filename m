Return-Path: <linux-gpio+bounces-3229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C956852C40
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 10:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11DF01F24431
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 09:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A561225CD;
	Tue, 13 Feb 2024 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WpKIVIci"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F30A2232A
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707816677; cv=none; b=mVOmu94xl9IRaSWLopeUrjeM0psdJjfa251TaBxnWGuD83PbzXVly8aKvezh9pBb59Jkdua+lMKPGLEADfrjA/Bkg+pcENCTd9f5QnjqJAepkNHo68Y0TIhY4pCVxf+2D9ouJ55c1Nt4QMiWxAg+LSHbY1GBywxRABgSBnScxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707816677; c=relaxed/simple;
	bh=uiPH+suZkaL06kXCeEFh77vFLZuPv8neSgnWiG0ld20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hnpy73Xvb2wrLawNs31bRoR1MCmk3i+jGZ90y3RzKvO4RVEsRER4veP0HOqjaEQ5X7tjTlKjxU4RBJyNnuwSx6N00eI3SlCOe8jRUagtZhZNOMF+SDmbvkoewBcWRTE2zU18D4lUhDCYcAdxSNpdZh6B5yRj9CxMeMEL/bdJpLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WpKIVIci; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33aeb088324so2618904f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 01:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707816674; x=1708421474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9rnJQl4J3fWPBLaleaIS+OzS1vPICPuUXU9m4u+NCg=;
        b=WpKIVIcib8yds1G66N1njlEXgqIQXVLUGvPxVnaXRmVCT/74xGyCRA/szo0W1Azpm8
         QhbJ60/UBxWUL/+uBJsNfR7W5nU2MXHk4POPaYcJUxmrgliXyeLJhAjq8/ynRb3udhYk
         qr5Tu+3P79rRVV6JE/Qb2toEBMDt+k8eWPx17/Vh3nDerXOQYWJ6u1DNNXP6JQUWJKo1
         SPpyKJuuAou3cuQk5LCdUF6XD7jUI2v1GUKUunxQj3IyPSXgNHuZ6X57MNQxizgADXzf
         27p1sIyeLYjqdCFttUoGJj1rzxQs/wGmYJ08r81D5hjpWgGBAX//ULFGL3xlftF0PzQN
         j+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707816674; x=1708421474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9rnJQl4J3fWPBLaleaIS+OzS1vPICPuUXU9m4u+NCg=;
        b=hjF2zUq754+UT2YoZ0qW7MapHvLV2w8wdpHC4b00e6OgisWLizkiklrP68po7nOoQ2
         VlJ8EiZ/qOL4SAIeHqwS7lJMOU+VMWTzr295NiCkBdVjDMxzhkFcu0lhRfEoW+ZaEKoX
         xl1iNEdQ69pCQ2g7x5afgOZA+Rv7zb+CyHOWKkqepjSe0xy10kZn1ofrJd2SYcgI7wJh
         sF7sDW+OEF4hZXOyh0R05cjIZ0dgJFFDvUdZEPCPlIgXo7L0ATgszCltPaCPydBTVIcx
         lcM6H/qDX5UzgsYlJin9qWC8UHZ4W/JaiPGS++N+dGxXiVUPl0ryJe9hRr81sayP3yZk
         V00Q==
X-Gm-Message-State: AOJu0YwYwS6NKcT7oGhUmLP1mY7oBQ30ghXqbSMwiF6xoJidXi4ofUft
	93Rt7OWeM9biQDg+xEpw+LpE1V/dy7a8DpPPWfW6tasEdgnwdUoGlQxtXHW+pvY=
X-Google-Smtp-Source: AGHT+IHA8NduFh3S0lW3tT7CCz4qthUUvzFX/CHmspOBiF1yPKgUnBDscsjoDwIF9SDv6oCR4WUH5A==
X-Received: by 2002:adf:e605:0:b0:33c:d310:73cb with SMTP id p5-20020adfe605000000b0033cd31073cbmr1260297wrm.19.1707816673613;
        Tue, 13 Feb 2024 01:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCpzhdCyVsckx1DwQw+DQV3V0HJyofMCefoCgiQb7HwsBF6O+zIxb4U1RLfjD2YvfYXlQ0dQ2jcon/2CkK7mg6W2SEkeJKlIA3x/GLpEPJoE0UGPGcS69TncKIH73+GvG8mMPdsrtmdRBBt2/h4ZQaeu3sQ0mbUI2RJhzIymYrJr72dX3QRHaJV+JexU5my0a0LYSjUJB21OiGO26MsnRbkFDY2QnxJFgJgKtbVFRKLloC3BwIOQ5RZN+fGl24oVazKyLLMgnVANibhoscJ9YgUfDuNLS6DgxQmBEJXzEnaOWk0gleMpxIR+jOFt5UXPlN3BtIlG9A7q5UTzN01OZsfejXu0hTxvLvOjbAH1s=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f634:2e37:58a9:242a])
        by smtp.gmail.com with ESMTPSA id p16-20020adfcc90000000b0033b2497fdaesm8980897wrj.95.2024.02.13.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 01:31:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH 2/3] gpio: cdev: use correct pointer accessors with SRCU
Date: Tue, 13 Feb 2024 10:31:07 +0100
Message-Id: <20240213093108.13922-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240213093108.13922-1-brgl@bgdev.pl>
References: <20240213093108.13922-1-brgl@bgdev.pl>
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


