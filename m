Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C925061FB60
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 18:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbiKGR3k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 12:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbiKGR3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 12:29:39 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66371D8
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 09:29:37 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso8685746wmb.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jUX5wkpwN8zL5/uJRNeccKjsPP/B2qlR2/KDWqYNiM4=;
        b=pqBGiTYfcBFJqNr8tDtfWk3jvCGI5s9YXawmOSInZi0O2sGpowSdPmdVW1uE+rrVEL
         iS9VUEaVAbYwLuAICHDfodGZW2L/AyLEGdrKT79VdSMjbPQ9qT4c6GZUEKHc/ObyGWtn
         N8MBrpnGlJMFfZYGgxzALB69EKAS2OANUDnd/6kYNV3/nDrqkdL5UWoVSVUCU63aAc28
         V+JtzHNVPyDzPyOyvSXOh4bVrt+AZ5Dk1IT/mdb5ct5z0m+VJxMdq8alt+8bowuFD/WZ
         ikimyF29gtPWuGSRn8qpkRIL+mZD5tAuEGnLD9na9uyptOLzsb4AuazWFj65BeqWKckQ
         /AHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUX5wkpwN8zL5/uJRNeccKjsPP/B2qlR2/KDWqYNiM4=;
        b=Htpn7neB24AyYY9LFvwJ4d/kbh7iqqwrOw97di0gIJqb9zIbnjwSAehStRU5wga18v
         jzAQe/8+WZZ94GExk0dKabpZxcykwm+npmYBgwFhDj6u+0C5kQYq1rBQBa5rhGhI6W/6
         6Hd08rWKR33YkpjGaehl6RcJFjeVRqFyRNWKs1B5eVEE3W++4MKObMuTmNwfz4dszQhD
         DflIYyfH0Yly8r8CzQanOTnsgidSgAcwwiYzL1w8w0fEMG7F63JW11zBSrIcDdJL1cBv
         orSBgePFObUw5MqA43w4lhH2SUnTTZvsomGvxRqVFx7DO6n/7t4SZ8PNQokRQxU88zb6
         zWuw==
X-Gm-Message-State: ACrzQf3VOEPzDko1vFW8kLAWIGlBeo1/lySXFpMtUwlQOixIzlakluCa
        sAgS/Tro2yD3/jxicMG0oWnAnA==
X-Google-Smtp-Source: AMsMyM72ZA74Klabcot79eR9g6E6J0hISSevIALy9nqeZDI3ZDeP022Nmnolf/O6XSc8Req1nxdSbw==
X-Received: by 2002:a05:600c:818:b0:3cf:7385:7609 with SMTP id k24-20020a05600c081800b003cf73857609mr28177045wmp.186.1667842176333;
        Mon, 07 Nov 2022 09:29:36 -0800 (PST)
Received: from nicolas-Precision-3551.home ([2001:861:5180:dcc0:9e3a:7162:292d:1065])
        by smtp.gmail.com with ESMTPSA id n1-20020a1ca401000000b003cf66a2d433sm11831751wme.33.2022.11.07.09.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:29:35 -0800 (PST)
From:   Nicolas Frayer <nfrayer@baylibre.com>
To:     j-keerthy@ti.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     khilman@baylibre.com, glaroque@baylibre.com, nfrayer@baylibre.com
Subject: [PATCH v2] gpio: davinci: add support of module build
Date:   Mon,  7 Nov 2022 18:29:21 +0100
Message-Id: <20221107172921.514125-1-nfrayer@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Guillaume La Roque <glaroque@baylibre.com>

Added module build support for the davinci gpio driver

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
---
v1->v2:
Keep postcore_initcall() instead of using module_init() 

 drivers/gpio/Kconfig        |  2 +-
 drivers/gpio/gpio-davinci.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a01af1180616..f8bace51c2d0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -219,7 +219,7 @@ config GPIO_CLPS711X
 	  Say yes here to support GPIO on CLPS711X SoCs.
 
 config GPIO_DAVINCI
-	bool "TI Davinci/Keystone GPIO support"
+	tristate "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
 	depends on (ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)
 	help
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 59c4c48d8296..5ddac03dac8a 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -730,3 +730,14 @@ static int __init davinci_gpio_drv_reg(void)
 	return platform_driver_register(&davinci_gpio_driver);
 }
 postcore_initcall(davinci_gpio_drv_reg);
+
+static void __exit davinci_gpio_exit(void)
+{
+	platform_driver_unregister(&davinci_gpio_driver);
+}
+module_exit(davinci_gpio_exit);
+
+MODULE_AUTHOR("Jan Kotas <jank@cadence.com>");
+MODULE_DESCRIPTION("DAVINCI GPIO driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:gpio-davinci");
-- 
2.25.1

