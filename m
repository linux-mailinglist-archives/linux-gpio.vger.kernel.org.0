Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B3225F21C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 05:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgIGDiR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 23:38:17 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:50216 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgIGDiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 23:38:17 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 16C3FC1991;
        Mon,  7 Sep 2020 11:38:10 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P22906T140609262356224S1599449889216087_;
        Mon, 07 Sep 2020 11:38:10 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <df311a6a453cb7666feedcec7107c9d6>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 5/5] pinctrl: rockchip: populate platform device for rockchip gpio
Date:   Mon,  7 Sep 2020 11:38:08 +0800
Message-Id: <20200907033808.10211-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907025927.9713-1-jay.xu@rock-chips.com>
References: <20200907025927.9713-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Register both gpio driver and device as part of driver model, so that
the '-gpio'/'-gpios' dependency in dts can be correctly handled by
of_devlink/of_fwlink.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 261 +++++++++++++++++------------
 1 file changed, 150 insertions(+), 111 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c98bd352f831..67850a9386d7 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3370,139 +3370,121 @@ static void rockchip_irq_disable(struct irq_data *d)
 }
 
 static int rockchip_interrupts_register(struct platform_device *pdev,
-						struct rockchip_pinctrl *info)
+						struct rockchip_pin_bank *bank)
 {
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_pin_bank *bank = ctrl->pin_banks;
 	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
 	struct irq_chip_generic *gc;
 	int ret;
-	int i;
 
-	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-		if (!bank->valid) {
-			dev_warn(&pdev->dev, "bank %s is not valid\n",
-				 bank->name);
-			continue;
-		}
+	if (!bank->valid) {
+		dev_warn(&pdev->dev, "bank %s is not valid\n",
+			 bank->name);
+		return -EINVAL;
+	}
 
-		ret = clk_enable(bank->clk);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to enable clock for bank %s\n",
-				bank->name);
-			continue;
-		}
+	ret = clk_enable(bank->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable clock for bank %s\n",
+			bank->name);
+		return ret;
+	}
 
-		bank->domain = irq_domain_add_linear(bank->of_node, 32,
-						&irq_generic_chip_ops, NULL);
-		if (!bank->domain) {
-			dev_warn(&pdev->dev, "could not initialize irq domain for bank %s\n",
-				 bank->name);
-			clk_disable(bank->clk);
-			continue;
-		}
+	bank->domain = irq_domain_add_linear(bank->of_node, 32,
+					&irq_generic_chip_ops, NULL);
+	if (!bank->domain) {
+		dev_warn(&pdev->dev, "could not initialize irq domain for bank %s\n",
+			 bank->name);
+		clk_disable(bank->clk);
+		return -EINVAL;
+	}
 
-		ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
-					 "rockchip_gpio_irq", handle_level_irq,
-					 clr, 0, 0);
-		if (ret) {
-			dev_err(&pdev->dev, "could not alloc generic chips for bank %s\n",
-				bank->name);
-			irq_domain_remove(bank->domain);
-			clk_disable(bank->clk);
-			continue;
-		}
+	ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
+				 "rockchip_gpio_irq", handle_level_irq,
+				 clr, 0, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "could not alloc generic chips for bank %s\n",
+			bank->name);
+		irq_domain_remove(bank->domain);
+		clk_disable(bank->clk);
+		return ret;
+	}
 
-		gc = irq_get_domain_generic_chip(bank->domain, 0);
-		gc->reg_base = bank->reg_base;
-		gc->private = bank;
-		gc->chip_types[0].regs.mask = GPIO_INTMASK;
-		gc->chip_types[0].regs.ack = GPIO_PORTS_EOI;
-		gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
-		gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
-		gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
-		gc->chip_types[0].chip.irq_enable = rockchip_irq_enable;
-		gc->chip_types[0].chip.irq_disable = rockchip_irq_disable;
-		gc->chip_types[0].chip.irq_set_wake = irq_gc_set_wake;
-		gc->chip_types[0].chip.irq_suspend = rockchip_irq_suspend;
-		gc->chip_types[0].chip.irq_resume = rockchip_irq_resume;
-		gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
-		gc->wake_enabled = IRQ_MSK(bank->nr_pins);
+	gc = irq_get_domain_generic_chip(bank->domain, 0);
+	gc->reg_base = bank->reg_base;
+	gc->private = bank;
+	gc->chip_types[0].regs.mask = GPIO_INTMASK;
+	gc->chip_types[0].regs.ack = GPIO_PORTS_EOI;
+	gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
+	gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
+	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_enable = rockchip_irq_enable;
+	gc->chip_types[0].chip.irq_disable = rockchip_irq_disable;
+	gc->chip_types[0].chip.irq_set_wake = irq_gc_set_wake;
+	gc->chip_types[0].chip.irq_suspend = rockchip_irq_suspend;
+	gc->chip_types[0].chip.irq_resume = rockchip_irq_resume;
+	gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
+	gc->wake_enabled = IRQ_MSK(bank->nr_pins);
 
-		/*
-		 * Linux assumes that all interrupts start out disabled/masked.
-		 * Our driver only uses the concept of masked and always keeps
-		 * things enabled, so for us that's all masked and all enabled.
-		 */
-		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
-		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
-		gc->mask_cache = 0xffffffff;
+	/*
+	 * Linux assumes that all interrupts start out disabled/masked.
+	 * Our driver only uses the concept of masked and always keeps
+	 * things enabled, so for us that's all masked and all enabled.
+	 */
+	writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
+	writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
+	gc->mask_cache = 0xffffffff;
 
-		irq_set_chained_handler_and_data(bank->irq,
-						 rockchip_irq_demux, bank);
-		clk_disable(bank->clk);
-	}
+	irq_set_chained_handler_and_data(bank->irq,
+					 rockchip_irq_demux, bank);
+	clk_disable(bank->clk);
 
 	return 0;
 }
 
 static int rockchip_gpiolib_register(struct platform_device *pdev,
-						struct rockchip_pinctrl *info)
+						struct rockchip_pin_bank *bank)
 {
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_pin_bank *bank = ctrl->pin_banks;
 	struct gpio_chip *gc;
 	int ret;
-	int i;
 
-	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-		if (!bank->valid) {
-			dev_warn(&pdev->dev, "bank %s is not valid\n",
-				 bank->name);
-			continue;
-		}
+	if (!bank->valid) {
+		dev_err(&pdev->dev, "bank %s is not valid\n", bank->name);
+		return -EINVAL;
+	}
 
-		bank->gpio_chip = rockchip_gpiolib_chip;
+	bank->gpio_chip = rockchip_gpiolib_chip;
 
-		gc = &bank->gpio_chip;
-		gc->base = bank->pin_base;
-		gc->ngpio = bank->nr_pins;
-		gc->parent = &pdev->dev;
-		gc->of_node = bank->of_node;
-		gc->label = bank->name;
+	gc = &bank->gpio_chip;
+	gc->base = bank->pin_base;
+	gc->ngpio = bank->nr_pins;
+	gc->parent = &pdev->dev;
+	gc->of_node = bank->of_node;
+	gc->label = bank->name;
 
-		ret = gpiochip_add_data(gc, bank);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
-							gc->label, ret);
-			goto fail;
-		}
+	ret = gpiochip_add_data(gc, bank);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register %s (%d)\n", gc->label, ret);
+		return ret;
 	}
 
-	rockchip_interrupts_register(pdev, info);
+	if (!of_property_read_bool(bank->of_node, "gpio-ranges")) {
+		struct device *parent = pdev->dev.parent;
+		struct rockchip_pinctrl *info = dev_get_drvdata(parent);
+		struct pinctrl_dev *pctldev;
 
-	return 0;
+		if (!info)
+			return -ENODATA;
 
-fail:
-	for (--i, --bank; i >= 0; --i, --bank) {
-		if (!bank->valid)
-			continue;
-		gpiochip_remove(&bank->gpio_chip);
-	}
-	return ret;
-}
+		pctldev = info->pctl_dev;
+		if (!pctldev)
+			return -ENODEV;
 
-static int rockchip_gpiolib_unregister(struct platform_device *pdev,
-						struct rockchip_pinctrl *info)
-{
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_pin_bank *bank = ctrl->pin_banks;
-	int i;
-
-	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-		if (!bank->valid)
-			continue;
-		gpiochip_remove(&bank->gpio_chip);
+		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0, gc->base, gc->ngpio);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to add pin range\n");
+			gpiochip_remove(&bank->gpio_chip);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -3742,6 +3724,46 @@ static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops, rockchip_pinctrl_suspend,
 			 rockchip_pinctrl_resume);
 
+static int rockchip_gpio_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *parent = pdev->dev.parent;
+	struct rockchip_pinctrl *info = dev_get_drvdata(parent);
+	struct rockchip_pin_ctrl *ctrl = info ? (info->ctrl) : NULL;
+	struct rockchip_pin_bank *bank;
+	int ret, i;
+
+	if (!info || !ctrl)
+		return -EINVAL;
+
+	if (!of_find_property(np, "gpio-controller", NULL))
+		return -ENODEV;
+
+	bank = ctrl->pin_banks;
+	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
+		if (!strcmp(bank->name, np->name)) {
+			bank->of_node = np;
+
+			if (!rockchip_get_bank_data(bank, info))
+				bank->valid = true;
+
+			break;
+		}
+	}
+
+	bank->of_node = pdev->dev.of_node;
+
+	ret = rockchip_gpiolib_register(pdev, bank);
+	if (ret)
+		return ret;
+
+	ret = rockchip_interrupts_register(pdev, bank);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int rockchip_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rockchip_pinctrl *info;
@@ -3813,18 +3835,20 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 			return PTR_ERR(info->regmap_pmu);
 	}
 
-	ret = rockchip_gpiolib_register(pdev, info);
-	if (ret)
-		return ret;
-
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret) {
-		rockchip_gpiolib_unregister(pdev, info);
+		dev_err(&pdev->dev, "failed to register pinctrl device\n");
 		return ret;
 	}
 
 	platform_set_drvdata(pdev, info);
 
+	ret = of_platform_populate(np, rockchip_bank_match, NULL, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register gpio device\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -4244,6 +4268,14 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 	{},
 };
 
+static struct platform_driver rockchip_gpio_driver = {
+	.probe		= rockchip_gpio_probe,
+	.driver = {
+		.name	= "rockchip-gpio",
+		.of_match_table = rockchip_bank_match,
+	},
+};
+
 static struct platform_driver rockchip_pinctrl_driver = {
 	.probe		= rockchip_pinctrl_probe,
 	.driver = {
@@ -4255,11 +4287,18 @@ static struct platform_driver rockchip_pinctrl_driver = {
 
 static int __init rockchip_pinctrl_drv_register(void)
 {
-	return platform_driver_register(&rockchip_pinctrl_driver);
+	int ret;
+
+	ret = platform_driver_register(&rockchip_pinctrl_driver);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&rockchip_gpio_driver);
 }
 
 static void __exit rockchip_pinctrl_drv_unregister(void)
 {
+	platform_driver_unregister(&rockchip_gpio_driver);
 	platform_driver_unregister(&rockchip_pinctrl_driver);
 }
 
-- 
2.17.1



