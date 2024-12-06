Return-Path: <linux-gpio+bounces-13578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AF09E695A
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 09:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD9F167117
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 08:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDE51DF260;
	Fri,  6 Dec 2024 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="BKG8poyB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B551B4122
	for <linux-gpio@vger.kernel.org>; Fri,  6 Dec 2024 08:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475225; cv=none; b=c0y3LDbFHumnZXlGAoW168xs76eywVEo/WxL/fBlkQHxmJifEhblDY+BzTHQnK6OGyNBi0ckQrVLY1b0R9ZXjO3/nMh898uo8SKjiCsM7WT7y77M0YUgYRs8qwMLJTvVXyBfZi6SixXazQumFxwB019H9+s2LN5QA0ieDE7plA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475225; c=relaxed/simple;
	bh=t0/VBvD3rdSDxVTKA+7nMN02ROISkvij/W4aWUZq4gU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Uwm+jBCFZx6uZKM6dOXOz5s8J2/PoorNYcoB91/+qXU3mXxtNXv+IV606EPrnxi3pqv6ycx+EdVJlvb9scEqBhUR+2BmVR2M09kMoGr6uPbLE9ifOcnzAi5qKt+fp6O0HepXSGKxMIhsNnn7sXQT5d2yaBGAu6d+6rYyNdkrhK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=BKG8poyB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7252fba4de1so2108422b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2024 00:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733475222; x=1734080022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SSx0iU8AZVFxgEhSh4OGQj5t8XTi7HLnIrDdn6XhyaA=;
        b=BKG8poyBE2sg+YF1t0F07vg3wSxa7UBr3hRZ1mriJPJqVdGTSg93GSUhGoL9AVE5Kv
         2+d010XqkiLO7sYDDyRzxQo3ddwqLzVxq/m6VzgIvbv87+ZDQ1rimM0nT3SNur/ZTO2V
         Gsku5tbs4gEW4klPrihyZRREmDZ9QCUIngOmLCnvsey1YcnmY08qEuiadEcuaN2OadLS
         M9KtVEUBDRDssZrWHDITGTNDbu8zNjhzG9PYOXunCG3BBXrxQWqlWJBOq/XyIdYzk/AR
         gJwRNdfA1favO71bKGfOt1YChUBmi5I+WoV+F4huzWWRnN+DQvUhP0qc5lAelQd/Wm9P
         WjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475222; x=1734080022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSx0iU8AZVFxgEhSh4OGQj5t8XTi7HLnIrDdn6XhyaA=;
        b=bmCrLwO4hUXsuDHrPH9ZvUrR4+wFuxGsANS8A9lzCksBW6go3c2qgc6+3199slyvn0
         rxh5leH2tNaJfIQDi4+aDMnx1ZolrQIdXwXui03sMkkpNdEskFp1pzjIHiFjgVNzw+FV
         RizQqdutItNWQsJDBQ+h/TgAEg/UhQ7YxWlvOt9mBIYOaJgG+iJ51xlatlo+ssFZqzFw
         q3MYGb6soPUbaLP4Jv8AnIFbWY4MGI+i/8WoHCAhQ0mBQZ55V4OBZp2hgC2gjg/wN1e1
         wRxmrbm7vTFnl/PRQKfOgIrrLQpSWnIECQGqxoRoGpsDhIutAIioXCqjdcQ9yqvrg/su
         HQ6w==
X-Gm-Message-State: AOJu0YzKVX/i4vZh1N6kNk6K8cvFAZfnntkbnWDmrLt3SyZ1s+JKJo96
	v4dquVG+4QW2ExjJGSN8fM6EFDYwPakMuqr7xMM1OIpX1fAWf83cJpmAhcRGRkE=
X-Gm-Gg: ASbGnctD8gINm/3TvCZgmzqgftSILg7AkP9OfoyzatQJ+31Xh1w0KLMjxxHCWQGV6sr
	wCxTLplMGf2FAOYbtS6RyXZ/Z+o6MTvCq5j5LjBKueny3DKPatQX87aOyTL84mnqPqaCxld0Ug+
	QguOpXznYxbQls46NgPlmuZsUxXeY96AUNlTZV8wFJURmmaKZo395K26rKlsENNs5c8fwsQUs0K
	U9VAJLc8rPaVzZSKvdC1olyBq4gQGTVJQtLJZuVSNRTIWOVlZeLg3CrW3ey8iplL5YCs5GuTqI4
	iEsv6rilJUkuSFoPM74DbhzQaODcK1dlzwrL
X-Google-Smtp-Source: AGHT+IFQL3VUoCdEYkf0khcM3yv40PU3HqIR2iDBOm8lwzdLhBjOIgL4venT7WlVQrd3ZZYuAqLgVw==
X-Received: by 2002:a05:6a00:3d16:b0:725:9dc7:4f8b with SMTP id d2e1a72fcca58-725b8158d2amr3550066b3a.15.1733475221344;
        Fri, 06 Dec 2024 00:53:41 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29e9003sm2479207b3a.44.2024.12.06.00.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 00:53:40 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2] gpio: gpiolib: fix refcount imbalance in gpiochip_setup_dev()
Date: Fri,  6 Dec 2024 17:53:36 +0900
Message-Id: <20241206085336.3246620-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The refcount incremented by the device_initialize() call in
gpiochip_setup_dev() is not decremented in the error path. Fix it by
calling gpio_device_put(). Consequently, the gpio_device_put() call in
gpiochip_add_data_with_key() is not needed, therefore remove it.

Fixes: aab5c6f20023 ("gpio: set device type for GPIO chips")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v2:
- Use gpio_device_put() instead of put_device().
- Remove the gpio_device_put() call in gpiochip_add_data_with_key().
---
 drivers/gpio/gpiolib.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb14..b3a1a6b8fdff 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -800,7 +800,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 	ret = gcdev_register(gdev, gpio_devt);
 	if (ret)
-		return ret;
+		goto err_put_device;
 
 	ret = gpiochip_sysfs_register(gdev);
 	if (ret)
@@ -813,6 +813,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 err_remove_device:
 	gcdev_unregister(gdev);
+err_put_device:
+	gpio_device_put(gdev);
 	return ret;
 }
 
@@ -1124,11 +1126,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
 	synchronize_srcu(&gpio_devices_srcu);
-	if (gdev->dev.release) {
-		/* release() has been registered by gpiochip_setup_dev() */
-		gpio_device_put(gdev);
-		goto err_print_message;
-	}
 err_free_label:
 	kfree_const(gdev->label);
 err_free_descs:
@@ -1139,7 +1136,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	ida_free(&gpio_ida, gdev->id);
 err_free_gdev:
 	kfree(gdev);
-err_print_message:
 	/* failures here can mean systems won't boot... */
 	if (ret != -EPROBE_DEFER) {
 		pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
-- 
2.34.1


