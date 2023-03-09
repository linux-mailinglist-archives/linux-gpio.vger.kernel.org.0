Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9A16B1CA9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 08:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjCIHqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 02:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjCIHqE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 02:46:04 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0D7DD593
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 23:46:02 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m6so1161162lfq.5
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 23:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71KSFXipPt6AFUXeJ7X4eL7ZzgFaUvhDfIYjlqtJPYo=;
        b=HcD8RafOCrkba+DwCnjWTCDYkCx8BuPvKb3VLA1X+5duW0me6FZXc8kM1t2tmnFRhU
         PUc6PFWZ+IqLARsCadpuXf9ZD9ilEybWqEcsNFoZ3HGCaPM4FOOLMKItt4biVuqa9TG0
         sYKW/ApX0kQ32n/7dbJhyy/CU7krTG6v2iCXsn56jffPFun7Y3NKuwPasjS5+2UwtHYc
         Z9eAnXzQdnA1hQq9PllyXJ3nxzct+xo//Pp6Z20b8sKN7quaC7WT6fN8p66zZmjGSoaM
         xBmqnI4fzHk/PRfcXBQF5+/7tuYsTaMR3fGg1nFEKzUhmNt6yzY1g6AJPj033+INFHHh
         dEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71KSFXipPt6AFUXeJ7X4eL7ZzgFaUvhDfIYjlqtJPYo=;
        b=HELNKehFcvgh8Pcpt4DXrFhSUXeqWkAXYnRLBI6bQk35EqmL/84AI7QYlIZJIrlI7P
         oBPXAphK9w/BEe8Ie1qgckzlvcoWfP6PXI0SFhlcV2eTOiK9czYzOXzuIIEJBqnRlChZ
         4TZrV/7eaCU7aPGK3UU9SopIWgICiHPAZNveeeuwnFf5+T1etiJkzopbba8CHPDObVT8
         n3Ax9juJKBs52R/bhMP5kg5TByc5TTpLdyL1Z7PBiseAKfp89k4RR3xNBP4zgDDmpGfz
         TC64OD8fyz0NHVubKadrN4Hbzuj+N6gFpmCBAJke3GWJw0Cy9dnl00zIdbaexUjFaHo7
         B6Rw==
X-Gm-Message-State: AO0yUKVXqmRca5vmnWEG4U+A8mg+89abRc8nyQOYsqBXvmFcbohsOEP9
        QO7KOHmhjFJWvIk6/ZNCMQdB0w==
X-Google-Smtp-Source: AK7set8RR2Mj+rE73ojhoeSkxrnf5iVpX8dsi9IU2VoejdjYg6Tzl7570E22Qp/5xs5oY8sCS3m9Pw==
X-Received: by 2002:a19:f00f:0:b0:4c0:91d0:e7ab with SMTP id p15-20020a19f00f000000b004c091d0e7abmr4868474lfc.28.1678347960785;
        Wed, 08 Mar 2023 23:46:00 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:00 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 09 Mar 2023 08:45:53 +0100
Subject: [PATCH v3 05/17] gpio: aspeed-sgpio: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-5-972542092a77@linaro.org>
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
In-Reply-To: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
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
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 44 ++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 454cefbeecf0..3c1c0fc21fc5 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
@@ -29,7 +30,7 @@ struct aspeed_sgpio_pdata {
 
 struct aspeed_sgpio {
 	struct gpio_chip chip;
-	struct irq_chip intc;
+	struct device *dev;
 	struct clk *pclk;
 	raw_spinlock_t lock;
 	void __iomem *base;
@@ -296,6 +297,10 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
 	addr = bank_reg(gpio, bank, reg_irq_enable);
 
+	/* Unmasking the IRQ */
+	if (set)
+		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
+
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(addr);
@@ -307,6 +312,12 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	iowrite32(reg, addr);
 
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	/* Masking the IRQ */
+	if (!set)
+		gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
+
+
 }
 
 static void aspeed_sgpio_irq_mask(struct irq_data *d)
@@ -401,6 +412,27 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
+static void aspeed_sgpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	const struct aspeed_sgpio_bank *bank;
+	struct aspeed_sgpio *gpio;
+	u32 bit;
+	int offset;
+
+	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	seq_printf(p, dev_name(gpio->dev));
+}
+
+static const struct irq_chip aspeed_sgpio_irq_chip = {
+	.irq_ack = aspeed_sgpio_irq_ack,
+	.irq_mask = aspeed_sgpio_irq_mask,
+	.irq_unmask = aspeed_sgpio_irq_unmask,
+	.irq_set_type = aspeed_sgpio_set_type,
+	.irq_print_chip = aspeed_sgpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 				   struct platform_device *pdev)
 {
@@ -423,14 +455,8 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
 	}
 
-	gpio->intc.name = dev_name(&pdev->dev);
-	gpio->intc.irq_ack = aspeed_sgpio_irq_ack;
-	gpio->intc.irq_mask = aspeed_sgpio_irq_mask;
-	gpio->intc.irq_unmask = aspeed_sgpio_irq_unmask;
-	gpio->intc.irq_set_type = aspeed_sgpio_set_type;
-
 	irq = &gpio->chip.irq;
-	irq->chip = &gpio->intc;
+	gpio_irq_chip_set_chip(irq, &aspeed_sgpio_irq_chip);
 	irq->init_valid_mask = aspeed_sgpio_irq_init_valid_mask;
 	irq->handler = handle_bad_irq;
 	irq->default_type = IRQ_TYPE_NONE;
@@ -524,6 +550,8 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
+	gpio->dev = &pdev->dev;
+
 	pdata = device_get_match_data(&pdev->dev);
 	if (!pdata)
 		return -EINVAL;

-- 
2.34.1

