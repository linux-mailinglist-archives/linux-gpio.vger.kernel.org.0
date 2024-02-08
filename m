Return-Path: <linux-gpio+bounces-3081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F884DD96
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B549F1C27AB5
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76D7762EC;
	Thu,  8 Feb 2024 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VpKDgCwX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD7C76033
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386384; cv=none; b=E+CGQYYnm6zNfjRc9Pi6d0sPbJyEunO8w/6rGp5SSoHYcrwjxFQqBlf2VMcNkLTjXyzQbERzr0XhkzhDiqr3i6NG4A72YNS5FS5/PpK5gHuEg7OPPIlPuTIaEg2CAC1IFftQQIm4Qx3yorlbeI1RXuJbBWUa0ms3G+OWpNlp3Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386384; c=relaxed/simple;
	bh=uoIIVRHu2uJkO9SDw8JuUKRoDUO7ImNaDoq5Rnmn41o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=STy9pm+x/lQXhfzZsO5v/iwxhaMXXG1mkaFnVlp0qYtOUD6ilvcAqW7tirPoGk7xaM7tvuBnKq+rUEXPQtDGznP4gIWEd0WcGfqNISrkNGNXjco05t6P5Gg6QZpvoFi/zSCPzqxlYWFBPOMeDDOjSZCbKv32uE2QEV1Rjxp81GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VpKDgCwX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5116063585aso2022325e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386381; x=1707991181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7MTTS1PPnO0o443gYifMTGiFsAoLhFBJ+RUlJK1fWQ=;
        b=VpKDgCwX+M4IUPcwf2nQjfRyJJcu1cazURmoDWk1mMnZHQ2rpjSoT3j/8MaeVLRzI6
         wuuJGz//079pwkH+IaIIGmGkvXEFvuUTO3mgCEDo5WENUffd8Q1lB1Bfr6jLIlepgryE
         hpPkhHZipoRb+nC+7jhB2A4biHaJPoDm9ce2W9DwpE37Ci+bJDnfqDIkV9Czf+clY7ei
         hLGYVCbRJoj8moCqPp4zTJB436EUBRc97+9Kk3qGaM4sYz8+xx7wEJG5sRYsna9kI1Kg
         X2qDvzJPfmxfssmjsMGbDCofQR5DcRbOkhzSUP6aJJC1KOnOl7uJ8CcfjUUqsGSG/SUd
         9Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386381; x=1707991181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7MTTS1PPnO0o443gYifMTGiFsAoLhFBJ+RUlJK1fWQ=;
        b=tpRKMncLngkm4rKdLU8xyjGVYKKnn5FK5IlEHn3arSU3cmaiqAKlzXJ4k7IQH1ozl7
         YMGTrLySgI038p87iE3M0j+EnOJGNa2LQytOf7f9d6gG0aabKJWLQiY5Ogdt5oCefK8t
         FQzfh2vHbSy/Nd5Krvje7sPxoMgMskyspz5YrrNh6VEtQilGoFkvL8fz6z5hWTn8kmex
         MBg07HL81obFJ69k/FKUmsMFBKoG8PSgK/IRtJwPaIqZVIC4gbLtpq+w+Z9rx2XM2lyz
         3Q0Qi8E3fm/TELbUG/35X7mJHo2kZHoMLzrRe41yREJnwgzYS4bhkhy0vBzUQ9KEs5Nu
         VE0Q==
X-Gm-Message-State: AOJu0YwCOWBJTeu67gGmMTsl92O0vOX3ektJrYk7MlqrEaPw8WYKo9JK
	XdxTJxOTgAVFMEZvLjuFtJLXyHMbFhS+NS9wISNj0YgRgvghXOzmEpF6MADLDXw=
X-Google-Smtp-Source: AGHT+IHNTKOLEHtsygIf2IrvhbWXAtgHLghUVOVCI/1G3Nr6yFdQZvPMiH4x1NBVHikMTpuFF9OBug==
X-Received: by 2002:ac2:5ec4:0:b0:511:4f19:f45b with SMTP id d4-20020ac25ec4000000b005114f19f45bmr5806486lfq.41.1707386381267;
        Thu, 08 Feb 2024 01:59:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfobfX7jRLlpRS5c8qTily6lghNl4/F63UQYOHOIcnviy1d/ZvQ/8OGvHJqPFMyPUow7ZFPnk8g+HphKSds9wHgBuzdhRM7MQjIs+njTpKknGNHf2oeBr3QOFySE717hxvdonMRtXJEAn2AK5sQSkm1b7iy9S2r8r+Wmb2AMrrLw+qZhEuhvWa9ztdg1y1vlK1TP2IH2NcRyaF7PNGeiQ+toPF/uFuc13tJxPSAh6+9o5XF6d3nqNSMDUawV4VDZFYNyGNWaZ3+nbEhDzJBLvCvUrA22nM27PNLb35j+E8m1neG9pEK539SYo+Fys3xAFh1YUxQ3D6ppt8gqG/HIWvmPM43pb3tQ==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:40 -0800 (PST)
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
Subject: [PATCH v3 15/24] gpio: cdev: don't access gdev->chip if it's not needed
Date: Thu,  8 Feb 2024 10:59:11 +0100
Message-Id: <20240208095920.8035-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208095920.8035-1-brgl@bgdev.pl>
References: <20240208095920.8035-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The variable holding the number of GPIO lines is duplicated in GPIO
device so read it instead of unnecessarily dereferencing the chip
pointer.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 8e37e3befa08..e993c6a7215a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2701,7 +2701,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	if (!cdev)
 		return -ENODEV;
 
-	cdev->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
+	cdev->watched_lines = bitmap_zalloc(gdev->ngpio, GFP_KERNEL);
 	if (!cdev->watched_lines)
 		goto out_free_cdev;
 
-- 
2.40.1


