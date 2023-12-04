Return-Path: <linux-gpio+bounces-938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121D802EB0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A7C21C20A22
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91F31C2BE;
	Mon,  4 Dec 2023 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i95wUyLN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCF111F
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 01:35:16 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b2ddab817so43087925e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 01:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701682515; x=1702287315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Sv99NjQCF32QfqStrxQNV++EDXzWOND44xPhDEPFwA=;
        b=i95wUyLNLZz5CTbGL8et8CKZjeP/avgInNMQvRUmE2P7Q5VDwnQvS675+d82tsyeBb
         PNl1qqSMK/Ev0BJbfhMauF3cOLd+m9dGGIzFca/BImEP0u5tTAeWP1e1XO/was82QZOl
         jLpSvp/fF0Xup/1p8u9SV2Aa4fiTMPC049o5gwM7+M3NyVpR62gldJCFnXGvXZOy0g6G
         Ywqlh22KyGpALjvdp0q7VjFR5E1XZI5hqK8vYii/U/j5uMxGphy/kCwhh1I5VCj7P19L
         b9K3gZWXcm4LzAUmubW38meDcSM0s02wj1XgszPx9BJlHMar4+u4A4nj6vI825qRutkt
         wOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682515; x=1702287315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Sv99NjQCF32QfqStrxQNV++EDXzWOND44xPhDEPFwA=;
        b=OmR6ZL+muExmjlqtFbAZukL1FDCDa0C1SCBYpfIsqqP2nrQoPS7wiwxeS4eR3TdmXm
         AOkjgbQzO4dfI94kNBgdHPzwPlNA8fBimbbydx7Cop+2X2nCstB3PVJCS66MGJqBGcbp
         yNlfrawstE3mJLbriwzojcr2oMjoDafyuMiA8Zxh2JmVFjz3VyPQ4YmkuVNSu1uSv3Jl
         21tRcCw9rJCHa9oAcyf30OOg0ux254xpsxU9O3mgxzrkLCJ1KAimZdNMvz2WEds13GZR
         8ks3cT7oAagQoDXytiqpa5HkOUNvWivrgzIFqkCtsYxLQWX0GGhOQez/DbvS0ShTcpDH
         GBrw==
X-Gm-Message-State: AOJu0YzXxlzQsvOOTCF3qe3yXHUwx9+t5Cr/wCNWnEnBZy2fN5XLn4Vb
	XEAWWtjI878UClP9F51sXUi5nQ==
X-Google-Smtp-Source: AGHT+IEkT16aKATtFm55qcW57SlcB1x4wElzEN+uRylbf+NHozoN4a3+LLiRLsuohCIJmlgWa1OL4A==
X-Received: by 2002:a7b:ca49:0:b0:40b:5e21:e276 with SMTP id m9-20020a7bca49000000b0040b5e21e276mr2343776wml.99.1701682514585;
        Mon, 04 Dec 2023 01:35:14 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id fs16-20020a05600c3f9000b0040b48690c49sm14266219wmb.6.2023.12.04.01.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:35:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 02/10] gpio: wm831x: use gpiochip_dup_line_label()
Date: Mon,  4 Dec 2023 10:35:01 +0100
Message-Id: <20231204093509.19225-3-brgl@bgdev.pl>
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
 drivers/gpio/gpio-wm831x.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 7eaf8a28638c..f7d5120ff8f1 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -160,18 +161,21 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	for (i = 0; i < chip->ngpio; i++) {
 		int gpio = i + chip->base;
 		int reg;
-		const char *label, *pull, *powerdomain;
+		const char *pull, *powerdomain;
 
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
+			dev_err(wm831x->dev, "Failed to duplicate label\n");
+			continue;
+		}
 
-		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio, label);
+		seq_printf(s, " gpio-%-3d (%-20.20s) ",
+			   gpio, label ?: "Unrequested");
 
 		reg = wm831x_reg_read(wm831x, WM831X_GPIO1_CONTROL + i);
 		if (reg < 0) {
-- 
2.40.1


