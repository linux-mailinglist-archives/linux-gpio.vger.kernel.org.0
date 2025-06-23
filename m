Return-Path: <linux-gpio+bounces-22004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB450AE3933
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FD887A87CA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04CD232392;
	Mon, 23 Jun 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FyDSimNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B3230996
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669219; cv=none; b=JnaZQVSEAs65aP/N9nuvCPSJxQw2xgngWNJ6WlWjqsGYMNwIRSOi6EEBeGU75DGePPKmWnHYgto77S/3bZMu2V7Ma3C5MlGRA49jUQISSV8/NPcUobtfEicgQJoSQWAiKEs/NOeKJWJQ0UijU8+oA9V59ulYQjGh3YVpb6jN2dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669219; c=relaxed/simple;
	bh=R0bkctS2alikQmCMg8aa3G+4GSpoB23HfcSsrf+yE8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GA+IR7VztQ3RVhK2rvACClNYqsUKPusUvUBf/R6PkdX/VCOdxo5BzYbQpxvMTTfkU9zOXwwB1dAdRJy6K9RTLVMbDmXZL/NE+gvznKZN2b5yw5Xgl+hVPHqZvzgzDcVTO+q1hHMGscJfx0RdK03hJJJ7B9fu1ayyRCfwc+kPMxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FyDSimNd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d54214adso25626535e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669215; x=1751274015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPfKuY0fkkQZVEv03Y+crBWt/YupigPxkTVkaxpmsGQ=;
        b=FyDSimNdBtjVYweLEkp7EqGXseWQxTR2stX+0NzdCOOxBYIfnoSdJsDcLDBOiLIvHM
         YiB9mtSPWDbwOj92kmae11y/2ekb36xHqPLUcgrLYzpW3lJIFjGfqTjbk1UUn6W4noWF
         lj20A373kgQuolahIXjvHLBaJ0bTJKevRnOAB9LQjyYY8gw1ZeOvCX23FB36dPkgkFa4
         8dNLun746qo1UaqYlhsnBPQMEMKOVLG5yTHvY0cOAnCiCtnCqnB1QQCCcXHfTrXO7Hsd
         UxD3GCSqjHf8ts6qx1GKJn8V/3MjiEYBIZDPcH/gl+X3qty9Umqr8YtEqMHau2YEDaYO
         M/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669215; x=1751274015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPfKuY0fkkQZVEv03Y+crBWt/YupigPxkTVkaxpmsGQ=;
        b=ubyXpmeMb9SoJN9MdXONXzGFzsEh0sECrn7NxA0jVsVmA3ESd5Gk7Ga9UNmx45c5XZ
         ICTGgHNFoZ4VIBUukTnwCxj2Nf8AqFToZ5KlXrp6ye8qpMWx4ybSp8pDz81X34uapius
         PzmNva4+uv9DtvzCCBnJ+Wc9+FXnCQN4+uBcD/BpfcD2Po2espkWYtvsDO2MXppDOfHP
         eyoXrTCcfEn2wwyl8eGDzMA8dlJGGum5g50DAcb2ClkMNESGCWqp9Y3/pjeTtJlzMZzO
         9MZb8TWDSSfjjvFSEIHeHojBLWMFasc7KdOZwqM/Epcb3XhLwTdlXpFJUg0UVj1DaGuy
         reAA==
X-Gm-Message-State: AOJu0YxujjxTowI1Di2GEJIBk3izi5Y610T/N1Uc07MMTvb99koUGm8P
	TkU+nT4aAxnD5BbUxHnXXmYu6Mbc7VfxO5I86TcaqaaPUHozngk16lUkXnKRt7tfHAc=
X-Gm-Gg: ASbGncsNoObjPjdCSJzcjbotv8OT6nH9JygT70RUJ62ZKGfxY05wDhtmRietHPGUjCB
	Q7E48087EwjPTJxTiFX4FDNIYNHqhtRJtFcYx0DNeE7XIvIUD+DreGI+M47heaScd9ZNhmig9FJ
	CuFX6mRq6XYiYG+UlUbUQOkUNQoTrZrMIGeAdETh53kQxLWjgkqzwKT/HiHEpH+3dRDA4dRNKTe
	AsYSzLDUxQwkiS+kjHC1nDGGSrQhAfcXPH9XmdxcCXk84wjWJXONgTTc/QVbTjwChlwaJOjb8s4
	YBazuDHvcXsOS3yTMRHXTPXlxGOMGNc5IggFigpkRT9cfyjv5w6X5qM=
X-Google-Smtp-Source: AGHT+IFcB8iYykDo6IpLdIlEMIQC2gR1QqT11vtascJY66lYvBqHii/Q2Ub3UZXkK2cLdC5AbSyaaA==
X-Received: by 2002:a05:600c:524e:b0:453:c39:d0c2 with SMTP id 5b1f17b1804b1-453659edd0bmr93524025e9.24.1750669215443;
        Mon, 23 Jun 2025 02:00:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:59:51 +0200
Subject: [PATCH v2 3/9] gpio: sysfs: pass gpiod_data directly to internal
 GPIO sysfs functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpio-sysfs-chip-export-v2-3-d592793f8964@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3362;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Jw0DYtOwCcq747xxbRUcAHQ5ayN8hdxN0qXCzK8w+7s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWReZ+pvD3vswPbC4Rt4lzzQdtrIxaK5Oe/pJz
 muWH+pfv86JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmQAKCRARpy6gFHHX
 cqXPD/9SD957p0e1l+YnAOB0rAqNVRVLFTOf/CN0fj3o2kPZoj+eolAq6Hvi1jvhL81Ijdj0Ce/
 KXYGYfeoBi4qB37YQYQtzV5b3GL0crL8UHC4jlUvx3Cx5+gO4JYI6MqbnIBbZ7rSBEVzTOZpMR2
 ruTiQon0OanL7qbjXS61KdYgMLRmRogkErUKll7bfVwmw9fIq2t4xN0LEp7JmWIvrB3hdHWeP0B
 4+k9c3b5wsQ9JBwREXVh/5z5ZUp6UUG7u5OXfZa6/pPJdcH5qwBmpprXnFkpXsPRBqhKB87zbGW
 XRT6F5GTONLyQawBrKr1JoUCXEjnpzRNhjKqMHfxLgYwnvB87wtCDu0xZeeOaXgNOmNyaddvKJK
 2VykYbDw7MhICqID8vyZKf+hOIwbfhyqMwalg1F9iOpwMO5jWLCjopDoYm3J1767292IeOEXV3R
 qqzfuNG6Jtr22CW4saacg9e8Q4HYiVY7WfoecAI9rmtmKkCc6YHRwj9nNRID7bOdBanIB+pnZEG
 k9ryNjkjjDj39dG9OY0fIDub9Rd6Pn2v8JZn3qFvqolKnv3/1ODuvl68Jf9xSA4ovBCbjPRsG7v
 4PgE8Bq8y3e2GynC1lbjX0Itn1n/MdUr4wt9UDndIXMQf/LQjHbBgCYABQYdJHxGeKEH9iG+iVs
 LtBhDdJmgEi/+bA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

To make the transition to not using dev_get_drvdata() across line
callbacks for sysfs attributes, pass gpiod_data directly to
gpio_sysfs_request_irq(), gpio_sysfs_free_irq() and
gpio_sysfs_set_active_low() instead of having it wrapped in struct
device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c812c58e171448501f3d67e6287d32fcac00797d..0e2c6b2d0940b1d4e4ad0a90aa172e7d01908969 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -162,9 +162,8 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 }
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
+static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 	unsigned long irq_flags;
 	int ret;
@@ -223,9 +222,8 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
  * Caller holds gpiod-data mutex (unless called after class-device
  * deregistration).
  */
-static void gpio_sysfs_free_irq(struct device *dev)
+static void gpio_sysfs_free_irq(struct gpiod_data *data)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 
 	CLASS(gpio_chip_guard, guard)(desc);
@@ -278,12 +276,12 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 		return size;
 
 	if (data->irq_flags)
-		gpio_sysfs_free_irq(dev);
+		gpio_sysfs_free_irq(data);
 
 	if (!flags)
 		return size;
 
-	status = gpio_sysfs_request_irq(dev, flags);
+	status = gpio_sysfs_request_irq(data, flags);
 	if (status)
 		return status;
 
@@ -294,9 +292,8 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_set_active_low(struct device *dev, int value)
+static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	unsigned int flags = data->irq_flags;
 	struct gpio_desc *desc = data->desc;
 	int status = 0;
@@ -309,8 +306,8 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 	/* reconfigure poll(2) support if enabled on one edge only */
 	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
 	    flags == GPIO_IRQF_TRIGGER_RISING) {
-		gpio_sysfs_free_irq(dev);
-		status = gpio_sysfs_request_irq(dev, flags);
+		gpio_sysfs_free_irq(data);
+		status = gpio_sysfs_request_irq(data, flags);
 	}
 
 	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
@@ -345,7 +342,7 @@ static ssize_t active_low_store(struct device *dev,
 
 	guard(mutex)(&data->mutex);
 
-	return gpio_sysfs_set_active_low(dev, value) ?: size;
+	return gpio_sysfs_set_active_low(data, value) ?: size;
 }
 static DEVICE_ATTR_RW(active_low);
 
@@ -814,7 +811,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 * edge_store.
 		 */
 		if (data->irq_flags)
-			gpio_sysfs_free_irq(dev);
+			gpio_sysfs_free_irq(data);
 	}
 
 	put_device(dev);

-- 
2.48.1


