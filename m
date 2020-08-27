Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B574025405D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgH0IKs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgH0IKp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:10:45 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEF9C061264
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:10:44 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id i10so5426550ljn.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/IvkEhSqhxEbpj6suoWdTB0OV6oN/odC8QEW4Vw3wp0=;
        b=dpai1au3V4Hm+LYGEv/RFyzLIIO+aVTJISIykAoCNGq8wlw+t/ecDDuKjAOtx/tWLL
         MEvM2P+C4vkH+QsnlirYxT/eoeEG+/WTl+TyjOTSzbFTZB5Ud+0LENXIQbuydJ0FseQW
         xPwmicnmGX1yu0Fl877NpHkYG3idL3prBtsTpFsBkQkX/IYLFrxzim5nC51cEjEk7VuA
         REkPOIqs0X2yX/jM6Z/bhQEHW8H7T9I6ubdmN0eRnYlMyVoSPmG84Hrx8s9S6kj//GIc
         8+8SeDg8kOFzZApeTn4Rf5IJayYiUlDFKzEG7k7tqJPy99nJf/EzEg2hr8JbVVq+Rn/Y
         NJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/IvkEhSqhxEbpj6suoWdTB0OV6oN/odC8QEW4Vw3wp0=;
        b=oVE0oLOK29d02pRXbnOle5XjWcp/rDY67KkHIbQzbuprkj3JDOygpYl1f/ehRZ0bHR
         2hUyk8OqIm9iXIlO72XyohMD3B6byrPuLD/pZFurevjJDDhrVKYQv6lk8cbWRyNCvX7I
         8Rua1iWmQ0uTYSKPAOGwTUj6gZQaEOVm2uFxrr7Ko0dfkFLgfh2JuTxsx4zhM34kE5JA
         C/xYe8M/+Eu8YVWBdVOIA56Vcm8G2FpgbOjKA18yZiwrTTHn7l0IssoX+uynqVWIh0pC
         5PUL8H5Faq1vyJFd4jtsIgluuNcazicX1wbA2D3av9tNoJVItrGkFgavxdG90l6IufRE
         88YQ==
X-Gm-Message-State: AOAM530EY28ODxS/mo34RPninQMmwUJ7T+K45Vl5400S/Jvd9IQOwKYP
        pULqSdDU2HE+n0CHg0fj6PuBOg==
X-Google-Smtp-Source: ABdhPJymt2ghMws7KcB5J2V4GzRRraIltZ+a5GnZQVpeYrbjQ5wNa4WMG8k40CM5CCKimRg9Wbtd2g==
X-Received: by 2002:a2e:7817:: with SMTP id t23mr9087087ljc.161.1598515843263;
        Thu, 27 Aug 2020 01:10:43 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id k9sm331399lfm.29.2020.08.27.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 01:10:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 1/3 v2] x86/platform/geode: Convert net5501 LED to GPIO machine descriptor
Date:   Thu, 27 Aug 2020 10:08:24 +0200
Message-Id: <20200827080826.186024-1-linus.walleij@linaro.org>
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
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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

