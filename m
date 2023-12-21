Return-Path: <linux-gpio+bounces-1793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E981BE8D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 19:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63D761F24C93
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 18:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E8565194;
	Thu, 21 Dec 2023 18:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qvgKvBWV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AD664AA1
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 18:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d31116dbeso12411745e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 10:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703185034; x=1703789834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ez827Nwv0PCJp7yHRGpscI+PcE4XwM2uw7IbXMXl5M=;
        b=qvgKvBWVreZP4ptG+yOSgyuE1TFvcA+YCN4BTK5biADBd6x6p56gUp92DKl3UlzfmW
         J618miRJe6oxxdS9iUGgDJ6PnSjJ2wI5nDsqtD7Yuk4VyAAY5pG4pmPBhNbKdwGCx7Vg
         j4smXPG8+YZffONKuiAlNUFBYfMAiRk+rtlD8R4kckrOv7t/g76kTmEJLw0uF14cqDFq
         OA37br+y/NaeAqUwf69oTmB584yB0mY8hzLaYCOteQoAFKzV5/G7V+ESJQHvyBYK2W4p
         TZ/Ht9hkZ5haEOn+AB2JabYtO/UJiqJwSohaeUKtlPPSr7+qcDD8DWqofjoNwP8LDRVL
         E7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185034; x=1703789834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ez827Nwv0PCJp7yHRGpscI+PcE4XwM2uw7IbXMXl5M=;
        b=JZJLK100PkYYi8LeU6PAcsKwKsTjJkZQ9M4JSRLWvDU6TvU/GrHVfSBaDhHAFJT3gX
         wemNpUh5RvqtDEoo9eijeHTX1iIiLeiCYG/M7vfjr4pIyIVbeyGh/ZtRDASW2wrg905y
         ycHdV+GFBxTT5sjmLRLhPXMSeCRr9rK9giwVi0r+sKrKPGoQuJZRo1H1jCt0nof0ioBB
         xA1tUmKoeWf4JaEUeYZ2yzoqv3ctElt14h8V3I6ktBMbSqBEs4SX1hu5YF5EFrtBb7ys
         To05gUeaprv68G+ehQVXf70GQhSRyL735J5ctCtAmXUaJF7Am1WF9hAcinsQgMTIA1fB
         w27Q==
X-Gm-Message-State: AOJu0YzRCzi7N1hj4JbUfzXkd9ZHuGPJsx06iphGq8OUhJ+P3qruiLz6
	ibNRfRwWl1n7iOQ8B0ClYQeCqFVwpAHpBQ==
X-Google-Smtp-Source: AGHT+IETlTI6wAfVOp5F4c8392SkTN9zkl2x5ytVqBeSIDMi4vkgq2+YYf6CeXrpzwk1bjBp9KY+oA==
X-Received: by 2002:a05:600c:a42:b0:40c:3905:51e4 with SMTP id c2-20020a05600c0a4200b0040c390551e4mr101519wmq.68.1703185034624;
        Thu, 21 Dec 2023 10:57:14 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7701:a2c3:cba4:74db])
        by smtp.gmail.com with ESMTPSA id u4-20020a05600c138400b0040c03c3289bsm4277125wmf.37.2023.12.21.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:57:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: tps65219: don't use CONFIG_DEBUG_GPIO
Date: Thu, 21 Dec 2023 19:57:02 +0100
Message-Id: <20231221185702.24685-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

CONFIG_DEBUG_GPIO should only be used to enable debug log messages and
for core GPIOLIB debugging. Don't use it to control the execution of
potentially buggy code. Just put it under an always-false #if.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65219.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 7b38aa360112..cd1f17041f8c 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -96,16 +96,16 @@ static int tps65219_gpio_change_direction(struct gpio_chip *gc, unsigned int off
 	 * Below can be used for test purpose only.
 	 */
 
-	if (IS_ENABLED(CONFIG_DEBUG_GPIO)) {
-		int ret = regmap_update_bits(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG,
-					     TPS65219_GPIO0_DIR_MASK, direction);
-		if (ret) {
-			dev_err(dev,
-				"GPIO DEBUG enabled: Fail to change direction to %u for GPIO%d.\n",
-				direction, offset);
-			return ret;
-		}
+#if 0
+	int ret = regmap_update_bits(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG,
+				     TPS65219_GPIO0_DIR_MASK, direction);
+	if (ret) {
+		dev_err(dev,
+			"GPIO DEBUG enabled: Fail to change direction to %u for GPIO%d.\n",
+			direction, offset);
+		return ret;
 	}
+#endif
 
 	dev_err(dev,
 		"GPIO%d direction set by NVM, change to %u failed, not allowed by specification\n",
-- 
2.40.1


