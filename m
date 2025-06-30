Return-Path: <linux-gpio+bounces-22429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C656FAEDD1B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE8B93A8E53
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB79F28B7F8;
	Mon, 30 Jun 2025 12:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LeRQsSqU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97EE28B415
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287049; cv=none; b=USpkzSN7Ns+crsEe4pjZHOLdRtN1ErRBsLmUUnsAkdqtmoea4ebofy8Y0FU6yFpqsVyRcHmrs1mQvuDtBpMxJwnMT8laEinCmSMrMRsYVZIXAYumtw8ZNh0McovkERkkkeV33RyNyN57TFnkoj4TNRgdsEE4SwV4Uuq2NG3GQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287049; c=relaxed/simple;
	bh=NJEAN9Al3XjEemr7o+4Pa4oKPW5W/hEOSmrV3Llc/Cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uo95VCSZHW4m2LAKDUftw1yMC3nnFGiVxiIEYmJdjjfHweOMHG9yqWTOYIi437vVNtJmZpkIKTbHn/tD4D5jcBu+CVMwrKR86jyx6jamzDudus2nP9EcHmWdRi4oBw/PREmrPclbC49fiWdddQ3uBwErmpYI3r8NQJiUfZkEkS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LeRQsSqU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a588da60dfso1261560f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287046; x=1751891846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMK8VVzfoB0W1kbIMTI0Ku045SkeQvw4vKYkz/7sL64=;
        b=LeRQsSqUnde9xZmfLomcOw7AlcWoId7E+RlhkAVJ/a3dmp8Xr7B9nuDAJbts8anPaB
         SsxQDnyTP+zxgDYtCWFF0I27TPa1jhclfEWKUQUYAIUpEIdGPbru6Yw4h11nefmWsHRy
         dEAWIgCb6adgrXcNKj6cy2VX5Ov5zPyelMQNYT6054+/16QlABKpOm5cg/gP5l4qD/Xd
         2RepwFvjYoulrAFC9zbf3/G3BTeCi5rAKA8MWfY8R1znF0Buy+gL1cHs/7y3OUNsnXzs
         UVUhCPbE4hs87xLnhPc19by3NLtKC28fksKzMXr0K31pI0FIWZTHetehPpm3cAYhNfA6
         ZHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287046; x=1751891846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMK8VVzfoB0W1kbIMTI0Ku045SkeQvw4vKYkz/7sL64=;
        b=tXpTZc5xw7htTYm7EDJ8IYVKOrdvjovwg75dDBJ9IgkwwKFUSYrPtkyIEZyg/8qxkb
         kQQlvnft7CtzGQkdRn6wTxk5MTR9QzLNFuT5InSKbZjntL7t1iBcSJGJobAdbo7ORfWw
         6Y8ELg6yOLZ/ccR8X6234xGOJ6RvDfBhWgNJbV04pqJYXuH0xW8doRZ+cOCqzP3lQXZe
         594vOfyIwY6uQ+eXOlIvsRgVdZY9oUCvgwieJG6G19Jpf/YNTN4/+PdaZWDYzVfIc3Vl
         PXqXA7+rdGNMRxqQUG7gjYqNIMHN3fSXi1UcIbVxYn5f6+CPh4ymRQlj1O01XGAQCLef
         +JXA==
X-Gm-Message-State: AOJu0YyTDyJJm93FG98Dwxa7s246UnKc4pJYYPUFJPQcpLy8NRhTH0ad
	1VdsOJsti+si0DFFaoLghoFTFeAzctvFgCIHrD9gbYHHGToLF/BVtHfMt8dJssdcZDw=
X-Gm-Gg: ASbGncvTa611qcDRd+okxF6QcbIzau8AjFgnyZscdHsDXF0OG0SAzIsKqQthA0MRhId
	3Yc//evT5eY0be9FFQ3p+ZLb/K8aGRs20yOp/X4WKeiZ+WmE2cgWhg/kYarTtMme+6vurHN9XbL
	42swndF3akEaqxnSllQzwcVDpyIY1GtP+dMKnBs0kFI+eUCPkeqMNz7xufmTrMyGOqJhZsG64Eo
	0M05OcaI1hn/iS1kaqvinG1waSbczIJg0ASD7WAfR28osRefC0dCy84ge7vILUps08hZsM8qPwG
	Lo0U9Zw+S/VqzPC+6lK3aUa0sq6KK255OyzkNgcCWJjHzjoUv2hXgiD6
X-Google-Smtp-Source: AGHT+IEQQRsGn1tsNuZ6QZYOQSgf1CNJihzZg9Su9m86hhgZDcgNrjfNcSEBTamy3Cz6TW2216s2uA==
X-Received: by 2002:a5d:4a12:0:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3a8ff8f4ddamr8429903f8f.50.1751287046047;
        Mon, 30 Jun 2025 05:37:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:12 +0200
Subject: [PATCH v3 05/10] gpio: sysfs: rename the data variable in
 gpiod_(un)export()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-5-b997be9b7137@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3528;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Jj96ppj13/1W5rmHbDNktScNK/XOw2pY9MfzDJyINRM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT9rg4ulpGk3EMkOyKdkFNILb+RMqPgRci4k
 +MlCTcrB5yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/QAKCRARpy6gFHHX
 cq1tD/4oyfBTSMqAhCTGK5vPL3TU9HQ/9ysX2ZCAwXXPSUYxobejwLtj5tYgrcxyAN6BdbXS9Xm
 Pze8RQZEkMzks3XIxlaxv1ZJH+xEq0liS31vW4KODvucmjbQsEMjecTIu7+qvcawIYOdK35U3j4
 aeSp+1oIdqrkDAjp7IL8IgvihzD6lCnjSFIgdUD5oIdErTuIFJIFde2EBXM7i0TkmZjWD4xKail
 PDTykVv1QvYKD8i30COb7C+fzjRjj6j8rg5iqUu4OP0H6P0QX0IO9Qt5A3ZHQox+vK7XGvJXBHz
 wZemopnsY1YF06W3MSpa1mehmF299lHk+pqtk2yyO/MdoRjpto/D+9UuO5nMB+YYTr5YztEZIgC
 RtFDeAVdpMajaHCYkNd5gPdBvjGtIVsDpV5Nnjlxai5BMTisNt3br2xt+MctxeuVFDimV4JvlS9
 ufZLW/T08ktYXNt8yPxFS5jXKxLWybx34YdjaBpQ6HoNKLxaGFQtYH3beSdcGoNyEKOmbdbo2E4
 EtvYXDwn4rST4Gro1nLrPoN+Xvm1gmKDZCUrMOSE93yWtgQRQfRPNra3tWxxgNUDpjaWII8crj9
 Q0+RtDzzmLxy41n78dFHfqTD9kWZItHBodd99j75rgez7CnD2JhLmBDbcopWcElyQisMDJ332zY
 I4NjVXiqa1ndaWQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for future commits which will make use of descriptor AND
GPIO-device data in the same functions rename the former from data to
desc_data separately which will make future changes smaller and easier
to read.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 59b66ee222a84b36a05458c8cd6cfa1d568e6783..dba9dceb5e79db16f466ee40255c8f646b6b6d15 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -663,8 +663,8 @@ gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
  */
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
+	struct gpiod_data *desc_data;
 	struct gpio_device *gdev;
-	struct gpiod_data *data;
 	struct device *dev;
 	int status;
 
@@ -696,29 +696,29 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
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
 
 	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), data, gpio_groups,
+					MKDEV(0, 0), desc_data, gpio_groups,
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
@@ -728,7 +728,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 err_unregister_device:
 	device_unregister(dev);
 err_free_data:
-	kfree(data);
+	kfree(desc_data);
 err_clear_bit:
 	clear_bit(FLAG_EXPORT, &desc->flags);
 	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
@@ -785,7 +785,7 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
-	struct gpiod_data *data;
+	struct gpiod_data *desc_data;
 	struct device *dev;
 
 	if (!desc) {
@@ -801,22 +801,22 @@ void gpiod_unexport(struct gpio_desc *desc)
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


