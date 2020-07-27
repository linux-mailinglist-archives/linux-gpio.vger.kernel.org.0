Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216D122E7DD
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgG0If5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgG0If5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:35:57 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0F3C061794
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:35:57 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 140so8546459lfi.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MNrZrbX/zWOXvZdcywPntPx7fwHt/d5If59xF2eCZlY=;
        b=UNydazH+h5paUsWR20yLKHx6NChUdxd7sfhV3mi7wqHH1T27VowY7imJYVgdmbQPTw
         FVGMWwqgZtb1rwHPc0d2AVuHE/JJ1zMaEy234q986NUM7tKr034NL+78fY2pfEUO3LOs
         ozf0Ky5oFjsDiliy4Emvc7a9kwBlWXbGhU6v8fnGN3pkbm/+qNylN5bhfDg++Mx+mXpf
         BIpAXtPuwu7nZVPVmed+mENxe9eFAe4KBjmLz48VWk82GxmYJbROkVxdGpJZMhBFar36
         3tKrq0to/BBXmQgQh8vZV3h+/8U0HfCM1ukmqA5IsAQIYhFmsoWuObDOHRXvnzunXLeo
         Sd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MNrZrbX/zWOXvZdcywPntPx7fwHt/d5If59xF2eCZlY=;
        b=jGNQ9in2CmvQGrUYleBgctAQ+23E6FoddIGdBIAEct8LW7CWqsusmYVvEez62iASri
         8+Xy++9i60p6iXNeCj7mlTv2owhN6BkE+MWE3OEG1pxJgWYs8gwQqXzNrS/Q+rQK+imK
         QWYZSsqbrHBIUTaubnBE8Wc1MlDoYO6kbVJImAIN8HiIXQt1Zk8IpDCQSMXDjmRjb5QP
         uVarXO+mc7WibgOoPfmJPIDCjFdTX2psDwlgk9uUobWJob5YRiYAnsKDK1RK/iAEL+xx
         OQ0MHvkDWaAzeGZ0RMCvm/1aPSzY9twi6Kghcr2lVv+OG1O8mc7mqlKWdoG+xbVh21K9
         f0Xw==
X-Gm-Message-State: AOAM530TiDhGMIw6KENQjV72JvmopWC16fJYLdPh2sw/ZnZj/v4Yra3I
        8zGJ4i5azpz6BUgjQRXgqZ8Psw==
X-Google-Smtp-Source: ABdhPJzz5H/BlTgfUUZmd7Or3pK4iUQOrratjL+D8qU2xzqWMg0l6AYYfuJjGp9jLmWoWYvfcI0udg==
X-Received: by 2002:ac2:58d5:: with SMTP id u21mr11086919lfo.31.1595838955657;
        Mon, 27 Jul 2020 01:35:55 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id d14sm2865741lfj.30.2020.07.27.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 01:35:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Guan Xuetao <gxt@pku.edu.cn>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] unicore32: Get rid of <linux/gpio.h> dependency
Date:   Mon, 27 Jul 2020 10:33:19 +0200
Message-Id: <20200727083319.304658-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727083319.304658-1-linus.walleij@linaro.org>
References: <20200727083319.304658-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of writing to the GPIO lines through the gpiolib
API, call the appropriate function directly in the driver.

Cc: Guan Xuetao <gxt@pku.edu.cn>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/unicore32/kernel/gpio.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/unicore32/kernel/gpio.c b/arch/unicore32/kernel/gpio.c
index 887ea29c380a..3f6b5747b094 100644
--- a/arch/unicore32/kernel/gpio.c
+++ b/arch/unicore32/kernel/gpio.c
@@ -13,8 +13,6 @@
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
-/* FIXME: needed for gpio_set_value() - convert to use descriptors or hogs */
-#include <linux/gpio.h>
 #include <mach/hardware.h>
 
 #ifdef CONFIG_LEDS
@@ -110,22 +108,22 @@ void __init puv3_init_gpio(void)
 	writel(GPIO_DIR, GPIO_GPDR);
 #if	defined(CONFIG_PUV3_NB0916) || defined(CONFIG_PUV3_SMW0919)	\
 	|| defined(CONFIG_PUV3_DB0913)
-	gpio_set_value(GPO_WIFI_EN, 1);
-	gpio_set_value(GPO_HDD_LED, 1);
-	gpio_set_value(GPO_VGA_EN, 1);
-	gpio_set_value(GPO_LCD_EN, 1);
-	gpio_set_value(GPO_CAM_PWR_EN, 0);
-	gpio_set_value(GPO_LCD_VCC_EN, 1);
-	gpio_set_value(GPO_SOFT_OFF, 1);
-	gpio_set_value(GPO_BT_EN, 1);
-	gpio_set_value(GPO_FAN_ON, 0);
-	gpio_set_value(GPO_SPKR, 0);
-	gpio_set_value(GPO_CPU_HEALTH, 1);
-	gpio_set_value(GPO_LAN_SEL, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_WIFI_EN, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_HDD_LED, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_VGA_EN, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_LCD_EN, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_CAM_PWR_EN, 0);
+	puv3_direction_output(&puv3_gpio_chip, GPO_LCD_VCC_EN, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_SOFT_OFF, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_BT_EN, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_FAN_ON, 0);
+	puv3_direction_output(&puv3_gpio_chip, GPO_SPKR, 0);
+	puv3_direction_output(&puv3_gpio_chip, GPO_CPU_HEALTH, 1);
+	puv3_direction_output(&puv3_gpio_chip, GPO_LAN_SEL, 1);
 /*
  * DO NOT modify the GPO_SET_V1 and GPO_SET_V2 in kernel
- *	gpio_set_value(GPO_SET_V1, 1);
- *	gpio_set_value(GPO_SET_V2, 1);
+ *	puv3_direction_output(&puv3_gpio_chip, GPO_SET_V1, 1);
+ *	puv3_direction_output(&puv3_gpio_chip, GPO_SET_V2, 1);
  */
 #endif
 	gpiochip_add_data(&puv3_gpio_chip, NULL);
-- 
2.26.2

