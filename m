Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAAB9698771
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 22:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjBOViv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 16:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjBOViv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 16:38:51 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C184B2BED2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 13:38:49 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g28so435024lfv.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 13:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=blvGTC9nCPS4N7cOuS54QlGtneBbW2QkfoCowQlULH4=;
        b=WQ6BJUnlfisdVOCB1WI59ylhD//Bwcju91lQuydpO4oh7PQf32u04SSyYASlKhpD2K
         l41VARONpAFN0NM/KkTJeRYGmRCbrleV9jWTCft9eRxhvtzwlbLV3Y7qfaWx0x8JbYaN
         lWlq/wfI991ydckZ5qDXBdn7UZcsAEb0bUu026upyG5kHxT7uCIJIqbu2cUr9DzvB3p0
         bAlS553HzoXLMbEdyR8y/U8gvgGJ9eDURd9Sp+2lrFDfXQXcCEhTp7bWLmQEh6fZosMR
         EH4DyNiyAcsKLyTnR+1NgVrj5bu1MjlJa84gQMVxaY0wWGLzD6rPrZjmvDYzXBFd4paX
         GO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blvGTC9nCPS4N7cOuS54QlGtneBbW2QkfoCowQlULH4=;
        b=0fLpn/73KOBkBCJbHiFglyGLwWegxsWohPs+rKswT5jG3DsmaCgPfuu7dsG42oP88R
         SHZOhoFhbNebc0ajoke+qNsxHO30O65FJpbRSSQF6pqW54GHktwIpOaLOPaT2MRzQrkT
         tO0OURiNevITo4oy9H2R7R6thJm+TWRklakIW21Ki3utql9aDM09hsbXC2HMxufkv42v
         ikc7eCVf8tYN5UwXO1wCZWibwWkZqbAf/2GRGwQIbTonFTVddEu1hvw1ZWjq99ESWnRm
         wHC6YCDud4KuXQrfRNQAym+aaDyMoRg2dF6PD4edWoizUlKMf0cj5Ddh+aNfe8CezCAt
         dWWA==
X-Gm-Message-State: AO0yUKXT2EWQnXQWyNDBmb5/j9PO9BrrDVVu9hfIo5VBDSrBdaJPFKey
        M2uITCsavKIu3PrG24vo8PQ5ZDdpKwsC0/He
X-Google-Smtp-Source: AK7set/XPreWqP0Kpj+Jwu9m8WuT0v/elvbebWaVCPGB3j18D8rC+1n00igoMGy4n8uba+oPAN0qPA==
X-Received: by 2002:ac2:518d:0:b0:4db:1b30:e631 with SMTP id u13-20020ac2518d000000b004db1b30e631mr745942lfi.57.1676497127392;
        Wed, 15 Feb 2023 13:38:47 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id a5-20020a056512020500b004db45ae3aa8sm454466lfo.50.2023.02.15.13.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 13:38:45 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH] gpio: omap: Drop irq_base
Date:   Wed, 15 Feb 2023 22:38:43 +0100
Message-Id: <20230215213843.1737181-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The OMAP1 at one point was using static irqs but that time is gone,
OMAP1 uses sparse irqs like all other multiplatform targets so this
static allocation of descriptors should just go.

Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 80ddc43fd875..292e62c06008 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -992,7 +992,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	struct gpio_irq_chip *irq;
 	static int gpio;
 	const char *label;
-	int irq_base = 0;
 	int ret;
 
 	/*
@@ -1024,19 +1023,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	}
 	bank->chip.ngpio = bank->width;
 
-#ifdef CONFIG_ARCH_OMAP1
-	/*
-	 * REVISIT: Once we have OMAP1 supporting SPARSE_IRQ, we can drop
-	 * irq_alloc_descs() since a base IRQ offset will no longer be needed.
-	 */
-	irq_base = devm_irq_alloc_descs(bank->chip.parent,
-					-1, 0, bank->width, 0);
-	if (irq_base < 0) {
-		dev_err(bank->chip.parent, "Couldn't allocate IRQ numbers\n");
-		return -ENODEV;
-	}
-#endif
-
 	/* MPUIO is a bit different, reading IRQ status clears it */
 	if (bank->is_mpuio && !bank->regs->wkup_en)
 		irqc->irq_set_wake = NULL;
@@ -1047,7 +1033,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	irq->default_type = IRQ_TYPE_NONE;
 	irq->num_parents = 1;
 	irq->parents = &bank->irq;
-	irq->first = irq_base;
 
 	ret = gpiochip_add_data(&bank->chip, bank);
 	if (ret)
-- 
2.34.1

