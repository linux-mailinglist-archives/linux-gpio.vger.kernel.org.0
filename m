Return-Path: <linux-gpio+bounces-15539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B6A2C4BC
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 918FA3AF713
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 14:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6C11F9EC0;
	Fri,  7 Feb 2025 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yd5rOPDA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2806B1F8AF8
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937212; cv=none; b=bikUvTYdalUx/ZXTm6LQqk0BtmKJkyzkgrZfGA3Upbe/D9hQXyOMMiJeVZswjLKduM5Y8ogRTECXwGVMEfchB4P5qyNHoViV9+JyEcZ9t/rL/He5s0P/g46IJjPAz9OnsZkCvSlTWC4fK0lKyH78vaB9ExoXtOW7kLY7xFO994s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937212; c=relaxed/simple;
	bh=/+atRYGkzWkrF11+aBXVPjX2iSt27l26vrl53ByHtpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VlkMxtIudCP8AuMRu84enWwwiPpqGYGG7merad/C6mlSkwB6Svug+ssxdF2NfUpe4K75d/eQYzvKjgMPh1QmI74V/Un5rTqRPxBqmHWiMzQdEJFT9nWzYxx6jcEDdbVq0x/zTaIyJ1iXSSrRuXKxmhzG8ur3N3nIUM5egoaPOzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yd5rOPDA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso14238875e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 06:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738937208; x=1739542008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bi8V3nc67FAR7arKY4Dyfn3J3o7Kox2zEvzSP3nrKFA=;
        b=yd5rOPDAWrKTjXx43qDEndgKZDX2YTpGEUInhURzFrXxvr29Km82uJ7Ijqk6EjjwTE
         VBZhvM5xkRq7icKW80apNyrqoWQX3HmJNwe9Ve5uKSiIK0B2a3g4NfWbJB8lqp41ex0h
         9BZatQqtm7sZVmKndl0RT44kUitV7QGQXvKwdybk6k0M6DNj5pz+bwpRfLDWadk4LCA0
         abjJzSbKSY2mpgC3y8Pv5ndcE+TJ1gTfbxaaq/Djvr4catvyXtDXG2yMFa3BWah7pcp0
         0kwP1k7qs0mrDOwAvaDPquT1YWkLYcM3YMP5qoxtO8UvmNJwdewJx6p+QkTAoRcKXhYn
         WjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937208; x=1739542008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi8V3nc67FAR7arKY4Dyfn3J3o7Kox2zEvzSP3nrKFA=;
        b=fO3gehzgldjC/RpudYk/s6Vlyx2gRzmbOIoUHQkMvJrcZoSp92WtxyMGXbi547JIOE
         fgVHpj7hT4nhE+ELLf7IpqFgvZoyX9XqC/eqG9dRR1vHtlWLLlnd8tmqVGNbWk9P7hrb
         3TrfCKqjIo0djwlHmbZe3qsSPoZwwzZBMTAKDVYb4mZJd4WZmQmB4fT2X1ac+rJl9tsV
         xQKr32Q7PeMucolrO6d0iHhwHibC4E06sfCn+b7KXYRqFVGTCI9ur3Im+lWpS0LW/gZJ
         iaQNBBJmv5XYLEaQbyYLho92yDO6S90wHUvNWhidMilQQvElrV+GHuSz1Rz9L+3DVUgy
         SW9Q==
X-Gm-Message-State: AOJu0YyY3x0LIS1iAG6bv1RkBBw3yu/57MlxrKaA6IIEdcZDpn8XM47E
	VcdoHfN0CIAbUumqQ7IGcdVXGg4qt/o1IGzdNeiyhjP9nm+8p9mUuiNKwnOt4lE=
X-Gm-Gg: ASbGncvfGG/D44g5cKTLzoE3JsMVa6nzjpD9qCFXnNS7F9OyOGum72iw5nSE0KJww1Y
	cDfgaImBn6mmbZcsPkM38S95s+V45X98kFcX/MPIzmBsW30rxY8E83txsJbQxmLOa5sCHZFniHf
	abpHzHwaDbHSQAz5XETBLRdm+sA/BB+ypFsKXBkv/ETlZLFZN2pQz+M8a1NhfQGp3e8j1vlNWAw
	LyQ1gNEppx9VBCqEq5hqCRDsZMpZItkEldlmetNQyvMXh2G6jFigzwTOfmgMsMNgHklAMtWXcUV
	fGpySAmtkYpb8Q==
X-Google-Smtp-Source: AGHT+IFT6StL9+cv/Mca8lE2/6nU79pNpRJLnSbz9dglzFGJiRnXiiZ+PtRCuOc05D0NEBFYZctDkw==
X-Received: by 2002:a5d:47cc:0:b0:38a:888c:676f with SMTP id ffacd0b85a97d-38dc8ddd8e8mr2054569f8f.15.1738937208274;
        Fri, 07 Feb 2025 06:06:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ae69:c28e:8e23:dca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dca0b4237sm2033950f8f.85.2025.02.07.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:06:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
Date: Fri,  7 Feb 2025 15:06:40 +0100
Message-ID: <20250207140640.57664-1-brgl@bgdev.pl>
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
David Lechner's series made me realize that we don't use SRCU to protect
the GPIO chip in case where array_info is available in multiple get/set
routines. This addresses it. The changes here could potentially be split
into two separate commits but I want to easily backport it and it works
together as well.

 drivers/gpio/gpiolib.c | 48 +++++++++++++++++++++++++++++-------------
 drivers/gpio/gpiolib.h |  4 ++--
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb14..6e630680be52 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3129,6 +3129,8 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 static int gpio_chip_get_multiple(struct gpio_chip *gc,
 				  unsigned long *mask, unsigned long *bits)
 {
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
 	if (gc->get_multiple)
 		return gc->get_multiple(gc, mask, bits);
 	if (gc->get) {
@@ -3159,6 +3161,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap)
 {
+	struct gpio_chip *gc;
 	int ret, i = 0;
 
 	/*
@@ -3170,10 +3173,15 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
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
@@ -3454,6 +3462,8 @@ static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 static void gpio_chip_set_multiple(struct gpio_chip *gc,
 				   unsigned long *mask, unsigned long *bits)
 {
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
 	if (gc->set_multiple) {
 		gc->set_multiple(gc, mask, bits);
 	} else {
@@ -3471,6 +3481,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap)
 {
+	struct gpio_chip *gc;
 	int i = 0;
 
 	/*
@@ -3482,14 +3493,19 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
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
@@ -4751,8 +4767,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 {
 	struct gpio_desc *desc;
 	struct gpio_descs *descs;
+	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
-	struct gpio_chip *gc;
 	int count, bitmap_size;
 	size_t descs_size;
 
@@ -4774,7 +4790,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
 		descs->desc[descs->ndescs] = desc;
 
-		gc = gpiod_to_chip(desc);
+		gdev = gpiod_to_gpio_device(desc);
 		/*
 		 * If pin hardware number of array member 0 is also 0, select
 		 * its chip as a candidate for fast bitmap processing path.
@@ -4782,8 +4798,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		if (descs->ndescs == 0 && gpio_chip_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
 
-			bitmap_size = BITS_TO_LONGS(gc->ngpio > count ?
-						    gc->ngpio : count);
+			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
+						    gdev->ngpio : count);
 
 			array = krealloc(descs, descs_size +
 					 struct_size(array_info, invert_mask, 3 * bitmap_size),
@@ -4803,7 +4819,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
 			array_info->desc = descs->desc;
 			array_info->size = count;
-			array_info->chip = gc;
+			array_info->gdev = gdev;
 			bitmap_set(array_info->get_mask, descs->ndescs,
 				   count - descs->ndescs);
 			bitmap_set(array_info->set_mask, descs->ndescs,
@@ -4816,7 +4832,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			continue;
 
 		/* Unmark array members which don't belong to the 'fast' chip */
-		if (array_info->chip != gc) {
+		if (array_info->gdev != gdev) {
 			__clear_bit(descs->ndescs, array_info->get_mask);
 			__clear_bit(descs->ndescs, array_info->set_mask);
 		}
@@ -4840,8 +4856,10 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			}
 		} else {
 			/* Exclude open drain or open source from fast output */
-			if (gpiochip_line_is_open_drain(gc, descs->ndescs) ||
-			    gpiochip_line_is_open_source(gc, descs->ndescs))
+			if (gpiochip_line_is_open_drain(gdev->chip,
+							descs->ndescs) ||
+			    gpiochip_line_is_open_source(gdev->chip,
+							 descs->ndescs))
 				__clear_bit(descs->ndescs,
 					    array_info->set_mask);
 			/* Identify 'fast' pins which require invertion */
@@ -4853,7 +4871,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
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


