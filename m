Return-Path: <linux-gpio+bounces-18298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA08A7D5AE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4FA11892A75
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB58822A80A;
	Mon,  7 Apr 2025 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lHzkJYB0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92422A7FF
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010317; cv=none; b=IMZbBO5OWjfFmKFPKsKRyj4GGfGUlK1DX73MT3AIBcyR2p7Vai3vQM4iRVc4BqRGxhLiT9DZ9bForz/MwpLEqoFtdWs6SWX81DWEQTE5XXkvnfIUMk5XxPjlByITPEGS7wuIUTgxghqBZg4a2NWAhvPlzB47bFXRGpms2sb1nkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010317; c=relaxed/simple;
	bh=5kdF5oVUy/yps6X9BImufh8OuKxxdQ4BjJ7Qv2H6pxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOfAt2OkLvdayF5VqpqcPQPaCWgwUz1nc6K6Tbv2oqsEnjTVcQIzzJnjcXy16uHIm3mHdGyUJiGAmcX4OECBLxGCHCCizhdfHvzhjLPFEm/HZMEAoM9UDnYicY8y2LE14jHMf+L8AVUD+dErSwB+e/VLr9a7rGb+vkhkDcQLyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lHzkJYB0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso25278455e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010314; x=1744615114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/lQSP02uZhzaqZfFDZ+bFMWR2NaVs5b5QtoM2HpE7Y=;
        b=lHzkJYB0KUnV61WagiGDB8oMhwRFjC7ctOqLM+mYoAn3Tt5ODg2jEP30MKlTgDKdJe
         YNJeLWIt6atC1KH+jL7RxDCrPzyBnM6rxUuJxZJ6VvC6c3tlSGjmndqIBXLPz6sLweAH
         k/dYgVV7WHPAq8h9buMxOBQ3iMuOo0bdN0jnLnHy00AX+9MtDLs1QM5yeXrjkEqFQyxX
         J3bn8ngJ2JiA11mfxU6QJrolXcsCVF8NWsVw2b7srdVE3uz/hvL4C1rFnRPPzWa6GrLA
         0o/bwaCllaL1ErJVUFnC4Bqqfd1AtokX94lAIBdnZoESNK77a47LUWONWk3+7Jq2zkIf
         T8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010314; x=1744615114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/lQSP02uZhzaqZfFDZ+bFMWR2NaVs5b5QtoM2HpE7Y=;
        b=P55lV+RQdYyW0piu2/H2S/wpwEky79F19zMzB2O7Qf7J73uBZf2DCLUJ6HEajxNF38
         v82cowg8c3jWEtCmKhMDoVz3rEEG30/rUCRjq8KxkgLiTLIL+N02r5btWMW2XriLjgUy
         sk2K/p5N1tME2DOgrNYCsAp+8PukywoBp5TGNNUHKgxg01AcXPHPFWYVsPYKy9SlHq/U
         IF3hIsAebxCuyBYw6Tj++O7Wx/RZJYlQk2a53JAQV8/zBT3Zlh+whS4sduhd+ngF4JLj
         C59YMqp2mvPmjhPUEvPZbQMlm+t/HOpX1I19t3y1cTtPRl3WXoDaT6wCbkDLqe8Ja9bA
         SIew==
X-Forwarded-Encrypted: i=1; AJvYcCURuqXbDvM6+JPqc3hjO50R8IC3MWvrrmIyrZnXJem5KYzKQbaI33mFkBdmTt9pXWvOtWA+IJ9sSFi1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqb3lHefYHrMSWEdrYOPX8nk4sAr0y5rp5xAV/52Gac/ZRZSf3
	1BYBN83FhkBrmZSo06c00TOZmmX/8+eDC+mELGExc0EyQJ7NMQWZM0NHlWECx2A=
X-Gm-Gg: ASbGncs1UL366s7QlQZBzmIIinGNuFKZBUSifV6r4o8LOSg7Z8CfG6mEQ1aeIKcOP28
	ZtYJrvkWg9KEwyA0OobuYeWxKVjlcAgtbl9aUnpCsylgM10idfiaSBr753q4P2LoLOy4J7UTXBs
	hxXnjB3z3kEHAzAACt/ZvS9kPwplCJVeEIFku/NcQYvwXjgxax+pfPtf7MUWZap3m6Y5Sh2bQaH
	aI7Wl9z77XPbAm397Pp80PTii3Szzw+KTpX/5ZxhorOwvT/54pg8ydDHENX2CJpQbwe6p2qDmZ3
	m3+Em1ucrF09lH5axQTwWZekW6M0y/A/LtsS6A==
X-Google-Smtp-Source: AGHT+IHZJ6eZKGM0X4E3G3AiVSKpRFA9oT3UOJNHqKpzBidSstN5tYKbajNmdPvNjyMO/2yji8ci1g==
X-Received: by 2002:a05:600c:4f0e:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43ecf9c3224mr81160555e9.25.1744010300476;
        Mon, 07 Apr 2025 00:18:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:15 +0200
Subject: [PATCH 7/7] iio: addac: ad74115: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-7-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83w0zT2RcvbxxdDl95J1of6Esp1CJCtG4NnBT
 9KjTKwWSzGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8NAAKCRARpy6gFHHX
 cuv7D/wJ8rQB9Y9DlVg0wZNX4DBaBKetOrAncRCE3OlQmy2QTip8kUA5d2j0dZOLtaYHSuznZ5Y
 ADpgEA95zc1bdV+9kVNSlvEL3nek/u4FYhCBOq7JyMHxGw7BzrS5yGEClJBcswxBIVyZcuMsLK2
 qN93D+ck9WHRZBZE8U8RSOnGXfPUgFTRMSvDOp6DkGPOFfNYauVIudkYRurEjPHNyoezOEQwjxF
 ymy7wzw+lx0gvHkiCXF1LmnmL/e/j2tvJ9XO11pT9tmabmgyMMUaJI6sL+N3N2oLPq/ma+1fLc0
 BnSQks+2lCnB+XVkUTahI+AB+IuIW3yifmZGt3cxK82Wcnjhf2uXswwx8p8W/zCq91/P1rc5L5C
 OCLyH2t3VJMdgkT+qm5LM+RaLkS/Xuq1JYGj/fWtiQy210zvBS32EghCDXv371F1DL4CS5KgtzO
 p/hRzaa6j4vd6MSG8NwXNImPXTUQqIvbdV+DENtr/RYKX8PXmky3LRt5MOvxjtP0x1EUw12SUSL
 ARiECEfbnshwoV1PZN9yywQMSDV3iKFs2vUcSF/5LkHqRa7NDni5yZOlHqWguvxcsxT0Zspi+OV
 VhrRnAS/zN1qr+lqepcZa8lDehr40lw0wA3gKwdz8haFRXS0asf24nMmq9uvTLBL1aRPJQGnuYt
 Gw4w2DyrGQIBw6w==
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


