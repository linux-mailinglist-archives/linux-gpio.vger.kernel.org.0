Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EBD254060
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgH0ILJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbgH0ILI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:11:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B22EC061264
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:11:07 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w14so5416813ljj.4
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R0qr0wEHYkyK/CJaNJ4Tz6g9aeydokX3kWn6WhBTMLA=;
        b=VA7jgQtKWZJhZ2JFzhFdsiJNA4AKnPIqqpH9TU2P4Tz41Ev5s3DCcAsK5ZRxFo/w+L
         vHMHgpznokGU+52tjv9EXgfji7mUVxDeEmokG05GFmF3zpdwpXzplmtfLlgHa8NVj+N6
         DRPbgsEnfpDNhRjby4uITLcoxivx1M9q//E9pJGqNYyuWm2ABu4laPaM3H/ZmJdF1AXy
         tt3o00I2vCgbEhmwe/biUKl6BmaqbtkXJ4sYKDfbzQsP2lVAou/9qtyDOlkOmKLX1EQx
         QZzQzEStzGZiFJueZNoCRoVRsvp109BnaRTGr5hcfpn9p4gP29gW0v1cKpnjB3Z9SHBH
         N9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R0qr0wEHYkyK/CJaNJ4Tz6g9aeydokX3kWn6WhBTMLA=;
        b=uSzuLhVBT9ZuS24j2glxj7vu18aIXnTTJkeq/E5mAbcuNNohVut2dooRcW1AJy3Tm+
         IK69+NFZ5OJsL4Kg6tM6o+I/P938wy62vmH/4poSb1UZx9nBmMRpYE+tk1qhn5AdyL0D
         eALvsLIs/WrjvwpPMnJ/nw4rTEcs4qM/nO659jcDH37i8pQduzdoZqfAVTXcbyx5b3nC
         jhFqKhxfv3M5B6aQnGiVy63mdP5nUvO0d68GeBb0ucjq/ouGqrK5Z0nvqeAcWdv0w5QJ
         HjiUW8sK1JumqZtvtJIzp+pKz0LOKDYCHlVnXl1pcLXxxnQ2TOm51b6oNc3CUSmwiZOz
         FYPQ==
X-Gm-Message-State: AOAM531FDlge+beIlKz6ExXcNRHcIdB8uc0eaAcNPg6c+OjXzohg2OZa
        UgaJE6tsWwTZFitmnzuy8WoyBztYweqQaA==
X-Google-Smtp-Source: ABdhPJw+Y8OfcO9b42KUnnbgHjm8nqEnkPkDWnjOf8+8OXRQEo0cPEu8MaGbxHtYL3J7n8upu60j7w==
X-Received: by 2002:a2e:b892:: with SMTP id r18mr8524065ljp.249.1598515866001;
        Thu, 27 Aug 2020 01:11:06 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id k9sm331399lfm.29.2020.08.27.01.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 01:11:05 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org
Subject: [PATCH 2/3 v2] x86/platform/geode: Convert geos LED to GPIO machine descriptor
Date:   Thu, 27 Aug 2020 10:08:25 +0200
Message-Id: <20200827080826.186024-2-linus.walleij@linaro.org>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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

