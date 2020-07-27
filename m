Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1631F22E739
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgG0IC0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgG0ICZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:02:25 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EA7C0619D4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:02:25 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q6so16169429ljp.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zHfhTTJo5bxaUvIZiRxdZz/1qnRRWIobqlmrPAOzCd8=;
        b=zP2RcdXStRhQTYyNAxYvE3ktAjKNcHpvOHDALQsj2XVuJ8VCRZV0kew++KQw5Gw9M9
         pzCv5qIE8zKNEDwVZYXsjzt2HcCmNlbfdMIHO4Bzj5/Wt2b5qgWKinqNsgrE5TgSn9fE
         KgNZeIPPC7wVbqY+dBLHquq+yt2klfWaO5qBYVaT0uhVY/RQB7vtiXn46gJDuyDDqbUl
         eO1W5JAFgE+LR7MzeEjvZh4zjLi4y12mM1z1za663TY7Kdt9I2wS6rXfeSWhe9bCh41f
         nToEKviy8E2W/gSfWngmCFOuHjQ/ELmMwqZYfzEIM7Zw2Jakn3SxzebDVZ7htQCrgwp8
         iGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zHfhTTJo5bxaUvIZiRxdZz/1qnRRWIobqlmrPAOzCd8=;
        b=JSYq89SP4ceXOlWOzYufIt94Rmz+eZ/Tu84SHQ1j4Ja69HVCt2GbEt+mthVO0zBy6S
         7LXRc6byZGgW36igy00xeVoxAiXUIL64XLNPHKWKwH3Hwu+PhuTMRYIjGsBoVfa6DTF4
         ZGPZfPpBPQqBxTuxr3hqeJHY/aFmk+CcSxuMOGZeY9qXwZe3gl8dDathVMNhHs8vNgrQ
         +Pj1IbXZO72/S3cuy+eljnGKu2JUdJ1/EJ4696ch9S39G1IFI+qcrDImx92xnsSzt+2G
         RKmNU1fhVbQFnKLrbDInx7iKojLl4tH7VrvgUqHWtqQGYTCmJodLP/Ldw9jLVgkfP6V0
         +vrw==
X-Gm-Message-State: AOAM532aO8UQog5gxPJbZr4DAtGkVcp8Lgug1HVQdwinYXJ2ycrUbGj9
        06e2YBg/1FHV03Ujif/QyVJNG1T5n2wqHA==
X-Google-Smtp-Source: ABdhPJxCgNz2rhfFlaeVJOkoOn2724VBraY9zIWobawM3mg5DRpKs0EgikymkdEH1/+2m0NBum16MA==
X-Received: by 2002:a2e:8758:: with SMTP id q24mr8780661ljj.109.1595836943282;
        Mon, 27 Jul 2020 01:02:23 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c21sm2851294lfh.38.2020.07.27.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 01:02:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org
Subject: [PATCH] x86/platform/geode: Convert LED to GPIO machine descriptor
Date:   Mon, 27 Jul 2020 10:00:19 +0200
Message-Id: <20200727080019.286172-1-linus.walleij@linaro.org>
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
Cc: Andres Salomon <dilinger@queued.net>
Cc: linux-geode@lists.infradead.org
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/x86/platform/geode/net5501.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
index 163e1b545517..d4e6c57b9c87 100644
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
+		{ },
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

