Return-Path: <linux-gpio+bounces-3708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE1861187
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 13:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DB20B247EC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 12:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FE57C092;
	Fri, 23 Feb 2024 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KEuiOcIt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1071626289
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708691561; cv=none; b=R8TQtpyqZ7pgKWHjiC6fMpu3fITglanjCE9eO5fOhF/QHJK5AOM3Op6CHG2olOCE42f657HD15a9UIBBdaWe8Dpvxp1JPPHAS0AF3QOUUjKC8DPN83zMZph0tfAzfYXwPZOxsTn74c/NWkfddfm8Q743SkcQkGnm0dU2DtF4lYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708691561; c=relaxed/simple;
	bh=MUlSFtWbj0V62A8/4308SD7hLIx+thz5BLA3ogEOGls=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K4a4z4kwxCbuTcULH2ip6p9dmKxJOIRyi/pxBBAQPH/HkTOxeo9Z6bQSTc4B2YJGgAXePi0sQVqdioyeqgJ7HQ3KLx0f9IoQQ6iIq2jHhRut0gh6NYscSDYqV/WQP23O3ab+LlO4VTFXIlqAXohS4ZgdxLV/5i5noE6TZapRxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KEuiOcIt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33d61e39912so467196f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 04:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708691557; x=1709296357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3XBcXMSN0Mpihz8EQIn8kaWsCSFp4YWsDMhO0GDawI=;
        b=KEuiOcItNoK9NuIBppunRA/2DJ9+lRsjrcvqVIY35QSm8cD5Oy1IRhh7N5kFDiPMtD
         Ko5V5Vq4+pukMLtLhgGibfyDrqD0TgNM9VFA20/NNeL2L5g/xUpWKEd4PCiHFnQBxRjX
         EQ/7nwadee7VJKBxpnPQiqSuaE5P45ySoaVss1A1peMoJcVhR9FkTcAGyW0v3zB7t2N7
         bzWHdG5pMsJjm0jU7XKV/MYxK+HrhZTuVo2TyAa2ybDxf8hzXeHYIqGjH9+JcFlFhKqz
         zJKlgHNfwGp5bHUtzo2qURR7JTuQlJFmQPa72DeMr+Xoam7W8dMBFvkpGPfbSs92gyWr
         +hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708691557; x=1709296357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3XBcXMSN0Mpihz8EQIn8kaWsCSFp4YWsDMhO0GDawI=;
        b=egUxvxHtDYKEn2Ag4O3DRWNJDOp5EJElRTpeoRK2/nkCw95zngU9ygB5YYeBjPYqzR
         XSAF9ZvU3PQsDwHaFVvs6c262A32ZLu0Bupr3z7VqXIKpnSo/sJ53/veJutmVu+yiurA
         3QErqtswtdeYVORrYxuEGBSTYLTBMXT1Nq3qG8c9xJHhxIqanJ24NHe+C0yZyQzcb769
         ZF2cjFtGcCcbaDqlZk82GUOjFMg3lGx0oH/JbI+8vy9U1Rqmt+qXpAbmadLR3saQzQhi
         d9OHYmVEh1uhdcYoOmWfp9g4WaHXzaffDYpMs/gkBobbqGjMw4OSh64S5X1cv0sDJOfo
         2nQA==
X-Gm-Message-State: AOJu0YzDx1RSwxcQ5msdd/6y8y0ZInG5O8J+cy8E+I41Ox9fxsNbo2Xs
	92htiMLkW1x+9eegE/GLy4+7aQ/n6QF8NUd+vTs6Tyb7ZoWm0FEtzyLbPknq7Fc=
X-Google-Smtp-Source: AGHT+IGRVMSzWXEwjmqzAHgBdVhX9n1oq/zJVahYOAHFXD6G2g0fq3+l/s9ieNqyASGlYY2rOq6msg==
X-Received: by 2002:adf:fc8f:0:b0:33d:5f6a:60e3 with SMTP id g15-20020adffc8f000000b0033d5f6a60e3mr1338445wrr.43.1708691557311;
        Fri, 23 Feb 2024 04:32:37 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d13b:cd88:628f:8c6e])
        by smtp.gmail.com with ESMTPSA id by4-20020a056000098400b0033daa63807fsm2124943wrb.24.2024.02.23.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:32:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	David Arcari <darcari@redhat.com>
Subject: [PATCH] pinctrl: don't put the reference to GPIO device in pinctrl_pins_show()
Date: Fri, 23 Feb 2024 13:32:14 +0100
Message-Id: <20240223123214.288181-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The call to gpiod_to_gpio_device() does not increase the reference count
of the GPIO device struct so it must not be decreased. Remove the buggy
__free() decorator.

Fixes: 524fc108b895 ("pinctrl: stop using gpiod_to_chip()")
Reported-by: David Arcari <darcari@redhat.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ee56856cb80c..bbcdece83bf4 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1644,7 +1644,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned int i, pin;
 #ifdef CONFIG_GPIOLIB
-	struct gpio_device *gdev __free(gpio_device_put) = NULL;
+	struct gpio_device *gdev = NULL;
 	struct pinctrl_gpio_range *range;
 	int gpio_num;
 #endif
-- 
2.40.1


