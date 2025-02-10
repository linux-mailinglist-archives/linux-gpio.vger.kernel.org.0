Return-Path: <linux-gpio+bounces-15643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA65A2E94E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DDE51886DA0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794A91E990D;
	Mon, 10 Feb 2025 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mcm2onaS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001581E5732
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183044; cv=none; b=nRofD5MpFYm7U6/RrdnpN9trwbYsstKGKZqXR8MZtBz6FMTwL1hZI80K5pU56DTqAxIam3ZoGXn1x7b9FpvQlsYxI3KOS0hS7b5LojUZciPdUSFoLTDkYAAXy1k1+vwC9NGWEETOnJP4kb9FxzOKlz5nJvSv7CHpRRN+1FTIBN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183044; c=relaxed/simple;
	bh=b3SV5k/KQygSUmsLcH/lbc71WE3VIsoF0AdcugQYbDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AM7knaCPUTmlMtJoP1yjX+n9K6UDHwl4skFyrUMkcK6Qv4HO7QiEx37oA6SWlt8WbGz8Cwx09iFN9yKBOTESPFtO0JqFEneXwto1s2SKktHZ53MqGGxSsaiqCiPxZ3a9BIdF9G/OZ2JoJET6zicTpE/UKCYINZE3wbWQ9ju+J7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mcm2onaS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so1825029f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739183039; x=1739787839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ank6bIl11Gd54JLurACsKZbr/Yd6r6NjJq6xSc8Bh8=;
        b=mcm2onaSlypuq7rV6IIV/YXCq1YPVxESOnYvvtkw+FQNtI0lGCYr7agK7lJiTh4G2u
         Ksw5l0yIxDUSLdrOFzE5WQNttEa8jr0YCvcHMUC+OpqHE4vTYDYo9TIhjkYjw3DS2OQu
         lWJ7TLSnIXAtC9rKjHUrUOjXw8qhhJp8Z3AKf3tSU2xRdIVCdh0f8LCi6mfFCHbmB0m2
         SnfoB+klg4n9Qt/15Z2x/X4pPFgNLofTykg3r+n9YzGEs59jbqMVGqavrkvSQRnP6W31
         ZvhBQRkxOnLfxZIu/fxHsoyxzhRdsyCm9ZvRW1KD+mm0JhZzq+DKWHHxz+OM2cCE96tY
         WUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183039; x=1739787839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ank6bIl11Gd54JLurACsKZbr/Yd6r6NjJq6xSc8Bh8=;
        b=S4sMlCK+MdRp/uuzazUDiQWUuOCYDiLxXbFNAIwhudEgA4hrO74t+WT4adrj1ONRRp
         irL8Sx9hlKwA1w01BqN6LCJ9p8yN1VMMkx14Lh7IbGJttL5lbqN80J+iM3gpfidtszcS
         Tmy0LvmCmVM8wj/H9rp4f8lUdzM4ZXvxHMYyWU+GOhPqNWgrPJUSY9Y1Z9yQd9VJpvde
         MfpX7zQomsZa06SprDsGTUkc3reGUICq81H/JfV4Jb3Fd2CuaASzsU33SPo3d3dmrciY
         WCvoexEmpcFozXtjdrN6BywnxIF8dJVjf6WfTc4QatZJGVDL+4xFUhE0kyBZlTb1IUD8
         l0iQ==
X-Gm-Message-State: AOJu0YyVqC1RIasbGvdpLoT20cAbOaqXtnQNKZSK4w0jFCeNrcUy21tj
	XBmM77euZU6nqUEf4vC2Fzo5cP+mgoUxub2M/+oDLKp+31aZx2v5eSre0nbH2Jw=
X-Gm-Gg: ASbGncuQT0FDOzX800F5UcRegMGQsUi7NukaPPoh2MBNZPzRfnvRAfynpFkwCGknW6c
	BiWi02UKGXpYPciC22FlvQGKJuzqWyXj33O4xxh6QDX6p1KdNhidPJOP9hO2qKPv83V939Yc5+w
	q+BMn93+SO7pH9Nn+KzzOGTaZC9PftqJAYgn1WTk+kWaLqx6Do1Su8Rmbyorm9p6de8Y1G23LLY
	/CD2QMq2Xid/KmrO9d4HO7qG+DAXz4ZbLXP6P6Hbbz+pr6hvcLiC5QcCE5QgQPR1YFeJd1JWT4+
	cI9UBqmIfULtyEI=
X-Google-Smtp-Source: AGHT+IHCZAdBMpY2sRfYAHGzsluTp1uiQftR0w2RkUbnpBtWvkkmyFwOKCoa7AkAT+7SAHKlPsYaMw==
X-Received: by 2002:a5d:420f:0:b0:382:51ae:7569 with SMTP id ffacd0b85a97d-38dc9104440mr7170729f8f.18.1739183039083;
        Mon, 10 Feb 2025 02:23:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6080926sm5846535f8f.83.2025.02.10.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:23:58 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpiolib: move all includes to the top of gpio/consumer.h
Date: Mon, 10 Feb 2025 11:23:52 +0100
Message-ID: <20250210102353.83132-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have several conditional includes depending on !CONFIG_GPIOLIB. This
is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
practice there's no difference on modern machines. It makes adding new
stubs that depend on more than just GPIOLIB harder so move them all to
the top, unduplicate them and replace asm/ with preferred linux/
alternatives.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/consumer.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..8d467344528f 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,10 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
 #include <linux/types.h>
 
 struct acpi_device;
@@ -183,11 +187,6 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #else /* CONFIG_GPIOLIB */
 
-#include <linux/err.h>
-#include <linux/kernel.h>
-
-#include <asm/bug.h>
-
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
 	return 0;
@@ -608,8 +607,6 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,
 
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
-#include <linux/err.h>
-
 static inline int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
 {
@@ -635,8 +632,6 @@ void gpiod_unexport(struct gpio_desc *desc);
 
 #else  /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
 
-#include <asm/errno.h>
-
 static inline int gpiod_export(struct gpio_desc *desc,
 			       bool direction_may_change)
 {
-- 
2.45.2


