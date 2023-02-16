Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8215698FF7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 10:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjBPJhX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 04:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjBPJhV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 04:37:21 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E493947428
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:37:11 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id w11so1991126lfu.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faoOhlvt0pXx5b9yjEZ1+zEpAZyWC5JkPVvmixT6uW8=;
        b=jR0XD+Ioz3L47Pb9zLSjtw3IdL3nPx54VKEZbW1s+YT/rA8zEymFSnJ4edNPfifTY2
         H2R4QRNiHTqz1cBhk2keQSBfig5i9nG2ldg7fWDjxOfEmKdIfk1pwb+8CUlsnaZUDG8+
         rGYXETG9BceiW6oLtKjV0qbgmwlObcVU7at3w54+o9T+6S0qtfxt7lhBVWYrYF404k+1
         htUnADiE4Z4lf1OA00Vcj6wM6Q5Z5SIEdetoHwHt2vKbcAuJ4S4ZtmQEYohQe23EGSfy
         haV/2KCB8mI8zYPsu2X1ylKJuUS2lkP1+yEhx2Tr5iCKrIQorWh6PAun5gAgHBb74ibF
         ItXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faoOhlvt0pXx5b9yjEZ1+zEpAZyWC5JkPVvmixT6uW8=;
        b=ZulN3P38VRC34SJI3H/eFcfT+XUzkuxvoJqfTIGPKuyGlUTPgn4IpMz6THk2UyX6BL
         OQ3Qww9iPikgiATuCfjVBPUZr1tY4KtJbZ1ya40XqGefDdyacq9u55Lu3Q2Kki394VjF
         jacLWa7afM88Dp1IXoYSWHB43pPk/zhKQXlryMmy/bSay1s+cGG3pyGYWnH/sNJGPRT5
         pNU4oBMCpKSVXKhvyq1rUH2apS5ixGJrtfj+4JhGKtuJ6X0H8ZBxacnHkHJao7i5NVUh
         wiTipXkEMljDmC99fQe0VlUtUrt45dTN6KwVZ3atljNs2tHAUbDoUOWoKDhqvIEMryEf
         pDXA==
X-Gm-Message-State: AO0yUKWnqwxZxIH46DZbKPJWOg/m3wvxCFZF2gr9bVfuQTtR3ZbSIEYp
        YWVxaIH4iO45SVleYO/N9K6vHg==
X-Google-Smtp-Source: AK7set/WH5Wo4dm7Rg/kslQSrcM1vcmCcSeQpO4cto/pnaFBZQ4cf9W3lIN+USy5Ry5aGmZDPoX2Pw==
X-Received: by 2002:a05:6512:499:b0:4d5:a689:e53b with SMTP id v25-20020a056512049900b004d5a689e53bmr2009963lfq.27.1676540230285;
        Thu, 16 Feb 2023 01:37:10 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:09 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:37:06 +0100
Subject: [PATCH 05/17] gpio: ath79: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-5-51a8f224a5d0@linaro.org>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
In-Reply-To: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
To:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Jay Fang <f.fangjian@huawei.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the driver to immutable irq-chip with a bit of
intuition.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 3958c6d97639..aa0a954b8392 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -71,6 +71,7 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
+	gpiochip_enable_irq(&ctrl->gc, irqd_to_hwirq(data));
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
@@ -85,6 +86,7 @@ static void ath79_gpio_irq_mask(struct irq_data *data)
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+	gpiochip_disable_irq(&ctrl->gc, irqd_to_hwirq(data));
 }
 
 static void ath79_gpio_irq_enable(struct irq_data *data)
@@ -169,13 +171,15 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 	return 0;
 }
 
-static struct irq_chip ath79_gpio_irqchip = {
+static const struct irq_chip ath79_gpio_irqchip = {
 	.name = "gpio-ath79",
 	.irq_enable = ath79_gpio_irq_enable,
 	.irq_disable = ath79_gpio_irq_disable,
 	.irq_mask = ath79_gpio_irq_mask,
 	.irq_unmask = ath79_gpio_irq_unmask,
 	.irq_set_type = ath79_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void ath79_gpio_irq_handler(struct irq_desc *desc)
@@ -274,7 +278,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	/* Optional interrupt setup */
 	if (!np || of_property_read_bool(np, "interrupt-controller")) {
 		girq = &ctrl->gc.irq;
-		girq->chip = &ath79_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &ath79_gpio_irqchip);
 		girq->parent_handler = ath79_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),

-- 
2.34.1

