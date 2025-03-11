Return-Path: <linux-gpio+bounces-17425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C1A5C261
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EAB816F6F0
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 13:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59791CB9F0;
	Tue, 11 Mar 2025 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SlxgaIk0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A61E1C07F6
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 13:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699190; cv=none; b=fZPuyEOQ6KMblteL+5hpr+fov8bF/O7VaYyVBgHQH18BtmEN+IqNBt17096XDGLx8Jjp/jwFIbgf3bT9umTk0h3hVosnTjShxc1/XoXk355o7P0jNHenEbLDhgtTIi1lmYLf7/26LoitpbPf7kR8gnxWemQLiUJH3H47FF0rTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699190; c=relaxed/simple;
	bh=vG7eBRv/ccCfwHTcm1AHtYTQocnMKcAiBrEKBjJJMcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lS97SqNVf13UM4+dBZ5dOafu2bT2ID0dFh9ABxicnc3JZTGOiTo+6Ft/Sd0Nx4RTqexvF8UsZGA1QUEPTZBmZCLTBBUVn9MFJ3dcdnCCg2J1HxG/AVUHYT+ax22qAOxV1OLcrjmuCANTmM2VD4V/8zY4DimwYMX08yF7jgpbzMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SlxgaIk0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390fdaf2897so5230612f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741699186; x=1742303986; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9lXghsmNN/zGJJ68TkecAOvhL6ckZsZqtzgDD+WPTqk=;
        b=SlxgaIk0jTjpZvVVH1Byb8qZx1+72a5bsOKiFbN+XqUT8v/URaZxWvCZKLIKtEXgLO
         s21QuTEQOrIMuAVMbANKh7A4TiifTSBTWUa/mcN7Km1k2snLde2MS3ceYUxNBSLS/RaT
         Mt8M+JPYAZ0FkeitiWisvyXzHJI9T+1Hb62n1zHu0JDQdyGc4cWgy80XeMjkxfiIakxO
         dgL2ImEnMEnw+yFe9FAwW3DnbZAdSnyqFV9lxIM0vPeqUbwqPxnRcYxayBtJC6uKsSM1
         jfyd6aKay7FENijh/tRPGlJdNu/4m2nLwTf0HPe+e5gzrPDjCwnn//O/Vquu+sr4sPDv
         pmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699186; x=1742303986;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lXghsmNN/zGJJ68TkecAOvhL6ckZsZqtzgDD+WPTqk=;
        b=osgfbu/CPy6S+zxTyYGRVY0yuGpctfVPeZr2YOqvrIkYm6D3tDUOE2a6ZltWDIeXag
         BYIpF3+c05YnRMgFxNDLO1D4rs18YfaigDp0usYOVcBon9D2NUTLVG6Dr/9RF7pLHdvi
         awgqPP5gJA5Akatn+UjWdCL4ZJwWo49Dd3aZA/uVMI2COgJ3veDwDyFYAxubnVjxmpMY
         ff6ucKd3+NTLuzmA05ROG34Em6vA7lq5fI6/QsYAcAeSes7Ketgny0sRPeV2xH+jpZ4j
         AEK8nyJyMfDLPIPlD7CZl8z1Eyo4o0CRdNLhcVk41XSvxt5AjthDiULahJiszJTX8a15
         jMAQ==
X-Gm-Message-State: AOJu0Yyy6wmQ/l6qO6cKiq4FgQq+4Icvbsv2QLIVMPU55vgeAWvqk7PU
	1hcOZtktlRPeQ2CVFSFYl8hRFwlxcNxWgdUL7zZAtVvuroC/zqnUYJ0F2rCQnQV3xcXF4yHzMgv
	u
X-Gm-Gg: ASbGncv2bJF5mXToCGyTtXH9ErZbaK1wKxF0ciiXvlgGnKbBKDdlYr3xeWrVILYWhxV
	ZyU6/nYQANd1c/sVaaIzCBZ7xrPjzEaku9je8OtqaZfdPVVJzD9kEbnXaqh8qpiVzyt5b7JUSu7
	9AzeMBYSHaR8VdhKjC0hgGRrr+yeG89tGvpo93e0X14ECa0zDpi8e8ai4Ejiz4SxuzjLtzjpKJr
	rb13zR3rq1pLiFoH5AhyorYlliLAjgoq9tJmJ7fmfl45VG+yIHEM/GRDySz4C4rL2kCY2Dsmap4
	aH/iw7EI7XofgwU2Zh2lmGvmkE+1J/0wCAS1DGtZ1jatqlw=
X-Google-Smtp-Source: AGHT+IHMhJSvBzNMYDNcuoaV5+vI0b1ZCEt6vyNjXXOYRmnHOjjiqV1Shvc0JxymYXZADTdfnZMNYQ==
X-Received: by 2002:a5d:6d83:0:b0:390:e9b5:d69c with SMTP id ffacd0b85a97d-39132d5670bmr19404738f8f.25.1741699186279;
        Tue, 11 Mar 2025 06:19:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2f44sm17905976f8f.76.2025.03.11.06.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 06:19:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 14:19:40 +0100
Subject: [PATCH RFT] gpio: cdev: use raw notifier
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-gpiolib-line-state-raw-notifier-v1-1-d0fa44fd67cc@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGw40GcC/x3NQQqDMBRF0a3IH/dDokixC+gCSmfSQdSnfSCJJ
 KEtiHs3dHgm9+6SEIkkt2qXiA8Tgy+wl0rGt/MLlFOx1KZuTWOtLhvDykFXemjKLkOj+6oPmTM
 R9WpG66YGXYdBSmWLmPn7H3p53J/yOo4TwpmXJXYAAAA=
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, David Jander <david@protonic.nl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q095KmTsuhU8b8iNqO5QXnhlegTniJ/HjzRP96SyJWc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0DhxSmnB9mA4lRT3/NSsBvOLuGcPHx7ozrXgR
 1zxSlDAeT+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9A4cQAKCRARpy6gFHHX
 cuqPEACpxq6YgHUIAaZ/NmbkOqzCS11RaUi4c4k8kja8t37GOFVWekYySbuU7RrpFFotVwYksHg
 rRP2cDI2KMMu9PzuLnN8EV3SlZRfPYWxX/5CIBSm6atGP7yZMFGTagGIPe1DEDHkwXiXUt71HKe
 e2Bt3XSOXmkFVUG20DyxAgjgup4TmEEVL9BvcbNBqMdmpPH0ftU7gXNEAXnhBCAC3R24vxGT6Q5
 HGlNX8vCYOrzCFCbTsG1jhvPIPNTX95R4dhDVFcLhUqfMAt408IxWZArow/R0W/5YR3zpULCU03
 +jpx6J3FHCi1ISRG3RapANfBwnUQlMTyppFiVgSe7OCWnfuKeMq+Dh4b9PxC5giKzob7yqI3FJP
 ow0XPVHCAubQlKKH/fc/c+xTEo4hvI5uNc6zq27/rbyTPkXeMbZcL7YgCNIe8lcStmJBqEcZw6+
 UdlvmUvqZbCbPTfdPf9btJDf19Mi+J55qJRJSMCvr1vLVD0FRDpyCq4qXImVdFfZ6nPNQZNjDab
 uJAbGHkYGjep5sXZlu8+0ujqrVJ4hOaQ0SpYkx9yamJqL/pexdw8gjTo1H0o5jv7Bra5IXVsNBf
 26KM7D/5MPc6rYrge2h6OuSWy7+Mi2/7U2Cp4Dfma+iJFl+wvvwZGd/OhzF4y5HMYO2GYQkaWwR
 0380PD7jc8wBSQA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Atomic notifiers call rcu_synchronize() in
atomic_notifier_chain_unregister() causing a considerable delay in some
circumstances. Replace the atomic notifier with the raw variant and
provide synchronization with a read-write spinlock.

Fixes: fcc8b637c542 ("gpiolib: switch the line state notifier to atomic")
Reported-by: David Jander <david@protonic.nl>
Closes: https://lore.kernel.org/all/20250311110034.53959031@erd003.prtnl/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 15 +++++++++------
 drivers/gpio/gpiolib.c      |  8 +++++---
 drivers/gpio/gpiolib.h      |  5 ++++-
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 40f76a90fd7d..107d75558b5a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2729,8 +2729,9 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	cdev->gdev = gpio_device_get(gdev);
 
 	cdev->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
-	ret = atomic_notifier_chain_register(&gdev->line_state_notifier,
-					     &cdev->lineinfo_changed_nb);
+	scoped_guard(write_lock_irqsave, &gdev->line_state_lock)
+		ret = raw_notifier_chain_register(&gdev->line_state_notifier,
+						  &cdev->lineinfo_changed_nb);
 	if (ret)
 		goto out_free_bitmap;
 
@@ -2754,8 +2755,9 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	blocking_notifier_chain_unregister(&gdev->device_notifier,
 					   &cdev->device_unregistered_nb);
 out_unregister_line_notifier:
-	atomic_notifier_chain_unregister(&gdev->line_state_notifier,
-					 &cdev->lineinfo_changed_nb);
+	scoped_guard(write_lock_irqsave, &gdev->line_state_lock)
+		raw_notifier_chain_unregister(&gdev->line_state_notifier,
+					      &cdev->lineinfo_changed_nb);
 out_free_bitmap:
 	gpio_device_put(gdev);
 	bitmap_free(cdev->watched_lines);
@@ -2779,8 +2781,9 @@ static int gpio_chrdev_release(struct inode *inode, struct file *file)
 
 	blocking_notifier_chain_unregister(&gdev->device_notifier,
 					   &cdev->device_unregistered_nb);
-	atomic_notifier_chain_unregister(&gdev->line_state_notifier,
-					 &cdev->lineinfo_changed_nb);
+	scoped_guard(write_lock_irqsave, &gdev->line_state_lock)
+		raw_notifier_chain_unregister(&gdev->line_state_notifier,
+					      &cdev->lineinfo_changed_nb);
 	bitmap_free(cdev->watched_lines);
 	gpio_device_put(gdev);
 	kfree(cdev);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5eb3f0ee071..b8197502a5ac 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1075,7 +1075,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		}
 	}
 
-	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
+	rwlock_init(&gdev->line_state_lock);
+	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
 
 	ret = init_srcu_struct(&gdev->srcu);
@@ -4361,8 +4362,9 @@ EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
 
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action)
 {
-	atomic_notifier_call_chain(&desc->gdev->line_state_notifier,
-				   action, desc);
+	guard(read_lock_irqsave)(&desc->gdev->line_state_lock);
+
+	raw_notifier_call_chain(&desc->gdev->line_state_notifier, action, desc);
 }
 
 /**
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a738e6c647d8..58f64056de77 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -16,6 +16,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
+#include <linux/spinlock.h>
 #include <linux/srcu.h>
 #include <linux/workqueue.h>
 
@@ -47,6 +48,7 @@
  * @list: links gpio_device:s together for traversal
  * @line_state_notifier: used to notify subscribers about lines being
  *                       requested, released or reconfigured
+ * @line_state_lock: RW-spinlock protecting the line state notifier
  * @line_state_wq: used to emit line state events from a separate thread in
  *                 process context
  * @device_notifier: used to notify character device wait queues about the GPIO
@@ -75,7 +77,8 @@ struct gpio_device {
 	const char		*label;
 	void			*data;
 	struct list_head        list;
-	struct atomic_notifier_head line_state_notifier;
+	struct raw_notifier_head line_state_notifier;
+	rwlock_t		line_state_lock;
 	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
 	struct srcu_struct	srcu;

---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250311-gpiolib-line-state-raw-notifier-70c1ad3e99eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


