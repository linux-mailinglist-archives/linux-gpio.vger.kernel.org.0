Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6254D2A377E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 01:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgKCAJs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 19:09:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgKCAJs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 19:09:48 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5159DC0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 16:09:47 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id i6so19842569lfd.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 16:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YAQ34Ve7cFnhSCwxnnPcw/n2Sk1h00H1WdG8OpLXBLc=;
        b=uJWfcIh6VqY8T6206mmY8Cib2uWSTpVi9sMj11vDOTICiwQTpmaMRDNFkemT69wE69
         fieKU24EIRjIg57Cq3H97SRs19WQGbiyt2K2itDz2HCNSijThgHzFctU2/fJrRde9kmE
         jM5LXKeVWAVeG9X1+OorBvuwwLBZl8fO7WzGhcSXzoSR5oH+Hcst7c14levB5q4roCTJ
         3PWlXbXc3qEVGmXGleZ4p8dhj5iKGOunvUQQZ8ZN3bCSe1wpJuOXYEPHpOpbdEEMOEy4
         c9wCOuaOVii97XB/AVyr0hfr6PwG2Rl435LD/7+Z/eCIRBEYsB/eM60aUUc5bE8Zcu2c
         zMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YAQ34Ve7cFnhSCwxnnPcw/n2Sk1h00H1WdG8OpLXBLc=;
        b=PR62OfmK+aoxoxa4vCGOnqTAdNkUbQ2X2xGOHCULluFySSMVraWh9yjFFXTX5C4OzS
         sp92S6UKySOyh+BwFyh2LYEw6BKz7NzVj0t1Y2RXxreQd7SyVMuPreigdFH/YjOjKrUe
         zvLhkquOOPtEyVySIzYpfOz4YndC5BfYNzm4xqp87GKhu1dWxNJESkaYX3crYhsiZsLP
         0AmGgxPWwx47ZJaYLjcN1jXZEgVrMxsEbfy8A5MZkwAxrfbuvpc5bvn/IkHqRxhiY3Np
         ALWmPJoYE/SKN9bIcuI6QgeK7Gyl64lkv2zWewwv788i4qZTA0Km8ChUvP7GC2EnGSlb
         sFdQ==
X-Gm-Message-State: AOAM530Ars3c+NV3a5E53x/prFJja2SMPDcfAD1j0MT2mG3vNdHSyBQZ
        IYol+dUm9JiYs7iuCYUyLPxsbA==
X-Google-Smtp-Source: ABdhPJwhc274siHZ60h5uEtKqOtW04MMzOlHlVDBlaMXc3fVRiuPf65UXs9E8tyt6O1dVnvga80ORg==
X-Received: by 2002:a19:407:: with SMTP id 7mr6367120lfe.291.1604362185851;
        Mon, 02 Nov 2020 16:09:45 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id a14sm671492lfo.116.2020.11.02.16.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:09:45 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org
Subject: [PATCH 2/3 v3] x86/platform/geode: Convert geode LED to GPIO machine descriptor
Date:   Tue,  3 Nov 2020 01:04:38 +0100
Message-Id: <20201103000439.325448-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103000439.325448-1-linus.walleij@linaro.org>
References: <20201103000439.325448-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the machine look up the LED from a GPIO machine
descriptor table. The Geode LEDs should be on the CS5535
companion chip.

Cc: linux-gpio@vger.kernel.org
Cc: linux-geode@lists.infradead.org
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebase on v5.10-rc1
- Resend
ChangeLog v1->v2:
- Drop excess comma after terminator { }
- Collect Andy's Reviewed-by
---
 arch/x86/platform/geode/geos.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/x86/platform/geode/geos.c b/arch/x86/platform/geode/geos.c
index 73a3f49b4eb6..d263528c90bb 100644
--- a/arch/x86/platform/geode/geos.c
+++ b/arch/x86/platform/geode/geos.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
 #include <linux/dmi.h>
 
 #include <asm/geode.h>
@@ -53,21 +54,15 @@ static struct platform_device geos_buttons_dev = {
 static struct gpio_led geos_leds[] = {
 	{
 		.name = "geos:1",
-		.gpio = 6,
 		.default_trigger = "default-on",
-		.active_low = 1,
 	},
 	{
 		.name = "geos:2",
-		.gpio = 25,
 		.default_trigger = "default-off",
-		.active_low = 1,
 	},
 	{
 		.name = "geos:3",
-		.gpio = 27,
 		.default_trigger = "default-off",
-		.active_low = 1,
 	},
 };
 
@@ -76,6 +71,17 @@ static struct gpio_led_platform_data geos_leds_data = {
 	.leds = geos_leds,
 };
 
+static struct gpiod_lookup_table geos_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* The Geode GPIOs should be on the CS5535 companion chip */
+		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("cs5535-gpio", 25, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("cs5535-gpio", 27, NULL, 2, GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static struct platform_device geos_leds_dev = {
 	.name = "leds-gpio",
 	.id = -1,
@@ -90,6 +96,7 @@ static struct platform_device *geos_devs[] __initdata = {
 static void __init register_geos(void)
 {
 	/* Setup LED control through leds-gpio driver */
+	gpiod_add_lookup_table(&geos_leds_gpio_table);
 	platform_add_devices(geos_devs, ARRAY_SIZE(geos_devs));
 }
 
-- 
2.26.2

