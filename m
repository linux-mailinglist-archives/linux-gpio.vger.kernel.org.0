Return-Path: <linux-gpio+bounces-16059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35065A36D28
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 10:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1B791895969
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 09:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D207E1A239E;
	Sat, 15 Feb 2025 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lOPYx0Uo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69DB1A08B8
	for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739613421; cv=none; b=b9Jmr5HXwD7/Iepbd7yXP8EunJNHN6TRO4G2hIUBly5xa3JP8KK7PGdL6wTsWFmMERfOglatua2pS4xPAdVroF3R6IzBLme18WVEydqRRH0oG8NWT3T4MzELarLFFoPFvW0Ujflu83ds8clrBGL3im7VyCF5t0hoXGafpOC/ba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739613421; c=relaxed/simple;
	bh=aRiipxX9PXCfz0OVancq4CX7H77aJDwgpGuHlKHBlGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5Bs1+VzAvpbfWcpo3N6ZzjDJW0Tx08vGFsOLYwZSn+BvmQ57E4s3j5RglD/R6CvpttZAy2MDrn2pSkS6ZbrSq6FrpLqHsVFi4/M9+eKY8CcscILuKAq5ApWup7hrxuOE7SlZPh88CBOJWdYmNJsoAvRiL1vVzeVu7Q+Sg6tJew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lOPYx0Uo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4396a4d5e3bso12524105e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739613418; x=1740218218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ccqoRdy3IFCtoPhUXTcl3PCdc7rDr7VoqvtAi8zyjc=;
        b=lOPYx0UoA+I18uk1PC3QyK1ApBTpdGtcYBq3DBTKKh5gbUEB2DgZD1mR9jBtoeTGFO
         tDYS4B5rGeYVmUTNN8WcYqVWMuX6fSRkBityYqxAXq+UoCFHep/M+J7Qa3MnOm3e9+8M
         46eb1SdK0rms3euqGPKAqm1vLS8eQR3n7+u6LNwiBYZxHM/UyG7z3Dq4PKNtGEaExMhK
         3jL/9f3xXUziDlfZyhCuhMa8lO6Ga8+S3eWgjSJ6wgn6CKANH27WbA5BsUboehQRy4rC
         VlUO2NBNICoWCOa+BtLM17UFWowESqMELQL+BNNPeQ1E+xm7T+7GtKaVKB5GpLlJ3bhR
         5ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739613418; x=1740218218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ccqoRdy3IFCtoPhUXTcl3PCdc7rDr7VoqvtAi8zyjc=;
        b=jjGiW9pNXk61NutDjxqMeQz6WYxmDEjxTiIaVa9a9C4EEqDwjhSdOC6z95jRZqldrq
         ThRM1mfzu9MBKyp2HXs3DcwG/UKdTBhAEeDHJg5trgS+NZyWze0mFw6YoHbxwpqfgPxP
         AmpUEOaRHnZQKACC7yNywCL+8n3cR/mWzUF/r1YHjjT+MWFnbFHLVD1HVXt8vPZs46aJ
         xMBebKOFfbJNevcedEQPua4RkpSaetk28oNKbGiTMB6JWd3Rh+gi0X4TQNP4IboNn7lW
         eN7h+2XZnc88JAgJrt4VJHKZdMEC8oHhNhAxt82qHQJT0+wD8Z5qTNGQuFlXmesvm1XO
         pcfA==
X-Gm-Message-State: AOJu0YySO5aXqEqBGLt2J5OjPjVU+yWktlragWQ0i9ZCsdwm9kz2w+kh
	6jY0OtdaTDe4JKJ8+ARDY2nYDhHUXqRP2DnnKTn0CbS2UBS6UcGJDfc+7ss3spY=
X-Gm-Gg: ASbGncugFKLpnInaDRdOcv2SKRRxdmL+kyK7B57o8uhtyqOOqQvkYx0E9UyhjlYltsS
	dH9gBSKpJoK3j9gBGUqyaIoh+LHNq+zgJqTetPrZEH44YxzEsG+0DD2H3ArVbRIqyIOZPrdegI7
	mOIp9huiRZOY8WhwzMNtmdi59RkTOYHMn7aE5tBVCfwFQt/HkmQjnwfCvDyIJndiHJYEQxfE1Ik
	xAUwRvNa1RlxPP+ekxw7rRofh0vs5eB/unWL4aJEIug2qy+W0BDkkaHnosFp4xnSnMSE72+NwbY
	sG5VIoui20g5
X-Google-Smtp-Source: AGHT+IHHNZFXsC358QTF7hf1bx5kVWb2BCn3B3u37dcgTY3hT3aTRwvkVXbOfaVvGlcYBKIgYDRTMQ==
X-Received: by 2002:a05:600c:4f11:b0:439:65fa:586a with SMTP id 5b1f17b1804b1-4396e728bc4mr23699275e9.28.1739613417998;
        Sat, 15 Feb 2025 01:56:57 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de0:6b3:d799:3d4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa779sm96746025e9.30.2025.02.15.01.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:56:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
Date: Sat, 15 Feb 2025 10:56:55 +0100
Message-ID: <20250215095655.23152-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

During the locking rework in GPIOLIB, we omitted one important use-case,
namely: setting and getting values for GPIO descriptor arrays with
array_info present.

This patch does two things: first it makes struct gpio_array store the
address of the underlying GPIO device and not chip. Next: it protects
the chip with SRCU from removal in gpiod_get_array_value_complex() and
gpiod_set_array_value_complex().

Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- fix sparse warning about differing address spaces by checking for
  open-drain/source flags directly in the descriptor

 drivers/gpio/gpiolib.c | 48 +++++++++++++++++++++++++++++-------------
 drivers/gpio/gpiolib.h |  4 ++--
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f261f7893f85..fddbcf8a360e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3128,6 +3128,8 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 static int gpio_chip_get_multiple(struct gpio_chip *gc,
 				  unsigned long *mask, unsigned long *bits)
 {
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
 	if (gc->get_multiple)
 		return gc->get_multiple(gc, mask, bits);
 	if (gc->get) {
@@ -3158,6 +3160,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap)
 {
+	struct gpio_chip *gc;
 	int ret, i = 0;
 
 	/*
@@ -3169,10 +3172,15 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 	    array_size <= array_info->size &&
 	    (void *)array_info == desc_array + array_info->size) {
 		if (!can_sleep)
-			WARN_ON(array_info->chip->can_sleep);
+			WARN_ON(array_info->gdev->can_sleep);
 
-		ret = gpio_chip_get_multiple(array_info->chip,
-					     array_info->get_mask,
+		guard(srcu)(&array_info->gdev->srcu);
+		gc = srcu_dereference(array_info->gdev->chip,
+				      &array_info->gdev->srcu);
+		if (!gc)
+			return -ENODEV;
+
+		ret = gpio_chip_get_multiple(gc, array_info->get_mask,
 					     value_bitmap);
 		if (ret)
 			return ret;
@@ -3453,6 +3461,8 @@ static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 static void gpio_chip_set_multiple(struct gpio_chip *gc,
 				   unsigned long *mask, unsigned long *bits)
 {
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
 	if (gc->set_multiple) {
 		gc->set_multiple(gc, mask, bits);
 	} else {
@@ -3470,6 +3480,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap)
 {
+	struct gpio_chip *gc;
 	int i = 0;
 
 	/*
@@ -3481,14 +3492,19 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 	    array_size <= array_info->size &&
 	    (void *)array_info == desc_array + array_info->size) {
 		if (!can_sleep)
-			WARN_ON(array_info->chip->can_sleep);
+			WARN_ON(array_info->gdev->can_sleep);
+
+		guard(srcu)(&array_info->gdev->srcu);
+		gc = srcu_dereference(array_info->gdev->chip,
+				      &array_info->gdev->srcu);
+		if (!gc)
+			return -ENODEV;
 
 		if (!raw && !bitmap_empty(array_info->invert_mask, array_size))
 			bitmap_xor(value_bitmap, value_bitmap,
 				   array_info->invert_mask, array_size);
 
-		gpio_chip_set_multiple(array_info->chip, array_info->set_mask,
-				       value_bitmap);
+		gpio_chip_set_multiple(gc, array_info->set_mask, value_bitmap);
 
 		i = find_first_zero_bit(array_info->set_mask, array_size);
 		if (i == array_size)
@@ -4750,9 +4766,10 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 {
 	struct gpio_desc *desc;
 	struct gpio_descs *descs;
+	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
-	struct gpio_chip *gc;
 	int count, bitmap_size;
+	unsigned long dflags;
 	size_t descs_size;
 
 	count = gpiod_count(dev, con_id);
@@ -4773,7 +4790,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
 		descs->desc[descs->ndescs] = desc;
 
-		gc = gpiod_to_chip(desc);
+		gdev = gpiod_to_gpio_device(desc);
 		/*
 		 * If pin hardware number of array member 0 is also 0, select
 		 * its chip as a candidate for fast bitmap processing path.
@@ -4781,8 +4798,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		if (descs->ndescs == 0 && gpio_chip_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
 
-			bitmap_size = BITS_TO_LONGS(gc->ngpio > count ?
-						    gc->ngpio : count);
+			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
+						    gdev->ngpio : count);
 
 			array = krealloc(descs, descs_size +
 					 struct_size(array_info, invert_mask, 3 * bitmap_size),
@@ -4802,7 +4819,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
 			array_info->desc = descs->desc;
 			array_info->size = count;
-			array_info->chip = gc;
+			array_info->gdev = gdev;
 			bitmap_set(array_info->get_mask, descs->ndescs,
 				   count - descs->ndescs);
 			bitmap_set(array_info->set_mask, descs->ndescs,
@@ -4815,7 +4832,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			continue;
 
 		/* Unmark array members which don't belong to the 'fast' chip */
-		if (array_info->chip != gc) {
+		if (array_info->gdev != gdev) {
 			__clear_bit(descs->ndescs, array_info->get_mask);
 			__clear_bit(descs->ndescs, array_info->set_mask);
 		}
@@ -4838,9 +4855,10 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 					    array_info->set_mask);
 			}
 		} else {
+			dflags = READ_ONCE(desc->flags);
 			/* Exclude open drain or open source from fast output */
-			if (gpiochip_line_is_open_drain(gc, descs->ndescs) ||
-			    gpiochip_line_is_open_source(gc, descs->ndescs))
+			if (test_bit(FLAG_OPEN_DRAIN, &dflags) ||
+			    test_bit(FLAG_OPEN_SOURCE, &dflags))
 				__clear_bit(descs->ndescs,
 					    array_info->set_mask);
 			/* Identify 'fast' pins which require invertion */
@@ -4852,7 +4870,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	if (array_info)
 		dev_dbg(dev,
 			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
-			array_info->chip->label, array_info->size,
+			array_info->gdev->label, array_info->size,
 			*array_info->get_mask, *array_info->set_mask,
 			*array_info->invert_mask);
 	return descs;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 83690f72f7e5..147156ec502b 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -114,7 +114,7 @@ extern const char *const gpio_suffixes[];
  *
  * @desc:		Array of pointers to the GPIO descriptors
  * @size:		Number of elements in desc
- * @chip:		Parent GPIO chip
+ * @gdev:		Parent GPIO device
  * @get_mask:		Get mask used in fastpath
  * @set_mask:		Set mask used in fastpath
  * @invert_mask:	Invert mask used in fastpath
@@ -126,7 +126,7 @@ extern const char *const gpio_suffixes[];
 struct gpio_array {
 	struct gpio_desc	**desc;
 	unsigned int		size;
-	struct gpio_chip	*chip;
+	struct gpio_device	*gdev;
 	unsigned long		*get_mask;
 	unsigned long		*set_mask;
 	unsigned long		invert_mask[];
-- 
2.45.2


