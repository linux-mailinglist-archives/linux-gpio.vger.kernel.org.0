Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6F232CD50
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 08:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235917AbhCDHGF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 02:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235921AbhCDHFo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 02:05:44 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3104EC061574;
        Wed,  3 Mar 2021 23:05:04 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id u16so8390497wrt.1;
        Wed, 03 Mar 2021 23:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gRKAra8yTS+83QOIqBkA7xEIT7nOTZWmVlWuZXnmDiQ=;
        b=EXyBdZSRqsRTGLoEO+lVtwiY2V0s8E9RtO2QzZfn3Y/GcjOg40cdEtuyDPt6m1QQIu
         o2F14FfOI1vpUXik+55nlMSalu0oIzt4qqrQAcO9xirq7vJZNCf53ve2wuVJQYv/6jmo
         V4ycTSgp6YfAOBvIWxtabPDSIIVcws5xtae79PtHQHZmNYAW4F2AaBBBltuBZzWcgGwJ
         hRBKrmDCxG4N0owse8vYp8hIRdJXL2HokYhXWh/btUxxGdlWyIoNhExa8NQdeevwCSrJ
         OV5AQHCZYl4DxnWEMaJhyvYJiXb10qx1u8q+N4lLe9D6Frby7dtBUCB7SDTfO27/qliZ
         klrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gRKAra8yTS+83QOIqBkA7xEIT7nOTZWmVlWuZXnmDiQ=;
        b=PB30cfj0VP4m4aBKOHIa7m5OzJGe6Wgt89OwKkb8/3CyBxXxJ+hil6F9Fbkjt4Da+7
         IAItNjVfbYZUhpOkwW5vQjTlk3+nJQWt8D4tbSSRAvIe6Jfih0cXX8X6yGya/Cx+Y5fQ
         H/1ymTgaOSPeeUwlW61RLhV9rjZ74FQKFg6zMet3138O9TxMzjPZ+qpIhYYz60O301fF
         mBp+2cBcXdzQ86yyGSEkKnC3WcSu0fE9+Z4Z4d7VK4HOtVPMo5vwzgwlRd8tPSUkWLRP
         8AmINxGkVS6fqP7bxPzjdiNa8FyIlt/0NY8H0Ygg2ogy0/xogk+JWWutVIAYndePlyTX
         H+QQ==
X-Gm-Message-State: AOAM531SVvz/udHAG8WgPFTnv+a9zbvoREj6rRETGJA8XdJwk8WwV9Wc
        Z9fwrNYaWlFbsgKDBlNYq84=
X-Google-Smtp-Source: ABdhPJyitQA5zK1X9JHZ4IcgR1cXyUW9BEf6hSPLADL70w59r2l5xR4ppCw2z0v8AhvmTAGkSEKo1g==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr2458499wrg.298.1614841502915;
        Wed, 03 Mar 2021 23:05:02 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id t14sm36320340wru.64.2021.03.03.23.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 23:05:02 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] gpio: regmap: disable IRQ domain without GPIOLIB_IRQCHIP
Date:   Thu,  4 Mar 2021 08:05:01 +0100
Message-Id: <20210304070501.30942-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current code doesn't check if GPIOLIB_IRQCHIP is enabled, which results in
a compilation error when trying to build gpio-regmap without having selected
CONFIG_GPIOLIB_IRQCHIP.

Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using regmap")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/gpio/gpio-regmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 5412cb3b0b2a..fed1e269c42a 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -279,16 +279,20 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (ret < 0)
 		goto err_free_gpio;
 
+#ifdef CONFIG_GPIOLIB_IRQCHIP
 	if (config->irq_domain) {
 		ret = gpiochip_irqchip_add_domain(chip, config->irq_domain);
 		if (ret)
 			goto err_remove_gpiochip;
 	}
+#endif /* CONFIG_GPIOLIB_IRQCHIP */
 
 	return gpio;
 
+#ifdef CONFIG_GPIOLIB_IRQCHIP
 err_remove_gpiochip:
 	gpiochip_remove(chip);
+#endif /* CONFIG_GPIOLIB_IRQCHIP */
 err_free_gpio:
 	kfree(gpio);
 	return ERR_PTR(ret);
-- 
2.20.1

