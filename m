Return-Path: <linux-gpio+bounces-11294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533599C586
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C861F23AE6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35C2183CA2;
	Mon, 14 Oct 2024 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wAy9cgM8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C121684A0
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728897753; cv=none; b=lg8oO55XsNktTQEyHw6WKJivvlhBdFh7KCt73Vc3NHH8IAu6k3+5L1Dqx0XE1TrCjofpOcHViXVSrFD0+U6RIBSmMvQmThYuqomAb7gLLMblmOb1bkZNuyatAoZ4sJ99hS7ogWNkKrgybHbeWz3vwZkiVkD9h/eC+2SGhs3L4Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728897753; c=relaxed/simple;
	bh=QTBIWdmXk+U4SFPfc0A6/33f0Fbuahy50iVAAeV4uWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LxbstABVkxXeGoVzZiktgsu5d5rX5jNuM4bwBxiCyPlVJRlb+uCQFYEKuYHhcRNYC4yD4krcXgq2l4MJK9KU/JNHbeaMl76FXaBrHQWk7z0Yo/gNqE0iguSOhSmF6j0abkfOz62mkmKdnpt1GtWQO5Ct+HDivYzWkaaY+D5LIkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wAy9cgM8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4311420b63fso30309185e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 02:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728897749; x=1729502549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3HoY7eFtigRWVv0qg9qyKFXGHm9Qzz/2QFCdLIKNg8=;
        b=wAy9cgM8yr52tT5O2Hftyi7Yg4Meq9Hu0Afr3Qn6yjXx3Lh7f4HXhMdThHhqgalNac
         RtwZuGOJbmaVLxWO8ZxakoH3q/smcPy5bh4VruCbRZxAoCQxD5W6xl/KzrL771zw2eSO
         +Mw/85A3R3ovas4PuLYd+41sIx6QUynY5efeGEoAvL3TQDrQ5BHw2k3a2f2j76q1UJFe
         eV3ypHkQ7Wtgb+xf2765QThriVzFsKbYmJYsVgthraT/S5nk/LezW7edmacKd6aR0Fz+
         g3GsvAP0XxBqq3f2uR9i+atovLDIq1OSmDf6rwPa/2NegBSlsCQdSngZVmJ7dlmE7btd
         WWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728897749; x=1729502549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3HoY7eFtigRWVv0qg9qyKFXGHm9Qzz/2QFCdLIKNg8=;
        b=nVw7hDEg7qVFTyrg58ygYOpvXFyXydMdTrVD3jviit5DP0D5jikKSnjhtdtaUtghg+
         3HMkmowuSgq/vrAm1Upr77/CPIFxiX81REho/RklvOvZPLmPRxeOU7ugH6sC8bcA1pm7
         8dCVliiUWVPq4z3/Jf9AypENOCjWtqsXiuzXzQeXe1u/BlBG8O3mMxynZA8aoz2TcTdG
         YVJcEu1+oaw2izV4kICJDS4b9SxrhQU1D7JyhQL2u3xoCRNb0UYnX+bVMskPcrqcVcsy
         zvpgdrIkhRuiTe3+Eu0ubL4F8LmY/8Rqrh+azWCFsHnwEjZRumROBGQUp3SNAuKa0Xo7
         1Sdg==
X-Gm-Message-State: AOJu0YzLDKGaS9gPLI2kLfmi0qyrE3DCZHqOTHGmmycmpC5QFehZsolL
	Zzx5YjUCzzMMGzFcsuXNJUrQywQnqTWS5ptlM94E0ZnuEfWo/qmJNAwAI5xCP4vzoSJ0S5+eDLQ
	c
X-Google-Smtp-Source: AGHT+IFXR2uVEc7GbSxE/yzzaHc2PPfNTiLBNOx/tJ1Z8Yw4E50d6RS4aAVXY8VBR+2SKfTOzGPztA==
X-Received: by 2002:a05:600c:3b1f:b0:426:6158:962d with SMTP id 5b1f17b1804b1-43125609073mr66644385e9.23.1728897748620;
        Mon, 14 Oct 2024 02:22:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835687bsm115728755e9.34.2024.10.14.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:22:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: menz127: simplify error path and remove remove()
Date: Mon, 14 Oct 2024 11:22:26 +0200
Message-ID: <20241014092227.78886-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use devres to drop all goto labels from probe() and remove the driver
remove() callback. While at it: drop the unnecessary dev_info() message
as not only should the driver be quiet when successful, the message is
also wrong: the device was probed at this point, the driver had been
registered earlier.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-menz127.c | 58 +++++++++++++++----------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index a035a9bcb57c..3ccd2cb35b9c 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -127,6 +127,13 @@ static int men_z127_set_config(struct gpio_chip *gc, unsigned offset,
 	return -ENOTSUPP;
 }
 
+static void men_z127_release_mem(void *data)
+{
+	struct resource *res = data;
+
+	mcb_release_mem(res);
+}
+
 static int men_z127_probe(struct mcb_device *mdev,
 			  const struct mcb_device_id *id)
 {
@@ -140,17 +147,19 @@ static int men_z127_probe(struct mcb_device *mdev,
 		return -ENOMEM;
 
 	men_z127_gpio->mem = mcb_request_mem(mdev, dev_name(dev));
-	if (IS_ERR(men_z127_gpio->mem)) {
-		dev_err(dev, "failed to request device memory");
-		return PTR_ERR(men_z127_gpio->mem);
-	}
+	if (IS_ERR(men_z127_gpio->mem))
+		return dev_err_probe(dev, PTR_ERR(men_z127_gpio->mem),
+				     "failed to request device memory");
 
-	men_z127_gpio->reg_base = ioremap(men_z127_gpio->mem->start,
-					  resource_size(men_z127_gpio->mem));
-	if (men_z127_gpio->reg_base == NULL) {
-		ret = -ENXIO;
-		goto err_release;
-	}
+	ret = devm_add_action_or_reset(dev, men_z127_release_mem,
+				       men_z127_gpio->mem);
+	if (ret)
+		return ret;
+
+	men_z127_gpio->reg_base = devm_ioremap(dev, men_z127_gpio->mem->start,
+					resource_size(men_z127_gpio->mem));
+	if (men_z127_gpio->reg_base == NULL)
+		return -ENXIO;
 
 	mcb_set_drvdata(mdev, men_z127_gpio);
 
@@ -161,34 +170,16 @@ static int men_z127_probe(struct mcb_device *mdev,
 			 men_z127_gpio->reg_base + MEN_Z127_GPIODR,
 			 NULL, 0);
 	if (ret)
-		goto err_unmap;
+		return ret;
 
 	men_z127_gpio->gc.set_config = men_z127_set_config;
 
-	ret = gpiochip_add_data(&men_z127_gpio->gc, men_z127_gpio);
-	if (ret) {
-		dev_err(dev, "failed to register MEN 16Z127 GPIO controller");
-		goto err_unmap;
-	}
-
-	dev_info(dev, "MEN 16Z127 GPIO driver registered");
+	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->gc, men_z127_gpio);
+	if (ret)
+		return dev_err_probe(dev, ret,
+			"failed to register MEN 16Z127 GPIO controller");
 
 	return 0;
-
-err_unmap:
-	iounmap(men_z127_gpio->reg_base);
-err_release:
-	mcb_release_mem(men_z127_gpio->mem);
-	return ret;
-}
-
-static void men_z127_remove(struct mcb_device *mdev)
-{
-	struct men_z127_gpio *men_z127_gpio = mcb_get_drvdata(mdev);
-
-	gpiochip_remove(&men_z127_gpio->gc);
-	iounmap(men_z127_gpio->reg_base);
-	mcb_release_mem(men_z127_gpio->mem);
 }
 
 static const struct mcb_device_id men_z127_ids[] = {
@@ -202,7 +193,6 @@ static struct mcb_driver men_z127_driver = {
 		.name = "z127-gpio",
 	},
 	.probe = men_z127_probe,
-	.remove = men_z127_remove,
 	.id_table = men_z127_ids,
 };
 module_mcb_driver(men_z127_driver);
-- 
2.43.0


