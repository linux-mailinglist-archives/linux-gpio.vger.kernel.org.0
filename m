Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6651922E760
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgG0INJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgG0INJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:13:09 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4759C0619D2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:13:08 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m15so7840163lfp.7
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DbBdsqQq6JRFW5DeacgkurSglSJ1Tdcn1vIRYEf6PXc=;
        b=W/e/BOHaI6ZJh6h9aWojft7YVIliRY+ZQ7DzA8liGiSq+sZh2wNjU8JQsHhS3TE+ZA
         zWxrQw2JaRxiGchuVyTIBDprx8vtO/K/ndH3BD0u56FcGllspAL8pNvnXTFQ0xBf/bkj
         z/e6FG6IGfmLkzwkNqkTEhIqGMpqzZw/2i/r1eHrfQgdUcPr5RNa8FPFhd7D8a6mkd/2
         7Avu3leGAqUntNUKy8AsfUX3u117tIo3fVN9qjPQV12egj1xiPM+2lTE3cjc8+/NDqqa
         EiJJwmUuRpFTnF9uBO7syWq+xxkCkf8a71EWZ9eDTZMK/tJA5H7njvmsqyvjCfp5t1Bc
         1AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DbBdsqQq6JRFW5DeacgkurSglSJ1Tdcn1vIRYEf6PXc=;
        b=ssfiTxVEyGK6IA+PI7tPWrPR+AFGNo55SpPUmpY8auSi9MfmTFCWxxBtOTghUQKieY
         /K7It5jjlyL3IAUqKfl334Uhs3wyM2UF+4VEY7YRcS4X25LBProoL3dHIUMzcjuUvgWB
         xS/4Onxpf/4OHuhgrCXXEwEId2wPmQp+mPtSLWLLV8lS55XZnUVmDIJcj9PfYWdCO/4e
         dvL1cMXjFY3/yy3EfeWNoysnL2PsX5zLxgHAgQ18Q5zyosne7oj9r7QnB1hlTsjXAdiF
         Jb9Wpe2411kKrhKooixu9SfwGttsxXHbAHKC2Y84uoU6mULr+k0fpnYEbnx+szZo5vEj
         HFow==
X-Gm-Message-State: AOAM532K+rZzUdu8fdgBMFTvpoJqDGZn7but3eZJfwcxb+HLChI4/UAb
        Oveqee98bT9JVuVgt768+GZKZw==
X-Google-Smtp-Source: ABdhPJyN//4vKGdaq3ntM/hpZBN7kn1oHefDhPBV0nTPlFfLxZOB0NBfDh4KFUKSP2sldRSJsMilNA==
X-Received: by 2002:a19:f808:: with SMTP id a8mr11186039lff.62.1595837587463;
        Mon, 27 Jul 2020 01:13:07 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id r19sm2222521ljn.40.2020.07.27.01.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 01:13:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org
Subject: [PATCH] x86/platform/alix: Convert LED to GPIO machine descriptor
Date:   Mon, 27 Jul 2020 10:11:03 +0200
Message-Id: <20200727081103.302896-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/x86/platform/geode/alix.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/x86/platform/geode/alix.c b/arch/x86/platform/geode/alix.c
index c33f744b5388..4cc66c4fa20b 100644
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
+		{ },
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

