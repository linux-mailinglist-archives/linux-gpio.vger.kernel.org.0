Return-Path: <linux-gpio+bounces-11305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE30E99C9E9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 14:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B68A1C2285F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 12:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F3719F46D;
	Mon, 14 Oct 2024 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYhICIuL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F76D19F13F
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728908316; cv=none; b=KEqw8DlgEqQGCSBkSRVTHfrGrPy6DSo/3HuoBhmO1wJTuksee5nMJ462vF5SfH0bxj6KgVSAVe+QJb6CRxFeB/bTP4avJ/dmlLU3oXeSm+l4IosJSo/A+l3CWDovuO4Vk8BnU9YujLaUoM7C3gKiSGiucp3rIbx97E98C7iK51c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728908316; c=relaxed/simple;
	bh=mFBoCNrUZG3cLzWf/DGnig1fihxe/09n1vjOwanoI1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DU7bSBzQsCuH+Sz/bogfyKRv2WgdR4mF990Ur+7IGea+dgI5mALZsXIECFLZNC5RukJlXpoow+CYIrCKRzXF/oCJqQ2iGUAgsc+23virXG+gWtBQUnewqhWxQ6LROqsN829Gk30xCAhggDTZkghKH7cBxdHYTNzl+DYNTuGClhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYhICIuL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so2665081f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728908313; x=1729513113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PY41G9O9B41tlvbRmkxCPs2gsA50Z6WrgLw/irylVJo=;
        b=mYhICIuLUar8Wc1sgiAwLRnfsGp4IDICVeMH0mCdz4Rqh/RsMclRZKNtMj6aQfXrPO
         8pGyxToZCBB4a5TrhCOi9tvIcj4lE+x+t/Y9JL15Jg4JNZVXa1s57yjKdm4536iQBsfL
         +RtZuJV6lO6tv9p9/m9WC/p5ci9uJFAZHCdZ79YzZoZKWtOtD3fz67g2OdEU5J2jZUDo
         FjCf5/r5XyAaqrzZvOBwLERb6lNzeoB2kDNBsGEekUgYAAgLkKe5jweGS6tKpPBtUP68
         hYqNtU8NqpTReE65lUAL8chUclIcDEdaWRksP1vMAKIngR+pBKWW31109mnMUPMredlS
         753w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728908313; x=1729513113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PY41G9O9B41tlvbRmkxCPs2gsA50Z6WrgLw/irylVJo=;
        b=bVysQPdMwCt3seyYjZfl+FcExlsDMvGC3TfXZ8dHfy9/AyFUqNtB4LKg2UNnnXDPhD
         kNM5TDZxCUbEQ5lb3l7elLAHPPY19FzOizNgICYmgIxR82NeUkDwmgyOzFPwADx7rdm7
         tPKPcKzHFg2XZj74Z8Jtsj1S/ewP8C1KBaJD6Qlo03+DnfZtUR2P4XdI++dmrSnXb9p2
         LkPiFgdBTKRlr0FDLUcRQBSO6bt6K6czjz1y/roUvjiOj7BXC1gOeK0HuIy207m1Lrsz
         XQzvqx4NkAsqY1REEtBc+GEmC4LEK5yPuH8BzM491k1XhjE0i/6A5/DFgiT+Xpnan4Kj
         QNmA==
X-Gm-Message-State: AOJu0Yzb16sttHRdD/FQB6qUzCHOZy+3o5cOW3PPbHRVUiEpeZC0X3W7
	b8zrGL1jgk77vrPzhzQgzuIcWGukzTi0WlHPzKQnQXHLjBLum+TUGX6UPMGx9ag=
X-Google-Smtp-Source: AGHT+IGBtBgbb11CDhtxi74JajGba5TMb4OF5YCUYq7KkMcFJWXjOTg6hGJK3YS9i6dFXvblbTY3xQ==
X-Received: by 2002:adf:f3c9:0:b0:37d:3280:203a with SMTP id ffacd0b85a97d-37d55184cdbmr8709433f8f.10.1728908312531;
        Mon, 14 Oct 2024 05:18:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fdc2sm11234895f8f.88.2024.10.14.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:18:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sysfs: constify gpio class
Date: Mon, 14 Oct 2024 14:18:30 +0200
Message-ID: <20241014121831.106532-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All class functions used here take a const pointer to the class
structure. We can constify gpio_class.

While at it: remove a stray newline and use a tab in the struct
definition for consistency with the line above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 20426d6e04d5..0c713baa7784 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -549,12 +549,11 @@ static struct attribute *gpio_class_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpio_class);
 
-static struct class gpio_class = {
+static const struct class gpio_class = {
 	.name =		"gpio",
-	.class_groups = gpio_class_groups,
+	.class_groups =	gpio_class_groups,
 };
 
-
 /**
  * gpiod_export - export a GPIO through sysfs
  * @desc: GPIO to make available, already requested
-- 
2.43.0


