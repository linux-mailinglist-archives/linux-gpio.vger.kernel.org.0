Return-Path: <linux-gpio+bounces-2751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89A842563
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D985C28E624
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492906DD11;
	Tue, 30 Jan 2024 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H2bkYibW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB787691C
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618935; cv=none; b=dDeMptLHxJvF6sy6HpptLozhueoMaw+w18K1bDhwyaqgCM9J+M1j6+k6VC9aMyymDRfTgUMVkp5XU5uJIKUsF0lu6eqNI+s2qu9b4iDEedM2bR+FkMY+piOm6CwGhsGyVEBrTTw5OuDIgMy4PmArd513RzrWjprgwZDsPKy1tD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618935; c=relaxed/simple;
	bh=rpDac9gg6movVuL1e6sh06EenSTRMk7AFcaCXg+P2A8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OHgQSp3QQgnptZKcf6zUStHADbz9RbauHqbi8RmLyIm0T1/lMQ/1tqOAoBGHH0L3Mky9PeTB2ZIML4JN162nM1C9ibn+Lb7x1na67WD7OD1SebRCiMpPYshg72/n/lzlRHb/E0yOw1/MIwXTYavD4w1BzcMDrL6movXR2zHZP0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H2bkYibW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33ae2d80b70so1888980f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618930; x=1707223730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM21fAXHDQoD3/XsnlkXEmpL0zhUIy1jPwVUkTUkjn4=;
        b=H2bkYibWWX5CaswbL4vmwqsMr262ApMdV7kTsBgrTG52rXdvGtm0ZCV1WPsXzgsZ1S
         T/eHEenALKBt9bDOUIm0Bx/YdTIu7EkGJ3V+CE13HYHNDPJc6TdZapAbKXe+tIDTO5EL
         nD7zjKeby0rsFVuhD9tqQWicdsKqvVbrVqJ6A6DLJmzR3kJ+Ce9vIWOOmEPK9aCiwyxO
         X7DPXYDJeS+8m/zE81uQ9Mnm/2iCguSxjiRXwr/ag2t6J0Yy2wyoR7O89eiEGI5O6Wku
         JxBOls0WK7LHVfjv2VzBIE4vnAtqTZ9NQnjzV9cBrqnigf9m5V2MT5SZd2NrL6CxKiv6
         zpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618930; x=1707223730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lM21fAXHDQoD3/XsnlkXEmpL0zhUIy1jPwVUkTUkjn4=;
        b=xPIb/SdjI9qmLQjxQ5cShAGj1Jic+Cy2EycwgpAfITsOqLuHfF4cpK8Gbg9MFoDv0i
         KAQPlisvnQVWRnHkJXyDLYCDFjJM9ayhApAMe2Nax502GjNY4xM0ipzkjEd0rxq2Uc8i
         iPpokyC+7avPARs4zFL2hKidXqmaz4tWRjfYuheZgotk7PK7TW4UVnHjEc1wINe2jqzd
         RQX0tRhkBwuTWKlfzT2l+xqLK+d78FWDcpPh1QkM0WmfOURTaomcAlpYfUSubKLRBvRP
         HG4LlR2owMSMW+xvID8AhgwljBQkAH+lHM0RkCkqVW/6oiObK8QlGAugxeKZcD/sSxvE
         5BzA==
X-Gm-Message-State: AOJu0Yy+eKEXXrRnFjZYFdJPkL0LXT73R+vntxZba2PrRcypbTVbfB9D
	cfQbsuXUabfpddjs7iKxm8iyN9OyAYxZuoozd0Fhe8J4rghxVTgufJlczHNpeB8=
X-Google-Smtp-Source: AGHT+IHJkklHElRz9zZaMAQVBuiyldPe5m6d76wouXJfRiBOAVIK9zHCKIAYgSMf/z9fN1pO0/9Kbw==
X-Received: by 2002:a05:6000:1544:b0:33a:ed19:9f37 with SMTP id 4-20020a056000154400b0033aed199f37mr5186238wry.47.1706618930522;
        Tue, 30 Jan 2024 04:48:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:50 -0800 (PST)
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
Subject: [PATCH 12/22] gpio: sysfs: extend the critical section for unregistering sysfs devices
Date: Tue, 30 Jan 2024 13:48:18 +0100
Message-Id: <20240130124828.14678-13-brgl@bgdev.pl>
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

Checking the gdev->mockdev pointer for NULL must be part of the critical
section.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 1cc707685f87..5da316ea9cc7 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/init.h>
@@ -768,15 +769,15 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 	struct gpio_desc *desc;
 	struct gpio_chip *chip = gdev->chip;
 
-	if (!gdev->mockdev)
-		return;
+	scoped_guard(mutex, &sysfs_lock) {
+		if (!gdev->mockdev)
+			return;
 
-	device_unregister(gdev->mockdev);
+		device_unregister(gdev->mockdev);
 
-	/* prevent further gpiod exports */
-	mutex_lock(&sysfs_lock);
-	gdev->mockdev = NULL;
-	mutex_unlock(&sysfs_lock);
+		/* prevent further gpiod exports */
+		gdev->mockdev = NULL;
+	}
 
 	/* unregister gpiod class devices owned by sysfs */
 	for_each_gpio_desc_with_flag(chip, desc, FLAG_SYSFS) {
-- 
2.40.1


