Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF352A3775
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 01:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgKCAGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 19:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgKCAGn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 19:06:43 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850F6C0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 16:06:43 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id p15so17078280ljj.8
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbtrPIwXa4ml3XAJ7PZsRo1JBNLJTvmY3dKeu9GKgZo=;
        b=NWk0aKsguLGsWq7m5XpcFMXzVvBD6YcJ0dd7bN55AQVBky7AQ4fkpKPGfWJ64XkQ1R
         2TZDIePLk2OBwXYcmDcbxNtPbZ4zATHFPUV4+9gDbsyyOQNIoIj06uHjoe/b6vucuoNN
         iHzlsgnQIX+dqYBlzFSYYZBEUzaxtpBMhtcxLsLFZIbX8+OgZSDBg+ePs7FCc3jFf8hH
         vx8g86VKD+0+2YDLmVjVLAwxoN2ikBtDXMtGF8uoM3qRcuwMHZ2ZXECdRFCK6JPcjfCr
         956QQVY8YWeq5akBpc8ly5e2W8MjRogoSnWTxuTA+4+hwOWWqkVnaIi453BjAmNvL0bg
         vn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbtrPIwXa4ml3XAJ7PZsRo1JBNLJTvmY3dKeu9GKgZo=;
        b=UsO2aC5Sp3+9GtnFbgrRG0o7DW7PETJfSKKAaMVanBzSYK9cgB3ndrzt041yKqw7/Q
         Unq9A7Z9RUvfrVrSyo1Pb5lsyHYINREukNb/rTvYiqnv292nUfo+/mLd/09B1WnQi2fE
         cAeBF9je9Xc1RoofL9U9ApiQCmSmmNS8hHyHGVzWKY34R5GqsvBaEVA5zgzkhszvs/Ai
         ZfB/MoDN6Jqk0ILdTPod71M+NlKs9OY3BPBee5ATWeKDZ85442mUww7FmM12RKdWNAl1
         x+WVboGSCTvlPNINfVTSO9KwI+I20EX3oOmT7OYpAWwoJUl4Q8GnL0wrMek1hE7Nsu1W
         VrGg==
X-Gm-Message-State: AOAM530i0PcjIhzaAmsqk+v9CO9yCbUZVmrEn38wik8H4W1daSUvPDdP
        DcK5GW64WM9JJmSdsm5fHvJ+Rg==
X-Google-Smtp-Source: ABdhPJxBRWeprqBHt0PEZdqhnXXlzgXSkSvYsBQOlj3f7hqQ92gPdMM+qpAahu4xJmcDKfAkgmlAKg==
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr8123628lji.363.1604362002060;
        Mon, 02 Nov 2020 16:06:42 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id a14sm671492lfo.116.2020.11.02.16.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:06:41 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 1/3 v3] x86/platform/geode: Convert net5501 LED to GPIO machine descriptor
Date:   Tue,  3 Nov 2020 01:04:37 +0100
Message-Id: <20201103000439.325448-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the machine look up the LED from a GPIO machine
descriptor table. The Geode LEDs should be on the CS5535
companion chip.

Cc: linux-gpio@vger.kernel.org
Cc: Andres Salomon <dilinger@queued.net>
Cc: linux-geode@lists.infradead.org
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebase on v5.10-rc1
- Resend
ChangeLog v1->v2:
- Drop excess comma after terminator { }
- Collect Andy's Reviewed-by
---
 arch/x86/platform/geode/net5501.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
index 163e1b545517..558384acd777 100644
--- a/arch/x86/platform/geode/net5501.c
+++ b/arch/x86/platform/geode/net5501.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
 
 #include <asm/geode.h>
 
@@ -55,9 +56,7 @@ static struct platform_device net5501_buttons_dev = {
 static struct gpio_led net5501_leds[] = {
 	{
 		.name = "net5501:1",
-		.gpio = 6,
 		.default_trigger = "default-on",
-		.active_low = 0,
 	},
 };
 
@@ -66,6 +65,15 @@ static struct gpio_led_platform_data net5501_leds_data = {
 	.leds = net5501_leds,
 };
 
+static struct gpiod_lookup_table net5501_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* The Geode GPIOs should be on the CS5535 companion chip */
+		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static struct platform_device net5501_leds_dev = {
 	.name = "leds-gpio",
 	.id = -1,
@@ -80,6 +88,7 @@ static struct platform_device *net5501_devs[] __initdata = {
 static void __init register_net5501(void)
 {
 	/* Setup LED control through leds-gpio driver */
+	gpiod_add_lookup_table(&net5501_leds_gpio_table);
 	platform_add_devices(net5501_devs, ARRAY_SIZE(net5501_devs));
 }
 
-- 
2.26.2

