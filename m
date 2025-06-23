Return-Path: <linux-gpio+bounces-22009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 491FDAE393C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597101895791
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965902397AA;
	Mon, 23 Jun 2025 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jKMP58tT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7682376FD
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669225; cv=none; b=NOPVxONXj47KPvB4v7xtfvg2dcTMFn1VU4KIcY0mKV6GyjxqpDUwbtRI9vNLb6UaxblGiGSpjdUJZVX1Olv0DZoGKsi0Vb6g0HziUuUXb2tck2GXzX3d+TL4F/r/a6wKpX0t+oSRZnmB9D3FSZ9rx9EE33grfWoHzJflNShCCVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669225; c=relaxed/simple;
	bh=jRBfjkpecc9BUW1w81pSTZlb8j2BdRorFxrrJ6koHpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhckgHJw9V92/I3wlhf8NcxvdxwbVKtU591C/HwVUX+KVSwdiUnLFQnhVDRUY0ML0jBAURKRRLOBpJptAwewVkX/CqY5+Ac5lR9K33TdcYxej8RqJy+FuY1yRtjRykSoc4xjsMhTxvwRXHbkmyk9gp+ANYYllD0ElpvBLbQ2c70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jKMP58tT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d54214adso25627455e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669222; x=1751274022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiPiKKgelJK0MgrvfIW+YyEedIQhhH0ktmAiH+T8Zkw=;
        b=jKMP58tTW4gAzixhYCFhL8n0PH+IYJ2kiqK/1VdpQq84/PcGVgCe9tX8kx2TA4Fjz+
         4EcB+HxpoQBsgIA6ZCsN7Oo8M+0PK/rSK1Lr9urlB2rQelaYOV110XjB/2nDLWhNKPy+
         BeW3Xnbi/z4zPqg8awTI/TqpJtv8B9easK4nSHsi2WLsxZ3osFYdYIdfouWeu+hCQNP4
         fu5z6jT9M8YboEoCVl60rS47JOA5UCzzO75DReItcEaMipJaByHdK6nBi9csVfNxL7ik
         6V6npEv3mGUH6kU++pE3jIgIQsGCRmtuFkpW967vVkgmHN7McdA8CwwF/hLTc6mRkAf0
         JvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669222; x=1751274022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiPiKKgelJK0MgrvfIW+YyEedIQhhH0ktmAiH+T8Zkw=;
        b=XF6kG3ZcpqPg3vM2kTIxi4SSzX2AX6DQm/hzubH+0V1Ckdl9SOndhqt/WYXJw7VeLf
         /2vuO9vabVPQO+4LiOf6KTkptE8HDHC3EkR5xgF294/BRukY5WhPhiWk9jqp9OVkcVDz
         9fy9kC7kVmAwIcNJmDSlMdf9dBZLCW+GPDNDFRo1mHGJT6L0buy1+RCAz3zaPpHSgLJG
         MO/pC3lVqE18tQqoie3ZQVwr+H+auXyLcBbnv3yPnFjL+TUY84p90Fy2Wg5Isxr/zqc8
         6UVk0xUUAdmJMrRcT/WFLYA7ulgIz2R5uEx4Ai0lZKRVPtcjdK1pIXx23Qpjn9ZreiHY
         Ej0A==
X-Gm-Message-State: AOJu0YwRIldS9kBEcomOgezffTF4M4UPmXR70qLWlSZLnB0x2Yy+YPPl
	agGw+yEzFhLULNJfxNOg81TUSGfeXu6JEeH6q4wPHiSaR4d8LF3xlysZpEdRTn2tafQLnI7FJxo
	gEOKW/Ac=
X-Gm-Gg: ASbGncvmj++oMVAVVKo557f6489a4MzpPOr6IjmZJ1sj/Js31jyvpNwnDnJ8nEWwosS
	VO4BS8S3VHqyKVaPImKiOeilkjVRmP7JkTdplIkvzW+7HkRuHjs/C3eFvHMv6+eIpCEJ84KDBDa
	APXPQ4WiDzkkWzPCPdz/72KbAtZjc20O7HwgkN7Giip+wqocR1B6HGysd7FVx07NUsqV/q4P81w
	+Wf6IRCKUJCQUGQCUPqoeyGBgmjwowBA1Fsz8VQdX8NCEdFAZsSYV1HgbmqeqzhZTZMTHxwjSJ2
	pFzAsKLKj/jiObvDsBqrbq/SDbZjlbVaWaLl5buuszBsv/soR1WlCrc=
X-Google-Smtp-Source: AGHT+IFtsMKXylZBqwYZ6g2XtKGhJ+AdwXOnqsW9qIXy8SogYsUsVo1AlQk5Zr067rnb18l7OgtGOg==
X-Received: by 2002:a05:600c:4fc5:b0:442:e03b:58a9 with SMTP id 5b1f17b1804b1-453659edd23mr96036445e9.25.1750669221517;
        Mon, 23 Jun 2025 02:00:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:59:56 +0200
Subject: [PATCH v2 8/9] gpio: sysfs: allow disabling the legacy parts of
 the GPIO sysfs interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8023;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2di3W2yHM6i5t7LwlUeew0hS2H4VmaMxC0/5eiN8mL0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWReaRzZCBOEPZ+cr1jQF9rq/zdO1N7t39cpCp
 /lw3/F3eQ6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmgAKCRARpy6gFHHX
 cuJQD/9CRL6ndRy7Z43UUrz4mA1YKdV5BbivNqpcdvytQgmNpXEgdXg9je6ot436b/H0ivUd+ZJ
 y0EDUN0bGezYbKp6Cs4XurE/x/ZlhVqvD8rRPEGioP7xhVXtVonGmnAPw2CUdMzQX8bTwTNZuzu
 ZdHxQ/6MYI95+g7r/yRAuJdfb+JflNLRU7DzJ5gINmqjwLEmkGnm6bUf2XaifWMAhE46AlzKSz0
 H6MDQAmo/X41nb1uj1muSNWvsZhtUJ1ahcRJx0ZFE9VdKq3zv/YOLYQplhFJ/RsMtlXam1tQifN
 TkAngA5CB0hG5UGGwyrpBGPLqCpRQBl2IVmmNo49AiJ/W/dUU/upKWpSckZlsXV9uYZYfKxrkI3
 5m7mGfrsCUDc6uUfc7Sf1PNzJ5vQ9jeMPRbgSs3R6kbAeE+NjhQ12nzTO6mEOPvWb3C2NLWtLug
 9qnauv6FI7kHdSVXXZ6ovyHz8vKRPMTtVGDalh0vgoBsA7Jo03hzUjYoHdGr5cZzpE+cbW1l/3f
 zrVAHd+WKHUFS6MZH5IB4K7tqpClcXySD6rbLpbGb4J24drF3oZpVkFhNa1FAWBxv/GZ/blKlYS
 GaWfEM+ol316qWXYXfAUt8+3U7Lrku3L2H5dlPcOO0Z+v+ns75QH2q9Ei8sYFzO8Z6oatgqy4it
 /+1hiEFCF1zkHgA==
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
index 37d58009a51333f7d6a8d600dbeaeb333df27ac3..0e7605fee3bd9edbe4e90d8e466742df11a8d579 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -46,7 +46,9 @@ struct gpiod_data {
 	struct device *dev;
 
 	struct mutex mutex;
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct kernfs_node *value_class_node;
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	struct kernfs_node *value_chip_node;
 	int irq;
 	unsigned char irq_flags;
@@ -67,7 +69,9 @@ struct gpiod_data {
 
 struct gpiodev_data {
 	struct gpio_device *gdev;
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct device *cdev_base; /* Class device by GPIO base */
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	struct device *cdev_id; /* Class device by GPIO device ID */
 	struct list_head exported_lines;
 };
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
@@ -822,10 +838,12 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
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
@@ -834,12 +852,14 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 }
 EXPORT_SYMBOL_GPL(gpiod_export);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 static int match_export(struct device *dev, const void *desc)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 
 	return data->desc == desc;
 }
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 /**
  * gpiod_export_link - create a sysfs link to an exported GPIO node
@@ -856,6 +876,7 @@ static int match_export(struct device *dev, const void *desc)
 int gpiod_export_link(struct device *dev, const char *name,
 		      struct gpio_desc *desc)
 {
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct device *cdev;
 	int ret;
 
@@ -872,6 +893,9 @@ int gpiod_export_link(struct device *dev, const char *name,
 	put_device(cdev);
 
 	return ret;
+#else
+	return -EOPNOTSUPP;
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 }
 EXPORT_SYMBOL_GPL(gpiod_export_link);
 
@@ -910,8 +934,10 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 		list_del(&desc_data->list);
 		clear_bit(FLAG_EXPORT, &desc->flags);
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 		sysfs_put(desc_data->value_class_node);
 		device_unregister(desc_data->dev);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 		sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
 		kernfs_put(desc_data->value_chip_node);
 
@@ -968,6 +994,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 
 	guard(mutex)(&sysfs_lock);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	/* use chip->base for the ID; it's already known to be unique */
 	data->cdev_base = device_create_with_groups(&gpio_class, parent,
 						    MKDEV(0, 0), data,
@@ -979,13 +1006,16 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
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
 		kfree(data);
 		return PTR_ERR(data->cdev_id);
 	}
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


