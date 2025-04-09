Return-Path: <linux-gpio+bounces-18547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942AA82066
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BD8D1BA26B6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FB725DCE9;
	Wed,  9 Apr 2025 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a7DwWriq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB2425C70E
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188057; cv=none; b=Yz9Lyh4KxjjdgyWFnHFIPGxqJc3uyrGV/XcsBPMaQildchDnx2dkyxefe7XuXTqA6t9HxaiyggdLOg8DJRqBbvdFPiQOQGChTjJYDtEfdirFl92LcTQedqKNeMyp/ZFrAzlOlNrS/oPFcWG/NcKFfT4N6L7TcwxKJ4i1RMB4/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188057; c=relaxed/simple;
	bh=5kdF5oVUy/yps6X9BImufh8OuKxxdQ4BjJ7Qv2H6pxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEyGKKQg1JUxC1NKK+OootMzg0BQ6Uu4B6Pm3+xyugzMus6kJkYLRUbA6Vr4pjl9sFq6aldLG9lbJnuJxuwkgM/rz52omUPXR/OXR9mHjvebYkpNgCMA7yufAVBDBYjOPtQtAp3pFrgB5loR4LokIUKIE/JWr2zcWTO/mEVLgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a7DwWriq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so58493585e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188054; x=1744792854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/lQSP02uZhzaqZfFDZ+bFMWR2NaVs5b5QtoM2HpE7Y=;
        b=a7DwWriq7SA9IP07wBkGlbj2ecfCCciZhMRHFI9RnVowC/12yGyANaSrGpPFiIaB2c
         RdJb5gGQ6UvpVm/6oFukZSYJNHXOnAM4dHx5XNrZmH2LGULyuer4pDD9WT9k0wX1AuV+
         Zo/x6C0Z0wKPTweyOs5yhFfsRb6teyRSBGH+vx02q+hsJAqP+iox9lsYjJpM7H1zlWvA
         TddcvvX9Std4TraFeCSRuh22Id4rTjYn/fdyjhDzcyJmif/gqADKQyeGpUbfQbqYPzhR
         p0M7z0uWNEyX9blmJXGb+iN9F5PLevQ8Oa05GLkPn3jBCL6c3tsdgHfeRPRfJNJS9QXg
         yTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188054; x=1744792854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/lQSP02uZhzaqZfFDZ+bFMWR2NaVs5b5QtoM2HpE7Y=;
        b=PKB4nk0YokW/l4PmHt47wTgE+FMDvHqqHopPukqD7UdBAuIUfF2bYgh6MOS4smMQxB
         jA1YgoqL7U+NJAcIemNmFYW+cC8yKpSSYFXCO5GRI7PfKZ5bGkmASjwZ+b22NgYdElWM
         AWznZmXaOtRJmMxxC9XKG6jp8R91pkMZd872TY88fC9UTfuPmS5/k2Kg7KMwv51yxDfW
         RbTLZdy/yNSy+gZQMZ4GNwm5PFdZ7/WKH26FtAjFD4CBE+L8KWCShYVjsVSXR9Xdy3zi
         2sImZVV3XV0RXiXUI3yL1s6K+DQ+NMBMM/QYMwbPTj4t9EIwI59//6I3veupC7lmIszv
         oL/A==
X-Forwarded-Encrypted: i=1; AJvYcCXqvY7v1kcg2RbRQAV0YU/zCa+uZVKJ3/5OCVbu00X1EyJBS0ZUL3DbcHt+hCuXdOLRfYCm4Bpydas/@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdA1y73r4IKLU1Zhm3svagxwwgf0OD3cvdE1ph1M1C3w+Upim
	VeTebUhTukC5DJ+Qx21y0wAyU/s2HmJvAxDf5z3me8A/lD7bGl8UwcHtagjTOW0=
X-Gm-Gg: ASbGnctAXgixNesyMnzZcnHRp68b4rRm6JhaiU9vkjFUxPErcjVyjyar5tfahVGKjhZ
	4ZC3XaXTQYyuGdMRVV/ipiVWFBd8JNrK7vkEuMSFjJY8iUVw70QTH1+PE5hAah5WHj4UDgij/0F
	K7obZis7uA32S1EdBXtPyckZPs3S8CtEhCQAb+iRzr2IU7Xn6pmTD8uQ9jnZQJ1HxCQgfiFrMLr
	Oy3cDo2hkqzC2mVmSkyxjxQ7xfyxciIRtcvp4sOIbvKBqJVgyzaGuC4Fcw+5tJBMLm7ZZrQ9S/j
	QLf3gEnRhSSvBXi1kF+iApCxCGz4/HZV1w==
X-Google-Smtp-Source: AGHT+IG8LQlB/qJ4dprLDxOBQIbHnBXUqk5P+Akfq9rXwsoYQVM14BJpyBXYL2o8LGSSr/sh82IgJg==
X-Received: by 2002:a05:600c:3b8f:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43f1fe16c7dmr15845665e9.10.1744188053670;
        Wed, 09 Apr 2025 01:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:45 +0200
Subject: [PATCH v2 7/7] iio: addac: ad74115: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-7-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GM/OUTdtJwVfHBffPnM20PvdLToT9f+xlEL0CqiIT9o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKM+RDKnpk08jf6biIZ3iU+KYy4c1FpPVE9g
 ineY3ogU3uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyjAAKCRARpy6gFHHX
 crtWEADCEy9Fkv2WE4tKZ2plfQHL2JiepslTEmt6QhUmz6So59x/5RxyKgDu3LK85ixCUqiitQL
 3q7lufL7DXD2EX3Ai9owJsTIH+YHHC9pgD3o596P6gInTNQxn9derv4ukwZJOYhQ5IgAhzjzmpG
 ZT/fYog8HvtoUXTOYtZlmXKVoI23GIDf820V72btz1yz4Pp4HVspy3HALtUylwZpvLG7OvwpsCa
 oVkHg3j4j40BBqmkd7fWTCaNz6c0EdWVvtwL0VUEpuv5fWiL1kVtzznvCM7b7meTNE1lXjjS2hT
 4TLznQ3WjhVdFjmA329GHu9GBtPb2Y51r968yrfBQ7QcZiK+TjWq6+M5QRntMY/rMEkLN6uMzEC
 tzVRhY9HMzT5Gey6tto8zePpE03bgOdn2nkvV7M5PqbATGnKWKXda7Z4rd1lrANcU9ZyDklLAmf
 AokMsuxUbKxKpP9RfAjZKxZtZ5TcOroNFZTLY7qJWV6flXC4+Kglxe0Jd2Ook91qkuVtKBmSS3+
 QU7+Kcol9RRZV3pO+VABQvztImX3amgSer2m1HXZb/3yCutPB1PfnAbguPOGHbiWnETKr69q7nc
 vHr6TCmvDKeYRdTxJkZrgwLQ76O7CLQVK2pcJmwvKeGIBFLdeq3VTJjO8siiK/8+tTGwogsTiob
 Z55amYSelPNeVUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/addac/ad74115.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/addac/ad74115.c b/drivers/iio/addac/ad74115.c
index a7e480f2472d..2a809e07526b 100644
--- a/drivers/iio/addac/ad74115.c
+++ b/drivers/iio/addac/ad74115.c
@@ -542,18 +542,16 @@ static int ad74115_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return FIELD_GET(AD74115_GPIO_CONFIG_GPI_DATA, val);
 }
 
-static void ad74115_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ad74115_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct ad74115_state *st = gpiochip_get_data(gc);
-	struct device *dev = &st->spi->dev;
-	int ret;
 
-	ret = regmap_update_bits(st->regmap, AD74115_GPIO_CONFIG_X_REG(offset),
-				 AD74115_GPIO_CONFIG_GPO_DATA,
-				 FIELD_PREP(AD74115_GPIO_CONFIG_GPO_DATA, value));
-	if (ret)
-		dev_err(dev, "Failed to set GPIO %u output value, err: %d\n",
-			offset, ret);
+	return regmap_update_bits(st->regmap,
+				  AD74115_GPIO_CONFIG_X_REG(offset),
+				  AD74115_GPIO_CONFIG_GPO_DATA,
+				  FIELD_PREP(AD74115_GPIO_CONFIG_GPO_DATA,
+					     value));
 }
 
 static int ad74115_set_comp_debounce(struct ad74115_state *st, unsigned int val)
@@ -1580,7 +1578,7 @@ static int ad74115_setup_gpio_chip(struct ad74115_state *st)
 		.direction_input = ad74115_gpio_direction_input,
 		.direction_output = ad74115_gpio_direction_output,
 		.get = ad74115_gpio_get,
-		.set = ad74115_gpio_set,
+		.set_rv = ad74115_gpio_set,
 	};
 
 	return devm_gpiochip_add_data(dev, &st->gc, st);

-- 
2.45.2


