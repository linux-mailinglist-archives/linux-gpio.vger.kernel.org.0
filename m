Return-Path: <linux-gpio+bounces-19245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C0A9A626
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A14439248C1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B79221551;
	Thu, 24 Apr 2025 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DFV0cnZe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D0421ADB9
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483754; cv=none; b=n4BaJwpTn/k9YqRPStBpnRs5ZQQm1xNakJFJkKKiiEGR9GAwVTvOUKAdKW5OwZpHxB/P66dyL37Kr25EQYBCgHub+ivZnuaLDv3Xwh/XLbfble8P32FthwnXZRlt7z/ldJvVUK+nCesg8TTV/ROQT2JqPPF4C/3fmQ8BYNaFss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483754; c=relaxed/simple;
	bh=sKYWu6jHhbSmv6vkxRQlHne3ddHKLG4IMVxzbEesy6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A7yqAqBMa3IaJxEW4K+bpu9Quc0tYwi1vbqTyilEsc3vlFhVb2spnUzkzRfBpzY4pmnaXehQblWPyGQEo4SasW4Ic0WI4gqgqhpRH7tE9/6Wa8gX6RY5e+YHU9EzmemFzWXaD9A5y7q3LwPfzsuXAiekAxKAmFNj6IVHe/Qmx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DFV0cnZe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so451719f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483750; x=1746088550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcE3wUuPhjxXCt0ZMpAZ5x8qSYr01DaOTal5Jl8GTWc=;
        b=DFV0cnZeOPM5Air9yBYbe0la9AG2VRFcTDkQOHR13p2RaOIG4MNiXFYt4WbiYFLwGQ
         lVZ4jRRxm4OGgGqnEID0JvsXk8YlUQis1OzPUkFqMBRSptreUNHItOAsVRJBoLCfE9aR
         YP73XCz5KreDeqOGGDhNzjztiXQ492qwycHGiDjZtHH68pkaXnVMd4GARfOFDyVz7SCY
         tQWQxDuf2nEbX+4DC9ZJSGJY36wi0/oArJN5ou3AIr8VCfSV1truArrsbszF4w+lvpk0
         ch7BjO4UNRv782HoeOJDKKdecrpVY2X9He1esy4FLIeveV0+J6sbFU7wbM2QcaAcHy5M
         KEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483750; x=1746088550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcE3wUuPhjxXCt0ZMpAZ5x8qSYr01DaOTal5Jl8GTWc=;
        b=pSu1tsWK6Q4oGhOuf/fI7xWePzKOPZCCFBPx+y3KJTs09D5RGXeEXChSFkxlBji1BG
         dyr3IotFKBEF8Exhv/tWF2NwPdSlyyM7cqi7RcPcXEEFMLcYS8+yTi5CfDQ1E0r/LBiU
         2D+BJS8Qqq8MADkYbvx8SCPlQ275GQVwycRCBGPF19KXHuGayGH2h5w5ZPqpudt7hJko
         I1jN5ETL9jDjtZ4UZvOTCQyorusBmirF+EXyORDOppgoZ4TGaysHxkkL4lpFbehY6akd
         0j/9io0x4yKv9OKjl0vwNWFDYC0Z32wK9rcVC7NgNLgNNYBVpgiDbYU4RnZmxZoxmnaM
         7ajg==
X-Gm-Message-State: AOJu0YxUU2963Zzi8iEXxdxKmaultZ+awrnvE2r1jrpiqGU0hWusL1ew
	vN19KfxK67blfqkli083vb7jlTOGC5qhQwlLWXGONh3fzXRqxk5LZ3BRZofNVlA=
X-Gm-Gg: ASbGnctZolk1I5OnDUaPRJWVEDD9txgWDvEIirWVCtCQSLmtVp3R/rcWnXFushSFa07
	PcsOy5/rYvjYy3l6/7WRkteKiK2ghcKCVtrkiC5eAuhBYblcS6fod6/Y5E9xrNas6YxpYXxSP62
	aFdBDK/79y6mpw89AeZrnPUxzKs4AgGLiF77zztdDuOsnusyATf+9JaPT+RJ6f0LnfqPkjqH3MM
	AS+bHDFUsQ1NjJD5OG6d0o2ChqR6nI/5ioSKjoAKvgxvxAPRDNTHm2hTnji1beg7I4Zg0tO2giM
	tzNOUVfmW5IWGDM19VkCHgHq5Zctd/YScQ==
X-Google-Smtp-Source: AGHT+IEsWzX9QhjOfL10bahhvABCZZd6/bNw9ibC716v4NWqAwsMmmJhcU6LjMO+0JhmAyeRMjtJnw==
X-Received: by 2002:a5d:64c7:0:b0:391:4389:f36a with SMTP id ffacd0b85a97d-3a06cfaf773mr1144784f8f.48.1745483749924;
        Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:28 +0200
Subject: [PATCH 05/12] pinctrl: stm32: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-5-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AUxJDyiCjGLivQstc+QVCLPEZx1XbvG4rMuoF9PwOpA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbJ94gWt6uen8xm8HSBtLyBXeG+3LKxm5Ag
 6RCSTsSwR6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 csj9D/0UiFkS9Foeto0KsdJ24lw9fG4urXmVGhvgv6seCM1EF6eDkw6PCKi4GBqQSeq1yabajRg
 DJXMHRA2AfiRzQqGNnP+t0bEm8pKAY8qKJDpI9ThBQQldJkCol2eNZiexSOlIp+HB5u70AcZKJG
 qzk+58HlR9pOEUN4kaRpkfYa6HeEQH9adnDnZuTt0IzDBPPWb3fefH6xfO79VUAhbX17E3ibf8w
 Zh+ugo2z+8aopq+4jxhsFaY/KgyoW4cURWjpX1D4fFt9WO2EJvHFAZ94pCGsBCDNkKFZDq2PKfl
 VeM1bBsgYFnn4dOFhLSMUbzeN/aEnRIePjyQpJXjmW3l383Ii6unpjfYe5r8UGQ2agPamvsXk79
 XL+90Ned6wgRaRoItB6reFmzOlTkFWVuhDpYtFw76WlTHXdRyuRcHIeWW5GTCbR6T2rwtazHM86
 hTAJY0qL5kAqiwBym23NK2AyHgfDiQo6fLLXkD0L0lDFqeViTNAC6a6ijPeWzs+O6wwM7z9CZCq
 jjCiefFTzSCKU9C2IN3eaizpunc2bYNq4i3MgnxktLJTsxHsi/WGrNlEZxasOkPIOphKYHzXYsx
 n6S2A6WN7t2UBoUeNEArpG8J57u8CB6stqeMrr95xzc0vVgiX+Jxvez4AOXCcBDYLfmDSXTsOwB
 ehvgs5t3m2Tkw1w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index cc0b4d1d7cff..ba49d48c3a1d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -228,11 +228,14 @@ static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl_relaxed(bank->base + STM32_GPIO_IDR) & BIT(offset));
 }
 
-static void stm32_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int stm32_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__stm32_gpio_set(bank, offset, value);
+
+	return 0;
 }
 
 static int stm32_gpio_direction_output(struct gpio_chip *chip,
@@ -308,7 +311,7 @@ static const struct gpio_chip stm32_gpio_template = {
 	.request		= stm32_gpio_request,
 	.free			= pinctrl_gpio_free,
 	.get			= stm32_gpio_get,
-	.set			= stm32_gpio_set,
+	.set_rv			= stm32_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= stm32_gpio_direction_output,
 	.to_irq			= stm32_gpio_to_irq,

-- 
2.45.2


