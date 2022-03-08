Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A374D100C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 07:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbiCHGUj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 01:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235260AbiCHGUh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 01:20:37 -0500
Received: from mail-m17661.qiye.163.com (mail-m17661.qiye.163.com [59.111.176.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90178344CD
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 22:19:40 -0800 (PST)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m17661.qiye.163.com (Hmail) with ESMTPA id 80C8B1DF344;
        Tue,  8 Mar 2022 14:19:38 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 3/4] gpio: rockchip: support driver to work independs on pinctrl
Date:   Tue,  8 Mar 2022 14:19:34 +0800
Message-Id: <20220308061935.2441447-4-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308061935.2441447-1-jay.xu@rock-chips.com>
References: <20220308061935.2441447-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWUMeSkpWS0waGBkdTB
        8ZQh9MVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nyo6Fjo5Fz5JHTILLBcQKy0u
        HUtPCjxVSlVKTU9NTElLSExCS0hOVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpMSUJPNwY+
X-HM-Tid: 0a7f682ee73dda2bkuws80c8b1df344
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, the rockchip_pin_bank is get from pinctrl, that binds the
gpio driver to the pinctrl driver.

rockchip-pinctrl
->probe
  ->register pinctrl
    ->populate gpio platform
    ...
    ->rockchip-gpio probe
      ->register gpio_chip

Once the pinctrl device registered, other devices may try to configure
pins througth pinctrl_bind_pins before probe, and if it is a gpio
operation, that make a failure since gpio not ready.

Heiko has provide a output-defer-list to store settings between pinctrl
and gpio driver, once gpio register, the list will set activate.

With this patch, the gpio can register itself before or without pinctrl,
even if pinctrl driver used, we can make the gpio register before
pinctrl by another patch to rockchip pinctrl driver.

rockchip-pinctrl
->probe
  ->populate gpio platform
    ->rockchip-gpio probe
      ->register gpio_chip
  ->register pinctrl

Since the pinctrl is registered last, other devices will do defer probe.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 197 +++++++++++++----------------------
 1 file changed, 73 insertions(+), 124 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 3703c3d71809..43364e559081 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -26,6 +26,27 @@
 
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
 #define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
+#define GPIO_MAX_PINS	(32)
+
+struct rockchip_gpio {
+	struct device *dev;
+	void __iomem *reg_base;
+	struct gpio_chip gpio_chip;
+	struct irq_domain *domain;
+	const struct rockchip_gpio_regs	*gpio_regs;
+	struct device_node *of_node;
+	struct clk *clk;
+	struct clk *db_clk;
+	raw_spinlock_t slock;
+	u32 saved_masks;
+	u32 toggle_edge_mode;
+	int gpio_type;
+	int irq;
+	int id;
+};
+
+#define to_gpio_gpio(_gc) \
+	(container_of(_gc, struct rockchip_gpio, gpio_chip))
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
@@ -70,7 +91,7 @@ static inline u32 gpio_readl_v2(void __iomem *reg)
 	return readl(reg + 0x4) << 16 | readl(reg);
 }
 
-static inline void rockchip_gpio_writel(struct rockchip_pin_bank *bank,
+static inline void rockchip_gpio_writel(struct rockchip_gpio *bank,
 					u32 value, unsigned int offset)
 {
 	void __iomem *reg = bank->reg_base + offset;
@@ -81,7 +102,7 @@ static inline void rockchip_gpio_writel(struct rockchip_pin_bank *bank,
 		writel(value, reg);
 }
 
-static inline u32 rockchip_gpio_readl(struct rockchip_pin_bank *bank,
+static inline u32 rockchip_gpio_readl(struct rockchip_gpio *bank,
 				      unsigned int offset)
 {
 	void __iomem *reg = bank->reg_base + offset;
@@ -95,7 +116,7 @@ static inline u32 rockchip_gpio_readl(struct rockchip_pin_bank *bank,
 	return value;
 }
 
-static inline void rockchip_gpio_writel_bit(struct rockchip_pin_bank *bank,
+static inline void rockchip_gpio_writel_bit(struct rockchip_gpio *bank,
 					    u32 bit, u32 value,
 					    unsigned int offset)
 {
@@ -117,7 +138,7 @@ static inline void rockchip_gpio_writel_bit(struct rockchip_pin_bank *bank,
 	}
 }
 
-static inline u32 rockchip_gpio_readl_bit(struct rockchip_pin_bank *bank,
+static inline u32 rockchip_gpio_readl_bit(struct rockchip_gpio *bank,
 					  u32 bit, unsigned int offset)
 {
 	void __iomem *reg = bank->reg_base + offset;
@@ -137,7 +158,7 @@ static inline u32 rockchip_gpio_readl_bit(struct rockchip_pin_bank *bank,
 static int rockchip_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned int offset)
 {
-	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
+	struct rockchip_gpio *bank = gpiochip_get_data(chip);
 	u32 data;
 
 	data = rockchip_gpio_readl_bit(bank, offset, bank->gpio_regs->port_ddr);
@@ -150,7 +171,7 @@ static int rockchip_gpio_get_direction(struct gpio_chip *chip,
 static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 				       unsigned int offset, bool input)
 {
-	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
+	struct rockchip_gpio *bank = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 data = input ? 0 : 1;
 
@@ -164,7 +185,7 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			      int value)
 {
-	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
+	struct rockchip_gpio *bank = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
@@ -174,7 +195,7 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 
 static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
-	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
+	struct rockchip_gpio *bank = gpiochip_get_data(gc);
 	u32 data;
 
 	data = readl(bank->reg_base + bank->gpio_regs->ext_port);
@@ -188,8 +209,8 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 				      unsigned int offset,
 				      unsigned int debounce)
 {
-	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	const struct rockchip_gpio_regs	*reg = bank->gpio_regs;
+	struct rockchip_gpio *bank = gpiochip_get_data(gc);
+	const struct rockchip_gpio_regs *reg = bank->gpio_regs;
 	unsigned long flags, div_reg, freq, max_debounce;
 	bool div_debounce_support;
 	unsigned int cur_div_reg;
@@ -295,7 +316,7 @@ static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
  */
 static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
-	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
+	struct rockchip_gpio *bank = gpiochip_get_data(gc);
 	unsigned int virq;
 
 	if (!bank->domain)
@@ -322,10 +343,10 @@ static const struct gpio_chip rockchip_gpiolib_chip = {
 static void rockchip_irq_demux(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct rockchip_pin_bank *bank = irq_desc_get_handler_data(desc);
+	struct rockchip_gpio *bank = irq_desc_get_handler_data(desc);
 	u32 pend;
 
-	dev_dbg(bank->dev, "got irq for bank %s\n", bank->name);
+	dev_dbg(bank->dev, "got irq\n");
 
 	chained_irq_enter(chip, desc);
 
@@ -385,7 +406,7 @@ static void rockchip_irq_demux(struct irq_desc *desc)
 static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
+	struct rockchip_gpio *bank = gc->private;
 	u32 mask = BIT(d->hwirq);
 	u32 polarity;
 	u32 level;
@@ -468,7 +489,7 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 static int rockchip_irq_reqres(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
+	struct rockchip_gpio *bank = gc->private;
 
 	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
 }
@@ -476,7 +497,7 @@ static int rockchip_irq_reqres(struct irq_data *d)
 static void rockchip_irq_relres(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
+	struct rockchip_gpio *bank = gc->private;
 
 	gpiochip_relres_irq(&bank->gpio_chip, d->hwirq);
 }
@@ -484,7 +505,7 @@ static void rockchip_irq_relres(struct irq_data *d)
 static void rockchip_irq_suspend(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
+	struct rockchip_gpio *bank = gc->private;
 
 	bank->saved_masks = irq_reg_readl(gc, bank->gpio_regs->int_mask);
 	irq_reg_writel(gc, ~gc->wake_active, bank->gpio_regs->int_mask);
@@ -493,7 +514,7 @@ static void rockchip_irq_suspend(struct irq_data *d)
 static void rockchip_irq_resume(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
+	struct rockchip_gpio *bank = gc->private;
 
 	irq_reg_writel(gc, bank->saved_masks, bank->gpio_regs->int_mask);
 }
@@ -508,7 +529,7 @@ static void rockchip_irq_disable(struct irq_data *d)
 	irq_gc_mask_set_bit(d);
 }
 
-static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
+static int rockchip_interrupts_register(struct rockchip_gpio *bank)
 {
 	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
 	struct irq_chip_generic *gc;
@@ -517,8 +538,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	bank->domain = irq_domain_add_linear(bank->of_node, 32,
 					&irq_generic_chip_ops, NULL);
 	if (!bank->domain) {
-		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
-			 bank->name);
+		dev_warn(bank->dev, "could not init irq domain\n");
 		return -EINVAL;
 	}
 
@@ -527,8 +547,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 					     handle_level_irq,
 					     clr, 0, 0);
 	if (ret) {
-		dev_err(bank->dev, "could not alloc generic chips for bank %s\n",
-			bank->name);
+		dev_err(bank->dev, "could not alloc generic chips\n");
 		irq_domain_remove(bank->domain);
 		return -EINVAL;
 	}
@@ -554,7 +573,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
 	gc->chip_types[0].chip.irq_request_resources = rockchip_irq_reqres;
 	gc->chip_types[0].chip.irq_release_resources = rockchip_irq_relres;
-	gc->wake_enabled = IRQ_MSK(bank->nr_pins);
+	gc->wake_enabled = IRQ_MSK(GPIO_MAX_PINS);
 
 	/*
 	 * Linux assumes that all interrupts start out disabled/masked.
@@ -572,7 +591,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	return 0;
 }
 
-static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
+static int rockchip_gpiolib_register(struct rockchip_gpio *bank)
 {
 	struct gpio_chip *gc;
 	int ret;
@@ -580,9 +599,9 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	bank->gpio_chip = rockchip_gpiolib_chip;
 
 	gc = &bank->gpio_chip;
-	gc->base = bank->pin_base;
-	gc->ngpio = bank->nr_pins;
-	gc->label = bank->name;
+	gc->base = GPIO_MAX_PINS * bank->id;
+	gc->ngpio = GPIO_MAX_PINS;
+	gc->label = kasprintf(GFP_KERNEL, "gpio%d", bank->id);
 	gc->parent = bank->dev;
 
 	ret = gpiochip_add_data(gc, bank);
@@ -592,35 +611,6 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 		return ret;
 	}
 
-	/*
-	 * For DeviceTree-supported systems, the gpio core checks the
-	 * pinctrl's device node for the "gpio-ranges" property.
-	 * If it is present, it takes care of adding the pin ranges
-	 * for the driver. In this case the driver can skip ahead.
-	 *
-	 * In order to remain compatible with older, existing DeviceTree
-	 * files which don't set the "gpio-ranges" property or systems that
-	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
-	 */
-	if (!of_property_read_bool(bank->of_node, "gpio-ranges")) {
-		struct device_node *pctlnp = of_get_parent(bank->of_node);
-		struct pinctrl_dev *pctldev = NULL;
-
-		if (!pctlnp)
-			return -ENODATA;
-
-		pctldev = of_pinctrl_get(pctlnp);
-		if (!pctldev)
-			return -ENODEV;
-
-		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
-					     gc->base, gc->ngpio);
-		if (ret) {
-			dev_err(bank->dev, "Failed to add pin range\n");
-			goto fail;
-		}
-	}
-
 	ret = rockchip_interrupts_register(bank);
 	if (ret) {
 		dev_err(bank->dev, "failed to register interrupt, %d\n", ret);
@@ -635,19 +625,14 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	return ret;
 }
 
-static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
+static int rockchip_gpio_get_type(struct rockchip_gpio *bank)
 {
 	int id = 0;
 
-	bank->clk = of_clk_get(bank->of_node, 0);
-	if (IS_ERR(bank->clk))
-		return PTR_ERR(bank->clk);
-
-	clk_prepare_enable(bank->clk);
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
 	/* If not gpio v2, that is default to v1. */
-	if (id == GPIO_TYPE_V2) {
+	if (id != GPIO_TYPE_V1) {
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
@@ -664,7 +649,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	return 0;
 }
 
-static int rockchip_gpio_get_irq(struct rockchip_pin_bank *bank)
+static int rockchip_gpio_get_irq(struct rockchip_gpio *bank)
 {
 	struct device *dev = bank->dev;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
@@ -682,55 +667,26 @@ static int rockchip_gpio_get_irq(struct rockchip_pin_bank *bank)
 	return irq;
 }
 
-static struct rockchip_pin_bank *
-rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
-{
-	struct rockchip_pinctrl *info;
-	struct rockchip_pin_bank *bank;
-	int i, found = 0;
-
-	info = pinctrl_dev_get_drvdata(pctldev);
-	bank = info->ctrl->pin_banks;
-	for (i = 0; i < info->ctrl->nr_banks; i++, bank++) {
-		if (bank->bank_num == id) {
-			found = 1;
-			break;
-		}
-	}
-
-	return found ? bank : NULL;
-}
-
 static int rockchip_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *pctlnp = of_get_parent(np);
-	struct pinctrl_dev *pctldev = NULL;
-	struct rockchip_pin_bank *bank = NULL;
-	struct rockchip_pin_output_deferred *cfg;
-	static int gpio;
+	struct rockchip_gpio *bank;
+	static int static_gpio_id;
 	int id, ret;
 
-	if (!np || !pctlnp)
-		return -ENODEV;
-
-	pctldev = of_pinctrl_get(pctlnp);
-	if (!pctldev)
-		return -EPROBE_DEFER;
+	bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
+	if (!bank)
+		return -ENOMEM;
 
 	id = of_alias_get_id(np, "gpio");
 	if (id < 0)
-		id = gpio++;
-
-	bank = rockchip_gpio_find_bank(pctldev, id);
-	if (!bank)
-		return -EINVAL;
+		id = static_gpio_id++;
 
+	bank->id = id;
 	bank->dev = dev;
 	bank->of_node = np;
 
-	raw_spin_lock_init(&bank->slock);
 	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
@@ -739,46 +695,39 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 	if (bank->irq < 0)
 		return bank->irq;
 
-	ret = rockchip_get_bank_data(bank);
-	if (ret)
-		return ret;
+	bank->clk = of_clk_get(np, 0);
+	if (IS_ERR(bank->clk))
+		return PTR_ERR(bank->clk);
 
-	/*
-	 * Prevent clashes with a deferred output setting
-	 * being added right at this moment.
-	 */
-	mutex_lock(&bank->deferred_lock);
+	bank->db_clk = of_clk_get(np, 1);
+	if (IS_ERR(bank->db_clk))
+		bank->db_clk = NULL;
 
-	ret = rockchip_gpiolib_register(bank);
+	clk_prepare_enable(bank->clk);
+
+	ret = rockchip_gpio_get_type(bank);
 	if (ret) {
 		clk_disable_unprepare(bank->clk);
-		mutex_unlock(&bank->deferred_lock);
 		return ret;
 	}
 
-	while (!list_empty(&bank->deferred_output)) {
-		cfg = list_first_entry(&bank->deferred_output,
-				       struct rockchip_pin_output_deferred, head);
-		list_del(&cfg->head);
-
-		ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
-		if (ret)
-			dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin, cfg->arg);
+	raw_spin_lock_init(&bank->slock);
 
-		kfree(cfg);
+	ret = rockchip_gpiolib_register(bank);
+	if (ret) {
+		clk_disable_unprepare(bank->clk);
+		return ret;
 	}
 
-	mutex_unlock(&bank->deferred_lock);
-
 	platform_set_drvdata(pdev, bank);
-	dev_info(dev, "probed %pOF\n", np);
+	printk("%s: probed %s\n", __func__, dev_name(dev));
 
 	return 0;
 }
 
 static int rockchip_gpio_remove(struct platform_device *pdev)
 {
-	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
+	struct rockchip_gpio *bank = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(bank->clk);
 	gpiochip_remove(&bank->gpio_chip);
-- 
2.25.1

