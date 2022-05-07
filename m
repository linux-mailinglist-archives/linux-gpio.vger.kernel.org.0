Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC36E51E700
	for <lists+linux-gpio@lfdr.de>; Sat,  7 May 2022 14:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbiEGMv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 May 2022 08:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233617AbiEGMv2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 May 2022 08:51:28 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5315F3A712
        for <linux-gpio@vger.kernel.org>; Sat,  7 May 2022 05:47:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w1so16656059lfa.4
        for <linux-gpio@vger.kernel.org>; Sat, 07 May 2022 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8v7tmA1qglygbTY8BBHkUh35OwtP3EQus+XYw0A54o=;
        b=LPIJO5xb8uVO5sIRfO8hBTd7R2viFiTv1eQKXoqXXfCAdWO1s6iV6IvrUJQ86hBwsT
         l+bHlV5eGpZ0ffW7EldwM1z05z18KPl0gXxIRo5/cq2TH4zWzo9lrEAgcOPs7A6mVBUy
         aNI7K+xCXu+hS7AxDkFyiJQUBRhboW+F2WlBgzrERopzQRQmtpmYOSZlZ3vCyIawhKgv
         RY9C+7wS4avxU0jPRle7II1AhGivePJJUQVruaj5Yh15AW/bRG2Lppvlz9AgnQAy8hq/
         p5hNAclheFr+tMxHaV1ya0lQgL+KO4SXWZsxpmMxlzSNDUVEa9uE4L8zG26c0MLzFW8c
         CcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8v7tmA1qglygbTY8BBHkUh35OwtP3EQus+XYw0A54o=;
        b=YjWYHxSA6sl8J+7HzEWirXqaqgPRF6TbyW/al5leWF7yUfFz5mPfWcCA4iHJ5Ezctf
         TKN6HSIF9o00AjV592yBhQLt5ZQ9hB7px3o5BGfd6vvXxcLV84PZfRxEgMtcbSihkG6u
         dqDq5ZR9cDYoPl1eZCxLOPx0/NpD52yAEnjt8XtqJHRtJvkg+XoN6TVo/+VqQAkz/5Wx
         LO9soQvdIa4evrx0kPRWgyX4pk+kiPbVwGTZYir2rGweFnIzRG9xKiQxGorY4q2o+KB4
         XiM7McqXpp1M09MqWgSwKkNwgGgroUKrRb4VHBJ7WxYoaAYoB/dY7UEnuNZDGq4r+3no
         npew==
X-Gm-Message-State: AOAM530jYMMzm1Xq+xK7OwQSVzgUrwRMcUoCq2AQjLNzPKutnZ6IuzxE
        US3P/iJBPH+UckG/iO3lBNSKcA==
X-Google-Smtp-Source: ABdhPJy689jYaHEVgDL/z6Ot04/jjw50RNgV46E3wMuhKe9QRE8Kd2rfux3/NNUXpCrFeSs23GwqWw==
X-Received: by 2002:ac2:5ecc:0:b0:472:3c01:9a2e with SMTP id d12-20020ac25ecc000000b004723c019a2emr6033837lfq.245.1651927659654;
        Sat, 07 May 2022 05:47:39 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id x28-20020a19e01c000000b0047255d21138sm1105819lfg.103.2022.05.07.05.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 05:47:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2 v7] ARM: davinci: dm644x: Convert LEDs to GPIO descriptor table
Date:   Sat,  7 May 2022 14:45:35 +0200
Message-Id: <20220507124536.171930-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This converts the DaVinci DM644x LEDs to use GPIO
descriptor look-ups.

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v6->v7:
- Rebase in v5.18-rc1
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
2.35.1

