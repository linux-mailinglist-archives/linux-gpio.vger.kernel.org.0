Return-Path: <linux-gpio+bounces-23806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420BCB1195C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 09:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6935A0A1F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 07:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB6C218589;
	Fri, 25 Jul 2025 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ovdWbjDI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25671D5CEA
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 07:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753429617; cv=none; b=ZpID+ThugfAc7ZTn+/27DFSGrEB7BZ10s11HB73k4sEPQ24O9I4XG3C+WrNHlTwSDUEeliDsgI82vm9a9tDGOQGG4/IDlhET587ZKY4kskeOduzIfbvqV4zdn66kr9Uyf6Xm9wc6sAHxlfcJYE6MwQdGSvJMoaondjhN/LCRBX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753429617; c=relaxed/simple;
	bh=34DD8H2+Z6KlSIaicPMNy3O9pkf5PxLSFzAJOpGsKbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwDTmu1+EU4zX1nkgdNc1EX73sxB69vVjhXbSU+qaHxKC+eWATVrMiDMHUTeQVpWWrer0sctLtzIpTKsJfhQQ08ylysn/SAjSvw7s0yroK37vliiX0xwgWApXzyYfFZffbo8tHG5LfBREOXGoPauNXBeDAQDUEG6Y9ulMSnln2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ovdWbjDI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-456108bf94bso11464305e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 00:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753429614; x=1754034414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=836wKJCS1zkb/cl0er8y0E0+FHJwc8OMFKAP6VyLp+k=;
        b=ovdWbjDINCzIoL9aG1ePJ5c6/+SjnPdf8Kshag/L5jkNbj3/09KX4yhNDzSX7GgAFU
         S3mrn6+cPSc98urycADOxnV69vx3WG1wVPuCC141B6YlXivjVE7UYArL++0XkhLuBUry
         slW3IvNJttE0+L4LR6TL70Y7lYS9PrtA3eOSpWkte9n+pHf+5J1jsTDBMBwCdXJJyc1Z
         rREcgnMz12fw+seDpayyhSizplyzMOi+VvTittMBdnrH00PtAgFNDtYDIrqdYqQ/CDK4
         FR5k8i9xjGyBo36AYVEhcyGGqNvSj8f1EG8mDHSFooMXa0ZPYB9Kh2UnaTsA/jWIKt36
         97OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753429614; x=1754034414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=836wKJCS1zkb/cl0er8y0E0+FHJwc8OMFKAP6VyLp+k=;
        b=ggHymWvjvWqUL5MerjbrWBYY9s/IfIJX6aLR/r05AqkbAr4f/2p6y4lvM/FDjxVfp9
         uSOq6lwnUq9X+yPpeuYr7wpziwd880KzgbeaQ1oos7WC5nimmId0EliaIFMsU0B3mnop
         hqDOjmory8bCQ4NXqcs+QuOnr9UVb/fEDK4Huo0Psr5i8knySLPD7bKegT0lwkuGcm7P
         SuUl6hbFH+x6woqnTVQ6hoU3AXIKrXZQZC/okmpAVBsokKN7MrkK0+hriPTGIL0rPn2g
         l/lWa3nsAyqXcR8tfXkymqhzyhl2hsN8F4dUCK8hPLZInfqOjZqxYa4wSJlORiWeI0Cx
         dCbg==
X-Gm-Message-State: AOJu0Yx9Zn7F2rJFY0mU21VxGVpw5dOSKzplI3TziAsghW4/wwwCDUtd
	qNE9D9Xs2gUJOg8fJLCf5gL+IZWW1LDWS6MnXwy1+YpgO10ZQ89dlis4GaxAF0yq/ug=
X-Gm-Gg: ASbGncv82d6DJcwtPnyU68255BJhDxaR6e5tGY6BKmQ1La8gh+9N76rWaEq6QXVEpwZ
	IhnVTt+dV6kFiVOfU0kcXQIbXnNo2fzYuyTPE/LYnbv8+wJOmOQYPr1h214YtMf2yRd7XPDl74+
	zYXOyuOIA6B6j6dBTSFJRcs4w9+hKKh2482cY/yZb0Pha6gGlCA+v7w6ZI2rSGvzX/tUOLwTPol
	SIo/xaFJTQjCjvodZl6EH9ZZemgyOok5EDpr7XbcFOzG3EJ7v4+5g+CLVaf+ozjLywKcRb6qhnq
	TYebr4SwxDkj5EWEOFwQx3OcsS91ygcSkbxPlDoQbMuOHrKUXAPAMHSyHotDsrbYZq3OXs637yc
	JVRi/rGwUBfvb/yGwhMaht+YZ1snlB1zFHQ==
X-Google-Smtp-Source: AGHT+IFmX2Q2h8loW9vaQcV9TVyMRQYZUnDzAWrlOvz28hhJWNeZiXzEXKGA8gZBkEHjSlAi/xPQ1Q==
X-Received: by 2002:a05:600c:64c7:b0:456:24db:2efb with SMTP id 5b1f17b1804b1-4587631e23dmr7043865e9.15.1753429614087;
        Fri, 25 Jul 2025 00:46:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3c3c:6b37:9b23:6049])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc60595sm4313345f8f.4.2025.07.25.00.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 00:46:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: remove legacy GPIO line value setter callbacks
Date: Fri, 25 Jul 2025 09:46:50 +0200
Message-ID: <20250725074651.14002-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With no more users of the legacy GPIO line value setters - .set() and
.set_multiple() - we can now remove them from the kernel.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Note that this patch may trigger build bot error reports as it's not
valid until all GPIO drivers are converted upstream treewide.I intend to
wait until all relevant trees are upstream and then send this patch on
top during the upcoming merge window.

I have a second patch[1] that I will probably send directly to Torvalds
as it's almost 4000 lines of diff. It renames the callbacks back to their
original names.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?h=gpio/devel&id=e27a47cfa1fdbfa754664ae3dbac450008831fa0

 drivers/gpio/gpiolib.c      | 27 ++++++---------------------
 include/linux/gpio/driver.h |  7 -------
 2 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a93d2a9355e2..9ac4c23d656a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1037,11 +1037,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	int base = 0;
 	int ret;
 
-	/* Only allow one set() and one set_multiple(). */
-	if ((gc->set && gc->set_rv) ||
-	    (gc->set_multiple && gc->set_multiple_rv))
-		return -EINVAL;
-
 	/*
 	 * First: allocate and populate the internal stat container, and
 	 * set up the struct device.
@@ -2891,19 +2886,14 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (WARN_ON(unlikely(!gc->set && !gc->set_rv)))
+	if (WARN_ON(unlikely(!gc->set_rv)))
 		return -EOPNOTSUPP;
 
-	if (gc->set_rv) {
-		ret = gc->set_rv(gc, offset, value);
-		if (ret > 0)
-			ret = -EBADE;
+	ret = gc->set_rv(gc, offset, value);
+	if (ret > 0)
+		ret = -EBADE;
 
-		return ret;
-	}
-
-	gc->set(gc, offset, value);
-	return 0;
+	return ret;
 }
 
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
@@ -2919,7 +2909,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	 * output-only, but if there is then not even a .set() operation it
 	 * is pretty tricky to drive the output line.
 	 */
-	if (!guard.gc->set && !guard.gc->set_rv && !guard.gc->direction_output) {
+	if (!guard.gc->set_rv && !guard.gc->direction_output) {
 		gpiod_warn(desc,
 			   "%s: missing set() and direction_output() operations\n",
 			   __func__);
@@ -3673,11 +3663,6 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 		return ret;
 	}
 
-	if (gc->set_multiple) {
-		gc->set_multiple(gc, mask, bits);
-		return 0;
-	}
-
 	/* set outputs if the corresponding mask bit is set */
 	for_each_set_bit(i, mask, gc->ngpio) {
 		ret = gpiochip_set(gc, i, test_bit(i, bits));
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4b984e8f8fcd..90567dde7d8e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -347,8 +347,6 @@ struct gpio_irq_chip {
  * @get: returns value for signal "offset", 0=low, 1=high, or negative error
  * @get_multiple: reads values for multiple signals defined by "mask" and
  *	stores them in "bits", returns 0 on success or negative error
- * @set: **DEPRECATED** - please use set_rv() instead
- * @set_multiple: **DEPRECATED** - please use set_multiple_rv() instead
  * @set_rv: assigns output value for signal "offset", returns 0 on success or
  *          negative error value
  * @set_multiple_rv: assigns output values for multiple signals defined by
@@ -445,11 +443,6 @@ struct gpio_chip {
 	int			(*get_multiple)(struct gpio_chip *gc,
 						unsigned long *mask,
 						unsigned long *bits);
-	void			(*set)(struct gpio_chip *gc,
-						unsigned int offset, int value);
-	void			(*set_multiple)(struct gpio_chip *gc,
-						unsigned long *mask,
-						unsigned long *bits);
 	int			(*set_rv)(struct gpio_chip *gc,
 					  unsigned int offset,
 					  int value);
-- 
2.48.1


