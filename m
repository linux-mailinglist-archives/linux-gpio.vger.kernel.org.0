Return-Path: <linux-gpio+bounces-22801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F596AF9360
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5422E1C834D6
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 13:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F54C2FC3AD;
	Fri,  4 Jul 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AWyQhWov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB62FC00B
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633949; cv=none; b=ppAydeW6ZKW1rmHHtn4mtCue6gqsgaaZItPIHY+mWYVSzIDpYdRwgM0y+Z1yJ6MM649A38ltelmpqmY0FxE+F6e9UL5E1G77QAUBT2FrvPVe0CVUO5HS/jhjwlCYBJn0rBd+x9bzf5QjYHFoykpuZe3WQqW6D5i0Me1oSAbQflQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633949; c=relaxed/simple;
	bh=HSQrtGe4/Z0TBW+gwH8FOlwHslQisfYTdDaYyI3dFb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3Ev1mS8dn7nQ0S1R9gxOe47pWqkXMqn9VcxhUWwPzP7vYeGbFUb+hPlqqRGIinoZ8DZo9fK5mGvwfaHxPqfrzSVQbsAPBD88nrGosnLtycSY8S2cBJFlpjM/GWZ7jgv4tk2K20bOrbd/YEley3I+N7rul2FWYAOlcKX09W2FLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AWyQhWov; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a52874d593so778478f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633944; x=1752238744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMEMEAqg83bufN2QGDWBOgNHkNfUTOyZRf8AHX0Mf9g=;
        b=AWyQhWovjeK4CkJQanLCf3+cTor+PiwLoyFEiGbBEREs+1IfNvT++A6O/N84IRnjyD
         p6Y4AvM1KOF2w0euIDlews2/1emcv80hjELuMW1PqOGSGaZep6NY7xCGGPdkMPu8qhY8
         9XKmXLjc5OHdOxVAZWe7p9BYSTw2CilZdYUVDv/q3+cu6Xj5GWI1o0Q6qiARpj+5O+R0
         gOwq9M+LIJ9Nongg1Uxmq3gcuiSgxEj5JFkskrbsRFZUgjY1n+xZ/WcE7cA9/5ADsqG9
         dOyo2ri1+ki8w6KRi1Yml65l83zq9bnFEQ/MRnXJUv63ZiSNQiA2neBtDFZLsv7OL1Sv
         AmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633944; x=1752238744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMEMEAqg83bufN2QGDWBOgNHkNfUTOyZRf8AHX0Mf9g=;
        b=U8Ty3suafBEm41IcET+qjQeAqwaJna72yLwDoedSe4Tyy6P/AkMhJVEu/k8DJdNly+
         5eccodJ021pN1Rfpf29x2fJMvq+CtkJhuvVy9u8qDygjN9Bx40R83ND+jNWDVyNbcVcg
         5W/Do6rgCEl79UtefNs7ruvTon1QMSvVNaAzn++0LQisyF+neJQz4FWqH/PNtck3n+JN
         DT1oOVrb1ZDu/fUHbuUOH1+3wQ/nCyXBvmPvZU5Szumt1iLzhZIUdpP7ndiOxjrS+2O+
         XnjRG0fjXW7em39EaXwYFURrJ+m4L/q0hrjukvUlzGp6LlJiazA9woZTo3QqYiSDIKHH
         SzFQ==
X-Gm-Message-State: AOJu0Yx6Kq41TI2dpSHZJuE5h+MMUQcUPKG3vAHcwVlY3br7QbqFBlpD
	qKXGq2+TtCUpD7MzweffHQqCIrfXThyG0nA7mzo190gwEBN8q0HohC/vlhd3NHBLDBo=
X-Gm-Gg: ASbGncsjIoI5a6xHjmiGQ3bWae2ti7HA6uxEt+8OdnD/6I+GhlIFymlYCtW655gDGMW
	TzPrf/h137ztmAcu+iGowgHynySoYOcJLspQyjWT2I23LxtWCSjASQ4pcdTKE28Kl4aJOeps77V
	FWgmnX97rrGUIjpIOEyJpibcBQD3S4fglhXaJ1mpifCw+8nvSerPN2Yzjs/7R2pOCQ7OOYpkub1
	XLC3MbIQnHvmTSzVluLtfQQNtzDEs0g8nS7EtxYKAx5K0TuiDMRDJR92VBcyE905Ds8J5jfUe9Q
	CshQd0S+Ty+frkwaFiTm7JXrTcE/deqYNw6oyEDh0JA7oQyrTRUf//A=
X-Google-Smtp-Source: AGHT+IHaSluiSjg6ZhGmsBkYXRIG9iwoBZVF5T5tgaWqiOqPiLzLikZKD5mhzB+Wy9gylFEewYJvkA==
X-Received: by 2002:a5d:64c3:0:b0:3b2:e07f:757 with SMTP id ffacd0b85a97d-3b4964f5198mr2409455f8f.1.1751633944485;
        Fri, 04 Jul 2025 05:59:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:59:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:54 +0200
Subject: [PATCH v4 07/10] gpio: sysfs: don't look up exported lines as
 class devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-7-9289d8758243@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4753;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gFW3JmLsuFySaX3ICt4Hmzv3Y1dJIcjL8tzNr7Vj5fc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9ALPECgZHxSOj7PIlfwj6d6B65AXnkb47jub
 lqMni47QJKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCwAKCRARpy6gFHHX
 cp7HEADCzPIbVzpehNKQDCLf+jLNRs3MrkpbPHsavzLLFI2F9sxsXacNI1pkqRaCTY53Y3N4Kuz
 oFBUtdRrIFF0I2O75rsl+gjJTAAFXT0i0kLDCLRp1Wix8AZgCCqpESqJgVAVM2LuPTuWSPaxaqn
 c+4lgvdlDshS5kAl3KgKzQRsAyStCnX7U4H5Vhde8k0b0JWOhqGVpQ8XvZmBT8vzJC6vGsnXSKI
 fa3/rvBrn2Kt6QxGz28/Sb3mtECdw2ENuVjU83UZd8DuuG5ZnhjtW+WnFeJM/THodXvTCAHHs+q
 QBWnoA9ckrW41TJFOOT9q6W/FH63UVM5jzWziJG4EVY8nizqeR5DFSs04FuEkDCei6Me7MCYF8h
 6pzHqWgiW/sK2tDZ5Z23jV7UunmnLQCNy4kWmndRVKx5DKZ0SutDvA7Lonuii4zzCpvwp5hkR3l
 nE54gO9ajX8sucK0OcO9i653k73fVt4HWMJrBF/hXgbeW4zGbNVXMM2BgV25LUW1axwwuLbmPb5
 Ij8Hc+yriRCSQvxdylzYoPM1A7E2v/CAvcB10EoW7+bMJ3HXcFcBUCjLXEok4cUaD5GGNkqbTD4
 Iy12o1KDhEfRhud68dUcq2f2Q5R6A24xREzMMnsp2G6KTido+ffIrE5U77xqIdlc/tzyeu/Xr3Q
 /Bj4BNdAkE11zCQ==
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
index e10d720ee0adb3b0f6e91eccbf64c33e5700c616..ccc293a4cc5d51294703959317061af55fb0dab0 100644
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
 	struct kernfs_node *value_kn;
@@ -62,6 +65,7 @@ struct gpiod_data {
 };
 
 struct gpiodev_data {
+	struct list_head exported_lines;
 	struct gpio_device *gdev;
 	struct device *cdev_id; /* Class device by GPIO device ID */
 	struct device *cdev_base; /* Class device by GPIO base */
@@ -687,10 +691,10 @@ static void gpiod_attr_init(struct device_attribute *dev_attr, const char *name,
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
 	desc_data->class_attr_group.attrs = desc_data->class_attrs;
 	desc_data->class_attr_groups[0] = &desc_data->class_attr_group;
 
-	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), desc_data,
-					desc_data->class_attr_groups,
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
+						   desc_data->class_attr_groups,
+						   "gpio%u",
+						   desc_to_gpio(desc));
+	if (IS_ERR(desc_data->dev)) {
+		status = PTR_ERR(desc_data->dev);
 		goto err_free_data;
 	}
 
-	desc_data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
+	desc_data->value_kn = sysfs_get_dirent(desc_data->dev->kobj.sd,
+						       "value");
 	if (!desc_data->value_kn) {
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
+			if (gpiod_is_equal(desc, desc_data->desc))
+				break;
+
+		if (!desc_data)
+			return;
+
+		list_del(&desc_data->list);
 		clear_bit(FLAG_EXPORT, &desc->flags);
 		sysfs_put(desc_data->value_kn);
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
@@ -899,6 +926,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		return -ENOMEM;
 
 	data->gdev = gdev;
+	INIT_LIST_HEAD(&data->exported_lines);
 
 	guard(mutex)(&sysfs_lock);
 

-- 
2.48.1


