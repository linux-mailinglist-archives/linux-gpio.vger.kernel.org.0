Return-Path: <linux-gpio+bounces-2950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1CB8496A1
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1D891C243C9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C71A12E51;
	Mon,  5 Feb 2024 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qEbT5HvP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6ED14280
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125678; cv=none; b=Id+bbav5XJVTO2o4UoIFnmCQClHldMwPZBRz3E/WI9KZbpAhAspMLG93mYDIoxHUXEjfrBkzA2VpSIF54s239px+f8fZvzsWG+SBMPBLlaES3rwGAhG8EyAmrOdEfUK7V8kKDv9UX1g3ftJhi1Pz62reTtFHB0OiqX9oDs+lDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125678; c=relaxed/simple;
	bh=AZJTe9uH/HRjd3Eb1E9LViLgyCA0fSyifMWHq+z8I84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=chLC4wlh/s1Mb4YZQkIFP8v5yDHCqJ0DHPfhFktBpAp2hje02KqkheMX+yaEgQvR3ebWgnH+p6dOBKSDzIs7rsUGp60hPILdXBZnqnGXo6pxp1jPaz0X5a5jxU7hSiQuKGqyxvyaDA+mdIvQXL+cWMjea28HRoW81IM4+r0v0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qEbT5HvP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40fdcae97e7so3775495e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125674; x=1707730474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmzSsuQlbDZ+t30agBye8l5Gy5EgwDATrqd1ITBls6s=;
        b=qEbT5HvPzWhg5xIcD7DCDzBGSPngY6uCPgEd+nYMGrdq0pKUXT9/pqW9i44SBawFWx
         8eafhZuAjWOE6N9UX//xPvuBbSIpqFClWzp1X1iLf/lt5KURb/tQJ5UFlcjSxERMsjKe
         b+fxnMDbumy93CMPaaQYOl6yUwRPdF8I8RcIKzeKMdWXvEMzyBfDWgGkmHwjNCcf4zRa
         u8Vv3yftoPu9LQ+NcpNMXywN6dhook8J3RY44ycirvNfNx1f/JGpHokcToV90w1rLqKz
         MJLYYDYTey4w6hoHh8dgaBwgJj0JpKbpVfjeMrOmMe1Gg+r3jQzzbsUgMkH7D+aGzNl8
         QcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125674; x=1707730474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmzSsuQlbDZ+t30agBye8l5Gy5EgwDATrqd1ITBls6s=;
        b=oUbE5pjP7gl4BTvDM9iCP/f6/YlUQmtNAlCXsrG1TNKOk4OM7M48Yw5WimFRWAQ55I
         HATVm/yw0kUvT6DyUvyeX9iEMtC5ExQAVcZ5TmjYg0nlb52+JA1Fewcsj+LbVk8V+FOr
         TygXn4PCdM61qjMVtgKbKOyTDAgWmOYaFwukIIrGLyitogbztsGbW3DgFvPl/lJKTOY2
         5aOk74h00uCuGabiXGi8aENG6KK//YXkO/xD05YkLJ4v1dhKZ9uqQgsDo9tTaHqSOLIw
         R0DeTeO8kMhep+MmlA7ed5qjibXzG8oIAf0G2DzHelNdBNfEFYUxNjdX5gqVwq3zi+9r
         heXw==
X-Gm-Message-State: AOJu0YxyZ9p7JiB37VZ3eoxBAQgwlg42lTbme9b7w6QJ0oFpPIwJAZRh
	MuFB1huwmCe1kTD9U/eu7rojW/c12Iz3fjWU6eiLMurgRjbuvI+7rYIWtI3fhDw=
X-Google-Smtp-Source: AGHT+IHDaj3kNqPSeHGzX7jhB1piE+yGHsR31u8qOcgsycwVXq6Gkc70ZJK4doI9mG88u18meGSCjg==
X-Received: by 2002:a05:600c:19c6:b0:40f:b691:d3c1 with SMTP id u6-20020a05600c19c600b0040fb691d3c1mr3833847wmq.30.1707125673807;
        Mon, 05 Feb 2024 01:34:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWaFE4TMMOkTAIjFTWDd+DVJBGl1fKNmAfr2NjMOlktEWI9BDzUbkqEPClKAxZ/xbBeZOLOwD+/OMaZaQqiAxcC8/w8nobZZDEMwGISykisMLvPH2IwXWyp/asBCGeM2shxYLgPFHw2bu8yavrW7xGrgGd+MAaJsQb040xMAnnQqSZm9HLquiyFmm3J1Uskus9e6gWjs3L9kHuEqhggKQUr8D9lWGB70EaaTOGUxuxZl+vRC75dFsFbHDpRQf68Cj+ytznMV8H7U5zrXz1QLUWdjhiWEjmuMJbzpt/SfLujnsM3U/7y9ea5cZpHfP3Ghr38pfKPbVkKSA1Y1c+C8WjcSz9XRa14xA==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:33 -0800 (PST)
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
Subject: [PATCH v2 09/23] gpio: remove gpio_lock
Date: Mon,  5 Feb 2024 10:34:04 +0100
Message-Id: <20240205093418.39755-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205093418.39755-1-brgl@bgdev.pl>
References: <20240205093418.39755-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The "multi-function" gpio_lock is pretty much useless with how it's used
in GPIOLIB currently. Because many GPIO API calls can be called from all
contexts but may also call into sleeping driver callbacks, there are
many places with utterly broken workarounds like yielding the lock to
call a possibly sleeping function and then re-acquiring it again without
taking into account that the protected state may have changed.

It was also used to protect several unrelated things: like individual
descriptors AND the GPIO device list. We now serialize access to these
two with SRCU and so can finally remove the spinlock.

There is of course the question of consistency of lockless access to
GPIO descriptors. Because we only support exclusive access to GPIOs
(officially anyway, I'm looking at you broken
GPIOD_FLAGS_BIT_NONEXCLUSIVE bit...) and the API contract with providers
does not guarantee serialization, it's enough to ensure we cannot
accidentally dereference an invalid pointer and that the state we present
to both users and providers remains consistent. To achieve that: read the
flags field atomically except for a few special cases. Read their current
value before executing callback code and use this value for any subsequent
logic. Modifying the flags depends on the particular use-case and can
differ. For instance: when requesting a GPIO, we need to set the
REQUESTED bit immediately so that the next user trying to request the
same line sees -EBUSY.

While at it: the allocations that used GFP_ATOMIC until this point can
now switch to GFP_KERNEL.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c  |  18 +++---
 drivers/gpio/gpiolib-sysfs.c |  17 ++----
 drivers/gpio/gpiolib.c       | 106 +++++++++++------------------------
 drivers/gpio/gpiolib.h       |   2 -
 4 files changed, 46 insertions(+), 97 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 75f4912339a6..3588aaf90e45 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2302,18 +2302,16 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	memset(info, 0, sizeof(*info));
 	info->offset = gpio_chip_hwgpio(desc);
 
-	scoped_guard(spinlock_irqsave, &gpio_lock) {
-		if (desc->name)
-			strscpy(info->name, desc->name, sizeof(info->name));
+	if (desc->name)
+		strscpy(info->name, desc->name, sizeof(info->name));
 
-		scoped_guard(srcu, &desc->srcu) {
-			label = gpiod_get_label(desc);
-			if (label)
-				strscpy(info->consumer, label,
-					sizeof(info->consumer));
-		}
+	dflags = READ_ONCE(desc->flags);
 
-		dflags = READ_ONCE(desc->flags);
+	scoped_guard(srcu, &desc->srcu) {
+		label = gpiod_get_label(desc);
+		if (label && test_bit(FLAG_REQUESTED, &dflags))
+			strscpy(info->consumer, label,
+				sizeof(info->consumer));
 	}
 
 	/*
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 3c3b8559cff5..1cc707685f87 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -563,7 +563,6 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	struct gpio_device *gdev;
 	struct gpiod_data *data;
 	struct gpio_chip *chip;
-	unsigned long flags;
 	struct device *dev;
 	int status, offset;
 
@@ -578,6 +577,9 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		return -EINVAL;
 	}
 
+	if (!test_and_set_bit(FLAG_EXPORT, &desc->flags))
+		return -EPERM;
+
 	gdev = desc->gdev;
 	chip = gdev->chip;
 
@@ -589,18 +591,11 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto err_unlock;
 	}
 
-	spin_lock_irqsave(&gpio_lock, flags);
-	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
-	     test_bit(FLAG_EXPORT, &desc->flags)) {
-		spin_unlock_irqrestore(&gpio_lock, flags);
-		gpiod_dbg(desc, "%s: unavailable (requested=%d, exported=%d)\n",
-				__func__,
-				test_bit(FLAG_REQUESTED, &desc->flags),
-				test_bit(FLAG_EXPORT, &desc->flags));
+	if (!test_bit(FLAG_REQUESTED, &desc->flags)) {
+		gpiod_dbg(desc, "%s: unavailable (not requested)\n", __func__);
 		status = -EPERM;
 		goto err_unlock;
 	}
-	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data) {
@@ -628,7 +623,6 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto err_free_data;
 	}
 
-	set_bit(FLAG_EXPORT, &desc->flags);
 	mutex_unlock(&sysfs_lock);
 	return 0;
 
@@ -636,6 +630,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	kfree(data);
 err_unlock:
 	mutex_unlock(&sysfs_lock);
+	clear_bit(FLAG_EXPORT, &desc->flags);
 	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
 	return status;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6cfb75ee739d..5ed5b71590ab 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -76,12 +76,6 @@ static struct bus_type gpio_bus_type = {
  */
 #define FASTPATH_NGPIO CONFIG_GPIOLIB_FASTPATH_LIMIT
 
-/* gpio_lock prevents conflicts during gpio_desc[] table updates.
- * While any GPIO is requested, its gpio_chip is not removable;
- * each GPIO's "requested" flag serves as a lock and refcount.
- */
-DEFINE_SPINLOCK(gpio_lock);
-
 static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 
@@ -123,8 +117,7 @@ static int desc_set_label(struct gpio_desc *desc, const char *label)
 	const char *new = NULL, *old;
 
 	if (label) {
-		/* FIXME: make this GFP_KERNEL once the spinlock is out. */
-		new = kstrdup_const(label, GFP_ATOMIC);
+		new = kstrdup_const(label, GFP_KERNEL);
 		if (!new)
 			return -ENOMEM;
 	}
@@ -1088,7 +1081,6 @@ EXPORT_SYMBOL_GPL(gpiochip_add_data_with_key);
 void gpiochip_remove(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
-	unsigned long flags;
 	unsigned int i;
 
 	down_write(&gdev->sem);
@@ -1109,12 +1101,10 @@ void gpiochip_remove(struct gpio_chip *gc)
 	 */
 	gpiochip_set_data(gc, NULL);
 
-	spin_lock_irqsave(&gpio_lock, flags);
 	for (i = 0; i < gdev->ngpio; i++) {
 		if (test_bit(FLAG_REQUESTED, &gdev->descs[i].flags))
 			break;
 	}
-	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	if (i != gdev->ngpio)
 		dev_crit(&gdev->dev,
@@ -2221,62 +2211,43 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
 static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
-	unsigned long flags;
 	unsigned int offset;
 	int ret;
 
+	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
+		return -EBUSY;
+
 	if (label) {
 		label = kstrdup_const(label, GFP_KERNEL);
 		if (!label)
 			return -ENOMEM;
 	}
 
-	spin_lock_irqsave(&gpio_lock, flags);
-
 	/* NOTE:  gpio_request() can be called in early boot,
 	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
 	 */
 
-	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags)) {
-		ret = -EBUSY;
-		goto out_free_unlock;
-	}
-
 	if (gc->request) {
-		/* gc->request may sleep */
-		spin_unlock_irqrestore(&gpio_lock, flags);
 		offset = gpio_chip_hwgpio(desc);
 		if (gpiochip_line_is_valid(gc, offset))
 			ret = gc->request(gc, offset);
 		else
 			ret = -EINVAL;
-		spin_lock_irqsave(&gpio_lock, flags);
+		if (ret)
+			goto out_clear_bit;
+	}
 
-		if (ret) {
-			desc_set_label(desc, NULL);
-			clear_bit(FLAG_REQUESTED, &desc->flags);
-			goto out_free_unlock;
-		}
-	}
-	if (gc->get_direction) {
-		/* gc->get_direction may sleep */
-		spin_unlock_irqrestore(&gpio_lock, flags);
+	if (gc->get_direction)
 		gpiod_get_direction(desc);
-		spin_lock_irqsave(&gpio_lock, flags);
-	}
-	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	ret = desc_set_label(desc, label ? : "?");
-	if (ret) {
-		clear_bit(FLAG_REQUESTED, &desc->flags);
-		return ret;
-	}
+	if (ret)
+		goto out_clear_bit;
 
 	return 0;
 
-out_free_unlock:
-	spin_unlock_irqrestore(&gpio_lock, flags);
-	kfree_const(label);
+out_clear_bit:
+	clear_bit(FLAG_REQUESTED, &desc->flags);
 	return ret;
 }
 
@@ -2346,35 +2317,32 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 
 	might_sleep();
 
-	spin_lock_irqsave(&gpio_lock, flags);
-
 	gc = desc->gdev->chip;
-	if (gc && test_bit(FLAG_REQUESTED, &desc->flags)) {
-		if (gc->free) {
-			spin_unlock_irqrestore(&gpio_lock, flags);
-			might_sleep_if(gc->can_sleep);
+	flags = READ_ONCE(desc->flags);
+
+	if (gc && test_bit(FLAG_REQUESTED, &flags)) {
+		if (gc->free)
 			gc->free(gc, gpio_chip_hwgpio(desc));
-			spin_lock_irqsave(&gpio_lock, flags);
-		}
-		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
-		clear_bit(FLAG_REQUESTED, &desc->flags);
-		clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
-		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
-		clear_bit(FLAG_PULL_UP, &desc->flags);
-		clear_bit(FLAG_PULL_DOWN, &desc->flags);
-		clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
-		clear_bit(FLAG_EDGE_RISING, &desc->flags);
-		clear_bit(FLAG_EDGE_FALLING, &desc->flags);
-		clear_bit(FLAG_IS_HOGGED, &desc->flags);
+
+		clear_bit(FLAG_ACTIVE_LOW, &flags);
+		clear_bit(FLAG_REQUESTED, &flags);
+		clear_bit(FLAG_OPEN_DRAIN, &flags);
+		clear_bit(FLAG_OPEN_SOURCE, &flags);
+		clear_bit(FLAG_PULL_UP, &flags);
+		clear_bit(FLAG_PULL_DOWN, &flags);
+		clear_bit(FLAG_BIAS_DISABLE, &flags);
+		clear_bit(FLAG_EDGE_RISING, &flags);
+		clear_bit(FLAG_EDGE_FALLING, &flags);
+		clear_bit(FLAG_IS_HOGGED, &flags);
 #ifdef CONFIG_OF_DYNAMIC
 		WRITE_ONCE(desc->hog, NULL);
 #endif
 		ret = true;
-	}
+		desc_set_label(desc, NULL);
+		WRITE_ONCE(desc->flags, flags);
 
-	spin_unlock_irqrestore(&gpio_lock, flags);
-	desc_set_label(desc, NULL);
-	gpiod_line_state_notify(desc, GPIOLINE_CHANGED_RELEASED);
+		gpiod_line_state_notify(desc, GPIOLINE_CHANGED_RELEASED);
+	}
 
 	return ret;
 }
@@ -2416,22 +2384,12 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 	if (IS_ERR(desc))
 		return NULL;
 
-	guard(spinlock_irqsave)(&gpio_lock);
-
 	if (!test_bit(FLAG_REQUESTED, &desc->flags))
 		return NULL;
 
 	guard(srcu)(&desc->srcu);
 
-	/*
-	 * FIXME: Once we mark gpiod_direction_input/output() and
-	 * gpiod_get_direction() with might_sleep(), we'll be able to protect
-	 * the GPIO descriptors with mutex (while value setting operations will
-	 * become lockless).
-	 *
-	 * Until this happens, this allocation needs to be atomic.
-	 */
-	label = kstrdup(gpiod_get_label(desc), GFP_ATOMIC);
+	label = kstrdup(gpiod_get_label(desc), GFP_KERNEL);
 	if (!label)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2bf3f9e13ae4..9b7afe87f1bd 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -135,8 +135,6 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
-extern spinlock_t gpio_lock;
-
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
 
 /**
-- 
2.40.1


