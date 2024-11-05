Return-Path: <linux-gpio+bounces-12556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4F9BC6B9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 08:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 998B61C221B7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 07:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE751CF7A2;
	Tue,  5 Nov 2024 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X62WKW/x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA0318A6BA;
	Tue,  5 Nov 2024 07:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730790954; cv=none; b=YCRzKaJUF1ZHvYuo7xtZDaBrLjrENEtbWrB2/3EyQRmaVniNtTbv0Xcigq1nSsqT1akuWB+AOh2T5Q67YTdAZoo3RqbTC9m3KAqed1tzHwwVbKiOd0UtSbVAH98bcRg0PcmujJF8x/7rPXVyL1FzCF2eSzh8rz2+FQl0avR3r7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730790954; c=relaxed/simple;
	bh=bDChX5DkQVdrQna97kJP/N8tCEz8lU/2/PDbRrhKUGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+IdRt9ApmVV0uaiopvaBvAKcNxbw6AZOkiUboE/+06BCqL/z5/LCZ8+qNew9By4+WZ6JQ/ZE4HwO40rnWVnopdobtyIutxGbpt5gPzeCBlVEU9UTktzKFebL3xuNMckcUHySxFwAeJ62tUIHHByQLDIBn3t2+lGCD/Q/GQgXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X62WKW/x; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7eda47b7343so3164916a12.0;
        Mon, 04 Nov 2024 23:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730790953; x=1731395753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iz/rHRFBcREQc4ZZLNXrKKaJvBiY7ob4s58NQYp/eAs=;
        b=X62WKW/xRF7Nhmiu4Ls6VCX4TTpsqaVYP6ZERFQXQ2xRn+ADmCLiyNh+wXxXl1MmMt
         NlXL2zBubd0IjJzvVq8NELz7qxRO836PfpxiwRG4Itzq806IMxH9f2H1oCnqIZRz70GB
         LblkHgwCkjD7fHY/uyMd6Lvln5TaAyn5BoUQ9e6gM4OZQfIWcdb0LshJX6JsKyMUMxdC
         weclit0A+hZcQCg24AzRSZ9sD+ydjvqkZfXIC+b9YcPeKKdjpLoWZWaoy+1wBM6XEwWm
         P5x8HHIs3FPnftCnRdu/wgvIbAmb8FmxN4yieEv9hWr/t2hjWJfBoAUv7WCREzJhovYN
         ZA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730790953; x=1731395753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iz/rHRFBcREQc4ZZLNXrKKaJvBiY7ob4s58NQYp/eAs=;
        b=lMnrvlAEff3R5T0/9A4YNheOV0VlbU2u19BOVQxmKhXmfXSxlqkDQedSDg+2osUz/l
         vkTK0D6tR6KcPaNJ1dr0NRx+o85tWyGXYPxBTkXgjZE9V+Ik4PHFw82MCSVo7zOf0Hf1
         gtxFPf3fEET+qR4tzATsN2aKO/F5zPcuPZVWMWfsWqp+cwu6ah5COA/75ZYgDUrP8SBT
         6GI3aGbuauKY8ypW2tidSpuLzZ8yj13O8BFL+fwo5Iok5IbMyYVSMhhe4lRv6YJabzrv
         mtBytGa6AWBdxeN1L4B7z4Mmd/u/Xh1ngrlHlT2+IxrjQ7NNRm2NiGLmuyhVkOEPzwUU
         SqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkrlvOOSTEKG65s7VsZggLi3gCRT8EO5JelKegWBiwrnR9c/OLYd9gsXXvSnFe1RuGoRpz/pX8AyFn@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsm29GQbDpo8jql0fCr0PxSPKjuVLtnYe/I4m1hReqpug11o+
	qNwObBCB4eN144zFgOVPceWpnSIw7UD9DgUsVnU9ET1+OU4y1fv0I6fuanfX
X-Google-Smtp-Source: AGHT+IHryBz33ZfG+cGFeXdABWiRWMLtgcqure7yjXNkzz7ukZK3b3/ngIdIO0CJnk7GMr4cAnSsOA==
X-Received: by 2002:a05:6a21:38c:b0:1cf:4ad8:83b9 with SMTP id adf61e73a8af0-1d9a8514112mr47980753637.43.1730790952603;
        Mon, 04 Nov 2024 23:15:52 -0800 (PST)
Received: from optiplex-5070.. ([182.66.67.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bbfc35b2sm8894190b3a.0.2024.11.04.23.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 23:15:52 -0800 (PST)
From: Sai Kumar Cholleti <skmr537@gmail.com>
To: andriy.shevchenko@linux.intel.com,
	bgolaszewski@baylibre.com,
	linux-gpio@vger.kernel.org,
	mmcclain@noprivs.com,
	skmr537@gmail.com
Cc: stable@vger.kernel.org
Subject: [PATCH v3] gpio: exar: set value when external pull-up or pull-down is present
Date: Tue,  5 Nov 2024 12:45:23 +0530
Message-Id: <20241105071523.2372032-1-skmr537@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZykY251SaLeksh9T@smile.fi.intel.com>
References: <ZykY251SaLeksh9T@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting GPIO direction = high, sometimes results in GPIO value = 0.

If a GPIO is pulled high, the following construction results in the
value being 0 when the desired value is 1:

$ echo "high" > /sys/class/gpio/gpio336/direction
$ cat /sys/class/gpio/gpio336/value
0

Before the GPIO direction is changed from an input to an output,
exar_set_value() is called with value = 1, but since the GPIO is an
input when exar_set_value() is called, _regmap_update_bits() reads a 1
due to an external pull-up.  regmap_set_bits() sets force_write =
false, so the value (1) is not written.  When the direction is then
changed, the GPIO becomes an output with the value of 0 (the hardware
default).

regmap_write_bits() sets force_write = true, so the value is always
written by exar_set_value() and an external pull-up doesn't affect the
outcome of setting direction = high.


The same can happen when a GPIO is pulled low, but the scenario is a
little more complicated.

$ echo high > /sys/class/gpio/gpio351/direction
$ cat /sys/class/gpio/gpio351/value
1

$ echo in > /sys/class/gpio/gpio351/direction
$ cat /sys/class/gpio/gpio351/value
0

$ echo low > /sys/class/gpio/gpio351/direction
$ cat /sys/class/gpio/gpio351/value
1

Fixes: 36fb7218e878 ("gpio: exar: switch to using regmap")
Co-developed-by: Matthew McClain <mmcclain@noprivs.com>
Signed-off-by: Matthew McClain <mmcclain@noprivs.com>
Signed-off-by: Sai Kumar Cholleti <skmr537@gmail.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpio/gpio-exar.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 5170fe7599cd..d5909a4f0433 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -99,11 +99,13 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
 	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
+	unsigned int bit_value = value ? BIT(bit) : 0;
 
-	if (value)
-		regmap_set_bits(exar_gpio->regmap, addr, BIT(bit));
-	else
-		regmap_clear_bits(exar_gpio->regmap, addr, BIT(bit));
+	/*
+	 * regmap_write_bits() forces value to be written when an external
+	 * pull up/down might otherwise indicate value was already set.
+	 */
+	regmap_write_bits(exar_gpio->regmap, addr, BIT(bit), bit_value);
 }
 
 static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
-- 
2.34.1


