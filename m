Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC28C60EA4D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 22:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbiJZUfx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 16:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234475AbiJZUfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 16:35:51 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BB342ADF
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 13:35:47 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id w14so4150968wru.8
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 13:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FCz1RcOc2xs8qG7Gp+iDMnRCgICHSXj66gxuRMR6t6I=;
        b=zomRMANQ+cwu2r09CO8SZXVV10DCaIGB3fm9Wh+AN9CwrQ1j28r6XrW99nE2SPxR1/
         zqnYv81XB5GFeCctY2kL2ZcrqxraTn9Q5EZgz0PjkcBptbTU+w3stSpEoKudCpmi0QRW
         Z9iRgOXrcJbfPtNvjxIqi/rvnn1jKxRA8AoCK1mbX6VwLf/mIJL2ilpFKgr7/Id10lcl
         op615QJ4Y1dDI5tdLbYXYgFzfMLd40xmGhmd/e5USBsAGcqcY/EZIESGaoOi0WAyBoHm
         52jLTlBmxlFd1rrmvM3sIQ+r4+Cy4WuH3I7JerY/7GAtif3uA96B1+kK6ZT7z/ZWyS1L
         zRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCz1RcOc2xs8qG7Gp+iDMnRCgICHSXj66gxuRMR6t6I=;
        b=iPy9u/1KYkOZNxZG4mauRWcHpPV1SG0tLzFQgOAW37a/17UC1Kxi8mDaL58D85NYZb
         +5hg4ztDXgQC68IMaO/By0nkpwVX5TeGH6e3MPuBqPSXUDqcXfG8Q3G06SM58d8TeC8J
         NhovVkUv179yeHNgO/PgIl83DzIVgecUon1UtJs6/C+SK8vlMi6T7hotTbLaMarL2fOY
         fNzqR5WihuC7F0k/8kpe5iqgNVQqtnwrDzFzageDO8SJ5YkCDbcfyqB7qAZnekcV8GAs
         IuQRQ+hPE0wa4NpdJtikR8N76SIbkyzGLHdrC4aJz7BO9ZlGC3lWS0GoOjlekyodRrQ3
         2mHA==
X-Gm-Message-State: ACrzQf0lqzE2Xwdw03CRXX837lC3pYyPLm3Qgy06sRhlNvSMs+sL95md
        x3Wxmrey5hIgVeHAN18L84RLaQ==
X-Google-Smtp-Source: AMsMyM6fAWrQIGj8o91qjQ9MfD5BnwyZ3X8V9Sm+uCpdusE+ySrKKsP0GruMppVqpcNMbqM8HCvYdg==
X-Received: by 2002:adf:f384:0:b0:236:64ad:c958 with SMTP id m4-20020adff384000000b0023664adc958mr15461817wro.174.1666816546422;
        Wed, 26 Oct 2022 13:35:46 -0700 (PDT)
Received: from nicolas-Precision-3551.home ([2001:861:5180:dcc0:5e38:f194:7686:c33])
        by smtp.gmail.com with ESMTPSA id d11-20020a056000114b00b00231893bfdc7sm6129157wrx.2.2022.10.26.13.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 13:35:45 -0700 (PDT)
From:   Nicolas Frayer <nfrayer@baylibre.com>
To:     j-keerthy@ti.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     khilman@baylibre.com, glaroque@baylibre.com, nfrayer@baylibre.com
Subject: [PATCH] gpio: davinci: add support of module build
Date:   Wed, 26 Oct 2022 22:35:39 +0200
Message-Id: <20221026203539.517886-1-nfrayer@baylibre.com>
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
 drivers/gpio/Kconfig        |  2 +-
 drivers/gpio/gpio-davinci.c | 15 ++++++---------
 2 files changed, 7 insertions(+), 10 deletions(-)

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
index 59c4c48d8296..def87b99691f 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -721,12 +721,9 @@ static struct platform_driver davinci_gpio_driver = {
 	},
 };
 
-/**
- * GPIO driver registration needs to be done before machine_init functions
- * access GPIO. Hence davinci_gpio_drv_reg() is a postcore_initcall.
- */
-static int __init davinci_gpio_drv_reg(void)
-{
-	return platform_driver_register(&davinci_gpio_driver);
-}
-postcore_initcall(davinci_gpio_drv_reg);
+module_platform_driver(davinci_gpio_driver);
+
+MODULE_AUTHOR("Jan Kotas <jank@cadence.com>");
+MODULE_DESCRIPTION("DAVINCI GPIO driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:gpio-davinci");
-- 
2.25.1

