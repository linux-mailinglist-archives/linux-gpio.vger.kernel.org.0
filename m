Return-Path: <linux-gpio+bounces-5760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC288AE8B6
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 15:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B12B288020
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 13:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B452E136E01;
	Tue, 23 Apr 2024 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JeQUBtei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7781369A8
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880443; cv=none; b=bbqDel/PmhMUXXPYW5k0bt/ayIW5eSgDiatuKRC9JnEfJyVH+Qw/RdAgYbWUY4rJ4M4zWrfmsR/4EhEvBZ3ZoRkR9CCqEk/4gIQlXZLtv7GP+u/VWcnuj7oM5hIiEu631jECEdwchylu8zE1Sodz7QgUFW4GYWeYD5n47l4E7w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880443; c=relaxed/simple;
	bh=ZgFE9vMr0rgyzOzeVaH/Absgu+QhKgMOkT0mW9TavZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlzUeAvvG7tyXIyeqiQm8PKpAH0AUbV34LQUln/RvVCNmf6kGtPqwyjj0n8mA9FgicCVGvlbmh8YLs1PtmcNppW0soaRYh08i53dQyvIwDVEx9fauQTmIQwKxpJL4OqESmAftvQ93LmN2G8cenuRVxWPIrC1RUSBgFHXQT6C/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JeQUBtei; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d3a470d5so7042758e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713880440; x=1714485240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqxRItWvTJbOoTJBydlz3fX/6NTjT+yh3cw5bUjUWlQ=;
        b=JeQUBtei5V/fP9vQ/5+8+0RIXL9X2YxnB1QOOX1Hmhh7bw1wpRJ/SJsXbx6UKFpNuJ
         aL0Fs1xLRV1MSMzUDY6WaU3Vdk2fse/NLH+GWZ8Dp6aGTIUQJwyO+G6KR9nkquowZqcM
         YNf1vouIjLNmkNkBlQW04TDjGLztaHexl7iGBEMf3qfD1d83Xgb5v/J+545rAdlOJA+7
         XHsI8AAYAnCjfEm37LxBXphjMVCWG3HzV/3Q8Q5IYHLcP9oQGEyvJQeXx8Va2eeKdDi9
         cup0S8ydX4j2E0TslAsFyfaOJO1bL3Vkg1W9c/qeZK8u/zoeXaBLg9X6xbtRtG+VV6IT
         RwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880440; x=1714485240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqxRItWvTJbOoTJBydlz3fX/6NTjT+yh3cw5bUjUWlQ=;
        b=aEPLS8K2XZoBeycIKW9p+GE64IA36jmXKi4Cg1XrmxENwYXXNjIoQZgsoO0x6MivIf
         f0IqDMOC6DFnL77lKJBTBlMoOC34p/n5oyuiu2/0FoYzx1vxFLMerk4wpds8i48T+CXs
         Qu//qcMhtszEQz421/iazHyIiL5SsOSZj+sV+7o6g5i0+vXscsa2g83oyIwaMmwczF4/
         YZu84b6a+FL9dTausZUW0AWgr0vCNyymSlzLtSO+nW9d4LtCpu/OsWgxmfDavOcp49LV
         H5LDeqNm25hskZxdAlVQ6LJ3x2O3wE/MtM1SkW0LV2r34wpCj9JW3yc6I86Jb38oi+gE
         9e7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUt1GgX7xcXjXq2Waa36iHcI6MWLFEMldT3mzofxyFnbVMTWXHPctGq/Va19roT7OdvbQ0427822LJ/YUCyTocpDws3GnuOgNuk3A==
X-Gm-Message-State: AOJu0YxNHnj8uidAd5u9HfZZPL2kUPrIrFdVqskw912cOUA04gWTe/uC
	6EU+nOZYl0DOuOXnjG+gtdX7NlaDFS3icRP0z3ihUvTeSOwmpF/veoG4yKm+nTVduiJxjU745Vw
	L
X-Google-Smtp-Source: AGHT+IFzoFyorMbDsFIsafP23V2BI8V4tcOvYoSUwjDxawZ2DK4ZicdpmELHa5ZmSmwnm91fHnoi8w==
X-Received: by 2002:a05:6512:3449:b0:518:b5af:5f67 with SMTP id j9-20020a056512344900b00518b5af5f67mr8365691lfr.64.1713880439735;
        Tue, 23 Apr 2024 06:53:59 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b18-20020ac24112000000b0051a61f2d251sm1875997lfi.290.2024.04.23.06.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:53:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 15:53:57 +0200
Subject: [PATCH 1/5] ARM: orion5x: Convert D2Net board to GPIO descriptors
 for LEDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-gpio-leds-v1-1-799c2f6bc61c@linaro.org>
References: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
In-Reply-To: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

This makes the LEDs on the D2Net Orion5x board use GPIO
descriptors instead of hardcoded GPIOs from the global
numberspace.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-orion5x/board-d2net.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-orion5x/board-d2net.c b/arch/arm/mach-orion5x/board-d2net.c
index 0297e302d7bc..09bf366d05ff 100644
--- a/arch/arm/mach-orion5x/board-d2net.c
+++ b/arch/arm/mach-orion5x/board-d2net.c
@@ -14,6 +14,7 @@
 #include <linux/irq.h>
 #include <linux/leds.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/pci.h>
@@ -55,12 +56,9 @@ static struct gpio_led d2net_leds[] = {
 	{
 		.name = "d2net:blue:sata",
 		.default_trigger = "default-on",
-		.gpio = D2NET_GPIO_BLUE_LED_OFF,
-		.active_low = 1,
 	},
 	{
 		.name = "d2net:red:fail",
-		.gpio = D2NET_GPIO_RED_LED,
 	},
 };
 
@@ -77,6 +75,17 @@ static struct platform_device d2net_gpio_leds = {
 	},
 };
 
+static struct gpiod_lookup_table d2net_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("orion_gpio0", D2NET_GPIO_BLUE_LED_OFF, NULL,
+				0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", D2NET_GPIO_RED_LED, NULL,
+				1, GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init d2net_gpio_leds_init(void)
 {
 	int err;
@@ -91,6 +100,7 @@ static void __init d2net_gpio_leds_init(void)
 	if (err)
 		pr_err("d2net: failed to configure blue LED blink GPIO\n");
 
+	gpiod_add_lookup_table(&d2net_leds_gpio_table);
 	platform_device_register(&d2net_gpio_leds);
 }
 

-- 
2.44.0


