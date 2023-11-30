Return-Path: <linux-gpio+bounces-765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A417FED0F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 11:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ABB51C20E02
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 10:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E3B3A295;
	Thu, 30 Nov 2023 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZxrGU0sS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AA010E5
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 02:40:29 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3316c6e299eso510771f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701340827; x=1701945627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWP4eap09zW919QW4E5s7jvXuCi8hDmjmiTB3wR4l3U=;
        b=ZxrGU0sS0PkdSYLgBM628TauRmP5PFsFUDH9Hl5Wth8tm5r60O5awrPUeVVLUlDxZM
         L0xIZNDXzh023kmOQ5xkuLgoIB3lEfVmSKYj5lfUZOgyVKdzvixhccLwsdyWrFjkKepb
         8ybOVzjB6YCjNe92y/3UHLSxwlgojc8Hl2Qs8jmjIvPC8Q/JUgorzOczpwIl1IFWGe/H
         8Qfa3gYOgRI5a233Tu7yScfCMVE6yasAHEuNogRZ37T0nlMePv8xo3SJ+AY0K6u9L7VK
         sOK2P1H6+5rpx+DEUSw/VbZIvW+u4FQvskvFzyDEUQMlhdU/VB/x8qF5ctc/Tq7ymnUV
         latw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701340827; x=1701945627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWP4eap09zW919QW4E5s7jvXuCi8hDmjmiTB3wR4l3U=;
        b=Dhwyk2/dmt2XSuqQ0skoUlpwrKGCir1yVGKzaawBswKx2ditdViunYZ8V5kmWrvOpj
         CXo8PvGJZEyApqBWXVeTM+IJg/4r7oEYPBno6vsCalRv3Nc3NiTprRAQ0OXFb5mXJX+x
         c3jIjMX95/ifyQONBujiW6BsrFm1jHJXkyOf0QANov2yHlvQG/Hvu0n0jogCh24M2nQs
         hT+rZnNjZwuQbK4ZDnNVIwOVvjFR1xuk5NnuO6Kt+LQ1RwMFrG+majdR/L7BSFZttyWU
         hEYu+UTJrITwi9QF3fOrKz7cKQXKB+p450/hicTKL4DViPJZHHF2YbrQ0YFArnowd+Ha
         pRWw==
X-Gm-Message-State: AOJu0YxMtkKVkVdRGGu3iKWCr/0XHhD2nBaUSZnZTZzYhTbRbRLM4ej1
	Mmo8oyBPi4Ld8sAr++pd7d8+QrO++RJ9VOWHbYE=
X-Google-Smtp-Source: AGHT+IE32JyZOdFjeoOQW/D6eZambqTnRGbi7npeYSK8ldqD1D4UVoDOQSEAYAn+Joi6xBQuKfh/bw==
X-Received: by 2002:adf:eb08:0:b0:333:635:c9b3 with SMTP id s8-20020adfeb08000000b003330635c9b3mr7698737wrn.16.1701340827266;
        Thu, 30 Nov 2023 02:40:27 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4bc8000000b003316b3d69b3sm1161545wrt.46.2023.11.30.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:40:26 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sim: implement the dbg_show() callback
Date: Thu, 30 Nov 2023 11:40:23 +0100
Message-Id: <20231130104023.11885-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a custom implementation of the dbg_show() callback that prints
all requested lines together with their label, direction, value and
bias. This improves the code coverage of GPIOLIB.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 1928209491e1..f60b0988c4db 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -28,6 +28,7 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/string_helpers.h>
@@ -224,6 +225,29 @@ static void gpio_sim_free(struct gpio_chip *gc, unsigned int offset)
 	}
 }
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+	const char *label;
+	int i;
+
+	guard(mutex)(&chip->lock);
+
+	for_each_requested_gpio(gc, i, label)
+		seq_printf(seq, " gpio-%-3d (%s) %s,%s\n",
+			   gc->base + i,
+			   label,
+			   test_bit(i, chip->direction_map) ? "input" :
+				test_bit(i, chip->value_map) ? "output-high" :
+							       "output-low",
+			   test_bit(i, chip->pull_map) ? "pull-up" :
+							 "pull-down");
+}
+#else
+#define gpio_sim_dbg_show NULL
+#endif /* CONFIG_DEBUG_FS */
+
 static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
@@ -460,6 +484,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	gc->to_irq = gpio_sim_to_irq;
 	gc->request = gpio_sim_request;
 	gc->free = gpio_sim_free;
+	gc->dbg_show = gpio_sim_dbg_show;
 	gc->can_sleep = true;
 
 	ret = devm_gpiochip_add_data(dev, gc, chip);
-- 
2.40.1


