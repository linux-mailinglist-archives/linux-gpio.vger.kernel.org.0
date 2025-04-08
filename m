Return-Path: <linux-gpio+bounces-18417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DF8A7F5D5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C51B16B0A1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85E426158B;
	Tue,  8 Apr 2025 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ujfFkcB+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268552627E9
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096682; cv=none; b=E+iR0twEvnNVaQaC5vnALRC7KvoZwUbQjANcnY4g844wlvf5uVfix08mbA0uo0XQmy4pE0PO4m2uckk1Vk7Fv/Bz1b3bqlqVWrV9O21ELJS9kPKvNlmxMYxX4TS2vy4RKQjsWXgjUXHCqB3zF5opdIizLgmCF/utFUJlkRiN8fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096682; c=relaxed/simple;
	bh=hmSxWGIiK/DtDwGKJHp041KAlwlf/8OprB/NVG8dke8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XER3jP2t6r2XPdGDTOCqa7fEiduw+zT7ERfbst2dWgEmmZ4lZPOVaobf0otBTh0Sb8RfB5RkS2PIZ+X9CM56Dk4eAH4WXfWxMkLcjXm+SkF/YspaRvTQNnKUdJUqQWKqYMe44coarTS7Yng9kwooqi2r8p6wBzFiYv9EVW0RbOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ujfFkcB+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3176666f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096679; x=1744701479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=;
        b=ujfFkcB+q1mh1USArFphDpRCbF/XqbeOwSSpXAxgab3QpUxi4qUVBw1n4QNPhzoQpw
         WsBy/WjnM+5lNj3ZXN0tXmrWigtnnCafVZGnE5T4ed2S7QwdKntBJM1b2HHJTRj7ehBd
         qFwS4gmCNV81cGQkEvXPkNhoIHf1WCcFBzvcEGRPzjev1uIbOAzbTZF7mbbjI7/OmmKS
         /a2Mxb1b+iWgKWqqUL0kMMI3GAAgxbVr7siBluBtubgHY2C8HC2Js3JBpEHWSA4pjyqu
         U++VB9Ngn2zm5CN6a7GJm8H470tT8R+LRb9qD/hx4ZFj0sSh/lJlFWMuHiGWIU+jd4bw
         yrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096679; x=1744701479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=;
        b=viZl1w0OM4guu+m9fm2Peqhi4fre5hHgOkiPaRw2kBOg/qZ0l+4AT9tQ2oqJER7Ks8
         BcIo4VFWmvP4XX/o9fHFacTRLIPdv55qDBO0mMbLOrntP9reynHDi9iNdftyujejpTpx
         pIjq8L1vUQSM21ugmBY4qP44bu8t62HNfz+I1Nq/+PHQ7hpHUMRBWHIgxnI8btun6hiR
         Ij4Jmt7j6wCxHjRxM9NdC0Qe3+E3LLv27G2QUcAaFy9g5tm9HQRSUJj/2SBg0MorPkjq
         KkXHfkNFTeYCSnWOIvaihN8ACWRD+3iCLp+h+ytXKwhy1aAbVBW5Ybenm3JRlDfQW5qC
         I6CA==
X-Forwarded-Encrypted: i=1; AJvYcCWx5rSqgAc+Kuh1XV/z2blVmiHrK0qHZIgTORfsHUFXGSJPkfiGO3l03H4q/zGNS9FDIluX+EMVWHLb@vger.kernel.org
X-Gm-Message-State: AOJu0YzW+HOJhuTfCU4CmCduA4lKtbAdXarcq24NIy4aAgCVRf85l4BV
	S1YLCvCA9ktV9JWLeO4cPorWKKUJJBZurKso/aIOjmhWQIi6u9uw8JUlvV4kGZM=
X-Gm-Gg: ASbGncsS5NOC7aMga44cL1u9b0E6T+Evb4f+1mcsFeGb/GDZKkYVtuMx+g60S3VT6hj
	/ypKYL+aT6OswGvmU4LACeLANN6jzMGNSYm2jcglJJ6hbsiWTgHLfn/I0/30pb2cGgRRtJVhwvB
	QJjOgN/2aLcySMYKyg2xipUpECbQrfgBh/ZehZ8XbHasjjpu4TV7xNcnvubONk6XTwfBEGGlrBx
	28VSezsmcxW6ZIEWHYkBS49am/kRt5Web+ethTkC1NEzlW8i8gbXvw4j1+jc99QteFNDkamgwjo
	5P3FGvkivlkrlRCgIlNZc4X9k4fJ1Q6Q9OYyCQ==
X-Google-Smtp-Source: AGHT+IGDlv/Wz2Tv0JI+8Hx2njCPUM9rczyDR5EAPHa4oqor0nd3oFYHO3dEgeKjIpQ3eleoyeURtg==
X-Received: by 2002:a5d:59ae:0:b0:39c:27cc:7ba3 with SMTP id ffacd0b85a97d-39cb35aa8ecmr14702868f8f.33.1744096676320;
        Tue, 08 Apr 2025 00:17:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:43 +0200
Subject: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zFDAJ44H3rDElvqiaNPmVwvOeCsvopBV8K2+vzPv+N0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2aCcCPhwuF/Scl+dWhUvbWutpdgADlyzo6E
 dkwEIOpAkiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cnRjEACRE1eo2DpKjHGbPlQbMpv86tO6SMwS6frSIq+KfYxOaODnxG0vYoNPl1XeTMMPfKWxuKo
 MspJKWTkvUN0QuIxmjcZ8vBjIh2Ssf2biltkgH+3Ut1/ExIvxXr/M7gT0UOy2/r94+c7DkVzBEK
 MXr/4KXQXVZ4OSvLf588xywzpAYfsAPShtYaqDz9OdGk8uc9fPG5lzGH4ccc++V5cuv0ZlY9tD3
 ZXnb+hLdVs0BvC1ESV29eq9xcIkTRj/KhdzH4WdJDJB4Fx4xRvCBxuTrv9+Hv2FE6VyVgnX8Knt
 wPQY7lA3cwjzj0sWtwauKnLeZ0x1DD6IMexNhfxrfvgGpEXh0w3i09yOn6vnAvTxetgrzUoiZsq
 5210n+9CVXDRsBqfEUuqtBOx2/HJBwMibEOeyf/tK8wVBtbrEFq1ji769lP5H/PGJUFNT0bPXLd
 vnKVHrJiJUiyX0REr7gSm1AjTYXZb/jNq6PcBIY1JG8vYGaruh/7KsvN5PbWlmeIxn2DIKitoEB
 5c3paQ4gObhMQ1lHal6NduGavNkTb99awzhp7MjrFLQ7vHEkk6LWPVdn1/obav1Qnh7bwi6/RYI
 rfIeivF5Tge1zaLyASFLrEOQUIffbwsDEofBTf4iFicbK3EDjEXXtUNKuD4DDgO+q2/1XPzUYDj
 IgJ4xDux3XMrr+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index ee7bbc72f9b3..a76f266b4b94 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -806,15 +806,15 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				  value ? BIT(bit) : 0);
 }
 
-static void aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned int bit, reg;
 
 	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
 
-	regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
-			   value ? BIT(bit) : 0);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+				  value ? BIT(bit) : 0);
 }
 
 static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
@@ -832,7 +832,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.set_config		= gpiochip_generic_config,
-	.set			= aml_gpio_set,
+	.set_rv			= aml_gpio_set,
 	.get			= aml_gpio_get,
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,

-- 
2.45.2


