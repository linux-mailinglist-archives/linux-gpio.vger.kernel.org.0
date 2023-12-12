Return-Path: <linux-gpio+bounces-1304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459E80E97F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 11:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EBC8281C3B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 10:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0935CD00;
	Tue, 12 Dec 2023 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JVM4mkS1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5BBAB
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 02:55:07 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so31507835e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702378505; x=1702983305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Xt7zxPEL8s4LsBKOkLuKnVLrdFFEGGYWcjy48Nb20=;
        b=JVM4mkS1YAMWnOSQTT49O9Bm9F9UWfXqhTQZg8okXqblVsqO0hb+FqrQSrSlh/B1CF
         tcDnaa9LRx7NGGTkdu7xNJnQxq75Kz1uqnkGV5cb8Sdt28zCsYB8OLr3LT1mW3NEdhrR
         rS84w1fqVxeg85NVgqjVhqHI6LKm5CZw/JdM4KFNyC5MAUYiy6H5d3BIgltnbQrjHfIx
         s0ToHjRgCHIx1oWtiiwVTtRF4GWPTz0+EH//kkzZQL+X9A6eZw/HbdUYDStRVrpBbmgj
         am6W/zuBnEIUPyBoMFgEnm0eDgOd7wgG6yj4A5TD1NsS/VA7bGlA5+cGNhfg+g+Z5scs
         Ssmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702378505; x=1702983305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0Xt7zxPEL8s4LsBKOkLuKnVLrdFFEGGYWcjy48Nb20=;
        b=Fp3zWUz2/kTId7rw5OFrVYtVy5R/5Tm3j/g8OF6z0xHWv2gx4uReYwrIa3uMa1MkbF
         IQ1nQiRmDBo+maUjKbK80TEPI0Nhj40M6cGySKndIEBIoHXfoDDHMOLJM45rPMDigMd/
         DTD9zHWgy71y2s1CmsjnlGYFvnW5fqGAVyzwf2KDzXAcFspA5H8TrkPZDTjXs1aXPx04
         LLNPEDw8GHSYvCZIkib2v7JJjFGG4HHDuWOGjNvB7LKqRgycFWtiDMGTBcLKKPFZ7Tnc
         PaGmBLhmA1ITEjgNhQBEDcz6XmZIg45qQDxBk4yd3yEkfVCvXUlVXlRhq7vexSCfbMbP
         JLtg==
X-Gm-Message-State: AOJu0Yzi0pfxWa3GWC++EH3YxF/c8/guD9f/E3FmBJXjORU3jbXLzpyb
	QP0+MKmJnSZFcLAkLnj7yeBoYA==
X-Google-Smtp-Source: AGHT+IFXFxG/L09PQonA/L5L/pxR1H1tPqmqy2j9ak7QzMVswR00U4207WU+yB6yLwzwSSQMBQQvTg==
X-Received: by 2002:a05:600c:358c:b0:40c:2a41:4a3c with SMTP id p12-20020a05600c358c00b0040c2a414a3cmr2892381wmq.146.1702378505435;
        Tue, 12 Dec 2023 02:55:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1012:9edc:5109:e70f])
        by smtp.gmail.com with ESMTPSA id c4-20020adffb44000000b003362d0eefd3sm1132122wrs.20.2023.12.12.02.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 02:55:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] gpiolib: allocate memory atomically with a spinlock held
Date: Tue, 12 Dec 2023 11:55:01 +0100
Message-Id: <20231212105501.16347-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We will eventually switch to protecting the GPIO descriptors with a mutex
but until then, we need to allocate memory for the label copy atomically
while we're holding the global spinlock.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-gpio/62588146-eed6-42f7-ba26-160226b109fe@moroto.mountain/T/#u
Fixes: f8d05e276b45 ("gpiolib: remove gpiochip_is_requested()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4e190be75dc2..6efe44570333 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2399,7 +2399,15 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 	if (!test_bit(FLAG_REQUESTED, &desc->flags))
 		return NULL;
 
-	label = kstrdup(desc->label, GFP_KERNEL);
+	/*
+	 * FIXME: Once we mark gpiod_direction_input/output() and
+	 * gpiod_get_direction() with might_sleep(), we'll be able to protect
+	 * the GPIO descriptors with mutex (while value setting operations will
+	 * become lockless).
+	 *
+	 * Until this happens, this allocation needs to be atomic.
+	 */
+	label = kstrdup(desc->label, GFP_ATOMIC);
 	if (!label)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.40.1


