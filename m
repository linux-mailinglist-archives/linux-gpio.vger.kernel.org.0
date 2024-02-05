Return-Path: <linux-gpio+bounces-2963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 547B28496C0
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 878411C252DF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60E91B812;
	Mon,  5 Feb 2024 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lHv8qbOz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEB01B944
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125690; cv=none; b=JoUWhdi7qIXKSESM6GcLyFPGhySeyDZY/SzB7nLUz57GAPx9fVXNHagA8k7+MNAG4iY4+FSFxarSfjUHfDCrGS31NqwXDqzxh9facBC5ZDksExG9kIEWhyPu5frIQge4vXNGLVjZWc/6332pEspL+70lYfyj6PG2iW1d7rW1i20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125690; c=relaxed/simple;
	bh=CiYSawPebEql0iEz39lQ3pUTtJzpFVAjWsd3kTouEKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YyB9bDhbQBzHPPJk/OAjHqXM4R/8zQiqrZjn0Xg/d7gdtgBzJR/EExYV7W8CR558TddxsmJGyundhQnAabNSrMpgfRR5Eyks/o6OgItpMyhSg3CgTIkXjeyKZJfDBuBLjj6aPnT8wxlPkA6m6YJ7fe9eqxpIlBpBYQ/PbmxL7Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lHv8qbOz; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5112d5ab492so5538738e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125686; x=1707730486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuD4jOVymyzS+IMUJo9eXlxxJz0pfH/DcmsAoXHdB48=;
        b=lHv8qbOzq2mTAPK7Kz9abzgZmMscc7YNlJf/fLpSSC3dCYHpTBuHtWRdKb3BkB2D7m
         rScQwt6Q+U1MPsQaLb7/XmBesEJy/c185vg42b9CWPdPys/n+UyRai1pMHAS1lLKvHYx
         Xoht/0vox05N192vamLBMsNICfFYJT/UpUSZY3aYWmrxpAFu0sg1h1Q0UEiJbhhAesz+
         oyqdMQY371RSC2mg5nEaHFncFJ3bmHM6JRcAlGPUxaDpiKIcsHUa4hou/4wPnM/CxlAq
         yM9sN4dJft4ZUHRtyoRA9fglh7tBTIi7Ywaz6N+l8hQO6ZzRA2HM2qvM1VV43ZCifSIB
         qBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125686; x=1707730486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuD4jOVymyzS+IMUJo9eXlxxJz0pfH/DcmsAoXHdB48=;
        b=unAm+zYrRUVprOXXYlpI/aTGVI7//TGSBT9cZ1bCZpsjobx0/Br308k6sE1359bTa5
         i4NJAQLseMpwW+P4FHSFoOJLZSB0k3dKDxq6cLvi4p4XL8rJKF2dg2kY8qHswQcf28HT
         h3gqG23cH97cqBsnHogB+XBB/e5MShYkY3YiP4T8MNKHws+6nTcNehBvLc+ARNo0a9v+
         UKo51CgTAzpBCG0v0zf47zmANaIGJABX9nUrLAr1KmC7k1oVnaHn9EBpo/x9TL/mrIHx
         gvDgJv93f/jVfb+7Ko/HPZtlKwm4AgHjSZWCW9Zt7DJe5DE8aN3g4Dm0Cp6vakXGBLKl
         223A==
X-Gm-Message-State: AOJu0YzLqkYOWX7X+cEVZOhiuriV5PA9XF7y6IOkBZvoBNC8QrKbjvVO
	5FGuuq912PUqB1VOpGykhz2Ioej1AeOdx5YHtRlWUHBD4pfoT8K5QI6n5TWTR1Q=
X-Google-Smtp-Source: AGHT+IEPB2Je0SCogU+2gBiEiwjBglfb7KBSZJDiXKT4w6QPedNh07U5ZXtAspIFMe6Orcy3j89JkQ==
X-Received: by 2002:a05:6512:220b:b0:511:4df9:1949 with SMTP id h11-20020a056512220b00b005114df91949mr2488688lfu.41.1707125686310;
        Mon, 05 Feb 2024 01:34:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWTnt8FacEOq6jarDsKcu1MJgylOwFHQHyWfITCiQqSjZiNyiEEjTGyq/NHvbkGJ3OF/qrhyzqtMkON24A487SywNaoeMRpos6ffiHwIOw1HDtvNu1tmdtUS9SZP4piE/w0mjapU5+tBc84QAizizuLfpQb53U1YBDSpAMVbRWEbZYr99rZSCsyrh0LGbWsKTN1oEOTuEe4fYLSuz29qg1BwcmZ6zv4xAXNq3ozMHNuj7Tw+bgNrvAa6At858h1RHQC9d1ymtd2hS0xMWg943JNQSS6jdHVJMB8vQm/xfRvMmZMyb3Lejqwb373HK7T99A3s3nlDyg7gNIxr5oVJcchmSTrWDWAiw==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:45 -0800 (PST)
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
Subject: [PATCH v2 23/23] gpio: mark unsafe gpio_chip manipulators as deprecated
Date: Mon,  5 Feb 2024 10:34:18 +0100
Message-Id: <20240205093418.39755-24-brgl@bgdev.pl>
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

We still have some functions that return the address of the GPIO chip
associated with the GPIO device. This is dangerous and the users should
find a better solution. Let's add appropriate comments to the kernel
docs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c7b039398e0d..dc00eeed6253 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -211,6 +211,11 @@ EXPORT_SYMBOL_GPL(desc_to_gpio);
 /**
  * gpiod_to_chip - Return the GPIO chip to which a GPIO descriptor belongs
  * @desc:	descriptor to return the chip of
+ *
+ * *DEPRECATED*
+ * This function is unsafe and should not be used. Using the chip address
+ * without taking the SRCU read lock may result in dereferencing a dangling
+ * pointer.
  */
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
@@ -275,6 +280,7 @@ EXPORT_SYMBOL(gpio_device_get_label);
  * Returns:
  * Address of the GPIO chip backing this device.
  *
+ * *DEPRECATED*
  * Until we can get rid of all non-driver users of struct gpio_chip, we must
  * provide a way of retrieving the pointer to it from struct gpio_device. This
  * is *NOT* safe as the GPIO API is considered to be hot-unpluggable and the
-- 
2.40.1


