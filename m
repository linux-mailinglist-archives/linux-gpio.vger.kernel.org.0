Return-Path: <linux-gpio+bounces-22433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A5AEDD25
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360991795C9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B59728C5C6;
	Mon, 30 Jun 2025 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="agixqt5S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E128C031
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287055; cv=none; b=RVvm98EDltGx5RhaIr4saOE5zi1dExFoVdL156OtDyuHLpDuMudO1DIz1J5UqLiMp9wPCFHJdTfBQnWpngAIyO+AYC9l0HIbHkIRhOULhYJi9RJnSN/6Wod8HCzh6ExkqzIpGMbcpv9zkgcmOp66rgySklScuTJtTwgitp/av2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287055; c=relaxed/simple;
	bh=23b6/Z3jpUPlARZhu1s+kq1yhUnFkH81V7+LRTqVNVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mumojrD+CgcmEJ7uiKgdaRmA1GxhtjeVvsN+qdbPKAzwLKCwW9zGFZajuHjchlEASfMHqn0NLJRroVAVgNHuDKXgCmF6evLDXXgjphLUxb5J0T/BCjXIf+si3wzeEdfTDcGuT1EpBxQf8LNPYiWti9YBa3jbmReBgIDkPVr/fiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=agixqt5S; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a54700a463so2629425f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287051; x=1751891851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdWAQt+95IqdYcYPGNehzGVHC2x2ZtKPSDdNvNq4Rzc=;
        b=agixqt5S8oylIvHVO8idwMerMOqv7dSylO1Ce+UBei2IvIBN2THcs8UhqeOpmR2Oon
         DN+kCxBNviBKz6jhHTTDIvhRdOWggyt0W3NX05mzC3sKCKFpuXq0ebt2e27yC6Fs2Wcu
         qXKERWA95gPM4LMZnrb8rk3C/Z4sYCoOu0x2VkJdX3yAlt78DJ4YsDn3RFkovFK7S9Qk
         /TOkwTPHzjoTp4ewYjjzmK1SxMWavmHZqgZE0lMpb1LDSgl4ej6ecdEfmt1jEa0hKMIX
         6Pwg7NDmuLyZxaQzFos8RUJWPxecE/3lj1Uc69HoA2/cx36fS3pvu4iPRlbMjDo2jkB6
         xJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287051; x=1751891851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdWAQt+95IqdYcYPGNehzGVHC2x2ZtKPSDdNvNq4Rzc=;
        b=arLk6gn7ctqi9/avKvwRcY0/fkZ6i5hTjCCAGJI/0986z0qK8Z5snpEvIi9Tc/CFnh
         SuP81EO7l0bPtPVbSGyS1gfrUCXo/kR2qfXfjLLwtH3R638Xj5YPhdALo029OO1dh0I3
         VcqZFA5YJGRikO1ale2PSNc+t2graueVIL+gxlhdoz7dGkNoY++f/ECuY7bQ1ccD3Icl
         IcsJ8RMpGVSDNoZYj6AIJX6KkTvBYWa8S7tip8Tku3DA/Nb+nkNSOK0Mb+ZBrW6WllJX
         yGbnAC4wPghlZkqQqJwCPmN4miVxD1cnnTt9ZvZcYZZU5clYM+jjleI+uGDmeZqNgrrC
         ECOA==
X-Gm-Message-State: AOJu0Ywh6YxTiHykjKyv8N0qJdIM6zLV8J77RC9y0DdPwHH4lEQfWNyy
	/9yHcvCCmUDwBzjCt/YeuR5mFzFIxirCvaMgOL31EpeCJ6uFqwFBSdtpE7WTB2A6bYY=
X-Gm-Gg: ASbGncstKU99SQFaVpaRtKJI3KfYrBBfEVpYl8vx1Wee84+Gn9R0K23KNIP1JSZoFJV
	xDi7n76PPsMakq/IlaD2qF6jGVItUbz/BrBlzOlZFKMSLr+erNz91+/wqCuyE/D/5ERMCitociG
	bHltItAEDM1UznQn5z77qAF8e1427QGScmRYtOp1BK+xs4wB5lPcypFcBi5xTGqN57fdCZzp3an
	UIQc+uVceS/9UMHm/9UoRMzshtESxJIMW2LFxtUtf/7YOjkLtE0WRNxQGfgJ87VU2BK6mFNvkGZ
	qzk1lwpk12Yw59LVTMP1SkgpfgHvpWRMxt7QNdlhgBKun4PMvte4k317
X-Google-Smtp-Source: AGHT+IF7Z7Hj0aUDxS5KQh9zw1ZXHBJyFQadgAf4SpY9yn87LESuKIOO0c5PTEb5IXYDDK0jov4N2w==
X-Received: by 2002:a5d:64c7:0:b0:3a4:eee4:cdec with SMTP id ffacd0b85a97d-3a6f30fc1d7mr12913861f8f.6.1751287050599;
        Mon, 30 Jun 2025 05:37:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:16 +0200
Subject: [PATCH v3 09/10] gpio: sysfs: allow disabling the legacy parts of
 the GPIO sysfs interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-9-b997be9b7137@linaro.org>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8085;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9hvB6qNzFbQWyGdxmQdVykCyMJnqCezngFxsVt2KrAc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT+D6KsRSlzSE5FBFO0IopkSmEtskOdSw8mC
 2cpQB6EoiSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/gAKCRARpy6gFHHX
 cgtrEADSpM8n3BF7tT9RoyrQaPzRlrw7xPZ1THM3ExegvocRqZjddo6SzIiIMxMceN1haJVD8Sm
 bbnISjFSmQf2o99RX5dsU3GamUViEHrfZVQHl82JjXr3r7CMy2tM+THdlzEQOv4RuxlNJuVSQkj
 skLHDa6ox0d+aAlfwUuB+GSQ3P5F3HMHNWn8ESVsq+hi0CbHi4d7RAe5w2X2NZwtyZNUD1mg/Ur
 Pcw+IpEmJNjUaqHaGUjt699T7cMNCvpNHGs09VX6M7urlppzuuaYsI8J09tBkKqJ7jRHv/YbkpB
 8+Y+C1M4wFNY545Bj4g7QXYl54n9e5GTTguhhzRmTbuVBybkwuXzF9gaNBJ2irdzH3PSA3dFSo8
 APpdmU9QBMYOrTdsspvtFjZo72xBE+oc/RHLBEG3rmVR9KUEbhcaNWO/+IPlksHAJO5B5AMqVzq
 4fmi1SPJOnllq7gF0LvwHva1mhtYSj166qV1HTdyhtwb2szBh97LZ+CwyH0pHTBupSn3NZ91nwe
 aQPwtdjA3WVhdimuq+LuVb9foqedAwmxiRWf3AfgykcMa6lAnG1huWRSaffwePoM/Qh9TfW9M2u
 CR98EoIckw6kmojWE8dpaKWOL4HSnl1eZH6FfZdZYtGiP595ygfLjYaWmEPsa4CFtESpNT7MW8R
 nO2hcd+EoxMCtGw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a Kconfig switch allowing to disable the legacy parts of the GPIO
sysfs interface. This means that even though we keep the
/sys/class/gpio/ directory, it no longer contains the global
export/unexport attribute pair (instead, the user should use the
per-chip export/unpexport) nor the gpiochip$BASE entries. This option
default to y if GPIO sysfs is enabled but we'll default it to n at some
point in the future.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig         |  8 ++++++++
 drivers/gpio/gpiolib-sysfs.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 44f922e10db2f8dcbdacf79ccd27b0fd9cd93564..d040fdd95ee4b19851057fbedbb023f277149c9c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -69,6 +69,14 @@ config GPIO_SYSFS
 	  use the character device /dev/gpiochipN with the appropriate
 	  ioctl() operations instead.
 
+config GPIO_SYSFS_LEGACY
+	bool "Enable legacy functionalities of the sysfs interface"
+	depends on GPIO_SYSFS
+	default y if GPIO_SYSFS
+	help
+	  Say Y here if you want to enable the legacy, global GPIO
+	  numberspace-based functionalities of the sysfs interface.
+
 config GPIO_CDEV
 	bool "Character device (/dev/gpiochipN) support" if EXPERT
 	default y
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 5b8ea601a3ddf0c8442589db8b1111ecb26e1221..d33fd7eeb82b2dc69861c4fc89613380df7efeea 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -48,7 +48,9 @@ struct gpiod_data {
 	struct device *dev;
 
 	struct mutex mutex;
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct kernfs_node *value_class_node;
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	struct kernfs_node *value_chip_node;
 	int irq;
 	unsigned char irq_flags;
@@ -69,7 +71,9 @@ struct gpiodev_data {
 	struct list_head exported_lines;
 	struct gpio_device *gdev;
 	struct device *cdev_id; /* Class device by GPIO device ID */
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct device *cdev_base; /* Class device by GPIO base */
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 };
 
 /*
@@ -181,7 +185,9 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
 	struct gpiod_data *data = priv;
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	sysfs_notify_dirent(data->value_class_node);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	kernfs_notify(data->value_chip_node);
 
 	return IRQ_HANDLED;
@@ -416,6 +422,7 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
  *   /ngpio ... matching gpio_chip.ngpio
  */
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 static ssize_t base_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
@@ -424,6 +431,7 @@ static ssize_t base_show(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%u\n", data->gdev->base);
 }
 static DEVICE_ATTR_RO(base);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 static ssize_t label_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -548,6 +556,7 @@ static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
 							  NULL,
 							  chip_unexport_store);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 static struct attribute *gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
@@ -555,6 +564,7 @@ static struct attribute *gpiochip_attrs[] = {
 	NULL,
 };
 ATTRIBUTE_GROUPS(gpiochip);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 static struct attribute *gpiochip_ext_attrs[] = {
 	&dev_attr_label.attr,
@@ -565,6 +575,7 @@ static struct attribute *gpiochip_ext_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpiochip_ext);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 /*
  * /sys/class/gpio/export ... write-only
  *	integer N ... number of GPIO to export (full access)
@@ -629,10 +640,13 @@ static struct attribute *gpio_class_attrs[] = {
 	NULL,
 };
 ATTRIBUTE_GROUPS(gpio_class);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 static const struct class gpio_class = {
 	.name =		"gpio",
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	.class_groups =	gpio_class_groups,
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 };
 
 static int match_gdev(struct device *dev, const void *desc)
@@ -763,6 +777,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	 * at least one known user of gpiod_export_link() in the tree. This
 	 * function still uses class_find_device() internally.
 	 */
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	desc_data->dev = device_create_with_groups(&gpio_class, &gdev->dev,
 						   MKDEV(0, 0), desc_data,
 						   desc_data->attr_groups,
@@ -779,6 +794,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		status = -ENODEV;
 		goto err_unregister_device;
 	}
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 	gdev_data = gdev_get_data(gdev);
 	if (!gdev_data) {
@@ -821,10 +837,12 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 err_free_name:
 	kfree(desc_data->attr_group.name);
 err_put_dirent:
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	sysfs_put(desc_data->value_class_node);
 err_unregister_device:
 	device_unregister(desc_data->dev);
 err_free_data:
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	kfree(desc_data);
 err_clear_bit:
 	clear_bit(FLAG_EXPORT, &desc->flags);
@@ -833,12 +851,14 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 }
 EXPORT_SYMBOL_GPL(gpiod_export);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 static int match_export(struct device *dev, const void *desc)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 
 	return gpiod_is_equal(data->desc, desc);
 }
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 /**
  * gpiod_export_link - create a sysfs link to an exported GPIO node
@@ -855,6 +875,7 @@ static int match_export(struct device *dev, const void *desc)
 int gpiod_export_link(struct device *dev, const char *name,
 		      struct gpio_desc *desc)
 {
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct device *cdev;
 	int ret;
 
@@ -871,6 +892,9 @@ int gpiod_export_link(struct device *dev, const char *name,
 	put_device(cdev);
 
 	return ret;
+#else
+	return -EOPNOTSUPP;
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 }
 EXPORT_SYMBOL_GPL(gpiod_export_link);
 
@@ -909,8 +933,10 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 		list_del(&desc_data->list);
 		clear_bit(FLAG_EXPORT, &desc->flags);
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 		sysfs_put(desc_data->value_class_node);
 		device_unregister(desc_data->dev);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 		sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
 		kernfs_put(desc_data->value_chip_node);
 
@@ -967,6 +993,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 
 	guard(mutex)(&sysfs_lock);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	/* use chip->base for the ID; it's already known to be unique */
 	data->cdev_base = device_create_with_groups(&gpio_class, parent,
 						    MKDEV(0, 0), data,
@@ -978,13 +1005,16 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		kfree(data);
 		return err;
 	}
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 	data->cdev_id = device_create_with_groups(&gpio_class, parent,
 						  MKDEV(0, 0), data,
 						  gpiochip_ext_groups,
 						  "chip%d", gdev->id);
 	if (IS_ERR(data->cdev_id)) {
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 		device_unregister(data->cdev_base);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 		err = PTR_ERR(data->cdev_id);
 		kfree(data);
 		return err;
@@ -1004,7 +1034,9 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 		if (!data)
 			return;
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 		device_unregister(data->cdev_base);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 		device_unregister(data->cdev_id);
 		kfree(data);
 	}

-- 
2.48.1


