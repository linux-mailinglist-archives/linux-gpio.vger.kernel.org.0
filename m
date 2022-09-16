Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 847665BA85B
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 10:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiIPIny (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 04:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiIPInx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 04:43:53 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20015A4B0D
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 01:43:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id A29D5900AAF;
        Fri, 16 Sep 2022 16:43:49 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 2/2] gpio: rockchip: support acpi
Date:   Fri, 16 Sep 2022 16:43:47 +0800
Message-Id: <20220916084347.458619-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916084347.458619-1-jay.xu@rock-chips.com>
References: <20220916084347.458619-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHh1JVhpISx1JQkoZGBhMGVUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NiI6Fyo4Gj0vHCI6DxI5Dggu
        ITMwFDNVSlVKTU1ISEpMQ0hLT01JVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpPTktINwY+
X-HM-Tid: 0a834577e8df2eafkusna29d5900aaf
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio driver for rockchip gpio controller is seperated from rockchip
pinctrl driver, at the first version, it keeps things original to make
the patch easy to be reviewed, such as the gpio driver must work with
the pinctrl dt node to be its parent node.

This patch wants to fix driver to support acpi since gpio controller
should work well during acpi is enabled. But during upstream, driver is
better to fix other thing together includes:
 - only get clocks when is_of_node.
 - get io resource and irq by platform common apis.
 - use fwnode instead of of_node from device structure.
 - drop pinctrl related codes.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 300 ++++++++++++++++++-----------------
 1 file changed, 158 insertions(+), 142 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index ebb50c25a461..e6ab3a134e1d 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -6,9 +6,9 @@
  * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
-#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
@@ -16,19 +16,90 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
-#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
-#include "../pinctrl/core.h"
-#include "../pinctrl/pinctrl-rockchip.h"
-
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
 #define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
 #define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
 
+#define GPIO_MAX_PINS	(32)
+
+/**
+ * struct rockchip_gpio_regs
+ * @port_dr: data register
+ * @port_ddr: data direction register
+ * @int_en: interrupt enable
+ * @int_mask: interrupt mask
+ * @int_type: interrupt trigger type, such as high, low, edge trriger type.
+ * @int_polarity: interrupt polarity enable register
+ * @int_bothedge: interrupt bothedge enable register
+ * @int_status: interrupt status register
+ * @int_rawstatus: int_status = int_rawstatus & int_mask
+ * @debounce: enable debounce for interrupt signal
+ * @dbclk_div_en: enable divider for debounce clock
+ * @dbclk_div_con: setting for divider of debounce clock
+ * @port_eoi: end of interrupt of the port
+ * @ext_port: port data from external
+ * @version_id: controller version register
+ */
+struct rockchip_gpio_regs {
+	u32 port_dr;
+	u32 port_ddr;
+	u32 int_en;
+	u32 int_mask;
+	u32 int_type;
+	u32 int_polarity;
+	u32 int_bothedge;
+	u32 int_status;
+	u32 int_rawstatus;
+	u32 debounce;
+	u32 dbclk_div_en;
+	u32 dbclk_div_con;
+	u32 port_eoi;
+	u32 ext_port;
+	u32 version_id;
+};
+
+/**
+ * struct rockchip_pin_bank
+ * @dev: the pinctrl device bind to the bank
+ * @reg_base: register base of the gpio bank
+ * @clk: clock of the gpio bank
+ * @db_clk: clock of the gpio debounce
+ * @irq: interrupt of the gpio bank
+ * @saved_masks: Saved content of GPIO_INTEN at suspend time.
+ * @pin_base: first pin number
+ * @nr_pins: number of pins in this bank
+ * @name: name of the bank
+ * @bank_num: number of the bank, to account for holes
+ * @domain: irqdomain of the gpio bank
+ * @gpio_chip: gpiolib chip
+ * @grange: gpio range
+ * @slock: spinlock for the gpio bank
+ * @toggle_edge_mode: bit mask to toggle (falling/rising) edge mode
+ */
+struct rockchip_pin_bank {
+	struct device			*dev;
+	void __iomem			*reg_base;
+	struct clk			*clk;
+	struct clk			*db_clk;
+	int				irq;
+	u32				saved_masks;
+	u32				pin_base;
+	u8				nr_pins;
+	char				*name;
+	u8				bank_num;
+	struct device_node		*of_node;
+	struct irq_domain		*domain;
+	struct gpio_chip		gpio_chip;
+	raw_spinlock_t			slock;
+	const struct rockchip_gpio_regs	*gpio_regs;
+	u32				gpio_type;
+	u32				toggle_edge_mode;
+};
+
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
 	.port_ddr = 0x04,
@@ -200,6 +271,9 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
 		div_debounce_support = true;
 		freq = clk_get_rate(bank->db_clk);
+		if (!freq)
+			return -EINVAL;
+
 		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
 		if (debounce > max_debounce)
 			return -EINVAL;
@@ -507,21 +581,20 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	struct irq_chip_generic *gc;
 	int ret;
 
-	bank->domain = irq_domain_add_linear(bank->of_node, 32,
-					&irq_generic_chip_ops, NULL);
+	bank->domain = irq_domain_create_linear(dev_fwnode(bank->dev),
+						GPIO_MAX_PINS,
+						&irq_generic_chip_ops, NULL);
 	if (!bank->domain) {
-		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
-			 bank->name);
+		dev_warn(bank->dev, "could not init irq domain\n");
 		return -EINVAL;
 	}
 
-	ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
+	ret = irq_alloc_domain_generic_chips(bank->domain, GPIO_MAX_PINS, 1,
 					     "rockchip_gpio_irq",
 					     handle_level_irq,
 					     clr, 0, 0);
 	if (ret) {
-		dev_err(bank->dev, "could not alloc generic chips for bank %s\n",
-			bank->name);
+		dev_err(bank->dev, "could not alloc generic chips\n");
 		irq_domain_remove(bank->domain);
 		return -EINVAL;
 	}
@@ -575,8 +648,13 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	gc = &bank->gpio_chip;
 	gc->base = bank->pin_base;
 	gc->ngpio = bank->nr_pins;
-	gc->label = bank->name;
 	gc->parent = bank->dev;
+	gc->label = devm_kasprintf(bank->dev, GFP_KERNEL, "gpio%d", bank->bank_num);
+	if (!gc->label)
+		return -ENOMEM;
+#ifdef CONFIG_OF_GPIO
+	gc->of_node = of_node_get(bank->dev->of_node);
+#endif
 
 	ret = gpiochip_add_data(gc, bank);
 	if (ret) {
@@ -585,35 +663,6 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
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
@@ -628,144 +677,110 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	return ret;
 }
 
-static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
+static int rockchip_gpio_set_regs(struct rockchip_pin_bank *bank)
 {
-	struct resource res;
-	int id = 0;
-
-	if (of_address_to_resource(bank->of_node, 0, &res)) {
-		dev_err(bank->dev, "cannot find IO resource for bank\n");
-		return -ENOENT;
-	}
-
-	bank->reg_base = devm_ioremap_resource(bank->dev, &res);
-	if (IS_ERR(bank->reg_base))
-		return PTR_ERR(bank->reg_base);
-
-	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
-	if (!bank->irq)
-		return -EINVAL;
+	struct device *dev = bank->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	int version_id;
+	int ret;
 
-	bank->clk = of_clk_get(bank->of_node, 0);
-	if (IS_ERR(bank->clk))
-		return PTR_ERR(bank->clk);
+	if (is_of_node(fwnode)) {
+		bank->clk = of_clk_get(to_of_node(fwnode), 0);
+		if (IS_ERR(bank->clk))
+			return PTR_ERR(bank->clk);
 
-	clk_prepare_enable(bank->clk);
-	id = readl(bank->reg_base + gpio_regs_v2.version_id);
+		ret = clk_prepare_enable(bank->clk);
+		if (ret < 0)
+			return ret;
+	}
 
-	/* If not gpio v2, that is default to v1. */
-	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
+	version_id = readl(bank->reg_base + gpio_regs_v2.version_id);
+	if (version_id == GPIO_TYPE_V2 || version_id == GPIO_TYPE_V2_1) {
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
-		bank->db_clk = of_clk_get(bank->of_node, 1);
-		if (IS_ERR(bank->db_clk)) {
-			dev_err(bank->dev, "cannot find debounce clk\n");
-			clk_disable_unprepare(bank->clk);
-			return -EINVAL;
-		}
 	} else {
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
 	}
 
+	if (bank->gpio_type == GPIO_TYPE_V2 && is_of_node(fwnode)) {
+		bank->db_clk = of_clk_get(to_of_node(fwnode), 1);
+		if (IS_ERR(bank->db_clk))
+			return PTR_ERR(bank->db_clk);
+
+		ret = clk_prepare_enable(bank->db_clk);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-static struct rockchip_pin_bank *
-rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
+static int rockchip_gpio_get_bank_id(struct device *dev)
 {
-	struct rockchip_pinctrl *info;
-	struct rockchip_pin_bank *bank;
-	int i, found = 0;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	int bank_id = -EINVAL;
+	u64 uid;
+	int ret;
+	static int gpio;
 
-	info = pinctrl_dev_get_drvdata(pctldev);
-	bank = info->ctrl->pin_banks;
-	for (i = 0; i < info->ctrl->nr_banks; i++, bank++) {
-		if (bank->bank_num == id) {
-			found = 1;
-			break;
-		}
+	if (is_acpi_node(fwnode)) {
+		ret = acpi_dev_uid_to_integer(ACPI_COMPANION(dev), &uid);
+		if (ret < 0)
+			return ret;
+
+		bank_id = uid;
+	} else {
+		bank_id = of_alias_get_id(to_of_node(fwnode), "gpio");
+		if (bank_id < 0)
+			bank_id = gpio++;
 	}
 
-	return found ? bank : NULL;
+	return bank_id;
 }
 
 static int rockchip_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *pctlnp = of_get_parent(np);
-	struct pinctrl_dev *pctldev = NULL;
-	struct rockchip_pin_bank *bank = NULL;
-	struct rockchip_pin_deferred *cfg;
-	static int gpio;
-	int id, ret;
+	struct rockchip_pin_bank *bank;
+	int ret;
 
-	if (!np || !pctlnp)
-		return -ENODEV;
+	bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
+	if (!bank)
+		return -ENOMEM;
 
-	pctldev = of_pinctrl_get(pctlnp);
-	if (!pctldev)
-		return -EPROBE_DEFER;
+	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bank->reg_base))
+		return PTR_ERR(bank->reg_base);
 
-	id = of_alias_get_id(np, "gpio");
-	if (id < 0)
-		id = gpio++;
+	bank->irq = platform_get_irq(pdev, 0);
+	if (bank->irq < 0)
+		return bank->irq;
 
-	bank = rockchip_gpio_find_bank(pctldev, id);
-	if (!bank)
-		return -EINVAL;
+	bank->bank_num = rockchip_gpio_get_bank_id(dev);
+	if (bank->bank_num < 0)
+		return bank->bank_num;
 
 	bank->dev = dev;
-	bank->of_node = np;
-
-	raw_spin_lock_init(&bank->slock);
+	bank->pin_base = GPIO_MAX_PINS * bank->bank_num;
+	bank->nr_pins = GPIO_MAX_PINS;
 
-	ret = rockchip_get_bank_data(bank);
+	ret = rockchip_gpio_set_regs(bank);
 	if (ret)
 		return ret;
 
-	/*
-	 * Prevent clashes with a deferred output setting
-	 * being added right at this moment.
-	 */
-	mutex_lock(&bank->deferred_lock);
+	raw_spin_lock_init(&bank->slock);
 
 	ret = rockchip_gpiolib_register(bank);
 	if (ret) {
+		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
 		clk_disable_unprepare(bank->clk);
-		mutex_unlock(&bank->deferred_lock);
+		clk_disable_unprepare(bank->db_clk);
 		return ret;
 	}
 
-	while (!list_empty(&bank->deferred_pins)) {
-		cfg = list_first_entry(&bank->deferred_pins,
-				       struct rockchip_pin_deferred, head);
-		list_del(&cfg->head);
-
-		switch (cfg->param) {
-		case PIN_CONFIG_OUTPUT:
-			ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
-			if (ret)
-				dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin,
-					 cfg->arg);
-			break;
-		case PIN_CONFIG_INPUT_ENABLE:
-			ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
-			if (ret)
-				dev_warn(dev, "setting input pin %u failed\n", cfg->pin);
-			break;
-		default:
-			dev_warn(dev, "unknown deferred config param %d\n", cfg->param);
-			break;
-		}
-		kfree(cfg);
-	}
-
-	mutex_unlock(&bank->deferred_lock);
-
 	platform_set_drvdata(pdev, bank);
-	dev_info(dev, "probed %pOF\n", np);
+	dev_info(dev, "probed %pfw\n", dev_fwnode(dev));
 
 	return 0;
 }
@@ -775,6 +790,7 @@ static int rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(bank->db_clk);
 	gpiochip_remove(&bank->gpio_chip);
 
 	return 0;
-- 
2.25.1

