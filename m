Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144B449EF14
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jan 2022 00:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344011AbiA0X4v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jan 2022 18:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiA0X4u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jan 2022 18:56:50 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A121FC061714
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jan 2022 15:56:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x11so8460552lfa.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jan 2022 15:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+OC9kjqVI6jjq+wFvJ9qUJMj6aqLsM8+z6M3MMReZs=;
        b=TSeEjhtlypIN1EY8mqY0PYGDdn2hImoqmWH9iiOKJYInHeIjl3mbDNgH4rw8IvAjLL
         BpaHkR5CsGBih02xUM60fPzOaVVL0B1XxU6inum1Xe6OUheGRIcdUT2/KMoSexuPAWGm
         gCRIt76HDaBrJ5kb+4XOur3Fd8tQliWYrjUZhUTiDQU8Z4I/6YiVrhqBtIXacBFhPR/d
         xbGp3zKup8tSJkqIpHRxZ/Wu0QHLNpXKnJHHGL45ANdu/0uj4czV3hpUFo9GXJKcKOuV
         qmSPMog6w7QU+I4hSrtTbXZkl1BxkHSnNgwwS0ZoGmMi7qRz7Ht1qACZV+Y2LAVWEPGX
         xgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+OC9kjqVI6jjq+wFvJ9qUJMj6aqLsM8+z6M3MMReZs=;
        b=jKEmS/Mz/RbDKDRIUS2ZkNPLZ53qFFK8XKmJXmhfBC/2QyvV6Oc+oyhqpzvmCgedbd
         JTNwcmlxywt99ZXIdUkFL2y2Xx5O1NGxNU1ZhYddLOMGR3/Af8oE8i3Hm8Uv71+PcuUs
         KDYHQ0M2TLoRvVqDZZ980hYCRPEdD1ZP67/Ap4LlGrRJebDjYnsi0Pp403bml6iOskaB
         3DjR2ehADV133X3vkQ2kJSTxt2N//tAH0YsUHY7sb42JcSx62Y20KOt5zIOLFaFP6icA
         sTk/AyU7mJ3n4mhDk87/YWxxRlmSdJ41O44METXAmbXEd2VWFjtmGSqkoSz4+nLCHfRA
         MQ5w==
X-Gm-Message-State: AOAM530mc2LfqPMmk29VVtWfqabZHBiiZx0g8bhJo0VB0W9Gdepdfjd9
        s/xlqFqZVH0VTA/WZ8kFItVizk5lFFzcww==
X-Google-Smtp-Source: ABdhPJytuQKxYp7E0g64aWlOs4ugRB4Dz7H+IQK6HvbuS1l5Wuzq7uoe4EK19hYve1UQU/9StUSiww==
X-Received: by 2002:a05:6512:30b:: with SMTP id t11mr4436007lfp.575.1643327807783;
        Thu, 27 Jan 2022 15:56:47 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id j16sm1409434lfp.306.2022.01.27.15.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 15:56:47 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: ixp4xx: Detect special machines by compatible
Date:   Fri, 28 Jan 2022 00:54:42 +0100
Message-Id: <20220127235442.416019-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are some special clock amendments for two machines
formerly detected by their machine_is() boardfile macro.

They are now migrated to device tree so use
of_machine_is_compatible() instead.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig       | 1 -
 drivers/gpio/gpio-ixp4xx.c | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1c211b4c63be..6e5563504348 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -343,7 +343,6 @@ config GPIO_IOP
 
 config GPIO_IXP4XX
 	bool "Intel IXP4xx GPIO"
-	depends on ARM # For <asm/mach-types.h>
 	depends on ARCH_IXP4XX
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index b3b050604e0b..1acda980d119 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -17,8 +17,6 @@
 /* Include that go away with DT transition */
 #include <linux/irqchip/irq-ixp4xx.h>
 
-#include <asm/mach-types.h>
-
 #define IXP4XX_REG_GPOUT	0x00
 #define IXP4XX_REG_GPOE		0x04
 #define IXP4XX_REG_GPIN		0x08
@@ -240,7 +238,8 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	 * Make sure GPIO 14 and 15 are NOT used as clocks but GPIO on
 	 * specific machines.
 	 */
-	if (machine_is_dsmg600() || machine_is_nas100d())
+	if (of_machine_is_compatible("dlink,dsm-g600-a") ||
+	    of_machine_is_compatible("iom,nas-100d"))
 		__raw_writel(0x0, g->base + IXP4XX_REG_GPCLK);
 
 	/*
-- 
2.34.1

