Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894402A3780
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 01:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgKCAJv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 19:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgKCAJv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 19:09:51 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F96AC0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 16:09:49 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id l28so19773893lfp.10
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 16:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V8skaM7syXmbfJm4r1OgvU6gcYaHXE62TFQBSGlozhU=;
        b=VPnuisHSt7KrX8al+dtlg++Qv7oCD8ZSQh9IGw0n1HPE37QSrZEJW44og/cG2KkNUM
         ZvZbGsifKj022dvdpqsGfbON1hQ1C2fhCkgu/oqfb+Pf3PY4dwaf/Wo0HFrwTKi5GjEI
         iklgVW6n49OGfnQp5fy87V5x620YoCiagJ6DMaL2Nrsb/TTrBvWBrucEAv7aFbS4nwFh
         Fly1f19IVkNOk63tHpr0AGR/93ZW6HhBND1zlxY05NLgDLrD5ms1bKzwfLjhLOxdkzca
         YcBwEirD+fk3m/uNC7ZoM9YlplfBBjMsGX/EwKCZlyiHxxoYZqNt13466NIDAgE0xhss
         2iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V8skaM7syXmbfJm4r1OgvU6gcYaHXE62TFQBSGlozhU=;
        b=Dn9c2mNODJnxUT/zAljLQiOYI1KzG9U/f2XKtMnq1dTs4o7llFScZany5VSo1j9Zpm
         xM2EUdnsx9Fjr5rOqSQK2frzsn+MBblW6b0qywHX4bKWsf8HQheOcSnZ+qmkmEOIyDui
         O3dyrl9LV7Dt61NUjNg73qqB+0skTk5QEwSn91WBVGdZgDA0RfjtZXiAVYZrliXV546x
         L2MrDtou0zrdOhoBKzUjpRzHoU8g18UbqoKTVpCd1dPBFpAt1W1rAf9JQqCb6jRST2jD
         hc851BZ+QeGcF2maBt3cMJA1YCy/Qj0dyxa0W+22T7eIvCc6P8l7CikKG15h6wNKEyvY
         KgOg==
X-Gm-Message-State: AOAM531iB6HwmLLpsbLUZeDQJP0xyUR8QrPGmNRZ4uVLbG58mrwpe+6z
        X+Ue+YKdtE2nrHUKE/EOFGb05Q==
X-Google-Smtp-Source: ABdhPJx/IuAt811CpR0lxNywx/16JQNv0Oq7oOvk2mSd1UjmTTvjm6mdenCkmGpin2oeyX9IG1eFnA==
X-Received: by 2002:ac2:5c4c:: with SMTP id s12mr6105789lfp.174.1604362187923;
        Mon, 02 Nov 2020 16:09:47 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id a14sm671492lfo.116.2020.11.02.16.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:09:47 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 3/3 v3] x86/platform/geode: Convert alix LED to GPIO machine descriptor
Date:   Tue,  3 Nov 2020 01:04:39 +0100
Message-Id: <20201103000439.325448-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103000439.325448-1-linus.walleij@linaro.org>
References: <20201103000439.325448-1-linus.walleij@linaro.org>
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
 arch/x86/platform/geode/alix.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/x86/platform/geode/alix.c b/arch/x86/platform/geode/alix.c
index c33f744b5388..b39bf3b5e108 100644
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
+		{ }
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

