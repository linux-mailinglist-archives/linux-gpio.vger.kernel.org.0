Return-Path: <linux-gpio+bounces-22427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E45ECAEDD14
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88154169819
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F57728B3F6;
	Mon, 30 Jun 2025 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fOewLP23"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2828A724
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287047; cv=none; b=Z6BwoMp+MCBathfipDytVNu4U3mRskCv3UfZYIVhKtOFkyjb2UyKzdYf0/RM8LH/E5+Ozd32ecKKyaFWZz0PEXDQVFyHCF9UiFA2Po5OuamU/eqsbqqOkPdSEsH7dOuhaiy9JFVCg4iHXBLEEKXNSl+T8LlrUGuQGgQ4oGHnWZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287047; c=relaxed/simple;
	bh=vSJoeqW/0YSRNvc3L8Rq4FI72ozCDU5AyIHLHoUl5+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyZONmuRgGFgowFMWXm6MKVLWFNq1ZdySns5PbeTorQ14maerQIeTdiRM3SPBDJIvpp8b1JwrJBn/HLUQ9tUvhpxmNfFCM8D88zCmHkCSIq+4Z7oI2dlO2XTKJwjV7WD4HbPWZ6Zl0zjexartaZUmIpMIkHrtj73GEXgbsDlkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fOewLP23; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a54700a463so2629358f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287044; x=1751891844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBujJaT2ckR8gXJqLyS4Jh8PI0jBXSRVKotutG8LOQo=;
        b=fOewLP23liey9saXvmCTzUkwDXBpaPVs2BhwSAgaVX9S7Wbf+v54ZPP/B5V1hf/itN
         Nz+XPkhgFNuKwF6gBOjmzn+2q0MAx290ccfQd6Kfn+yH1+jX4c9dWMsl6L6FPCsX8490
         dUPGnQC4ZuLK0cqzj/kwqnbJysFcYWphqzgJT0eclDeAOspBisZip4i0oQNd+r+d3G7X
         5tPxuRN2A20RKw/IZvOyEvpDuZ+bwcMch7iwDtbRJ18s7vbFN4Go9C3ufM+mmrC8KdT9
         yEYhLEwIf7qmuxgaD1gDx1edsa+7SAkkGVPlDmBXWvR/I4zeAZh4WiLgNfYnuqONKjLf
         IZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287044; x=1751891844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBujJaT2ckR8gXJqLyS4Jh8PI0jBXSRVKotutG8LOQo=;
        b=gzsnMoL1s3v2RZ5Laa3HfX9EUbEh4m4wxjvJasNfkIhDjIxWSMXgTx62C3pwBfY0va
         JJR5Jm6IJFdw72TE9HCNgMOXHFHL/JbrVup37w05U0z1SmBHWaz9XoQg7oQxc5KRWgGt
         B7uI1yMfGdpqIZRyMuhmRExf16vzGNgxWUnOGYsnKyY6iLfToB3cdpURsx8tjii0NE0/
         UFlH7BN7AJ4ThX5fGp9+Z4PsH8DglWNMpaemeYcKHMrsy8d84OGX6TavPl9w177BuO5M
         XVgDyq1QjL7oAcao3SWxYE1WEZ8LQPoWvnc/73rLEpfurYTs3yCCFSz8nE66w4jtLNgo
         k/8w==
X-Gm-Message-State: AOJu0YwrArnugIQy/FbGBKt2xd/2XzlyPbs/Sq2jOBi4gDAXW17vJQuH
	MUCuTr4q/ihICBvynYMaLsFzR6VzEpBBJXwR1EP4O2uAPqJF5l17B71DSoheYiS0cYQ=
X-Gm-Gg: ASbGncvIjXG9qzY4gd6irL6+yFV26wnA5+1VmRuNlrsJUd99URxdEf/IygFb+JJj2H4
	2yF5XYYIClRijRupPR9IelYoynlrCMMLH0NSIV0hM6sTKq9bUBdfe2/dSFk3yYTL6B1o4Gr1A3m
	NINTEnTYls9dFWqWGbFpsKqaJzyCl1to0dDd/Q1SRaIcFhXwoLzL+y/c7ny9X5+Dy5ku1bS8qB4
	IuXiLXHcc4VSZ2S6qrgeJUw7alqz+X71+uKcmeUTZZERyhlecF8p70i0BmH4aSLaCIYsyFI1icc
	Mu7ahapeVe4eStfv/aW2iOE/1g/LRP3x1gDgdmMaUW467RI5louyNeug
X-Google-Smtp-Source: AGHT+IHglAXB1wnvkqWxyHxMYu72HLDiEZaxm7U9T8x9s8smG5cJzd9yYqNquK1LeDcO80+diHi/Sw==
X-Received: by 2002:a05:6000:178d:b0:3a4:f7ae:77c9 with SMTP id ffacd0b85a97d-3a97fcd2905mr10665040f8f.5.1751287043715;
        Mon, 30 Jun 2025 05:37:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:10 +0200
Subject: [PATCH v3 03/10] gpio: sysfs: only get the dirent reference for
 the value attr once
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-3-b997be9b7137@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3193;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Kq4vIpbMDkM9HUAJCvHdAXUcnUau3HDlw/dUGiXf3t8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT9E/maTlsY/nE0aovpxqbzCj3vTAlXvXCR0
 v+MhxV/q5SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/QAKCRARpy6gFHHX
 cmZfEACgDyaxXOf2YWHa1md8hIOOqEJbcwTKNfix6jO8pX8zMcTpTNt19SJtFcwaonfup4v3aEp
 mjbLEe6IrHnG/yZNE/NgV1DspecIkzQkO/7Hf+3FI+hSz5GRlORvi+vdfSiSjfnjMzErSbEERnV
 wPPeX7IE2EwkW8igcQTgktvJQV++RJagEpvcQgEJZeS3VNK0qKzzYDSw6az09DJCnc2Zq8M6I3H
 pRJGgn6TXHtwfQUWb4RHCtJrjnUKjJFeY67I5SSW68Vr7fYdyDZZN0ly2pzzgCVDWYZ594Q4lE+
 jsqGzL46zrYbS6dbT9K2NM/AL/zakLSkRohnsQy16R64Cey801cKbJJOw5OrXJNYuBaePtewPDY
 zN4Ff199EYwX4xtd99KqYltpkro5azcOfRo7A4cn7wK0VxqU4cMOp/IYdCjmp/Dy0+yqiVRa6VW
 3TqbXzg8YOJByzjmq8lniTkh9hks6O4ERzPYVC18lf9Fq5mRqULKhpUWjuAMOxv8jG8KtrquzlV
 je02XE3eztJzaC1htqSitjgMD/dkzdgsL+F4VsbIKcywXX63DA4zRopcT4zjTxjGtJrTTScMjDN
 Q4cFfpfXoD1fgO544MIOiJ3JsOJvvdlpelbCCjt1PTfPg6loneXhBddM86NrYgznE+FYU8DL7tf
 gXx8Cdkz8o5Tq7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason to retrieve the reference to the sysfs dirent every
time we request an interrupt, we can as well only do it once when
exporting the GPIO. While at it: change the name of the kernfs node
field to value_class_node ahead of adding a second one for the
chip-local GPIO line value attribute.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 990db0405cc86c42bad61295dc823f970199534e..80bb58c96b9b45ce4e1a4def8085d71baa0ce45d 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -36,7 +36,7 @@ struct gpiod_data {
 	struct gpio_desc *desc;
 
 	struct mutex mutex;
-	struct kernfs_node *value_kn;
+	struct kernfs_node *value_class_node;
 	int irq;
 	unsigned char irq_flags;
 
@@ -156,7 +156,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
 	struct gpiod_data *data = priv;
 
-	sysfs_notify_dirent(data->value_kn);
+	sysfs_notify_dirent(data->value_class_node);
 
 	return IRQ_HANDLED;
 }
@@ -177,10 +177,6 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	if (data->irq < 0)
 		return -EIO;
 
-	data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
-	if (!data->value_kn)
-		return -ENODEV;
-
 	irq_flags = IRQF_SHARED;
 	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
@@ -203,7 +199,7 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	 */
 	ret = gpiochip_lock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 	if (ret < 0)
-		goto err_put_kn;
+		goto err_clr_bits;
 
 	ret = request_any_context_irq(data->irq, gpio_sysfs_irq, irq_flags,
 				"gpiolib", data);
@@ -216,10 +212,9 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 
 err_unlock:
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
-err_put_kn:
+err_clr_bits:
 	clear_bit(FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
-	sysfs_put(data->value_kn);
 
 	return ret;
 }
@@ -242,7 +237,6 @@ static void gpio_sysfs_free_irq(struct device *dev)
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 	clear_bit(FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
-	sysfs_put(data->value_kn);
 }
 
 static const char *const trigger_names[] = {
@@ -726,8 +720,16 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto err_free_data;
 	}
 
+	data->value_class_node = sysfs_get_dirent(dev->kobj.sd, "value");
+	if (!data->value_class_node) {
+		status = -ENODEV;
+		goto err_unregister_device;
+	}
+
 	return 0;
 
+err_unregister_device:
+	device_unregister(dev);
 err_free_data:
 	kfree(data);
 err_clear_bit:
@@ -804,6 +806,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 		data = dev_get_drvdata(dev);
 		clear_bit(FLAG_EXPORT, &desc->flags);
+		sysfs_put(data->value_class_node);
 		device_unregister(dev);
 
 		/*

-- 
2.48.1


