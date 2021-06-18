Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32073AC3CE
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 08:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbhFRG1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 02:27:48 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:57032 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhFRG1s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 02:27:48 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 14DDDC81A5;
        Fri, 18 Jun 2021 14:24:58 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P16485T139919018157824S1623997492865409_;
        Fri, 18 Jun 2021 14:24:56 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <5aaa7dd8ec3975f83d224d8297a772fa>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        robh+dt@kernel.org, kever.yang@rock-chips.com,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 1/9] pinctrl/rockchip: always enable clock for gpio controller
Date:   Fri, 18 Jun 2021 14:24:41 +0800
Message-Id: <20210618062449.1067106-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618062449.1067106-1-jay.xu@rock-chips.com>
References: <20210618062449.1067106-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since gate and ungate pclk of gpio has very litte benifit for system
power consumption, just keep it always ungate.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 40 +-----------------------------
 1 file changed, 1 insertion(+), 39 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 067fc4208de4..650c71c740f0 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2299,17 +2299,8 @@ static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
 	u32 data;
-	int ret;
 
-	ret = clk_enable(bank->clk);
-	if (ret < 0) {
-		dev_err(bank->drvdata->dev,
-			"failed to enable clock for bank %s\n", bank->name);
-		return ret;
-	}
 	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
-	clk_disable(bank->clk);
-
 	if (data & BIT(offset))
 		return GPIO_LINE_DIRECTION_OUT;
 
@@ -2335,7 +2326,6 @@ static int _rockchip_pmx_gpio_set_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	clk_enable(bank->clk);
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
@@ -2347,7 +2337,6 @@ static int _rockchip_pmx_gpio_set_direction(struct gpio_chip *chip,
 	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
-	clk_disable(bank->clk);
 
 	return 0;
 }
@@ -2798,7 +2787,6 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	unsigned long flags;
 	u32 data;
 
-	clk_enable(bank->clk);
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	data = readl(reg);
@@ -2808,7 +2796,6 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	writel(data, reg);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
-	clk_disable(bank->clk);
 }
 
 /*
@@ -2820,9 +2807,7 @@ static int rockchip_gpio_get(struct gpio_chip *gc, unsigned offset)
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	u32 data;
 
-	clk_enable(bank->clk);
 	data = readl(bank->reg_base + GPIO_EXT_PORT);
-	clk_disable(bank->clk);
 	data >>= offset;
 	data &= 1;
 	return data;
@@ -2858,7 +2843,6 @@ static void rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	unsigned long flags;
 	u32 data;
 
-	clk_enable(bank->clk);
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	data = readl(reg);
@@ -2869,7 +2853,6 @@ static void rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	writel(data, reg);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
-	clk_disable(bank->clk);
 }
 
 /*
@@ -2914,9 +2897,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	if (!bank->domain)
 		return -ENXIO;
 
-	clk_enable(bank->clk);
 	virq = irq_create_mapping(bank->domain, offset);
-	clk_disable(bank->clk);
 
 	return (virq) ? : -ENXIO;
 }
@@ -3015,7 +2996,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	if (ret < 0)
 		return ret;
 
-	clk_enable(bank->clk);
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
@@ -3073,7 +3053,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	default:
 		irq_gc_unlock(gc);
 		raw_spin_unlock_irqrestore(&bank->slock, flags);
-		clk_disable(bank->clk);
 		return -EINVAL;
 	}
 
@@ -3082,7 +3061,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 
 	irq_gc_unlock(gc);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
-	clk_disable(bank->clk);
 
 	return 0;
 }
@@ -3092,10 +3070,8 @@ static void rockchip_irq_suspend(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
 
-	clk_enable(bank->clk);
 	bank->saved_masks = irq_reg_readl(gc, GPIO_INTMASK);
 	irq_reg_writel(gc, ~gc->wake_active, GPIO_INTMASK);
-	clk_disable(bank->clk);
 }
 
 static void rockchip_irq_resume(struct irq_data *d)
@@ -3103,9 +3079,7 @@ static void rockchip_irq_resume(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
 
-	clk_enable(bank->clk);
 	irq_reg_writel(gc, bank->saved_masks, GPIO_INTMASK);
-	clk_disable(bank->clk);
 }
 
 static void rockchip_irq_enable(struct irq_data *d)
@@ -3113,7 +3087,6 @@ static void rockchip_irq_enable(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
 
-	clk_enable(bank->clk);
 	irq_gc_mask_clr_bit(d);
 }
 
@@ -3123,7 +3096,6 @@ static void rockchip_irq_disable(struct irq_data *d)
 	struct rockchip_pin_bank *bank = gc->private;
 
 	irq_gc_mask_set_bit(d);
-	clk_disable(bank->clk);
 }
 
 static int rockchip_interrupts_register(struct platform_device *pdev,
@@ -3143,19 +3115,11 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 			continue;
 		}
 
-		ret = clk_enable(bank->clk);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to enable clock for bank %s\n",
-				bank->name);
-			continue;
-		}
-
 		bank->domain = irq_domain_add_linear(bank->of_node, 32,
 						&irq_generic_chip_ops, NULL);
 		if (!bank->domain) {
 			dev_warn(&pdev->dev, "could not initialize irq domain for bank %s\n",
 				 bank->name);
-			clk_disable(bank->clk);
 			continue;
 		}
 
@@ -3166,7 +3130,6 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 			dev_err(&pdev->dev, "could not alloc generic chips for bank %s\n",
 				bank->name);
 			irq_domain_remove(bank->domain);
-			clk_disable(bank->clk);
 			continue;
 		}
 
@@ -3198,7 +3161,6 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 
 		irq_set_chained_handler_and_data(bank->irq,
 						 rockchip_irq_demux, bank);
-		clk_disable(bank->clk);
 	}
 
 	return 0;
@@ -3317,7 +3279,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
 	if (IS_ERR(bank->clk))
 		return PTR_ERR(bank->clk);
 
-	return clk_prepare(bank->clk);
+	return clk_prepare_enable(bank->clk);
 }
 
 static const struct of_device_id rockchip_pinctrl_dt_match[];
-- 
2.25.1



