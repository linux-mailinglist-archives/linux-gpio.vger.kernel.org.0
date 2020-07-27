Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0A022E7D4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgG0If1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbgG0If1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:35:27 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3C6C061794
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:35:25 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 140so8545658lfi.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DcqMHLBx80emp1kcwjVp53X1uXPogEjD0s/igUbPvts=;
        b=dqeHzRbs2WQDrOUN2QUum50GDjhzkUK/aR1AIQ6oWHBQ+iJIacd4AcLBq7TvYjkNw8
         y1cDoGnHLasDTZ4dtKIk/odDjTFdRUCczeEGkBLmFvVV+WAzMJ3ZQO/6NZBuGVLbkXyJ
         2egr4g2ctEUCyeM7LOMpa97Dw0128lrtzE/L612TnKriJCA8yPfPZDs8hpxduvrMXcb1
         UeyxBQ15E57hNWY8rbioTmkUt9Pt6/WRYKuCixnf377ToqffuLC1V7ofbwjKReE9omKR
         VqWyxHk2lFzeakVTO7C4amWxIVq73NBPvjfzwcDNPJvJpGmuEUbFq3HZWH1VDmzf735Z
         zPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DcqMHLBx80emp1kcwjVp53X1uXPogEjD0s/igUbPvts=;
        b=qDf/x5hgdFNQvJpgmMDP3z0Y9DRaW8sfXgJ/9eadS0KA4A3tDbOS/avfgKYkfLi489
         fwiNompwkcDHwMfASDQvklqAhm2DJskFOzhGzJOiEtiDz9lqcwEn0GQnac0Hu6ZnDEzt
         jR2vrNR7TZBcAJJh/zLTcFSotSV9U0HJ+6+lNVFxuYGE5TQN9hFU70TE8pG8hjXEqmPM
         ygKQBhH8+2WDzXHaMs2PDmeaPQHTAClAj4PFuOkrBHozSvUHHlvtHMbOswYyJBiRzpaG
         zAscn2hdsNwjwMyaTqlluXt4ZF9GvMTQD/FS6CbnmRIXWvjgt5y7263Rv/2vfDYUfTwE
         YGFw==
X-Gm-Message-State: AOAM531k/NU3pAuXtX5OZc7ArFnjPZDaUInQQfMBM41C3S6rXuFYWfG5
        SkBApYq8Yw8qtYlz/iRQp5gwIw==
X-Google-Smtp-Source: ABdhPJxxFS7QsvuniCyV8tW3GnQLsw7xy2zEmDJAnS12LmmbcqKRUqAUWXmubpNBD1E7HTFl1DjgMg==
X-Received: by 2002:a19:d14:: with SMTP id 20mr11298107lfn.27.1595838924212;
        Mon, 27 Jul 2020 01:35:24 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id d14sm2865741lfj.30.2020.07.27.01.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 01:35:23 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Guan Xuetao <gxt@pku.edu.cn>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Linz <linz@li-pro.net>
Subject: [PATCH 1/2] unicore32: Convert GPIO LEDs to use machine descriptor table
Date:   Mon, 27 Jul 2020 10:33:18 +0200
Message-Id: <20200727083319.304658-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This converts the Unicore32 LEDs to use the GPIO machine
descriptor table to provide the GPIO lines.

Cc: Stephan Linz <linz@li-pro.net>
Cc: Guan Xuetao <gxt@pku.edu.cn>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/unicore32/kernel/gpio.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/unicore32/kernel/gpio.c b/arch/unicore32/kernel/gpio.c
index 36d395b54b7c..887ea29c380a 100644
--- a/arch/unicore32/kernel/gpio.c
+++ b/arch/unicore32/kernel/gpio.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 /* FIXME: needed for gpio_set_value() - convert to use descriptors or hogs */
 #include <linux/gpio.h>
 #include <mach/hardware.h>
@@ -21,10 +22,8 @@
 #include <linux/platform_device.h>
 
 static const struct gpio_led puv3_gpio_leds[] = {
-	{ .name = "cpuhealth", .gpio = GPO_CPU_HEALTH, .active_low = 0,
-		.default_trigger = "heartbeat",	},
-	{ .name = "hdd_led", .gpio = GPO_HDD_LED, .active_low = 1,
-		.default_trigger = "disk-activity", },
+	{ .name = "cpuhealth", .default_trigger = "heartbeat",	},
+	{ .name = "hdd_led", .default_trigger = "disk-activity", },
 };
 
 static const struct gpio_led_platform_data puv3_gpio_led_data = {
@@ -32,6 +31,17 @@ static const struct gpio_led_platform_data puv3_gpio_led_data = {
 	.leds =		(void *) puv3_gpio_leds,
 };
 
+static struct gpiod_lookup_table puv3_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("gpio", GPO_CPU_HEALTH, NULL,
+				0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio", GPO_HDD_LED, NULL,
+				1, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct platform_device puv3_gpio_gpio_leds = {
 	.name =		"leds-gpio",
 	.id =		-1,
@@ -42,6 +52,7 @@ static struct platform_device puv3_gpio_gpio_leds = {
 
 static int __init puv3_gpio_leds_init(void)
 {
+	gpiod_add_lookup_table(&puv3_leds_gpio_table);
 	platform_device_register(&puv3_gpio_gpio_leds);
 	return 0;
 }
-- 
2.26.2

