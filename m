Return-Path: <linux-gpio+bounces-5761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 395518AE8B7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 15:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28A7288276
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 13:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DA1136E0E;
	Tue, 23 Apr 2024 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djfVcRMQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0761369A9
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880444; cv=none; b=DfgvGWHxKdhHC7Hbwdf+FHs1x8g5Uf4nmvXPvF4mX2y0UZocgP2dh+AeIQODUviqmv2pdIJW3ymIrIPla0ApArCVMF+EuamSGqB1ABW7vWYoNGKZ9LeRlCG/5X7NH7NcuJFLCvECfDRBWp1J9Z9IWm/opq8JcvNiMyyWA/qCz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880444; c=relaxed/simple;
	bh=YpJzDzC2/F1jXxUrSp60Hzo019b2vBYuAMaIAzEoIbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PacBhB746tbZhN32w+cQ6ja3fGYHepVlt79XGVl2efE5Fl87s1uV3HNIOFn70zvFqR3Hd3bg5NT27wJYAqHmwVr4ESE3Eb/+1INAgv3ljQsMEFj6B9QgGMLDWQh8MlVUsk/kQwgJhu7nJkpmZWawHN6zhJTBbH12loshzlyqYfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djfVcRMQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d3a470d5so7042781e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713880440; x=1714485240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gReuYTpcRssmlbBTeL2oSNhhV9ufTFwwH1vDMi+LMNc=;
        b=djfVcRMQlEtTYBwajnHw3cYo1T1SzKTOEF1iAcSPnQsXYc7Rb9M9rdw64W8hkx6hE2
         C3FkqQ+e/h74DGlvOjlwMWIWV7rg4dDQa63rM4zC6Emyw98g89I3pxIir1HGdtHy9Gv0
         n7B5TrCKWdqLVJgTNtX3pYCu9hcahWD/GvQDvZKcGfpJNJx5eBC7Jgn/ctZaUCV7mcGD
         iAo16BTKr7VLeIdRe56EywKygohFZiWuYSWxnNLuLfklH6uQ9Tk6Is10u4S7DiBnTkLZ
         fIUSpstGct4+x+7ux9MXNt4xP1QRhA72sKgyS3fsSrCCAMQ8NvGmGcSGr8sbVZqcqJ16
         7M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880440; x=1714485240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gReuYTpcRssmlbBTeL2oSNhhV9ufTFwwH1vDMi+LMNc=;
        b=FMaRdtf+qJ3LUPMNKwfzcH0/ebBfAcnCn0CudxR9LMNGclpOm6MrJi3q4fj2+zNvOU
         7G09Mcn9p7rcllvMSKJcaDgt0ufL7flZqJLTY0CMASzZ3ugOvOGcMenzSI/1tq7wozJC
         4yVCXmS7Odlw3WwfF680Az/dLfRAa4Ar6/LLXAmMPx5eDJwuqYkHb25i0DhmUV67LxzV
         AMHAFWFVbEq2SSvZ4Er7qvkjjHp/rIE/cgI4UVE62ivxIv5xKl0UjnURi9N1yVb1ldri
         SdNAwPn2qxZ3Du/W62mCEkTmHKet8EtsC8HNQLIjV4F78OB1CoZxBvNOSWVOypQQzHJK
         +S6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUe3xe8syYe7jEL0r2nwDlHRcC6BQS0AIDn+kLdJMN6ks6K8mwVSEuoz+n7dS7mRE1EvGy7icQD65HRi6BQGd50VHSmRR/A8K+z8w==
X-Gm-Message-State: AOJu0YwH6M73+yFgao5LrFqvzT+DXG1/p8Nyu+BmfPPBOoKiwV6whdMn
	bGSkwAKN37/0MSAPbXMe+AWokokE1kGOdIb6yRl20UT1cByXZY91KND73nydReYDcsAc61fGNIO
	S
X-Google-Smtp-Source: AGHT+IEaJ+P/6KBOOtJyniHX1/cJOt0L+qQsFCuJMw0pbhOmIuGoJhmTttr2pc5PnXsak6Idb8O6fg==
X-Received: by 2002:a05:6512:3082:b0:513:30fb:d64 with SMTP id z2-20020a056512308200b0051330fb0d64mr12144142lfd.44.1713880440589;
        Tue, 23 Apr 2024 06:54:00 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b18-20020ac24112000000b0051a61f2d251sm1875997lfi.290.2024.04.23.06.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:54:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 15:53:58 +0200
Subject: [PATCH 2/5] ARM: orion5x: Convert DNS323 board to GPIO descriptors
 for LEDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-gpio-leds-v1-2-799c2f6bc61c@linaro.org>
References: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
In-Reply-To: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

This makes the LEDs on the D-Link DNS323 Orion5x board use GPIO
descriptors instead of hardcoded GPIOs from the global
numberspace.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-orion5x/dns323-setup.c | 63 +++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-orion5x/dns323-setup.c b/arch/arm/mach-orion5x/dns323-setup.c
index d69259b6b60d..062109efa0ec 100644
--- a/arch/arm/mach-orion5x/dns323-setup.c
+++ b/arch/arm/mach-orion5x/dns323-setup.c
@@ -14,6 +14,7 @@
  *
  */
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
@@ -254,37 +255,64 @@ static int __init dns323_read_mac_addr(void)
 static struct gpio_led dns323ab_leds[] = {
 	{
 		.name = "power:blue",
-		.gpio = DNS323_GPIO_LED_POWER2,
 		.default_trigger = "default-on",
 	}, {
 		.name = "right:amber",
-		.gpio = DNS323_GPIO_LED_RIGHT_AMBER,
-		.active_low = 1,
 	}, {
 		.name = "left:amber",
-		.gpio = DNS323_GPIO_LED_LEFT_AMBER,
-		.active_low = 1,
 	},
 };
 
+static struct gpiod_lookup_table dns323a1_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323_GPIO_LED_POWER2, NULL,
+				0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323_GPIO_LED_RIGHT_AMBER, NULL,
+				1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323_GPIO_LED_LEFT_AMBER, NULL,
+				2, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+/* B1 is the same but power LED is active high */
+static struct gpiod_lookup_table dns323b1_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323_GPIO_LED_POWER2, NULL,
+				0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323_GPIO_LED_RIGHT_AMBER, NULL,
+				1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323_GPIO_LED_LEFT_AMBER, NULL,
+				2, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
 
 static struct gpio_led dns323c_leds[] = {
 	{
 		.name = "power:blue",
-		.gpio = DNS323C_GPIO_LED_POWER,
 		.default_trigger = "timer",
-		.active_low = 1,
 	}, {
 		.name = "right:amber",
-		.gpio = DNS323C_GPIO_LED_RIGHT_AMBER,
-		.active_low = 1,
 	}, {
 		.name = "left:amber",
-		.gpio = DNS323C_GPIO_LED_LEFT_AMBER,
-		.active_low = 1,
 	},
 };
 
+static struct gpiod_lookup_table dns323c_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323C_GPIO_LED_POWER, NULL,
+				0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323C_GPIO_LED_RIGHT_AMBER, NULL,
+				1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", DNS323C_GPIO_LED_LEFT_AMBER, NULL,
+				2, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
 
 static struct gpio_led_platform_data dns323ab_led_data = {
 	.num_leds	= ARRAY_SIZE(dns323ab_leds),
@@ -621,16 +649,21 @@ static void __init dns323_init(void)
 		/* The 5181 power LED is active low and requires
 		 * DNS323_GPIO_LED_POWER1 to also be low.
 		 */
-		 dns323ab_leds[0].active_low = 1;
-		 gpio_request(DNS323_GPIO_LED_POWER1, "Power Led Enable");
-		 gpio_direction_output(DNS323_GPIO_LED_POWER1, 0);
-		fallthrough;
+		gpiod_add_lookup_table(&dns323a1_leds_gpio_table);
+		gpio_request(DNS323_GPIO_LED_POWER1, "Power Led Enable");
+		gpio_direction_output(DNS323_GPIO_LED_POWER1, 0);
+		i2c_register_board_info(0, dns323ab_i2c_devices,
+					ARRAY_SIZE(dns323ab_i2c_devices));
+
+		break;
 	case DNS323_REV_B1:
+		gpiod_add_lookup_table(&dns323b1_leds_gpio_table);
 		i2c_register_board_info(0, dns323ab_i2c_devices,
 				ARRAY_SIZE(dns323ab_i2c_devices));
 		break;
 	case DNS323_REV_C1:
 		/* Hookup LEDs & Buttons */
+		gpiod_add_lookup_table(&dns323c_leds_gpio_table);
 		dns323_gpio_leds.dev.platform_data = &dns323c_led_data;
 		dns323_button_device.dev.platform_data = &dns323c_button_data;
 

-- 
2.44.0


