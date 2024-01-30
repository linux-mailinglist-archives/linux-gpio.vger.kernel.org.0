Return-Path: <linux-gpio+bounces-2745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF77842554
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 536A928BD43
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FC96EB4E;
	Tue, 30 Jan 2024 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2JXQuAWn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF8D6DCE8
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618929; cv=none; b=dAs0hnEn6AY06QaO5CirXJFSip3cu5hzgTg+QA2Q3Oua/KGvqHuTn73HcXGO5Qym9z+TY3xKB6WsrbW1GBgy16YCfFswiDgaFyg6zCL3GF3uujrRAHxMsCAIRjhsefwKfp/F2f2UBDxnjkDUKmD/M5xVZ0Ec5j9CixASf0Vf/gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618929; c=relaxed/simple;
	bh=tRtObxZogumFOl4YzKALlA4fMdN1FOxf6e/M7HZm0V8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=os/EkFkvO0uKVk/ZCsgb/22bg5Zph26OtW1Rv8m/0Tp0+v4Q72luwUFpAByOQdhCX4e84GTIyVL/vqtfpkhRU6/+OT6yksbkhBJ9K847LHqzhRQShBBAejkAwFCPIZoOd28AKbypMguhkCN+lM9b1V44NgdNrNablU94D9spX9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2JXQuAWn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40ef6da20feso12017255e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618926; x=1707223726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf4hrLbZWsC4ubgIBbzrDZoZfZtu8JUtSDXYHSjq/J0=;
        b=2JXQuAWnU96tv13Su1OcRgd20fYYF/Gu6siK635XeVJdJ8VZLbNQd8n15whsibcBwZ
         2pex6PpAfMm0OkYSvgcrf9D/kUZ58fgqrqbuIDsHP4IBnQCnYTXNiqdo6geI/pKAYKco
         QqiiO9kyh9Je4dCJ9K0eef6mmg5oMyI4yj1FEGyW5Q1IpdO/AcK3jxFGrpIMT/ti9sY9
         lRVm5cNw9yFDfjK09HJLCAVUpk8IiTQJTVbHHs7faEMIm3SD9U9j4yeFHvhXf+JTDWma
         mRlPtCGJZHg9QKSPtYuugH3NwvG/KDOqu8y831c0scYnPeLomF/YRfuXg3m/pJCx3pTc
         pJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618926; x=1707223726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yf4hrLbZWsC4ubgIBbzrDZoZfZtu8JUtSDXYHSjq/J0=;
        b=BPCV4CTDyHphX+FmRUxQqw+U5OoKVh+k/Zbgq+iFoBsbI3T7sAkz+iVTQvnwSQl483
         bAhJrnV75fJ80hrFZ/1ekD2SoyvQ3j5/Dd2CfqruvAfje5UKvlMoupaHSygZ2E+aIcmU
         xngy8p/o/OYupa9BuXRiLhBzhbHn5VSrcZBDJr76ARBikp2rQJUVa+d8HO1/U+LKYNb7
         uhz0sa8T8NF5ppnFKDq2NUXw/xA3h8nZpdN84mHCermZ35cveJYTkc4DJSBgPt7uFH+V
         gvYN4SiA/KcT1YoPhSNeesnCfhWiAhTlcvZRbTVgAc1WQ/o57VGl0CPY2TpTSeW+S0+5
         1NHQ==
X-Gm-Message-State: AOJu0YxwLpWh8I6Q2z7rx2KfUmnPWRu1Nyf1N+d1iQlnIJgXYwJlzgTm
	EizVG7D2aAHXg1IqftUCnzF/cjw46i3ow0iCUfb9esz6nH8ylkawHqiRg3SBQpw=
X-Google-Smtp-Source: AGHT+IEAAj583Hw/ycb3WalWDo1I5AHpvT5XQALiHrzIWF6PP92X1RGOXX4vViTzd9mzjQvxLVq+LA==
X-Received: by 2002:a05:600c:1d86:b0:40e:f742:6330 with SMTP id p6-20020a05600c1d8600b0040ef7426330mr1493132wms.18.1706618926162;
        Tue, 30 Jan 2024 04:48:46 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 07/22] gpio: protect the descriptor label with SRCU
Date: Tue, 30 Jan 2024 13:48:13 +0100
Message-Id: <20240130124828.14678-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130124828.14678-1-brgl@bgdev.pl>
References: <20240130124828.14678-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to ensure that the label is not freed while it's being
accessed, let's protect it with SRCU and synchronize it everytime it's
changed.

Let's modify desc_set_label() to manage the memory used for the label as
it can only be freed once synchronize_srcu() returns.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 10 +++++---
 drivers/gpio/gpiolib.c      | 47 +++++++++++++++++++++++--------------
 drivers/gpio/gpiolib.h      | 34 +++++++++++++++++++--------
 3 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 2c0a0700762d..75f4912339a6 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2297,6 +2297,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 {
 	struct gpio_chip *gc = desc->gdev->chip;
 	unsigned long dflags;
+	const char *label;
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpio_chip_hwgpio(desc);
@@ -2305,9 +2306,12 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 		if (desc->name)
 			strscpy(info->name, desc->name, sizeof(info->name));
 
-		if (gpiod_get_label(desc))
-			strscpy(info->consumer, gpiod_get_label(desc),
-				sizeof(info->consumer));
+		scoped_guard(srcu, &desc->srcu) {
+			label = gpiod_get_label(desc);
+			if (label)
+				strscpy(info->consumer, label,
+					sizeof(info->consumer));
+		}
 
 		dflags = READ_ONCE(desc->flags);
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 94e1a603cf8b..93b80f3e9fe2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -114,12 +114,26 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 	    !test_bit(FLAG_REQUESTED, &flags))
 		return "interrupt";
 
-	return test_bit(FLAG_REQUESTED, &flags) ? desc->label : NULL;
+	return test_bit(FLAG_REQUESTED, &flags) ?
+			rcu_dereference(desc->label) : NULL;
 }
 
-static inline void desc_set_label(struct gpio_desc *d, const char *label)
+static int desc_set_label(struct gpio_desc *desc, const char *label)
 {
-	d->label = label;
+	const char *new = NULL, *old;
+
+	if (label) {
+		/* FIXME: make this GFP_KERNEL once the spinlock is out. */
+		new = kstrdup_const(label, GFP_ATOMIC);
+		if (!new)
+			return -ENOMEM;
+	}
+
+	old = rcu_replace_pointer(desc->label, new, 1);
+	synchronize_srcu(&desc->srcu);
+	kfree_const(old);
+
+	return 0;
 }
 
 /**
@@ -2220,9 +2234,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
 	 */
 
-	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0) {
-		desc_set_label(desc, label ? : "?");
-	} else {
+	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags)) {
 		ret = -EBUSY;
 		goto out_free_unlock;
 	}
@@ -2250,6 +2262,13 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 		spin_lock_irqsave(&gpio_lock, flags);
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
+
+	ret = desc_set_label(desc, label ? : "?");
+	if (ret) {
+		clear_bit(FLAG_REQUESTED, &desc->flags);
+		return ret;
+	}
+
 	return 0;
 
 out_free_unlock:
@@ -2334,8 +2353,6 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 			gc->free(gc, gpio_chip_hwgpio(desc));
 			spin_lock_irqsave(&gpio_lock, flags);
 		}
-		kfree_const(desc->label);
-		desc_set_label(desc, NULL);
 		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
 		clear_bit(FLAG_REQUESTED, &desc->flags);
 		clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
@@ -2353,6 +2370,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 	}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	desc_set_label(desc, NULL);
 	gpiod_line_state_notify(desc, GPIOLINE_CHANGED_RELEASED);
 
 	return ret;
@@ -2400,6 +2418,8 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 	if (!test_bit(FLAG_REQUESTED, &desc->flags))
 		return NULL;
 
+	guard(srcu)(&desc->srcu);
+
 	/*
 	 * FIXME: Once we mark gpiod_direction_input/output() and
 	 * gpiod_get_direction() with might_sleep(), we'll be able to protect
@@ -3511,16 +3531,8 @@ EXPORT_SYMBOL_GPL(gpiod_cansleep);
 int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
 {
 	VALIDATE_DESC(desc);
-	if (name) {
-		name = kstrdup_const(name, GFP_KERNEL);
-		if (!name)
-			return -ENOMEM;
-	}
 
-	kfree_const(desc->label);
-	desc_set_label(desc, name);
-
-	return 0;
+	return desc_set_label(desc, name);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
 
@@ -4726,6 +4738,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 	int value;
 
 	for_each_gpio_desc(gc, desc) {
+		guard(srcu)(&desc->srcu);
 		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
 			gpiod_get_direction(desc);
 			is_out = test_bit(FLAG_IS_OUT, &desc->flags);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 6e14b629c48b..d2e73eea9e92 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -180,7 +180,7 @@ struct gpio_desc {
 #define FLAG_EVENT_CLOCK_HTE		19 /* GPIO CDEV reports hardware timestamps in events */
 
 	/* Connection label */
-	const char		*label;
+	const char __rcu	*label;
 	/* Name of the GPIO */
 	const char		*name;
 #ifdef CONFIG_OF_DYNAMIC
@@ -223,15 +223,29 @@ static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
 
 /* With descriptor prefix */
 
-#define gpiod_err(desc, fmt, ...)					       \
-	pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",  \
-		 ##__VA_ARGS__)
-#define gpiod_warn(desc, fmt, ...)					       \
-	pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?", \
-		 ##__VA_ARGS__)
-#define gpiod_dbg(desc, fmt, ...)					       \
-	pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",\
-		 ##__VA_ARGS__)
+#define gpiod_err(desc, fmt, ...) \
+do { \
+	scoped_guard(srcu, &desc->srcu) { \
+		pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
+		       gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
+	} \
+} while (0)
+
+#define gpiod_warn(desc, fmt, ...) \
+do { \
+	scoped_guard(srcu, &desc->srcu) { \
+		pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
+			gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
+	} \
+} while (0)
+
+#define gpiod_dbg(desc, fmt, ...) \
+do { \
+	scoped_guard(srcu, &desc->srcu) { \
+		pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
+			 gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
+	} \
+} while (0)
 
 /* With chip prefix */
 
-- 
2.40.1


