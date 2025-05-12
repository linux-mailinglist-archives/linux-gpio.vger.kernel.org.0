Return-Path: <linux-gpio+bounces-19961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB68AB3A63
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00D763B93E0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774E821B8F6;
	Mon, 12 May 2025 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVPBmKc7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70947219EA5;
	Mon, 12 May 2025 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059791; cv=none; b=fnL2wCm1lteVsD1cZmm9bkJNmpnlOZLmMjaktxRFXtQe4TSPAtNoQLA6hJtIxmjlSKL26H/x70dB3wvIWHEsCe1MbtiM2JnqipvPHZbXSywtLszv3aHs1q+cJPoLV8T0Whns1y5HSe9EgQAlZ1MKIhWoL4RhbkCgUSMUs0Bhoq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059791; c=relaxed/simple;
	bh=5Qph+BS8SehMxCQ3fU26TgLn80vRDcqYeQjtcgvN4BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tilxrKsnEqej6zQrP/ThT9sjUss079SicmokrENX9YdVa9QSKkIuEYqYPJdofiPuRz8gtN/pLq2THzLxYqbIQLTaGzOmmExnN4nLHYK0WoNmFcDBLJCVe80HgYE6hWqPt8qIeM9tVeqR4cxsZmztMXfv9EdaZavgiESrtbMFclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVPBmKc7; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acacb8743a7so766729166b.1;
        Mon, 12 May 2025 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059787; x=1747664587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNbP7UQ6QBCtzJmBLQElQ/Oiqog6oGM/rgRC50EdCKI=;
        b=WVPBmKc7b8cXjHAmqs1ueQzOg1LbCfgepS1FhAjwEiUtAPoH5kqC/Vxy69ckzPmnDm
         YthmtLRjS+W+Kb+REqnGYmYdCwnNd51KLBLC8IWjfWO5QblKIN3/hQU5sJK1hZzY3PDW
         XkZ2rnRoyG8in/X9tkHUIjd94NOq6Tb4h2FM4XyJFz96AtyFkNAbFZraClI0FQlFNxsE
         O+CsgMcW5kMNZdy6Uxtvyi5xfoeKbtDaGvcB7FWK0fmLN96kKCCMy84URs+dcyZBnn2m
         vGgfgsaEMAo7ysdW5K1JX2R2HzNdOvVkk5tDm/tWlZXtsJez/pb4F89UNGwrf+PW98C/
         QrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059787; x=1747664587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNbP7UQ6QBCtzJmBLQElQ/Oiqog6oGM/rgRC50EdCKI=;
        b=FU/ITCLYjWAxIawBAY6TvRkvNfy+o7qdNb+/sZzPxQV90D4Zw2If2+h5qDP77eUWao
         LRNrGGfjjqZseZEa7D3mOS4My3io9GcUZpDaB5JikCgW6WuXf5WF+ysb0w0IVaDg22kI
         G48Ii+jy+Bt3Zg48bem8Us2WDbn3t9onAyLZmCCs7QpVaRPSD0uOnwakEysThTl4CSGr
         vTGVA4f2wN6FLoNOQyYxE5HKuRPmSRrSHaOdvhA1gr4n+GZr5FpwEYoVJiS+nLxKUqgI
         FfT0bo4HP23IssIIbqcQJO3Yx0sN5d8QTpGkJfIeW+1ZcUOnxAKHBa5UYwmwIeEm3Pri
         ztGA==
X-Forwarded-Encrypted: i=1; AJvYcCUhwXK97QvZ57O/DWeu6EXuQRelx4qADDuszT863iiXJjo5kHhefby1gJG7F2f4TXTweQc6I19/QM6YPl63@vger.kernel.org, AJvYcCWVcYh9TeL7b4JrhmBQHmcjCy8Kuvfa6wV29VNQaN2ttZI1lebdYO/r8sCrpjyKWssFh7TuKhzF@vger.kernel.org, AJvYcCWfHkT9zu/gD0fcpUwL8YrmzrrlBl1GO0jGv93DvAeOcoJX3QNul0wZ3WhARpra3SfrFmnj9ZWz7Zzv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi22b9WAlCqjcMVfb6SEEXwr1xtxZ6513H3bKedmLM19cSWhVG
	zDAPQ7oZuMAxGH2TT88ffwbUvAryJm6l093Bbr8i68KNews2g97n
X-Gm-Gg: ASbGncu99mDetlI6CyemYt3Gos7BDiQ4tKVZOLmdeFaj57EkZqvGIdyOmEeUnBdTWN0
	LqVBXjut/W1oEp+zsw1D89yYrzuxrTCrCNfFy5rr56xZuMe1BHYH+XGuRx14fHjM44UU5k1TV3v
	B2GvY5+wCwwVtOIz1XYJ5KwbCXnaPZry0IP03n0headVNynkJHLdx/LC3aGs4u9tG/EBF/7ViNO
	wTcVtQ1HvGWOrwKRozkhZqqSIsLEUD9HO8OElUUVJGdUm0NjXev9hFeHAsuoavIUTEpFZVdYmWA
	mNR7Xux5gI0mHQ/jAksWFhZMFegPi9ZLpOcnP1i/4juUMi6XlvLBNiNEFJF5xCsFvxe9mvhp6Vn
	w3eVmiSfOanHfvXw=
X-Google-Smtp-Source: AGHT+IEAuWJVxQMEM1VpSI0jRTrCZ9DF6TOGQv6I7s6vfSy+SBEpvant7r1anHxZTeAjxxIQEyYQ9A==
X-Received: by 2002:a17:907:a089:b0:ad2:27e6:7e62 with SMTP id a640c23a62f3a-ad227e6801cmr917487466b.27.1747059787151;
        Mon, 12 May 2025 07:23:07 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:06 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:39 +0200
Subject: [PATCH 3/7] pinctrl: armada-37xx: set GPIO output value before
 setting direction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-3-d470fb1116a5@gmail.com>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2

Changing the direction before updating the output value in the
OUTPUT_VAL register may result in a glitch on the output line
if the previous value in the OUTPUT_VAL register is different
from the one we want to set.

In order to avoid that, update the output value before changing
the direction.

Cc: stable@vger.kernel.org
Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index e0c8eebf40588a1b49b80e2a1ddcc2a35fa7c07b..8d93d36af63ab9496376219454214c05db30971f 100644
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
-	return regmap_update_bits(info->regmap, reg, mask, val);
+	return regmap_update_bits(info->regmap, reg, mask, mask);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)

-- 
2.49.0


