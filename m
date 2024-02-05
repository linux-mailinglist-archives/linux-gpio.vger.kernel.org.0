Return-Path: <linux-gpio+bounces-2946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A174849698
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 960F6B220FA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DDA1400B;
	Mon,  5 Feb 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RGGg8q89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E21134BE
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125674; cv=none; b=pevgOW8CIWvJ4I90LFn3SPXPHCmWU9Z6qmAVp16eU+WpZB3Qowwfl/PeZ8z8DPvWq9Dy5WTTfPekmC+AE95eVaWOdzWGu4gTsJxEd+hbjBPWOCnVAj5UqcqTO4MwFBzge3us23SjYZB6jtjAlP3EcWF5qt9z0xg3DHHEhmRV7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125674; c=relaxed/simple;
	bh=YfUs17R8IhDrlEqhEZxI5M9W373vGN2Q0/ixlOWEz9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aOqZRfyz0vX9FS1lQDYb3+ZlqfKJdSfg/xWRxCKVQiXEfsil/oCwCTOAMgea1B5Hum7IIp5UKVfGprY1VP4ZDG3iKBAZq40C5oJBm4zHEDAGPK6uNDfi0YycZkYAIOv+Z/4iNVA7ze6P5BXJTDy1FhTaJ5/yMqZWuYVznbxWBOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RGGg8q89; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40fd446d520so12313065e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125671; x=1707730471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpsQDT+5nWCXpBfKiz7J0RVwkAnu4buv5U2Z10kutak=;
        b=RGGg8q89OytlDemlxtnZ+lVkD8YTSn9byWWMiUr1VU2rShjXSvdsyt3r9hnTa4J+TV
         yl+ssFKmXnXokYmumyMaopS+8GmTd3BhBkasjxscjNFSQNVNQHUjNExUCxvmj3j4c9n4
         5Dhzv1d6FbVcJGhXz+0Er1p3d2po4UFg9PV+jxV1AQKPxDT7AuU3QdpVvE/0ltuiLGo3
         5KwpJLp5cKB3uDN1D84RoFGf21VSAhjYwu0/svu5pIFM+K4BM/onzzdtn5c1AJ+ldug3
         zT67NdQNojnzYtvEVYcjagN9AlAqrKhTEwPx5Pu0J/EPNUtIVc/9n/XWRTaLZni76at7
         2DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125671; x=1707730471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpsQDT+5nWCXpBfKiz7J0RVwkAnu4buv5U2Z10kutak=;
        b=eZ5yNjL/qiVgJ6XP8Hh2zzhdHOFXm+mVXjh2yPsnk8cAx3YDoEPlIpWVGnBnIKG5BE
         8yeXi3tX+iXGDtqr6KfnNJ58Aojbk4QkuTbqM7NAFIbR7jy++8Qq05mVfK+SWBYo4BVA
         b1Q7mzSdrr6PGBrRQVtojflGxDy83054w1Ac6uIX2Ylzxp8SSzaTUZL2QCop3M9i1fS8
         a2Jlj1Uv5bQppvBX8ByR4rYW3cyRwe3TgG161UCi+0J0G8xKIEuDVBRgdv6svUQda6t1
         zFeXbOnx/Y1A32Eoy3IfJ/1C5qtfKXPG7BNWrQkC8yYNL961a1pY3mcdDTFqz+lIWNoP
         ZFNg==
X-Gm-Message-State: AOJu0Yx7H7/rcGrYA1bEgb8SGoEwtxZCcbXrIazCNy/stwVC6R5/6FyS
	HByl8v7Fyw4d2X/5HYk3siuvU1Ba/X9Q1Q05gyBi8/WFUF26RvCmkRknVkUKF1A=
X-Google-Smtp-Source: AGHT+IFyKoc6eaHqWsITQ4+Ew7YxpHQC8SW/NhaAAtC3PI9fpag+n2maplobnK/D3irrszBWC8OO6g==
X-Received: by 2002:a05:600c:4f91:b0:40f:b680:3e84 with SMTP id n17-20020a05600c4f9100b0040fb6803e84mr4720748wmq.2.1707125671145;
        Mon, 05 Feb 2024 01:34:31 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV5ryJJgj3e8xjpQT65Nhl+E4gf4Nj+r4X4IFAL4AEZ/lGUwSZ0u+qFf/rPXMFox5a2kwQQv2on5DmzAoN3wu4NWApqIt10a2UOSYEtgwzO2EnTFT5lsh0vmX1j2WdXH+aTpbLYXOcM0DakgeJMcdQprv+MrtnPuP871RkNCO2+7vLEjXhAtZMnLeeIt0IxYYHmsdlwJegB06/90U9myiaXQIj7QROYhugqt62IyRIeaYcPnXEWA5HXmsw99ndaQhJ6afbJtYHIzsJhcucnfJba8IZ+7dYUIXo6ZNY1dZAcjGN1UyjBzUrCTXaD15G+AOEdCjqE2kMJNGpS6Qfp+8uVwaAc45ld6w==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:30 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 06/23] gpio: add SRCU infrastructure to struct gpio_desc
Date: Mon,  5 Feb 2024 10:34:01 +0100
Message-Id: <20240205093418.39755-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205093418.39755-1-brgl@bgdev.pl>
References: <20240205093418.39755-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the GPIO descriptor with an SRCU structure in order to serialize
the access to the label. Initialize and clean it up where applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 18 ++++++++++++++++--
 drivers/gpio/gpiolib.h |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5c041d57077b..ea0c0158faaf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -672,6 +672,10 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
 static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
+	unsigned int i;
+
+	for (i = 0; i < gdev->ngpio; i++)
+		cleanup_srcu_struct(&gdev->descs[i].srcu);
 
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
@@ -832,7 +836,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *request_key)
 {
 	struct gpio_device *gdev;
-	unsigned int i;
+	unsigned int i, j;
 	int base = 0;
 	int ret = 0;
 
@@ -965,6 +969,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	for (i = 0; i < gc->ngpio; i++) {
 		struct gpio_desc *desc = &gdev->descs[i];
 
+		ret = init_srcu_struct(&desc->srcu);
+		if (ret) {
+			for (j = 0; j < i; j++)
+				cleanup_srcu_struct(&desc->srcu);
+			goto err_remove_of_chip;
+		}
+
 		if (gc->get_direction && gpiochip_line_is_valid(gc, i)) {
 			assign_bit(FLAG_IS_OUT,
 				   &desc->flags, !gc->get_direction(gc, i));
@@ -976,7 +987,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	ret = gpiochip_add_pin_ranges(gc);
 	if (ret)
-		goto err_remove_of_chip;
+		goto err_cleanup_desc_srcu;
 
 	acpi_gpiochip_add(gc);
 
@@ -1015,6 +1026,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gpiochip_irqchip_free_valid_mask(gc);
 err_remove_acpi_chip:
 	acpi_gpiochip_remove(gc);
+err_cleanup_desc_srcu:
+	for (i = 0; i < gdev->ngpio; i++)
+		cleanup_srcu_struct(&gdev->descs[i].srcu);
 err_remove_of_chip:
 	gpiochip_free_hogs(gc);
 	of_gpiochip_remove(gc);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 1058f326fe2b..6e14b629c48b 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/rwsem.h>
+#include <linux/srcu.h>
 
 #define GPIOCHIP_NAME	"gpiochip"
 
@@ -147,6 +148,7 @@ void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
  * @label:		Name of the consumer
  * @name:		Line name
  * @hog:		Pointer to the device node that hogs this line (if any)
+ * @srcu:		SRCU struct protecting the label pointer.
  *
  * These are obtained using gpiod_get() and are preferable to the old
  * integer-based handles.
@@ -184,6 +186,7 @@ struct gpio_desc {
 #ifdef CONFIG_OF_DYNAMIC
 	struct device_node	*hog;
 #endif
+	struct srcu_struct	srcu;
 };
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
-- 
2.40.1


