Return-Path: <linux-gpio+bounces-2967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF68497AB
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 11:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A25CBB2224B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76EA168D0;
	Mon,  5 Feb 2024 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pXBbcU1t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384E0168B9
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707128554; cv=none; b=DNuYeX5n9RWX5aDKx62CEy9FvLYdYSg+X0B7/MuYQbF2Kk8e/1TcN5rEl0Gd8jrVYFphhN8oJ8m0l8ttVKecBRCbcPr+tPQ4uXiL/PRuFHZZaPqo/12hVwk3W1kYYIJcqEUnArxlcojGxG4T5wc5YQN/jeeZc245zXwe+NwFmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707128554; c=relaxed/simple;
	bh=XQFHQAy3ghz/oY8YrhiC5FeoWgHjjSFto3B6DYb1uTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dtpRSGJizgf2U7aCbi+3cm7koEpLH/1LiNO1MAdOnrpC+oCnDnEytZaHGKlWBBvON2xmoaBs+qjPzqmEY+zefDp1ev2awkivX3X0Jv2vC5952PXtseQ+PyIkAkqfDVgExehNGO591kFYClmIBExRtMplrpNw2oZgKWRbSiQYkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pXBbcU1t; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so3142449f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707128551; x=1707733351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nh3ag7/b079PDR25gLSSEiCZjsjzGkwvuNbtbymbZQU=;
        b=pXBbcU1t/iYrCUWh4sZVKalWP9hCcJ3ssI1ljAG0BUTVnT9MHDymwJhWwFlitPbp03
         R17rXCBcB5GXGeS7JDEEBkAXtzBAYlFlcwIII3XG+/9WtoJkuMFJ4WVZnyhcfR8rrOwD
         DEhrzPInLEfnq/xIp4btGeHqK8hzwcPrEs1j1abNU1kY4JDwD0GJBJ+LuxdQWaXKP8Vp
         sUe133n1wS+vnlYBG+6BhDxzoHT9tee5/GzqY2ekXKEpgxyBc6s1krCUmn1eYXzNa3co
         osq2x9+S9tMmAQFrXO9TSGH+iDwaniAwKeYuoqOWlDu5WyDgbAiBqBj0klZL8sJpsxDe
         HBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707128551; x=1707733351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh3ag7/b079PDR25gLSSEiCZjsjzGkwvuNbtbymbZQU=;
        b=OLgELZpzfvOJbfbY8Ku2w6mrebomtYwk4szv7x1xxQF0EGxVlwPtBonvM8wod04dA4
         w+Xi+mjR7dQSTkzV8+ZC1FiU2B2xjjwBBJ9B3CIr0PhntsQrr1VeXXnBg3M+CbeuA5M1
         p6ErzubxJM7P6guSL8JzY6Bo1xhlRip0HVsSCZ5lUvpMgQhXkjeDmFFs9sFM+67qqk9E
         XGvXtEq2NHA1NJHzcjVyX3eiCCz2hctzZ+LjCFnIj9hcBdOihVNZkH9cQMIpBKaS1Wj7
         Yh3cayB8eyg1ywvdcAPRpSK61k2lR8HxCPvUYOnokf2Wc7LqkZA2bk6Qlik74sNv6w/L
         IArw==
X-Gm-Message-State: AOJu0Yxxne8//s9ebUwfrQIf1F10AcPcdG7bHtLnwkpv+yQfxhLuue1k
	FY+vFykiQbpFnZgKZ/GYChjuWt6MwuNUz1qZkT4EzYVn26ejId7opxyVAU0asAY=
X-Google-Smtp-Source: AGHT+IEWTkkzFApDuOQaRlyxx+mqNV7F77qhWxhdcVAS21O2eADNQV04LXT9BAXP63xdqM3pU1aCTA==
X-Received: by 2002:a05:6000:128c:b0:33b:38ce:9e13 with SMTP id f12-20020a056000128c00b0033b38ce9e13mr2184212wrx.41.1707128551408;
        Mon, 05 Feb 2024 02:22:31 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVorJWZf/Rvh+vcTsNO3vi+G8XRadLeKdvf7sqiWpW+/xL2+VyyEaXmuh+spSb0imLes4frjJkHSJORhs/rpAzc1y4kZPkTi50H07SrwwZ08XBGpj1d3Dcs6S1RlaCcgoFgsl/y8wUbe3MIgPU=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id z11-20020a5d4c8b000000b0033b3d726d41sm1657392wrs.104.2024.02.05.02.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 02:22:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: remove GPIO device from the list unconditionally in error path
Date: Mon,  5 Feb 2024 11:22:29 +0100
Message-Id: <20240205102229.42460-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Since commit 48e1b4d369cf ("gpiolib: remove the GPIO device from the list
when it's unregistered") we remove the GPIO device entry from the global
list (used to order devices by their GPIO ranges) when unregistering the
chip, not when releasing the device. It will not happen when the last
reference is put anymore. This means, we need to remove it in error path
in gpiochip_add_data_with_key() unconditionally, without checking if the
device's .release() callback is set.

Fixes: 48e1b4d369cf ("gpiolib: remove the GPIO device from the list when it's unregistered")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d50a786f8176..d52b340562ce 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1005,15 +1005,15 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 err_free_gpiochip_mask:
 	gpiochip_remove_pin_ranges(gc);
 	gpiochip_free_valid_mask(gc);
+err_remove_from_list:
+	spin_lock_irqsave(&gpio_lock, flags);
+	list_del(&gdev->list);
+	spin_unlock_irqrestore(&gpio_lock, flags);
 	if (gdev->dev.release) {
 		/* release() has been registered by gpiochip_setup_dev() */
 		gpio_device_put(gdev);
 		goto err_print_message;
 	}
-err_remove_from_list:
-	spin_lock_irqsave(&gpio_lock, flags);
-	list_del(&gdev->list);
-	spin_unlock_irqrestore(&gpio_lock, flags);
 err_free_label:
 	kfree_const(gdev->label);
 err_free_descs:
-- 
2.40.1


