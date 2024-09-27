Return-Path: <linux-gpio+bounces-10487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5583D987FA0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 09:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11800282A8C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 07:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFA41891B5;
	Fri, 27 Sep 2024 07:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZQL33wck"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C74D1865FB
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727422950; cv=none; b=kVc7SBtOtUx3zAkAveM8/6zVVlhG7VKu2BoPHoRVrW02Z1c5CMuH+fwFfRr7I8afmcUbFjR7s8IutzuSBSd6TwzyNnRJBCPtJfDVfJtrvMjf08vGp8XyWkqgguDbg/Vgr8jIqeIuwUKqNXb1/HXfn6nHaEluozCnm7mSnimmqD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727422950; c=relaxed/simple;
	bh=WFc3Z2Ci7iK0/myrsyoCWo27iBCWNjw4NgcDOnuMOxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mmwMG8/69NtlcIiFGsketq6ScmatWcXWb9Da2lFDOGnbniwLWkAsoFPyMRGZWXo7ElNC3t754whk9Nbw16i45Q7PvSJP1p4kzYwIGXG/fxd4e4163KmkCRD8zlCl7zgWHr/sy0MDaS1t3Qh2REMHRT1g1+IoB3JsAkNuEZ7jYhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZQL33wck; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso11613795e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727422946; x=1728027746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DOdUobVOVtgiYgdW4L8/ozYZLZuDj7lViLzqUU9bECY=;
        b=ZQL33wckrAnc9qqL0X8NPUuoKfh0zlK7KUiKPwHdLxtHR58LDq8EwIUcwwPTtIyzNC
         PEHkhYnSu904jLbleyTFWMtVQUyQH5C/PtGOWGO91F9yymOUT5qBzEv7aWICFRKvLMSw
         Y8pNudQfFQeR7xsiScYFJLSMvCzrFZ4nwLIS4pzk9FXXmDESIh7yqV7RP+swm4EvhCm1
         pEqQurQtGZGehPkbieB1UFC3jNHD0f8EbNR2rwj27TD2w/3PyLldOAxsbiIUP0ioDym2
         wymx+ZZWb+eTulq3XkuipdKZrz2O3akZMWFNBnEtEJxjlQCm0UrRXHqrbQ2rnIDrd793
         p6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727422946; x=1728027746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOdUobVOVtgiYgdW4L8/ozYZLZuDj7lViLzqUU9bECY=;
        b=FfX7lrpUGCVqlWIfkkp/MW3fu20QtqrLm6lPgqiu2BIq09LBhRPD2Er3fXPdhKrWGR
         VCHA8pjoAQLw4xtKj8mFxvP8C6ja6d2s2+DURly4QFcZNOV4yJRKLaMpoN5PGeCX3ALS
         Za8mLW9/KNTtD5hQ9bIFslBdsZdGj8mPro0Q9bZclVOcs4I8yMPhn+JPmmZMBEM0O2D1
         ZjJHHHj4VXeefiTB22dPqVsJ+K9Zt+o/+h7g6IwgaYug2mBxig6WIKfvksk5u0Anu/Z+
         9sKCRDeBiUnwmg8I2ZqKrM/DRRKZBA41STvS29dRz+0P1/sLSqvCgKWtrrmUbH3rZX3M
         RZIA==
X-Gm-Message-State: AOJu0Yx3fvhDNTjUCGB1vw1ilPytUoUFHTWnIC7AvH4zg01YBw1cSoCD
	pbYRV5NqsM5BwgBL9WFe1DpnNyG2C1kWHehWGwzQDaCRpuVENWoBc/wdZKLRIzs=
X-Google-Smtp-Source: AGHT+IGTLNYx8CXWt5+mDv5PuKKxPV7lSlddClOvc1ENfOSqGWWc0UL48qHYTfSq1l5VF/dXqDa7tA==
X-Received: by 2002:a05:600c:5117:b0:42c:b166:913 with SMTP id 5b1f17b1804b1-42f57fc9204mr13235475e9.11.1727422946272;
        Fri, 27 Sep 2024 00:42:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a28d:27a8:18cd:2c6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36760sm66541265e9.30.2024.09.27.00.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 00:42:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC PATCH] gpio: sysfs: make the sysfs export behavior consistent
Date: Fri, 27 Sep 2024 09:42:21 +0200
Message-ID: <20240927074221.9985-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For drivers or board files that set gpio_chip->names, the links to the
GPIO attribute group created on sysfs export will be named after the
line's name set in that array. For lines that are named using device
properties, the names pointer of the gpio_chip struct is never assigned
so they are exported as if they're not named.

The ABI documentation does not mention the former behavior and given
that the majority of modern systems use device-tree, ACPI or other way
of passing GPIO names using device properties - bypassing gc->names -
it's better to make the behavior consistent by always exporting lines as
"gpioXYZ".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Story time:

I decided to learn rust. I figured I'd best find me a project to work on
that would involve some proper coding but wouldn't have much impact on
anything important when I inevitably get it wrong the first few times.

I decided to write a sysfs-to-libgpiod compatibility layer based on
FUSE. Since Rust is hard, I started prototyping the thing in python
first to at least have the logic nailed down before I tackle the rust
part.

When working on the exporting part, I vagely recalled that when I used
to work with GPIO sysfs somewhere between 2009 and 2012 (still with
board-file based systems), named lines exported with sysfs would appear
under /sys/class/gpio as symbolic links named like the line and not the
usual "gpioXYZ". I realized that this is not the case now.

Quick glance at the sysfs code reveals that I didn't dream it up, but
that behavior is reserved to drivers setting gc->names. This has been
slowly going out of fashion with device-tree and device properties.

We could easily restore the behavior for everybody by taking the name
from the descriptor we already have access to or even just assign
gc->names from descriptors in gpiolib core but first: the sysfs ABI
document does not mention the named links at all and second: given how
this has naturally effectively been phased out over the years, it would
probably cause more harm than good when the exported names suddenly
change for existing users.

I'm proposing to just drop the named links alogether.

Let me know what you think.

 drivers/gpio/gpiolib-sysfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 17ed229412af..643620d261f5 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -577,7 +577,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	struct gpio_device *gdev;
 	struct gpiod_data *data;
 	struct device *dev;
-	int status, offset;
+	int status;
 
 	/* can't export until sysfs is available ... */
 	if (!class_is_registered(&gpio_class)) {
@@ -626,10 +626,6 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	else
 		data->direction_can_change = false;
 
-	offset = gpio_chip_hwgpio(desc);
-	if (guard.gc->names && guard.gc->names[offset])
-		ioname = guard.gc->names[offset];
-
 	dev = device_create_with_groups(&gpio_class, &gdev->dev,
 					MKDEV(0, 0), data, gpio_groups,
 					ioname ? ioname : "gpio%u",
-- 
2.43.0


