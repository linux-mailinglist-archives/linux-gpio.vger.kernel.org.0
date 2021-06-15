Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A633A8381
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 17:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhFOPDS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 11:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbhFOPDS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 11:03:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6275C061574
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 08:01:13 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 131so25538344ljj.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KF/2w4HZSLGOH7BsrQUO66ZMjH16Q/Js+us1lOAxipQ=;
        b=utbK8gyUkFiP3Gj/BH6Qa+u5FsYw16VP3ktK445yFHJ/UCj8YlupB4mTNG8yCEIOpf
         Km6XILd1HhXGbMz/RfSar1XUDUPaadrtEZB1bvMQKpwcH5h5FPw25gzs9U+09ymJRS8D
         zt8WWNgP8irWAbtuXmicF7zyS5kRTfDUVWnxHPdCO99QwWoPee/KbsCS1renS6F39s4O
         HzkA0/4R95gDF03oyJjKcn5qrJ7BfXjOdHwEmLF5642eMYQAfSL+x/10UaP1iLD61SPy
         ylzp1UJAPO2pVyh8P/SIhhMlB2yOcRBndUJ3N9ZP5vsflZQKGtMO/gIGgC9jfMbLWnDZ
         U3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KF/2w4HZSLGOH7BsrQUO66ZMjH16Q/Js+us1lOAxipQ=;
        b=sd22RbM5p4dTMrijNiTQyaXWOQ25STi9Zen33yihfi2UkAcEdab1aN4C0z4yI6eBlT
         A2LJZbiSKUeEEHvzhfDY2viUU1x5xc1nQ93SQfT+RX/zndi0J8W+XnmzZ+DX65PGUmpi
         nN3lEy4hX5zGNy4rK5GwYOlSRmsioWsafVKeTV+JjWqBki7cZ9QMTtdXlO56zR2g/m9u
         du6rBYI/jUo/foC+YGFTAmIh0ZR9uKHefgb1HcHcoA0pbRgO76HTLOYEgiLxh+cC2mg6
         1As4nEod3JOfPVVXc81AaT7zg/Q+LyQxOECd5wv5QQTMlrdQXmoq+BSbhhxjmxeD2QBR
         qpyQ==
X-Gm-Message-State: AOAM533Pr/TORxnCI5JSC73jDCvy6W70yI7x8apiX2lK65lT4Sva33xL
        SQK0qDkAby0Pg9B8ml/Xhf/b2IrSu7lqAQ==
X-Google-Smtp-Source: ABdhPJz2WRBdpvOtldBY4Mqpjg4fQLbqPYNFtm9FR3VUt607dG4vgvKjxs2MGZG8V3t960pdYDbOig==
X-Received: by 2002:a2e:9901:: with SMTP id v1mr14162lji.205.1623769270590;
        Tue, 15 Jun 2021 08:01:10 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id c18sm788914lfd.51.2021.06.15.08.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 08:01:10 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH 2/3 v5] ARM: davinci: dm644x: Convert LEDs to GPIO descriptor table
Date:   Tue, 15 Jun 2021 16:59:02 +0200
Message-Id: <20210615145903.634565-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615145903.634565-1-linus.walleij@linaro.org>
References: <20210615145903.634565-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This converts the DaVinci DM644x LEDs to use GPIO
descriptor look-ups.

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v4->v5:
- Name each I2C expander instance explicitly as "u2" etc.
- Tie the LEDs to the generated "i2c-u2" device name.
ChangeLog v3->v4:
- Rebase on v5.13-rc1
- Resend
- LED maintainers: please apply this patch, it is ACKed by a DaVinci
  maintainer
ChangeLog v2->v3:
- Rebase on v5.10-rc1
- Resend
ChangeLog v1->v2:
- Collect Bartosz' review tag
- Rebase on v5.9-rc1
- Resend
---
 arch/arm/mach-davinci/board-dm644x-evm.c | 49 ++++++++++++++++--------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index cce3a621eb20..36d8eea7a342 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -319,17 +319,14 @@ static struct platform_device rtc_dev = {
 /* U2 -- LEDs */
 
 static struct gpio_led evm_leds[] = {
-	{ .name = "DS8", .active_low = 1,
-		.default_trigger = "heartbeat", },
-	{ .name = "DS7", .active_low = 1, },
-	{ .name = "DS6", .active_low = 1, },
-	{ .name = "DS5", .active_low = 1, },
-	{ .name = "DS4", .active_low = 1, },
-	{ .name = "DS3", .active_low = 1, },
-	{ .name = "DS2", .active_low = 1,
-		.default_trigger = "mmc0", },
-	{ .name = "DS1", .active_low = 1,
-		.default_trigger = "disk-activity", },
+	{ .name = "DS8", .default_trigger = "heartbeat", },
+	{ .name = "DS7", },
+	{ .name = "DS6", },
+	{ .name = "DS5", },
+	{ .name = "DS4", },
+	{ .name = "DS3", },
+	{ .name = "DS2", .default_trigger = "mmc0", },
+	{ .name = "DS1", .default_trigger = "disk-activity", },
 };
 
 static const struct gpio_led_platform_data evm_led_data = {
@@ -337,18 +334,35 @@ static const struct gpio_led_platform_data evm_led_data = {
 	.leds		= evm_leds,
 };
 
+static struct gpiod_lookup_table evm_leds_gpio_table = {
+	.dev_id = "leds-gpio.0",
+	.table = {
+		/*
+		 * These GPIOs are on a PCF8574 GPIO expander, which
+		 * is in turn named after the I2C device name. This is
+		 * device "u2" on I2C bus 1 with address 0x38.
+		 */
+		GPIO_LOOKUP_IDX("i2c-u2", 0, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 1, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 2, NULL, 2, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 3, NULL, 3, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 4, NULL, 4, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 5, NULL, 5, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 6, NULL, 6, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 7, NULL, 7, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct platform_device *evm_led_dev;
 
 static int
 evm_led_setup(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 {
-	struct gpio_led *leds = evm_leds;
 	int status;
 
-	while (ngpio--) {
-		leds->gpio = gpio++;
-		leds++;
-	}
+	/* Add the lookup table */
+	gpiod_add_lookup_table(&evm_leds_gpio_table);
 
 	/* what an extremely annoying way to be forced to handle
 	 * device unregistration ...
@@ -639,14 +653,17 @@ static struct i2c_board_info __initdata i2c_info[] =  {
 	},
 	{
 		I2C_BOARD_INFO("pcf8574", 0x38),
+		.dev_name = "u2",
 		.platform_data	= &pcf_data_u2,
 	},
 	{
 		I2C_BOARD_INFO("pcf8574", 0x39),
+		.dev_name = "u18",
 		.platform_data	= &pcf_data_u18,
 	},
 	{
 		I2C_BOARD_INFO("pcf8574", 0x3a),
+		.dev_name = "u35",
 		.platform_data	= &pcf_data_u35,
 	},
 	{
-- 
2.31.1

