Return-Path: <linux-gpio+bounces-18413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DEBA7F5D1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21A9F3B2F76
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6BA2620C8;
	Tue,  8 Apr 2025 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EFSvf1WQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC298261591
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096675; cv=none; b=OWfQ7RIrIL+sr3H4taDDzHWgeXpGiR1/ojRXHRcDI5Wduw5NXkdiUjp6E4Ksw04WVQFUdAFbD5KuhbNc8oe8p6+u6IjO9Ok1wRanKdx2SGxtnX4kuITaxsQzElcKK5Mm8iHYvpSs9FCJoBXHylkrBG8XrpWNB6IMMVB9IaGyFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096675; c=relaxed/simple;
	bh=rMoLNEgc8ra7f81mpaEJiXyRA6uVb804TO4wJizq22k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVrYXJtE7VCojzVucn7Fjf1CqRSulmWEHiGxNPAOJC2q23VUKbGBBTWOry+9qNv3qI3S82ITcm3yfKtWRn/89DAGGTLAejfo2jKowlhU9A9a55XGCgGNiSZbfTwAjPZ25+fx3VYzr4CT6EjPGdzFnuxcs00azIknXhVl0FQluXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EFSvf1WQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3067822f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096672; x=1744701472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHbdZ8I5zBJbhRifEOkTpCnTw3e9jVPzpvQJpqCzg30=;
        b=EFSvf1WQKpEWCnApfQNGOOGMqEPzX8xFBMhVaRCe5FcN7KbsgavU1TM5dOBX1Xqrys
         g/PoAYz4JYnwhdiicpg2SWpK+rTaPNhZB4P82Ykiz/MkHreacbO3pttwLm85pOdOZv0t
         CJ75QlsVMV6iiSDK8esSOVZWssltvx1DA6QxIIRO+GEH+GoU+AdLZZQpYEyP0dL6wuVl
         LVRtHQ3VpdFSRnxtV0jVylfSf+2ExtS9Cy+o0k+L+vzImzF1RBKckaAuUN3hrAol6CfL
         BpbneKOSVU3a4i8EgAR6DCZoB1UiQfk/1k+FMzJbzxHw+FVEaaUHVBmOBWEaq8A0Ss3Z
         TJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096672; x=1744701472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHbdZ8I5zBJbhRifEOkTpCnTw3e9jVPzpvQJpqCzg30=;
        b=ro1O0uQuo9tMRz/AXiXYBSuFL3ckdVqOQxUN2DNTk2oC1UTZVKhvwDcnS4b0payXhf
         sFgVTtLYMlOxfBN/zs5xjWlu7oo7un+izdheLiPzB8P8e+4ywzNiz1o+ivGgVkUibWg3
         63w/MImUJvNKC/KXv8cDHnXkPSQpI9qjKmTluBL3RXnn64oL8kfUEXcHtriIE4q7t/oJ
         FgFT/HOvDIa7Ey9E4ef/JO4ZT4aOvjZxkpP4g5HpsD5O0tb+j4nw2KzZ76j5nKrw+Dos
         LK5/wmX83iQjs1Ayce9I0PI54sU58JizNwj2yVLAVbfZd4IxYW6SXJblVkc03t6N4dgO
         Bcuw==
X-Forwarded-Encrypted: i=1; AJvYcCWYcr//TNwj0KwH94uEC5gplRd1T+St6EdWSQxAtkHpjxh0UXpGvdo/4nAm938pqRhQmqpLjTQABXFN@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRNEJzmDaq76r1OQD8HYGui1QIAMyEavqXUtfu7EjALi+zr6T
	TAYRxQsG7h//MWheFSVZy3kSJEPlTb2ce1nWogCC33IH5ek11E7mdcUVteW/1go=
X-Gm-Gg: ASbGncs50wyk9mN4pEx/EULbvvIP/Q83FMEYHMYU/XtR5odaNTXWVBGsZHOUtF6Juch
	7sjyVUGDPZBKHbcflzJp3M6zFhSKsBxF3EZaJ+bqQNqkdg5+nSnirGImkyjfhYHeA/xS4khgmkB
	TGGg3jUQAQZQD+CUD4oAOnxR2wrQ06JjH9hz3ZWDL5uiq+xeq/FcMlpjjzoO3NsMJNgeJ4EoBgm
	9tv10xhsRsVrEEJgQjq1aVaqhjwFqLDN5HX6oEusRFhkOilOq9ndBfXFSDX7wNbX14volegGnsh
	jL+cHisnLd/S7i2Xk9g7Bra9Vdvt1diSTYEvog==
X-Google-Smtp-Source: AGHT+IG66JLNMA6/+F4yvPGqakGWzMF6ZtCNetVsbjFv2aPqMbejsIAN56v674i7htexv9OZa2w1UA==
X-Received: by 2002:a5d:5f96:0:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-39d1466229bmr14181138f8f.53.1744096672155;
        Tue, 08 Apr 2025 00:17:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:39 +0200
Subject: [PATCH 02/10] pinctrl: rk805: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-2-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sUTrzWuOo7PVik1QzFjSyEGMbbgvgdGB1epc3LKWdY4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2ZtGmml6ycwEzk3KhRs/YW0AQqsaUfB686c
 +V6uDVoAR+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 cttsEACbtqoZ/RYzP/rSItzAm6RyIKDSI67qmiaM3eZO+Qwuz4UvIvJ/GL6pV94KgneXWwmwPKo
 P7ywI2W0szbMsr9K+DM7p2BGeLSS8pyImHtM3ITgmaayPUvVb3Y7MrTj+v9MYNRnjYl5sGRlIjK
 1EmAEesdJqsGiDikg07oXYnqGVad+4NJ2zxDtQ5n7tB3ShEJusRuIFA35sixjIGRTR4Nr+0DmSH
 ARiPMtTFkfjtgsXBEDCv0PRzyup4961wgfvFgQ7GRwqsXxRacjsZAEmoYduAjZjqdJ1dny8C8i/
 Evwq8RUqfgTcjvwjmVDu3klH9BEGNcZX9frolFeag0oRT7/RZHWm0ZxaKaU4rlH/E0Io6pd73nU
 sw0vsjb8AZuD4il5knSflEdQN3RuRoPp/QdnpHdPim0zwLKdIVMyzNu6p2O0tRQGmQi3tJnf6+/
 +iwIO4FrFQOgX9vh4VdG91Tuu+BBuoCRJMWkbcnWF5dZaX6tREBxwtDhCsxPH58+4G5NQgX0XN+
 IJgHJLn/R/KYnp/l1eWewkxcLXRRPGbcaEUJ5lTHuvd6fGpdv0Af4X3rK0WZJ6UwBJw5u6pQLY5
 8YdLZCYvmvA8jSXhIocYAmemyaGKAMW/JnBi6mtMkH5dOwmpnp+SvX5iwwf+9a5m+kDEg4dWidg
 WpA2txNtQ9d547g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-rk805.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index c42f1bf93404..fc0e330b1d11 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -325,26 +325,26 @@ static int rk805_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & pci->pin_cfg[offset].val_msk);
 }
 
-static void rk805_gpio_set(struct gpio_chip *chip,
-			   unsigned int offset,
-			   int value)
+static int rk805_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct rk805_pctrl_info *pci = gpiochip_get_data(chip);
-	int ret;
 
-	ret = regmap_update_bits(pci->rk808->regmap,
-				 pci->pin_cfg[offset].reg,
-				 pci->pin_cfg[offset].val_msk,
-				 value ? pci->pin_cfg[offset].val_msk : 0);
-	if (ret)
-		dev_err(pci->dev, "set gpio%d value %d failed\n",
-			offset, value);
+	return regmap_update_bits(pci->rk808->regmap,
+				  pci->pin_cfg[offset].reg,
+				  pci->pin_cfg[offset].val_msk,
+				  value ? pci->pin_cfg[offset].val_msk : 0);
 }
 
 static int rk805_gpio_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
-	rk805_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = rk805_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -378,7 +378,7 @@ static const struct gpio_chip rk805_gpio_chip = {
 	.free			= gpiochip_generic_free,
 	.get_direction		= rk805_gpio_get_direction,
 	.get			= rk805_gpio_get,
-	.set			= rk805_gpio_set,
+	.set_rv			= rk805_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= rk805_gpio_direction_output,
 	.can_sleep		= true,

-- 
2.45.2


