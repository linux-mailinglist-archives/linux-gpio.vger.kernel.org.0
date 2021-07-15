Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCA83CACDD
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 21:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245459AbhGOTqB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 15:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345823AbhGOTp0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 15:45:26 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A99C0770E5
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 12:14:48 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b26so11798089lfo.4
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 12:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QW0aUbvWdjxupRfZicN/X4Nb3halAcxZpcGi/DnPSvg=;
        b=k2pGEOm5ZFBny6IKQmoQQihuFJAq/F9XJz1d3ckRHotg9l8L7PulMWh8sUsj4tPTa9
         BdCkJEO8fCafJ8lssepvfYG/O4vAS9O5XyBdIReDFNR5eamWIgOAy4ynHASs98owCe6E
         z30v/yzw4dkeJcS/5smFh5MU5liFlQgy1McmLqYZAaZCQ4MZi1V7LtI+ql6hYiOCDb0d
         +LBfr0Vgv/wiFMihRd/NNHuyOVI5swnduZ98fm2JGbY9W9Noyd/S1/ziCxR2gyUKoK0C
         mlk/ps1WCUMy6Obn1mGTOu9J2Cb9c16hZhD2vJTKEaIegY355bcf/4bQVSrBPWmRP0bC
         sIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QW0aUbvWdjxupRfZicN/X4Nb3halAcxZpcGi/DnPSvg=;
        b=gkLMXpHK4oHW0Esg2Jw1lcyuY8sFGiVyphhCAkhAqXj5Xj7CVCLHrP7AAxEsEB5aN6
         s+Hb/nGxbqKAvMOrV2iWFY/Sm/Iv18D4RNlieU7QcHWEpcI3sIlMJ5EYo7YG+cM234Yu
         Tea2pEuyJAstq+VAzZajwvEOW15scCNcjX4XrF0xHhzIjVsnFxylA151fGDCLilMkMIO
         CdpHWaA/A3c8IeAW7AVPDk2UcJOAjOeUASA7nGu4tobeVN0tiY4zC1WRtzek6lY3xBnX
         6YRyDpyk5xKJKOXYsiCq7Z9JBwcJ1zJIeIKEEiviptYFzaHcVmRoy6b0oACxFU/hUSYW
         Gi9Q==
X-Gm-Message-State: AOAM532iYTuE3fpqUN4dZTevP2vPvOW6m4y3YoHZM39kr4C2TZAakv1k
        QfVPLoMdwkiqbuTR3c0c0xXtOiudnDtePA==
X-Google-Smtp-Source: ABdhPJydsm0c7fTrPlKR03JCV4b93R4fiJt66Q1PHzeQ5d1zRqRAyScsf7VNoMp1PnfE8UqpFulVrg==
X-Received: by 2002:ac2:4824:: with SMTP id 4mr4575512lft.553.1626376487202;
        Thu, 15 Jul 2021 12:14:47 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y22sm472357lfh.154.2021.07.15.12.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:14:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3 v6] ARM: davinci: dm646x: Convert LEDs to GPIO descriptor table
Date:   Thu, 15 Jul 2021 21:11:41 +0200
Message-Id: <20210715191141.430307-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715191141.430307-1-linus.walleij@linaro.org>
References: <20210715191141.430307-1-linus.walleij@linaro.org>
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
2.31.1

