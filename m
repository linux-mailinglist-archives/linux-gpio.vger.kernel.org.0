Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99638219176
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 22:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgGHU1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 16:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgGHU1D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 16:27:03 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C713C061A0B;
        Wed,  8 Jul 2020 13:27:03 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d21so27623439lfb.6;
        Wed, 08 Jul 2020 13:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=en+sYWSOs29OqJtnXcDwQbwEqF1PhQMH/OzXlTL2Uro=;
        b=syTZCHAQomVCO1IcAT05atGNhw1dbfmBOmwVCKjzqEzpZ0yC9TrCcsRcouL6w2rCQi
         5dwv5avADj2LkceEKIhRx5FSnf5JXb2gFb3376P4VM9g1x0l2aipE3XdjfeUMS0SR9k7
         JS3ll1n2eYfS6Law1HAu2LwUR3GsAZNz0M/iC72IegGk/wI7d+/7ilXQXlERDn+UI0ZJ
         odtxjNCB8O4EaD+UvX/J++KNa6g7AitZ886DnrV+q71OPnON2pgBUqbnNOkAn/6eIqPW
         8AY71jmnFDyWRYn45IbUGM0GvpWjVY14yUWCk8YgvLUx87QvzH/x5DMdEj2KdeAdi9D3
         Ua6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=en+sYWSOs29OqJtnXcDwQbwEqF1PhQMH/OzXlTL2Uro=;
        b=UyXOxATomcmYFwODsKc7eyxTFRzoQpwkwrqos30tV5/CWOFoUKzo7RM2oh8fSfSI+3
         HuJWPxz0MxRaqDoXAb6h823PMxj6n/DpDNbcyvYqfTUeSJkH8nNkFnAYKmyrmFmZhuPT
         5sdMQVZwhVIgNtVhDnzB4eJf4wmRf7kyZHDAtp1CUjFKT1+MvJjU8nIBPjHvyKCpRDhH
         krFOH9oPX/nWnW5ujFSU1PuE4yDJqmITIjLQgdOaawYa380IxvBUABKDOAa/DvBwhMSI
         qHMk4wefp/y8yhRSD6mT8BYMfA2MohS1Q4f9GeM4GNlNvB4Y2aWz5xEOrW3Eo1Q52jm9
         ObYw==
X-Gm-Message-State: AOAM533pfignfwF6tv8sSIwzis2q/B5qvTu2+jJyOYM2ZnJ7cqPuiOwv
        LTivj4h2amNpmPtLWhUCugM=
X-Google-Smtp-Source: ABdhPJyHmph+5swDJx845ZRsUtuIVexs7pVope807pOxgxk8VdlOWXNEN60vNWtyj1g1o6YBr2hVWg==
X-Received: by 2002:a19:c214:: with SMTP id l20mr37504635lfc.56.1594240022084;
        Wed, 08 Jul 2020 13:27:02 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id e29sm252568lfc.51.2020.07.08.13.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 13:27:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] gpio: max77620: Initialize hardware state of interrupts
Date:   Wed,  8 Jul 2020 23:23:55 +0300
Message-Id: <20200708202355.28507-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708202355.28507-1-digetx@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I noticed on Nexus 7 that after rebooting from downstream kernel to
upstream, the GPIO interrupt is triggering non-stop despite interrupts
being disabled for all of GPIOs. This happens because Nexus 7 uses a
soft-reboot, meaning that bootloader should take care of resetting
hardware, but the bootloader doesn't do it well. As a result, GPIO
interrupt may be left ON at a boot time. Let's mask all GPIO interrupts
at the driver's initialization time in order to resolve the issue.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 6c516aa7732d..e090979659eb 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -260,6 +260,30 @@ static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return -ENOTSUPP;
 }
 
+static int max77620_gpio_irq_init_hw(struct gpio_chip *gc)
+{
+	struct max77620_gpio *gpio = gpiochip_get_data(gc);
+	unsigned int i;
+	int err;
+
+	/*
+	 * GPIO interrupts may be left ON after bootloader, hence let's
+	 * pre-initialize hardware to the expected state by disabling all
+	 * the interrupts.
+	 */
+	for (i = 0; i < MAX77620_GPIO_NR; i++) {
+		err = regmap_update_bits(gpio->rmap, GPIO_REG_ADDR(i),
+					 MAX77620_CNFG_GPIO_INT_MASK, 0);
+		if (err < 0) {
+			dev_err(gpio->dev,
+				"failed to disable interrupt: %d\n", err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
@@ -295,6 +319,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.irq.chip = &max77620_gpio_irqchip;
 	mgpio->gpio_chip.irq.default_type = IRQ_TYPE_NONE;
 	mgpio->gpio_chip.irq.handler = handle_edge_irq;
+	mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,
 	mgpio->gpio_chip.irq.threaded = true;
 
 	platform_set_drvdata(pdev, mgpio);
-- 
2.26.0

