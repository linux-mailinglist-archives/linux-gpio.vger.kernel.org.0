Return-Path: <linux-gpio+bounces-2954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00618496AA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CB8828846B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FD917744;
	Mon,  5 Feb 2024 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="orscmaR7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD24134A9
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125681; cv=none; b=qD2HSHAujOZLTKiKFKpj0P4irArTw1XXLHsvOs5P9x/bkBD/7Du8+J1OZT+g5VoQMCSKH2Kat51a3YTjjIIM+3LfK1L4bNs9YeMaHxdPNH7Q4DD62NY6/CPfIpPckgu/IwNuI4Cy1KSnAvFXpQIht0ByCwgSQEdjawqKz8W0aKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125681; c=relaxed/simple;
	bh=dvNWzN3ht8/FdUM9oKycIS4wx6Ize3NJvGw5mcCj4kA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ISQk6DXinnk5N5VeNyZrFxRYUtTa1Urwv02apEXCroKvu5FEEcq0eHmxST/VyyjdeBhDn1VxekcqaMSfl19cYxi2FGGt2GUNZYMxVqRymrI0d5SIYjOv8fp+ny9Tq5VZGvhjBqf3Pg59InVxJeiEeNhHX/R7Eqa1cW6EUQc64dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=orscmaR7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40fdd65a9bdso2705335e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125677; x=1707730477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkDPe1O0gAbIcKrknOKSxNlPidMI9YPWSkCZD1MG6Wc=;
        b=orscmaR7Efyb+6xjb8f5wnnU8y9W3058FcC+OP5Yj+a11/+LuPWhyzLLR3Xh4MLsvN
         7IAe55dI4mmaz0I12mylsMDUOnOvMCDsT8kAHMZovp1g8wsTiq2+LBWfbd2uhjxHnd/e
         HgCOQAFh4N2yvw38CBjKKqAljikWUQ1e4Cw87V50YGlgUN6JJ/10rKqY35ACn6k3r7GQ
         S6iy9TW54oOehVrSblKPC3zWTCK0ByJVLhQ8SE8ISyAVEcQ9YDbFHqbe3B4gmr59MRkE
         SE+PlJdhN3hdpu6/I+nB5nIFkrWx3RsFBhb4YyfkLSVVPUEPAxoPJoa0+Uba3vJYsn13
         ophA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125677; x=1707730477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkDPe1O0gAbIcKrknOKSxNlPidMI9YPWSkCZD1MG6Wc=;
        b=u2GIvwpKAcsouhMbxJOAoT8I/edAsMX0DyySkkQOS7e9biZcZ51Ji1a3W6PElZ2som
         8rmRkN0vssCyRDBgsSzVbj9+s3mrQ74y6P3rIMbHpD5dgsx2mHg3ESIf+YC+Yicatt/B
         Qe+pCc/VpiHjBFXktyGiEbZZgtGjDF7hecbUTotODmUXO9mD93TN+lccM/Al68RoYpaD
         8KlR1WB1QHv59mlBlhRGcDUQ1TvodgU4bShsWlNNhuhdKwWPbm/7VlxAYMoZ79RfUx8s
         vZSIEsIOn+Yd0QmoUGnoXP+MZeW1/Ei1wB0ZUz6kQVCi0C8VTf4yQq5ngqKa3S2Kt6iT
         +9Zw==
X-Gm-Message-State: AOJu0YwHZnltQdIDHAO76iwJ8NnolVWFgVEsd80WhfzZs+ZLi+3faruk
	DPVvuOu+KTqAr2p87gZYASsRqk+iWjLXtltb3MCIYEPgjJNRY8L1RJkcLW95wVM=
X-Google-Smtp-Source: AGHT+IGRtximsZuHOJ+4t7O1k20vhwzMFUlcMGGnBrLsaGExTNJF6XHpbFDep4ZG6gEfToYEqqNUog==
X-Received: by 2002:a05:600c:154f:b0:40f:d253:38f1 with SMTP id f15-20020a05600c154f00b0040fd25338f1mr3921163wmg.26.1707125677471;
        Mon, 05 Feb 2024 01:34:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUtKZ4n8oU5koW9HFK4egEwXKSg2J4+0iyLOdhFrR5BFLFICgg2ZxVxx+HreUxjkIAcZ6Er128kBk0zLOFMm9V644WeSe7Em77IlosfjExrIlg1PVfe1r/QRTj2eojyqPxCu/1MB4dVaD5MBh+c5vQclpTdCLc1zlhVyNDUPB3IofmtBUzDqtC3CbIm7N3fiuHywSMglHKV6rWVC6TdXOEvv0Il52DsBqy2BQ9jT6wHy8U3UmPJkcLJFIAQhYXyOSCmrKkbchdWerYdX1CyBMx80AQu6oCx416aCbL2BYiYbg6F2VpvFNnGsDtJCmyZzKTSDQkgh0+tOl0DqhynPWNvXXYMx6Yz3Q==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:37 -0800 (PST)
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
Subject: [PATCH v2 13/23] gpio: sysfs: pass the GPIO device - not chip - to sysfs callbacks
Date: Mon,  5 Feb 2024 10:34:08 +0100
Message-Id: <20240205093418.39755-14-brgl@bgdev.pl>
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

We're working towards protecting the chip pointer in struct gpio_device
with SRCU. In order to use it in sysfs callbacks we must pass the pointer
to the GPIO device that wraps the chip instead of the address of the
chip itself as the user data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


