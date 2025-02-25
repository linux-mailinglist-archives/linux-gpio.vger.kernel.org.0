Return-Path: <linux-gpio+bounces-16545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0CA43A5E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 10:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E60016D92C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 09:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A766F2627EA;
	Tue, 25 Feb 2025 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OrcFZeCH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F82256C91
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477137; cv=none; b=hOxjZ9i4wbdzkPck5L0o1mnCttsKss6uDL2RJ0tfoA2puHSyNE83j/nz/6lOezwu/Li0WRNcb3zRu0q6tCHmVKwSPhYk8Yuj7rduYNknonm1WT1+5tKZnTxJ+GTE5GAVOMp9Qnyx0RymHIUJVx2E9JfImpi1/QIdOT0+IC1Kv1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477137; c=relaxed/simple;
	bh=XARi+YZOioq2dSvOxXxvznWL5FQ8OEc1/3zPe3u8PFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CEzYWvr8WCxq7+/R/S+2CUo9QKa9SheoMWWLh5x9M8ayO815yzTv39kxsZtJ7R44C1t2uF5Y+7LiBxCDN1lBFDyrmdXC4mp0LnhCRKKINwcq4lFP4jhZRZ+guOkyeiJHRQfc+24S8JvKCcyDsvILGifQFKTGy6SkPHq2dpp9yxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OrcFZeCH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so3896982f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 01:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740477133; x=1741081933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5GHjrvlBNm+Fuw+mlPf6/5PhsQQqF/yxmPzmUGmJOQ=;
        b=OrcFZeCHLhNiMi0Ap7Y2NJXa5TBrFHRWss8a9EAo/vi2Ev03jWWo4Ftg412YrzC8dm
         /r5WbvKciPUJdNGQ15IVEJL+Du7SdMYoqAwZuBNH+Izw3kaueSyspIyKfSkJayJQmwBU
         V8AKNUWAm7umSFgAE2woUCi84IpAsorwTJuQzNFhCgBsj0ATmXpzPI3tUCKSmLS7u+RU
         TBdDWVQrmRNf4gX5q4GseGXBEjp+WQgrYKB4N5ar48GNULTWOrftCg7XfrArDMkdSepv
         daxiZTxEmo4xVuHj6qUpTOKXRbLZ8ZiFxiULQEs1F0VIA7b/ep+W4CgAjEO/hVdmiRgQ
         RsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477133; x=1741081933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5GHjrvlBNm+Fuw+mlPf6/5PhsQQqF/yxmPzmUGmJOQ=;
        b=JRX4UpOu6alymamaU4xYg9LGLssJeoyvx25cohg0huxpOEW8LT4d5I9nvZTEAdnl9k
         yLBnKr6aTcHkoOH6hRQHwA4Ymi2/1YAo5SaXyKcU+LLfk22ddqzmAlLkVdkZkIWPleDL
         VMy6SQH3hR5qIfIGQ4Ay3TIG9nloBLMP8Pav5I5amQx4PDDGPpWAVfc1fg3zgN2Xxrv4
         lAuZLSCJLKj60FkFNoo7wlkNlaAF1tLMqpsu26MmGIzJJ3vQ9oD0cuKYe8zXLwIOEsqS
         vFT2fhUWnH5+b9wZKFmthF69a2WsY2d4XxLuKWfC/wlMHpLALKoxzV58FdVYReiJA+/j
         NXgg==
X-Gm-Message-State: AOJu0YyGz1+UeePIgjj9s1J8aGzehdD41u/bMaHKHrwVVbFYdiYpFi3W
	9gcASdaa5LOTTxno3Mx/q1tGj8vHOlfILvYWkbvCBydWdsm6HxsH5o+4xS4i3qQ=
X-Gm-Gg: ASbGnctw2HY2jaMIGLco1nqxgj1tNdE2OIl3NywwSGeFLTvpx9aurOEoimXO80FBU/V
	Xla3e3C+BuWcxFnYMiNcLbjfd2cn09Sb/FOkJx4nWMd8vqtPf+MSm94EzpHqFYKwY0B8V7ZaEm9
	CYW8W10ui2WukChDiVsozUht9+R8wzAPfZT7AWnrfIxAtN9USGgya4X3Z+nSbeGC/Zy7ixkIbPJ
	dj0MM4/nrQk3GQ8Y9fuGqQgP34/YCBS+jMc2Cby88Xfq5Y2yltKnXBDZV1ZYgaWQ2IBsSx90vuw
	9DmY7nYeik31B6qkaU696kBpjw==
X-Google-Smtp-Source: AGHT+IHI72au0X7G/eU3XJtp8XN4UP3wf3anxfHDJsGzVLMKwudw09vKCm6cjU/0t4YhXRSZTAfuLg==
X-Received: by 2002:a05:6000:186e:b0:38d:e572:4dc2 with SMTP id ffacd0b85a97d-38f70826839mr16248954f8f.40.1740477133387;
        Tue, 25 Feb 2025 01:52:13 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:15ae:2cfe:447a:4a32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fbef5sm1733781f8f.90.2025.02.25.01.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:52:12 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2] gpiolib: use the required minimum set of headers
Date: Tue, 25 Feb 2025 10:52:10 +0100
Message-ID: <20250225095210.25910-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Andy suggested we should keep a fine-grained scheme for includes and
only pull in stuff required within individual ifdef sections. Let's
revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
gpio/consumer.h") and make the headers situation even more fine-grained
by only including the first level headers containing requireded symbols
except for bug.h where checkpatch.pl warns against including asm/bug.h.

Fixes: dea69f2d1cc8 ("gpiolib: move all includes to the top of gpio/consumer.h")
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Closes: https://lore.kernel.org/all/Z7XPcYtaA4COHDYj@smile.fi.intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- don't include asm/errno.h: it's already provided by linux/err.h which
  must be included globally for this header due to
  gpiod_multi_set_value_cansleep() needing it

 include/linux/gpio/consumer.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0b2b56199c36..824a1717e6d2 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,10 +3,7 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
-#include <linux/bug.h>
 #include <linux/err.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
 #include <linux/types.h>
 
 struct acpi_device;
@@ -185,6 +182,9 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #else /* CONFIG_GPIOLIB */
 
+#include <linux/bug.h>
+#include <linux/kernel.h>
+
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
 	return 0;
@@ -549,6 +549,9 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 #else
+
+#include <linux/bug.h>
+
 static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
 					       unsigned long flags)
 {
-- 
2.45.2


