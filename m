Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 429E65B1591
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 09:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiIHH03 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 03:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiIHH02 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 03:26:28 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F9E80F5F
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 00:26:26 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 73B6B9001F7;
        Thu,  8 Sep 2022 15:26:24 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v4] gpio: rockchip: support acpi
Date:   Thu,  8 Sep 2022 15:26:21 +0800
Message-Id: <20220908072621.3415957-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE4fVk4eQk4dHx1ISh9LTFUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORg6SDo4ET0jKjAqFggZKgM0
        PUwaCh5VSlVKTU1JTUlKQkNOSk5IVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpJTE1KNwY+
X-HM-Tid: 0a831bfe27742eafkusn73b6b9001f7
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch fix driver to support acpi by following changes:
 * support get gpio bank number from uid of acpi
 * try to get clocks for dt nodes but for acpi
 * try to get clocks by a char id first, if a dt patch applied

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
v4: suggested by Andy Shevchenko
 - use dev_fwnode and to_of_node(fwnode) to replace dev->of_node
 - split to a separate rockchip_gpio_get_clocks
 - handle fail for clk_prepare_enable
 - other codingstyle

v3: suggested by Andy Shevchenko
 - fix irq size (32) to GPIO_MAX_PINS
 - fix to use is_of_node or is_acpi_node
 - use standard pattern for error handle
 - remove redundant assignment

v2:
 - fix rockchip_pin_output_deferred to rockchip_pin_deferred

 drivers/gpio/gpio-rockchip.c | 256 +++++++++++++++++++++++------------
 1 file changed, 169 insertions(+), 87 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index ebb50c25a461..f69afaa297c0 100644
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
@@ -16,10 +16,9 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/pinctrl/pinconf-generic.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "../pinctrl/core.h"
@@ -29,6 +28,8 @@
 #define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
 #define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
 
+#define GPIO_MAX_PINS	(32)
+
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
 	.port_ddr = 0x04,
@@ -200,6 +201,9 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
 		div_debounce_support = true;
 		freq = clk_get_rate(bank->db_clk);
+		if (!freq)
+			return -EINVAL;
+
 		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
 		if (debounce > max_debounce)
 			return -EINVAL;
@@ -507,15 +511,16 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	struct irq_chip_generic *gc;
 	int ret;
 
-	bank->domain = irq_domain_add_linear(bank->of_node, 32,
-					&irq_generic_chip_ops, NULL);
+	bank->domain = irq_domain_create_linear(dev_fwnode(bank->dev),
+						GPIO_MAX_PINS,
+						&irq_generic_chip_ops, NULL);
 	if (!bank->domain) {
 		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
 			 bank->name);
 		return -EINVAL;
 	}
 
-	ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
+	ret = irq_alloc_domain_generic_chips(bank->domain, GPIO_MAX_PINS, 1,
 					     "rockchip_gpio_irq",
 					     handle_level_irq,
 					     clr, 0, 0);
@@ -565,7 +570,8 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	return 0;
 }
 
-static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
+static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank,
+				     struct pinctrl_dev *pctldev)
 {
 	struct gpio_chip *gc;
 	int ret;
@@ -578,95 +584,97 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	gc->label = bank->name;
 	gc->parent = bank->dev;
 
+	if (!gc->base)
+		gc->base = GPIO_MAX_PINS * bank->bank_num;
+	if (!gc->ngpio)
+		gc->ngpio = GPIO_MAX_PINS;
+	if (!gc->label) {
+		gc->label = kasprintf(GFP_KERNEL, "gpio%d", bank->bank_num);
+		if (!gc->label)
+			return -ENOMEM;
+	}
+
 	ret = gpiochip_add_data(gc, bank);
 	if (ret) {
 		dev_err(bank->dev, "failed to add gpiochip %s, %d\n",
 			gc->label, ret);
-		return ret;
+		goto err_free;
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
+	if (!device_property_read_bool(bank->dev, "gpio-ranges") && pctldev) {
 		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
 					     gc->base, gc->ngpio);
 		if (ret) {
 			dev_err(bank->dev, "Failed to add pin range\n");
-			goto fail;
+			goto err_remove;
 		}
 	}
 
 	ret = rockchip_interrupts_register(bank);
 	if (ret) {
 		dev_err(bank->dev, "failed to register interrupt, %d\n", ret);
-		goto fail;
+		goto err_remove;
 	}
 
 	return 0;
 
-fail:
+err_free:
+	if (!bank->name)
+		kfree(gc->label);
+err_remove:
 	gpiochip_remove(&bank->gpio_chip);
 
 	return ret;
 }
 
-static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
+static void rockchip_gpio_set_regs(struct rockchip_pin_bank *bank)
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
-
-	bank->clk = of_clk_get(bank->of_node, 0);
-	if (IS_ERR(bank->clk))
-		return PTR_ERR(bank->clk);
-
-	clk_prepare_enable(bank->clk);
-	id = readl(bank->reg_base + gpio_regs_v2.version_id);
+	int id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
 	/* If not gpio v2, that is default to v1. */
 	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
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
+}
+
+static int rockchip_gpio_get_clocks(struct rockchip_pin_bank *bank)
+{
+	struct device *dev = bank->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	int ret;
+
+	if (!is_of_node(fwnode))
+		return 0;
+
+	bank->clk = devm_clk_get(dev, "bus");
+	if (IS_ERR(bank->clk)) {
+		bank->clk = of_clk_get(to_of_node(fwnode), 0);
+		if (IS_ERR(bank->clk)) {
+			dev_err(dev, "fail to get apb clock\n");
+			return PTR_ERR(bank->clk);
+		}
+	}
+
+	ret = clk_prepare_enable(bank->clk);
+	if (ret < 0)
+		return ret;
+
+	bank->db_clk = devm_clk_get(dev, "db");
+	if (IS_ERR(bank->db_clk)) {
+		bank->db_clk = of_clk_get(to_of_node(fwnode), 1);
+		if (IS_ERR(bank->db_clk))
+			bank->db_clk = NULL;
+	}
+
+	ret = clk_prepare_enable(bank->db_clk);
+	if (ret < 0) {
+		clk_disable_unprepare(bank->clk);
+		return ret;
+	}
 
 	return 0;
 }
@@ -690,57 +698,121 @@ rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
 	return found ? bank : NULL;
 }
 
+static int rockchip_gpio_of_get_bank_id(struct device *dev)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	static int gpio;
+	int bank_id = -1;
+
+	if (is_of_node(fwnode)) {
+		bank_id = of_alias_get_id(to_of_node(fwnode), "gpio");
+		if (bank_id < 0)
+			bank_id = gpio++;
+	}
+
+	return bank_id;
+}
+
+#ifdef CONFIG_ACPI
+static int rockchip_gpio_acpi_get_bank_id(struct device *dev)
+{
+	struct acpi_device *adev;
+	unsigned long bank_id = -1;
+	const char *uid;
+	int ret;
+
+	adev = ACPI_COMPANION(dev);
+	if (!adev)
+		return -ENXIO;
+
+	uid = acpi_device_uid(adev);
+	if (!uid || !(*uid)) {
+		dev_err(dev, "Cannot retrieve UID\n");
+		return -ENODEV;
+	}
+
+	ret = kstrtoul(uid, 0, &bank_id);
+	if (ret)
+		return ret;
+
+	return bank_id;
+}
+#else
+static int rockchip_gpio_acpi_get_bank_id(struct device *dev)
+{
+	return -ENOENT;
+}
+#endif /* CONFIG_ACPI */
+
 static int rockchip_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *pctlnp = of_get_parent(np);
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct pinctrl_dev *pctldev = NULL;
 	struct rockchip_pin_bank *bank = NULL;
-	struct rockchip_pin_deferred *cfg;
-	static int gpio;
-	int id, ret;
+	int bank_id;
+	int ret;
 
-	if (!np || !pctlnp)
-		return -ENODEV;
+	bank_id = rockchip_gpio_acpi_get_bank_id(dev);
+	if (bank_id < 0)
+		bank_id = rockchip_gpio_of_get_bank_id(dev);
+	if (bank_id < 0)
+		return bank_id;
 
-	pctldev = of_pinctrl_get(pctlnp);
-	if (!pctldev)
-		return -EPROBE_DEFER;
+	if (is_of_node(fwnode)) {
+		struct device_node *pctlnp = of_get_parent(to_of_node(fwnode));
 
-	id = of_alias_get_id(np, "gpio");
-	if (id < 0)
-		id = gpio++;
+		pctldev = of_pinctrl_get(pctlnp);
+		if (!pctldev)
+			return -EPROBE_DEFER;
 
-	bank = rockchip_gpio_find_bank(pctldev, id);
-	if (!bank)
-		return -EINVAL;
+		bank = rockchip_gpio_find_bank(pctldev, bank_id);
+		if (!bank)
+			return -ENODEV;
+	} else {
+		bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
+		if (!bank)
+			return -ENOMEM;
+	}
 
+	bank->bank_num = bank_id;
 	bank->dev = dev;
-	bank->of_node = np;
 
-	raw_spin_lock_init(&bank->slock);
+	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bank->reg_base))
+		return PTR_ERR(bank->reg_base);
 
-	ret = rockchip_get_bank_data(bank);
+	bank->irq = platform_get_irq(pdev, 0);
+	if (bank->irq < 0)
+		return bank->irq;
+
+	ret = rockchip_gpio_get_clocks(bank);
 	if (ret)
 		return ret;
 
+	raw_spin_lock_init(&bank->slock);
+	rockchip_gpio_set_regs(bank);
+
 	/*
 	 * Prevent clashes with a deferred output setting
 	 * being added right at this moment.
 	 */
 	mutex_lock(&bank->deferred_lock);
 
-	ret = rockchip_gpiolib_register(bank);
+	ret = rockchip_gpiolib_register(bank, pctldev);
 	if (ret) {
-		clk_disable_unprepare(bank->clk);
-		mutex_unlock(&bank->deferred_lock);
-		return ret;
+		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
+		goto err_unlock;
 	}
 
 	while (!list_empty(&bank->deferred_pins)) {
+		struct rockchip_pin_deferred *cfg;
+
 		cfg = list_first_entry(&bank->deferred_pins,
 				       struct rockchip_pin_deferred, head);
+		if (!cfg)
+			break;
+
 		list_del(&cfg->head);
 
 		switch (cfg->param) {
@@ -765,17 +837,27 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 	mutex_unlock(&bank->deferred_lock);
 
 	platform_set_drvdata(pdev, bank);
-	dev_info(dev, "probed %pOF\n", np);
+	dev_info(dev, "probed %pfw\n", dev_fwnode(dev));
 
 	return 0;
+err_unlock:
+	mutex_unlock(&bank->deferred_lock);
+	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(bank->db_clk);
+
+	return ret;
 }
 
 static int rockchip_gpio_remove(struct platform_device *pdev)
 {
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
+	struct gpio_chip *gc = &bank->gpio_chip;
 
 	clk_disable_unprepare(bank->clk);
-	gpiochip_remove(&bank->gpio_chip);
+	clk_disable_unprepare(bank->db_clk);
+	if (!bank->name)
+		kfree(gc->label);
+	gpiochip_remove(gc);
 
 	return 0;
 }
-- 
2.25.1

