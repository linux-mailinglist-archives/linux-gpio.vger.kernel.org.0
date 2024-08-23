Return-Path: <linux-gpio+bounces-9021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD5595C488
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 07:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5035BB2383D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 05:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6BC4D8B6;
	Fri, 23 Aug 2024 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="YUXGOkhi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1039.netease.com (mail-m1039.netease.com [154.81.10.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F0481B9;
	Fri, 23 Aug 2024 05:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724389339; cv=none; b=RE4rdpOnNnVAQ5nLK9y1HSbXSQxWodGM0bW1+5to+Blnwv07aiE8J/XLrg//nsy7+2QlOv40pMlTAVgXLiLBNW41QkoBpanGbVVcZJX51JbRUXMBZItneM34lMj1tJyq0yUbSG8+dLbJ09sLmMevaG6YiMxR54ppcMldD3U/6MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724389339; c=relaxed/simple;
	bh=2XZxIy0mEuuNFbDs2QLkZ8Vt2jKQSLV+PjjA8ALh4zE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X8Md7+qVCXJFtM5iAQtXBd2OZN05XvrdQqyTABGG5Sio5zQB3kkld/nPntv0Qk2VMG82pICNEjs5RdQB+YKWJbfguTPbmVoeEpbV3MNnuScHWw6AczDZ/v5ryi7L5/LLncPkQoHapOSpDVhuRKCP7NEJvRLxGhDRPQxd/3jF07g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=YUXGOkhi; arc=none smtp.client-ip=154.81.10.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=YUXGOkhiCgppJmZDw8LULJpQZH4iVy7URitzlNbFh84KL9KbTIu/xqBM5/ZBQOooT8/V/jTRbVOxH00pk8mWXjCogwC2+mdmgSvyXlPm6uyONTVAv+fJxx3oejMOwOFgro9qwyoUrnXKYJnlvShCaM4wnPajHMT2QLLpDam0Xbo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=qSWtEbz+MubGSx0kOmIrCU0+CejCtYpgAPmr1u5z7Mc=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 7E84B7E02C7;
	Fri, 23 Aug 2024 11:45:10 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v2] gpio: rockchip: support ACPI
Date: Fri, 23 Aug 2024 11:43:13 +0800
Message-Id: <20240823034314.62305-11-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823034314.62305-1-ye.zhang@rock-chips.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhpISFZDSx1JSBoYS05IGklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d56923e09cfkunm7e84b7e02c7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6Exw4OTI6TywQCTVRTkwX
	KVEwChNVSlVKTElPSENPTEpJTkxIVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBQ0xPTDcG

Adds support for Advanced Configuration and Power Interface (ACPI) within
the Rockchip GPIO driver.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 160 +++++++++++++++++++++++------------
 1 file changed, 105 insertions(+), 55 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 4f8d50626fcc..9e4a8cd94c66 100644
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
@@ -210,6 +213,7 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
+
 		div = (u64)(GENMASK(23, 0) + 1) * 1000000;
 		if (bank->gpio_type == GPIO_TYPE_V2)
 			max_debounce = DIV_ROUND_CLOSEST_ULL(div, freq);
@@ -515,7 +519,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	struct irq_chip_generic *gc;
 	int ret;
 
-	bank->domain = irq_domain_add_linear(bank->of_node, 32,
+	bank->domain = irq_domain_create_linear(dev_fwnode(bank->dev), 32,
 					&irq_generic_chip_ops, NULL);
 	if (!bank->domain) {
 		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
@@ -637,25 +641,9 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
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
-	id = readl(bank->reg_base + gpio_regs_v2.version_id);
+	int id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
 	switch (id) {
 	case GPIO_TYPE_V2:
@@ -672,8 +660,6 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		bank->gpio_type = GPIO_TYPE_V1;
 		pr_info("Note: Use default GPIO_TYPE_V1!\n");
 	}
-
-	return 0;
 }
 
 static struct rockchip_pin_bank *
@@ -695,61 +681,120 @@ rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
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
 
-	pctldev = of_pinctrl_get(pctlnp);
-	of_node_put(pctlnp);
-	if (!pctldev)
-		return -EPROBE_DEFER;
+	if (!ACPI_COMPANION(dev)) {
+		struct device_node *pctlnp = of_get_parent(dev->of_node);
 
-	id = of_alias_get_id(np, "gpio");
-	if (id < 0)
-		id = gpio++;
+		pctldev = of_pinctrl_get(pctlnp);
+		of_node_put(pctlnp);
+		if (!pctldev)
+			return -EPROBE_DEFER;
 
-	bank = rockchip_gpio_find_bank(pctldev, id);
-	if (!bank)
-		return -EINVAL;
+		bank = rockchip_gpio_find_bank(pctldev, bank_id);
+		if (!bank)
+			return -ENODEV;
+	}
 
+	if (!bank) {
+		bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
+		if (!bank)
+			return -ENOMEM;
+	}
+
+	bank->bank_num = bank_id;
 	bank->dev = dev;
-	bank->of_node = np;
+	bank->of_node = dev->of_node;
+
+	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bank->reg_base))
+		return PTR_ERR(bank->reg_base);
+
+	bank->irq = platform_get_irq(pdev, 0);
+	if (bank->irq < 0)
+		return bank->irq;
 
 	raw_spin_lock_init(&bank->slock);
 
-	bank->clk = devm_clk_get(dev, "bus");
-	if (IS_ERR(bank->clk)) {
-		bank->clk = of_clk_get(dev->of_node, 0);
+	if (!ACPI_COMPANION(dev)) {
+		bank->clk = devm_clk_get(dev, "bus");
 		if (IS_ERR(bank->clk)) {
-			dev_err(dev, "fail to get apb clock\n");
-			return PTR_ERR(bank->clk);
+			bank->clk = of_clk_get(dev->of_node, 0);
+			if (IS_ERR(bank->clk)) {
+				dev_err(dev, "fail to get apb clock\n");
+				return PTR_ERR(bank->clk);
+			}
 		}
-	}
 
-	ret = rockchip_get_bank_data(bank);
-	if (ret)
-		return ret;
-
-	bank->db_clk = devm_clk_get(dev, "db");
-	if (IS_ERR(bank->db_clk)) {
-		bank->db_clk = of_clk_get(dev->of_node, 1);
-		if (IS_ERR(bank->db_clk))
-			bank->db_clk = NULL;
+		bank->db_clk = devm_clk_get(dev, "db");
+		if (IS_ERR(bank->db_clk)) {
+			bank->db_clk = of_clk_get(dev->of_node, 1);
+			if (IS_ERR(bank->db_clk))
+				bank->db_clk = NULL;
+		}
 	}
 
 	clk_prepare_enable(bank->clk);
 	clk_prepare_enable(bank->db_clk);
 
+	rockchip_gpio_get_ver(bank);
+
 	/*
 	 * Prevent clashes with a deferred output setting
 	 * being added right at this moment.
@@ -763,8 +808,13 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
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
@@ -789,7 +839,7 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 	mutex_unlock(&bank->deferred_lock);
 
 	platform_set_drvdata(pdev, bank);
-	dev_info(dev, "probed %pOF\n", np);
+	dev_info(dev, "probed %pfw\n", dev_fwnode(dev));
 
 	return 0;
 err_unlock:
-- 
2.34.1


