Return-Path: <linux-gpio+bounces-946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB25802EBB
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD775B20A10
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36ACF1A5B8;
	Mon,  4 Dec 2023 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FyFfMo7H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFDE1A4
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:25 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c09d0b045so11439775e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682524; x=1702287324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUM8/16TtFRuJWbQL1BXzPDgwc0PUnSgAFPYdXYTVlM=;
        b=FyFfMo7HI5+vw6MJIdRERUca43k5eYUzMMRtv3IJ4beevHXsYl/Xqdzg+hFR2UxqBz
         J/n61hAUMqRf/v4cT72e4fM4bYXXHmX1Emqunn7A4SYznehtvhhZifQbpDzZ3OYZ3gqh
         M+pN5bAFFzndXW333+WVRjNvFCj8dfEQyaatai5GicMThDfA5d/4qYwoCQ0MC51g2Rak
         361wrFDOO3UjsYgg5K6dxfCP/hgque6u3vESzRJ80KJ6KkaEZ6TRG2CR/MG1LnEjQw1K
         KKem0GS4J2JuMCcMxnrrKcjReFVwcqyQ4KEKAxMaQyiKIvx6ebYrGGxpagOWbwGeq2wa
         1YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682524; x=1702287324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUM8/16TtFRuJWbQL1BXzPDgwc0PUnSgAFPYdXYTVlM=;
        b=s9Xe++xtdCC0aDA0mypZsmSh70fiTCwOvSrmuM0JwlbWrbEPZUzJGeor5HHzjdUb4I
         3JgX9kNZBOcTd53Mfdr5iIU5MA/PG9NhsylB/ahs8nARG522XAwLOAcj4QWmG/dx8pb9
         UddVhdkMmt0+OqR7y2B+u8KahXdXBVG9Q892o2pRzr9PjwQX4Sx3n7M2ugkrwt3IDtym
         G6MxIKqchMrf0bwEhRpKuHZffsWHIUEsYvMymNSUOSEklbz5VfzTcZfo1Uu6G9lFcJMq
         3o9D2AHBxg31B1fpAAM+ip/vBXnn4tE3KXzv18UnGGDkDFYulBkRmu6hSkNTCbu9s6yb
         2WPA==
X-Gm-Message-State: AOJu0YxELrUgyv/3iLmLQEixSlzKf8x8ETvRtflSGTmI7bU5r1ZsBEnq
	6Z5ibuWZdyiIr9Ezj1Z48peiWQ==
X-Google-Smtp-Source: AGHT+IFIyn9k8yICnEpxu1kT5sz0yPZeDdyS6pUYcY8kYaa7qco4dUZC7Fm9sqnREfN+Da2D/gi3iQ==
X-Received: by 2002:a05:600c:364d:b0:40b:5e21:c5c7 with SMTP id y13-20020a05600c364d00b0040b5e21c5c7mr1679318wmq.149.1701682523813;
        Mon, 04 Dec 2023 01:35:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 10/10] gpiolib: remove gpiochip_is_requested()
Date: Mon,  4 Dec 2023 10:35:09 +0100
Message-Id: <20231204093509.19225-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231204093509.19225-1-brgl@bgdev.pl>
References: <20231204093509.19225-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c      | 48 ++++++++++---------------------------
 include/linux/gpio/driver.h |  1 -
 2 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d4b33782cc10..4e190be75dc2 100644
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
@@ -2414,18 +2387,23 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
  */
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 {
-	const char *label;
-	char *copy;
+	struct gpio_desc *desc;
+	char *label;
 
-	label = gpiochip_is_requested(gc, offset);
-	if (!label)
+	desc = gpiochip_get_desc(gc, offset);
+	if (IS_ERR(desc))
 		return NULL;
 
-	copy = kstrdup(label, GFP_KERNEL);
-	if (!copy)
+	guard(spinlock_irqsave)(&gpio_lock);
+
+	if (!test_bit(FLAG_REQUESTED, &desc->flags))
+		return NULL;
+
+	label = kstrdup(desc->label, GFP_KERNEL);
+	if (!label)
 		return ERR_PTR(-ENOMEM);
 
-	return copy;
+	return label;
 }
 EXPORT_SYMBOL_GPL(gpiochip_dup_line_label);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 910fc50d3ab5..bd9bea7cb270 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -531,7 +531,6 @@ struct gpio_chip {
 #endif /* CONFIG_OF_GPIO */
 };
 
-const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
 
 
-- 
2.40.1


