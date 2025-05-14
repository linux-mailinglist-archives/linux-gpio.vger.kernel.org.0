Return-Path: <linux-gpio+bounces-20162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4BBAB75A0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DD541BA5652
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 19:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D91290DA5;
	Wed, 14 May 2025 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEGGEnrG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038D28DF3B;
	Wed, 14 May 2025 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250332; cv=none; b=SEYRa4Du0atzSG44f7HZA+irCUbi7Dbx9x1/OfjJDvPV0zJvneWiE4Af2YmatZ5Em58yMZOc2Q0hUKDhYdmrzypIchuFx06k3TAFsEVBGYo35Qkp2witTKVcnsHzM32wKN8DmjaQkrceLMkqSBNJIvAnktLIJZQICOm65QeM4bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250332; c=relaxed/simple;
	bh=rkHy0kQeLRmpuGO74kKtvOziIW+BrhpOftFy3YFd1qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4TXdaaa2mh898IAsMTJwl8cb8IaR+Dq9KBPEv6lcjyvwAAeqeBoUMnTXZylJ5rgkS3dHH9cuRgwUUryLh6+gWzHqVaijqgJmcQ0YXzmGhdGEMr1jvePNSxiOzVux7JxLjzN4NZe70CPy8mwnHpC/rPbqj9y1Vbkg5PZV3/LTgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEGGEnrG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edb40f357so1442975e9.0;
        Wed, 14 May 2025 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250329; x=1747855129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1VHW2HJExWmBNfaPof6yV4PNzfV43beUESvCPBIVuk=;
        b=ZEGGEnrGc5SixD8L8+9/Bf9GN8S9YHQh4JyUPC8uW2fnhtoV2wQrbq+5b7wOMnVvvU
         ETN8rgRUcfdJIk2nxVDa/+VOCLK1wkJrYHrf9oZCPUvcM2Nwdx0EpDjym4lEnCeJZKXP
         alRwuhKUTLiy5u+Wi2OWE8D82D0cBPsirSdJqFtPaln6ni5l5Bcul1yknI+GKNKEKtBv
         sdF/ONiqeF662LlIXZc89djUv6YHmprnvQRS3LTLnAN43X9JUpIQGDJf1SN0PwT6CZuP
         UquFk4J0PXdZTG4C0PkVuXtTYFj5kLQdbIljchnp31MDaWXdvFrzRx1kCjC+vcmS+SgT
         bC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250329; x=1747855129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1VHW2HJExWmBNfaPof6yV4PNzfV43beUESvCPBIVuk=;
        b=mgO0gPKDNdQSw2vP3lMdc11uYSUXsInGvSx6ghCKQyVvO6iNPTQWm29h0efrt0gZg0
         2DIq4G5CWHH1axtQVekYG5818vMNrmnKaUAxTeOSdSMWuN/vsSkFgFuMlMbORqBDLoiz
         I0GthopwvnI7dT8GzJRKLI/+vj6O7KvVgz/t9r/sG5pscOkFFK+lyg3ycA+aFdvG+WTs
         m4jZybktTrlOMigW/39xehwA6lQpelmDhisWoC4XZSUJAI9fBgKoCFIpq5YLXzE7uhud
         c0hJNJF2WsSCHOUu+nXmEufJnfICo0gnj7YYh6UD7Jyy3HIb0ddJgqhgcdMEcdPssQkm
         AWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS+qGnWYXRhIFgUOluumMrFrQfw+IzBrxI6xR0U2VcalViBVM7iLgYeaFYfkK9HIMxLm1GXYUvoNCm@vger.kernel.org, AJvYcCW8Obf+ZqiWPrLH7Yi/S23Lv4pX9wWWwVg0dgqz0OpruOQop5HZZjCyVVJoUYAHY/VyWzLgwCJ/@vger.kernel.org, AJvYcCXtX67TM3G7EqX88ThAzAZs9eKIjy6i7iWFfH/FOlzp93x8lp94+4Uwv+f/YYkicLlVXrhvM9v0/i7rpauu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq3+ZEp0wQ2xMF1UV8NR3D1rbAXOpgfVK+nS6O12LmoV8jHt4M
	Xa9PsXSETeZe2e9v2VlWb9GTrqYRMmY8MA6jLaypYxQfslbVxCCm
X-Gm-Gg: ASbGncuEemFgR5TLWBWrdrYcu9FNqOn+6TjP+/OWnHZ7h3cbwDaAjpnclWDc5BKEV4y
	Q6/yuEWoCf7XOnCsZSVCMZ7rguaYBDHFzuif73HWdJ0R6IROCnIepMGGa8OAfpzkIvxmgeHlqBh
	N/779UaqZjdCCFF+FJWDh9/k4bin8jwK8mWXAFXuqKaWmAM9I+dXNgxPhvrfH9osXfYFnb2AVld
	0VWIrDniW4N4ViFaQ00839yQZZXn4qZbRq9m9Tu1HeyFNSKgPcnp6E8A5CFpTaIXsg+JI27DqqP
	vjmEEPFGnInVyA4JBJ69yCEhupPzLeIuIPBfS2EcM0RgbBxMPEXDIEh40nLQhXhcDy3p4HxtGQj
	r59yV
X-Google-Smtp-Source: AGHT+IFVv7oza45Q2QfziPl/5KRvPAxx5elH3SF3XZpjCrkHu0ZxgVl+w6k+ib6M2XHCdlmCCVtmpQ==
X-Received: by 2002:a05:600c:4686:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-442f20e9013mr43795755e9.13.1747250328632;
        Wed, 14 May 2025 12:18:48 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:47 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:33 +0200
Subject: [PATCH v2 2/7] pinctrl: armada-37xx: set GPIO output value before
 setting direction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-2-07e9ac1ab737@gmail.com>
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Changing the direction before updating the output value in the
OUTPUT_VAL register may result in a glitch on the output line
if the previous value in the OUTPUT_VAL register is different
from the one we want to set.

In order to avoid that, update the output value before changing
the direction.

Cc: stable@vger.kernel.org
Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - swap with patch 3 from v1
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 43034d29292687e875136aafa530b62479dc55ec..79f9c08e5039c31acb170d4f38b516b1454fd9ea 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -417,23 +417,22 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 					     unsigned int offset, int value)
 {
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
-	unsigned int val_offset = offset;
-	unsigned int reg = OUTPUT_EN;
+	unsigned int en_offset = offset;
+	unsigned int reg = OUTPUT_VAL;
 	unsigned int mask, val, ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
+	val = value ? mask : 0;
 
-	ret = regmap_update_bits(info->regmap, reg, mask, mask);
-
+	ret = regmap_update_bits(info->regmap, reg, mask, val);
 	if (ret)
 		return ret;
 
-	reg = OUTPUT_VAL;
-	armada_37xx_update_reg(&reg, &val_offset);
+	reg = OUTPUT_EN;
+	armada_37xx_update_reg(&reg, &en_offset);
 
-	val = value ? mask : 0;
-	regmap_update_bits(info->regmap, reg, mask, val);
+	regmap_update_bits(info->regmap, reg, mask, mask);
 
 	return 0;
 }

-- 
2.49.0


