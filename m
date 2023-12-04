Return-Path: <linux-gpio+bounces-939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBF6802EB1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7046B1C209D1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30B21C6B6;
	Mon,  4 Dec 2023 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ljxd4lxa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B71129
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:17 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40859dee28cso42303775e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682516; x=1702287316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDkm1mz5JKda1Ie70um5gnCumWIdGzqKbagKhi4Mqgw=;
        b=Ljxd4lxaABYVLm5r3bNebUdRcZtxU7HsAZEFdR96QAbM7e1hNKQj1EtX+pUTN+EwuD
         iGAe9iMDj04DS3BZmEYfJOi1L0Qf2cDa+7xVBmNu7tReD9E/DPgVqMgfdY4BOTk6y3BH
         lbLzn7xTUb7fqYdkEsAjzvRtD7y7sAQCklJG804yZUwDcky4MUewHbCueT0WkSfiRtKl
         WpEK7EzWFiEZKXPepYbtIC9ODhn+7vMVre1kDHMh10VtGPacar9tJW7Z7PPJj+XkYnBY
         EQ08mLPpOibOdMOXK9YTnx9wAExCsmFaqBYj9v5Hxj5amH3+6ORUgKxt090bsWqmNQk6
         pX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682516; x=1702287316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDkm1mz5JKda1Ie70um5gnCumWIdGzqKbagKhi4Mqgw=;
        b=mVor7jqmGgHxYyihDN7gQjy1Pztn9H+iEg4hLQV3dry6PIjs3yQwfXs4Jst7Wki5j1
         pDfk4+G6SLQMjBwsL8EKjULUj14rR+HSN8BjUJVGxLOlJ0Tu5ZPKeTSJeM04zph+5EKl
         oy8Nv9PyHFjvh6TtOdSrwduRQ5JVVkNpvdTRDb+B5GW+2CXvq/2zi5PgbeWJoXPSk9de
         RKO+5YoVptf397LlVZSvqTcrmatfVCfMthxOAe9Fg6h3RQiBGjo0p7pRPFRbvNH2zY/E
         zdm2ThcmmMA6hgpGIXqmCAsUptRhiFqHC74D7tHmdDCgE1aH0PInzwTPTN+3cSQ/gBsb
         9DfQ==
X-Gm-Message-State: AOJu0Yz5au3F6ANe8mgnzySXZ2tpcjhgp6aSN/Hqlzze1BIVmC5bUsFD
	SGqQREzsLnaOD0aLCL5kc04v0g==
X-Google-Smtp-Source: AGHT+IG8j6GgcmneGkekjMxaAVZAOQL5vjLVSjwSnVPrBrikm52pKL8RtyTbjt6kyLLQHmJwOHZ5/A==
X-Received: by 2002:a05:600c:a41:b0:40c:d3a:2447 with SMTP id c1-20020a05600c0a4100b0040c0d3a2447mr288453wmq.87.1701682516457;
        Mon, 04 Dec 2023 01:35:16 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 03/10] gpio: wm8994: use gpiochip_dup_line_label()
Date: Mon,  4 Dec 2023 10:35:02 +0100
Message-Id: <20231204093509.19225-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231204093509.19225-1-brgl@bgdev.pl>
References: <20231204093509.19225-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the new gpiochip_dup_line_label() helper to safely retrieve the
descriptor label.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wm8994.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index f4a474cef32d..bf05c9b5882b 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -193,18 +194,20 @@ static void wm8994_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	for (i = 0; i < chip->ngpio; i++) {
 		int gpio = i + chip->base;
 		int reg;
-		const char *label;
 
 		/* We report the GPIO even if it's not requested since
 		 * we're also reporting things like alternate
 		 * functions which apply even when the GPIO is not in
 		 * use as a GPIO.
 		 */
-		label = gpiochip_is_requested(chip, i);
-		if (!label)
-			label = "Unrequested";
+		char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
+		if (IS_ERR(label)) {
+			dev_err(wm8994->dev, "Failed to duplicate label\n");
+			continue;
+		}
 
-		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio, label);
+		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio,
+			   label ?: "Unrequested");
 
 		reg = wm8994_reg_read(wm8994, WM8994_GPIO_1 + i);
 		if (reg < 0) {
-- 
2.40.1


