Return-Path: <linux-gpio+bounces-2758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF15842570
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C877C290459
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3B4129A96;
	Tue, 30 Jan 2024 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E1B5pRhT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A385C67
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618942; cv=none; b=rG4t5jt65aHT6jgHRECIL7YAUBnVW9zSID37tUm7iFYBA7i9dtNfOWhDyhwQITBUIYs4MSzC5Txet7w0g64T+Uo6qzXSu7gTZGOIBjeUWUVtVPnsm1KvGujhaxefDsC8+/nlqq6GYRIwDy5m4g9TfoZAXhJjPWZGQxHagUhRH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618942; c=relaxed/simple;
	bh=NosIOSR9EGZn560P0ZTp1PVnn4+xrJWxneSp9stTOR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HZHlUenYgPBPNlpTw/DTLcpV7SxosPcSxrkZ7lxuPo5m7tUPFapDeRUo0WrqndNVSx9khXefK4xtnIrqcLU7VIngzkOBGMymoLCAUqYsEo7RFRHFBc7Z/fRb1EAMXefS3M6oWywU6QOcWxedxFXz04IYFaOfKPGOJYB6ZkXFDVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E1B5pRhT; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d043160cd1so26991251fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618939; x=1707223739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/WCN7qW7abrvx6z7bIWBilX6QazDAzU1beJfcZqCC4=;
        b=E1B5pRhTIWGMAsgZRePl2KpV4rIog2LUzg3jDhAR3nNel60yURGCBXJskkeZrP++7B
         uYXr4xuNf6XyWtWCK4wopK6zAlTVk+aoIeLXWTlKKFMzRf0DYGPfEKRJ/0UYx4qg+ZC6
         tgouwJzzzJa6JQRycsIz5YEk8NMQVzUe3n2uPd2WbmTa1Sj7GOIjsXzNSx83fISWTNwW
         IlECHQMFac9k9ll23xl35iL3YynsL5qxFqUqnIU6w/L/sNK7C/Rv9kd0wGw6ArNizdPj
         /pAWFLievXFWGq5Qdk6jF//FOHiRVk37CQnxtMTLWp3wxreyrxMyRBkXnHQPYhLtnv1o
         rMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618939; x=1707223739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/WCN7qW7abrvx6z7bIWBilX6QazDAzU1beJfcZqCC4=;
        b=dqlT5HHTb1RvJhFZJyJl78vial2YYafDSdgFVB6/mW2Ixw6Yvhv6TtdEX8SZ4Gk6L2
         BO4kc8R9V7CuHCw+LcCKrzC9DefUmMgaIWwIZCrngghk38KAJdZKSW8K/DsTyhM9XWuG
         F7xb/l4BsOeI03nMn6YHKGDFw8fSOItXZX8V/ebXQAKYWQzUuMTR8rIDkr/Hf0KJHRZp
         zu3yvf7D4AcbfzQpfZS9ZBHJD7fQ7S71mRMidGc8Zjvrykxz4p9ywuXDyvMksT0HCpk0
         Mh2btlx8mm/fTRrtpJI39Ypi7H2l+PtgQzYqlB00rzn+UIhS5B6DcBK3EGFYfXwiDncv
         jgsQ==
X-Gm-Message-State: AOJu0Yx7MJslDeJp8v3L7Oux7mMYnYxB3EwfpPmjYFfXo8Vv3uRRh5AG
	oSj0PK3RyX2GrQ80ZoZaBc5oWo7mmgm045nC5evMnYgHI5yu26dwuISaSL5oeII=
X-Google-Smtp-Source: AGHT+IEhH4/llmZp+qoIy6sox/C+iLeZyuce7r9fhTsdCSmoE4eBayRbPBbS1a1+/cs1gMVNswN5Ig==
X-Received: by 2002:a2e:b60e:0:b0:2cf:2a8e:dd43 with SMTP id r14-20020a2eb60e000000b002cf2a8edd43mr4934668ljn.7.1706618938947;
        Tue, 30 Jan 2024 04:48:58 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:58 -0800 (PST)
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 21/22] gpio: remove the RW semaphore from the GPIO device
Date: Tue, 30 Jan 2024 13:48:27 +0100
Message-Id: <20240130124828.14678-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130124828.14678-1-brgl@bgdev.pl>
References: <20240130124828.14678-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With all accesses to gdev->chip being protected with SRCU, we can now
remove the RW-semaphore specific to the character device which
fullfilled the same role up to this point.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 1 -
 drivers/gpio/gpiolib.c      | 4 ----
 drivers/gpio/gpiolib.h      | 5 -----
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9aaddcc08e29..be0a3f591af4 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -24,7 +24,6 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
 #include <linux/rbtree.h>
-#include <linux/rwsem.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/timekeeping.h>
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9990d87e32fe..5741bbfdc178 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -955,7 +955,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
-	init_rwsem(&gdev->sem);
 
 	ret = init_srcu_struct(&gdev->srcu);
 	if (ret)
@@ -1094,8 +1093,6 @@ void gpiochip_remove(struct gpio_chip *gc)
 	struct gpio_device *gdev = gc->gpiodev;
 	unsigned int i;
 
-	down_write(&gdev->sem);
-
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
 	gpiochip_sysfs_unregister(gdev);
 	gpiochip_free_hogs(gc);
@@ -1133,7 +1130,6 @@ void gpiochip_remove(struct gpio_chip *gc)
 	 * gone.
 	 */
 	gcdev_unregister(gdev);
-	up_write(&gdev->sem);
 	gpio_device_put(gdev);
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index c96afc800bea..c76acb8f95c6 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -16,7 +16,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
-#include <linux/rwsem.h>
 #include <linux/srcu.h>
 
 #define GPIOCHIP_NAME	"gpiochip"
@@ -46,9 +45,6 @@
  *                       requested, released or reconfigured
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
- * @sem: protects the structure from a NULL-pointer dereference of @chip by
- *       user-space operations when the device gets unregistered during
- *       a hot-unplug event
  * @srcu: protects the pointer to the underlying GPIO chip
  * @pin_ranges: range of pins served by the GPIO driver
  *
@@ -73,7 +69,6 @@ struct gpio_device {
 	struct list_head        list;
 	struct blocking_notifier_head line_state_notifier;
 	struct blocking_notifier_head device_notifier;
-	struct rw_semaphore	sem;
 	struct srcu_struct	srcu;
 
 #ifdef CONFIG_PINCTRL
-- 
2.40.1


