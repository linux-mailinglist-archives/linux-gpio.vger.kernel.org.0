Return-Path: <linux-gpio+bounces-10173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB41979B7D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC8A280FC7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 06:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2031F8287D;
	Mon, 16 Sep 2024 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jZlqnKVB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D0613B7A1;
	Mon, 16 Sep 2024 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469362; cv=none; b=GvTJxz7GZtTNwp69KFy7oz4SdIleLaCf20B2plTgfBQWMdCSkkWVwSazMiqybp4+eHULJTw7RY7iC2nMD/PBCFdRl4ixUt1VA1aHiiwZESGzn14D6/9K3sDh8wAU8PX8TQFhfv3QaCVXh1Asay4vKzfk4NgnE0+x4Xzw2hVOJHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469362; c=relaxed/simple;
	bh=CNPLj7xqLXDAoRrH5uAwIA3pxBmybpZWxXRRxQRmY74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oac9t8Cyfsogl7c9fqhmlOzaFHzoLCVXR/xBNHfTg5t8uysgAtfimENJhKfzIkY4f3xCczTLVcl0D04RyGNdcnONzFwOb7Yj/nc1zf8JeacMqbhrfMHBt4K3ylmcv9gEd0VTbmy3aT+KePfDBkUnipLQ73DGWWgcjmZoEZeqYVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jZlqnKVB; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=SEvZ4
	zp44SBdwYbTmPTqsE/k5nDy7NKgWRHDGc1Mznc=; b=jZlqnKVBP2XNuPSydK4SV
	WCxoHY3yxAJs0xRy4GkfFiQ8+0WnpcHRQNDI499pm2dZLmDhwZjMR957Zg5xKNJD
	Uem+D/0BjZLIvEvfKvjcM2gTFfZ/0EhLpZ1SGdvsRFimZ7zVyptqVoM1itNOCTHp
	wVLQR5l4Y2P7F3fdfvAh6E=
Received: from jean.localdomain (unknown [27.18.168.209])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wDHD2du1OdmyQfeBg--.30056S2;
	Mon, 16 Sep 2024 14:47:10 +0800 (CST)
From: Ze Huang <18771902331@163.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ze Huang <18771902331@163.com>,
	Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RESEND PATCH 2/3] pinctrl: canaan: Add support for k230 SoC
Date: Mon, 16 Sep 2024 14:47:04 +0800
Message-ID: <20240916064706.318793-1-18771902331@163.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240916063021.311721-1-18771902331@163.com>
References: <20240916063021.311721-1-18771902331@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHD2du1OdmyQfeBg--.30056S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfCw1kCr43KrW7Xw13CF4Durg_yoW8ur1kZo
	WI9rnrXw1rJr1xWrZ8G395KF13Z3yjkryDC3Z8Z3s8K348Zr15Kr9Fq3yfKFyYqr4rXrW7
	J3s3ZrW7Aaykt3Z8n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRdOzsUUUUU
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNwBcomXAnRlTLAABsW

Configuration of the K230 is similar to that of the K210. However, in K210,
the 256 functions for each pin are shared, whereas in K230, multiplex
functions are different for every pin.

Signed-off-by: Ze Huang <18771902331@163.com>
---
 drivers/pinctrl/Kconfig        |  10 +
 drivers/pinctrl/Makefile       |   1 +
 drivers/pinctrl/pinctrl-k230.c | 674 +++++++++++++++++++++++++++++++++
 3 files changed, 685 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-k230.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 1be05efccc29..ff85dd8757fe 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -246,6 +246,16 @@ config PINCTRL_K210
 	  Add support for the Canaan Kendryte K210 RISC-V SOC Field
 	  Programmable IO Array (FPIOA) controller.
 
+config PINCTRL_K230
+	bool "Pinctrl driver for the Canaan Kendryte K230 SoC"
+	depends on OF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	select REGMAP_MMIO
+	help
+	  Add support for the Canaan Kendryte K230 RISC-V SOC pin controller.
+
 config PINCTRL_KEEMBAY
 	tristate "Pinctrl driver for Intel Keem Bay SoC"
 	depends on ARCH_KEEMBAY || (ARM64 && COMPILE_TEST)
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 2152539b53d5..66e7a04ecfa4 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o
+obj-$(CONFIG_PINCTRL_K230)	+= pinctrl-k230.o
 obj-$(CONFIG_PINCTRL_KEEMBAY)	+= pinctrl-keembay.o
 obj-$(CONFIG_PINCTRL_LANTIQ)	+= pinctrl-lantiq.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
diff --git a/drivers/pinctrl/pinctrl-k230.c b/drivers/pinctrl/pinctrl-k230.c
new file mode 100644
index 000000000000..a935f1f55e66
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-k230.c
@@ -0,0 +1,674 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Copyright (C) 2024 Canaan Bright Sight Co. Ltd
+ * Copyright (C) 2024 Ze Huang <18771902331@163.com>
+ */
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+
+#include "core.h"
+#include "pinconf.h"
+
+#define K230_NPINS 64
+
+#define K230_SHIFT_ST		(0)
+#define K230_SHIFT_DS		(1)
+#define K230_SHIFT_BIAS		(5)
+#define K230_SHIFT_PD		(5)
+#define K230_SHIFT_PU		(6)
+#define K230_SHIFT_OE		(7)
+#define K230_SHIFT_IE		(8)
+#define K230_SHIFT_MSC		(9)
+#define K230_SHIFT_SL		(10)
+#define K230_SHIFT_SEL		(11)
+
+#define K230_PC_ST		BIT(0)
+#define K230_PC_DS		GENMASK(4, 1)
+#define K230_PC_PD		BIT(5)
+#define K230_PC_PU		BIT(6)
+#define K230_PC_BIAS		GENMASK(6, 5)
+#define K230_PC_OE		BIT(7)
+#define K230_PC_IE		BIT(8)
+#define K230_PC_MSC		BIT(9)
+#define K230_PC_SL		BIT(10)
+#define K230_PC_SEL		GENMASK(13, 11)
+
+struct k230_pin_conf {
+	unsigned int		func;
+	unsigned long		*configs;
+	unsigned int		nconfigs;
+};
+
+struct k230_pin_group {
+	const char		*name;
+	unsigned int		*pins;
+	unsigned int		num_pins;
+
+	struct k230_pin_conf	*data;
+};
+
+struct k230_pmx_func {
+	const char		*name;
+	const char		**groups;
+	unsigned int		*group_idx;
+	unsigned int		ngroups;
+};
+
+struct k230_pinctrl {
+	struct pinctrl_desc	pctl;
+	struct pinctrl_dev	*pctl_dev;
+	struct regmap		*regmap_base;
+	void __iomem		*base;
+	struct k230_pin_group	*groups;
+	unsigned int		ngroups;
+	struct k230_pmx_func	*functions;
+	unsigned int		nfunctions;
+};
+
+static struct regmap_config k230_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.max_register	= 0x100,
+	.reg_stride	= 4,
+};
+
+static int k230_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->ngroups;
+}
+
+static const char *k230_get_group_name(struct pinctrl_dev *pctldev,
+				       unsigned int selector)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->groups[selector].name;
+}
+
+static int k230_get_group_pins(struct pinctrl_dev *pctldev,
+			       unsigned int selector,
+			       const unsigned int **pins,
+			       unsigned int *num_pins)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	if (selector >= info->ngroups)
+		return -EINVAL;
+
+	*pins = info->groups[selector].pins;
+	*num_pins = info->groups[selector].num_pins;
+
+	return 0;
+}
+
+static inline const struct k230_pmx_func *k230_name_to_funtion(
+		const struct k230_pinctrl *info, const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < info->nfunctions; i++) {
+		if (!strcmp(info->functions[i].name, name))
+			return &info->functions[i];
+	}
+
+	return NULL;
+}
+
+static int k230_pinctrl_parse_groups(struct device_node *np,
+				     struct k230_pin_group *grp,
+				     struct k230_pinctrl *info,
+				     unsigned int index)
+{
+	struct device *dev = info->pctl_dev->dev;
+	const __be32 *list;
+	int size, i, ret;
+
+	grp->name = np->name;
+
+	list = of_get_property(np, "pinmux", &size);
+	size /= sizeof(*list);
+
+	grp->num_pins = size;
+	grp->pins = devm_kcalloc(dev, grp->num_pins, sizeof(*grp->pins),
+				 GFP_KERNEL);
+	grp->data = devm_kcalloc(dev, grp->num_pins, sizeof(*grp->data),
+				 GFP_KERNEL);
+	if (!grp->pins || !grp->data)
+		return -ENOMEM;
+
+	for (i = 0; i < size; i++) {
+		unsigned int mux_data = be32_to_cpu(*list++);
+
+		grp->pins[i] = (mux_data >> 8);
+		grp->data[i].func = (mux_data & 0xff);
+
+		ret = pinconf_generic_parse_dt_config(np, NULL,
+						      &grp->data[i].configs,
+						      &grp->data[i].nconfigs);
+		if (ret)
+			return ret;
+	}
+	of_node_put(np);
+
+	return 0;
+}
+
+static void k230_pinctrl_child_count(struct k230_pinctrl *info,
+				     struct device_node *np)
+{
+	struct device_node *child;
+
+	for_each_child_of_node(np, child) {
+		info->nfunctions++;
+		info->ngroups += of_get_child_count(child);
+	}
+}
+
+static int k230_pinctrl_parse_functions(struct device_node *np,
+					struct k230_pinctrl *info,
+					unsigned int index)
+{
+	struct device *dev = info->pctl_dev->dev;
+	struct k230_pmx_func *func;
+	struct k230_pin_group *grp;
+	struct device_node *child;
+	static unsigned int idx, i;
+	int ret;
+
+	func = &info->functions[index];
+
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups <= 0)
+		return 0;
+
+	func->groups = devm_kcalloc(dev, func->ngroups,
+				    sizeof(*func->groups), GFP_KERNEL);
+	func->group_idx = devm_kcalloc(dev, func->ngroups,
+				       sizeof(*func->group_idx), GFP_KERNEL);
+	if (!func->groups || !func->group_idx)
+		return -ENOMEM;
+
+	i = 0;
+
+	for_each_child_of_node(np, child) {
+		func->groups[i] = child->name;
+		func->group_idx[i] = idx;
+		grp = &info->groups[idx];
+		idx++;
+		ret = k230_pinctrl_parse_groups(child, grp, info, i++);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int k230_pinctrl_parse_dt(struct platform_device *pdev,
+				 struct k230_pinctrl *info)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child;
+	unsigned int i;
+	int ret;
+
+	k230_pinctrl_child_count(info, np);
+
+	info->functions = devm_kcalloc(dev, info->nfunctions,
+				       sizeof(*info->functions), GFP_KERNEL);
+	info->groups = devm_kcalloc(dev, info->ngroups,
+				    sizeof(*info->groups), GFP_KERNEL);
+	if (!info->functions || !info->groups)
+		return -ENOMEM;
+
+	i = 0;
+
+	for_each_child_of_node(np, child) {
+		ret = k230_pinctrl_parse_functions(child, info, i++);
+		if (ret) {
+			dev_err(dev, "failed to parse function\n");
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static struct pinctrl_pin_desc k230_pins[] = {
+	PINCTRL_PIN(0,  "IO0"),  PINCTRL_PIN(1,  "IO1"),  PINCTRL_PIN(2,  "IO2"),
+	PINCTRL_PIN(3,  "IO3"),  PINCTRL_PIN(4,  "IO4"),  PINCTRL_PIN(5,  "IO5"),
+	PINCTRL_PIN(6,  "IO6"),  PINCTRL_PIN(7,  "IO7"),  PINCTRL_PIN(8,  "IO8"),
+	PINCTRL_PIN(9,  "IO9"),  PINCTRL_PIN(10, "IO10"), PINCTRL_PIN(11, "IO11"),
+	PINCTRL_PIN(12, "IO12"), PINCTRL_PIN(13, "IO13"), PINCTRL_PIN(14, "IO14"),
+	PINCTRL_PIN(15, "IO15"), PINCTRL_PIN(16, "IO16"), PINCTRL_PIN(17, "IO17"),
+	PINCTRL_PIN(18, "IO18"), PINCTRL_PIN(19, "IO19"), PINCTRL_PIN(20, "IO20"),
+	PINCTRL_PIN(21, "IO21"), PINCTRL_PIN(22, "IO22"), PINCTRL_PIN(23, "IO23"),
+	PINCTRL_PIN(24, "IO24"), PINCTRL_PIN(25, "IO25"), PINCTRL_PIN(26, "IO26"),
+	PINCTRL_PIN(27, "IO27"), PINCTRL_PIN(28, "IO28"), PINCTRL_PIN(29, "IO29"),
+	PINCTRL_PIN(30, "IO30"), PINCTRL_PIN(31, "IO31"), PINCTRL_PIN(32, "IO32"),
+	PINCTRL_PIN(33, "IO33"), PINCTRL_PIN(34, "IO34"), PINCTRL_PIN(35, "IO35"),
+	PINCTRL_PIN(36, "IO36"), PINCTRL_PIN(37, "IO37"), PINCTRL_PIN(38, "IO38"),
+	PINCTRL_PIN(39, "IO39"), PINCTRL_PIN(40, "IO40"), PINCTRL_PIN(41, "IO41"),
+	PINCTRL_PIN(42, "IO42"), PINCTRL_PIN(43, "IO43"), PINCTRL_PIN(44, "IO44"),
+	PINCTRL_PIN(45, "IO45"), PINCTRL_PIN(46, "IO46"), PINCTRL_PIN(47, "IO47"),
+	PINCTRL_PIN(48, "IO48"), PINCTRL_PIN(49, "IO49"), PINCTRL_PIN(50, "IO50"),
+	PINCTRL_PIN(51, "IO51"), PINCTRL_PIN(52, "IO52"), PINCTRL_PIN(53, "IO53"),
+	PINCTRL_PIN(54, "IO54"), PINCTRL_PIN(55, "IO55"), PINCTRL_PIN(56, "IO56"),
+	PINCTRL_PIN(57, "IO57"), PINCTRL_PIN(58, "IO58"), PINCTRL_PIN(59, "IO59"),
+	PINCTRL_PIN(60, "IO60"), PINCTRL_PIN(61, "IO61"), PINCTRL_PIN(62, "IO62"),
+	PINCTRL_PIN(63, "IO63")
+};
+
+static void k230_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
+				      struct seq_file *s, unsigned int offset)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	u32 val, mode, bias, drive, input, output, slew, schmitt, power;
+	struct k230_pin_group *grp = k230_pins[offset].drv_data;
+	static const char * const biasing[] = {
+			"pull none", "pull down", "pull up", "" };
+	static const char * const enable[] = {
+			"disable", "enable" };
+	static const char * const power_source[] = {
+			"3V3", "1V8" };
+	int ret;
+
+	ret = regmap_read(info->regmap_base, offset * 4, &val);
+	if (ret) {
+		dev_err(info->pctl_dev->dev,
+			"failed to read offset 0x%x\n", offset * 4);
+		return;
+	}
+
+	mode	= (val & K230_PC_SEL) >> K230_SHIFT_SEL;
+	drive	= (val & K230_PC_DS) >> K230_SHIFT_DS;
+	bias	= (val & K230_PC_BIAS) >> K230_SHIFT_BIAS;
+	input	= (val & K230_PC_IE) >> K230_SHIFT_IE;
+	output	= (val & K230_PC_OE) >> K230_SHIFT_OE;
+	slew	= (val & K230_PC_SL) >> K230_SHIFT_SL;
+	schmitt	= (val & K230_PC_ST) >> K230_SHIFT_ST;
+	power	= (val & K230_PC_MSC) >> K230_SHIFT_MSC;
+
+	seq_printf(s, "%s - strength %d - %s - %s - slewrate %s - schmitt %s - %s",
+		   grp ? grp->name : "unknown",
+		   drive,
+		   biasing[bias],
+		   input ? "input" : "output",
+		   enable[slew],
+		   enable[schmitt],
+		   power_source[power]);
+}
+
+static int k230_dt_node_to_map(struct pinctrl_dev *pctldev,
+			       struct device_node *np_config,
+			       struct pinctrl_map **map,
+			       unsigned int *num_maps)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = info->pctl_dev->dev;
+	const struct k230_pmx_func *func;
+	const struct k230_pin_group *grp;
+	struct pinctrl_map *new_map;
+	int map_num, i, j, idx;
+	unsigned int grp_id;
+
+	func = k230_name_to_funtion(info, np_config->name);
+	if (!func) {
+		dev_err(dev, "function %s not found\n", np_config->name);
+		return -EINVAL;
+	}
+
+	map_num = 0;
+	for (i = 0; i < func->ngroups; ++i) {
+		grp_id = func->group_idx[i];
+		/* npins of config map plus a mux map */
+		map_num += info->groups[grp_id].num_pins + 1;
+	}
+
+	new_map = kcalloc(map_num, sizeof(*new_map), GFP_KERNEL);
+	if (!new_map)
+		return -ENOMEM;
+	*map = new_map;
+	*num_maps = map_num;
+
+	idx = 0;
+	for (i = 0; i < func->ngroups; ++i) {
+		grp_id = func->group_idx[i];
+		grp = &info->groups[grp_id];
+		new_map[idx].type = PIN_MAP_TYPE_MUX_GROUP;
+		new_map[idx].data.mux.group = grp->name;
+		new_map[idx].data.mux.function = np_config->name;
+		idx++;
+
+		for (j = 0; j < grp->num_pins; ++j) {
+			new_map[idx].type = PIN_MAP_TYPE_CONFIGS_PIN;
+			new_map[idx].data.configs.group_or_pin =
+				pin_get_name(pctldev, grp->pins[j]);
+			new_map[idx].data.configs.configs =
+				grp->data[j].configs;
+			new_map[idx].data.configs.num_configs =
+				grp->data[j].nconfigs;
+			idx++;
+		}
+	}
+
+	return 0;
+}
+
+static void k230_dt_free_map(struct pinctrl_dev *pctldev,
+			     struct pinctrl_map *map, unsigned int num_maps)
+{
+	kfree(map);
+}
+
+static const struct pinctrl_ops k230_pctrl_ops = {
+	.get_groups_count	= k230_get_groups_count,
+	.get_group_name		= k230_get_group_name,
+	.get_group_pins		= k230_get_group_pins,
+	.pin_dbg_show		= k230_pinctrl_pin_dbg_show,
+	.dt_node_to_map		= k230_dt_node_to_map,
+	.dt_free_map		= k230_dt_free_map,
+};
+
+static int k230_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			    unsigned long *config)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int val, arg;
+	int ret;
+
+	ret = regmap_read(info->regmap_base, pin * 4, &val);
+	if (ret) {
+		dev_err(info->pctl_dev->dev,
+			"failed to read offset 0x%x\n", pin * 4);
+		return ret;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		arg = (val & K230_PC_ST) ? 1 : 0;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		arg = (val & K230_PC_DS) >> K230_SHIFT_DS;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = (val & K230_PC_BIAS) ? 0 : 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = (val & K230_PC_PD) ? 1 : 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = (val & K230_PC_PU) ? 1 : 0;
+		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		arg = (val & K230_PC_OE) ? 1 : 0;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		arg = (val & K230_PC_IE) ? 1 : 0;
+		break;
+	case PIN_CONFIG_POWER_SOURCE:
+		arg = (val & K230_PC_MSC) ? 1 : 0;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		arg = (val & K230_PC_SL) ? 1 : 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int k230_pinconf_set_param(struct pinctrl_dev *pctldev, unsigned int pin,
+				  enum pin_config_param param, unsigned int arg)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = info->pctl_dev->dev;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(info->regmap_base, pin * 4, &val);
+	if (ret) {
+		dev_err(dev, "failed to read offset 0x%x\n", pin * 4);
+		return ret;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (arg)
+			val |= K230_PC_ST;
+		else
+			val &= ~K230_PC_ST;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		val &= ~K230_PC_DS;
+		val |= (arg << K230_SHIFT_DS) & K230_PC_DS;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		val &= ~K230_PC_BIAS;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (!arg)
+			return -EINVAL;
+		val |= K230_PC_PD;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (!arg)
+			return -EINVAL;
+		val |= K230_PC_PU;
+		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		if (!arg)
+			return -EINVAL;
+		val |= K230_PC_OE;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (!arg)
+			return -EINVAL;
+		val |= K230_PC_IE;
+		break;
+	case PIN_CONFIG_POWER_SOURCE:
+		if (arg)
+			val |= K230_PC_MSC;
+		else
+			val &= ~K230_PC_MSC;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		if (arg)
+			val |= K230_PC_SL;
+		else
+			val &= ~K230_PC_SL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_write(info->regmap_base, pin * 4, val);
+	if (ret) {
+		dev_err(dev, "failed to write offset 0x%x\n", pin * 4);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int k230_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			    unsigned long *configs, unsigned int num_configs)
+{
+	enum pin_config_param param;
+	unsigned int arg, i;
+	int ret;
+
+	if (WARN_ON(pin >= K230_NPINS))
+		return -EINVAL;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+		ret = k230_pinconf_set_param(pctldev, pin, param, arg);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void k230_pconf_dbg_show(struct pinctrl_dev *pctldev,
+				struct seq_file *s, unsigned int pin)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(info->regmap_base, pin * 4, &val);
+	if (ret) {
+		dev_err(info->pctl_dev->dev, "failed to read offset 0x%x\n", pin * 4);
+		return;
+	}
+
+	seq_printf(s, " 0x%08x", val);
+}
+
+static const struct pinconf_ops k230_pinconf_ops = {
+	.is_generic		= true,
+	.pin_config_get		= k230_pinconf_get,
+	.pin_config_set		= k230_pinconf_set,
+	.pin_config_dbg_show	= k230_pconf_dbg_show,
+};
+
+static int k230_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->nfunctions;
+}
+
+static const char *k230_get_fname(struct pinctrl_dev *pctldev,
+				  unsigned int selector)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->functions[selector].name;
+}
+
+static int k230_get_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+			   const char * const **groups, unsigned int *num_groups)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = info->functions[selector].groups;
+	*num_groups = info->functions[selector].ngroups;
+
+	return 0;
+}
+
+static int k230_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
+			unsigned int group)
+{
+	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	const struct k230_pin_conf *data = info->groups[group].data;
+	struct k230_pin_group *grp = &info->groups[group];
+	const unsigned int *pins = grp->pins;
+	struct regmap *regmap;
+	unsigned int value, mask;
+	int cnt, reg;
+
+	regmap = info->regmap_base;
+
+	for (cnt = 0; cnt < grp->num_pins; cnt++) {
+		reg = pins[cnt] * 4;
+		value = data[cnt].func << K230_SHIFT_SEL;
+		mask = K230_PC_SEL;
+		regmap_update_bits(regmap, reg, mask, value);
+		k230_pins[pins[cnt]].drv_data = grp;
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops k230_pmxops = {
+	.get_functions_count	= k230_get_functions_count,
+	.get_function_name	= k230_get_fname,
+	.get_function_groups	= k230_get_groups,
+	.set_mux		= k230_set_mux,
+	.strict			= true,
+};
+
+static int k230_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct k230_pinctrl *info;
+	struct pinctrl_desc *pctl;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	pctl = &info->pctl;
+
+	pctl->name	= "k230-pinctrl";
+	pctl->owner	= THIS_MODULE;
+	pctl->pins	= k230_pins;
+	pctl->npins	= ARRAY_SIZE(k230_pins);
+	pctl->pctlops	= &k230_pctrl_ops;
+	pctl->pmxops	= &k230_pmxops;
+	pctl->confops	= &k230_pinconf_ops;
+
+	info->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(info->base))
+		return PTR_ERR(info->base);
+
+	k230_regmap_config.name = "canaan,pinctrl";
+	info->regmap_base = devm_regmap_init_mmio(dev, info->base,
+						  &k230_regmap_config);
+	if (IS_ERR(info->regmap_base))
+		return dev_err_probe(dev, PTR_ERR(info->regmap_base),
+				     "failed to init regmap\n");
+
+	info->pctl_dev = devm_pinctrl_register(dev, pctl, info);
+	if (IS_ERR(info->pctl_dev))
+		return dev_err_probe(dev, PTR_ERR(info->pctl_dev),
+				     "devm_pinctrl_register failed\n");
+
+	k230_pinctrl_parse_dt(pdev, info);
+
+	return 0;
+}
+
+static const struct of_device_id k230_dt_ids[] = {
+	{ .compatible = "canaan,k230-pinctrl", },
+	{ /* sintenel */ }
+};
+MODULE_DEVICE_TABLE(of, k230_dt_ids);
+
+static struct platform_driver k230_pinctrl_driver = {
+	.probe = k230_pinctrl_probe,
+	.driver = {
+		.name = "k230-pinctrl",
+		.of_match_table = k230_dt_ids,
+	},
+};
+module_platform_driver(k230_pinctrl_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ze Huang <18771902331@163.com>");
+MODULE_DESCRIPTION("Canaan K230 pinctrl driver");
-- 
2.46.1


