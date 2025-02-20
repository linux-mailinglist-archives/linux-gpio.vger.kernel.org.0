Return-Path: <linux-gpio+bounces-16266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 456B0A3D5A3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F603AE881
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D175F1D7984;
	Thu, 20 Feb 2025 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lF/40cZk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428D1F1500
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045448; cv=none; b=pHa1xrXQFJvPh7VyLVDp33PMmV6hlwNxcn/kJDttNju2g3AbV0Juibp96qtjhZOpma5NftOCI0Y4Y5EgsbZd55Ne/dAF2uNgrBPMSogiu0nRfh8FPkxW08CtC/s6YCCAHO/2alg9g6gyH8Bzn0Wk+PkiDLdHcpoaDkXHlfb/1Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045448; c=relaxed/simple;
	bh=/Ff+/OqEGQuwjPFFhcefFTdmHFXyIRq7IO5qzezURx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+OigZcYAxgSV33m2/US93VwkWuePYmxBgJCw6hhkY60Gw+2eJS9/8RiGIWanXcRNA8n6laiJN5HnCanOAB+oeHGM8ovBN6X5NY+Fi/JWMem5VuEMwnjrLubhEyzFsWQ/kwiF3ecJYdWpoMmtmG7xnQiJyHFe/hBkFAbttnVOI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lF/40cZk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso338244f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 01:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740045444; x=1740650244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3oFs5X1gZZFfJwu6ZVPPpOgjFQqYIa51CiYnHWU6rw=;
        b=lF/40cZk23GWXGP+Ozm7DdTACO5J/ft2/P4LX0nIddVVufDipr72qxEghOIXKc/1VK
         u5udNGTkjsjU22Lj+39Br68HGUuXB3+ZhldVq/S3oBDqf0Cu0Ku80GC/XYER0IuWXXWM
         mH0PpzAPc/TWQWVFRz1QNHL2LJqxgb+JuTTFD2v7p7euURrSrMerRL3PXCDkGAJ8AG3J
         dpieCf4sj40qWKvOV2OMqKzTsJqO6cG4OQ3lsMm5S6d98nTO+v379wgcTEYrMWKupGQ5
         rAIdx6du1fizEb9U8e8y3st6uCp0/eASfrVqUdpqBQNFgMyZCuptpi2kOnX75d6q9Jlo
         ZU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045444; x=1740650244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3oFs5X1gZZFfJwu6ZVPPpOgjFQqYIa51CiYnHWU6rw=;
        b=hRznUeCjQc+0wPkjznWZWGTwMgiihSFfSEiGnSYqUX5bE3StE14sG3qN2zeYVJJr1t
         NDnHoN6LPutxT+KVQ1w5LxFxGwDogCgYINmaWddX1RPqV0PFk+86/9kW3O8gO2aZDMx0
         IAmN/7EmiIqYwh3/BWegbB5OhOMuYmCTRvpXu+WQb4X0bkiQDK34Gfy8XZHQrvJ7YhP1
         ZhzPYX6IILyz4E0WwvrsYlBW0Unuvi8JHiiWPO3fPiuS48YrfK1p5t0UkLNYdAgEFuJp
         pLcVfs/Wu9WtMMsKzPKZZvy4Z5U1r6p4J+92iVx1cEf1/Tdbb6wTDQjvUxb+yVX3xliL
         AZlQ==
X-Gm-Message-State: AOJu0Yy+B5710ZA97AN7zQ9jcggIb+zbfJwY4cslGAgfVN1IMJMLvjLJ
	ZldQAY5M85AU6xcTE8AMOSd2xZRPl2QWsrE5kZuOFfZ6YHz1F+thpSi/qPQbATY=
X-Gm-Gg: ASbGncuNBaEbv6D4e2katK1v5oePr3w89iwhZTBMzhs/Xz1EEgQL5wJ4V7H61k7Aleu
	PDUxB1ZJbEiB37VG+Ks7Vf1ZMq1tuYQ3JP1vQiYELEcDFLcG8EVjsDgymBz1ClNfuskGMLFO4rx
	J7kXH2MYHL9clk/JT8nYsLqUYXW8YkkJ22CDUduUsZrVHYPzF7zp2KlTDCrVZEV5iQlYUUNS/1M
	bkM9mRPBrD0K2RuGA1AYffTrhB41Yx5GFJAkyKW84Az8s/MJLXuJ/G6kO2gFdlSYRuTPma4K149
	0/nOb8Q=
X-Google-Smtp-Source: AGHT+IG4koPMq4d/kWM7jjnrpRi9hoQupFNWVEn+zQLxJivAibFsoAtG2ivLHXahXFe6K8N/OdF6Ww==
X-Received: by 2002:a5d:6d81:0:b0:38d:d0ca:fbd5 with SMTP id ffacd0b85a97d-38f33f44dd0mr14690055f8f.22.1740045444507;
        Thu, 20 Feb 2025 01:57:24 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm20509174f8f.64.2025.02.20.01.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:57:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:57:06 +0100
Subject: [PATCH v2 09/15] gpio: mockup: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-gpio-set-retval-v2-9-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VSIrrAiqQMzfQ2RbViWZHWMw01hZZbPdlbrH76WUpQM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBntvx4NBRhTZZI2IRa0wAEudNdvd8vSNspG+iH8
 dtwq9oSmI2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ7b8eAAKCRARpy6gFHHX
 csvZEADWHatjtI8neovtNs1eGIVpjfWxIf7F+HiDhKB1vkA1LMogCSvwre1xJKttLVZslsCJP3F
 8yOYbXQAj/aqKBGC13mJ3yrxSeCapTZfQv5nZpDJvIGH608V4sZfgCcOHpxpblSTKlTFa0GRpYc
 XxMyMzEoC3wrk1CsRHJ9QLCxJrbzy4XfnaIB2fE+nQcp7IRMwFJx2zAyYmgaHEkHYDMywCK/oh/
 FnWJB08mBD4+33MsigaqIQooXsCqNGFOesCDbzgbXAL4TzTwThT/NduCRd/OiQDKFV8SWDxQkP8
 Zb7fiGHyBKyvfzXXhiiQkBxRBeKu9eRMmbyz1hmMwWItepl4bHqnfdMo3aXyC7Cu5BbQKmKQMAC
 9dYkrkiDmmfA4JIDPOl8PfXqCrjc0lAR0E1CbtfZxgO2tSvZO3Lumo5Sk68dq76dKim79LwG0GE
 8PLrgUDZ6TGEutIvsWTpc2TyK5VOlB6b98cVNsIfKtD3DVjbiIaQzclhTOHz6SIQntXNrGyuC12
 Bw7AfrGZSdOIfxEIRZVED3+StIZTF6cOE8t+9yhzmOYkEu0Yjv0/sMZRZ4JiIMqjLUxzjPoCKEt
 lGegrPH4EL6PrFla/7/Wx0WijYG5bG8Y7XbPiRGNuwDJYB//uXgd89WusYYRN/XzY/+aGBgKoge
 Im/j3WznzGNx+IA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mockup.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d39c6618bade..266c0953d914 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -122,7 +122,7 @@ static void __gpio_mockup_set(struct gpio_mockup_chip *chip,
 	chip->lines[offset].value = !!value;
 }
 
-static void gpio_mockup_set(struct gpio_chip *gc,
+static int gpio_mockup_set(struct gpio_chip *gc,
 			   unsigned int offset, int value)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
@@ -130,10 +130,12 @@ static void gpio_mockup_set(struct gpio_chip *gc,
 	guard(mutex)(&chip->lock);
 
 	__gpio_mockup_set(chip, offset, value);
+
+	return 0;
 }
 
-static void gpio_mockup_set_multiple(struct gpio_chip *gc,
-				     unsigned long *mask, unsigned long *bits)
+static int gpio_mockup_set_multiple(struct gpio_chip *gc,
+				    unsigned long *mask, unsigned long *bits)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 	unsigned int bit;
@@ -142,6 +144,8 @@ static void gpio_mockup_set_multiple(struct gpio_chip *gc,
 
 	for_each_set_bit(bit, mask, gc->ngpio)
 		__gpio_mockup_set(chip, bit, test_bit(bit, bits));
+
+	return 0;
 }
 
 static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
@@ -445,9 +449,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->parent = dev;
 	gc->get = gpio_mockup_get;
-	gc->set = gpio_mockup_set;
+	gc->set_rv = gpio_mockup_set;
 	gc->get_multiple = gpio_mockup_get_multiple;
-	gc->set_multiple = gpio_mockup_set_multiple;
+	gc->set_multiple_rv = gpio_mockup_set_multiple;
 	gc->direction_output = gpio_mockup_dirout;
 	gc->direction_input = gpio_mockup_dirin;
 	gc->get_direction = gpio_mockup_get_direction;

-- 
2.45.2


