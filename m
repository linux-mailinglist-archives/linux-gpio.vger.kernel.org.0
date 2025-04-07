Return-Path: <linux-gpio+bounces-18296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E439A7D593
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6565D175AF3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D1922DFAD;
	Mon,  7 Apr 2025 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UGqeFo4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2122DF89
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010302; cv=none; b=Kz8Ni9R61wFwR4uKsM5bNPDwGcK0pkiXl+ns4H+GoB+RAGW0wIzjLaUPBdaCNxAs1WH53jSXzEW41jwll/2HHK3hPis6ur2QNjoTVUAoV9qLdCerRBuXd+CMvIuprfeihXZkHfFXSjARTSxGVzjF/PK6Fg4drn87TwFagdhRiIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010302; c=relaxed/simple;
	bh=fa5cTkRDqqhhVl7VbbjXyrlh+4Fb8+6MIvJLxTQ35n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbr6SSIlZLtlEng3MaBMzFj8SnL5zTfvSH/eEGCQdLDzHDliPGvoiAqiMISsylS8MR1v1gUq62Z8rqM3RM9+ZcvrRuoVAwcBzKsRXiQTch65m7bot+iOQ5xGJY6RBF7qo+6MYG2a+LvAOZnL/f2i35FYU0KnUd6ZtL7M+05VsGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UGqeFo4f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0618746bso27649735e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010299; x=1744615099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhxzR9twRT0d+wFu1RoPufbuenYk6hkExQ8ZTUxlkc8=;
        b=UGqeFo4fl0ioCqwVGldqEvRpW7ZOYntIvSdL9qAOkTyuyZyj4BsLDfukq211+weB/r
         OPfoomS7DKW9hT/5fSArxPWMZmUIyZvrepOjgmJpVG2dGswD0yZAZwkqfLmSst+r+6cx
         hS0uOet7yNLn8UFydrGNeA1ytTadbdXsLbH2aOQKGWgUESXM4eoC6WMd9AGvXnK7d3kf
         xgaKM8nEIWrn3kPrOUnrces0KS15vQytnJwIAa/jMxZY01hNSa9TCPf3yo49GgsjeNPG
         oDpTuOtJGP85ZnwgSHVV07JRZbggCXmUlsPlVdljssNk9JCokl7EGmRbfKJ+x19lcDrO
         ZV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010299; x=1744615099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhxzR9twRT0d+wFu1RoPufbuenYk6hkExQ8ZTUxlkc8=;
        b=LWEMtPJ6ReFwmQ08yZmDRlZgKhd6eKuXe/2wVyJZrAMI+buT+SQMwv7vCw5g7KVDm5
         I9a90r3Rval5zG8nNQ0g+e+GxFdI1kpandJBfYrpsTxxTBj6nvOxmhPFxPmmH3DD+Sqk
         GtRrLX+R4g3hWbBV76oU2reDH49EzKO0rXtEEwL69fXsacwD67po7U6lle4tOmkBDp2D
         550h1DMtjmVHFRKLokjRViVq5I/I9es9x8wA81GIsTKEcySAZDoa7KZBYe9DpP+htk7n
         BGkysJAzchydboUTSXIYuVVCptL3METQGCjW1a7N6STHaHKDouEVkgA3sv7yDtiQJzzg
         wzPA==
X-Forwarded-Encrypted: i=1; AJvYcCXexJJx+cNYnrlixgU423jZcIdSIdaN489D5J3LXr/5K79lAyjS+8ucy+k7YBkf7V1gOKfYLt4TlcuQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw15Ae+5/6Y4iEElqkOo7/gz8a24LRFkIo+hr/xt1GQok1eWNlR
	qQFuaM8dT5L4rT398BZ6jJlHxayiGMDwSpa9mnTWk7lb8zBww18Yxk4dzrFzZ8U=
X-Gm-Gg: ASbGncvRBRwwpwg9+8isZIWm+SV9rI7oHkPCDOcxSEsBnx2ldgZcnpYiCxocDERZJrd
	/KwEFZBxAuDv1xtKaXfxR0pJKCTT8fRhJRytpaRqumNKuT1D9N9MB5aPKd0XJKuoTKJBM9Y+Q19
	npIie9JrhpCjXULJbaMeLP2roqZ2+vy1QuAG0MiE/UQ1OeSDrlOlE/pkLaIXiMQyiVJ9mWWIxJj
	AldO6sPbFPM2HS3T+/BwjkXm5FYjef0XOuuyreoyh4XR6r3xC1cm0grSYM0Xj6S4j3ZgnD/NPJr
	k9w0biHm7Hc01vWYT4e4yXZsq1zGWvL5jVyIsQ==
X-Google-Smtp-Source: AGHT+IEEQ3IgiYXXskI8H0hQrZ/0JzuSRwAl1jb0RZVx7lz1HQP/lzeUUQGscgemWEtfywJxfZWEsw==
X-Received: by 2002:a05:600c:c9:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-43ed710c09amr62998745e9.1.1744010298832;
        Mon, 07 Apr 2025 00:18:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:13 +0200
Subject: [PATCH 5/7] iio: adc: ad4130: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-5-8431b003a145@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9o+4uCrbiIXfKgm+/fV007oYqSqjRct9ZS0ApGPT4xk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wzEtTvFQmxKS+7PuuBvSTB5CU+q0uhl8WJo
 YELb669MW6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MwAKCRARpy6gFHHX
 cuYoD/4oOVVae8g8AEBdQIk/D/lfjmviqihOcm4tLhTCMcEO2AmPpVRe9y8kB3aNPzQvuxolavt
 9Ui5KIABZmi3+twx6sLnxcOTiwOTPsOVe/DXk5DYH4aBpzG2tJ8xWLxA9PAgEdHihE8zR8KS6F6
 v3wB5m26dF8fRKlAgN87MvGagSO1crfm9PzPesvf/S5H0+p0obq7f/TK5xrtOcSDQh2DA82lNp/
 0jArJg3DX6x+2BfKdifoc5yKzVFhVCBbIFcFb6SYlcKv/tCu+vXlqhp6T8gkkrcfUqA6JiMC3l6
 WyUYEFdA3G61IwFBxyAucGVOJSEPXKZj63VRxiBM77vHw7HfxlTuHomWzyUx9+OBcerEYUq73Jh
 vYSk7/fo2i+GOQtIAMoh2apxTgzqOsIPuO3Zh6RKdVjRFid8fxVbfX1Cm42Y9BT+UUhLed6wGM/
 rpgB+ITD7aJDPHgIGFz8YYlMS4mVU1WQUfPNRTr1J7fprQjFxq/jv1vBhabwFZCjHYlvIY6aW6L
 EtMRdihuGb0w34CZiazMUh01KkAwDLsNdNGHshDqh6ZNI1OyfXsR8W3apRtXitZHc7wOAqudolA
 70IHiyciRLcenZfcA6b+go8frxJ9nrRHaFgrXM6mTHtf9f8/G6wuZD6Pk7yKkPEzmOZlDY0pJ96
 UIM/PxqKEVUGc5A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/adc/ad4130.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
index 0f4c9cd6c102..6cf790ff3eb5 100644
--- a/drivers/iio/adc/ad4130.c
+++ b/drivers/iio/adc/ad4130.c
@@ -522,15 +522,15 @@ static int ad4130_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void ad4130_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			    int value)
+static int ad4130_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct ad4130_state *st = gpiochip_get_data(gc);
 	unsigned int mask = FIELD_PREP(AD4130_IO_CONTROL_GPIO_DATA_MASK,
 				       BIT(offset));
 
-	regmap_update_bits(st->regmap, AD4130_IO_CONTROL_REG, mask,
-			   value ? mask : 0);
+	return regmap_update_bits(st->regmap, AD4130_IO_CONTROL_REG, mask,
+				  value ? mask : 0);
 }
 
 static int ad4130_set_mode(struct ad4130_state *st, enum ad4130_mode mode)
@@ -2064,7 +2064,7 @@ static int ad4130_probe(struct spi_device *spi)
 	st->gc.can_sleep = true;
 	st->gc.init_valid_mask = ad4130_gpio_init_valid_mask;
 	st->gc.get_direction = ad4130_gpio_get_direction;
-	st->gc.set = ad4130_gpio_set;
+	st->gc.set_rv = ad4130_gpio_set;
 
 	ret = devm_gpiochip_add_data(dev, &st->gc, st);
 	if (ret)

-- 
2.45.2


