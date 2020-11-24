Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125DF2C2077
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 09:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730911AbgKXIxy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 03:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730519AbgKXIxy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:53:54 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC36C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:53:53 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id t22so8726446ljk.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=22n1tuxoc8ewInV62YF8elTpS8+RAb/cOsUr87r7lFc=;
        b=R0TN2YHa4Lxz1YQXWLIpaBFqn6Tr1js3nrn1b9PnSZFYiM/u9tyBdx9MdKTG6rwkvv
         OlVS5KC49tTDtrVoJML3lwuD2s3Wrt7tgeC5cKs1JrSLldtcKw4HeXhGFwfRYg/kIo2m
         D9rZT8rx6BNcRM1HHb12ZvfIIBMnLqyYsoomNOHKnZ+X+CVVlNV0GnMVq8J7x4Lfxz51
         ieEJZLU/LDXGpjCVi0//mqek8d7wRtE2kDgwpIjT/G8YLg1yyiidiGIqxpuLAj7zs9ta
         5R6r3kuzyCn0Qv0c8+NPVCQAEkYyhaMtKQmVm7UlIrWJXt04g6CknHfbCToXhQcYsYHl
         7LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=22n1tuxoc8ewInV62YF8elTpS8+RAb/cOsUr87r7lFc=;
        b=mDVK8IAYMs4VXjK5JRDioQtOvPuCpFySJXfXIP9RUNuPS5aXRNYm0/Fb3L418lnVvQ
         nHeT5EAAoIq+Nr3N0Sn5pGcliika4U/Z2lZ6bW1/wccA2zplBbA5CfAMIcMErwuLAmzf
         E08ieqjUNOD788dMU3O/boU08Ie0lRkUb0TYGy9hfVIHhzfY7acz1ptF0Ef8d295+EmH
         mNAQnGIH/dBDktDjfzSnqTwU7/qRdiIfKbC4KtgJW0kUVbAZz0ByxzIHHIBWKB/WJTO4
         7BYK5ZtUZ3cgZAJoqTX+9MNfBRi24/Wmp2wyMjt8ZNEw8nTbAuU1zzEkw0UgsEclkVvd
         Vl9w==
X-Gm-Message-State: AOAM533sr4n9Qoh3ZnIotyxGn34bmSci9a5l76V9onbcsDVBSgmymK/J
        vDXOB50lB9wTvTaflpxUpQWCIA==
X-Google-Smtp-Source: ABdhPJyUZog8phaXDENjqXEdZuYfJAoi9Iy4ZWw0t3wuFafy5+Y0jSvb1jAVg/mopQh/ffIq/A02lw==
X-Received: by 2002:a05:651c:2118:: with SMTP id a24mr1268879ljq.442.1606208031562;
        Tue, 24 Nov 2020 00:53:51 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u18sm746602lfq.145.2020.11.24.00.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 00:53:51 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-geode@lists.infradead.org,
        Darren Hart <dvhart@infradead.org>, x86@kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 3/3 v4] x86/platform/geode: Convert alix LED to GPIO machine descriptor
Date:   Tue, 24 Nov 2020 09:53:39 +0100
Message-Id: <20201124085339.6181-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124085339.6181-1-linus.walleij@linaro.org>
References: <20201124085339.6181-1-linus.walleij@linaro.org>
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
Cc: x86@kernel.org
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Cc x86@kernel.org
- Collect Hans' Review tag.
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

