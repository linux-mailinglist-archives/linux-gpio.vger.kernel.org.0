Return-Path: <linux-gpio+bounces-22432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C2AEDD22
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C70D3BCEEC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8067728A73E;
	Mon, 30 Jun 2025 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lawykocl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226BA28B415
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287053; cv=none; b=VeArD1UtCcFN29UxY1uP+Vwb0proJ9F5IgZdt6xBAz2BH/n1v418LBm4Vd9W/Sv5FiZfdArWTs/ofrVJTupvwhvurh8k4X83b3Vod9vDxbYv9ggLMk8f6HHsETDgxhT6h2SPlgoiPn7ka0Aw+IQEQTnNT9/d5XlrnZM3VDhmZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287053; c=relaxed/simple;
	bh=NhLED6KS6iQSEvuMf/1jSR9yRtIa50EjnBWBDOqIhXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cM80QU/eNtDTQ/3BtuGl8UHogLfIBHA4H2rnSxm1UKfZToj9t2NQ1gSChz6MQRISAbrMnz5GjYAuEsAqc2D3tsK5MSnLarGKqKGPXvqqRl6tOqikmvdxboF4Q3i2pjzWGqdfpCGRHzABq1rX+zIY3BIGrLAHYEgnDlrvm3VSpaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lawykocl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453643020bdso38773235e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 05:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287048; x=1751891848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja11BRQ4dxRBQehmAA+JWgfhvIUUWfex9nN3gp7sVB8=;
        b=lawykoclhLNDWCRcYllSWi5sLbF36wo3hU6QbVDbwuSZtS7TIcfQomG4Raf4O34d20
         zTCfBDiDEg3Oix1sOy2L9a6x/+ZDNrEpwPxhui7aiAvM6X9kuWKoHow5qcAiEzL1/KeE
         9aXRG0NwH2iZcGkARwr0FYEAST1wlHppU3+24jfhOe4AK140GFwFfZ8tQWH5H4UprvsV
         eHZvJwg/2vwYDsDu6/AhX1EEFbpbjRB1ThlnBTbskVyVPEX6aYWsgtBl4O3puvPRudp0
         eIusVIcHZs4Utgg9G6fekd9ljC6BRKvxMWmsKj0PZPJbdps3FEy4Y+PrdpvNDWAkXpCJ
         lLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287048; x=1751891848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ja11BRQ4dxRBQehmAA+JWgfhvIUUWfex9nN3gp7sVB8=;
        b=rCdxkQ91LKBJtLPOFL8/6WuinEyNXwWQCmd6Bvmkji/tvyEQLFeC8m3GceSfYVSV/W
         gvF3TMZDumTYEf94owY6PllLOEhskARIa7DJpV7Y5NfjbtQU1VfnV6fCbFxmgdmmAla2
         E31MgpOQQTDbBOhwcpkHKae7c9P2ybGlLMYyX39eCvaG5zcMAylhlDnSOXcw8sO22dBQ
         +N+1R/VNzKr+CCuLUXy8odXdMdxUwj9WhMDWjHu/xJ5t3Uqh/5kuF4LAiSSjNoe9T2GO
         oRVnNNZrrFZX6mfqiYK5LDA3bJjZzsilMb3ci2UuO5hbaKwLYUXilyl5mBnxo5z8frg7
         yfmQ==
X-Gm-Message-State: AOJu0YwbRLxMofyZbf34Bx0mvtHDkFAcy/81MSAyGy0ay6F79PoiTq1U
	zQy9WX5yh7tgHnURCv59rJgxU68hLaL29WlZC08bA80rB28zOATYqYYauOeYYC7M51U=
X-Gm-Gg: ASbGncu8WtIx6GTTxqKL6XARO0pkj1cVYYxjGqD/4Yaw8vGlSZfMXuC6pzuy+sdn+FW
	t58fQquQO2176pQ0DMY1Hrk8FP6WaIbU9WeU9po5GANwtAzVLjcUQCq9tab7WHahLfoQuHWlZuW
	667VViryDPcQMxg7SGc+IlxlV1pnRxPOaFIlg5wGpDA9t7L5ZH+cOHWb2Xo2qps8jgzTCAvL6VM
	YAvAKnU+VohuV7DPWAmPse30t9yZi3mjFfeiwF9/Bu4q9KrybjcutkNRsdd3EPg11b7ite+Sacp
	cj1oE2RXogVOueORfe1ISnlMllzlkVukLRVk4xtHD0Z5T+bi9g/sTFk8
X-Google-Smtp-Source: AGHT+IEflkpfWSN28PECBxjrq4gDHiZyEw+zm0ocJVWxo0nIFmGDKmXgZgqgR4g1Lh/Pws6bxh0KdQ==
X-Received: by 2002:a05:600c:4446:b0:442:e9eb:cb9e with SMTP id 5b1f17b1804b1-4538ee85917mr117313145e9.26.1751287048295;
        Mon, 30 Jun 2025 05:37:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:14 +0200
Subject: [PATCH v3 07/10] gpio: sysfs: don't look up exported lines as
 class devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-7-b997be9b7137@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4757;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lYevZUYsEbe/Cg8VTtiEwRPXET3KKqPxl76YbS96r5k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT+BFPrDJM4GofwXtG2+dFIuMwz7n1Uy1tFY
 x+LXHn9yjeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/gAKCRARpy6gFHHX
 ch+VD/4p2b2K/poyiDdOzCogeP03KURsY3W9/hGSGndIjSLT9606IdKgFBLc3Ot9SFz95EFOXeb
 DMy30KeaLy1pdrstZ0fcg/6OUl9yCIxqXz3WpaxX1lksX/XHvv6xPoytP8Ea8Gl6MBvikrc6M2j
 aPvfOyq9JQiKWiKRT2Ib2GB2TFs9GqhO76Klzn+oy/Hvc0kG6uN3tWfS1QjkjOJCoy8FoEdbbse
 M5RfxQ669IfKiIC1RaunmA1DTcbEFYqGSex8/FYXxXBOsqA/p6M9CHNbJwnftexQaitLv61O0hh
 mdL0crEDTRp7EulNlep3qIYsvMIjI17SLN8/QDaEBgT731TVjzOcNXRzKK2Eoa29lKZUJawKMfH
 KHFzBegMXS8d1RI7z3k3LTCvHpp6ebFmvy/3aVNoJp5w5Oyln9ka/r+U1zWT1Nz/6RcKQHZ7m8g
 bWB/CyYHxDV9Kt4sdNp/3ib+uydZKk1QDDQkTbeluARaguvXyIQbTVD1czn7RPTbzMmFkYCNl77
 IcJVpzpKhh8CjsBsC65rgRfPP3WMWJJ1mNKdk4m/SINhb+4ZWBi+E+bxXS5UP5puZxjYMtYr9ia
 oZ7ffEBzNWHi5E83bDKEoBHC2kFX+4ZTVGl2sVk8a7FLtfIYak+kjHMGdMfG8VakttLvk1Gdi0o
 waBoZInn9mEStnw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for adding a parallel, per-chip attribute group for
exported GPIO lines, stop using class device APIs to refer to it in the
code. When unregistering the chip, don't call class_find_device() but
instead store exported lines in a linked list inside the GPIO chip data
object and look it up there.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 60 ++++++++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c1de8846cc4c1fc9e871dfa4a7d7a8f287043c7d..bd84489ac3cf7a25c4c876af0668a14858d7ac34 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -42,7 +42,10 @@ enum {
 };
 
 struct gpiod_data {
+	struct list_head list;
+
 	struct gpio_desc *desc;
+	struct device *dev;
 
 	struct mutex mutex;
 	struct kernfs_node *value_class_node;
@@ -61,6 +64,7 @@ struct gpiod_data {
 };
 
 struct gpiodev_data {
+	struct list_head exported_lines;
 	struct gpio_device *gdev;
 	struct device *cdev_id; /* Class device by GPIO device ID */
 	struct device *cdev_base; /* Class device by GPIO base */
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
@@ -750,25 +754,40 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
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
@@ -827,8 +846,9 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
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
@@ -839,14 +859,22 @@ void gpiod_unexport(struct gpio_desc *desc)
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
+			if (gpiod_is_equal(desc, desc_data->desc))
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
@@ -856,7 +884,6 @@ void gpiod_unexport(struct gpio_desc *desc)
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


