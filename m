Return-Path: <linux-gpio+bounces-2756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3884256C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0393D1F2D2D8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84020128377;
	Tue, 30 Jan 2024 12:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OHJjwBYU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA28786AE1
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618939; cv=none; b=jU9kfTlvmrmdMQHyFvoGo6/Yv4KXvp16C1sDMJHgu64voE3PN6fyl49GPUYAgP6/Ak/qozEOadYF7A8fgV4hJcw+bAXjNGPESCOXnmoEASDduB8pFRSrckP3/+Pn5Ozpa5JBhWPbhjzsG2BWCbgYraAmqSPBMJoXOcTZbxB4eFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618939; c=relaxed/simple;
	bh=rCYeX5n7NqvUrv+R10qVmknBqfvICmkDgzC01rCJba8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T/AI6Ibz9KiYSv18dWAEha2qiz/57anhDt/P3nm03a6WQaEu9mHm3AsNXzscHgWvI/A+vthXcOldLHCOdA8gRbN3SbP0uFiyulr+CxkIM90X+rulsJ2FqGEwbu/IZBXumdXbKvrO9izhJVHgn5Z/xl992KUdiFxQ6ji9DWKVru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OHJjwBYU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ae42033e2so2266109f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618936; x=1707223736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCqWcvsch8PGprpl/SRJm/nQoksVNS4csoU4RAlMWDk=;
        b=OHJjwBYUA9qR7dWkbST21ZSjePzWyqhJFsxfccUVy7q2Z1tjjQudkpXogdx7nhPg55
         HwU83tJIaw6FqTCXB1M0bBzzsU6AaxSwz08koV073Vib7oyHKc3BrLpvWxVnnD0RZksy
         o1izD0KV1tKG1xuyjK2GFe4KD8t8DLEE2zpX2qGK9iy86Kju9nb9GmmWQcMzBtq02t70
         GUUCV+AgqG2g/DX10wpPaGfxWc/nFokH6v5pG10Y3bQfULpApRyP7SgJvuMVGt5wiBtY
         B1t1pl7JEHvcCIB9Czvr0r3PPCwLVOl8vAavyexPuROwDuGXyipurc4+ghjnmwC4QwH8
         EcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618936; x=1707223736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCqWcvsch8PGprpl/SRJm/nQoksVNS4csoU4RAlMWDk=;
        b=RD3zJ83krxDqDRzG1Nv11diOjZcmXxZcIpalk+4l/R9TVkZPTg+WuRT326WGlPw7gc
         lqEIH9Uklbb0TgdHDbzz+eU/+C5TFXgHd4QKYYbxILODwtG4HyFN6BFvt5t9DiQsVu8x
         c7IWJBhfKtuvAyL5D2RdoaDsuqFXQDv3HYOTTlcbTiKsIjSKzW/uv+px81ZJ+MP3nH1C
         ZY6Of4ecRn9bXh89z0E7fUdPYFOLRipLmb8u36coLLpj3gtbqOe7kbrrQxebh4qIo5c/
         8fhv7uyDgEiHSY6rePPXpsjr1NCfA8bxPIZYAnhmpCzhj5L4d5zX4zDoxK2xG8VuedPF
         1wMg==
X-Gm-Message-State: AOJu0YyMxvYVmfxXFfZcw1NuEc5z71jRijQ+1VoGQvXQxoqOgP5uEryr
	J+rwMTsBj1kMzH3l3mWRayLfy7NKsnhrZaIWdnv+qprKPPyzPgVc4lyoXQaNrXA=
X-Google-Smtp-Source: AGHT+IFbohwdJbNKZ3tDtnEAeXSLNIGKE4qgI4wOPcEjk3GtJoUXRj33dhBmaWCl38TD6nxylGR+5g==
X-Received: by 2002:a05:6000:1ac8:b0:336:6377:6e3d with SMTP id i8-20020a0560001ac800b0033663776e3dmr4450457wry.66.1706618935836;
        Tue, 30 Jan 2024 04:48:55 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:55 -0800 (PST)
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
Subject: [PATCH 18/22] gpio: add the can_sleep flag to struct gpio_device
Date: Tue, 30 Jan 2024 13:48:24 +0100
Message-Id: <20240130124828.14678-19-brgl@bgdev.pl>
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

Duplicating the can_sleep value in GPIO device will allow us to not
needlessly dereference the chip pointer in several places and reduce the
number of SRCU read-only critical sections.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 11 ++++++-----
 drivers/gpio/gpiolib.h |  3 +++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e6b9f1c82a7d..9548c9e53197 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -893,6 +893,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	}
 
 	gdev->ngpio = gc->ngpio;
+	gdev->can_sleep = gc->can_sleep;
 
 	scoped_guard(mutex, &gpio_devices_lock) {
 		/*
@@ -3063,7 +3064,7 @@ int gpiod_get_raw_value(const struct gpio_desc *desc)
 {
 	VALIDATE_DESC(desc);
 	/* Should be using gpiod_get_raw_value_cansleep() */
-	WARN_ON(desc->gdev->chip->can_sleep);
+	WARN_ON(desc->gdev->can_sleep);
 	return gpiod_get_raw_value_commit(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
@@ -3084,7 +3085,7 @@ int gpiod_get_value(const struct gpio_desc *desc)
 
 	VALIDATE_DESC(desc);
 	/* Should be using gpiod_get_value_cansleep() */
-	WARN_ON(desc->gdev->chip->can_sleep);
+	WARN_ON(desc->gdev->can_sleep);
 
 	value = gpiod_get_raw_value_commit(desc);
 	if (value < 0)
@@ -3357,7 +3358,7 @@ void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 {
 	VALIDATE_DESC_VOID(desc);
 	/* Should be using gpiod_set_raw_value_cansleep() */
-	WARN_ON(desc->gdev->chip->can_sleep);
+	WARN_ON(desc->gdev->can_sleep);
 	gpiod_set_raw_value_commit(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
@@ -3398,7 +3399,7 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
 {
 	VALIDATE_DESC_VOID(desc);
 	/* Should be using gpiod_set_value_cansleep() */
-	WARN_ON(desc->gdev->chip->can_sleep);
+	WARN_ON(desc->gdev->can_sleep);
 	gpiod_set_value_nocheck(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_value);
@@ -3462,7 +3463,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_array_value);
 int gpiod_cansleep(const struct gpio_desc *desc)
 {
 	VALIDATE_DESC(desc);
-	return desc->gdev->chip->can_sleep;
+	return desc->gdev->can_sleep;
 }
 EXPORT_SYMBOL_GPL(gpiod_cansleep);
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 9b7afe87f1bd..43ff4931e2c3 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -34,6 +34,8 @@
  * @descs: array of ngpio descriptors.
  * @ngpio: the number of GPIO lines on this GPIO device, equal to the size
  * of the @descs array.
+ * @can_sleep: indicate whether the GPIO chip driver's callbacks can sleep
+ * implying that they cannot be used from atomic context
  * @base: GPIO base in the DEPRECATED global Linux GPIO numberspace, assigned
  * at device creation time.
  * @label: a descriptive name for the GPIO device, such as the part number
@@ -64,6 +66,7 @@ struct gpio_device {
 	struct gpio_desc	*descs;
 	int			base;
 	u16			ngpio;
+	bool			can_sleep;
 	const char		*label;
 	void			*data;
 	struct list_head        list;
-- 
2.40.1


