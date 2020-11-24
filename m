Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA102C2075
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 09:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbgKXIxw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 03:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730822AbgKXIxv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:53:51 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591C6C0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:53:51 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u18so27733600lfd.9
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DeDKS22xxFRIc+6wUo2VF8v+jvsdd+gENbNOUYHzsn4=;
        b=ML1KH1Nqxbw1laEF6QOiRvnmnv5UV6BFToUc5zCa27vKNcvtgkJGo2WdNfKp77dxMr
         eruq3rz7K0z28AxgnLp9goEw7T8DkwctJvqD71gWc/+TjheBUj7G4UxhCLPWAtsMNBLO
         JWbH+bETiUFo/4mlgVMGHokgwjLh6BeyJw1Eq6dnT26aovo2TBv0xtFSZDR2F77x02NB
         +PFp9fHufg/ckI19XCOySwxT6pV7hGbitk97+La1VghwjRLrqI88fm8uK/n9NWq8w5vt
         7r6T5fiKz1OYQ7YvxNdnTc+YIFj6Q015tnayETqLVrsHeBPXH6muvu52Kpipk9z32NFB
         h6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DeDKS22xxFRIc+6wUo2VF8v+jvsdd+gENbNOUYHzsn4=;
        b=tjg8ClHJ0TdEv3vBOb0js+Z9x2KVut4z4DVsD2W/QkDZJWdvIAkbykf2ovO8SZ1Grt
         3yETWcoWJIwj3oNcYuQ2gtP89Qrc3Ntef1Qv4Dxxok9jmmA4/4yKX+x1b6jmi9k3efWc
         PuTSM/Siqw7XUnc+xzkmGPxP0WgBkzXWiYZDP0VtFxg26AyMJM80uY/oqTjPtvGZnJm+
         zeuwI5b0MKXbLx1BolPM9DJiO59k2g6eMXGP1WuxiQHggN6d9Udl2+eah7i9yJMB5GH1
         H3YZhl/MWQSUIcPpjL6ziSA6HeRlK7DdYXty1ckkwXmQcwBWi9EwwwVTLkxzb0Ci+N9B
         g+Vg==
X-Gm-Message-State: AOAM531eMMrqCwoq8DFSK9KyZCn8dEh50hrsqJV7xqDjeh2g6P1osHog
        tVpd+HybDxr+9RgoP3gHaErkPQ==
X-Google-Smtp-Source: ABdhPJzdmcu3bb53zmcrUiO3ci4TLJy74ovaG3WLshcrBVGW/yt2pdGoG/nvZt0vd1MHGE3xmjmTkw==
X-Received: by 2002:a19:bec6:: with SMTP id o189mr1588416lff.179.1606208029870;
        Tue, 24 Nov 2020 00:53:49 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u18sm746602lfq.145.2020.11.24.00.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 00:53:49 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org,
        Darren Hart <dvhart@infradead.org>, x86@kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 2/3 v4] x86/platform/geode: Convert geode LED to GPIO machine descriptor
Date:   Tue, 24 Nov 2020 09:53:38 +0100
Message-Id: <20201124085339.6181-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124085339.6181-1-linus.walleij@linaro.org>
References: <20201124085339.6181-1-linus.walleij@linaro.org>
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
Cc: x86@kernel.org
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Cc x86@kernel.org
- Collect Hans' Review tag.
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

