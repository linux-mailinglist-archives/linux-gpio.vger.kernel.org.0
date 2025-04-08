Return-Path: <linux-gpio+bounces-18420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B34CBA7F5D4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFC03189A42F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92299263C80;
	Tue,  8 Apr 2025 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1TvA6aIa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AF5263C8E
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096688; cv=none; b=lSdO03XjQ+f6+iHdRn4X3YSToCKtNsQykNWAt9C6LRrJs/C1PpRcEOLCAXfOIxK8F/qGGopD1u0JXRi6uWMNXkQdALvUQa6SQ0SG3QjgCRb0ADAZlw04RFWOy50gRnjwcaA6WqRSkXdBX1xuhJRQBQiOU79EuWe5UFHYc0jyTP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096688; c=relaxed/simple;
	bh=l752bRx9ig6/DZFR1lUNJZhYOvebM+yZK6p05T8xTlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScjDRZBPQTtcUu1GQsfJV8tnLu4FsspYgBzhZx2L4HIjRewz1EVzUfWv0Pvwcp6OS7ZPs5y5uBuXUKnQmZPNfdFybk9UyXhajl4kPLA1lJlsyybrcwzKVNjxAiXe0kFFEvLSba1tNcwST//IMHktGj9jWzh4N0mtnYfCET+zr1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1TvA6aIa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so35475525e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096685; x=1744701485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HVOt+4srGnvQwsP1v9+2VHPQ1xwkV/AAlcGkzlseiw=;
        b=1TvA6aIa/P/3W87lXp1RxZ3twYtkCNekFbF/a681O8Lr/RFQvOiwxiM0DZf+l7sdxx
         IRMuJvgu3/QwLSgHyUBF3T5tQGTkMopiJj+mMVG11AUkTFPxcGcQhdoTMekzmtbMMf0b
         dR8bqcNIELHyAcmsVO/jbKX1XEw2ivfHSbdsG2hNfNUAXJAxnKHCxGxIa/fsGosb4+53
         9RefJbr/jiCseA0VHteJC+bLPFdn43kyle0fsDO6CwjA0XeXbEEvnk0IGZm1CfCqDHGm
         g65aG/R1wiDsnIiUX/uZfceuH/rsiY1S8aCKAJXeaMgiT5yNDVBfAuNNFDAXDNY2qlwa
         8/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096685; x=1744701485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HVOt+4srGnvQwsP1v9+2VHPQ1xwkV/AAlcGkzlseiw=;
        b=AyQ9xtpexyz+pBqcD3jywA18UIhFl1upysQSAwGlodQfLDdMTKV1P527qlY1uvC1SH
         ON9GbqHFoTNqJTTjEtxaEXSxz45mV0ewQ/X/uA6SvQDEZJICOyoSScSj11Iay3Nj8/fj
         OovH5a1TzyesPho8qDLEc4/55Qw9Sh5Q1UgTUuEuXZPTpsLVuFym+wc8WnFbVDRpgqlb
         ZUKEg54iau+3dxMw1aDPvePAjzW2auT5/i62RJQ1cWSL1YZYZKTMCg1IDCx1n1bM9jA9
         qhja9/CUyZauyiIKbZRQK0lPPSz+/LAT/5/Cio4OUISUk6VXWZTKIRSYU05AK+QeUs8s
         VPqA==
X-Forwarded-Encrypted: i=1; AJvYcCX2K+g9L0w+BDGlsBhNzc4EN7ByDXlUZDU+b+Wnqunw+eHeeJcxFQ0yutw0lw9iqzfxseoYNYWGRtgf@vger.kernel.org
X-Gm-Message-State: AOJu0YzxknFvP35ekUIISIhWyHOTemtAD/Shn3h24kG9LKlELdQ3wBtI
	r7fNOmzapnY9SnQ+7f74FEAWH+PNLmQxEZfRcw2pVRb1Lm7BFFqFZIInbjznzoU=
X-Gm-Gg: ASbGncteYhhEsEU4ab+A6FagpW73b2taNHIST4rMXuTGP4M9RoSIN3Gyk0ZpGbW0uem
	D25WaFEhRHyVJ3BJJ+LEJXiYaM2R8R9G1BVHamhPlxcTgaEv+3vmvudj2Gbao9b9APV7ARfK4sv
	bvt8GnZyLZ0it3I9Oi7BztWyCR95jC0/AyOHX9udqBlLgDdI7HYvl7SuBhfLdAxA87x0FN9C7nO
	+THWOqQf1mesQZgcKSYFGLKutLRJCcjxwJAOYpRwdpLiJUMY2s26pCE/qPY5d1172BQEHsUNLoS
	E/V00fDJ6uYlZvgftAyQnDjviaLoH0yr3BS6cw==
X-Google-Smtp-Source: AGHT+IGSySduYIODYDDBNhKW+V8JxaftIxx0mbfbLM56e4WvjRuBEIilNZOQDJkJo2kY1AIOFFw1zA==
X-Received: by 2002:a05:600c:1d28:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-43ed0d9d18emr123594385e9.24.1744096684912;
        Tue, 08 Apr 2025 00:18:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:18:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:46 +0200
Subject: [PATCH 09/10] pinctrl: ocelot: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-9-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=spvpQCaMJt/FlIsnba8JPp3MhbofiKGgIiv9FJg4rZg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2agt3O6aR1vCS8hOqHTDKX4aiCLJ+nYrJpF
 NCIW4f85ciJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cij6EADKyrhyl0qDS61cTLux6MOWrF0i8ovx0ZQmpwIhr0Bg5B+CblqHxvZat19Nu7Z/KQuhoxa
 5a4ZjXS8zPhwsmNHcJL8XmmCO7AuZyzbIw/dJAygTYI6OrSzueQYkwP5vZpAyxet7FuT1YH5JCw
 AKvK5JuGVvzXt/1+S0QhyqRa1DBk/r9qW/PGztC+Q+1JIP2r7feH6HlncUVIUwcUmAtz47d1GKU
 d9WdVpTnCDHkoQOSX43tLjkyf+bWEUz35UYdBYvlfQ691lbhiEgyJZo8cU56ecomEvyTazRrZel
 IPsNTSh1TYRxmQ/gG/yks6vYRor8W09Gaw0FrsS6r5ifS5/BdkYI0/W5gX6I54YDaQYReRflW6G
 e96ttMnq/Z8KuMsKIUEteJbJMqomGgb5fJ9q5gEIw3QafPDTn9G5b99Jco4HVa6RwDPA5/LAXmY
 ttBiDSb/t7dTmdHdHxNHdzkYKzwk2MxkH34FBOX0/wo+7HoCuAeePRR1D72+DhbDm40qtzwPhIW
 Tkd+O16r6I0zfcX4kMUD7znBhtCMNTTSCyKjzQofWO3wqRQmC/lxZU+m+9WjsnCobS2jV6bTGb/
 6HE1y+gTQLWisUWQCGbsYviBPph9oEM1aA7O3zarkvGGcMtGx5/W0bKBdZ2nCh/us7+xv45Qh88
 jH2gOpx/XG01JmA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ocelot.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 329d54b11529..fbb3d43746bb 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1950,17 +1950,18 @@ static int ocelot_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset % 32));
 }
 
-static void ocelot_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int ocelot_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct ocelot_pinctrl *info = gpiochip_get_data(chip);
 
 	if (value)
-		regmap_write(info->map, REG(OCELOT_GPIO_OUT_SET, info, offset),
-			     BIT(offset % 32));
-	else
-		regmap_write(info->map, REG(OCELOT_GPIO_OUT_CLR, info, offset),
-			     BIT(offset % 32));
+		return regmap_write(info->map,
+				    REG(OCELOT_GPIO_OUT_SET, info, offset),
+				    BIT(offset % 32));
+
+	return regmap_write(info->map, REG(OCELOT_GPIO_OUT_CLR, info, offset),
+			    BIT(offset % 32));
 }
 
 static int ocelot_gpio_get_direction(struct gpio_chip *chip,
@@ -1996,7 +1997,7 @@ static int ocelot_gpio_direction_output(struct gpio_chip *chip,
 static const struct gpio_chip ocelot_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = ocelot_gpio_set,
+	.set_rv = ocelot_gpio_set,
 	.get = ocelot_gpio_get,
 	.get_direction = ocelot_gpio_get_direction,
 	.direction_input = pinctrl_gpio_direction_input,

-- 
2.45.2


