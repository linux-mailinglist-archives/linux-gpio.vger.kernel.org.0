Return-Path: <linux-gpio+bounces-21243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A21AD3B65
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96D0D3A8940
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA171CEAB2;
	Tue, 10 Jun 2025 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VihMOk96"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D38233722
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566325; cv=none; b=PYZOirPvaxvzVFiBMsZ/wuIuErTmLEq8ZH+PB9vNoQIEzEzRly8Nf63OdTlzpgQ+gskd9WkMYuOk4CwwUr1AoD7sy/3wQgJWvwNtfSzWh3K+IA6W13Xpvc0RjYEYgu5CIG9FFBUUKz+KGY2SPfZqwmEkN9BNFt/qTrIeuq9vMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566325; c=relaxed/simple;
	bh=Watgch6AAnT5evlx1x6CAOk8UpJc8xtNO01XfNMuI2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJSSyuAFJoRkQ/bXF1wPLL9EPQGHLQkn+jp8Cy7Qh6tmPzrDGZWfTc/w3VlREqGyGbNk0y3g8Vz7GzAGvIFBfyCDL/qhS4+DJyaSWQqmfLDT9siKzqGYdeFvSSycXXpJ0vZEaeBPKHgzktBejk0l8iXZp6voG4trqqmF/hKZQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VihMOk96; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442fda876a6so49549575e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566322; x=1750171122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsQ5a66nxiBrUyJ22LI2OZPoXALxCX/O1hriuyr43zw=;
        b=VihMOk96mrjf/RRojZKr6C9raGvv3g9WDoXEAbIaYDp6CxOD8xs3gHnTUCljRC7mdU
         MPtqmvAv30uq9DrrG79fXVge+wYhu3fqJdT6t1TX/NDlcGvqzFM3oAJwfneluMEVwnrH
         0Iw1ZNI9MurqgobOTlzCEqBVfcm9pnu35jvEKjw9VA8O38pVfUsAFcrGr/At0fpiZ0FL
         YFzckfPsUOuggRLz5OkYa66AkhvWh/M1wqgPD94Rp6Iv76uihaatSUBWWiimQAbRtcBp
         jFgDb692HuCdOLqikOj0rJxkAq9v/KwRCtLKxE24BbuDkoylXCpUHwaYTptsHKbellZy
         i4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566322; x=1750171122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsQ5a66nxiBrUyJ22LI2OZPoXALxCX/O1hriuyr43zw=;
        b=eG6trxYVAz6luZFMmgmBhNtHjlc3Zj6U6DpWhE6ULskfxtCWkeTrLOUscfjeW+PkIZ
         ZODq7d1MrxeLuAnAyQUUtFnA2RE+vKlzRGHqfnlIkxDXJnxVbE4GyUgjNs4NUc2dbPtc
         GJq52kMEW5oMP6pnz4LhKVBlK+zpN5+Ts2bu61RHSQsooRH9vE4ixElOorDHvHdMfp6B
         34T+bybEvDk22W4AP/0lx/Mn636w0B9vLmGqNBKM/u3OW+toZKKGqpHPB/+/FtkRV1SO
         9boSZtJWibX/IWTW87wk9LuAwAEncjwBvDQJdyStRKxdh9L1hNFUYg0He6QpzzAmDFle
         iKXA==
X-Gm-Message-State: AOJu0YyUm6BkYdFXy09L93AYArkt874+9I4YPbAAAa+zKXO4Wco/haET
	FOZjll0gm7q33aZtPKvnrTDLyOuuWsCHnfltGiW8Bx7cnjkdKzOR0AF7pg7Rx/WNhSA=
X-Gm-Gg: ASbGncuoETYZhUdfbgFzMxhKEY3Xw8og3L/iA7idEeRyP5pEmlN/GQRLlGBb9FV3fa4
	mLDj6CjGofVTVezR2o0I0JhWPVjTTG5d4Z5V7OehkfrVVE8h0H0W/QirfPilwuu5brCWAdnuRkW
	Xl8YTbmzmXEBTf5zxAHPov0tTmIZmBNoEtWgQk6GpfXhZuJ26kvDyx8UYo1hhHm2Q4/fwcoUe+2
	FC1x9lpnvt0TFPzHpx4HIl74cPNnwm7WQNLLNahUj99RMzrldRhoDE4q+VRlDVS2HcJnzCL+Nm+
	kga+u6x6L/u/3AU2l+yCSXoz4GcRMN0ETNXCHDxdK1pR8FFwEs0J
X-Google-Smtp-Source: AGHT+IE8haVUbgBb1o6F7r1dAx2SJi/5/9lwUTGlQZmtpVP6Ody9yjja3A446e36G5k7v/fRBb1Nuw==
X-Received: by 2002:a05:600c:6304:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-4520137bacdmr169574645e9.15.1749566321996;
        Tue, 10 Jun 2025 07:38:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:29 +0200
Subject: [PATCH RFC/RFT 14/15] gpio: sysfs: allow disabling the legacy
 parts of the GPIO sysfs interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-14-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7983;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SOXWhuriIiQ5+4UQM++qtdPxdjT23ycVoM7KxniJtek=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENi9jG+Vqt3t77PpikSk1CMstUoKh4xaAp5F
 iZQ7B/cGdyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYgAKCRARpy6gFHHX
 cioND/wM+j4euzloEqj7ceozEge48L5oRPc/ziCgn1H90E9ibzSCl6GCHm5k9YcQ1ZR/E8AHsmP
 rFXjR18XYCbnZiLjcuKDRryo8Jy8xmcy/HZxo054W0YHaAKe8lSyF1xvKYwToKADgBJnSFbhfUV
 ZC44YZHxGITR2dR9PIZ7LHGSH4QBMddPocgaxv7QwvMMSwU32ZcFr2mc9Pazlz6yJrQ8+aNtAxn
 9zalmqVKNbWah33rRJHQ0tGFQyZbgFHQxGTxOEFBa4SgkOCBqb8yVtGoUOqXZIflsh5cOtveys0
 M8y6AE1yAYe53inK7CczGBV8t5FIfaB22/DLhGeWlgokCNd7oNA5irid64MMxhznsce7+2MmzBj
 AXWWR6h6EMj4blmwwtGHSZWyTRadu3+QK+1F60+2oVXItkwuvWn9R0hJEIJhHc2m0faMhTEVhZU
 ++QeU65ar2Y1dx7AVPg76mr8n4aVnJLzcL3hWbeIR3m9qG6V9by5POMn2Aho90t6xy37v3Sdyt1
 4yZDv+03+Eu8zrXAdNnaAA6wVgAfHQIbl6/J1s671aE9/xOuuAJpBJvyrFDI7EjJQl6reShCbpy
 oPCG99woe3gQYSpOS0typ9HJ0uGVQac2iMrd8LaZ09w8kIJj7oxZu/80IWHrU+N0vcqPAVy+/4+
 TGaazalx4vE3k6g==
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
index d8c17d71d5458011d15bc4239bd4c041244da3fd..48e1353f966837d46f00b552f870440097ecfe18 100644
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
 		kernfs_put(desc_data->value_chip_node);
 
 		/*
@@ -966,6 +992,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 
 	guard(mutex)(&sysfs_lock);
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
 	/* use chip->base for the ID; it's already known to be unique */
 	data->cdev_base = device_create_with_groups(&gpio_class, parent,
 						    MKDEV(0, 0), data,
@@ -976,13 +1003,16 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		kfree(data);
 		return PTR_ERR(data->cdev_base);
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
@@ -1001,7 +1031,9 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
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


