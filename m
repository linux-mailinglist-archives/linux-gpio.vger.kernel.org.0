Return-Path: <linux-gpio+bounces-14328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 886599FD8F2
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 04:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2356E16396E
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 03:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFCD339A1;
	Sat, 28 Dec 2024 03:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="swKAMGa8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F046C635
	for <linux-gpio@vger.kernel.org>; Sat, 28 Dec 2024 03:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735357696; cv=none; b=m1blhsIlP4oZ6TOOusz7oZwvj6raJjdwBw0qdL1ZkDnQQvYQe7ew5stgF66RAFUSvZcDrsGWiMR/kvCG9pN/OgMDCLG+EfecGShCy3Xg1x7w43jsyHUObPrEbfVKa5yFqU04WimB9/a1rvmdZwjvDHbOit4CW1PY/dBgOvTzE3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735357696; c=relaxed/simple;
	bh=iGpIzIUrx1AyNn3cgMqWuRUWhy5NzSWA7A77jQQJ9rw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=foWyn/l09ygXDJsspR/VbMOR7CbFhZ0OT3hrDvJWFuuAG1LSnZw2EBVm3NRPj7iihURu/fGUYJQk/9LedrpcDkmwZlPWJRwBqVQzIfa1lx0B1v04M+aY3LkdG8/bQWKDI8z4v0bRSK8V6U/MDc+n8w5CqnRORwZmhSzAxv0XlrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=swKAMGa8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21631789fcdso74297185ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 19:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1735357693; x=1735962493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ULzzxDnJItvwKbweubYfkREkRTesLqk+UIAXCVxVM4=;
        b=swKAMGa87H5L/x4FClh34B5DOMElyvTEVy/gP5CjMxBKmoYNlW+UEPWUhHBvBI/k5x
         c4nrBB3OBBLZZ2xBE8gTVndiQqbB25cRgtK1kXH+p5zwPwTiCcgKMetzvxDgt/dkeZOH
         7Y5HsVPtoOZFykh5jR56gqhoA7uLaCBk9SiRskQpCTNML7Vt22GDorZ/HYZV/72zbIvc
         Pt64tIiwD4JwANvAycBB6jXZE7ba+QIIF/9vGs8MIRGi5d5W8JCfdRetxDr6zSShcGhq
         cdwkuOapzNWPmIrsd9IHGzbjAggF4+BcCwx4wIcwXe/a99vOsDbr75VKcpZkezAD1gyr
         mvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735357693; x=1735962493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ULzzxDnJItvwKbweubYfkREkRTesLqk+UIAXCVxVM4=;
        b=uukFvIvCbbskMbi1LjVamG4Ox9fgBzDRIecGfWfiXSNCdgpTN73Zx6QV2rBKfRiyVP
         XgjTQdibNCDyqIv2lFBcdnU1V0oDp0O/L8JJNpz1PKp4CFgTPOeJM5f57JTnEt04N6AS
         qU+rlqh+uoH7th/gjeGnj6eLHswPk62Pm+eZFlViRzCvBf1oNFhLWISqmjGepgLqRBdh
         URZPZPOg+RlyHf9YUOk/8fuwvSAE8ALHMtJLRzJBB09FFvaB/r70Fk5vJa0ZdB60r2sN
         bZWvbMonZ3109ZbZvAjkZgf1r8x4BkKubQiBmQNvqsxdM5OiZWDql29U3aH7Chq+Y+EC
         aefA==
X-Gm-Message-State: AOJu0YzaFKnMWyTf+L0tWuXnBIzjzzNEqC4LDhTz9hX3Y9JYY5OkHkQi
	QtiJTMFt3tGVngxRn7h9NaINtU624GM8xzFA7WKYdXKrys3V9QWxUwDzwCcQqdraAY8koNFoQzr
	TaAw=
X-Gm-Gg: ASbGnctEdwVlUYBFbg30Sl3VMckbk+sPp0S7mtXrWwiB59D6ck2pK3v8FyUy6j3BLZ+
	ikZhT9aihyjJaJG/aaBWQoJtfuQwMENFyIfjHDe0iId4pxzeHvV9EVgG3DrODpRdG5vRLxe52Zk
	5N32mcWihvQea70GfroYhSQ9LcKMWRy4m0Ab+cjfFqsDOqIE0F97JxoNLpUhawJzCRz1dulAPYO
	A2XN/s+HbdR/hCg6ZjnZGVBvSLo0DLDKJrca0qS9P0tsl8/eeoz0sbpy2sSqU2Jsx8+0cjkH2bK
	E5CvJPVu3JT0MkNn8nezW8Zvet/3FEAI/mKFl/lqOgg=
X-Google-Smtp-Source: AGHT+IF1WnM36FauRiXhLmgRDwu5eoPo5R19GxLErDi5tw9XqxObaL1OyjBKj6XrcDAaqR1DSLONeA==
X-Received: by 2002:a05:6a21:3989:b0:1d9:a94:feec with SMTP id adf61e73a8af0-1e5e1e0460bmr48764201637.2.1735357693093;
        Fri, 27 Dec 2024 19:48:13 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8162efsm15794388b3a.25.2024.12.27.19.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 19:48:12 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] gpiolib: fix the error path of gpiochip_setup_dev()
Date: Sat, 28 Dec 2024 12:48:08 +0900
Message-Id: <20241228034808.1831644-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpiochip_setup_dev() calls gpio_device_put() on error when
gdev->dev.release is set, but this field is always empty as the cleanup
function moved to gpio_dev_type in commit aab5c6f20023 ("gpio: set
device type for GPIO chips"), resulting in a memory leak. Call
gpio_device_put() at the end of the gpiochip_setup_dev() to trigger the
resource cleanup, and remove the GPIO device from gpio_devices. Because
of this operation, gpiochip_setup_devs() may modify gpio_devices, so
acquire a mutex instead of a read lock.

This bug was found by an experimental verification tool that I am
developing. Tested the behavior with gpio-sim and confirmed basic
operations on GPIO devices worked as intended without any error logs.

Fixes: aab5c6f20023 ("gpio: set device type for GPIO chips")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/gpio/gpiolib.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb14..1f612a54a475 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -784,7 +784,7 @@ static const struct device_type gpio_dev_type = {
 #define gcdev_unregister(gdev)		device_del(&(gdev)->dev)
 #endif
 
-static int gpiochip_setup_dev(struct gpio_device *gdev)
+static int gpiochip_setup_dev(struct gpio_device *gdev, bool locked)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
@@ -800,7 +800,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 	ret = gcdev_register(gdev, gpio_devt);
 	if (ret)
-		return ret;
+		goto err_put_device;
 
 	ret = gpiochip_sysfs_register(gdev);
 	if (ret)
@@ -813,6 +813,14 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 err_remove_device:
 	gcdev_unregister(gdev);
+err_put_device:
+	if (locked)
+		list_del_rcu(&gdev->list);
+	else
+		scoped_guard(mutex, &gpio_devices_lock)
+			list_del_rcu(&gdev->list);
+	synchronize_srcu(&gpio_devices_srcu);
+	gpio_device_put(gdev);
 	return ret;
 }
 
@@ -850,17 +858,15 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
 
 static void gpiochip_setup_devs(void)
 {
-	struct gpio_device *gdev;
+	struct gpio_device *gdev, *tmp;
 	int ret;
 
-	guard(srcu)(&gpio_devices_srcu);
-
-	list_for_each_entry_srcu(gdev, &gpio_devices, list,
-				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		ret = gpiochip_setup_dev(gdev);
-		if (ret)
-			dev_err(&gdev->dev,
-				"Failed to initialize gpio device (%d)\n", ret);
+	scoped_guard(mutex, &gpio_devices_lock) {
+		list_for_each_entry_safe(gdev, tmp, &gpio_devices, list) {
+			ret = gpiochip_setup_dev(gdev, true);
+			if (ret)
+				pr_err("Failed to initialize gpio device (%d)\n", ret);
+		}
 	}
 }
 
@@ -921,6 +927,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *request_key)
 {
 	struct gpio_device *gdev;
+	bool already_put = false;
 	unsigned int desc_index;
 	int base = 0;
 	int ret = 0;
@@ -1098,9 +1105,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * Otherwise, defer until later.
 	 */
 	if (gpiolib_initialized) {
-		ret = gpiochip_setup_dev(gdev);
-		if (ret)
+		ret = gpiochip_setup_dev(gdev, false);
+		if (ret) {
+			already_put = true;
 			goto err_remove_irqchip;
+		}
 	}
 	return 0;
 
@@ -1116,6 +1125,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	of_gpiochip_remove(gc);
 err_free_valid_mask:
 	gpiochip_free_valid_mask(gc);
+	if (already_put)
+		goto err_print_message;
 err_cleanup_desc_srcu:
 	cleanup_srcu_struct(&gdev->desc_srcu);
 err_cleanup_gdev_srcu:
@@ -1124,11 +1135,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
-- 
2.34.1


