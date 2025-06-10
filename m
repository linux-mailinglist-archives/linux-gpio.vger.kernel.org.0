Return-Path: <linux-gpio+bounces-21241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD89AD3B60
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 522E23A6B51
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0663522C355;
	Tue, 10 Jun 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lHI+tYRZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4023231839
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566323; cv=none; b=i1wOAbmFQrp5TkpYykS+vwmKT8RpFA5Vtp41LCYhlNDi+aUAv7NaLsYR9E4MHR0wT07M6BcJusBamsZhDX03sBYf9NrGw2lURAhe2Z98TnzGlwsv9Ia1HvahKi6H8SAKlmwTK+qhqC8DbcLci59Z0rRBtPuxJt/b7uqWWYs9sok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566323; c=relaxed/simple;
	bh=q0H9vMF6ivh6goehKpENG92UC29koS/f5ZnMtXBTzgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3EhNQoE/TorKBcwsiz6z06jOAiiHJlZpjr+JbsJs622bP0rqJsDKEnMFwaag1PVCuVg1kXIh6EwwMO2qW/NfqtrnIDBikk7CNxgvy9R1Y+Cvj0mtq7DkoFE08Imrj9ArlNSrrDQD40F1uFEWd8lDbQrhau1yq38rOkMiAASXGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lHI+tYRZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4531e146a24so5952375e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566320; x=1750171120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfIhJyfA3DlBtdknD+rm+05KUKOC0Zc1LOEud9YByS4=;
        b=lHI+tYRZNlG8cPOP/YGneudD2vI1kDx+I2wDzUGjt0sBx8bpy01xyNZyRdOVcND8QI
         e1ELXztttT+f99xj/nlGmwWMWI07/GrOPNk+f0+EXvcNVmy0Rylk6naDz/dG7o7AP2kn
         q277lqbJlixPFLYpn+VZzFa8COrsIRuug7G6rh04NrLbqYwbf3xmJawUjt+GzqWypUcI
         95/Bv2HcjK4LpUyrEd9vfwlPHh0vJL82LIaGE6Qt2HXnfmXQq3cWM5pUu965oAv6vZc0
         8mmru6f7fOebd1dtnIV/VBJzmicG0SkC6GtcIbN1aFofsDOQEc6PVjUjdJHZwMdPuucs
         Rv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566320; x=1750171120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfIhJyfA3DlBtdknD+rm+05KUKOC0Zc1LOEud9YByS4=;
        b=Q8jLvBjeerYczeGvO6d3JCg1dj3U2q++OwecL4tjaliZvDICgVyNpcJVEb79rLT2AY
         OfwaMNw/i0rM70Hgw8GqAeH+/GgFcsTEJSwY5ET5ezs1jcxe1fhIK7AwXUasthz6hmcl
         uwTGhd7/AnlW8s2zly0AkWIczFcCYQyceHlXSvwmkqELd53aEuAcF6tQUzFe1IARopn5
         gykgt2M/JT9rB/wIneWqO9MQRsfBrvgn+32ZmrfgrSPUkZrC/PUcjH2ucXlakcH3fE26
         NWqiMbEHEuZfS5C+WNkdWM6jCFBm+tzjjzx2dr3mq/ce4dGcjN32VlNChzJf4mzYHMZ+
         Mc9Q==
X-Gm-Message-State: AOJu0Yxx9nTPeQXFnfNDVV9pywBlw2DPAuIeJ8GTuGr8bFreB4ZCPO0k
	jttxDt+gkBSDK9z+g6xPjPlrfxQFf24unuwSXIcBOL9aaeMTnB+pHCUsHn1lQmbjScw=
X-Gm-Gg: ASbGncsgNUyZ+adfvRPFP9nCatryCDc/wNuJxTwPozWQ5w5XqLh8xDC0nLdVuxWQtkE
	LbEe574dtOsgb4uM9kkVRKWvke8WQpxMmIOSg8oWM1t/dnOZpKcFlrwbgQgHyNG4mdqR5++LzYG
	YG+FWharfyhCoYn+zyfT0pr8X4YP5f1DRvEO6MKg3LUYiqNeqA500qiis2Tq25xWYDCkLYHtmKf
	DmDWMs7Px3WKU9tWyEBOikJhRRxeng0AVFrpZQTZW+2MG/lUpqYlSB2pz6QtGo0SoVZkDRTD8Jk
	LMpbC3Vl6YbgjffPXdDlENkN13yKWXF9fOJCeoVF4d6AmgPyS6VY
X-Google-Smtp-Source: AGHT+IFpWLdFggP0LwP2I9yAkdR2cWTkQiNu95oixpk5MrpPkqWu+ChUzJJsd9csLWV8H4Sge9R48A==
X-Received: by 2002:a05:600c:a10c:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-4531de00a37mr24535615e9.12.1749566320009;
        Tue, 10 Jun 2025 07:38:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:27 +0200
Subject: [PATCH RFC/RFT 12/15] gpio: sysfs: don't look up exported lines as
 class devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-12-a8c7aa4478b1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4839;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JJYGTProM8qofp65Sgg2w6wsQTPnuW1fKmETy8uZ+Pc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENicTYjEct+c5k9wyAo1MIPKXpZGxcw4T9Yx
 SlW0jCeW4OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYgAKCRARpy6gFHHX
 cuzCEADXq5qyQcAhrvMKpu8KmDyg6eeoFI/BReuz0O0PQmzJ2/oDQqXMTfCAALwjf5L86itq2i/
 nhOYoiLWRlBuXW3t/a160IjSNdTUlcc22uJZ6oOhk6P6l7G0B7MJ7/NZ2U3ozB7s/+mzfc9I7qk
 dpLKcnvMy5msuGm6wiNLd3nsTWcMakds2BsBcs+jkNpF+J/SCoptikrD9kavWpjoGG3+EtckkEN
 wII5upubZymMDFODOk956tmtJAOgcrmb8GN1QX9NkB3iLZwx3v7LjBAahfvRalpxdoyENyESIZK
 lqKxf9h+4L/Jr0hSD+YtLKasIItTFo+pECzEXQdW0IgYP2S9c8Ovo66v3Xy/xhzJmjrY8N55Kcs
 HpBLUEsbU1ag8tg4+Yq9pjiBT4M+u2hFyJ01hRGJ9+qzl+OJZXTVxGCTLTOeNDJu62I75Y/PcLB
 hBYNu0lLCHKTEp/TuLJoXixAqTI16DyWA6W76CJXNjeZ2TNEAWr3RKXJnjyl1F4Srbyg1eNNiOf
 hshBNnvyHbuPWBd4nKp0jShhtFN4NEu2T/Uto3KLhv62Z/DLOEYmPTqxPz6WNcYJ7aRcfZxZ/bP
 rMqpG9vnMC4hVLikO4uvZWWElg7RvjOrr2EvS6saBOc6FgnqZ505+4grl38YTM3mBZi5LrtL22w
 WN1mKtoUuHWqiew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for adding a parallel, per-chip attribute group for
exported GPIO lines, stop using class device APIs to refer to it in the
code. When unregistering the chip, don't call class_find_device() but
instead store exported lines in a linked list inside the GPIO chip data
object and look it up there.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 60 ++++++++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 398cefb4be9e389a820dd53f79c82fa70783b5e0..aa998d9e96cce5d64784645eea73f987471c7285 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -43,6 +43,7 @@ enum {
 
 struct gpiod_data {
 	struct gpio_desc *desc;
+	struct device *dev;
 
 	struct mutex mutex;
 	struct kernfs_node *value_class_node;
@@ -58,12 +59,15 @@ struct gpiod_data {
 	struct attribute *attrs[GPIO_SYSFS_LINE_ATTR_SIZE];
 	struct attribute_group attr_group;
 	const struct attribute_group *attr_groups[2];
+
+	struct list_head list;
 };
 
 struct gpiodev_data {
 	struct gpio_device *gdev;
 	struct device *cdev_base; /* Class device by GPIO base */
 	struct device *cdev_id; /* Class device by GPIO device ID */
+	struct list_head exported_lines;
 };
 
 /*
@@ -686,10 +690,10 @@ static void gpiod_attr_init(struct device_attribute *dev_attr, const char *name,
  */
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
+	struct gpiodev_data *gdev_data;
 	struct gpiod_data *desc_data;
 	struct gpio_device *gdev;
 	struct attribute **attrs;
-	struct device *dev;
 	int status;
 
 	/* can't export until sysfs is available ... */
@@ -751,25 +755,40 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	desc_data->attr_group.attrs = desc_data->attrs;
 	desc_data->attr_groups[0] = &desc_data->attr_group;
 
-	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), desc_data,
-					desc_data->attr_groups,
-					"gpio%u", desc_to_gpio(desc));
-	if (IS_ERR(dev)) {
-		status = PTR_ERR(dev);
+	/*
+	 * Note: we need to continue passing desc_data here as there's still
+	 * at least one known user of gpiod_export_link() in the tree. This
+	 * function still uses class_find_device() internally.
+	 */
+	desc_data->dev = device_create_with_groups(&gpio_class, &gdev->dev,
+						   MKDEV(0, 0), desc_data,
+						   desc_data->attr_groups,
+						   "gpio%u",
+						   desc_to_gpio(desc));
+	if (IS_ERR(desc_data->dev)) {
+		status = PTR_ERR(desc_data->dev);
 		goto err_free_data;
 	}
 
-	desc_data->value_class_node = sysfs_get_dirent(dev->kobj.sd, "value");
+	desc_data->value_class_node = sysfs_get_dirent(desc_data->dev->kobj.sd,
+						       "value");
 	if (!desc_data->value_class_node) {
 		status = -ENODEV;
 		goto err_unregister_device;
 	}
 
+	gdev_data = gdev_get_data(gdev);
+	if (!gdev_data) {
+		status = -ENODEV;
+		goto err_unregister_device;
+	}
+
+	list_add(&desc_data->list, &gdev_data->exported_lines);
+
 	return 0;
 
 err_unregister_device:
-	device_unregister(dev);
+	device_unregister(desc_data->dev);
 err_free_data:
 	kfree(desc_data);
 err_clear_bit:
@@ -828,8 +847,9 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
-	struct gpiod_data *desc_data;
-	struct device *dev;
+	struct gpiod_data *desc_data = NULL;
+	struct gpiodev_data *gdev_data;
+	struct gpio_device *gdev;
 
 	if (!desc) {
 		pr_warn("%s: invalid GPIO\n", __func__);
@@ -840,14 +860,22 @@ void gpiod_unexport(struct gpio_desc *desc)
 		if (!test_bit(FLAG_EXPORT, &desc->flags))
 			return;
 
-		dev = class_find_device(&gpio_class, NULL, desc, match_export);
-		if (!dev)
+		gdev = gpiod_to_gpio_device(desc);
+		gdev_data = gdev_get_data(gdev);
+		if (!gdev_data)
 			return;
 
-		desc_data = dev_get_drvdata(dev);
+		list_for_each_entry(desc_data, &gdev_data->exported_lines, list)
+			if (desc == desc_data->desc)
+				break;
+
+		if (!desc_data)
+			return;
+
+		list_del(&desc_data->list);
 		clear_bit(FLAG_EXPORT, &desc->flags);
 		sysfs_put(desc_data->value_class_node);
-		device_unregister(dev);
+		device_unregister(desc_data->dev);
 
 		/*
 		 * Release irq after deregistration to prevent race with
@@ -857,7 +885,6 @@ void gpiod_unexport(struct gpio_desc *desc)
 			gpio_sysfs_free_irq(desc_data);
 	}
 
-	put_device(dev);
 	mutex_destroy(&desc_data->mutex);
 	kfree(desc_data);
 }
@@ -898,6 +925,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		return -ENOMEM;
 
 	data->gdev = gdev;
+	INIT_LIST_HEAD(&data->exported_lines);
 
 	guard(mutex)(&sysfs_lock);
 

-- 
2.48.1


