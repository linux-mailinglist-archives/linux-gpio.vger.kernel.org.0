Return-Path: <linux-gpio+bounces-6208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD98BEA74
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 19:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0228F1C2235E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A914A16C453;
	Tue,  7 May 2024 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A1pkl5pB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ED110E6
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715102665; cv=none; b=uEVSjeicuB4qLX40a92y6V74Gh4xfut2bor28/6T/4aADrOchD3AVZWm06SJk44i17gBjINQMKuNeRVcB9m3sWt/ux3/QFfuVPnQSB3Xm8AcHR4ta1H+O4LgMy/9IczrLHn3m4YVnhZ/QdaJoZfmRB1ykQ8U8QXEnbopyNxPhj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715102665; c=relaxed/simple;
	bh=yT2PcacFrSYofWrQQQRGh+R1/Ya5iCToKEc45jTUP4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xjb4Q8hAg8TIm6uSb8JgyQ863haRreSIuym77OFrJo4r/1azXtpvdg2/rEAj4PLRydDwYeeEOBXA5lnxMKrHYPILMr18pQuGw53s21Lu9WxX1poAEGdHFuLoeYpRvb+8J9TD6p6sgfFvth7Tad60qX6GYjD9ZYgp0xzRVoAiob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A1pkl5pB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34d9c9f2cf0so2542819f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 10:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715102662; x=1715707462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uEDX2iDh+s8adyF9eBgT3DFBAnbU/2Aa5SmRe7h56YI=;
        b=A1pkl5pBMX82SStHjxp4m4RVyqMOLp8GZ57fbmJ3EEX8Jy0fcFzlwet4lQCVkLi1tr
         tU3vjrDqWu411SYdcPHvmutiEpSOt3fWX8w5oZcHYUwCZH0b1h2oXjkBXyk9dwuhUQdl
         iW1cewlDB8WAv5YN2GCRuPfS1W0KsXsRJapaHa30vSyjuTu3VUMJXzrY1yPPApRatO6U
         gzxQQ99SJ2gQ7lUx3vRpq9xxcFYFmrMnLdxEIxkrAEbc8c7deLvqKoeHvwqXocgDuaTs
         Jpci8ssktR1vHpVH6yxynjjhpDFsFOYEYD0Vlno9caGju3Mtnjyw4KRmlEe4c7aYA/aL
         NPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715102662; x=1715707462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEDX2iDh+s8adyF9eBgT3DFBAnbU/2Aa5SmRe7h56YI=;
        b=xOKeHH/MAo8MaQVhfokkYNw+O4lyA0rxpG7ULpGn9sySLJNNkIAeu1tiWs0jJMd489
         jx6KxQYG+VbiHQwHjQMBGOtSOvA8Y+/oWxCN35Q8295w0KifSCDyHNXbH6dHe0ynvqLm
         I8z8Yf/hM6RAjyPVSfXoLbUQtUDos3VJ71KYr5WaDCzsaCqPm1an9yAYGImCIgXjoJaF
         kKUhk8dzXpmzoV4dTnJfWgJiJiOcogKMqZEVU8YJUxlvau00/yD8AeWNlvsuEDggRcms
         Ndd6Xny6za9vYQ51hbK30nQuqxTAH6XsdqX/1MeQqu2bey22W9p9ay/l8Xp9xjW4y5KC
         1CMg==
X-Gm-Message-State: AOJu0YwVK/AbI2ZoZZ0+fVN5LCTT8cVeRGi2Dz+TAqEH+OKfXFZoUiuH
	ClLZS+gIjsiRK7xeIx8Uaq3r5yWXfqoRbAyYqUcVI/l8+cvzmfsQiUra1A8ihoI=
X-Google-Smtp-Source: AGHT+IHukMMN4a3ur2f7wYOvZw+wk3ewsGX467dt+EyGyGBx6hif7RTZ1biI5dLhv1c4ESeMbpyIpg==
X-Received: by 2002:adf:e34c:0:b0:34c:def3:2f82 with SMTP id ffacd0b85a97d-34fca241964mr366550f8f.27.1715102661691;
        Tue, 07 May 2024 10:24:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:581a:1d:3b79:3b03])
        by smtp.gmail.com with ESMTPSA id d18-20020adfef92000000b0034c71090653sm13351376wro.57.2024.05.07.10.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 10:24:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH] gpiolib: use a single SRCU struct for all GPIO descriptors
Date: Tue,  7 May 2024 19:24:14 +0200
Message-Id: <20240507172414.28513-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We used a per-descriptor SRCU struct in order to not impose a wait with
synchronize_srcu() for descriptor X on read-only operations of
descriptor Y. Now that we no longer call synchronize_srcu() on
descriptor label change but only when releasing descriptor resources, we
can use a single SRCU structure for all GPIO descriptors in a given chip.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c |  2 +-
 drivers/gpio/gpiolib.c      | 41 +++++++++++++++++--------------------
 drivers/gpio/gpiolib.h      | 10 ++++-----
 3 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d09c7d728365..fea149ae7774 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2351,7 +2351,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 
 	dflags = READ_ONCE(desc->flags);
 
-	scoped_guard(srcu, &desc->srcu) {
+	scoped_guard(srcu, &desc->gdev->desc_srcu) {
 		label = gpiod_get_label(desc);
 		if (label && test_bit(FLAG_REQUESTED, &dflags))
 			strscpy(info->consumer, label,
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2fa3756c9073..fa50db0c3605 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -112,8 +112,8 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 	if (!test_bit(FLAG_REQUESTED, &flags))
 		return NULL;
 
-	label = srcu_dereference_check(desc->label, &desc->srcu,
-				       srcu_read_lock_held(&desc->srcu));
+	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
+				srcu_read_lock_held(&desc->gdev->desc_srcu));
 
 	return label->str;
 }
@@ -138,7 +138,7 @@ static int desc_set_label(struct gpio_desc *desc, const char *label)
 
 	old = rcu_replace_pointer(desc->label, new, 1);
 	if (old)
-		call_srcu(&desc->srcu, &old->rh, desc_free_label);
+		call_srcu(&desc->gdev->desc_srcu, &old->rh, desc_free_label);
 
 	return 0;
 }
@@ -709,13 +709,10 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
 static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
-	unsigned int i;
 
-	for (i = 0; i < gdev->ngpio; i++) {
-		/* Free pending label. */
-		synchronize_srcu(&gdev->descs[i].srcu);
-		cleanup_srcu_struct(&gdev->descs[i].srcu);
-	}
+	/* Call pending kfree()s for descriptor labels. */
+	synchronize_srcu(&gdev->desc_srcu);
+	cleanup_srcu_struct(&gdev->desc_srcu);
 
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
@@ -992,6 +989,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_remove_from_list;
 
+	ret = init_srcu_struct(&gdev->desc_srcu);
+	if (ret)
+		goto err_cleanup_gdev_srcu;
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -999,23 +1000,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (gc->names) {
 		ret = gpiochip_set_desc_names(gc);
 		if (ret)
-			goto err_cleanup_gdev_srcu;
+			goto err_cleanup_desc_srcu;
 	}
 	ret = gpiochip_set_names(gc);
 	if (ret)
-		goto err_cleanup_gdev_srcu;
+		goto err_cleanup_desc_srcu;
 
 	ret = gpiochip_init_valid_mask(gc);
 	if (ret)
-		goto err_cleanup_gdev_srcu;
+		goto err_cleanup_desc_srcu;
 
 	for (desc_index = 0; desc_index < gc->ngpio; desc_index++) {
 		struct gpio_desc *desc = &gdev->descs[desc_index];
 
-		ret = init_srcu_struct(&desc->srcu);
-		if (ret)
-			goto err_cleanup_desc_srcu;
-
 		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
 			assign_bit(FLAG_IS_OUT,
 				   &desc->flags, !gc->get_direction(gc, desc_index));
@@ -1027,7 +1024,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	ret = of_gpiochip_add(gc);
 	if (ret)
-		goto err_cleanup_desc_srcu;
+		goto err_free_valid_mask;
 
 	ret = gpiochip_add_pin_ranges(gc);
 	if (ret)
@@ -1074,10 +1071,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gpiochip_remove_pin_ranges(gc);
 err_remove_of_chip:
 	of_gpiochip_remove(gc);
-err_cleanup_desc_srcu:
-	while (desc_index--)
-		cleanup_srcu_struct(&gdev->descs[desc_index].srcu);
+err_free_valid_mask:
 	gpiochip_free_valid_mask(gc);
+err_cleanup_desc_srcu:
+	cleanup_srcu_struct(&gdev->desc_srcu);
 err_cleanup_gdev_srcu:
 	cleanup_srcu_struct(&gdev->srcu);
 err_remove_from_list:
@@ -2407,7 +2404,7 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 	if (!test_bit(FLAG_REQUESTED, &desc->flags))
 		return NULL;
 
-	guard(srcu)(&desc->srcu);
+	guard(srcu)(&desc->gdev->desc_srcu);
 
 	label = kstrdup(gpiod_get_label(desc), GFP_KERNEL);
 	if (!label)
@@ -4798,7 +4795,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 	}
 
 	for_each_gpio_desc(gc, desc) {
-		guard(srcu)(&desc->srcu);
+		guard(srcu)(&desc->gdev->desc_srcu);
 		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
 			gpiod_get_direction(desc);
 			is_out = test_bit(FLAG_IS_OUT, &desc->flags);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 69a353c789f0..8e0e211ebf08 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -31,6 +31,7 @@
  * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
  * @descs: array of ngpio descriptors.
+ * @desc_srcu: ensures consistent state of GPIO descriptors exposed to users
  * @ngpio: the number of GPIO lines on this GPIO device, equal to the size
  * of the @descs array.
  * @can_sleep: indicate whether the GPIO chip driver's callbacks can sleep
@@ -61,6 +62,7 @@ struct gpio_device {
 	struct module		*owner;
 	struct gpio_chip __rcu	*chip;
 	struct gpio_desc	*descs;
+	struct srcu_struct	desc_srcu;
 	int			base;
 	u16			ngpio;
 	bool			can_sleep;
@@ -150,7 +152,6 @@ struct gpio_desc_label {
  * @label:		Name of the consumer
  * @name:		Line name
  * @hog:		Pointer to the device node that hogs this line (if any)
- * @srcu:		SRCU struct protecting the label pointer.
  *
  * These are obtained using gpiod_get() and are preferable to the old
  * integer-based handles.
@@ -188,7 +189,6 @@ struct gpio_desc {
 #ifdef CONFIG_OF_DYNAMIC
 	struct device_node	*hog;
 #endif
-	struct srcu_struct	srcu;
 };
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
@@ -256,7 +256,7 @@ static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
 
 #define gpiod_err(desc, fmt, ...) \
 do { \
-	scoped_guard(srcu, &desc->srcu) { \
+	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
 		pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
 		       gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
 	} \
@@ -264,7 +264,7 @@ do { \
 
 #define gpiod_warn(desc, fmt, ...) \
 do { \
-	scoped_guard(srcu, &desc->srcu) { \
+	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
 		pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
 			gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
 	} \
@@ -272,7 +272,7 @@ do { \
 
 #define gpiod_dbg(desc, fmt, ...) \
 do { \
-	scoped_guard(srcu, &desc->srcu) { \
+	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
 		pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
 			 gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
 	} \
-- 
2.40.1


