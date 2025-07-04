Return-Path: <linux-gpio+bounces-22799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB7BAF9354
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214965A1130
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 13:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596F32F7CFA;
	Fri,  4 Jul 2025 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qVKCBgL+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90C2FA633
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633945; cv=none; b=TXfZQuulwLlpyd2wbKQshNjwvwtRp9qbo3iD0ytBG3dQsNIIsZdreCtwYXPuIAT6cnHAmgGSR2afP4M5rp85ioPHy8gfvhsiiQUlVeP6SLFv//9x4c8UdETTLah7nEVJ0AxXRieCHGKUBkOcHI4e/Ad52CpxxULWYHjNgDX4LHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633945; c=relaxed/simple;
	bh=YIyf520yc3OL6nrbv6RXMcd4vJ6epUbAY2ZFYCYhm9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQXPS+Erw9cU1R3ynMXpu4VeGY/I53Fj1EZvIYXqL7Ub3NfnjYY6o2IRWg10MzoTFs5f2L2OymQl0QpNmU//M4MixEzyHaEQ0UTFMztVowJoEm2hU4AF2MlILbWRhSoydIPRqqCdzhE/yr2SiwhPKNUEl2qDXYi5FJkISNy8d64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qVKCBgL+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso9737105e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633942; x=1752238742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBbCm54nWGP41Xnu/OzYvjIQKhcDFEESF+8gEh+/CCU=;
        b=qVKCBgL+hwKxl4Kr4Ez33aiFY9RAfkDJuow4aOSpLBLh//m+PdF2nnoTav6PswkPcp
         rO7reudU30GTrUQ6vzpNUopnW4AT2221Zapipuzr61OpnHiRicC3J1BI6Kth+YFr39yi
         hWZ//z7MSD2w8iZUu8ezHSZLz8YzhTl6e4naMlx01Z2UBmlYAeQ/raVjpcMfS8v8Lft2
         iHeLpCYTidnwe6DOc2oe8gfy2FF/t81AGlhNs9Eua5tyAvWj4Uw7Oi/Ua96zILHLDCwK
         cUJzq1rXCtIZrWzCUoXLANX3Q6YMa5TmFpepj0ZXcTYT5SJuhNhaTuPR31ynEf/PuSnV
         W7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633942; x=1752238742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBbCm54nWGP41Xnu/OzYvjIQKhcDFEESF+8gEh+/CCU=;
        b=cn6+IfbN7LaZbE/Ikni1QD9YVD6/OksJtrhbtqQdxOAyyZ4QjrxrLcEvxYkHYDhmz+
         +izrfVg+XPUBfgvL6EO2c4Suo0EVvg4Fa5VucccXBr3ffq/bqxJTPXPe6F3G5szjNM6T
         f08JT83+a72nuPtPnwaR/sEIucyn+GxssOgGuRYkkB4lDvbXBn/pRyAA0ist0OHzqM6Z
         9csZ4+HHUbiE37HczMcHMuES0+d/Jmq3ZHW41FRefGSQVGVcA1Ct34OYFZMrC7K5czCm
         TLe8fs4BPAexH4qBTY2HS8S7fHui0G9ePSkJlnKdChpTJzNbWsRL9RRxg4v527/p2Bdd
         7tsw==
X-Gm-Message-State: AOJu0YyxhEHynfrvpn9icqf9lH5TPS0R56qDVglTQM6Iov2hvnvfGEQA
	o+MCR36AVIVnSDIzLqoGKHHFVmiUlrfYSAqVjSGGRLMcTfsm61bT/KL2aonhwGRSxd0=
X-Gm-Gg: ASbGncvJuw55ByHniLkExhGb7+xYcZrcwm+jYppPXYP/fQYnYnX4iZe+U5iKKfPGGl1
	evSkSDpyFhfoDphkhlxrA+5kR+upjB+V6KNS7k9Un3Jt5ZR0m5Y01yGHp54MVqdt1z9MkrqvYRI
	JcoKNr+l6Y6Zg7LaWI+gQpuOelmG0OCLRu4kEq2H9kkarV8NCY+PQKPJB5daWw9lPktQfGDqtF7
	s2+kaipV00KdxgckYNPREVJoQF437knrVJmZOVFg9HdZrXe7L6DCSo3o1j2l9+NXUNVM8z1vyVr
	z6qQsHJCVBhL4WETI1tQMtFAdQyr6dYT6sMr1geefhJVGJL4OSJTe41vDnFV+1kALg==
X-Google-Smtp-Source: AGHT+IGcBL5wyWMy6b4MR/KDtrIlyFD0sCwPdUXj+dZQvTg43CODdUPLPZuHEXZO0DSqXmbNQWmAcg==
X-Received: by 2002:a05:600c:540f:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-454b4e85deemr23044245e9.14.1751633941705;
        Fri, 04 Jul 2025 05:59:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:59:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:52 +0200
Subject: [PATCH v4 05/10] gpio: sysfs: rename the data variable in
 gpiod_(un)export()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-5-9289d8758243@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3480;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dJVPDQuNRoeklWW2H8ZncDbRs/7tZWGjs63kgy+WzDA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9ALBZ351aGMbGuaCcMzaY0jiNzLRhMAJU3n0
 cig/Q6fg2SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCwAKCRARpy6gFHHX
 cvy6EADN6IzH+Oz0QYqPlAnYqY3ARRz7lJnjAcdX4BwPWrW0cokk6Djb8fDI1dIjfUhO5TyolvF
 ExvGMv7Vw+ZcDLqi2h7P4axU7hpoKh1ybLcjJTwxKie4IoAubRvUOc3wsay3ZThXYnwrYS+PzT/
 SpC3gf9HxH8/0ZAO4kUzD6BXQ1vgvLWGb6mYnYwvQ/1Rx2WCi5ghsQXaqeZhiSiWUu0PbCmV17B
 hl7J60qTwYAS68EVCrlvkmDIt3u91oyYrAZlQFQ9qxjaLASfZpmOn0OREPfmL/JC0UAHrIZnE5O
 XdNVjSXHxPIwDtBPvUsIWELGpueaPiB7bp5ZxG0a/Ly/NarPFim8aKLD0eR8/eA0oJblA/uDc3w
 n5H0Q3ZvgPtObcBrzA0tN/AWcbpoVbDmbNhgVY0dFUPYFQxlyydaRw/vv/03ZgCUaPWJ9RkeQfT
 RWwaTiTfpBrYndSSEgrqAKMvmmquOFrhyfQLOuStnoS8FbIfbkrkIdjFESE8iSxrbPczHapcZNe
 hCblRShVbBr1CuPHQ2aPcJCakwV/DD9uKfFliiefa9/Dht1HW3fvq2iy4+BmRNVt8QbOG3NZDmN
 4a8mleI1e6iGvSnAvxJQcczmuH0W1Y1wOp0SpxGYOTr+HKBg+za+D73ZenC0Vuc8kuYPKvVy8un
 lHdgLa8d5JlkzZA==
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
index 0cfa73e92b47fd089b973e96b5062694b7f8abd3..fc9c19fde3f12c16a26aa09dcb6f17960942c4bd 100644
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
 
-	data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
-	if (!data->value_kn) {
+	desc_data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
+	if (!desc_data->value_kn) {
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
-		sysfs_put(data->value_kn);
+		sysfs_put(desc_data->value_kn);
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


