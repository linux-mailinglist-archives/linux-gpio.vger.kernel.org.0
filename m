Return-Path: <linux-gpio+bounces-775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 613EA7FF08D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916B11C20E16
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9101482DB;
	Thu, 30 Nov 2023 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RzoE4DJW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F9C1724
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:39 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332d5c852a0so550802f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701351998; x=1701956798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Sv99NjQCF32QfqStrxQNV++EDXzWOND44xPhDEPFwA=;
        b=RzoE4DJWVF3W3nkJlOJRdv4+NmcgoXiLB+gg1BmbJAdSjXdO6QHD0KtdwJ+12Fl3My
         55WXpqcLmbIhqfB6EXiyC3TOB4t4821ZMjkrX2BgMv+g/RKT0pGNt4btfGBlA661c49i
         FWG4egQtdxheJcTMecL/3iHGJ2F1A1sf55X5HMWQdtzYxnvUyZNHOhC6YeX1Oq//Y8H5
         xAEmCuCmY6y/ndwSGq8O4w9WCzjyLssVqySoFOm4Hw/o6elLOYT3mx5hy9+t3+IkLrWJ
         0jtXDfm3avWCkFD/JE6oXDJz91f74VpKSPmW8XzyKygh1SgtzXazFW4CeZw+rW9VmLlA
         HcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701351998; x=1701956798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Sv99NjQCF32QfqStrxQNV++EDXzWOND44xPhDEPFwA=;
        b=eq//wHUTmEQB5NUAbhVG4V6U9Cu9eb8xdP4/fcMc3RSX3QsUBS55tfvmP1g9XsohbT
         l28/nPNR6s1qzzp8iSiUyutylJvL/675Gx8bRe7inciNsI369PmirqBduT38Kz4owP6g
         ADm0rwn/2DaIxl+ZQmxWZokE6bA+XnNbnTYfw2Lu1q39tfWhxIE2IcSZTB3a4b/wiUAa
         5PwUicDYI0ciAE5WHf/Jsmys9KMHqnLaljC1Dr7HUulgDMRWA5PV83oqHH65kFa6manU
         lN0phfnjpvc6fv47j+2m51NgsPw53UJZwFfzC15F9IvbtDxpqf/9V5EzYXU6JA2c3OgW
         E4Zw==
X-Gm-Message-State: AOJu0Yy4uX4AOjvKqTG98GqnSa8qhxfL0Yf3RboL4Dpz30cXxxNC3fq9
	nNeH/ceoReorgG4gMRTEvpJTJx3IZrfFMu7Mk3E=
X-Google-Smtp-Source: AGHT+IFFXiw8d4gEC87uJuGJeNe0IjCzYDScTUcvPWnXguWxDUdRf/gDmALnF5depRlp+rrGf1ryhQ==
X-Received: by 2002:a5d:6dcb:0:b0:332:fcd2:87fa with SMTP id d11-20020a5d6dcb000000b00332fcd287famr8728856wrz.27.1701351997780;
        Thu, 30 Nov 2023 05:46:37 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 02/10] gpio: wm831x: use gpiochip_dup_line_label()
Date: Thu, 30 Nov 2023 14:46:22 +0100
Message-Id: <20231130134630.18198-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130134630.18198-1-brgl@bgdev.pl>
References: <20231130134630.18198-1-brgl@bgdev.pl>
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


