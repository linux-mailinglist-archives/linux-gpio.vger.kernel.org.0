Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF8C55B50CA
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 21:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIKTKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 15:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiIKTKA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 15:10:00 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD1012ABE
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 12:09:59 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so11507905lfo.8
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 12:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=se4Q2EXjoYN5boxePANyHew1lzdLUoZm2zBvyyYBb0I=;
        b=SL0IUMfQnUvokxzwH/nmd72NbDBhRhDSSdzr/UQkHDfZIWAq2XJjmTL5yh/HrMDfie
         E2a8D/BUbutAA3Sxb/KQAGXrbQ1EVxYVQ/9lyWYT2aPg/cojKX1cG3tCh92sQWwEmKhu
         RerJ6SC9uHvleCSrM/Q9YzPOaieXozqPO96fAvdh6krPbbFCp9bdlzJu20YMyDs+jAwn
         ntDK6SfEkySwC9eZwsJBOgJ/NR4Lyot+lUfr3TV1kHZEK6z20B3djet2EJjwzJKKJPqF
         fBW2dUE8U9h4ooaaCtZ9mjy8k7PNU1g3zXEb7Fq6FvB2HJBH/3PsvdYVw3NV5KPIkKas
         mJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=se4Q2EXjoYN5boxePANyHew1lzdLUoZm2zBvyyYBb0I=;
        b=MBRsQveh8kVBqPD+I3GMtkX98qddnTKIMzLUs0sZGOYQGYLOOfc2NyccwwGwwKJcAi
         +rGPv8ILrV+/pkHnYJzyCtQX9sAjJH99z0lI1ZN7qy4iuyXyEJg97GWJEFShnU2O/GOR
         K8jWRj0x5CTzq9TFurKCp+RXfuBf0U3e2fWyQwDeEyWp6SoyIAn8zd+itjS3OJMB/t08
         Ozgof3bd3QK7SrKu0Gy1Ti5zoUX6L8RbI9yU58KmRuixqgiGuGw1w1lH3qPIyPixHu9s
         Mu6x4o1qBJJpyrVF5c5XzLhcM+FYC1Vu6jtqNt+8LdLHXOwMv2eBaab+CXaCkeKIRJjs
         Y0mA==
X-Gm-Message-State: ACgBeo38NJSn6vsW70aGVYc7bVrORTZwGKts9Rmxs5aEr6g0WPXq0lmv
        x3ZR4EnBCwynpujoZ01ZyHaRGNN75cZw8w==
X-Google-Smtp-Source: AA6agR5MSkFdfqjoxO+yaO/L0MJEzXyDjpyzUY4iEqWyGGWUWMF+N1B3vnqw7n9PC8gctASy9PVypA==
X-Received: by 2002:a05:6512:13a1:b0:48d:f14:9059 with SMTP id p33-20020a05651213a100b0048d0f149059mr8558902lfa.110.1662923397439;
        Sun, 11 Sep 2022 12:09:57 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id k17-20020a2eb751000000b0026bfbcb296bsm471495ljo.53.2022.09.11.12.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 12:09:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH] gpio: ixp4xx: Make irqchip immutable
Date:   Sun, 11 Sep 2022 21:07:51 +0200
Message-Id: <20220911190751.1788625-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
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

This turns the IXP4xx GPIO irqchip into an immutable
irqchip, a bit different from the standard template due
to being hierarchical.

Tested on the IXP4xx which uses drivers/ata/pata_ixp4xx_cf.c
for a rootfs on compact flash with IRQs from this GPIO
block to the CF ATA controller.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ixp4xx.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 312309be0287..56656fb519f8 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -63,6 +63,14 @@ static void ixp4xx_gpio_irq_ack(struct irq_data *d)
 	__raw_writel(BIT(d->hwirq), g->base + IXP4XX_REG_GPIS);
 }
 
+static void ixp4xx_gpio_mask_irq(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	irq_chip_mask_parent(d);
+	gpiochip_disable_irq(gc, d->hwirq);
+}
+
 static void ixp4xx_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -72,6 +80,7 @@ static void ixp4xx_gpio_irq_unmask(struct irq_data *d)
 	if (!(g->irq_edge & BIT(d->hwirq)))
 		ixp4xx_gpio_irq_ack(d);
 
+	gpiochip_enable_irq(gc, d->hwirq);
 	irq_chip_unmask_parent(d);
 }
 
@@ -149,12 +158,14 @@ static int ixp4xx_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
-static struct irq_chip ixp4xx_gpio_irqchip = {
+static const struct irq_chip ixp4xx_gpio_irqchip = {
 	.name = "IXP4GPIO",
 	.irq_ack = ixp4xx_gpio_irq_ack,
-	.irq_mask = irq_chip_mask_parent,
+	.irq_mask = ixp4xx_gpio_mask_irq,
 	.irq_unmask = ixp4xx_gpio_irq_unmask,
 	.irq_set_type = ixp4xx_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int ixp4xx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
@@ -263,7 +274,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	g->gc.owner = THIS_MODULE;
 
 	girq = &g->gc.irq;
-	girq->chip = &ixp4xx_gpio_irqchip;
+	gpio_irq_chip_set_chip(girq, &ixp4xx_gpio_irqchip);
 	girq->fwnode = g->fwnode;
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = ixp4xx_gpio_child_to_parent_hwirq;
-- 
2.37.2

