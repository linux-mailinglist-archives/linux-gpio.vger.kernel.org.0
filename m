Return-Path: <linux-gpio+bounces-11025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF629942B2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6220AB266AD
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8FE191F91;
	Tue,  8 Oct 2024 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DtmtZsze"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B2E770FE
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375362; cv=none; b=MzkDrQ/K4UzF1ZfmcTpIVMeV25LlGQ6C6OwLm4lMvNHSdII2Rt7ZDii/v53LaxcePeaNGcpee2BfZSZiSFckS3g1ok50N/FST1q7CpEaC04bD9OU9Hvt5Wb9u80sfyJcLg+IJ26oAS5KEga/qjJm5LmYzDUkgwv5WPKxOUdbF+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375362; c=relaxed/simple;
	bh=UEYJraEY/4Y2HOvK6ZVGKjPI2JChba/+KAdpE40jGKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZpMkSfa0z+p/AAcP6V/OYiaUoUqo3y8utpXuWFcZrW1V2LmHg9e/43EclXNJlcjsI4IJlSqvULMYmPFrLJgMyYf6cZ7uCXJmLu2W9w+elJv0IReYJ1fYqaFbEeW4UHdrkAwvM5Y+Y7o4MLcRVJ1zM8x+3ag71LhGawpegGcwcNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DtmtZsze; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42e7b7bef42so47391335e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728375359; x=1728980159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWgRCowkm008kJFVLy9y4f+hhyNI0jf/IB10ECXWRmo=;
        b=DtmtZszeVpRg32vUzBBA7ziIKijFeFXs51Hl8xDve4VXjoIQ+5/3om7INSgw4z/P+y
         nzowovb8P03O32EZfAUV+FYkwEL+0h+Lx6IgCT8LMFOLTBJ4dQECarVW7JCRraG6N64o
         EP3FM24AwL/7fbQX6Z1+2lDp0Xqtnay7Mx7kYY/cc3ua7/bnHMO761TGvinUR54CXveR
         nXWGAxIYpT77OuqQ3sqX++58PsqPAeoJZbS038RYEmV84xVWGRq/AOkVNgNrPUMUJ6Q0
         Fy4NJqarQ/9Oc4znZa5WldDnBXFIaSFYNTREpGDF9It0uyzzBi8NzRcb1NDNo72ETkJ0
         gwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375359; x=1728980159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWgRCowkm008kJFVLy9y4f+hhyNI0jf/IB10ECXWRmo=;
        b=IRIU+5gZRxKIZywZJytGS/7Fw8Nm5vZfAs3TeZtLRDNC32DSpbfOLW1u1oFAoruk1q
         7m97BzIVQoj/gYUFX0GoNwCaI+2rNrQqrpw9ZV+pS03QSUbfIgCOBusvPwT364LG0gxB
         roOB/OQe6i00ahFsMab6QNCUZvGu9H7RV/+09WA/5WJmenef6T/vSj0nSc/vHXTaMhGo
         MJmmiF1KV9aBgy9e0rIl6waeG8uOIlhY3lBhtrjBR3NwUWthP5tXtMSwNkWUKd8ylqiH
         XhQGAUprM5c+2WDjaitswOkI/YVBiPjgibaYtJTkMyOVeCn5Z4GkOUpoYmkSOgK9hXCM
         Qhkg==
X-Gm-Message-State: AOJu0Ywc/1Cg5xruSHRmwidxJRMlBnr/7k8I1jP9LGfqLQUOGAqIuoBM
	bzBzqKm35lVI7dFA5uzw7NqthZ0411sONBxReYGPUo6eltPhY44es0JdJBlVDLE=
X-Google-Smtp-Source: AGHT+IGKWkpI9mLOgAreEezYfLuvGOehSyb/NSFc2oMuBD6dCg10MIxmAr5oWCUqlWwWgmwWOofi1A==
X-Received: by 2002:a05:600c:3146:b0:42a:a6aa:4135 with SMTP id 5b1f17b1804b1-42f85ac11b5mr98495885e9.20.1728375358868;
        Tue, 08 Oct 2024 01:15:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691ba45sm7492431f8f.44.2024.10.08.01.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:15:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: mvebu: drop dependency on OF_GPIO
Date: Tue,  8 Oct 2024 10:15:55 +0200
Message-ID: <20241008081555.23465-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver doesn't really depend on interfaces from OF_GPIO so the
Kconfig dependency can be dropped.

Suggested-by: Uwe Kleine-König <ukleinek@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98722e814e81..6643e81bf11e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -488,7 +488,6 @@ config GPIO_MT7621
 config GPIO_MVEBU
 	def_bool y
 	depends on PLAT_ORION || ARCH_MVEBU || COMPILE_TEST
-	depends on OF_GPIO
 	select GENERIC_IRQ_CHIP
 	select REGMAP_MMIO
 
-- 
2.43.0


