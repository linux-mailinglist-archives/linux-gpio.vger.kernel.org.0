Return-Path: <linux-gpio+bounces-2750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9114842560
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 195A71C26934
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FBE81AB6;
	Tue, 30 Jan 2024 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EouG3aw6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD0745DD
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618934; cv=none; b=TahF2hq3Z3FabcgIk2/HfG5/fCRr8njshaMp0GnAMPnFYe/C1fWULKPbyPt0khM+3EErh8je7imPk2xsv6xCUWSj+q8lrSnNUF+Mpy++kk5/yWYP4Rc5IN+ZIkpbYPAKRL0i3bxk9ilrBKM+pa4C4ZI9OoD+PrHQ3F0ns0Ih06s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618934; c=relaxed/simple;
	bh=BlasmXWk2cKYg0vYntEQWSleO/ytA4RrXZqAoO9ZuG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V1aFTYyEcS9H1S48jDXPan37Be8DtC3PcPyzjA+NpHDKI8Mja02TKChm793SFuKVGyWCXp4PAZsX46W6zJuRXVL7h5wr//dPPsVcDYJpaBAGsu/+UzmJdqSBBXj2zbl9A0qJ5P7f2eT+Z+A9i/gb26cn47n60lxeWGYd3jxtARs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EouG3aw6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3394b892691so2157657f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618931; x=1707223731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCxDOAXuOOg2T1Tf8oCKLsKFNS/3bOHdr9NifUE/KQs=;
        b=EouG3aw6sYAqU5wtKpHTgANYPotLDMhNgY+IDmeGzRb2wlYU+6/whicse39Wyv7C8c
         BMSzyTYUJZnn7macCbfVpH29MPmpdc/kCxMs5gQHjvISgSItD8lJAvgU6MxWe3sU+wRK
         O4xaUqpENmwMlm19NP+cOmQvfGSTP6qWINSKO10sRrYltQ5YXtdjijSDT9OvTQA8j8yM
         ui+8FhwG+LjMFtYMx/YLxHLOaOyWZEsgA4/BaNFzlIcrdj62XYhgNUvgteAauNZgd8P2
         nKjp+ejDGVkALD/bYGBgXvIEEjiCIQxSnvjO1jmJyZfW3AuF+wZyWOUTgQdQ1nvcJHiF
         c3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618931; x=1707223731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCxDOAXuOOg2T1Tf8oCKLsKFNS/3bOHdr9NifUE/KQs=;
        b=Zx4yHTNP/mZhHBQtR275sMvO5xlfqDaDCshb3oPQbvNtBr8s8nWjn9ULJ9i93COlvh
         Ju7X8ESHEjofAxitexCRxhCGlxT0b7wuItXv0rBuMtu2+rsIvfAbMScGYg6h6eZ8tzEc
         rK6UYqgoMrMKfrksgjTgwH1D6n+0RXRZvLVIdMxfUX27sP5Iwkk/E+4mgnTc3fe3781L
         nOmYs/A7Cjm4M56khgUAGwzuiEL5sV9q97dbhb9gVnpiGNvVlI0G0W3MDdlxUqUoUuiu
         ruH/o/e333MBRChW3DJXOjM06ucr9CjwPbkLLhI2+SXeP6gWEMMLuUi0odi1uay+AzX4
         DXVg==
X-Gm-Message-State: AOJu0Yw+5BiqfP9aiQWDiiEXJiRtsHl+KNozaq3GSyGdd12xQ8o5y4MM
	tciz8HjxNJtRK7Q8EDu7YqLUYEf3wM0HVC2TwqCaN7EYzLUMI7pZa3M+NN9dc7c=
X-Google-Smtp-Source: AGHT+IGp8JPx4damkt0XgQtbknUdfKbHv0TDVvzIuWWhrZpk7IFyABqdnHQu6LKOZDDfCbMGbUU3Gw==
X-Received: by 2002:a5d:55ce:0:b0:33a:e3ac:60d4 with SMTP id i14-20020a5d55ce000000b0033ae3ac60d4mr1295411wrw.15.1706618931370;
        Tue, 30 Jan 2024 04:48:51 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:51 -0800 (PST)
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
Subject: [PATCH 13/22] gpio: sysfs: pass the GPIO device - not chip - to sysfs callbacks
Date: Tue, 30 Jan 2024 13:48:19 +0100
Message-Id: <20240130124828.14678-14-brgl@bgdev.pl>
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

We're working towards protecting the chip pointer in struct gpio_device
with SRCU. In order to use it in sysfs callbacks we must pass the pointer
to the GPIO device that wraps the chip instead of the address of the
chip itself as the user data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 5da316ea9cc7..654a5bc53047 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -401,27 +401,27 @@ static const struct attribute_group *gpio_groups[] = {
 static ssize_t base_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	const struct gpio_chip *chip = dev_get_drvdata(dev);
+	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%d\n", chip->base);
+	return sysfs_emit(buf, "%d\n", gdev->chip->base);
 }
 static DEVICE_ATTR_RO(base);
 
 static ssize_t label_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	const struct gpio_chip *chip = dev_get_drvdata(dev);
+	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%s\n", chip->label ?: "");
+	return sysfs_emit(buf, "%s\n", gdev->chip->label ?: "");
 }
 static DEVICE_ATTR_RO(label);
 
 static ssize_t ngpio_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	const struct gpio_chip *chip = dev_get_drvdata(dev);
+	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%u\n", chip->ngpio);
+	return sysfs_emit(buf, "%u\n", gdev->chip->ngpio);
 }
 static DEVICE_ATTR_RO(ngpio);
 
@@ -751,7 +751,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		parent = &gdev->dev;
 
 	/* use chip->base for the ID; it's already known to be unique */
-	dev = device_create_with_groups(&gpio_class, parent, MKDEV(0, 0), chip,
+	dev = device_create_with_groups(&gpio_class, parent, MKDEV(0, 0), gdev,
 					gpiochip_groups, GPIOCHIP_NAME "%d",
 					chip->base);
 	if (IS_ERR(dev))
-- 
2.40.1


