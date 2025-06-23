Return-Path: <linux-gpio+bounces-22006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B75AE3936
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82FC018954DF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8212235360;
	Mon, 23 Jun 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GFNF0qUG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C382C23278D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669221; cv=none; b=bjPA24J1UhtkqUNfYspiuPCFxw/wquGsloJ2xFKVG5PooH7J4wSU2mGQ04ZTvZ03wQKvB55nfqn3E3K+CxmkAUAhMs4K4QMSv2C2ayCmVH/o9ZLDr7vCTWTk5YhDsy+5Zfuq2xmJOinfM9fv+sC+9JbRmbSOEHWYd/c1/Zf2+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669221; c=relaxed/simple;
	bh=OcqJsEUM1xWbR2r6pQJTV9Hz2KFYFTWBL5RX6WgAeh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1NPSK/EWRib1JkgkUjYSlF4GtV7GliK7MKjhOHSQbAolr6IUO/f4kgyPyMAlenv57s5pkO3FRCujcXoJCw9ucBvugwWrT3hGkKpyEr4Yl8EZVmi2A+E2oEuzNqjN356qeAka4fRJrRW37SlVCxd6p67ZJA0aH6Zu7ldKow4lhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GFNF0qUG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a52874d593so3875428f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669218; x=1751274018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4Vor91tK66rCEdD8zNhQRyT2QrbuD1L1ZgU5UjDLa0=;
        b=GFNF0qUG8QS9CHsGb02CSYbsxVkilmtHw9x5b23JYnJY4mHSrL8XgZc+k6vkNePPGV
         OR0vIPkPM3sAYtzxZRImRBtZutAhHre2A1etiUXzYFHFKhJUDGaNsdBma9bB/MHXSjsu
         lNeg9r3Ars6I6FiVYoUK2ft9bR++ee9qpXYbVHmjv+2Mw9krURuxZVe1ZPwwZ0MKNGYw
         zkRCcn3YxW3xXIbmSpUigX15WomYUHT+P3RF6geAumNtn0Qgr25cyyRo8+DroLom8b+x
         +o6AV9dd7T/x07peBxkqXdp0+ntuJ/oazLUwe1bHrwORG95f16TYbCk5vF48zLwOi7Z2
         8ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669218; x=1751274018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4Vor91tK66rCEdD8zNhQRyT2QrbuD1L1ZgU5UjDLa0=;
        b=i5GuFJwCgIiDbyij3nU9vZfQkJDg0XFst9KTH8HNaRGq1y9I6SF5zR9Cde2YwO1tNG
         48eMEEjNfiDfN3fHA0KtQmZDlj3lxQQc4JLtZjzButBmmPznEh9LH/mT9A5teJ3DfO6Q
         O1fLQxu8A21kesKdbcDvoxjDY/jYOokvSsa9ORszvQl7b5T0L7sftwILlbXdLqzm76uA
         6tLmO5n1TRkvWyNTtqOmuIjSUvOEtp0LO46yM5qMh45GIyZXnkBX8PjKK9SNwzQfxkPT
         NIIy1g38m55PYmthBm+KcxqVyoZMXc3Rp+cHGXQQzntstJhg9llYyMVwmmXVpBwc7FQh
         iuxg==
X-Gm-Message-State: AOJu0Yy5UyZpXJJ3vT7uV731yTOu9Cu9q5x5596v94QLvyjOmVC/AW/S
	BH2VZ/y40ilYECHj9oJUoJW49ddiXbKe/VS3FXHoOy/6DiXfSsOBv1BesNTgxNK+3Sw=
X-Gm-Gg: ASbGncsOc2dnDx3RnktMGGY1YKlzEGjJ5gwZHZpDKpzQhAy1v2h7jpSZ+4jZcqIBza0
	tJ4c3kNjWNoctW9Kf9MEn+Gf1ZuGQGeF/68XX8geBi2TWvk38gpjo+chkKVvQENApAkz8ASJI1g
	cBR1wU7/CWb67XVMpxoiv9s627TnCEhkPcNy1Ds4bIU1bVmJi2cT74yEiBHRhIW/PL4ZmXIH6ap
	rRY0WcTgc7LKWEU7fAr1gBw7+YetoIBNUatY2cADCxAR5vDyPSS9DmR1M6RB+RJLztmMqfKT2fe
	/3HOkvdBdDvDlSPu1fhis8i1+SZUrr3rutTbW252BPgp1p/KNfu6TB8=
X-Google-Smtp-Source: AGHT+IEssh8b+M/C5pOBKov3j6p5UuNMdQXCUzpb/c0+PD9r4n4tyHdOclgtkZgAmPRneHVDwFiyUw==
X-Received: by 2002:a05:6000:210a:b0:3a5:2ef8:34f0 with SMTP id ffacd0b85a97d-3a6d12ded04mr6575267f8f.22.1750669218005;
        Mon, 23 Jun 2025 02:00:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:59:53 +0200
Subject: [PATCH v2 5/9] gpio: sysfs: rename the data variable in
 gpiod_(un)export()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5053;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=O3iMdnAGNEOg5c/O2kjNy+wYU+YsFdH7aQx5YLYylI4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWReaLAPaPP5FpnqFOig4/0c+MPFs5mqraWG0Y
 WkUbQPj5B+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmgAKCRARpy6gFHHX
 csxeEACwLSFlUsuBLuBU+i83AAUODvYUfoO8eH/PcaeVfVQxVfsFSdoyUt3IZUU62TqoHYHh3c8
 dmEsqV1jKegLLJmHGYHqFtphDRUxJtOeN26jKsBqHmM9hAuQLZ5OLniDAfQYzHECG/MVgw8791D
 4drOXiqF7FIJfiQqEWmisERkv7S4M3K/MjCc1jnngyD11akcteLNEw0tClPJzklUwOF1cL2gZe4
 DKjc9CAWQgvtJmVX9hPiPjnGhY9sUuMUdBHGXKzbSEns7z9qosMmkaMdKREZddKc3HnRfnXjkVR
 khk8a8c6duh+O01HRshAZxgOzDuj1P2nV0IV7ljkK793fY8baIRWaN1sF7rtGDtNjkVyxfET9kM
 5QvEC8uOiIIgXYtXkLvAJ+lFz6d5cxZNuFEmq1K4A+72Kq7mP8HaVeTe/M4H8mp72JiFoBvOVhk
 XMgvUY9/uiMyIqGuzw68k8EnJCzuEGRrsbAaOtzGqV7jGRa3FL42Y/fO1wNmxPhKXCe6D51hKSe
 a3qk1CLDNaUHLgQkE9T5N6/tJA9oSmku9HLElr1NbdPan2alToa/vkd2W3rOVRjd/1YDgqZpztl
 cB10XbahMe7niQYEMuXW2qRuRe+4WzRcPLiMDk33HACKwrMWneye2S/5ObgP0UefX+8VS7sPkDd
 nDj8qWiw20btQyA==
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
index 2f1df2ceb7360200c718ea95089720ebfa5a513a..515fd0d307cf820b036b1ea966b300715992359f 100644
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


