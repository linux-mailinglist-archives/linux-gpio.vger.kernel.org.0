Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4783161BA8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 10:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbfGHIZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 04:25:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51894 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727745AbfGHIZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 04:25:24 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so14784087wma.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2019 01:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oik9uNkr8AfKLvu3XAcx1FCs1T7U54UyCxWESLnO8SI=;
        b=GLZQCoJEgWNINCuzz5U8QF1AGQnPJFkWYRVXIRiSN7GO8RFMhWlR+8k3qPPvmfD7wH
         PuSwu2vbNt6El4uWOlvWl0KYOeXnk6wVThn4kkN5ntiIwCs/BLyRfIn2FCKTxGAEqZZD
         b3j9ZXRmX++tJ3+BqSJ6FuF6CtTYCDGBRns31WejC2T6Gfl6Yai2Hr00YvKZbfJLqZkQ
         c8YsQCglEunODQC17ev57e6fBk6TWbYqFtExf7V9K1J0vSAt2bqn1pD60AV2ovTX2HyI
         853NCyxB6K9CeVvEDFgeSIGQupJmDBMwppCFkWo5ikQtdLpn7Q++64qv+tgNifXncq5a
         fYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oik9uNkr8AfKLvu3XAcx1FCs1T7U54UyCxWESLnO8SI=;
        b=trWWxdRY1FO2/JWsklw71mHFbRFgTSSkY0fIf5g5nxfgsXPOjMVTlqwmKKEcuNtUZk
         8SYrKEnRHtkBpHyhTEOZT+QmJ/wceg6QM1hgwbCNM0I1ycnz7EAvgh1VeqGuhsaYF7V/
         +8uODmTpSpPW/2JMI3mRNT1jRWHcLdQzD4lcDH8d+zxr2Ld66vMKNtN5pdhhBq5TSRpG
         2HgUHxlWPbciWvDDB1TjVhM3J3LF1JALdxJ5v3lliMU3VOdHPJLTjSArO1xZw6FHvmHH
         7nL96ftdmNN1dKnD2Wp6BPijtCK9dgELO8hVXfSJBX5d+rMNwuvbllVdgA9Wu7b4D9IL
         wobQ==
X-Gm-Message-State: APjAAAWyX6lixx3nxrKNcUNTu+WrB4EQmEgwjDlakzH3zcqZ5EkHYxTT
        jrje0XDNWkNbaLjCdXu67kaV+w==
X-Google-Smtp-Source: APXvYqxTylCwoFePpM4qogcV8aCGWpXi32xWBaxaPRM5VsjNoubYhODcw+j8zEGsQpI5VtKAjI3mbg==
X-Received: by 2002:a7b:cc04:: with SMTP id f4mr15988295wmh.125.1562574322389;
        Mon, 08 Jul 2019 01:25:22 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id 91sm17530952wrp.3.2019.07.08.01.25.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 01:25:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Claus H . Stovgaard" <cst@phaseone.com>
Subject: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
Date:   Mon,  8 Jul 2019 10:23:43 +0200
Message-Id: <20190708082343.30726-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

If gpiolib is disabled, we use the inline stubs from gpio/consumer.h
instead of regular definitions of GPIO API. The stubs for 'optional'
variants of gpiod_get routines return NULL in this case as if the
relevant GPIO wasn't found. This is correct so far.

Calling other (non-gpio_get) stubs from this header triggers a warning
because the GPIO descriptor couldn't have been requested. The warning
however is unconditional (WARN_ON(1)) and is emitted even if the passed
descriptor pointer is NULL.

We don't want to force the users of 'optional' gpio_get to check the
returned pointer before calling e.g. gpiod_set_value() so let's only
WARN on non-NULL descriptors.

Reported-by: Claus H. Stovgaard <cst@phaseone.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/gpio/consumer.h | 64 +++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 9ddcf50a3c59..a7f08fb0f865 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -247,7 +247,7 @@ static inline void gpiod_put(struct gpio_desc *desc)
 	might_sleep();
 
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 }
 
 static inline void devm_gpiod_unhinge(struct device *dev,
@@ -256,7 +256,7 @@ static inline void devm_gpiod_unhinge(struct device *dev,
 	might_sleep();
 
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 }
 
 static inline void gpiod_put_array(struct gpio_descs *descs)
@@ -264,7 +264,7 @@ static inline void gpiod_put_array(struct gpio_descs *descs)
 	might_sleep();
 
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(descs);
 }
 
 static inline struct gpio_desc *__must_check
@@ -317,7 +317,7 @@ static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
 	might_sleep();
 
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 }
 
 static inline void devm_gpiod_put_array(struct device *dev,
@@ -326,32 +326,32 @@ static inline void devm_gpiod_put_array(struct device *dev,
 	might_sleep();
 
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(descs);
 }
 
 
 static inline int gpiod_get_direction(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -ENOSYS;
 }
 static inline int gpiod_direction_input(struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -ENOSYS;
 }
 static inline int gpiod_direction_output(struct gpio_desc *desc, int value)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -ENOSYS;
 }
 static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -ENOSYS;
 }
 
@@ -359,7 +359,7 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 static inline int gpiod_get_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return 0;
 }
 static inline int gpiod_get_array_value(unsigned int array_size,
@@ -368,13 +368,13 @@ static inline int gpiod_get_array_value(unsigned int array_size,
 					unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc_array);
 	return 0;
 }
 static inline void gpiod_set_value(struct gpio_desc *desc, int value)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 }
 static inline int gpiod_set_array_value(unsigned int array_size,
 					struct gpio_desc **desc_array,
@@ -382,13 +382,13 @@ static inline int gpiod_set_array_value(unsigned int array_size,
 					unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc_array);
 	return 0;
 }
 static inline int gpiod_get_raw_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return 0;
 }
 static inline int gpiod_get_raw_array_value(unsigned int array_size,
@@ -397,13 +397,13 @@ static inline int gpiod_get_raw_array_value(unsigned int array_size,
 					    unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc_array);
 	return 0;
 }
 static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 }
 static inline int gpiod_set_raw_array_value(unsigned int array_size,
 					    struct gpio_desc **desc_array,
@@ -411,14 +411,14 @@ static inline int gpiod_set_raw_array_value(unsigned int array_size,
 					    unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc_array);
 	return 0;
 }
 
 static inline int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return 0;
 }
 static inline int gpiod_get_array_value_cansleep(unsigned int array_size,
@@ -427,13 +427,13 @@ static inline int gpiod_get_array_value_cansleep(unsigned int array_size,
 				     unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc_array);
 	return 0;
 }
 static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 }
 static inline int gpiod_set_array_value_cansleep(unsigned int array_size,
 					    struct gpio_desc **desc_array,
@@ -441,13 +441,13 @@ static inline int gpiod_set_array_value_cansleep(unsigned int array_size,
 					    unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc_array);
 	return 0;
 }
 static inline int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return 0;
 }
 static inline int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
@@ -456,14 +456,14 @@ static inline int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
 					       unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc_array);
 	return 0;
 }
 static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
 						int value)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 }
 static inline int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 						struct gpio_desc **desc_array,
@@ -471,41 +471,41 @@ static inline int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 						unsigned long *value_bitmap)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc_array);
 	return 0;
 }
 
 static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -ENOSYS;
 }
 
 static inline int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -ENOSYS;
 }
 
 static inline int gpiod_is_active_low(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return 0;
 }
 static inline int gpiod_cansleep(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return 0;
 }
 
 static inline int gpiod_to_irq(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -EINVAL;
 }
 
@@ -513,7 +513,7 @@ static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
 					  const char *name)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -EINVAL;
 }
 
@@ -525,7 +525,7 @@ static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 static inline int desc_to_gpio(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-	WARN_ON(1);
+	WARN_ON(desc);
 	return -EINVAL;
 }
 
-- 
2.21.0

