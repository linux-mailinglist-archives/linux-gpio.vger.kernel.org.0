Return-Path: <linux-gpio+bounces-22431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073DAEDD21
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C185189C0F2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7AA28C2B5;
	Mon, 30 Jun 2025 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ehzA9TCa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1689128BAAC
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287053; cv=none; b=iBjRqI8CVfNCdi2am47Avr37orwCQSyIKzA3hxxwkjCLcU3rrwNvuMc9CusA8UDODXoQGXxy6W0oWihRcHkMZ4XbFKYVLJSMbK9PsqQiZf9RABhVaI756qO5uLbnBwFyev3mE6VrD1TysQx8xycqL5J7ev5919iENBD8OGSuyXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287053; c=relaxed/simple;
	bh=eglVm4aXDYM5iHFQM6M76a3TqhcrfnOeaj9qGJtdDLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfUsIjvQ4m5fR8KA+mDHYv6/UPnxZOnIOWVkcUj9aKUAIErekKvkoe1Dw7Py3CLsty3bTFVFoWFRT0T10+lcQRqPeSGDlRxeNPVRWrjMv9hbAOXCjDNj/p6sfBX7knHpuLrDCIqnRgb29KrcNQonbRyTwMJDsKDCF4aXg0jQ6Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ehzA9TCa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso2292532f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 05:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287049; x=1751891849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNk3mglmCXfdk7eF7/NoaZmh6n+n5KqbCwR9GHfo8KA=;
        b=ehzA9TCaW5JFuzgTcNn8RWwqXQDsBpzE8zqrgmxt4QaRAfqA6EEUNBnwNWIrrJNT94
         Hs0bKuzu4Lk7CtSg4yYl4Z3v7+GSc2IHT0L9sxYu0dYX+72Ka/RS/8vH9SkDh6/TIqoF
         i2jI2pj9odew5SbHd1l0K+gL5PDF+jNyPkA27dlaY5gAPVALFm0Lh9mWALAOnol4zGr1
         fyfulKJqAFoX9Voc2xfYWNMczvrr7lhuGUbqltZpuvv1MT2WJNSfKeG0FjLdIarrbA73
         Gv1jD5eBNtLvmpYprXEciZKERfEva/CfNLBBDnRsANYNTIJCb9ObwypAQKPrHhR2jBlJ
         9rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287049; x=1751891849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNk3mglmCXfdk7eF7/NoaZmh6n+n5KqbCwR9GHfo8KA=;
        b=TKfZ4Gaw0K1oG5NBKR1SzeLC7ZSUArIozYHthbUIynW6X8dQfmJXyaSCZXX8C7B2k3
         HCW/0P8iCxmUx3JVxP5++U/UlXBUR6idKEzFg3Q8JzWddsdfRwtUxnDAU3p5FiaMdYHm
         ua432ZXTF14U/kxYZMXWbc7UYc+2ClM7phnSTa5kv6iAx3kVJ9UJ1XC/1gAtN8AxA3lG
         FDMQgI9y6fNiorGTfHi0GFomWqckLK7wbRqrp9TBtSTzEgYgiBJMSf5n9qi91922rp87
         oj+Y1XySRoSKFhhNQ2r6KJyxqZ4af4qyfEdI2Iy0jsxSYFJ11lJzgV2GVVqUVIEe3yVF
         Ig8g==
X-Gm-Message-State: AOJu0YxiOxBfWz9ZizKH1Zo9g/SszzP0QVeZmXT5ofvQ+9ssAHgxkckq
	iu5xtW9BtjE8okV7Q34e20J7CaCAvRcwiYxqHBFkr0cv+0EchJhArnOW31PjS+6aXKI=
X-Gm-Gg: ASbGnctmlzQqfYN1W5ziC1bEpt+6xyReoXmtGFJOsmLXHGb1GjPH/b7CWsWJw7BlgcX
	3xgfunK9xRLHAGyOK8rMpurvxxOJX5sMHesbthPmhiazpfP7rf0OXnubNLEJOL40mhx0lNAhf6s
	InM107Q62WF1vAfSctzz84wEDpvbXPH0Lju2gDLlFY9RYnXvM/i/Hmg6ARIYWWru+o4LTpmFp7I
	Rz2o/qt3JLI5WXCNBJt41jleChIPNX0pNrCNnPjOPUB8J0uuvzJF3ppktMfpmgOfQSAbJl23UKs
	5ud9ylVfG6ZlE6FPbK+JmdT+ZfcV0gQ2vjAlMhLqDn8JuEHoyv6/YYLl
X-Google-Smtp-Source: AGHT+IGfucfcpThrHxHNsFB76Hqih9iVpBqlcNZlSBk/8H6FCaHgLxQlqsvBRStKi2zYJmtrF87uIQ==
X-Received: by 2002:a05:6000:21c4:b0:3a4:cfbf:5199 with SMTP id ffacd0b85a97d-3a8f435e0c2mr8090824f8f.9.1751287049388;
        Mon, 30 Jun 2025 05:37:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:15 +0200
Subject: [PATCH v3 08/10] gpio: sysfs: export the GPIO directory locally in
 the gpiochip<id> directory
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-8-b997be9b7137@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4298;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ChZzdWc7iMdehLwGGD/dAiyB0Imk7PHH//mUyZ+oln8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT+Kh/tyCRSHlMzMhmFl7fxaQV+8YUorZUKw
 76UluVwXwSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/gAKCRARpy6gFHHX
 crjXD/4qxn2Ql9TMgPHWHI8Smj5SBVtxQFjQSJOmiqlqZGRfH6Lxijxn6RfqnhbVotUTkFGPfhF
 HjEXYsSQu1H1lzq/3Q2rHlswniM0Rh13Crmo2oRZjgihrhq9njaC7fb5+pO9bjIyMSyJa8Gwvl8
 2jDdoMUY+Tfb3USDT+fxnNAmIcdrt9szVRd3Ebgd+rY6sdn+GLHYt8DPBk8b6+2TiHGzIofSp1u
 WsgmRi2UqAacK/xrQk/rFf04POGLvZ8c7FKe1xiBflUHuOzMEkXD6P9lNFbHT9cwHqumiM5GKVf
 7Fm3gIWig0pGmwbxPuvW4DAxx2UxwnXv8TiDEVI3qgq8/HUjXyGmGqT37wMieHh7FcZJ1CWLEMC
 hox7YzhZMS4K1ut79HpKmtHNyd9bW6NZfoFMmUVKZpuXAe231532t7iHC+1UURm13fb4zSiBThH
 QWLuH9Vh4+BtxvSyPwlMhrlTYRkk8Vka0vfkV6DWL5UCFn4h3GYUrPTKqVhoXvknr0U8+a2JHFH
 vGZnztZRuUGeMLIaLNNeWjFgU4ns8jUlQNcI006rHcDytV1+fiUOdqwV2qw7Mb7+EjzfSiFaHce
 OvhwL9pUZ9IZmh3nlXHy8gjka0W+jxu54fcclktzhUrrGPbmOq0ZQj4sRyKoocE5WPUTsEVOrg0
 QuDV+Or7wu/EDeg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As a way to allow the user-space to stop referring to GPIOs by their
global numbers, introduce a parallel group of line attributes for
exported GPIO that live inside the GPIO chip class device and are
referred to by their HW offset within their parent chip.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio |  5 +++++
 drivers/gpio/gpiolib-sysfs.c          | 40 ++++++++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index ff694708a3bef787afa42dedf94faf209c44dbf0..c0bb51412a912cefe032c4e84288f99754acb1b5 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -27,6 +27,11 @@ Description:
 	    /base ... (r/o) same as N
 	    /label ... (r/o) descriptive chip name
 	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
+	    /gpio<OFFSET>
+	        /value ... always readable, writes fail for input GPIOs
+	        /direction ... r/w as: in, out (default low); write: high, low
+	        /edge ... r/w as: none, falling, rising, both
+	        /active-low ... r/w as: 0, 1
 	/chipX ... for each gpiochip; #X is the gpio device ID
 	    /export ... asks the kernel to export a GPIO at HW offset X to userspace
 	    /unexport ... to return a GPIO at HW offset X to the kernel
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index bd84489ac3cf7a25c4c876af0668a14858d7ac34..5b8ea601a3ddf0c8442589db8b1111ecb26e1221 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -49,11 +49,13 @@ struct gpiod_data {
 
 	struct mutex mutex;
 	struct kernfs_node *value_class_node;
+	struct kernfs_node *value_chip_node;
 	int irq;
 	unsigned char irq_flags;
 
 	bool direction_can_change;
 
+	struct kobject *parent;
 	struct device_attribute dir_attr;
 	struct device_attribute val_attr;
 	struct device_attribute edge_attr;
@@ -180,6 +182,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 	struct gpiod_data *data = priv;
 
 	sysfs_notify_dirent(data->value_class_node);
+	kernfs_notify(data->value_chip_node);
 
 	return IRQ_HANDLED;
 }
@@ -690,6 +693,7 @@ static void gpiod_attr_init(struct device_attribute *dev_attr, const char *name,
  */
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
+	char *path __free(kfree) = NULL;
 	struct gpiodev_data *gdev_data;
 	struct gpiod_data *desc_data;
 	struct gpio_device *gdev;
@@ -779,13 +783,45 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	gdev_data = gdev_get_data(gdev);
 	if (!gdev_data) {
 		status = -ENODEV;
-		goto err_unregister_device;
+		goto err_put_dirent;
 	}
 
 	list_add(&desc_data->list, &gdev_data->exported_lines);
 
+	desc_data->attr_group.name = kasprintf(GFP_KERNEL, "gpio%u",
+					       gpio_chip_hwgpio(desc));
+	if (!desc_data->attr_group.name) {
+		status = -ENOMEM;
+		goto err_put_dirent;
+	}
+
+	desc_data->parent = &gdev_data->cdev_id->kobj;
+	status = sysfs_create_groups(desc_data->parent,
+				     desc_data->attr_groups);
+	if (status)
+		goto err_free_name;
+
+	path = kasprintf(GFP_KERNEL, "gpio%u/value", gpio_chip_hwgpio(desc));
+	if (!path) {
+		status = -ENOMEM;
+		goto err_remove_groups;
+	}
+
+	desc_data->value_chip_node = kernfs_walk_and_get(desc_data->parent->sd,
+							 path);
+	if (!desc_data->value_chip_node) {
+		status = -ENODEV;
+		goto err_remove_groups;
+	}
+
 	return 0;
 
+err_remove_groups:
+	sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
+err_free_name:
+	kfree(desc_data->attr_group.name);
+err_put_dirent:
+	sysfs_put(desc_data->value_class_node);
 err_unregister_device:
 	device_unregister(desc_data->dev);
 err_free_data:
@@ -875,6 +911,8 @@ void gpiod_unexport(struct gpio_desc *desc)
 		clear_bit(FLAG_EXPORT, &desc->flags);
 		sysfs_put(desc_data->value_class_node);
 		device_unregister(desc_data->dev);
+		sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
+		kernfs_put(desc_data->value_chip_node);
 
 		/*
 		 * Release irq after deregistration to prevent race with

-- 
2.48.1


