Return-Path: <linux-gpio+bounces-21240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD03AD3B61
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BDA8189F84A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9785233127;
	Tue, 10 Jun 2025 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uAZ6oma5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4583230BF1
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566322; cv=none; b=eQO/l5c6QYPTM1VTZgMJwDdQzCl8XL7QCUcCmHn34p5ouIhIIvUyUGonFyype2e7ESPPS2+WWXbkA6lkidEqs71lcVz+V3OiZVR7NKIchnIaA2I4teiNOnQSXdu4O43MQGqsoSkOLUabaLSbQaLI49+CyqP/tW7W9Vrny/ohX1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566322; c=relaxed/simple;
	bh=f8vXK6IWliyCN7vPGg3hik7hmD2HLv651rEW3W10AHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSv1vPT1XHR7PVOGnx9n1EQosY5uFkQrf/ZtgBE27F+fDKvKvwrakW7NiqoR0JG5Ovoee8wOHuadf6k18FjdSL7CmidZsYYd1lYuzeQS9lOoMBF9F6AHUg3FV3NBcuuhczwfrNGvcSFxATIkIXpMUST21cigdK/bn0zAzSbu0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uAZ6oma5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so43430365e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566319; x=1750171119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glk+vyiBAA4mAU1wTyAmPtLPG2zXbkDr8YYuwf/YIQU=;
        b=uAZ6oma5c7i9kdbZXeThlXD1Hpa+2LtbSf67rT1rhN/ag5RpZk1j3WC4GyEoUgi1DP
         mmfrv1xvjdO0M9TWNQn+/SnK5AU03G3byLLL1bqK37kef9xuPiJJuSK7dMXY6sI0COVv
         rRcohPpnn8WH09UWHFAiNFT+MQAUV2p5wZ2zQ8byxn2jY+/SDt2zYvw3H2JGgiCYvRqe
         xph93R4mOnzvSdTeYZc9hgU3bon96jBqQG7B8F4/AHPlPbLz17w7bL8Lf7+lW5MqUnNE
         m+DBIZ/tCa8NW1kvC01UlM28aRoGQb5HYPyUm7P1iKDqxh1N3dR2uM57tW10BFYthzsI
         TNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566319; x=1750171119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glk+vyiBAA4mAU1wTyAmPtLPG2zXbkDr8YYuwf/YIQU=;
        b=sLbDSCb9lAY0BNgzcuprbFZ0nzFkOWSlX9w7swlrlCY2ECbsNFpQd0BNiC0gPLqXkD
         gOFuHA/EFsYnICTES9wUrIJDYBNjrjMoZPXfXsYMrdZiM1wGcRV3/XXiZO9BUWcBFfkt
         SlOlaGWVrtbyz19Qoali9CsJTgwqZY5h86nLW8rKfvmv2sEX77i7djE/bgPx6TICmVFq
         chT+9oIcQ6qNHbFi9IT+l6FWt5woJWH86JHhvFTuQgK2PdiWTgCDqAbkcU+c6dk8+YEI
         uuloJOnVCIFtq9KuFv7MM7dqaKhrHfKsZNI8aX66HtBqEWhK/WrLy2rS08PDUc3a8Vh9
         wfxg==
X-Gm-Message-State: AOJu0YwO2Blu371fb3OZRyeK8jQ7UBYTRB2oh9qiOgT2epzQWHp2420F
	gy/3FPYEv31N4ZQnG6ZrafUuEcL+VFYr4SHu3Se6G+Q+6dITmqle1e+Sh2ttNph+i6bTvZAIrb1
	guYag
X-Gm-Gg: ASbGnctoBtzChnltespMF7PeaB8DzDMWKUYS5xvTM6qwN2PvpAQtqFzwjpQLSnjnPDg
	ZHcg9lfeI4vppGP+SrnwUzCiGAeLKlU1PlM4HH1QEHDb913+AJd1H2CAeP4KPeO784VkN5vFrbB
	Lt3BBTmLf8U8fWHEmpWYtLGyAaXtAbK0GwmOkYWUMcK+YP6N6J+2twkZeM/pnZ1CyW8H6Y04oxJ
	QSy2F0cbj/soDv0OhPrZ0I+OgVKjLmJRCDZi3x2fbkLaHJD+d4mMoDQAwPCqUQhDWHoAMI1LvVK
	zDCpa+r2nASxjNL4IQXfCb4CyLiA5ZPtMfWI5b36PpNl/Mv17yTg
X-Google-Smtp-Source: AGHT+IEyoPj/GMY9Uv2pXheakyegmw+fR6j4iVJ2c4+Mt9PcfBd5RiW/KY86czU6MmLDuAepAM4AIA==
X-Received: by 2002:a05:600c:48aa:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-4531cfc4b6cmr23314475e9.14.1749566319006;
        Tue, 10 Jun 2025 07:38:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:26 +0200
Subject: [PATCH RFC/RFT 11/15] gpio: sysfs: rename the data variable in
 gpiod_(un)export()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-11-a8c7aa4478b1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5053;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pyuFXLHeJQgyNgRtVSVy026dbWuIhqUgk4nMl8aRJVE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENhjVjamXFfTOWvNWhGxnm3SYo1DdXM3SlUO
 I01zN4+Ej2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYQAKCRARpy6gFHHX
 csJhD/41uNfEdZ3tRMC75zzp4CnhiXrt46FBQT4psqdelXp98bVEkOHXgzmXYZW5Ik0AY7EST3f
 0VQ5IW7Dh0cu4/kLyfMNYKDhqj5fKYL8E81zyQXDrfB2WBLx03PlacQELN4/z4jnWEAYbTWRPFN
 YJlyLUCtjTJx8JsBByzDPc8VyYrtfvUh4Gzk+Mwh5uM1eZPnDln6HUTh2Ag+389nCJk6JyO2bhv
 z4qSqM72/dZHtlv3txUeEQ6j8HQKYfMi2nF1lvM6nbkJJfQxYsAJYmzRmQwp0ibv/yFbpiu10Wv
 lYOfsdXddY9ou61+KgWNBIHsgiPG3b3eJHNqsI7XCA2EcAvhvuJ7FlZWEpwIeMFiYOBf2BMOSk8
 CTr6o3UmvZm8v5UALKEi3HEcg59EiVMg8AgwbQ9IRSlm6AVtrWx0tpRn4IGXeX2wm5yNGiVY4xN
 0tsDvn/9gdADIcIakQkmpnLjA5vpJSI8EnFwz1VXqwEcZ3Zc6bs/8qjPFNPWPOyl1HIUSbJu1H3
 HjU7W8fxe26v84T3oQmPCpve6BPPKBZGxbxhQ1M+2gUIXk5HslIXkYgQSPgC6yDvJfuz2STQ7L/
 sDX9cxUN+B28QnwN/Tm8uH9gNtQBRFzQnwIvziL/X1QwsB9xYwtHWLNNGscjIlmjGZ+lbOyk/gO
 yVyxBk5mpjlvrPQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for future commits which will make use of descriptor AND
GPIO-device data in the same functions rename the former from data to
desc_data separately which will make future changes smaller and easier
to read.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 63 ++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 03e97697b7f26a8aa9f527f25f048f25588f3ca2..398cefb4be9e389a820dd53f79c82fa70783b5e0 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -686,9 +686,9 @@ static void gpiod_attr_init(struct device_attribute *dev_attr, const char *name,
  */
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
+	struct gpiod_data *desc_data;
 	struct gpio_device *gdev;
 	struct attribute **attrs;
-	struct gpiod_data *data;
 	struct device *dev;
 	int status;
 
@@ -720,47 +720,48 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto err_clear_bit;
 	}
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data) {
+	desc_data = kzalloc(sizeof(*desc_data), GFP_KERNEL);
+	if (!desc_data) {
 		status = -ENOMEM;
 		goto err_clear_bit;
 	}
 
-	data->desc = desc;
-	mutex_init(&data->mutex);
+	desc_data->desc = desc;
+	mutex_init(&desc_data->mutex);
 	if (guard.gc->direction_input && guard.gc->direction_output)
-		data->direction_can_change = direction_may_change;
+		desc_data->direction_can_change = direction_may_change;
 	else
-		data->direction_can_change = false;
+		desc_data->direction_can_change = false;
 
-	gpiod_attr_init(&data->dir_attr, "direction",
+	gpiod_attr_init(&desc_data->dir_attr, "direction",
 			direction_show, direction_store);
-	gpiod_attr_init(&data->val_attr, "value", value_show, value_store);
-	gpiod_attr_init(&data->edge_attr, "edge", edge_show, edge_store);
-	gpiod_attr_init(&data->active_low_attr, "active_low",
-			active_low_show, active_low_store);
+	gpiod_attr_init(&desc_data->val_attr, "value", value_show, value_store);
+	gpiod_attr_init(&desc_data->edge_attr, "edge", edge_show, edge_store);
+	gpiod_attr_init(&desc_data->active_low_attr, "active_low",
+				active_low_show, active_low_store);
 
-	attrs = data->attrs;
-	data->attr_group.is_visible = gpio_is_visible;
-	attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] = &data->dir_attr.attr;
-	attrs[GPIO_SYSFS_LINE_ATTR_VALUE] = &data->val_attr.attr;
-	attrs[GPIO_SYSFS_LINE_ATTR_EDGE] = &data->edge_attr.attr;
+	attrs = desc_data->attrs;
+	desc_data->attr_group.is_visible = gpio_is_visible;
+	attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] = &desc_data->dir_attr.attr;
+	attrs[GPIO_SYSFS_LINE_ATTR_VALUE] = &desc_data->val_attr.attr;
+	attrs[GPIO_SYSFS_LINE_ATTR_EDGE] = &desc_data->edge_attr.attr;
 	attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =
-						&data->active_low_attr.attr;
+				&desc_data->active_low_attr.attr;
 
-	data->attr_group.attrs = data->attrs;
-	data->attr_groups[0] = &data->attr_group;
+	desc_data->attr_group.attrs = desc_data->attrs;
+	desc_data->attr_groups[0] = &desc_data->attr_group;
 
 	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), data, data->attr_groups,
+					MKDEV(0, 0), desc_data,
+					desc_data->attr_groups,
 					"gpio%u", desc_to_gpio(desc));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);
 		goto err_free_data;
 	}
 
-	data->value_class_node = sysfs_get_dirent(dev->kobj.sd, "value");
-	if (!data->value_class_node) {
+	desc_data->value_class_node = sysfs_get_dirent(dev->kobj.sd, "value");
+	if (!desc_data->value_class_node) {
 		status = -ENODEV;
 		goto err_unregister_device;
 	}
@@ -770,7 +771,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 err_unregister_device:
 	device_unregister(dev);
 err_free_data:
-	kfree(data);
+	kfree(desc_data);
 err_clear_bit:
 	clear_bit(FLAG_EXPORT, &desc->flags);
 	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
@@ -827,7 +828,7 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
-	struct gpiod_data *data;
+	struct gpiod_data *desc_data;
 	struct device *dev;
 
 	if (!desc) {
@@ -843,22 +844,22 @@ void gpiod_unexport(struct gpio_desc *desc)
 		if (!dev)
 			return;
 
-		data = dev_get_drvdata(dev);
+		desc_data = dev_get_drvdata(dev);
 		clear_bit(FLAG_EXPORT, &desc->flags);
-		sysfs_put(data->value_class_node);
+		sysfs_put(desc_data->value_class_node);
 		device_unregister(dev);
 
 		/*
 		 * Release irq after deregistration to prevent race with
 		 * edge_store.
 		 */
-		if (data->irq_flags)
-			gpio_sysfs_free_irq(data);
+		if (desc_data->irq_flags)
+			gpio_sysfs_free_irq(desc_data);
 	}
 
 	put_device(dev);
-	mutex_destroy(&data->mutex);
-	kfree(data);
+	mutex_destroy(&desc_data->mutex);
+	kfree(desc_data);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 

-- 
2.48.1


