Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E811F3CACDB
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 21:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244756AbhGOTqA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 15:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345807AbhGOTpY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 15:45:24 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15697C0770E3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 12:14:47 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id h9so10479524ljm.5
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 12:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oWls7mbyJzb1bflii+qQmDILfVW35Xk5AptGyFlKE0Q=;
        b=abvR9Ijn6Ebh1QEnsRROW7RW3rBGzcQj3e5kEl2591ZI14KlSiyZTmpOqwR894YQrb
         /Y+0/OwqW9eb/F3k+8X2fHSFLsWEmw0VUUdGChxMh1Um8rMd7amzgW27j1h/vrd/C2z1
         es48kOsYF5nvwNFl1L8N+nX9uzEARrxtjfWZk+gKPt4+OxrdV6s4I/Ni8qSHiGfuv+Wl
         qRNY0XZPnNzd3tGQhY4wNz8yf0sL6AkmQRJwT49o3WgmckDEpLH3xO5NSCGUF3DOcoft
         UN3GG+O3dOkcaSgRvmbm8T5nhCqYY4C5Gh9/A0vAxXNI6OfJSB7Lck53VjvI9v5egmCM
         uY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oWls7mbyJzb1bflii+qQmDILfVW35Xk5AptGyFlKE0Q=;
        b=j8jlIXrEKNkDKg66AH95pJURh6o8286sFRnJewQ9wQqmNjuhOdPs5dgM7UdB6pmvSL
         /otXoa9759mx2W2LRVU5glziorF803iNwaJw754Q5qasUmlJc+AFJkrHlBlnRcqr2xGK
         tzGFA9BMrKkiOtGZC5CMjNPC6MAfmptXmJre4mHLvt0X9zbl7oD/wTWTa9uu9BTSRi+B
         QuKCbS0v+RmpPYZvjhJ02hmQivnYTGtYg4AkQr36QzYjKk2GuUQy0A30v4gv6KSCbn49
         n13vj9gNGXbHPkY4ojalIC9IoQvCAtM7CzTbIqI0oVNjGsOB/4UnHaQ8Ew5Tkq2o1GT7
         21aw==
X-Gm-Message-State: AOAM5318c4ajCM6Huo/BsJfUIVF+m6PZuoKNaKkjySJ3clxW5KyHl4CS
        2bfXN8lNVorU2AGgNL7T04ki+Q==
X-Google-Smtp-Source: ABdhPJzuo7mmiJ3Ogg1bJdZHo+HgYC0hN8FfSUkWI9aeTKlZZ4oljWPFouzLbYSRfEEVvU1h1e9eKg==
X-Received: by 2002:a05:651c:997:: with SMTP id b23mr3397000ljq.219.1626376485437;
        Thu, 15 Jul 2021 12:14:45 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y22sm472357lfh.154.2021.07.15.12.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:14:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3 v6] ARM: davinci: dm644x: Convert LEDs to GPIO descriptor table
Date:   Thu, 15 Jul 2021 21:11:40 +0200
Message-Id: <20210715191141.430307-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715191141.430307-1-linus.walleij@linaro.org>
References: <20210715191141.430307-1-linus.walleij@linaro.org>
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
ChangeLog v5->v6:
- Rebase on v5.14-rc1
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

