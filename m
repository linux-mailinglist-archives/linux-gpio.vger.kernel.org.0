Return-Path: <linux-gpio+bounces-8758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84E952A0F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 09:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91CD2B2340F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 07:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370EB199398;
	Thu, 15 Aug 2024 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gLW4j3/5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1011.netease.com (mail-m1011.netease.com [154.81.10.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E12717AE1B;
	Thu, 15 Aug 2024 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707745; cv=none; b=ulBW5hrNdIiHD2N3Sqd15dlExgghuXNnfH71G6DJOiRk+S/TwGCrsLfin5+iJ3Cfri8QLFgaNCRaIAOFJh/Biyd8pjpJ714CQiS+LHkTBSIY97NyQwiSjKKp8Q1azr1ODb4hJ6hi7Hpisvyql+yf/iU919b++xB8WLP44TII43U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707745; c=relaxed/simple;
	bh=z2IgNauol0EYMFn0lWC2jgLH+Hm3ocg7L7jUXPCK6MM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zb0sFCKjOcT6psd6VDSPz5OgO9n6DNvMwXXoak8isxhohG3R17QBBNxVu+e2ryth+9pghGdFn27OdBZq3QgOPEqlcL4QzEZ3veY9ElLhFEvxWnaYhmmf0ARXSXVX5z1sruR24muaI5qToQsR7vmvDCQjTi3JVdLzaMC4GNmLQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gLW4j3/5; arc=none smtp.client-ip=154.81.10.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=gLW4j3/5I1u/c0uQx9ZnjjkmkW2HXlr/PEvWXTJxnIaxSQWCNbYAg53yhCY7QcidktYzCvbXtxjBIwsoxBeJrmBonkuLQTiygKWdWyAjIqfQVh9lgNblQBGz4lFgEC+7YLAzeKVA2/DlFWsUrUC9FKfGsh4TIvyM4sej3rLDLWI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=6Dktdgi5micP2tQmwapynkwlXOVaBGnlq+MFeetdSGg=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 771997E032B;
	Thu, 15 Aug 2024 15:17:19 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v1 1/5] gpio: rockchip: support acpi
Date: Thu, 15 Aug 2024 15:16:47 +0800
Message-Id: <20240815071651.3645949-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
References: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5KSFZJGR9NSh5MS0NNHh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9154e5ec8309cfkunm771997e032b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBg6FDo6MjI3PUMJHigvKAJI
	LA0wCj1VSlVKTElITEtNSU9LQ0tDVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkpOSUk3Bg++

1. support ACPI
2. support 'clock-names' from dt nodes
3. driver works without pinctrl device

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 229 ++++++++++++++++++++++-------------
 1 file changed, 142 insertions(+), 87 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 0bd339813110..251961a876a9 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -17,10 +18,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "../pinctrl/core.h"
@@ -30,6 +33,8 @@
 #define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
 #define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
 
+#define GPIO_MAX_PINS	(32)
+
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
 	.port_ddr = 0x04,
@@ -157,7 +162,6 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 	unsigned long flags;
 	u32 data = input ? 0 : 1;
 
-
 	if (input)
 		pinctrl_gpio_direction_input(chip, offset);
 	else
@@ -514,7 +518,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	struct irq_chip_generic *gc;
 	int ret;
 
-	bank->domain = irq_domain_add_linear(bank->of_node, 32,
+	bank->domain = irq_domain_create_linear(dev_fwnode(bank->dev), 32,
 					&irq_generic_chip_ops, NULL);
 	if (!bank->domain) {
 		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
@@ -585,6 +589,16 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
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
@@ -592,36 +606,6 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
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
-		of_node_put(pctlnp);
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
@@ -636,47 +620,18 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
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
@@ -698,40 +653,118 @@ rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
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
+		of_node_put(pctlnp);
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
@@ -741,14 +774,29 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 
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
@@ -773,9 +821,15 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
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
 
 static void rockchip_gpio_remove(struct platform_device *pdev)
@@ -783,6 +837,7 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(bank->db_clk);
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.34.1


