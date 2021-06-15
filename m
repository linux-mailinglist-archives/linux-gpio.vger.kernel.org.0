Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7092C3A8382
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 17:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhFOPDU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 11:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbhFOPDU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 11:03:20 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EC1C061574
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 08:01:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id r16so25458715ljk.9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cJ3E6xz1GtHO5ssuzNBSjmKl0fJUbXbXi3ZsWAUHOk0=;
        b=TFRBCQYrClIJos2Bez2gAp3xfty8ROT++L/cj0GEl8zFVd+2qXYMW7MfEZ/RTbX7X8
         ynUk6KnsxaSZw5zfVWP3sUUhIZCZrvW5Xt0COoAYvroRAguETHaqzYTr0EQoThdS3GIG
         SiUlQUttAOtFnJg/xAvQakrJwfbfne+bnc5/cJlLv3lFMKoKcPfnn4ImvFHcyWEYAkbA
         6v9alzB6m3Uh4Alsnch1S/Ko9Ky0kP3xetjSQ1IYVO6LdzntNaVEkDE2NgiMVO5tOd3A
         dVDRFHQDM4BjaWVfU17GsNejkj/SfPKxvQFgLHL481P+Cez2Xoty6K7uU4Omd+glDS7t
         hwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cJ3E6xz1GtHO5ssuzNBSjmKl0fJUbXbXi3ZsWAUHOk0=;
        b=UatUqXlAqJYup+IHp5QuBrtJdsTzTDOnkw1C1ex0ZAGtEwdcng9n9+ATnsbyiwDkWI
         V/9HeYtFHojFjHRsliRIX6JptbGPVrxxIVEcabAQBZCZpkF3seE54WlTfIh9gy0YziJe
         72J/0owMF375D4f/LcWvVbVv0BOUaLKJ+6u5V/Tvt2K6uiySpQpRZo9RiaQ3gBDcwdIv
         UvP3wtmfGerh6+GihFkXUedSZZyok3VeXSsPbnNFd2uoFIyxUXr6KZU5za6wI8BkLWdb
         y96y0huVO1KMTMmkWxQaaZrlsJByFounbcPQYmtOByMP+vWEt8lKU21KgIMkMUjMa8vQ
         BQ4A==
X-Gm-Message-State: AOAM5310PW9KLgJ7gB1udYKlHuS23gu1/dsPKoiv1DZg+R1vzUNavMcP
        n7A75LCrV8gK7bzK0hSXAwRL4qKCppXKZg==
X-Google-Smtp-Source: ABdhPJyZi7UddXGkcWvIlaShGhMWzw3VhgvIydLd58RTNR46J3VAAHmG+yU8Md3c8gaXhYnRKAGyqw==
X-Received: by 2002:a2e:89d9:: with SMTP id c25mr22628ljk.63.1623769271832;
        Tue, 15 Jun 2021 08:01:11 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id c18sm788914lfd.51.2021.06.15.08.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 08:01:11 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH 3/3 v5] ARM: davinci: dm646x: Convert LEDs to GPIO descriptor table
Date:   Tue, 15 Jun 2021 16:59:03 +0200
Message-Id: <20210615145903.634565-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615145903.634565-1-linus.walleij@linaro.org>
References: <20210615145903.634565-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This converts the DaVinci DM646x LEDs to use GPIO
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
 arch/arm/mach-davinci/board-dm646x-evm.c | 34 +++++++++++++++++-------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index ee91d81ebbfd..00c074fddce6 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/leds.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
@@ -202,10 +203,10 @@ static struct i2c_driver dm6467evm_cpld_driver = {
 /* LEDS */
 
 static struct gpio_led evm_leds[] = {
-	{ .name = "DS1", .active_low = 1, },
-	{ .name = "DS2", .active_low = 1, },
-	{ .name = "DS3", .active_low = 1, },
-	{ .name = "DS4", .active_low = 1, },
+	{ .name = "DS1" },
+	{ .name = "DS2" },
+	{ .name = "DS3" },
+	{ .name = "DS4" },
 };
 
 static const struct gpio_led_platform_data evm_led_data = {
@@ -213,18 +214,32 @@ static const struct gpio_led_platform_data evm_led_data = {
 	.leds     = evm_leds,
 };
 
+static struct gpiod_lookup_table evm_leds_gpio_table = {
+	.dev_id = "leds-gpio.0",
+	.table = {
+		/*
+		 * These GPIOs are on a PCF8574a GPIO expander, which
+		 * is in turn named after the I2C device name. This is
+		 * device "u2" on I2C bus 1 with address 0x38. These
+		 * leds are at offset 4, 5, 6, 7.
+		 */
+		GPIO_LOOKUP_IDX("i2c-u2", 4, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 5, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 6, NULL, 2, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("i2c-u2", 7, NULL, 3, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct platform_device *evm_led_dev;
 
 static int evm_led_setup(struct i2c_client *client, int gpio,
 			unsigned int ngpio, void *c)
 {
-	struct gpio_led *leds = evm_leds;
 	int status;
 
-	while (ngpio--) {
-		leds->gpio = gpio++;
-		leds++;
-	}
+	/* Add the lookup table */
+	gpiod_add_lookup_table(&evm_leds_gpio_table);
 
 	evm_led_dev = platform_device_alloc("leds-gpio", 0);
 	platform_device_add_data(evm_led_dev, &evm_led_data,
@@ -438,6 +453,7 @@ static struct i2c_board_info __initdata i2c_info[] =  {
 	},
 	{
 		I2C_BOARD_INFO("pcf8574a", 0x38),
+		.dev_name = "u2",
 		.platform_data	= &pcf_data,
 	},
 	{
-- 
2.31.1

