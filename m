Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCFCA797525
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 17:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbjIGPqO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 11:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245149AbjIGP3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 11:29:20 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4401BFA
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 08:28:48 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-402d499580dso12295835e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694100477; x=1694705277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ADDhL3Y9ChksGd5FuRK3cdw+MrzNNwwXAMmsBve8eY=;
        b=dt7li3pggFFC3EGjs1qK30kJrmwN0MKXFcHaZO3XthbniG/9SoNKH2Expe6zPhmPjf
         eXo0xq6p93XShe+ON7YxdolbRk1q2fRpuc3VL1YL4M3Yqo19J/2nwRX4YL78Z3j6k3zS
         HpP6HVXark72rB/HOT1UH0e0qdTz7mm9dnuejdNkCv3bKkms3VKJqjNq3JdUqHJoji3B
         ViP9T2ksnKubYt+SfhVjXCRkS907GdbZ4l5nfvkz+WyT1hHb0KoE1qzwWpQAk/lncSbt
         7qTL5mLyaHkfiVJ0OoGqug/g8N7NsfCGiyDEI96bhE1qpQwzLeYHmDKtwkxO28Xn8k1b
         4Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100477; x=1694705277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ADDhL3Y9ChksGd5FuRK3cdw+MrzNNwwXAMmsBve8eY=;
        b=aOR30dBZ3cycRiB7P4xsWpr9hA26WBsafXukg1VKqV253Wrnwtgu0g/L6bZ4TxnRZT
         b2I9DBHVSfBrX1MQr9eQUH1UwJ3PIC1NOjqrEDy1b2YjS/+1HM4qrYeJdzsxmXt5wwZh
         ygiqkXj+fgPSqKACi/ZnB4YJN2gQViURFmiB7TyP5yN3ziaQLIav/xzUZBw76Yilhrai
         vY5ucCrx+3f0ULA7tUBio3aTB0CKVYur3EcWP6o/2e65gQhkaWpt5wDT+vGP9jQK3iOm
         F52mluhIYZeI4uMRDtexqSLradtQ77KDXp3FMpi7OjUbGlDi68NsIwCL6Qci+MzPv02o
         tc0g==
X-Gm-Message-State: AOJu0YzYvNnYhEclBQB0qqEXCJN+djvpMJTgsC0jiFmT2vbzugUKh34d
        GXXlx43QI/N91av1q1JfN1/pUTaC3hflFU/4rWU=
X-Google-Smtp-Source: AGHT+IGYRLf7GpXbSfX9yL4OLNbiYEdnhHMAnQCxOV6DjnXOpS1Z/JCpHYk+r7prOvveef7RE/lcMg==
X-Received: by 2002:a05:600c:2809:b0:3fe:dcd0:2e10 with SMTP id m9-20020a05600c280900b003fedcd02e10mr5150331wmb.17.1694098355761;
        Thu, 07 Sep 2023 07:52:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:56f5:e2d4:1e04:b28e])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c020200b003feef82bbefsm2757588wmi.29.2023.09.07.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:52:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 4/5] gpio: mockup: simplify code by using cleanup helpers
Date:   Thu,  7 Sep 2023 16:52:29 +0200
Message-Id: <20230907145230.44085-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230907145230.44085-1-brgl@bgdev.pl>
References: <20230907145230.44085-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use lock from linux/cleanup.h and simplify locking paths.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mockup.c | 45 ++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index ff1a263f1b05..44684ff4462f 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
@@ -92,9 +93,8 @@ static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 	int val;
 
-	mutex_lock(&chip->lock);
-	val = __gpio_mockup_get(chip, offset);
-	mutex_unlock(&chip->lock);
+	scoped_guard(mutex, &chip->lock)
+		val = __gpio_mockup_get(chip, offset);
 
 	return val;
 }
@@ -105,12 +105,12 @@ static int gpio_mockup_get_multiple(struct gpio_chip *gc,
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 	unsigned int bit, val;
 
-	mutex_lock(&chip->lock);
-	for_each_set_bit(bit, mask, gc->ngpio) {
-		val = __gpio_mockup_get(chip, bit);
-		__assign_bit(bit, bits, val);
+	scoped_guard(mutex, &chip->lock) {
+		for_each_set_bit(bit, mask, gc->ngpio) {
+			val = __gpio_mockup_get(chip, bit);
+			__assign_bit(bit, bits, val);
+		}
 	}
-	mutex_unlock(&chip->lock);
 
 	return 0;
 }
@@ -126,9 +126,9 @@ static void gpio_mockup_set(struct gpio_chip *gc,
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
+
 	__gpio_mockup_set(chip, offset, value);
-	mutex_unlock(&chip->lock);
 }
 
 static void gpio_mockup_set_multiple(struct gpio_chip *gc,
@@ -137,10 +137,10 @@ static void gpio_mockup_set_multiple(struct gpio_chip *gc,
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 	unsigned int bit;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
+
 	for_each_set_bit(bit, mask, gc->ngpio)
 		__gpio_mockup_set(chip, bit, test_bit(bit, bits));
-	mutex_unlock(&chip->lock);
 }
 
 static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
@@ -150,7 +150,7 @@ static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
 	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
 	int curr, irq, irq_type, ret = 0;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 
 	if (test_bit(FLAG_REQUESTED, &desc->flags) &&
 	    !test_bit(FLAG_IS_OUT, &desc->flags)) {
@@ -187,7 +187,6 @@ static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
 
 out:
 	chip->lines[offset].pull = value;
-	mutex_unlock(&chip->lock);
 	return ret;
 }
 
@@ -212,10 +211,10 @@ static int gpio_mockup_dirout(struct gpio_chip *gc,
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	mutex_lock(&chip->lock);
-	chip->lines[offset].dir = GPIO_LINE_DIRECTION_OUT;
-	__gpio_mockup_set(chip, offset, value);
-	mutex_unlock(&chip->lock);
+	scoped_guard(mutex, &chip->lock) {
+		chip->lines[offset].dir = GPIO_LINE_DIRECTION_OUT;
+		__gpio_mockup_set(chip, offset, value);
+	}
 
 	return 0;
 }
@@ -224,9 +223,8 @@ static int gpio_mockup_dirin(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	mutex_lock(&chip->lock);
-	chip->lines[offset].dir = GPIO_LINE_DIRECTION_IN;
-	mutex_unlock(&chip->lock);
+	scoped_guard(mutex, &chip->lock)
+		chip->lines[offset].dir = GPIO_LINE_DIRECTION_IN;
 
 	return 0;
 }
@@ -236,9 +234,8 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 	int direction;
 
-	mutex_lock(&chip->lock);
-	direction = chip->lines[offset].dir;
-	mutex_unlock(&chip->lock);
+	scoped_guard(mutex, &chip->lock)
+		direction = chip->lines[offset].dir;
 
 	return direction;
 }
-- 
2.39.2

