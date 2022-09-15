Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9733A5BA1D5
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 22:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiIOUfB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 16:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIOUfA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 16:35:00 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0DF167CB
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 13:34:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id j13so8874876ljh.4
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 13:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=HoXSRpSHCvMD1eYi2CV8NwSuOO1L6vro/VvSJyV3Nio=;
        b=XioBsLaejze4YL9UFW9coaZaf++X+o5qBF51oLyAhzI2I9R9H95kfat23VJcDjPk/3
         8DuMzOKOQJy5skH+MBWsLUyNo0riRny+tTb4gezwkckLsdgSffRTGRJA0pfyTT9CVxRM
         Q6QmlnVa8TuB9bGMFbTfSML1ia5sIfmDZEYM9OhbxREvyIU5T7uS6Us/PoVY2HIvDd0/
         qXNYvodhIL0P7YEi7EcELi6ys87ky/2TMcgubGCRtZyPHUN3jjrH45Bj8vfJFXPL2Xhx
         /QbFIeOJzEWXy9GtoSfzxng5TLvpS9TF/lNMI2M5oJgGV9otEPVHPhr0Vb0e+T/gEcq2
         Mdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=HoXSRpSHCvMD1eYi2CV8NwSuOO1L6vro/VvSJyV3Nio=;
        b=0pDxRgFIqbhocwkrVsgShNyZB7sIE7eP8JhPfNyf8kEd9P5DnKn0I57UTFO4IHetbg
         v6wrdXQEgL/DBK2WQsth0KvrVKUESWgub0PJlVi+q7loTA27fzHH1gPS5psJVq+KBx1e
         rEgSEUdSsKTF+/Ye9ApLJ4o4SpekhJxy/2KUP4bzZdoDRrGcGNd+CEsFqjtzw2gHYJXS
         +k/Pek48V2Q882PXkA6CIr81dJ0nBNfNa5EU7tkMIF7poZg0g5a4uO6oCfQqoYevmyva
         ACXCaZE0n0JeIbbUGnmvNJUMT2su2lGN6mo18OgL16Exm9YB0I5yLkw50068MD7yl0rq
         CQVQ==
X-Gm-Message-State: ACrzQf2thqGsfNfpcRdHZLoENVZgBkv0DJpJt17MzGYHDW76T7FgsMMQ
        4Mi/Jli935YhysACljIEbnf6krTQ/MEEIb2A
X-Google-Smtp-Source: AMsMyM57WLOKn4s5AsmGd036+4+beAdEHcRsTP5K9S/XNybIiZNd7DKo/BoSvMwRVBcrb1/XpMV7TQ==
X-Received: by 2002:a05:651c:158e:b0:26b:46a6:bf63 with SMTP id h14-20020a05651c158e00b0026b46a6bf63mr454155ljq.21.1663274096702;
        Thu, 15 Sep 2022 13:34:56 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id f23-20020a2eb5b7000000b00264b292232asm3050979ljn.63.2022.09.15.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 13:34:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH] gpio: ftgpio010: Make irqchip immutable
Date:   Thu, 15 Sep 2022 22:32:54 +0200
Message-Id: <20220915203254.48357-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
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

This turns the FTGPIO010 irqchip immutable.

Tested on the D-Link DIR-685.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ftgpio010.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index f422c3e129a0..f77a965f5780 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -41,14 +41,12 @@
  * struct ftgpio_gpio - Gemini GPIO state container
  * @dev: containing device for this instance
  * @gc: gpiochip for this instance
- * @irq: irqchip for this instance
  * @base: remapped I/O-memory base
  * @clk: silicon clock
  */
 struct ftgpio_gpio {
 	struct device *dev;
 	struct gpio_chip gc;
-	struct irq_chip irq;
 	void __iomem *base;
 	struct clk *clk;
 };
@@ -70,6 +68,7 @@ static void ftgpio_gpio_mask_irq(struct irq_data *d)
 	val = readl(g->base + GPIO_INT_EN);
 	val &= ~BIT(irqd_to_hwirq(d));
 	writel(val, g->base + GPIO_INT_EN);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void ftgpio_gpio_unmask_irq(struct irq_data *d)
@@ -78,6 +77,7 @@ static void ftgpio_gpio_unmask_irq(struct irq_data *d)
 	struct ftgpio_gpio *g = gpiochip_get_data(gc);
 	u32 val;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	val = readl(g->base + GPIO_INT_EN);
 	val |= BIT(irqd_to_hwirq(d));
 	writel(val, g->base + GPIO_INT_EN);
@@ -221,6 +221,16 @@ static int ftgpio_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return 0;
 }
 
+static const struct irq_chip ftgpio_irq_chip = {
+	.name = "FTGPIO010",
+	.irq_ack = ftgpio_gpio_ack_irq,
+	.irq_mask = ftgpio_gpio_mask_irq,
+	.irq_unmask = ftgpio_gpio_unmask_irq,
+	.irq_set_type = ftgpio_gpio_set_irq_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	 GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int ftgpio_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -277,14 +287,8 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	if (!IS_ERR(g->clk))
 		g->gc.set_config = ftgpio_gpio_set_config;
 
-	g->irq.name = "FTGPIO010";
-	g->irq.irq_ack = ftgpio_gpio_ack_irq;
-	g->irq.irq_mask = ftgpio_gpio_mask_irq;
-	g->irq.irq_unmask = ftgpio_gpio_unmask_irq;
-	g->irq.irq_set_type = ftgpio_gpio_set_irq_type;
-
 	girq = &g->gc.irq;
-	girq->chip = &g->irq;
+	gpio_irq_chip_set_chip(girq, &ftgpio_irq_chip);
 	girq->parent_handler = ftgpio_gpio_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
-- 
2.37.3

