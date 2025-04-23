Return-Path: <linux-gpio+bounces-19178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D72A9805E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D744414CB
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2157A26FA4F;
	Wed, 23 Apr 2025 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EUXrCIz1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46656268C66
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392534; cv=none; b=lgKL/rMEFfN/uH0379SwShK13m+Li9GEND6lDrM5SeZabqc4zgYMjS9qMhGKUJ1bAby+hZag/HQ8zHDg0AGAW3eyCPEOr1IJl/COlD7P52q7Rj4C11388wmSjTSiGNhJiie6Owpu6I1t3ouXfH1nUidAVFAODC5xMaj5iFYn54k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392534; c=relaxed/simple;
	bh=sl1wLB7qfa5cmKKEREVGzg9gBscjJ57jgLR48mBriYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYEZw94dstQBeIaRMkCTLP08JlL0VlFYQ5zUX4A7N7plxPLR7p7NMEUK3qO7eZMDFrl+RUyaDLws5TUQdP7y06W9+BKdGjSVh5G8bvnzqI7VX8ro3kJEbcDpdTHtZ71CVI6aol1O8ljg8yrmetmbyeCt1T6TSBuLn7zEp+C2v0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EUXrCIz1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3476382f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392530; x=1745997330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=;
        b=EUXrCIz1QczbbF8JGDvEMx8FQke4ZE25ZZJtrKL6vHnHd/TDwagaMyiGlf+8Mf4YoI
         SK9qJckfvV/IFPufgnXf3YRQ5aDB7neBR6KdtyeWzvgLSPRV3P2HHOGPqcWikfG6rzgw
         PaZ3HwzVWSiA3ZR0E5Wx5WGzjhLxPML4CrZSEsVk0ehfLmDYovnIpS8iOyR46BXNLc85
         FsOeJGsSYqPB3c+j0Pm1nrpN661niMxQppOYtDe2KPkRHZriVddMyOy5Uzx9qTdgz48n
         UB+HYTRuvQlYCJ/o+5W0t3qvrf7MfuoWS6bwvB/FKd2cXisIYe4pS50awrJaJbOglxLX
         3sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392530; x=1745997330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=;
        b=VQRlx9bEjflPy9nuXCfI2BChWuHiXlAem7fUiWtVorIB0zbU07uREDK+32EFoESPl0
         zKkRU9rQbbVxkvJaWJtRVRf8vVhNRIMgIm1n83taQdfSwJA03OuSbFCwQi8HqWnZH+Z2
         Eqnta0TwQUDZ2k89JgMMlBcrIpCRgHFlSTX3VtpvjOWIH2xSjGrbSpqYLH5DqGUL2OT1
         xcEOWgLxi4+e0a8X6RNJ08am/6WWsHc1+onSLd8pdP1Jb/rrdaGqcbDKR46sBhSVNd1h
         L7uCExDN2wutUQv+22iOiCJiMXZ/B94m/Wz6BKWylVQNTnRz/dS9IuaJ+qi7f47JW6JJ
         M+5A==
X-Gm-Message-State: AOJu0YzUABKESQX4G4k/9UG0fhzsgIsoBj1zE31krOrQroIfwLuDWg7z
	WejKRfKAengzhWb7zwMWnFzSlgeqmW6XY6nGX45ksw5lNB6Rp91n7ksN1vIIJVo=
X-Gm-Gg: ASbGncvL1M9G4VLVWA7hULJihL3efhLgOSs7gVU/PgUacb1CAmhLjKlxVDwLPRTmY3z
	6gBezBWsFKa9P1FXRBj7ex2d+ZSjBhcZGlDKtTZfjGOy9UIsTxodWoCb8AjR5Lh0rlon9x3zda7
	piBCamn4rBPo/8D04a9jdmbHOiS85T4MN50cvyaX27zDpbNlmT6oJcMvIyDNiSF23kD+oOxSIik
	28DGfw/pEUVWQDpRNbnhUvyi78E3Y+UNOXLiF3taf9/8HdolE3g/pruIoL0LL/nK+/xN7NQtI/H
	JbxHlmi6K39hu3W+VuG4fPOr6DXYO31YKA==
X-Google-Smtp-Source: AGHT+IG4ElSHC7IwlTsGTLIS8AFpJo6V3IEFvD0t8DPJXLGCbfVBAFrUXLFfWQ80OqkPgdRhHCCGkA==
X-Received: by 2002:a5d:47cf:0:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-39efbaf6f60mr15814842f8f.54.1745392528677;
        Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:14 +0200
Subject: [PATCH 12/12] gpio: lp3943: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-12-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FKv0jedtK8ZiOafLuePhziFUAqITUizBRiw5s9uuJh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJODsx6BmS5Uu3epYT6N1MlKACyMV3s6UBiz6
 5RntwZ/tcOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgwAKCRARpy6gFHHX
 ckvDD/9EH2Cq8MY5MoOXZTt6EMH1AEYUaKFr0FsHiSrhY9sp8VAZlwuAebQrfiTazzJ54yI1HAA
 zxk/F2yLuHJo5SxVJs7u6h+/0wf5MNJhKNr05ZJQdTzhn3M0KsE2MJDCzvf189nXA3B5BlBysbF
 KLaDTCGPJBGO9DjOm3BakFKHwT+YN53PZFKNlZkpjg2q9EkmGgondq0BFDC21gw5BDK8NCpBYwd
 YEYQ38fp/o/YGTlg4Dia8DPwYwmzI2mzyG7H/HnGGlWbqd/OqaHf4zx39t+kcKq6JQtdnn0s9SK
 1/SEkXmveDecJYUqkS7ckKP3EUD7nZcEReypoLwPhYn8Gi3veJVeEXns3Bfz9tnQororc28L1b5
 z+ZS+HTK2fV2O2HThQThzilNSepFKOq6Q23mFIiRnP7JpEKRRd27GgfknT6+xC6Dya2e4ZZ+KKO
 +UuGlTDBQFU48+cNeuJVfJYXNZroT6fbFjMpPUAZ0B/FU622qgWCjtX2Okt8O5bHdu9l88Xv2wV
 FHf/+EB8a06+atxP5WHtqCSfEv48CirSDeUCg1w+qeQicvBiJ7JmJKXm/u3OEGPAH3toIq3ktI8
 KTWWXlFIIUkIlVM15leFB/hrsHmBZgrOaLWx4zbAy8YNfAKZh4e3P9pPkKNRtXI58kWPncyMps6
 vqDvC+FesU7V9xQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lp3943.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index 8e58242f5123..52ab3ac4844c 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -147,7 +147,8 @@ static int lp3943_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return lp3943_get_gpio_out_status(lp3943_gpio, chip, offset);
 }
 
-static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	u8 data;
@@ -157,15 +158,19 @@ static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
 	else
 		data = LP3943_GPIO_OUT_LOW;
 
-	lp3943_gpio_set_mode(lp3943_gpio, offset, data);
+	return lp3943_gpio_set_mode(lp3943_gpio, offset, data);
 }
 
 static int lp3943_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 					int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
+	int ret;
+
+	ret = lp3943_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
-	lp3943_gpio_set(chip, offset, value);
 	lp3943_gpio->input_mask &= ~BIT(offset);
 
 	return 0;
@@ -179,7 +184,7 @@ static const struct gpio_chip lp3943_gpio_chip = {
 	.direction_input	= lp3943_gpio_direction_input,
 	.get			= lp3943_gpio_get,
 	.direction_output	= lp3943_gpio_direction_output,
-	.set			= lp3943_gpio_set,
+	.set_rv			= lp3943_gpio_set,
 	.base			= -1,
 	.ngpio			= LP3943_MAX_GPIO,
 	.can_sleep		= 1,

-- 
2.45.2


