Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339F05ADCE5
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 03:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiIFBak (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 21:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbiIFBah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 21:30:37 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976DF647C0
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 18:30:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 2D443900467;
        Tue,  6 Sep 2022 09:30:27 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.or,
        huangtao@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2] gpio: rockchip: support acpi
Date:   Tue,  6 Sep 2022 09:30:25 +0800
Message-Id: <20220906013025.3302530-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGB4ZVk5LHUwdGEtNGU0eTVUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBQ6Fxw5Qz0aMj02A0wuSiMB
        NEwKCjVVSlVKTU1JT0lMQ0lMQk9OVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpKT0NPNwY+
X-HM-Tid: 0a83106b8ce32eafkusn2d443900467
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
v2:
 - fix rockchip_pin_output_deferred to rockchip_pin_deferred

 drivers/gpio/gpio-rockchip.c | 233 ++++++++++++++++++++++-------------
 1 file changed, 144 insertions(+), 89 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index ebb50c25a461..05c5b2a80260 100644
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
@@ -507,7 +511,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	struct irq_chip_generic *gc;
 	int ret;
 
-	bank->domain = irq_domain_add_linear(bank->of_node, 32,
+	bank->domain = irq_domain_create_linear(dev_fwnode(bank->dev), 32,
 					&irq_generic_chip_ops, NULL);
 	if (!bank->domain) {
 		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
@@ -578,6 +582,16 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
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
@@ -585,35 +599,6 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
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
@@ -628,47 +613,18 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	return ret;
 }
 
-static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
+static void rockchip_gpio_get_ver(struct rockchip_pin_bank *bank)
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
-
-	return 0;
 }
 
 static struct rockchip_pin_bank *
@@ -690,40 +646,117 @@ rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
 	return found ? bank : NULL;
 }
 
+static int rockchip_gpio_of_get_bank_id(struct device *dev)
+{
+	static int gpio;
+	int bank_id = -1;
+
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		bank_id = of_alias_get_id(dev->of_node, "gpio");
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
+
+	return !ret ? bank_id : -ERANGE;
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
 	struct pinctrl_dev *pctldev = NULL;
 	struct rockchip_pin_bank *bank = NULL;
-	struct rockchip_pin_deferred *cfg;
-	static int gpio;
-	int id, ret;
+	int bank_id = 0;
+	int ret;
 
-	if (!np || !pctlnp)
-		return -ENODEV;
+	bank_id = rockchip_gpio_acpi_get_bank_id(dev);
+	if (bank_id < 0) {
+		bank_id = rockchip_gpio_of_get_bank_id(dev);
+		if (bank_id < 0)
+			return bank_id;
+	}
+
+	if (!ACPI_COMPANION(dev)) {
+		struct device_node *pctlnp = of_get_parent(dev->of_node);
 
-	pctldev = of_pinctrl_get(pctlnp);
-	if (!pctldev)
-		return -EPROBE_DEFER;
+		pctldev = of_pinctrl_get(pctlnp);
+		if (!pctldev)
+			return -EPROBE_DEFER;
 
-	id = of_alias_get_id(np, "gpio");
-	if (id < 0)
-		id = gpio++;
+		bank = rockchip_gpio_find_bank(pctldev, bank_id);
+		if (!bank)
+			return -ENODEV;
+	}
 
-	bank = rockchip_gpio_find_bank(pctldev, id);
-	if (!bank)
-		return -EINVAL;
+	if (!bank) {
+		bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
+		if (!bank)
+			return -ENOMEM;
+	}
 
+	bank->bank_num = bank_id;
 	bank->dev = dev;
-	bank->of_node = np;
+
+	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bank->reg_base))
+		return PTR_ERR(bank->reg_base);
+
+	bank->irq = platform_get_irq(pdev, 0);
+	if (bank->irq < 0)
+		return bank->irq;
 
 	raw_spin_lock_init(&bank->slock);
 
-	ret = rockchip_get_bank_data(bank);
-	if (ret)
-		return ret;
+	if (!ACPI_COMPANION(dev)) {
+		bank->clk = devm_clk_get(dev, "bus");
+		if (IS_ERR(bank->clk)) {
+			bank->clk = of_clk_get(dev->of_node, 0);
+			if (IS_ERR(bank->clk)) {
+				dev_err(dev, "fail to get apb clock\n");
+				return PTR_ERR(bank->clk);
+			}
+		}
+
+		bank->db_clk = devm_clk_get(dev, "db");
+		if (IS_ERR(bank->db_clk)) {
+			bank->db_clk = of_clk_get(dev->of_node, 1);
+			if (IS_ERR(bank->db_clk))
+				bank->db_clk = NULL;
+		}
+	}
+
+	clk_prepare_enable(bank->clk);
+	clk_prepare_enable(bank->db_clk);
+
+	rockchip_gpio_get_ver(bank);
 
 	/*
 	 * Prevent clashes with a deferred output setting
@@ -733,14 +766,29 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 
 	ret = rockchip_gpiolib_register(bank);
 	if (ret) {
-		clk_disable_unprepare(bank->clk);
-		mutex_unlock(&bank->deferred_lock);
-		return ret;
+		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
+		goto err_unlock;
+	}
+
+	if (!device_property_read_bool(bank->dev, "gpio-ranges") && pctldev) {
+		struct gpio_chip *gc = &bank->gpio_chip;
+
+		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
+					     gc->base, gc->ngpio);
+		if (ret) {
+			dev_err(bank->dev, "Failed to add pin range\n");
+			goto err_unlock;
+		}
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
@@ -765,9 +813,15 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
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
@@ -775,6 +829,7 @@ static int rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(bank->db_clk);
 	gpiochip_remove(&bank->gpio_chip);
 
 	return 0;
-- 
2.25.1

