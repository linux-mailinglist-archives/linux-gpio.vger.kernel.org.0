Return-Path: <linux-gpio+bounces-774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681F7FF08F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E139CB20EFE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5758482D8;
	Thu, 30 Nov 2023 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rAgWJ7wy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4273C171E
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:38 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3331974c2d2so683959f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701351997; x=1701956797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2vlGJhIze8sK7FhkyHeBLiiHYWZ044RLoNjc90UYtQ=;
        b=rAgWJ7wyrL/2May5aYimych21ZT2tm9IZy5+6tzsEA7vOXntL9Srb5PvQQ9TcF6NhF
         MaEOY5BLqtebCj71nnSZ6qxpL+an6GBNQd5/zmkU+Jvd2/5lH1DjGPS8/iFLmCBKwIQj
         3eyEZNgYmlJ/AsdyLG2EdoK0emymKfJNylO6MyjoYvqAVqCmw/jR4ovjxSQ5Zgzhz3IV
         e5+kOKCKXTGWmBja+iAksyYMosvX3FgCmT+cLnsvxTc8mZ2ePWnIZFPDLR5etuIvNaF5
         XQFvEU7OZHF/bknywPNNwqgMz7tECkqqyusch/F0ivM1MruvTvbMlKblV6nA8drVsEeJ
         VUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701351997; x=1701956797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2vlGJhIze8sK7FhkyHeBLiiHYWZ044RLoNjc90UYtQ=;
        b=DxAT2bMvMMCtTwdqL3U6xOZcqTHjWcgpSil+KtvSfrZ8WAq8Uw3/a+YlW1RSBJyDVJ
         04xwsRnKuGPvot52IIi0cLX40GTwFu5wyKdxVeRqxe5ECll35Rx/SK6x8r4plHBjL/M2
         opH41ycNDjGpW1OLkCE5SZAW+FPeedU5Tsi5iNoR3z4zssPP6JXgvSGTvdarztp0s9NJ
         XOG4gNUUZiQX1/iumkMSBRnrIyEgEOzUIxTdaOC8NODFpsm2oiRTiM5Kp7W+V3ZxHfKe
         xpkTIg48ZRbMqicErKdLpwh2K0RmIqFay/yL+eynPbVUxvk1GnnNvxf99K27kSLO+tMj
         I6kg==
X-Gm-Message-State: AOJu0YwxbU2QZpy8HUaA4HKNyiPzdjrmPJeNgC0yqXQnmoQrxRx0S/PG
	pu/ZL4rEb0AFPrPxwjuXZBAUJQ==
X-Google-Smtp-Source: AGHT+IGtdd0VMXL+p2c6eyqLy6MItc8V4wcu+0Ncauj4wLWwBbw5ot6jZfezOIhzkjhPuljZoeg+Vg==
X-Received: by 2002:adf:f64a:0:b0:333:12f9:d37a with SMTP id x10-20020adff64a000000b0033312f9d37amr5219213wrp.65.1701351996563;
        Thu, 30 Nov 2023 05:46:36 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 01/10] gpiolib: provide gpiochip_dup_line_label()
Date: Thu, 30 Nov 2023 14:46:21 +0100
Message-Id: <20231130134630.18198-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130134630.18198-1-brgl@bgdev.pl>
References: <20231130134630.18198-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiochip_is_requested() not only has a misleading name but it returns
a pointer to a string that is freed when the descriptor is released.

Provide a new helper meant to replace it, which returns a copy of the
label string instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 29 +++++++++++++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a5faaea6915d..8e932e6a6a8d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2400,6 +2400,35 @@ const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_is_requested);
 
+/**
+ * gpiochip_dup_line_label - Get a copy of the consumer label.
+ * @gc: GPIO chip controlling this line.
+ * @offset: Hardware offset of the line.
+ *
+ * Returns:
+ * Pointer to a copy of the consumer label if the line is requested or NULL
+ * if it's not. If a valid pointer was returned, it must be freed using
+ * kfree(). In case of a memory allocation error, the function returns %ENOMEM.
+ *
+ * Must not be called from atomic context.
+ */
+char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
+{
+	const char *label;
+	char *cpy;
+
+	label = gpiochip_is_requested(gc, offset);
+	if (!label)
+		return NULL;
+
+	cpy = kstrdup(label, GFP_KERNEL);
+	if (!cpy)
+		return ERR_PTR(-ENOMEM);
+
+	return cpy;
+}
+EXPORT_SYMBOL_GPL(gpiochip_dup_line_label);
+
 /**
  * gpiochip_request_own_desc - Allow GPIO chip to request its own descriptor
  * @gc: GPIO chip
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 100c329dc986..9796a34e2fee 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -532,6 +532,7 @@ struct gpio_chip {
 };
 
 const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
+char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
 
 /**
  * for_each_requested_gpio_in_range - iterates over requested GPIOs in a given range
-- 
2.40.1


