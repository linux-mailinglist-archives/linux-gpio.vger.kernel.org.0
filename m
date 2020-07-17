Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6567122319B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 05:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgGQD0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 23:26:40 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:37508 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgGQD0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 23:26:39 -0400
Received: from localhost (unknown [192.168.167.69])
        by lucky1.263xmail.com (Postfix) with ESMTP id 401F4CA609;
        Fri, 17 Jul 2020 11:26:36 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P18496T139713964693248S1594956393972290_;
        Fri, 17 Jul 2020 11:26:35 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <bbad151fee79fd4614be14c6db79bef4>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, kever.yang@rock-chips.com,
        david.wu@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 05/13] pinctrl: rockchip: create irq mapping in gpio_to_irq
Date:   Fri, 17 Jul 2020 11:26:32 +0800
Message-Id: <20200717032632.18073-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717032411.17654-1-jay.xu@rock-chips.com>
References: <20200717032411.17654-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove totally irq mappings create in probe, the gpio irq mapping will
be created when do
    gpio_to_irq ->
        rockchip_gpio_to_irq ->
            irq_create_mapping

This patch can speed up system boot on, also abandon many unused irq
mappings' create.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index d34fada39227..1be4627f3877 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3196,7 +3196,7 @@ static void rockchip_irq_demux(struct irq_desc *desc)
 
 		irq = __ffs(pend);
 		pend &= ~BIT(irq);
-		virq = irq_linear_revmap(bank->domain, irq);
+		virq = irq_find_mapping(bank->domain, irq);
 
 		if (!virq) {
 			dev_err(bank->drvdata->dev, "unmapped irq %d\n", irq);
@@ -3375,7 +3375,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
 	struct irq_chip_generic *gc;
 	int ret;
-	int i, j;
+	int i;
 
 	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
 		if (!bank->valid) {
@@ -3402,7 +3402,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 
 		ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
 					 "rockchip_gpio_irq", handle_level_irq,
-					 clr, 0, IRQ_GC_INIT_MASK_CACHE);
+					 clr, 0, 0);
 		if (ret) {
 			dev_err(&pdev->dev, "could not alloc generic chips for bank %s\n",
 				bank->name);
@@ -3411,14 +3411,6 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 			continue;
 		}
 
-		/*
-		 * Linux assumes that all interrupts start out disabled/masked.
-		 * Our driver only uses the concept of masked and always keeps
-		 * things enabled, so for us that's all masked and all enabled.
-		 */
-		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
-		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
-
 		gc = irq_get_domain_generic_chip(bank->domain, 0);
 		gc->reg_base = bank->reg_base;
 		gc->private = bank;
@@ -3435,13 +3427,17 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 		gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
 		gc->wake_enabled = IRQ_MSK(bank->nr_pins);
 
+		/*
+		 * Linux assumes that all interrupts start out disabled/masked.
+		 * Our driver only uses the concept of masked and always keeps
+		 * things enabled, so for us that's all masked and all enabled.
+		 */
+		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
+		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
+		gc->mask_cache = 0xffffffff;
+
 		irq_set_chained_handler_and_data(bank->irq,
 						 rockchip_irq_demux, bank);
-
-		/* map the gpio irqs here, when the clock is still running */
-		for (j = 0 ; j < 32 ; j++)
-			irq_create_mapping(bank->domain, j);
-
 		clk_disable(bank->clk);
 	}
 
-- 
2.17.1



