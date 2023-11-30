Return-Path: <linux-gpio+bounces-783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3377FF096
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15E28B2102B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CCF482E8;
	Thu, 30 Nov 2023 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rZ0hzX8D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A114137
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:49 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332e56363adso639577f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701352007; x=1701956807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1Jm7DZtmPUI+tkjKaFM9ATO3Ta/nvLDLxNBysClivQ=;
        b=rZ0hzX8DL/w4ofgdyAKw05NRnXAh3WfKF/i92JxrjSdCSEbeP20De8vn/ZyfI6qx7v
         /VOPVgXWnKDAVb0dujZBwXRnyRYc6FjdA92jeh0rL2TrPk2yWzySVk7T5EQja3HTzQN5
         LDIIvg3T//aNV0hNOYOkjQdaLWGfe3cuPLnqbT66h+LzaRmmU1CjvLquivalVyVwISzB
         4KedLcpic7A/6C8Nfl4SBaAnNxyyhDZlii0QwwukYc8JZthuO++wdVS9Q9Q3SspeyZXM
         vPEb34uuWqu5Of1ne7RyLjkG+kZMGnbt3ZpELSeKocsTZCciib7HMrJyeIky7Pz+HLOc
         0OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352007; x=1701956807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1Jm7DZtmPUI+tkjKaFM9ATO3Ta/nvLDLxNBysClivQ=;
        b=PrxOzyAoUt2f6436SefhYx+IPn20Mr6l1pKmgyyh5+oI6uCibqQyPf3Sc9pbIX06em
         QodZcycY+gsQ3lreFVh2EHDS1DX8fszzJrqT6lvMM3/NXh4yWRVz7Icp5EG4gSRCI5rr
         XDxdM1sFdTEKFK3JrPHOrIszfq3hSNWT90o1ne5bfnI+n3DLf4aG+btNNAZIsclckkjZ
         cls95BFccL18auFyGYr2AxG7hJM1U1Gy95U+lBFyvWgsIDp8BgbIAyb5CgxiDnG4hmpX
         80aLik3QcQvCUMZNz7nKGJkAoBkUjiVWjYyqzaG7R2VeC72+T+rZz7QE6i7DgcflCHD1
         3dKQ==
X-Gm-Message-State: AOJu0Yz02Ju84hNC6dThNDlqzrPWfFWoSQD+1iQPEdUHwuwruoOAOu47
	7Or7QCpaKcTEFAihMpCcF5H5MfYR8nxh1kBl6SA=
X-Google-Smtp-Source: AGHT+IEAj1farO/m8WTaPZy/0DRdVPSgaZ/tTSVTZIibBXNvNig5A36Zldn7TIaNUdtS3M0Pnn/seQ==
X-Received: by 2002:adf:f283:0:b0:333:273f:1cd with SMTP id k3-20020adff283000000b00333273f01cdmr811971wro.36.1701352007562;
        Thu, 30 Nov 2023 05:46:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 10/10] gpiolib: remove gpiochip_is_requested()
Date: Thu, 30 Nov 2023 14:46:30 +0100
Message-Id: <20231130134630.18198-11-brgl@bgdev.pl>
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
index b1ed501e9ee0..9a44016789c8 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -531,7 +531,6 @@ struct gpio_chip {
 #endif /* CONFIG_OF_GPIO */
 };
 
-const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
 
 
-- 
2.40.1


