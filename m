Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9F851E701
	for <lists+linux-gpio@lfdr.de>; Sat,  7 May 2022 14:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240164AbiEGMvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 May 2022 08:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233617AbiEGMva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 May 2022 08:51:30 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDAD3A712
        for <linux-gpio@vger.kernel.org>; Sat,  7 May 2022 05:47:43 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h29so16677000lfj.2
        for <linux-gpio@vger.kernel.org>; Sat, 07 May 2022 05:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gwVpejRRRIX6iBHQ9uQjh7sUWq7n5QC76X2Ncl9Icms=;
        b=R9xxBV26A1ASOHDlV8cCG+DHnUYpfWLA6as8YvU8OaxoaRlu1IXgq/KXRLyfX0dZf6
         pWxVchX4XsP7tN14Tu/NGZp5REONf68XwDbZMpOsmDC90snjdOtizDn7RR8KnYUv8sku
         PiNUYylxzEcVBIo3IQlETHYehyLqWFCESKZJ5fJpbHDAoUACU6ePd84bIq0luyV5dCEF
         nDKtVlZJhgNzXCPiwAZGPjCDJtsuY8WBSBsHjt6WNqbuVYtPiPQpEgIpd/6paVeDDQoU
         15tooNSD1xA5Hik5AsHGMKmoOWRYMq0F5iUzgn50Lkxho9ezRDXHXxMfi+eYiY1O8piu
         7DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gwVpejRRRIX6iBHQ9uQjh7sUWq7n5QC76X2Ncl9Icms=;
        b=BMGYDf6MspMZ0jfF7Vy9gjD7w+ForJxlzOjrLg4e5OCtsz112MEbNS1imak1lgEKrm
         ncQ9Izv3bUwYmitVPi9vnzw4j5XSq1BTaz2w0z95nkNEBZtPDTdhs9C0oQRV418RkmjK
         ic5dCrs+ogwoC+M4HWCJCi5ooFneaOtz4bkXJr1voVlrkiEFDhcdSkJB4HQY++GshJcq
         KAn5kG/7qFoYDgBIv3seo+jQUSQU63hA97SKadwUaOxAMqPLx0W/9Guak1Cwt+oVteKq
         1RtRfYGb99RK1enoh59pkqArBmMSofTWxb5WWenxG7Kz3yWRRXppfDfuQJU6q1BhHp4e
         P53g==
X-Gm-Message-State: AOAM531lDzjw7JVrtHdYpOcj3CLi+XeRZ3hJZ8MqF+PaCGznevEpQxIc
        HCbMbtOonfHODepxd72pKvAxcQ==
X-Google-Smtp-Source: ABdhPJzL+kzMgek6BiuhNQ+zLBs/7kB5dKUGH5xwJ99Qr5CA1dDHOmHXAaxKrwDfvmS6yKYiHRZn2w==
X-Received: by 2002:a05:6512:c1d:b0:473:bf3f:66b0 with SMTP id z29-20020a0565120c1d00b00473bf3f66b0mr6247222lfu.313.1651927661958;
        Sat, 07 May 2022 05:47:41 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id x28-20020a19e01c000000b0047255d21138sm1105819lfg.103.2022.05.07.05.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 05:47:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2 v7] ARM: davinci: dm646x: Convert LEDs to GPIO descriptor table
Date:   Sat,  7 May 2022 14:45:36 +0200
Message-Id: <20220507124536.171930-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507124536.171930-1-linus.walleij@linaro.org>
References: <20220507124536.171930-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
ChangeLog v6->v7:
- Rebase on v5.18-rc1
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
2.35.1

