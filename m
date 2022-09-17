Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133235BB86F
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 15:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiIQNVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 09:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiIQNVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 09:21:14 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2122A371BA
        for <linux-gpio@vger.kernel.org>; Sat, 17 Sep 2022 06:21:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a8so39709349lff.13
        for <linux-gpio@vger.kernel.org>; Sat, 17 Sep 2022 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=KaOlmbXe9DZ4gb/0Zywy7+zB4GvKUp4PiTaGIeHqYbE=;
        b=M2fUu2p6oW62uf7McGaRuWAvLC8ffR3rrqu9QBb1g0o5MeBEnZOTE5b9foL/zTdGUS
         ZJXm1WY0UrqCKOPldOw2paSNi8p4xY9M93bN0FG6ObR4+1ptGa9sPES3zrXN04s1RJe4
         7irWuGzTj3xAfYpO2NaJkBl73pFMC0sRU4hs1hWWyLWgWJ4DKUfSC8lWArxDAezmGO6q
         BsYccXZTkUIYYiARzVX+0++DOeAhHxxXJVY9MN1atv0pgxJw69JOtwKCcslRaBn7nlhz
         QzhVY/C+BeuLxIpS81mmSMPU+3HAhSxCldKDAxfBt2ZDeI+rividOscdv8+hAtjwuVU6
         QLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=KaOlmbXe9DZ4gb/0Zywy7+zB4GvKUp4PiTaGIeHqYbE=;
        b=khFIlB5Izz6n/0wSM2bM8qCwUTCj9+MC7nMudU5JH2B3L8ev5B0cgVzDOtqMzazC3K
         3UxdDZEZmcbGTrxUXOf438H6PcnAQ8pZGEDlnYc0hD+ZfzeSIHSZ5Z3XBn4YLBIeKbUo
         KHqeKZKMvdfC/40Gaxsy/jnykF/PEtvcLSlEHhIjOtzLx3K2vo1IcjEbHHSTO0xDVPfY
         ne67HxvtKnpJNp0sOnFtzVUrn8rQ662uBO1lEVgliOLf8yKDcSplEu1BhRNnMZwdoQL0
         NzR3FzMqtUht5v5WwdCoIXtIRQ4P+pYjL2BppRTKq/5CjthCLeXH8gTKckmnJevNAjrS
         eIKA==
X-Gm-Message-State: ACrzQf0DH0/PJjo8I/wBnZO29VHBYchfxeD6J/VgbXDoJjmjxZw590Pg
        ZJbFDfL1DWDFuAhOkj+hk7UfmWCQ477dBzuu
X-Google-Smtp-Source: AMsMyM7U1X4tI0kH3EnARTpJ6OfTlzWV9yr3LrnoyJnwFGsr6McUAby0vd2HG4/F2XPNDZfL68LEnw==
X-Received: by 2002:a05:6512:3f1d:b0:492:348c:5cc9 with SMTP id y29-20020a0565123f1d00b00492348c5cc9mr3173121lfa.399.1663420869995;
        Sat, 17 Sep 2022 06:21:09 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id v8-20020a2ea608000000b0026c1cbbf464sm2662521ljp.112.2022.09.17.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 06:21:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH] pinctrl: nomadik: Make gpio irqchip immutable
Date:   Sat, 17 Sep 2022 15:19:07 +0200
Message-Id: <20220917131907.86899-1-linus.walleij@linaro.org>
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

This makes the Nomadik GPIO irqchip immutable.

Tested on the Samsung Galaxy SIII mini GT-I8190.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 51 +++++++++++------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f5014d09d81a..1ee3b45dd6bc 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -244,7 +244,6 @@ enum nmk_gpio_slpm {
 
 struct nmk_gpio_chip {
 	struct gpio_chip chip;
-	struct irq_chip irqchip;
 	void __iomem *addr;
 	struct clk *clk;
 	unsigned int bank;
@@ -675,15 +674,11 @@ static void __nmk_gpio_set_wake(struct nmk_gpio_chip *nmk_chip,
 	__nmk_gpio_irq_modify(nmk_chip, offset, WAKE, on);
 }
 
-static int nmk_gpio_irq_maskunmask(struct irq_data *d, bool enable)
+static void nmk_gpio_irq_maskunmask(struct nmk_gpio_chip *nmk_chip,
+				    struct irq_data *d, bool enable)
 {
-	struct nmk_gpio_chip *nmk_chip;
 	unsigned long flags;
 
-	nmk_chip = irq_data_get_irq_chip_data(d);
-	if (!nmk_chip)
-		return -EINVAL;
-
 	clk_enable(nmk_chip->clk);
 	spin_lock_irqsave(&nmk_gpio_slpm_lock, flags);
 	spin_lock(&nmk_chip->lock);
@@ -696,18 +691,22 @@ static int nmk_gpio_irq_maskunmask(struct irq_data *d, bool enable)
 	spin_unlock(&nmk_chip->lock);
 	spin_unlock_irqrestore(&nmk_gpio_slpm_lock, flags);
 	clk_disable(nmk_chip->clk);
-
-	return 0;
 }
 
 static void nmk_gpio_irq_mask(struct irq_data *d)
 {
-	nmk_gpio_irq_maskunmask(d, false);
+	struct nmk_gpio_chip *nmk_chip = irq_data_get_irq_chip_data(d);
+
+	nmk_gpio_irq_maskunmask(nmk_chip, d, false);
+	gpiochip_disable_irq(&nmk_chip->chip, irqd_to_hwirq(d));
 }
 
 static void nmk_gpio_irq_unmask(struct irq_data *d)
 {
-	nmk_gpio_irq_maskunmask(d, true);
+	struct nmk_gpio_chip *nmk_chip = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(&nmk_chip->chip, irqd_to_hwirq(d));
+	nmk_gpio_irq_maskunmask(nmk_chip, d, true);
 }
 
 static int nmk_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
@@ -1078,13 +1077,25 @@ static struct nmk_gpio_chip *nmk_gpio_populate_chip(struct device_node *np,
 	return nmk_chip;
 }
 
+static const struct irq_chip nmk_irq_chip = {
+	.name = "nomadik-gpio",
+	.irq_ack = nmk_gpio_irq_ack,
+	.irq_mask = nmk_gpio_irq_mask,
+	.irq_unmask = nmk_gpio_irq_unmask,
+	.irq_set_type = nmk_gpio_irq_set_type,
+	.irq_set_wake = nmk_gpio_irq_set_wake,
+	.irq_startup = nmk_gpio_irq_startup,
+	.irq_shutdown = nmk_gpio_irq_shutdown,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int nmk_gpio_probe(struct platform_device *dev)
 {
 	struct device_node *np = dev->dev.of_node;
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
 	struct gpio_irq_chip *girq;
-	struct irq_chip *irqchip;
 	bool supports_sleepmode;
 	int irq;
 	int ret;
@@ -1125,22 +1136,8 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	chip->can_sleep = false;
 	chip->owner = THIS_MODULE;
 
-	irqchip = &nmk_chip->irqchip;
-	irqchip->irq_ack = nmk_gpio_irq_ack;
-	irqchip->irq_mask = nmk_gpio_irq_mask;
-	irqchip->irq_unmask = nmk_gpio_irq_unmask;
-	irqchip->irq_set_type = nmk_gpio_irq_set_type;
-	irqchip->irq_set_wake = nmk_gpio_irq_set_wake;
-	irqchip->irq_startup = nmk_gpio_irq_startup;
-	irqchip->irq_shutdown = nmk_gpio_irq_shutdown;
-	irqchip->flags = IRQCHIP_MASK_ON_SUSPEND;
-	irqchip->name = kasprintf(GFP_KERNEL, "nmk%u-%u-%u",
-				  dev->id,
-				  chip->base,
-				  chip->base + chip->ngpio - 1);
-
 	girq = &chip->irq;
-	girq->chip = irqchip;
+	gpio_irq_chip_set_chip(girq, &nmk_irq_chip);
 	girq->parent_handler = nmk_gpio_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(&dev->dev, 1,
-- 
2.37.3

