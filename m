Return-Path: <linux-gpio+bounces-22803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA6AF935D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFBC5A6387
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 13:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92AF2FCE00;
	Fri,  4 Jul 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="svLzJEZk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0602FC3A6
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633950; cv=none; b=htO7emXQLwNKHcR0CiADlbeOvXPQsC9naQg3qEV4O7tCMPDTDARjPqFFJrpW+TOjVGsc3Tr2vlM1bj0T2Alm3he4ucwjruf06SJk5Jd85GqsM/64C33J6h0QY/q5+N4MLPARXqAW0xz5ElWDMIblzHEMZBDQvNmPrMaL1ysfOFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633950; c=relaxed/simple;
	bh=SEQUE+wqnlsIeL+Vd0wTvWbzWH4y7y8v+wOvxDnzMmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fw8MyPqYMXWgbScex26Nv8MnFELISI1u3kNpA5hzGyNDPAfur9zOksJC3fgHzzX8jmZuRDi1NcbDqlkQo2uJbBPbGIN1TXrYDBJmSuEuzJ0XR2RPRIpv2jt3Xyd0n6D1MV/UBHFpNrvaigMRJjEvCXnFGXmwjGk8Trizl2wcCBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=svLzJEZk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453066fad06so6404445e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633947; x=1752238747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UOR2MPGqOiOmlbGxM7YXcw7cNM+OL5WteAFiwMTMKU=;
        b=svLzJEZkNQlSX/ccQ9lYyw+p78VFItVHNDrnxwP/kFrQys55lLbLfFh792WPmIXwXN
         DpyKD+VPbf5yYmHQXQyx6iK8ZjwQIUAulAsepFeV+/wVXaXodkfOEVgcEdeDLpePWGP2
         FJU/8es19+3RpNvpOfTNQKpYGTL2vm+CzYEyVxDL/zzDV13tDodmY4WTKGCXUPMc7qDT
         BuLpJLA32QrwFsYKudPn3XTKNo1BJmqWT2wRBowEbSf0JZClraCuDMqpTpoaZileqqbv
         fxC/aDIzZ4p71YL5bfN6Twwv5RqbfrVwe4gHU4nsXuH+JTD7F+ogIocPfUyo+H9QrOUU
         1u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633947; x=1752238747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UOR2MPGqOiOmlbGxM7YXcw7cNM+OL5WteAFiwMTMKU=;
        b=qTAg7hFw4GLzvKvuLO5ttC9OALNePSHPPvE3M09TUTV7xZV5wZPz/yuy9plQn8NibA
         OFieBdtjeP3pWoDoYvJ3Ch6iWhspoCpGRy0syiWTWH4ngDd+9dKMgTHYWckXi71unN23
         azkVTQzjvuYSJCO4aaQUCPJLATNIqED5dCGvgU+A4RyNDtkgGkNb0MU96xNiRtjv104n
         20+/U3iTJEijR4krOZHcJNMtpqRwnPhLRy8Fcbp79Mkjbyt4BuXm17/QRnvk7EGod48N
         TVJpyA+l55vK2I2P9TNIcRIlt3VzptuxzuyCdR0SbZ/e3TOA/4Xss09wu0cUsRa0cTxi
         R1BQ==
X-Gm-Message-State: AOJu0YwXvbe25fR4Nxx9iKzSB+F0zITcGCx0MMYGx5OVihllWvGPkAGZ
	oJqDxjhXNymsZdUKAAwmNMDxtr7yrgK9Choq3LpBDJRbVKI+cKnMV1r16XcvN+hrTE4=
X-Gm-Gg: ASbGncuaY3e2DRZ7yCL4L//awArR6eyzvpJgU2rqu5ARzzTNIFEMA4kC9XUWmxP+jlh
	8hYvxm6axc0yXjcWRDXaj5shxZOyuBZozy0JEig5KcjMPDtb1GrquWE+fLpL38ttjfj39LGnEUt
	VrafUKGFNFYbEP0XY2Q9wE5FsLvDmar3mmc5t3gOmIEkDcWTQQMma8ABMC5tiYWG87PyukI5/WA
	ejo1KNbt6GmsbNY3t0R8Mi22Ua+iq5NWRXH83yOpAA+Uq2zWJFNH+ZflD0L4409RKf/pWn7pbav
	dY4oYRJWwY2Zy9t6ab8g+KKMghupmtlyhhQfFQm4HDum8M9mOf6VD98=
X-Google-Smtp-Source: AGHT+IHnksMyu8rvbVUDzpdeDkUVxrcX9/U69Pif100+iGeU2MGYmBeXjJy7gEarXskd975HFr0gFA==
X-Received: by 2002:a05:600c:4f07:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-454b835631bmr7435805e9.14.1751633947059;
        Fri, 04 Jul 2025 05:59:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:59:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:56 +0200
Subject: [PATCH v4 09/10] gpio: sysfs: allow disabling the legacy parts of
 the GPIO sysfs interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-9-9289d8758243@linaro.org>
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
In-Reply-To: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9996;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NprZaQcSbklXSYi5LBjzK05jcMN3zcONcmqjGfbIn0Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9AMQrcy/xXWwOFlmrFL1RwxS0/RzWVkEhsx4
 i7sE3A33DyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQDAAKCRARpy6gFHHX
 cpREEADTTaWivKZMznFeC8Odftis9aDiF/hPq1Mlge1xvsvGB1w4bie1l0Jp1DFq/JzPOWjiYV4
 9GqDGdkeC89xTOLq82prEh0tQFj26xBJ5fldUn+azcpIeDRkQ8oN1+yAIEsEwoUoPM/LsnkV5gj
 10/w7C8MOIqWlfqH/flXDvv87hsV9kHiMNPRP1vU/nAFFn2UQnji+UNZmxm+HjF0YL9kR3WHxMr
 OJTMZ5mHVubfOMCVHftxkNj2PeSf/73JeY3KUvpgiSkviG59Dx8nATwCf5o4HHu1+4eqsbrh7+G
 m25tjDOTz32MeazcnZj+V/gTRR/sldDqM55ePv+iRS49C8ulVpPFmyyz431QJQlPTbHMefvpC9h
 fXxTgPX4K06ZunZm0/a4feFUDCZsI4OoXb5dMKaxQpbRYS2K86oFHttCd4LJGP1h4CCn7G6bK0N
 +Ml/pHD9iYyuCcLwpVXp4KGrImzoyFJW44jd1Nxxo9K976GswY17/7fHMwfugc+RsXYi4Nw7bZq
 s70Ew+UwPbjYgi4XiMLyVoM8Ic6MIDFRT6UreEtzpaP3rPnfG/nRd0eCQXjWeTaRP+3fLFE6kwc
 WRbHL0MQlQpyFHMyMvfPAorgSzhMWbxD6SVH1MI78TWXT6g3XFJRE018Sr3+hOBkOR2u06k5muD
 9GqZkq7Nnupd4xg==
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
 drivers/gpio/gpiolib-sysfs.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

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
index 563e38456c33cd3a6e8674485105ef45ce8f5095..f31adc56bef1e215a257eab37ca3319c55ef36a6 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -24,6 +24,8 @@
 #include "gpiolib.h"
 #include "gpiolib-sysfs.h"
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
+
 struct kernfs_node;
 
 #define GPIO_IRQF_TRIGGER_NONE		0
@@ -41,6 +43,8 @@ enum {
 	GPIO_SYSFS_LINE_CLASS_ATTR_SIZE,
 };
 
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
+
 enum {
 	GPIO_SYSFS_LINE_CHIP_ATTR_DIRECTION = 0,
 	GPIO_SYSFS_LINE_CHIP_ATTR_VALUE,
@@ -55,21 +59,26 @@ struct gpiod_data {
 	struct device *dev;
 
 	struct mutex mutex;
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct kernfs_node *value_kn;
 	int irq;
 	unsigned char irq_flags;
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 	bool direction_can_change;
 
 	struct kobject *parent;
 	struct device_attribute dir_attr;
 	struct device_attribute val_attr;
+
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct device_attribute edge_attr;
 	struct device_attribute active_low_attr;
 
 	struct attribute *class_attrs[GPIO_SYSFS_LINE_CLASS_ATTR_SIZE];
 	struct attribute_group class_attr_group;
 	const struct attribute_group *class_attr_groups[2];
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 	struct attribute *chip_attrs[GPIO_SYSFS_LINE_CHIP_ATTR_SIZE];
 	struct attribute_group chip_attr_group;
@@ -80,7 +89,9 @@ struct gpiodev_data {
 	struct list_head exported_lines;
 	struct gpio_device *gdev;
 	struct device *cdev_id; /* Class device by GPIO device ID */
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct device *cdev_base; /* Class device by GPIO base */
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 };
 
 /*
@@ -188,6 +199,7 @@ static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 	return size;
 }
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
 	struct gpiod_data *data = priv;
@@ -383,6 +395,7 @@ static ssize_t active_low_store(struct device *dev,
 
 	return gpio_sysfs_set_active_low(data, value) ?: size;
 }
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 			       int n)
@@ -397,6 +410,7 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 
 		if (!data->direction_can_change)
 			mode = 0;
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	} else if (strcmp(attr->name, "edge") == 0) {
 		data = container_of(dev_attr, struct gpiod_data, edge_attr);
 
@@ -406,6 +420,7 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 		if (!data->direction_can_change &&
 		    test_bit(FLAG_IS_OUT, &data->desc->flags))
 			mode = 0;
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	}
 
 	return mode;
@@ -426,6 +441,7 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
  *   /ngpio ... matching gpio_chip.ngpio
  */
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 static ssize_t base_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
@@ -434,6 +450,7 @@ static ssize_t base_show(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%u\n", data->gdev->base);
 }
 static DEVICE_ATTR_RO(base);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 static ssize_t label_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -558,6 +575,7 @@ static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
 							  NULL,
 							  chip_unexport_store);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 static struct attribute *gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
@@ -565,6 +583,7 @@ static struct attribute *gpiochip_attrs[] = {
 	NULL,
 };
 ATTRIBUTE_GROUPS(gpiochip);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 static struct attribute *gpiochip_ext_attrs[] = {
 	&dev_attr_label.attr,
@@ -575,6 +594,7 @@ static struct attribute *gpiochip_ext_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpiochip_ext);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 /*
  * /sys/class/gpio/export ... write-only
  *	integer N ... number of GPIO to export (full access)
@@ -639,10 +659,13 @@ static struct attribute *gpio_class_attrs[] = {
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
@@ -754,6 +777,8 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	gpiod_attr_init(&desc_data->dir_attr, "direction",
 			direction_show, direction_store);
 	gpiod_attr_init(&desc_data->val_attr, "value", value_show, value_store);
+
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	gpiod_attr_init(&desc_data->edge_attr, "edge", edge_show, edge_store);
 	gpiod_attr_init(&desc_data->active_low_attr, "active_low",
 			active_low_show, active_low_store);
@@ -789,6 +814,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		status = -ENODEV;
 		goto err_unregister_device;
 	}
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 	gdev_data = gdev_get_data(gdev);
 	if (!gdev_data) {
@@ -832,10 +858,12 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 err_free_name:
 	kfree(desc_data->chip_attr_group.name);
 err_put_dirent:
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	sysfs_put(desc_data->value_kn);
 err_unregister_device:
 	device_unregister(desc_data->dev);
 err_free_data:
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 	kfree(desc_data);
 err_clear_bit:
 	clear_bit(FLAG_EXPORT, &desc->flags);
@@ -844,12 +872,14 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
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
@@ -866,6 +896,7 @@ static int match_export(struct device *dev, const void *desc)
 int gpiod_export_link(struct device *dev, const char *name,
 		      struct gpio_desc *desc)
 {
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	struct device *cdev;
 	int ret;
 
@@ -882,6 +913,9 @@ int gpiod_export_link(struct device *dev, const char *name,
 	put_device(cdev);
 
 	return ret;
+#else
+	return -EOPNOTSUPP;
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 }
 EXPORT_SYMBOL_GPL(gpiod_export_link);
 
@@ -920,6 +954,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 		list_del(&desc_data->list);
 		clear_bit(FLAG_EXPORT, &desc->flags);
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 		sysfs_put(desc_data->value_kn);
 		device_unregister(desc_data->dev);
 
@@ -929,6 +964,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 */
 		if (desc_data->irq_flags)
 			gpio_sysfs_free_irq(desc_data);
+#endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
 		sysfs_remove_groups(desc_data->parent,
 				    desc_data->chip_attr_groups);
@@ -979,6 +1015,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 
 	guard(mutex)(&sysfs_lock);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	/* use chip->base for the ID; it's already known to be unique */
 	data->cdev_base = device_create_with_groups(&gpio_class, parent,
 						    MKDEV(0, 0), data,
@@ -990,13 +1027,16 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
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
@@ -1016,7 +1056,9 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
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


