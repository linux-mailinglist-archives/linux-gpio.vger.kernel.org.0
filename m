Return-Path: <linux-gpio+bounces-12095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE639B020C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C921F232CB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 12:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB9E204F8F;
	Fri, 25 Oct 2024 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iVDc9yy8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB9203713
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729858758; cv=none; b=EFLwE3qRMVc/uy5xtwvSAcT4Cb1dorBUvyLauYV4Zz11GMW8q5RWW3t+VTqh5RAaoLq20phG9H9zgSul30m9vYCWtYUqLfilJRKfs1IABgEBZfl1jNXPGvj9a/Hc2or92aJHfXtmAcTzIGG4NofWW/uloDQC7zSig7GxY1/Jv4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729858758; c=relaxed/simple;
	bh=vGacZSJsF/zEPOCOfp2fY4vg3hpQjD8RerqM2FLf0i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2miAbZjBm9ZXmPDhXepIZutl9vEU4nppR97/OkdCqVN4Gx5ItK/+RkRD+rHeEUGrIP2ae9vdDQI/z+PB6t2FX/k1LqReNPvTnDBS5vWlG2EBInSD15twGOV1HALlCdl7rG+8GzH5LXI4iSK+Evi2hcOVlW18cJq3xNN+dqCq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iVDc9yy8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so1526930f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 05:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729858754; x=1730463554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkXhfQ9nM60iv4H/xHYROLBa8xfrajHImGbE7g895+c=;
        b=iVDc9yy85avPclPX8dBxrraV69yjwpYjp2i640XCwynL7fxNO0Q3KCArKb9DbNENOu
         qpP/6/9g3M2xwZsBMu5HFFZ3QejFA0bNuv2xtibJ5b0eo3/Zr00qXav2KRsYtxBwYN4z
         HDZC/5ds+6H5uXylP5G6TViIuyv5e/51ae+xT41pjmreN9E/CX8MUmlC5gIMmUhuoGIL
         ewbUiSOWS1IDETaw6B+FRb7BuSO/5nEz16V/l85kX3TAyZRMFUQSzF2NiR7FJ8FEKFoq
         TYYcFFeCOT39JCXdi8Z3a6Ff0CsowrUCAo/6fBJbvT807lhIC+IB9qJKL2bHQhhQWpOZ
         ehEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729858754; x=1730463554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkXhfQ9nM60iv4H/xHYROLBa8xfrajHImGbE7g895+c=;
        b=Sw6p8RlnH7GR67fZLJWMfPC9iiP1ht1dDuJIfkOwdNVVDS77nssexZfsLNtqVR0X8t
         t00wuZOHGeqoOYi8J5e9aHAgHksvlbaJl5kzBaS7GyTcDIxIFVY3i1voZ1YnQfSnMlPJ
         ERUZXhHJI6uY4r2dPdvmRvAySwmRlo6nYMsM5kIAr3E2tSIxhBvTJNuJWnghVqKGQvix
         gdlluwXMWPaw/5CRckMfxD66Gvn6TS+8ENuHAq0GDZURRkqyH1CWQTnIJsvJo8I9P97E
         uOW9tNTLDaWTWLbWqX96wEMxOFsoJxRNOfYz/3Srx4w3BvaCnPWRW7PQLBLbM7SekNoY
         cE/g==
X-Gm-Message-State: AOJu0Yxta+1cwVE+YGuZOxNrZsXudITr2z+NnhKuy0QfD1lTiNQQTZkj
	b6dbVNUnMhOKuQJw75BqCHwgRSx15E4I3rh7R6wtZcOzGG5P/J1asJNWvUowG0k=
X-Google-Smtp-Source: AGHT+IE2tXt2Qer18t+wkhSxAxHD2caHuxLHzHS1zu2TOmYNonvrqSJZJIeBGjAkop7lbDUz4Mqz9w==
X-Received: by 2002:a5d:4f84:0:b0:37d:524e:9431 with SMTP id ffacd0b85a97d-37efcf92886mr6259120f8f.57.1729858754237;
        Fri, 25 Oct 2024 05:19:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a207:5d17:c81:613b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132ecsm1388966f8f.5.2024.10.25.05.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 05:19:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 14:18:55 +0200
Subject: [PATCH v2 5/5] gpio: sysfs: emit chardev line-state events on edge
 store
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-gpio-notify-sysfs-v2-5-5bd1b1b0b3e6@linaro.org>
References: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
In-Reply-To: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KEBKmL5Mi8XWBz+1StVeG7MRKVKk3MzCpGTWbbctQO8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnG4y96DCODDSye9DZO0Oi3IwIep2yJrN6mlBXk
 qsaAT+cf1iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxuMvQAKCRARpy6gFHHX
 ckqXD/92s3lNaJeWMk7N4OgOFtmjrvlE81T0x8hTutmv4Enkn1WkR75okUE1gZVMihVmVP8slTc
 ZHX9ZkJoojMcsLXIeIEx62mA9uE3lHHKJppHCEAo0R9JOhpQEQMVfz14FGdQu62FHBUC0LNfwV0
 n5H2g3j4Mc0OERpNOABocWTXj9hFueqHlT3PK3m1rgAenlQ4c0E2P+ycdhVgExBG1qP4kGIWu76
 f1dwsouCJvLuGLJBHth6cmAzme0mHH+7CHVskViipJtno0McELQptlEZsSVVvcYLBY/wOLwWJpt
 u+pu+upg+gb8Y2ewNaeNBVIlcraNapxGQ0KAg43/y4lRL3iUSV/iGZim3fVE3ijgGinGtWFxb65
 aJRJjYrtjhG31W3Hev2FL9EuzuegAzIZxERLjtQi9nJ2/w53gOU2Vbk9vhBAoq7i3v7ILZdRU8i
 eD/uVgHD9SVmdrONj9ZP7AQ/FwKb1LfT9xHC22RuXS+0fA/m5Wh7fKhnLCgbhYQHB22QwqpkCNI
 Q9TK1lMC1fwD0RRZqQ3sS/TYa05wsi10yY1Ur5XVZTDKgNXlYM8OzhuDkZ6P8qZB75DAr2dzA7i
 hQVH1qoL5WZ2Yoef/okwJMM+cF49PpVDqXenCb7fB6/svV50Y8PlDEmqaKrU7N4rOxwGhkgQ/t2
 65dsbVomjVn+7Vg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to emit line-state events on edge changes in sysfs, update the
EDGE flags in the descriptor in gpio_sysfs_request_irq() and emit the
event on a successful store.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index cc5c51ca9478..5b7d65117d83 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -178,12 +178,16 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 		return -ENODEV;
 
 	irq_flags = IRQF_SHARED;
-	if (flags & GPIO_IRQF_TRIGGER_FALLING)
+	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
-	if (flags & GPIO_IRQF_TRIGGER_RISING)
+		set_bit(FLAG_EDGE_FALLING, &desc->flags);
+	}
+	if (flags & GPIO_IRQF_TRIGGER_RISING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+		set_bit(FLAG_EDGE_RISING, &desc->flags);
+	}
 
 	/*
 	 * FIXME: This should be done in the irq_request_resources callback
@@ -209,6 +213,8 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 err_unlock:
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 err_put_kn:
+	clear_bit(FLAG_EDGE_RISING, &desc->flags);
+	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 	sysfs_put(data->value_kn);
 
 	return ret;
@@ -230,6 +236,8 @@ static void gpio_sysfs_free_irq(struct device *dev)
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	clear_bit(FLAG_EDGE_RISING, &desc->flags);
+	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 	sysfs_put(data->value_kn);
 }
 
@@ -281,6 +289,8 @@ static ssize_t edge_store(struct device *dev,
 	if (status)
 		return status;
 
+	gpiod_line_state_notify(data->desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
 	return size;
 }
 static DEVICE_ATTR_RW(edge);

-- 
2.45.2


