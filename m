Return-Path: <linux-gpio+bounces-27195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BCABE24C9
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 11:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CE61406A4F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 09:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A3B31159B;
	Thu, 16 Oct 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qllYwMQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360C3112D6
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760605779; cv=none; b=IjigAvFivZtC6Grp0tl8JbxQPwrVCNkxjeIH0MJ2BDpz3edu6vFyd1rtALaSdIO4gZE5BGRD4a4HjlR/pvbuTjGqx1B1opW8IBTxvDaD94x/VKZnPCo9Xqzh3vq6ryTzGYyI4Jxj3WNAtQGdM6PMoA3ml6QEhxGOjs5Csy2M51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760605779; c=relaxed/simple;
	bh=A6JWbpPO/ZZ9OVoNiPoYT65q3lvgzRsLiywv9K36sl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldr2FgG7bvjPEsugSzuuJUXJRmDPPcg2+HBubMtSyRil7YZjqDAogpyFK4J3P90Ocx+NXKRwtlQNbHvq+sfeSFkbUEOgYpPO7aX42sAf2HHhWPZrY+rnDQwYI3RFoLPSxXR7QHG8xdlNwxxkTSvFK8AtFixsI/GboCxGILn5pps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qllYwMQh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e5980471eso3971435e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760605775; x=1761210575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebccT5r9h4sq1EAbS6O1Ek+KohRKJ8knZkMvNsBsVEk=;
        b=qllYwMQhZObA648m2vQ3wyPNDALtBpiyKQIg0R7hWYsHBUHP/KklyKS9zP/ECAYv2p
         nE8NXYVc+YbL44lD8JpOpy1OOcIwjXcCYeKccgS82P5nodE/PHTJKpnr88cxvxQwwG2F
         gvFzlCRndhslWfWDLY3zp9bRdhbDb6+b0kvF5/1KI9/vi4vrQ7/OcvzM13X8jcFPzEfS
         MUi4h7khrGRQb3eTlzsqULpw6W/uMR71x+nW8aSnxT/XsXKJEe5FwbXlwVHRXvgmf20D
         +zIm0gpxMvMcqn84kd1kHoTrEs18TOPL3utCDKF21GfcKxmeCqWtL6mfZvgzyznVo7Xl
         bqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605775; x=1761210575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebccT5r9h4sq1EAbS6O1Ek+KohRKJ8knZkMvNsBsVEk=;
        b=fYNoerloyWGLsbCsvz2SqdU55O1q8Ng8+O6mT2sQ8ImZM0nAqw9QNO/YqOHy3z40hy
         HSZVNjIwF0XEzr/3mFSRP1+W8yy8GmrjBMUN61fiL6oFed53jY0WSxf/IgQj607JYimV
         grQ/utkYeWNC3j58+/UUWXdzDJ+OPrKgEe6/3+9mjADayqiQZyfTOFwbfbQowyK+LyOI
         vvqJEBYeNHkdzJ8KJVZ1YOy3LjLrRzvItLxg5xRl8pCq9r0M/+9IyzUJqgXjXFm+vIae
         E5t1hRL/15byXMtE1u1s8V8VUh199KB5LhIcK+kGO0bYn8LndFBRRlmUGOTUK/5hqDiV
         dyQw==
X-Gm-Message-State: AOJu0YzVyL71nPUGiBlJ+Gkha8/lfI1cm0GxLLQby93TiqYHGjEpFBFJ
	FK0/Qjos4xGo7NSpPhSIdsforLWkAYhbWR4AH78ds1FHvMvwfcQo+x30nrBTd0usjp4=
X-Gm-Gg: ASbGncvUWbZ36tzzOtWPIG6vz2dp4RVhfn2pTg3EPD9VneCBkqwzTmFS249STd6hKLg
	VSt2L85ZZ3/QheLEKO92HoVP5bqIxt9f+uZpb4KTiMKj/yOrN7QdKLBW3RTssA4MD6t1qiJmxer
	xZLRIhDNNTGqtrmtDk8qKSK++Cp5VpulRFZZVRNc1m9zyQon/GWi68zosJRTbQSrtqbk8B14Kbh
	KStpP51sDn1Gvi0ElVBl11RD7NSyK22ghOgebfU66DMC8ql8efN8e3cE0lWCCdBjPbDZoqJ7p5o
	yE/1vlprmGys6v7OLkb94KQyPYlEiyJgihxBRmKk/HUH65JKJHvUy8d16fb0m4kWWOx1R2aLhQ/
	God/1ADlDdXekNhs6hjzqyD0aEobS/2c8+LAfUPlILTS5EAUyK43z/vW2PH5Y64J5Y7JpWKZhhC
	5g0lU08A==
X-Google-Smtp-Source: AGHT+IGQWhJUQbEP0NTPgkhtlw8FdiW4eMaK0Bf9Bh/NjUF+7IvZdvR6YnB8KB0HK3aO5FvT+g1kUQ==
X-Received: by 2002:a05:600c:1c05:b0:471:76f:80ed with SMTP id 5b1f17b1804b1-471076f8254mr34145545e9.41.1760605775254;
        Thu, 16 Oct 2025 02:09:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33191287f8f.45.2025.10.16.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:09:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 16 Oct 2025 11:09:25 +0200
Subject: [PATCH 1/3] gpio: rename gpio_chip_hwgpio() to gpiod_hwgpio()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-aspeed-gpiolib-include-v1-1-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14609;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=64M7sLqUbn9pZ/yukdGpDmm71CMp76vrBJe0uDRLaTM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo8LZLxyONPB2juU6q5oTOECN2z+qXL78iHsCt1
 N3bWmf7HKiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPC2SwAKCRARpy6gFHHX
 cjyPEADingMEcy6pJSkb+z75ZNh4X4JbbO/7F0AFxfUKr+GO2WDzJNyAua/AF1BUjR2hYdSu7LY
 Ojo7i/46BTTF66ffu0OdO5zj6ds3yNWVUtaDrj/R6Bw4hE+wOWqDocTOSVBg2GzBTnkz7BDL1L3
 iJj2kKIbxel3uot+BS7jwCOamMFfJh8hA6HmrLE8yxx1ZP73CRelhLgObXO5Duy2toYnhOg0m/Q
 tT0h63UqVB8V2IaCBFSXdAlA+yVHDE4beK3TtNAix8hxEDaPTVWRpfVpWAY60+vXsW9u2QHenHT
 qJGYmbi7ApQAI5d/Y1qcy8rarOl4juQs+Y7E90W5dnoOyLdMiMm+xDEUPysZrSv7x/bG3WqRzr8
 FjTqCLKZwhwrivO960UrXAi+PsjT4MZ4ZTkc4K6AxO1Uk96wtdhP3hVp3cf4VJY7XM3iaoxKAAr
 +8cbeYl/Fm5Myo0PzXNcJZ7E7aPOps19U9ohKcdYAkqUosa7uJsRJBYUSKv6aWy/NN80Zxuax8O
 MA00NDIkOtPi+eFppwA47NT8r9F1+c1H48uLUxvZVbjWf5gLMFfBINtBkzJQfpNh513178VHndL
 /WmgnD5SDcheCODHvOeEN/owyzPv63dStBv9SX3BQv8ZiGurBnwBUfhCLENoeaMhjuZOSICJSE3
 kcwL8RaJDSaqXBA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function takes a GPIO descriptor as first argument. Make its naming
consistent with the rest of the GPIO codebase and use the gpiod_ prefix.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c   |  6 +++---
 drivers/gpio/gpiolib-cdev.c  | 12 ++++++------
 drivers/gpio/gpiolib-sysfs.c | 14 +++++++-------
 drivers/gpio/gpiolib.c       | 46 ++++++++++++++++++++++----------------------
 drivers/gpio/gpiolib.h       |  2 +-
 5 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 7953a9c4e36d7550bda5206aa42f4309ea7f3150..3da37a0fda3fbdcb8077c07706aa41b233e9beeb 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -24,7 +24,7 @@
 
 /*
  * These two headers aren't meant to be used by GPIO drivers. We need
- * them in order to access gpio_chip_hwgpio() which we need to implement
+ * them in order to access gpiod_hwgpio() which we need to implement
  * the aspeed specific API which allows the coprocessor to request
  * access to some GPIOs and to arbitrate between coprocessor and ARM.
  */
@@ -942,7 +942,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 {
 	struct gpio_chip *chip = gpiod_to_chip(desc);
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
-	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
+	int rc = 0, bindex, offset = gpiod_hwgpio(desc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 
 	if (!aspeed_gpio_support_copro(gpio))
@@ -987,7 +987,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 {
 	struct gpio_chip *chip = gpiod_to_chip(desc);
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
-	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
+	int rc = 0, bindex, offset = gpiod_hwgpio(desc);
 
 	if (!aspeed_gpio_support_copro(gpio))
 		return -EOPNOTSUPP;
diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index ddc452b5ee23a2be99fc2798cd1d55403a625099..ed064e6f268c78c123bb655ddf1bf6592531574b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -676,7 +676,7 @@ static enum hte_return process_hw_ts_thread(void *p)
 	}
 	le.line_seqno = line->line_seqno;
 	le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
-	le.offset = gpio_chip_hwgpio(line->desc);
+	le.offset = gpiod_hwgpio(line->desc);
 
 	linereq_put_event(lr, &le);
 
@@ -793,7 +793,7 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
 	line->line_seqno++;
 	le.line_seqno = line->line_seqno;
 	le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
-	le.offset = gpio_chip_hwgpio(line->desc);
+	le.offset = gpiod_hwgpio(line->desc);
 
 	linereq_put_event(lr, &le);
 
@@ -891,7 +891,7 @@ static void debounce_work_func(struct work_struct *work)
 
 	lr = line->req;
 	le.timestamp_ns = line_event_timestamp(line);
-	le.offset = gpio_chip_hwgpio(line->desc);
+	le.offset = gpiod_hwgpio(line->desc);
 #ifdef CONFIG_HTE
 	if (edflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE) {
 		/* discard events except the last one */
@@ -1591,7 +1591,7 @@ static void linereq_show_fdinfo(struct seq_file *out, struct file *file)
 
 	for (i = 0; i < lr->num_lines; i++)
 		seq_printf(out, "gpio-line:\t%d\n",
-			   gpio_chip_hwgpio(lr->lines[i].desc));
+			   gpiod_hwgpio(lr->lines[i].desc));
 }
 #endif
 
@@ -2244,7 +2244,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 		return;
 
 	memset(info, 0, sizeof(*info));
-	info->offset = gpio_chip_hwgpio(desc);
+	info->offset = gpiod_hwgpio(desc);
 
 	if (desc->name)
 		strscpy(info->name, desc->name, sizeof(info->name));
@@ -2549,7 +2549,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	struct lineinfo_changed_ctx *ctx;
 	struct gpio_desc *desc = data;
 
-	if (!test_bit(gpio_chip_hwgpio(desc), cdev->watched_lines))
+	if (!test_bit(gpiod_hwgpio(desc), cdev->watched_lines))
 		return NOTIFY_DONE;
 
 	/*
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 7d5fc1ea2aa54fce0c7c884b53d16ad1278c4612..cd553acf3055eddfc8e8ab2fa592c815ee24a459 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -244,7 +244,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	 * Remove this redundant call (along with the corresponding unlock)
 	 * when those drivers have been fixed.
 	 */
-	ret = gpiochip_lock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	ret = gpiochip_lock_as_irq(guard.gc, gpiod_hwgpio(desc));
 	if (ret < 0)
 		goto err_clr_bits;
 
@@ -258,7 +258,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	return 0;
 
 err_unlock:
-	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
 err_clr_bits:
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
@@ -280,7 +280,7 @@ static void gpio_sysfs_free_irq(struct gpiod_data *data)
 
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
-	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
 }
@@ -478,10 +478,10 @@ static int export_gpio_desc(struct gpio_desc *desc)
 	if (!guard.gc)
 		return -ENODEV;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_hwgpio(desc);
 	if (!gpiochip_line_is_valid(guard.gc, offset)) {
 		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
-				     gpio_chip_hwgpio(desc));
+				     gpiod_hwgpio(desc));
 		return -EINVAL;
 	}
 
@@ -823,7 +823,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	}
 
 	desc_data->chip_attr_group.name = kasprintf(GFP_KERNEL, "gpio%u",
-						    gpio_chip_hwgpio(desc));
+						    gpiod_hwgpio(desc));
 	if (!desc_data->chip_attr_group.name) {
 		status = -ENOMEM;
 		goto err_put_dirent;
@@ -843,7 +843,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	if (status)
 		goto err_free_name;
 
-	path = kasprintf(GFP_KERNEL, "gpio%u/value", gpio_chip_hwgpio(desc));
+	path = kasprintf(GFP_KERNEL, "gpio%u/value", gpiod_hwgpio(desc));
 	if (!path) {
 		status = -ENOMEM;
 		goto err_remove_groups;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ba5df8a233fe75e16bae615f7f7c8591066c056e..5a450dac8f3acea3e381b09767b9fe9c9dadc2f7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -443,7 +443,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (!guard.gc)
 		return -ENODEV;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_hwgpio(desc);
 	flags = READ_ONCE(desc->flags);
 
 	/*
@@ -2446,7 +2446,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	if (test_and_set_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
 		return -EBUSY;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_hwgpio(desc);
 	if (!gpiochip_line_is_valid(guard.gc, offset))
 		return -EINVAL;
 
@@ -2508,7 +2508,7 @@ static void gpiod_free_commit(struct gpio_desc *desc)
 
 	if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
 		if (guard.gc->free)
-			guard.gc->free(guard.gc, gpio_chip_hwgpio(desc));
+			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
 
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
@@ -2668,7 +2668,7 @@ int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 	if (!guard.gc->set_config)
 		return -ENOTSUPP;
 
-	ret = guard.gc->set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	ret = guard.gc->set_config(guard.gc, gpiod_hwgpio(desc), config);
 	if (ret > 0)
 		ret = -EBADE;
 
@@ -2699,7 +2699,7 @@ static int gpio_set_config_with_argument_optional(struct gpio_desc *desc,
 						  u32 argument)
 {
 	struct device *dev = &desc->gdev->dev;
-	int gpio = gpio_chip_hwgpio(desc);
+	int gpio = gpiod_hwgpio(desc);
 	int ret;
 
 	ret = gpio_set_config_with_argument(desc, mode, argument);
@@ -2862,9 +2862,9 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 	 */
 	if (guard.gc->direction_input) {
 		ret = gpiochip_direction_input(guard.gc,
-					       gpio_chip_hwgpio(desc));
+					       gpiod_hwgpio(desc));
 	} else if (guard.gc->get_direction) {
-		dir = gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
+		dir = gpiochip_get_direction(guard.gc, gpiod_hwgpio(desc));
 		if (dir < 0)
 			return dir;
 
@@ -2923,12 +2923,12 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 
 	if (guard.gc->direction_output) {
 		ret = gpiochip_direction_output(guard.gc,
-						gpio_chip_hwgpio(desc), val);
+						gpiod_hwgpio(desc), val);
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction) {
 			dir = gpiochip_get_direction(guard.gc,
-						     gpio_chip_hwgpio(desc));
+						     gpiod_hwgpio(desc));
 			if (dir < 0)
 				return dir;
 
@@ -2943,7 +2943,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		 * If we can't actively set the direction, we are some
 		 * output-only chip, so just drive the output as desired.
 		 */
-		ret = gpiochip_set(guard.gc, gpio_chip_hwgpio(desc), val);
+		ret = gpiochip_set(guard.gc, gpiod_hwgpio(desc), val);
 		if (ret)
 			return ret;
 	}
@@ -3094,7 +3094,7 @@ int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 	}
 
 	ret = guard.gc->en_hw_timestamp(guard.gc,
-					gpio_chip_hwgpio(desc), flags);
+					gpiod_hwgpio(desc), flags);
 	if (ret)
 		gpiod_warn(desc, "%s: hw ts request failed\n", __func__);
 
@@ -3126,7 +3126,7 @@ int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 		return -ENOTSUPP;
 	}
 
-	ret = guard.gc->dis_hw_timestamp(guard.gc, gpio_chip_hwgpio(desc),
+	ret = guard.gc->dis_hw_timestamp(guard.gc, gpiod_hwgpio(desc),
 					 flags);
 	if (ret)
 		gpiod_warn(desc, "%s: hw ts release failed\n", __func__);
@@ -3257,7 +3257,7 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 
 static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *desc)
 {
-	return gc->get ? gpiochip_get(gc, gpio_chip_hwgpio(desc)) : -EIO;
+	return gc->get ? gpiochip_get(gc, gpiod_hwgpio(desc)) : -EIO;
 }
 
 /* I/O calls are only valid after configuration completed; the relevant
@@ -3417,7 +3417,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		first = i;
 		do {
 			const struct gpio_desc *desc = desc_array[i];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_hwgpio(desc);
 
 			__set_bit(hwgpio, mask);
 			i++;
@@ -3439,7 +3439,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 
 		for (j = first; j < i; ) {
 			const struct gpio_desc *desc = desc_array[j];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_hwgpio(desc);
 			int value = test_bit(hwgpio, bits);
 
 			if (!raw && test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
@@ -3576,7 +3576,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value);
  */
 static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
-	int ret = 0, offset = gpio_chip_hwgpio(desc);
+	int ret = 0, offset = gpiod_hwgpio(desc);
 
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
@@ -3605,7 +3605,7 @@ static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
  */
 static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 {
-	int ret = 0, offset = gpio_chip_hwgpio(desc);
+	int ret = 0, offset = gpiod_hwgpio(desc);
 
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
@@ -3637,7 +3637,7 @@ static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 		return -ENODEV;
 
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	return gpiochip_set(guard.gc, gpio_chip_hwgpio(desc), value);
+	return gpiochip_set(guard.gc, gpiod_hwgpio(desc), value);
 }
 
 /*
@@ -3760,7 +3760,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 
 		do {
 			struct gpio_desc *desc = desc_array[i];
-			int hwgpio = gpio_chip_hwgpio(desc);
+			int hwgpio = gpiod_hwgpio(desc);
 			int value = test_bit(i, value_bitmap);
 
 			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
@@ -4000,7 +4000,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (!gc)
 		return -ENODEV;
 
-	offset = gpio_chip_hwgpio(desc);
+	offset = gpiod_hwgpio(desc);
 	if (gc->to_irq) {
 		ret = gc->to_irq(gc, offset);
 		if (ret)
@@ -4957,7 +4957,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	if (test_and_set_bit(GPIOD_FLAG_IS_HOGGED, &desc->flags))
 		return 0;
 
-	hwnum = gpio_chip_hwgpio(desc);
+	hwnum = gpiod_hwgpio(desc);
 
 	local_desc = gpiochip_request_own_desc(guard.gc, hwnum, name,
 					       lflags, dflags);
@@ -5038,7 +5038,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 * If pin hardware number of array member 0 is also 0, select
 		 * its chip as a candidate for fast bitmap processing path.
 		 */
-		if (descs->ndescs == 0 && gpio_chip_hwgpio(desc) == 0) {
+		if (descs->ndescs == 0 && gpiod_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
@@ -5083,7 +5083,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 * Detect array members which belong to the 'fast' chip
 		 * but their pins are not in hardware order.
 		 */
-		else if (gpio_chip_hwgpio(desc) != descs->ndescs) {
+		else if (gpiod_hwgpio(desc) != descs->ndescs) {
 			/*
 			 * Don't use fast path if all array members processed so
 			 * far belong to the same chip as this one but its pin
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b4c5369f8a3314244424d0c90ba006f7568b314e..62d4c15b74f580273412e6d432ab306a2d2fe682 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -276,7 +276,7 @@ const char *gpiod_get_label(struct gpio_desc *desc);
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
  */
-static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
+static inline int gpiod_hwgpio(const struct gpio_desc *desc)
 {
 	return desc - &desc->gdev->descs[0];
 }

-- 
2.48.1


