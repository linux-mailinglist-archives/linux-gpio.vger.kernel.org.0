Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A571F254062
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgH0ILK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727814AbgH0ILK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:11:10 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C034CC061264
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:11:09 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g6so5379405ljn.11
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTDjea0nrnc/oUf1mH0xhxoad77z5EY9HZKwtaJ59yw=;
        b=uirdamO7+rR5SAWOIOIS1iNHhmUE9SNEGnKOpzsy3KEjjxJYTzUq4iKDX6lnKYaM/c
         uit2YGPT2391mXTRCqyZ5aVSIyKxAP/3jdviEIJ6Ngh4tTWeAIZvFrNwlC0K04/YFtA+
         XvF/Ywee2+tTtwMN3lVngnu7ilm1nXloqJ6W+EPTYEUouwKrBDsyxkF5AhK1/LCCHz/R
         uUoNt8xK1BA1OZdUzfhFdcNKKy7xcE/VeeUroiHLuxIgkA1Nl4h6i7BQjgHHtMyXMX5S
         dBhKU0ivZWVg6guh22ilnYztwna081mQpDbWh/eM1KTgzeYk0F/JOTHci0Zmx6gI5gV/
         0+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTDjea0nrnc/oUf1mH0xhxoad77z5EY9HZKwtaJ59yw=;
        b=Qgb0Nc4QTcLq+ufc6Gh+VAp/RSyao3QtG5rFi0iA4tE42u/r3sxNmb60+NVVPtS9lt
         Flk5QZbAEDryERVduuAGFlw+PoTKnk/eEpGUe3xH4Knesy3I29MrrVfQLiV8O6WLs7oQ
         LP2CWps1zQ/ZZo+jcTR3BdpbRx6hjhegXX+bpCyeS226nWfl+IXVkxtyhrlMeKp2oT3J
         p8sLfcsHFD8yQJRfhdV8RVGDnJ0vbJvB4bV1LNUYXFnjrHQimz7PrphnRASk046Y61lx
         s2LF/NKA3d9TWKRMs04SWyDVNUudPTnRWu1/JZR9Tu57h0/lpK56CCtQIUT+67Zv6Ndb
         S+9A==
X-Gm-Message-State: AOAM531B5uDk6F0Fh544nx4cHnwPIwTdGJtrDX9/L2mylkaXWcIkvkyj
        mj3EX5kh3Q58O6k0evBT+QPVgQ==
X-Google-Smtp-Source: ABdhPJyRstwt15FW2tCgyXcxsm171w+Ez5d25HjrfBMbO57M/xguEMGD7UE6V7DxRS4LjhWqtznf7w==
X-Received: by 2002:a2e:9ac5:: with SMTP id p5mr9639088ljj.253.1598515868229;
        Thu, 27 Aug 2020 01:11:08 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id k9sm331399lfm.29.2020.08.27.01.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 01:11:07 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 3/3 v2] x86/platform/geode: Convert alix LED to GPIO machine descriptor
Date:   Thu, 27 Aug 2020 10:08:26 +0200
Message-Id: <20200827080826.186024-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827080826.186024-1-linus.walleij@linaro.org>
References: <20200827080826.186024-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drop excess comma after terminator { }
- Collect Andy's Reviewed-by
---
 arch/x86/platform/geode/alix.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/x86/platform/geode/alix.c b/arch/x86/platform/geode/alix.c
index c33f744b5388..b39bf3b5e108 100644
--- a/arch/x86/platform/geode/alix.c
+++ b/arch/x86/platform/geode/alix.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
 #include <linux/dmi.h>
 
 #include <asm/geode.h>
@@ -69,21 +70,15 @@ static struct platform_device alix_buttons_dev = {
 static struct gpio_led alix_leds[] = {
 	{
 		.name = "alix:1",
-		.gpio = 6,
 		.default_trigger = "default-on",
-		.active_low = 1,
 	},
 	{
 		.name = "alix:2",
-		.gpio = 25,
 		.default_trigger = "default-off",
-		.active_low = 1,
 	},
 	{
 		.name = "alix:3",
-		.gpio = 27,
 		.default_trigger = "default-off",
-		.active_low = 1,
 	},
 };
 
@@ -92,6 +87,17 @@ static struct gpio_led_platform_data alix_leds_data = {
 	.leds = alix_leds,
 };
 
+static struct gpiod_lookup_table alix_leds_gpio_table = {
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
 static struct platform_device alix_leds_dev = {
 	.name = "leds-gpio",
 	.id = -1,
@@ -106,6 +112,7 @@ static struct platform_device *alix_devs[] __initdata = {
 static void __init register_alix(void)
 {
 	/* Setup LED control through leds-gpio driver */
+	gpiod_add_lookup_table(&alix_leds_gpio_table);
 	platform_add_devices(alix_devs, ARRAY_SIZE(alix_devs));
 }
 
-- 
2.26.2

