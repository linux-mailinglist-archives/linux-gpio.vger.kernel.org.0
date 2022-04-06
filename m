Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347E04F6CCE
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Apr 2022 23:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiDFVel (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 17:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236243AbiDFVeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 17:34:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BB115D38E
        for <linux-gpio@vger.kernel.org>; Wed,  6 Apr 2022 13:48:44 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z12so6142231lfu.10
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2022 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eeGHdFfh5VhQWNvv5IFYwXioLDFPoHM5b7mw7PLA+Oo=;
        b=gqbWoV/kiWZJFr/o6xg5LiTaLGAZKRFrQsVB3xLZ5qktjkhLciIwU8BmW//ENNHo1L
         jBqAsYnCUMOxLRjxz9Qs4bbv2v5u2kQdSag28FxlJIJERO+2LHtjbaSzGQDlevofCRmW
         aHna3sugKFIgypYlWhxiYjucf75l0ZRMnE7Q6InNOI3YaX0HPoHj4jNAJ6JbvzQX95J4
         B6QGWGONgtKB5VOW+FH8J6gaqtTNNdRjcI/p+/+LvR5E0Osj6V3ifuJ4FDILRgTWJOyy
         LGaK6hwQnssoeVLUkulwCGypAnAQNDa5lK4gPFgQuVQ0yox33FOUzy8G4SSDyTMMhjwS
         U2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eeGHdFfh5VhQWNvv5IFYwXioLDFPoHM5b7mw7PLA+Oo=;
        b=3XYSzauAX8N6+F7/V9S4CLGdmbwsKmk8dpcYmQwkdz833J9gEhPtf287RT5jFCihno
         D0MQdUGrV/Z6CqbaMZy6vQxG4lKrdzruP8UuATMedz0Iqzv5wy7s5yQc46s9XsZ5QorV
         y67F7h9qcObLX6aPAN7WiqPYFC47nPUwtjRjWBJiR7LBOu+e/F5VYYhmZfI+dN85wCes
         mvy/lFr7c0W3Xcr0pjsEpv1lHzwaDRYOIIp3YG2y+NdeWzGmjEI8mKjs9g8xKH/BcAFe
         T0oviMgcdbaMm2HYHke54QuSujtYExIV0cxl79LA3ON3B+CeGIXuNwqfThCQv+q0jRfg
         cDoQ==
X-Gm-Message-State: AOAM531g2WE6pg3Bn8G1GXO+pWADhZzBu7hcW3hPCfCO3q0u7jBsdO7x
        2bJ6cWUWee5dW7g5T70dUa8gfWW5cM8K/Q==
X-Google-Smtp-Source: ABdhPJyLZ/flM7Yt8jJCF5uMkaawU5E0ukrw/3T4hgpUEbBCezcYNAVzVaZTTw+H7CGvC/+pwTVcAQ==
X-Received: by 2002:a05:6512:1516:b0:448:39b8:d603 with SMTP id bq22-20020a056512151600b0044839b8d603mr6999611lfb.599.1649278122737;
        Wed, 06 Apr 2022 13:48:42 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id h14-20020a2e900e000000b0024b14fa6038sm1183868ljg.12.2022.04.06.13.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 13:48:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: ixp4xx: Detect special machines by compatible
Date:   Wed,  6 Apr 2022 22:46:37 +0200
Message-Id: <20220406204637.2332100-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are some special clock amendments for two machines
formerly detected by their machine_is() boardfile macro.

They are now migrated to device tree so use
of_machine_is_compatible() instead.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebase on v5.18-rc1
---
 drivers/gpio/Kconfig       | 1 -
 drivers/gpio/gpio-ixp4xx.c | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 45764ec3b2eb..075a5d0feef7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -353,7 +353,6 @@ config GPIO_IOP
 
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
2.35.1

