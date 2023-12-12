Return-Path: <linux-gpio+bounces-1277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B83A80E3EE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 06:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C9D1F21F78
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 05:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD9714F9B;
	Tue, 12 Dec 2023 05:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li0QMl4K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E97EFD;
	Mon, 11 Dec 2023 21:43:42 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5e1a2253045so7512287b3.2;
        Mon, 11 Dec 2023 21:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702359821; x=1702964621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FHTk9soipYpHLOiG237jcWWN9G9Yj9KlCtcjJBsP8g=;
        b=Li0QMl4KLsU2cRm+n1o770GuzudtsX8Cba2xfgUkxCt5CcDlhcZ9DT4dU+fBW2Mg/j
         GDVFFk8fF04Zek9LeQQMNW8POWiV5fvLD2PAVeYabEvGaubUmGM5uDDjv8JDrQB+sFo3
         zDe8yesplmy3fxjQ7NP6mGHPq8DjfK+j5VGkBj55TtvCKqlzTBN4nIhUsNLvbX36ByJf
         T9N4VMvBDvB9LtGqbVWd7g8+AG2TuEIcEdqZ4OpcruEs4aA/Qg1D4YjoATbPMHvNfmyr
         xbMv56RWAxu7cx7RfDIskiyUWmIAPGdwHbrEhDAGConu2ETbl4LOdCko/Tl6DPgkA5D9
         ZLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359821; x=1702964621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FHTk9soipYpHLOiG237jcWWN9G9Yj9KlCtcjJBsP8g=;
        b=PST0Qf+6K46ze+bkNpqBNlSWzSSKf74GSiUGgKYeiE64rXsupbl4os9+CDLHrFvUsP
         SDTj+oXZoed4/DnF5ediOyoZX+cLxNzxTBLCQmsCiya61XZ9zjlmhzsTcjbVXR7+eFUf
         sgiGjUwtNuzTUg1Q4ynW6XAD3hBeXrcOclXnBe1p9IdXXlVJVd3BxVHoX28W9GG9iDk/
         9W8GzWaVJm46oSR+IrciG0BOV+Nuna2DH9pCONQ8O7X+aGzR/9m3VXM2qE67j00MzEZY
         webyN3uIDc/acpxiFfCHqEHw52x/Fjtmq63hpJ5vbGEfc7OqaQAiFRtN5brmdQfmqQDl
         0kvg==
X-Gm-Message-State: AOJu0Yxpd2Xul/VL0w1qTcquiuGHcbLWtzm0G8P2ktk0tsSkT23Hgh2x
	4VuH3kcQarOTi+BsjjH0VhmrhAlpTHM=
X-Google-Smtp-Source: AGHT+IG2/p5auImG5NcyAnNo9cRq7w0BTwMx6CO/66wQIChs8BqxjYDdVY3+wcntekboskZ2K3kVeQ==
X-Received: by 2002:a0d:eb4a:0:b0:5de:8c10:e5a9 with SMTP id u71-20020a0deb4a000000b005de8c10e5a9mr4446367ywe.49.1702359821337;
        Mon, 11 Dec 2023 21:43:41 -0800 (PST)
Received: from rigel.home.arpa (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e5cd00b001d0be32b0basm7591836plf.217.2023.12.11.21.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:43:41 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	andy@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 3/4] gpiolib: cdev: reduce locking in gpio_desc_to_lineinfo()
Date: Tue, 12 Dec 2023 13:42:52 +0800
Message-Id: <20231212054253.50094-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212054253.50094-1-warthog618@gmail.com>
References: <20231212054253.50094-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the time holding the gpio_lock by snapshotting the desc flags,
rather than testing them individually while holding the lock.

Accept that the calculation of the used field is inherently racy, and
only check the availabilty of the line from pinctrl if other checks
pass, so avoiding the check for lines that are otherwise in use.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 66 ++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 7999c1a72cfa..37f2c9acc770 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2398,22 +2398,12 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 				  struct gpio_v2_line_info *info)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
-	bool ok_for_pinctrl;
-	unsigned long flags;
+	unsigned long iflags, dflags;
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpio_chip_hwgpio(desc);
 
-	/*
-	 * This function takes a mutex so we must check this before taking
-	 * the spinlock.
-	 *
-	 * FIXME: find a non-racy way to retrieve this information. Maybe a
-	 * lock common to both frameworks?
-	 */
-	ok_for_pinctrl = pinctrl_gpio_can_use_line(gc, info->offset);
-
-	spin_lock_irqsave(&gpio_lock, flags);
+	spin_lock_irqsave(&gpio_lock, iflags);
 
 	if (desc->name)
 		strscpy(info->name, desc->name, sizeof(info->name));
@@ -2421,51 +2411,59 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (desc->label)
 		strscpy(info->consumer, desc->label, sizeof(info->consumer));
 
+	dflags = READ_ONCE(desc->flags);
+
+	spin_unlock_irqrestore(&gpio_lock, iflags);
+
 	/*
-	 * Userspace only need to know that the kernel is using this GPIO so
-	 * it can't use it.
+	 * Userspace only need know that the kernel is using this GPIO so it
+	 * can't use it.
+	 * The calculation of the used flag is slightly racy, as it may read
+	 * desc, gc and pinctrl state without a lock covering all three at
+	 * once.  Worst case if the line is in transition and the calculation
+	 * is incorrect then it looks to the user like they performed the read
+	 * on the wrong side of the transition - but that can always happen.
+	 * The definitive test that a line is available to userspace is to
+	 * request it.
 	 */
-	info->flags = 0;
-	if (test_bit(FLAG_REQUESTED, &desc->flags) ||
-	    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
-	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
-	    test_bit(FLAG_EXPORT, &desc->flags) ||
-	    test_bit(FLAG_SYSFS, &desc->flags) ||
+	if (test_bit(FLAG_REQUESTED, &dflags) ||
+	    test_bit(FLAG_IS_HOGGED, &dflags) ||
+	    test_bit(FLAG_USED_AS_IRQ, &dflags) ||
+	    test_bit(FLAG_EXPORT, &dflags) ||
+	    test_bit(FLAG_SYSFS, &dflags) ||
 	    !gpiochip_line_is_valid(gc, info->offset) ||
-	    !ok_for_pinctrl)
+	    !pinctrl_gpio_can_use_line(gc, info->offset))
 		info->flags |= GPIO_V2_LINE_FLAG_USED;
 
-	if (test_bit(FLAG_IS_OUT, &desc->flags))
+	if (test_bit(FLAG_IS_OUT, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
 	else
 		info->flags |= GPIO_V2_LINE_FLAG_INPUT;
 
-	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+	if (test_bit(FLAG_ACTIVE_LOW, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
 
-	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
+	if (test_bit(FLAG_OPEN_DRAIN, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
-	if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
+	if (test_bit(FLAG_OPEN_SOURCE, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
 
-	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
+	if (test_bit(FLAG_BIAS_DISABLE, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
-	if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+	if (test_bit(FLAG_PULL_DOWN, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
-	if (test_bit(FLAG_PULL_UP, &desc->flags))
+	if (test_bit(FLAG_PULL_UP, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
 
-	if (test_bit(FLAG_EDGE_RISING, &desc->flags))
+	if (test_bit(FLAG_EDGE_RISING, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
-	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
+	if (test_bit(FLAG_EDGE_FALLING, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 
-	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &desc->flags))
+	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
-	else if (test_bit(FLAG_EVENT_CLOCK_HTE, &desc->flags))
+	else if (test_bit(FLAG_EVENT_CLOCK_HTE, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE;
-
-	spin_unlock_irqrestore(&gpio_lock, flags);
 }
 
 struct gpio_chardev_data {
-- 
2.39.2


