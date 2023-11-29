Return-Path: <linux-gpio+bounces-682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F09B27FD941
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EAEE1C20DEC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FA330659;
	Wed, 29 Nov 2023 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2JS/SOyd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F9A10E6
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:33 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b4744d603so27777155e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267872; x=1701872672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4MUC5eIDni/buanxrUZQlfU7mM7/HRQ/uDUqZDkwLQ=;
        b=2JS/SOydiknEuqmFOYDnpQfOVtxGkBRZY8XxDaZBUM0fS0jUw1xbvXhpHfg+ll24M+
         s25G4Ll0kIQpwCF0XCy+nAE+JIF2QWIln1/wSFxrrBfryHwX/0aZTgaQ7RYgWWIfenok
         hyYs9xJNsYbwURFUyXfa/ELuGq3jtb5rPSaKBoe6wlBohBeQo0IJWmS6x0EFq5XT0QiB
         AmsmqOwI6Sq0N5SVE1qH+xcHsuOxZKPR4hiSbacH950E/4SPQ0KUQ4eUz+DMiwqlrTq4
         KalbYjiJlpeLI0ccbYVXBCu+o7KLSieBN9tP4rDswlK6XAQ6trVmVDOHg0K4rw4rzWPP
         0iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267872; x=1701872672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4MUC5eIDni/buanxrUZQlfU7mM7/HRQ/uDUqZDkwLQ=;
        b=QQbfEFmfr5ocYRMAiiZ9ktVsxV/rUyG9f/2CGOdkYZDDxNCXLP0iSlaNrk1QxHcVqT
         9mV3AmpNhHG1gv22+1lDpBIv/oUPPp9qSdaow6Z47Ri3VyPfie4RIXf7JzkwEMsWw9Sz
         akBW+jDxi3uWNv3ND8fnAM9WKF1Vg7QO5bHG3FEKiENOQ42rdCuBjLeIpi9gjbHiqvwj
         eRT/qnO0K3pdoWoSQZyJitGgpKkSZPaSJXHPKrbyXLS3W/dB1P8hFKXOyFZlYhIJ94Q8
         4s51u8EnZHib7FzQvQOPUKIon65Q8EAeHbl6kCl5yZWlsm7+3Pi7y5EaDrmH51s3wguo
         psuA==
X-Gm-Message-State: AOJu0YxJ1Ex2nUKveysJ/PhilHRZKYnw0VOEGflWIlQkuLFkbRlJ/489
	4EMLsjKrx3eWhPXXVZ0q1YZ4Ig==
X-Google-Smtp-Source: AGHT+IEIhjE3hyoM/RXTc0cdiJwPMiOTEp4g658vnqp6nZCY6jMei2HDNMvjcMgAUPil9kSpdJQRzA==
X-Received: by 2002:a05:600c:3ca0:b0:40b:37d9:b646 with SMTP id bg32-20020a05600c3ca000b0040b37d9b646mr11047907wmb.3.1701267872204;
        Wed, 29 Nov 2023 06:24:32 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 10/10] gpiolib: remove gpiochip_is_requested()
Date: Wed, 29 Nov 2023 15:24:11 +0100
Message-Id: <20231129142411.76863-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129142411.76863-1-brgl@bgdev.pl>
References: <20231129142411.76863-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have no external users of gpiochip_is_requested(). Let's remove it
and replace its internal calls with direct testing of the REQUESTED flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 46 ++++++++++---------------------------
 include/linux/gpio/driver.h |  1 -
 2 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8e932e6a6a8d..3070a4f7bbb1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1085,7 +1085,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 	for (i = 0; i < gdev->ngpio; i++) {
-		if (gpiochip_is_requested(gc, i))
+		if (test_bit(FLAG_REQUESTED, &gdev->descs[i].flags))
 			break;
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
@@ -2373,33 +2373,6 @@ void gpiod_free(struct gpio_desc *desc)
 	gpio_device_put(desc->gdev);
 }
 
-/**
- * gpiochip_is_requested - return string iff signal was requested
- * @gc: controller managing the signal
- * @offset: of signal within controller's 0..(ngpio - 1) range
- *
- * Returns NULL if the GPIO is not currently requested, else a string.
- * The string returned is the label passed to gpio_request(); if none has been
- * passed it is a meaningless, non-NULL constant.
- *
- * This function is for use by GPIO controller drivers.  The label can
- * help with diagnostics, and knowing that the signal is used as a GPIO
- * can help avoid accidentally multiplexing it to another controller.
- */
-const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset)
-{
-	struct gpio_desc *desc;
-
-	desc = gpiochip_get_desc(gc, offset);
-	if (IS_ERR(desc))
-		return NULL;
-
-	if (test_bit(FLAG_REQUESTED, &desc->flags) == 0)
-		return NULL;
-	return desc->label;
-}
-EXPORT_SYMBOL_GPL(gpiochip_is_requested);
-
 /**
  * gpiochip_dup_line_label - Get a copy of the consumer label.
  * @gc: GPIO chip controlling this line.
@@ -2414,16 +2387,21 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
  */
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 {
-	const char *label;
+	struct gpio_desc *desc;
 	char *cpy;
 
-	label = gpiochip_is_requested(gc, offset);
-	if (!label)
+	desc = gpiochip_get_desc(gc, offset);
+	if (IS_ERR(desc))
 		return NULL;
 
-	cpy = kstrdup(label, GFP_KERNEL);
-	if (!cpy)
-		return ERR_PTR(-ENOMEM);
+	scoped_guard(spinlock_irqsave, &gpio_lock) {
+		if (!test_bit(FLAG_REQUESTED, &desc->flags))
+			return NULL;
+
+		cpy = kstrdup(desc->label, GFP_KERNEL);
+		if (!cpy)
+			return ERR_PTR(-ENOMEM);
+	}
 
 	return cpy;
 }
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 6405f6d454af..1679e6fa5469 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -531,7 +531,6 @@ struct gpio_chip {
 #endif /* CONFIG_OF_GPIO */
 };
 
-const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
 
 /**
-- 
2.40.1


