Return-Path: <linux-gpio+bounces-776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E90C7FF08E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3766282289
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7880A482E3;
	Thu, 30 Nov 2023 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zO8d/RkZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8911703
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:40 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b4c2ef584so7729455e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 05:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701351999; x=1701956799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDkm1mz5JKda1Ie70um5gnCumWIdGzqKbagKhi4Mqgw=;
        b=zO8d/RkZCozzHJ1jQKXdjSYznCbMIc23SHbSreyOKRFdYVhP+l2K2kxpdx5TeawVYM
         VObqZNzZkS73Kgy2UHewywsdJy3thgug3aq1ahTKAS2Oi61OSGMT8uHiliaZMkCBqGKH
         c/EkgFyKTTd878s3uk4QQTsN4e9IODJ/PNeZq24BOYkTKTyQYtJQExNUIUiCGvf+2tSo
         xdavwY5etTRVDax7kAnqhIAWMcrNnOQWIEyv/JuUXmRpPS6qHavUxpja+hqxJqokGvMP
         rnkdRhh4xz5psfSzzIlgywWJONcSfUzV2v8aoKx4MrWMERKU0/fYnxP8nCNj2vGPnRzF
         qJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701351999; x=1701956799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDkm1mz5JKda1Ie70um5gnCumWIdGzqKbagKhi4Mqgw=;
        b=qqmgIb4h1NqPCFC3zUj70ER7iz04TvJ660+Aus7smCDIdeIr9o4VFbvoEk5UbK6v09
         nSFr+fx+7r2UK+p8ZUW3Oqm/ICnOCsOxocwhYY8Zs3XyUAnJ4XIidd31A6Y+iUJk2ZyC
         PqIgFnr7CeMVX7B+Z+OLqhHZ99WMfjYfFGHQ3zOqRKwdHDp85MMcfqP3lijQlYlEE4Rx
         hACE5Cxzw675wbJil8XDJ7m22347vcUn/LkpEpK9HEnmg17PWeBfovtlb84OG4Hlg1pN
         0wuYhQpO1Yy22hP57gjQR6cVvfh0In5R1g6sgm7AcnpyA38YSkYaANM8+GQ3zTyah5s0
         hlKw==
X-Gm-Message-State: AOJu0YyPqO1raLD+YRanJv9bSzuxPY4h9TUzwJpGuRXEzvBePNgkcFYd
	KeeVUXevDpC8cHgcztp/owy14w==
X-Google-Smtp-Source: AGHT+IH1lRBcUubHIz93kQOurCo+8m3nu0EZoQalJ3ieURmwlYH3CSTv+IgoVsqKPZPB7xaOjJ2hAQ==
X-Received: by 2002:a05:600c:290:b0:40b:377a:2ac1 with SMTP id 16-20020a05600c029000b0040b377a2ac1mr15522069wmk.20.1701351998814;
        Thu, 30 Nov 2023 05:46:38 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae84:904:6602:ec1e])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0032d2489a399sm1574824wrr.49.2023.11.30.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 03/10] gpio: wm8994: use gpiochip_dup_line_label()
Date: Thu, 30 Nov 2023 14:46:23 +0100
Message-Id: <20231130134630.18198-4-brgl@bgdev.pl>
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


