Return-Path: <linux-gpio+bounces-5762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DB68AE8B8
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 15:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 004851C2173C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 13:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD02B136E16;
	Tue, 23 Apr 2024 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kfVPArjx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF01136E05
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880445; cv=none; b=KVg4YP1pAPVL1LJEvE4RxEEOftMpSzn6TVm87Ia9vv1Slxnu1hD2Ersn16j+jGzLFYWpITqmrId61nRBOyAD43tezUpA+MTIkQ3aq8PKzgOsk1rtzOwX7pQkeuHVMGI+7LPyso8H9oN2l4/Gd9NRNvQrnzhtqhNDJHlVnnyTuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880445; c=relaxed/simple;
	bh=grpQ83LFr2QOET7Wt4Tc857g/QnpjTwTFqd0fCT8jpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkPLt1QcxpUEVVxzbq0WFkDQbpUzoUhG6lK8xfAsj6knymuplOB+qLaEkEN2WCT87sKzXHzPqtHl8CTT53Oz7AuLDuyilSTEkXOocC6Ih8nazNW38SIPJyihDBtggiZlyQ/Srw+Z7HYQl5SHCL6khd2A37xWddYYcUmmOb4Y06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kfVPArjx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51abf1a9332so5708536e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713880441; x=1714485241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bED1J92t6L8xqCCoMd53N6tL4C0DTI8s9irWtXqiNYc=;
        b=kfVPArjxxNCw11jp/UPXbWxm7azo4KYVopV39tc7hx7V3GtSPDrH7bt8AsAx+TT9GF
         WISWQeFAc00ly8Tjkfya0L8c7IpbUFT2qKI9HyznfEj1tF4wdTSraJSHTTj08m4pRgwS
         WTxe8aARDF/6V3P0CO+pC3/DgfSDV4rtGDdk5LLXbRsGeQpwrzXFhXemNgMBj7r/uVeh
         8L3ldZ1fmNII1TsLEp5ObqS6BiL6hog1EVxYJ2dOgDEqK26RF/3woPWrqKEC8ulrErkk
         dhPmhTDYDW2OhEeFyMjdARGjYkKE3B2ZNMiP9njMVrTJV3m9bJIebIrwNgTSmvbPPLQs
         haEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880441; x=1714485241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bED1J92t6L8xqCCoMd53N6tL4C0DTI8s9irWtXqiNYc=;
        b=q5qZxvrz6LfCLrO5Oe167GFprAOhXbpUcbwSYxAYf2qhYenjSQeCctYnZn2FJX12Bv
         LpPwtn+/KbNXw5DAMACLtNfU6byOgrgssfQ8iw6TiGnvp8SftXfvQfJduMKmFRG4byLd
         mOecZNlYD+6xLbokFBqJN1P9cW8kHhGVlb7pHvUCvCVlnTYTBmmmeGauQX8pPDS9SCGE
         5c+3eFZ/vqEYH4Cn9/66muvIt9agbBoWhxVsKslEYFn1B5P3roZdaIvljtE6tMU+tgnY
         XrXIRE+OMEF3IOxPsa66GSCEIK8nntxn7LPQrzzrz5hKSSBsXjeEsngJD3U1izYCMbP/
         GiOw==
X-Forwarded-Encrypted: i=1; AJvYcCVEQi0vubRgkQ3R1mx2Zcb2jjoIV3W/4eskmblsOjLnjS5fRLTplqBU1AXpOgwbk8GjLDoPU6XJ1BlgQWs3KldmJwNfmKZBAKIU4A==
X-Gm-Message-State: AOJu0YyYnqGoPxUtNvIer92NU3DKUcLG+Ept3iXRskVjjpNjdco8zC8p
	+yLQLHXnSkanHiwjG82Zs/w6jLAfP5l4SJ22JO2gAhdnPUkwP5lPLTcFNv/A8Gtu/4YCfI6VDKG
	y
X-Google-Smtp-Source: AGHT+IHyO0PxjAJE6IewIDC+ePQ55Uzrd20ljTDYwFM1JodsG0AkTrhFmiNM3dMdYb8EV3ngM6wXpA==
X-Received: by 2002:a05:6512:4d0:b0:516:c7c2:23b6 with SMTP id w16-20020a05651204d000b00516c7c223b6mr7594408lfq.9.1713880441502;
        Tue, 23 Apr 2024 06:54:01 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b18-20020ac24112000000b0051a61f2d251sm1875997lfi.290.2024.04.23.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:54:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 15:53:59 +0200
Subject: [PATCH 3/5] ARM: orion5x: Convert MV2120 board to GPIO descriptors
 for LEDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-gpio-leds-v1-3-799c2f6bc61c@linaro.org>
References: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
In-Reply-To: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

This makes the LEDs on the MV2120 Orion5x board use GPIO
descriptors instead of hardcoded GPIOs from the global
numberspace.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-orion5x/mv2120-setup.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-orion5x/mv2120-setup.c b/arch/arm/mach-orion5x/mv2120-setup.c
index 2bf8ec75e908..b7327a612835 100644
--- a/arch/arm/mach-orion5x/mv2120-setup.c
+++ b/arch/arm/mach-orion5x/mv2120-setup.c
@@ -8,6 +8,7 @@
  * License, or (at your option) any later version.
  */
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -139,34 +140,45 @@ static struct i2c_board_info __initdata mv2120_i2c_rtc = {
 static struct gpio_led mv2120_led_pins[] = {
 	{
 		.name			= "mv2120:blue:health",
-		.gpio			= 0,
 	},
 	{
 		.name			= "mv2120:red:health",
-		.gpio			= 1,
 	},
 	{
 		.name			= "mv2120:led:bright",
-		.gpio			= 4,
 		.default_trigger	= "default-on",
 	},
 	{
 		.name			= "mv2120:led:dimmed",
-		.gpio			= 5,
 	},
 	{
 		.name			= "mv2120:red:sata0",
-		.gpio			= 8,
-		.active_low		= 1,
 	},
 	{
 		.name			= "mv2120:red:sata1",
-		.gpio			= 9,
-		.active_low		= 1,
 	},
 
 };
 
+static struct gpiod_lookup_table mv2120_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("orion_gpio0", 0, NULL,
+				0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("orion_gpio0", 1, NULL,
+				1, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("orion_gpio0", 4, NULL,
+				2, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("orion_gpio0", 5, NULL,
+				3, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("orion_gpio0", 8, NULL,
+				4, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", 9, NULL,
+				5, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct gpio_led_platform_data mv2120_led_data = {
 	.leds		= mv2120_led_pins,
 	.num_leds	= ARRAY_SIZE(mv2120_led_pins),
@@ -219,6 +231,7 @@ static void __init mv2120_init(void)
 			gpio_free(MV2120_GPIO_RTC_IRQ);
 	}
 	i2c_register_board_info(0, &mv2120_i2c_rtc, 1);
+	gpiod_add_lookup_table(&mv2120_leds_gpio_table);
 	platform_device_register(&mv2120_leds);
 
 	/* register mv2120 specific power-off method */

-- 
2.44.0


