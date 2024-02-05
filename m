Return-Path: <linux-gpio+bounces-2957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A36618496B4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3116B24FDD
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD28B179BD;
	Mon,  5 Feb 2024 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dWw4p9kU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD36E17BA6
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125683; cv=none; b=gIsaWPDg0+ZXjsvX9Qxt5ujDyNJvDR29AzjS2VO7oXIcbITHoRrX3TsC4m5GXFtB0vXMomuMtfhPjlXlFHFXtoIA0axrxahc0W7R5UD1j2qNGneXcOfzwVKBVuAypzaLiKM+TDn7ify03WYeGtXDqzAwC3omuYAjvQWyqEPPNqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125683; c=relaxed/simple;
	bh=eyC1HYM9++8jEVAFNoIc4hkrxl4iukZ0gJFO/TcS1lM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dvK9b2CMupT8qLdyBPXl34Ganc+snDPnvdfdS1nmJobHs1QWHd5oHh6Q92dXN9MT9n3TkmqvATmUo5NUt6gxVrASlbPTbQSCwWISMlNRUxnK3E6VxQDaXt8Tk6q4cU5nM2nhkDsBO+qm9q59sOLibnZXYCStH+9RQsKe1Wj8+W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dWw4p9kU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40fc654a56dso24711445e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125680; x=1707730480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fizk7gLi6MsEYz29o/FD8jywGHpms/n5O2KFkgE/SM=;
        b=dWw4p9kUydg9enHFOM/CVcIeJ9JZKRZI8F4CXx9Tu+UmvJIkt+3HRAVZyjR20U9q82
         vUY+biHeILC5MEA6AiszZI9UYZu4zPsUNX37UB2yOssBYZi6s1EOQ0JbnnhnsgUzOZYU
         HHkFQsDad0FggEoUsOskGFVTcFNDB8zXIetWAZouUustteGCSUFoy3Dg/h3H96TZU3kS
         4KgZeJLPs89LtA8nfEesb9CyPBW+cCmxSm/iyrLed3IxnmWhb6bBbfFttpC++Rd1tQJI
         QISmSimtjyHRcEIr2IPM2QhzaKbSqvWUJJdk42O790doGBYpWDU/en87UQk/P1I3+k2n
         Efag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125680; x=1707730480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fizk7gLi6MsEYz29o/FD8jywGHpms/n5O2KFkgE/SM=;
        b=E52XmlBR6DnMK0BOoLlWAHziJ6PmX5MgFP1b61ZVKoDqepehppie5j02KahAQDJof3
         NiSfKAJCvjM+P0jAun/azd7sqepImknMHp4GGd74nkHiFxvISR+eEAIPTJqGFYXNy93H
         xWa5ynR4MpuEkczXsCHL2Oz3p3/uKO4ff17/PjsIioW9Fz/sWjkAh5sKTFARSSqnZyYa
         WbN5x5fo5HHANu7V2qr+gqIY4mbD/bv1JSJmb+z+7oCZR6WV36hvDdbVm8ow+XI/4O1H
         1l9n69lQp4BhCMqvBWEDY1jX2dSm2Ndag8vt9jjmoxXehnfBwQ6M1EYWOHfCgqfSUTFA
         UYzQ==
X-Gm-Message-State: AOJu0YzNAiLdq5Il5JMlJ/MoTQOME9IpmuEreZqoL1okuJ7+jJ7sxL/R
	ReEbN6LWY/RWseqIPI0Bj7VZ756IiHu8ACaceRU49OVxR3YglK7Mjl16ji/rQL8=
X-Google-Smtp-Source: AGHT+IHs8NsEz1j8efT31ngqMa1MhlmQPpIvYA/AUkpcjmbj0I9bIIh8/Kf/eWarc0dkyZLPNEzXWw==
X-Received: by 2002:a05:600c:4e11:b0:40f:cb9d:bbea with SMTP id b17-20020a05600c4e1100b0040fcb9dbbeamr4038067wmq.0.1707125680144;
        Mon, 05 Feb 2024 01:34:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWBl3aOBWX59ah/FQPmhhvtdeqTvaVZ1j6HnJC4Kzm8kRil+MNUNO2s0OId3ecuwtYNrW+7WfwwrMoXstcfipbTh/MqkFaiCmePXRAX8x1QWvwgNHEPJC3JZvVnxdjP7xTaP45Dtc7SulEuda7FEDRL+b/VE8C9eUg9K7hXTSnJX864Q0/hMm2h5TQlII9ldj7hvZlDap/kw39/A7gkcU7LXRq3n9ZjtTWxkO9hIV81Q9hXw8lEm4XGJnKfQvvRmKdQGSD4LDpefXhYrcZLTCXtF8WxTHKhmg0/7J5FjozChL+1lhlvvBLaMSMpFAvGGSwpIs1+Q+r/LLHkwiOHKKVHNQcgjeN5oA==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:39 -0800 (PST)
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
Subject: [PATCH v2 16/23] gpio: don't dereference gdev->chip in gpiochip_setup_dev()
Date: Mon,  5 Feb 2024 10:34:11 +0100
Message-Id: <20240205093418.39755-17-brgl@bgdev.pl>
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

We don't need to dereference gdev->chip in gpiochip_setup_dev() as at
the time it's called, the label in the associated struct gpio_device is
already set.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f77f919dbad9..f8d53ebbf25b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -719,7 +719,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 		goto err_remove_device;
 
 	dev_dbg(&gdev->dev, "registered GPIOs %d to %d on %s\n", gdev->base,
-		gdev->base + gdev->ngpio - 1, gdev->chip->label ? : "generic");
+		gdev->base + gdev->ngpio - 1, gdev->label);
 
 	return 0;
 
-- 
2.40.1


