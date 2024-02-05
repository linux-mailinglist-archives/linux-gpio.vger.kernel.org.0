Return-Path: <linux-gpio+bounces-2953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC48496A5
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38BD51C24737
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546E017591;
	Mon,  5 Feb 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Wv111LTZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B2171A9
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125680; cv=none; b=SxLrv+Hm/78DMj96bMYVvQ3Zxurn/nwcqBoacfD5V9R6E1q2hQwW038A92VJOb+oF65reCca0W/EH7HLfYpfwHvjMxlYRS6FMXt9ghOjvoTIfagvmut81qg6zkSz7dQHHup+ItCxrnuVp2aItZDQ6kUEjFQ4SZYBtT0Kcn1stpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125680; c=relaxed/simple;
	bh=6pZf3MPfcP7U/qzAucrcxQHtn245jLEQDsd8yxAaDXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vpkw3thWjpskifRHhya5uvFEuypXnjsH+H6EYBWSbi9wIQ59VkMbqvO4i+L4LKCphNaLSIJ5sD798uN90NCfLfWIxd5UAlfA4DEQA+oscis52zIAxqFhiUdEhzKhDNZu54ZBdZqtJtOsQRPmDAPg/qP1/Oc300F8f2foZ8KPlxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Wv111LTZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40fdc500db5so3727085e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125676; x=1707730476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPWICPIbUQqhQWXK/aPucJT3q02Uu3yz0IoZJm+ImZ4=;
        b=Wv111LTZxj8WUrUEuKtOGY7+yl5fqYo+8RKnHXmCJAphqtZbowkZHWQ/rB+aSqq29s
         QCLOYrGNPsnWDpdpEo7rVvKWPc4ROlrZVrdoQ1Ayo/JHorbX4YHau+YDZtv5aMcsAAu+
         ofD4xkCP7G8qFUaKE+gJhrUBiDg8rH2lWcZbi3tVP16yn1pIRFeBdi7Zo9MelAxmb2Y9
         rJSYX4pev8T5jtVycnl2HKPgoeIJzF6oe1t+xDTKpb31Jcf9xCyPcUclQTzxK1DTVvyM
         x0iSu+hKjYSmQj1DXh9fz7c7cfKoslZmumUjmhGU+6m7SM6T6T07YYovyEfaZ6vXd9tP
         CqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125676; x=1707730476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPWICPIbUQqhQWXK/aPucJT3q02Uu3yz0IoZJm+ImZ4=;
        b=TJhynL8B77s+pOG01ZI+2xrWagOTsWB4sf/GK9/zWsDpL/A7xDhHDc0oS3+oTIoIQe
         13r4PkAbWFId9xinB21ykYzC2SL3WAUnv9tayqGzudf7kVeGYlTcUVmjxM0UivKVnCI4
         Z4/5uVtyZ5K7LVI2fekOd4Ni1MXSkAsvRu5fUk+5YNgCiSTgKIx+cr48nHlmDQpjCe5Y
         wrTwmYXsq1JFNLp0Wc/q8I0s2e3DcYOHHNvUvbDXQ4OElvRyiAaZHF3OdovhAkyPPqHZ
         eFqldAVXdo44yuAMKpHppkAyH1ySzS9zpd9i8Iwfl1i3vNLC35+JpEpDrvzxQeQRLtgz
         JGmg==
X-Gm-Message-State: AOJu0YwBC3ICJ80ACJxdgljVViG4lIj85JAf6+xuxpCRGD1wpF7oLtsJ
	SHVVqnj9kzIGia7nwPWcnxgzks9oWI/VAaLg8mG+HcgQv9VY847qKopvmV0rrkk=
X-Google-Smtp-Source: AGHT+IG21q8aYCNLml1cXS2JVIuYakcxkQAkcMiZABjqWfdpPL7byMFcdGrefOCQfYZl8ybztm6cMg==
X-Received: by 2002:a05:600c:5191:b0:40e:60c3:c327 with SMTP id fa17-20020a05600c519100b0040e60c3c327mr3910240wmb.1.1707125676576;
        Mon, 05 Feb 2024 01:34:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUU/8yo/GZ+OF/G9T3pL+XmpQ6Byf0DyWVqn2QJEbCSns32/4tJB8SUprsV9AxBNmx3gG8oW13Wux0CylhKHd+TQbXiCadEdaXmUNbKIUZOOU7cZfDMXGjArmp/8bw58Pd9nBhV+X8b/WFw9qRiCgC92K8BBZH8t/7DHrvC3Q/K/QaCIlYwY6mzCXWT4peHngvkkVfXI6rzKLf65ONr91uKuWmOoMRre5LsmqAI3PxHVakQnNWGRYLjqe1y/y0QXfHK4YPAvk4fM9CdQIufi1Rhb62ZH5bEvd7LkDRDuLhx2VooOIwIq1qrvdaTKBghypZyJ9D9O2A9wYgS7OMYkp5fN+ml4DBJnA==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:36 -0800 (PST)
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
Subject: [PATCH v2 12/23] gpio: sysfs: extend the critical section for unregistering sysfs devices
Date: Mon,  5 Feb 2024 10:34:07 +0100
Message-Id: <20240205093418.39755-13-brgl@bgdev.pl>
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

Checking the gdev->mockdev pointer for NULL must be part of the critical
section.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


