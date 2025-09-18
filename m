Return-Path: <linux-gpio+bounces-24207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2410AB21257
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 18:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37C53A4805
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE1E296BD3;
	Mon, 11 Aug 2025 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="I6lIUzBh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF1296BB4;
	Mon, 11 Aug 2025 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930375; cv=none; b=d0mxCNjIVP/oEk40Geb7uSWZH1DF3OKrT/CImXjPGXOHJiyd6PZvVpUnfsky/PajMrfPh9ljsB1ppFA42ZC4xgEwMw+u8jEgj9fjBJ9RJjOSYOzRj0f3k0FfguvHPL2wDaCoLmXq8dw2qelb5RqMbVtjxEq/0UPwksFdLjFeCR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930375; c=relaxed/simple;
	bh=/sfDYsWaumJRNuxfDI3BONzrIgPEYzY2Gf7xU4ueNYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahODErJBq0mywrLp+JAq2lRAkHI+Hzm84HnRzjXwxIZf4iBGmaPNmvQZMYjkJIUWZQmroaY6B9etmfysEuyXO0On4RH3y34pMoYoYIf18RmIr+mBpIdoyJEyFxCqbGU56fIN4x9TvZ5o6dX9NQWEizlJulmDCFtUda8//MhFSBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=I6lIUzBh; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AEE5F25CA7;
	Mon, 11 Aug 2025 18:39:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNxH-Bdj19kI; Mon, 11 Aug 2025 18:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754930308; bh=/sfDYsWaumJRNuxfDI3BONzrIgPEYzY2Gf7xU4ueNYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I6lIUzBhNSCr0bLspDIv54+UblG0579dbXgGlfIJKM/PzaMaeEDtKAyu016TxNDyi
	 xqAQO3YKfkYDhn2G5vratdnK/Ca3+VdV9rPhD0gTS9pkxuLyaKctJB9pJOHc8CS8M9
	 GGkTsnnLIYh69bbz8YBpwiq69guybfBEbUhPizAV1qPMC2eo84HOhOMGBX67hTZBts
	 lN3JeEOMt6yiJkvDgziFJ54pDYdY1lqhS+Borklvj0mbV6IRZWn3M/aAwYBH4A08uC
	 6Z00qEeRkYFL0vxA7U7IgIO5zmVhhmQnvb4qHoKeGzRr5tqVj7G6AVYlqgdGWGYmEO
	 rNdw9mfEzdPNg==
From: Yao Zi <ziyao@disroot.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 2/3] pinctrl: ls2k0300: Support Loongson 2K0300 SoC
Date: Mon, 11 Aug 2025 16:37:49 +0000
Message-ID: <20250811163749.47028-4-ziyao@disroot.org>
In-Reply-To: <20250811163749.47028-2-ziyao@disroot.org>
References: <20250811163749.47028-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support pin multiplexing and drive-strength setting for Loongson 2K0300
SoC. Pin multiplexing could be done separately for each pin, while
drive-strength could be only configured on function basis. This differs
a lot from the driver for previous generation of Loongson SoC, where
pinmux setting is based on group.

Pins are represented with pinmux properties in devicetrees, and we use
the generic pinmux API for parsing. The common pinconf interface isn't
used for drive-strength setting, since it handles pinconf settings at a
unit of pin groups or smaller.

Instead, the driver configures drive-strength settings just after
parsing the devicetree. The devicetree's structure ensures no conflicts
could happen in drive-strength settings.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 MAINTAINERS                        |   1 +
 drivers/pinctrl/Kconfig            |  14 +
 drivers/pinctrl/Makefile           |   1 +
 drivers/pinctrl/pinctrl-ls2k0300.c | 515 +++++++++++++++++++++++++++++
 4 files changed, 531 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-ls2k0300.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dd50571b4072..e22d6a280f6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14419,6 +14419,7 @@ M:	Yao Zi <ziyao@disroot.org>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
+F:	drivers/pinctrl/pinctrl-ls2k0300.c
 
 LOONGSON EDAC DRIVER
 M:	Zhao Qunqin <zhaoqunqin@loongson.cn>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ddd11668457c..c45abf89211c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -344,6 +344,20 @@ config PINCTRL_LOONGSON2
 	 pull-down functions are not supported. Say yes to enable
 	 pinctrl for Loongson-2 SoC.
 
+config PINCTRL_LS2K0300
+	bool "Pinctrl driver for Loongson-2K0300 SoC"
+	depends on OF
+	depends on LOONGARCH || COMPILE_TEST
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	help
+	  This selects pin controller driver for the Loongson-2K0300 SoC.
+	  It supports pin function multiplexing and drive-strength
+	  configuration.
+
+	  If compiled as a module, the module name will be pinctrl-ls2k0300.
+
 config PINCTRL_XWAY
 	bool
 	depends on SOC_TYPE_XWAY
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 909ab89a56d2..8c65357dad40 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_PINCTRL_KEEMBAY)	+= pinctrl-keembay.o
 obj-$(CONFIG_PINCTRL_LANTIQ)	+= pinctrl-lantiq.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
 obj-$(CONFIG_PINCTRL_LOONGSON2) += pinctrl-loongson2.o
+obj-$(CONFIG_PINCTRL_LS2K0300)	+= pinctrl-ls2k0300.o
 obj-$(CONFIG_PINCTRL_XWAY)	+= pinctrl-xway.o
 obj-$(CONFIG_PINCTRL_LPC18XX)	+= pinctrl-lpc18xx.o
 obj-$(CONFIG_PINCTRL_MAX77620)	+= pinctrl-max77620.o
diff --git a/drivers/pinctrl/pinctrl-ls2k0300.c b/drivers/pinctrl/pinctrl-ls2k0300.c
new file mode 100644
index 000000000000..11d448ba333d
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-ls2k0300.c
@@ -0,0 +1,515 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl driver for Loongson-2K0300 SoC
+ * Copyright (c) 2025 Yao Zi <ziyao@disroot.org>
+ */
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include "core.h"
+#include "pinconf.h"
+#include "pinctrl-utils.h"
+
+#define LS2K0300_MUX_MASK		GENMASK(1, 0)
+#define LS2K0300_PIN_TO_OFFSET(pin)	((pin) / 16 * 4)
+#define LS2K0300_PIN_TO_SHIFT(pin)	((pin) % 16 * 2)
+
+#define LS2K0300_DRIVE_STRENGTH_MIN	2
+#define LS2K0300_DRIVE_STRENGTH_MAX	12
+
+#define LS2K0300_DRIVE_STRENGTH_DEFAULT	0xff
+
+static struct pinctrl_pin_desc ls2k0300_pins[] = {
+	PINCTRL_PIN(0, "LCD_CLK"),
+	PINCTRL_PIN(1, "LCD_VSYNC"),
+	PINCTRL_PIN(2, "LCD_HSYNC"),
+	PINCTRL_PIN(3, "LCD_EN"),
+	PINCTRL_PIN(4, "LCD_D0"),
+	PINCTRL_PIN(5, "LCD_D1"),
+	PINCTRL_PIN(6, "LCD_D2"),
+	PINCTRL_PIN(7, "LCD_D3"),
+	PINCTRL_PIN(8, "LCD_D4"),
+	PINCTRL_PIN(9, "LCD_D5"),
+	PINCTRL_PIN(10, "LCD_D6"),
+	PINCTRL_PIN(11, "LCD_D7"),
+	PINCTRL_PIN(12, "LCD_D8"),
+	PINCTRL_PIN(13, "LCD_D9"),
+	PINCTRL_PIN(14, "LCD_D10"),
+	PINCTRL_PIN(15, "LCD_D11"),
+	PINCTRL_PIN(16, "LCD_D12"),
+	PINCTRL_PIN(17, "LCD_D13"),
+	PINCTRL_PIN(18, "LCD_D14"),
+	PINCTRL_PIN(19, "LCD_D15"),
+	PINCTRL_PIN(20, "LCD_D16"),
+	PINCTRL_PIN(21, "LCD_D17"),
+	PINCTRL_PIN(22, "LCD_D19"),
+	PINCTRL_PIN(23, "LCD_D19"),
+	PINCTRL_PIN(24, "LCD_D20"),
+	PINCTRL_PIN(25, "LCD_D21"),
+	PINCTRL_PIN(26, "LCD_D22"),
+	PINCTRL_PIN(27, "LCD_D23"),
+	PINCTRL_PIN(28, "GMAC0_RX_CTL"),
+	PINCTRL_PIN(29, "GMAC0_RX0"),
+	PINCTRL_PIN(30, "GMAC0_RX1"),
+	PINCTRL_PIN(31, "GMAC0_RX2"),
+	PINCTRL_PIN(32, "GMAC0_RX3"),
+	PINCTRL_PIN(33, "GMAC0_TX_CTL"),
+	PINCTRL_PIN(34, "GMAC0_TX0"),
+	PINCTRL_PIN(35, "GMAC0_TX1"),
+	PINCTRL_PIN(36, "GMAC0_TX2"),
+	PINCTRL_PIN(37, "GMAC0_TX3"),
+	PINCTRL_PIN(38, "GMAC0_MDCK"),
+	PINCTRL_PIN(39, "GMAC0_MDIO"),
+	PINCTRL_PIN(40, "UART0_RX"),
+	PINCTRL_PIN(41, "UART0_TX"),
+	PINCTRL_PIN(42, "UART1_RX"),
+	PINCTRL_PIN(43, "UART1_TX"),
+	PINCTRL_PIN(44, "UART2_TX"),
+	PINCTRL_PIN(45, "UART2_RX"),
+	PINCTRL_PIN(46, "UART3_TX"),
+	PINCTRL_PIN(47, "UART3_RX"),
+	PINCTRL_PIN(48, "I2C0_SCL"),
+	PINCTRL_PIN(49, "I2C0_SDA"),
+	PINCTRL_PIN(50, "I2C1_SCL"),
+	PINCTRL_PIN(51, "I2C1_SDA"),
+	PINCTRL_PIN(52, "I2C2_SCL"),
+	PINCTRL_PIN(53, "I2C2_SDA"),
+	PINCTRL_PIN(54, "I2C3_SCL"),
+	PINCTRL_PIN(55, "I2C3_SDA"),
+	PINCTRL_PIN(56, "SPI0_CLK"),
+	PINCTRL_PIN(57, "SPI0_MISO"),
+	PINCTRL_PIN(58, "SPI0_MOSI"),
+	PINCTRL_PIN(59, "SPI0_CS"),
+	PINCTRL_PIN(60, "SPI1_CLK"),
+	PINCTRL_PIN(61, "SPI1_MISO"),
+	PINCTRL_PIN(62, "SPI1_MOSI"),
+	PINCTRL_PIN(63, "SPI1_CS"),
+	PINCTRL_PIN(64, "SPI2_CLK"),
+	PINCTRL_PIN(65, "SPI2_MISO"),
+	PINCTRL_PIN(66, "SPI2_MOSI"),
+	PINCTRL_PIN(67, "SPI2_CS"),
+	PINCTRL_PIN(68, "CAN0_RX"),
+	PINCTRL_PIN(69, "CAN0_TX"),
+	PINCTRL_PIN(70, "CAN1_RX"),
+	PINCTRL_PIN(71, "CAN1_TX"),
+	PINCTRL_PIN(72, "CAN2_RX"),
+	PINCTRL_PIN(73, "CAN2_TX"),
+	PINCTRL_PIN(74, "CAN3_RX"),
+	PINCTRL_PIN(75, "CAN3_TX"),
+	PINCTRL_PIN(76, "I2S_MCLK"),
+	PINCTRL_PIN(77, "I2S_BCLK"),
+	PINCTRL_PIN(78, "I2S_LR"),
+	PINCTRL_PIN(79, "I2S_DI"),
+	PINCTRL_PIN(80, "I2S_DO"),
+	PINCTRL_PIN(81, "TIM1_CH1"),
+	PINCTRL_PIN(82, "TIM1_CH2"),
+	PINCTRL_PIN(83, "TIM1_CH3"),
+	PINCTRL_PIN(84, "TIM1_CH1N"),
+	PINCTRL_PIN(85, "TIM1_CH2N"),
+	PINCTRL_PIN(86, "TIM1_CH3N"),
+	PINCTRL_PIN(87, "TIM2_CH1"),
+	PINCTRL_PIN(88, "TIM2_CH2"),
+	PINCTRL_PIN(89, "TIM2_CH3"),
+	PINCTRL_PIN(90, "SDIO0_CLK"),
+	PINCTRL_PIN(91, "SDIO0_CMD"),
+	PINCTRL_PIN(92, "SDIO0_D0"),
+	PINCTRL_PIN(93, "SDIO0_D1"),
+	PINCTRL_PIN(94, "SDIO0_D2"),
+	PINCTRL_PIN(95, "SDIO0_D3"),
+	PINCTRL_PIN(96, "SDIO0_D4"),
+	PINCTRL_PIN(97, "SDIO0_D5"),
+	PINCTRL_PIN(98, "SDIO0_D6"),
+	PINCTRL_PIN(99, "SDIO0_D7"),
+	PINCTRL_PIN(100, "SDIO1_CLK"),
+	PINCTRL_PIN(101, "SDIO1_CMD"),
+	PINCTRL_PIN(102, "SDIO1_D0"),
+	PINCTRL_PIN(103, "SDIO1_D1"),
+	PINCTRL_PIN(104, "SDIO1_D2"),
+	PINCTRL_PIN(105, "SDIO1_D3"),
+};
+
+struct ls2k0300_pinctrl_drive_conf {
+	const char *func;
+	unsigned int width;
+	unsigned int shift;
+};
+
+static struct ls2k0300_pinctrl_drive_conf ls2k0300_pinctrl_drive_confs[] = {
+	{ .func = "func-jtag",	.width = 2, .shift = 8 },
+	{ .func = "func-dvo",	.width = 2, .shift = 10 },
+	{ .func = "func-uart",	.width = 2, .shift = 12 },
+	{ .func = "func-gmac",	.width = 2, .shift = 14 },
+	{ .func = "func-sdio",	.width = 2, .shift = 16 },
+	{ .func = "func-spi",	.width = 2, .shift = 18 },
+	{ .func = "func-i2s",	.width = 2, .shift = 20 },
+	{ .func = "func-timer",	.width = 2, .shift = 22 },
+	{ .func = "func-usb",	.width = 2, .shift = 24 },
+	{ .func = "func-emmc",	.width = 3, .shift = 26 },
+};
+
+struct ls2k0300_pinctrl_group {
+	const char *name;
+	unsigned int *pins;
+	unsigned int npins;
+	unsigned int *muxes;
+};
+
+struct ls2k0300_pinctrl_func {
+	const char *name;
+	const char **group_names;
+	unsigned int *groups;
+	unsigned int ngroups;
+};
+
+struct ls2k0300_pinctrl {
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_desc pdesc;
+	struct device *dev;
+
+	struct ls2k0300_pinctrl_group *groups;
+	unsigned int ngroups;
+
+	struct ls2k0300_pinctrl_func *funcs;
+	unsigned int nfuncs;
+
+	u8 drive_confs[ARRAY_SIZE(ls2k0300_pinctrl_drive_confs)];
+
+	spinlock_t lock;
+
+	void __iomem *reg_mux;
+	void __iomem *reg_drive;
+};
+
+static int ls2k0300_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct ls2k0300_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->ngroups;
+}
+
+static const char *ls2k0300_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						   unsigned int selector)
+{
+	struct ls2k0300_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->groups[selector].name;
+}
+
+static int ls2k0300_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					   unsigned int selector,
+					   const unsigned int **pins,
+					   unsigned int *num_pins)
+{
+	struct ls2k0300_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct ls2k0300_pinctrl_group *group = &pctrl->groups[selector];
+
+	*pins		= group->pins;
+	*num_pins	= group->npins;
+
+	return 0;
+}
+
+static const struct pinctrl_ops ls2k0300_pctrl_ops = {
+	.get_groups_count	= ls2k0300_pinctrl_get_groups_count,
+	.get_group_name		= ls2k0300_pinctrl_get_group_name,
+	.get_group_pins		= ls2k0300_pinctrl_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pinmux,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+static int ls2k0300_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct ls2k0300_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->nfuncs;
+}
+
+static const char *
+ls2k0300_pinmux_get_function_name(struct pinctrl_dev *pctldev,
+				  unsigned int selector)
+{
+	struct ls2k0300_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->funcs[selector].name;
+}
+
+static int ls2k0300_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
+					       unsigned int selector,
+					       const char *const **groups,
+					       unsigned int *num_groups)
+{
+	struct ls2k0300_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct ls2k0300_pinctrl_func *func = &pctrl->funcs[selector];
+
+	*groups		= func->group_names;
+	*num_groups	= func->ngroups;
+
+	return 0;
+}
+
+static int ls2k0300_pinmux_set_mux(struct pinctrl_dev *pctrldev,
+				   unsigned int func_selector,
+				   unsigned int group_selector)
+{
+	struct ls2k0300_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrldev);
+	struct ls2k0300_pinctrl_group *group = &pctrl->groups[group_selector];
+	unsigned int *muxes = group->muxes, *pins = group->pins;
+	unsigned int off, shift, i;
+	u32 reg;
+
+	guard(spinlock_irqsave)(&pctrl->lock);
+
+	for (i = 0; i < group->npins; i++) {
+		off	= LS2K0300_PIN_TO_OFFSET(pins[i]);
+		shift	= LS2K0300_PIN_TO_SHIFT(pins[i]);
+
+		reg = readl(pctrl->reg_mux + off);
+		reg &= ~(LS2K0300_MUX_MASK << shift);
+		reg |= muxes[i] << shift;
+		writel(reg, pctrl->reg_mux + off);
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops ls2k0300_pmux_ops = {
+	.get_functions_count	= ls2k0300_pinmux_get_functions_count,
+	.get_function_name	= ls2k0300_pinmux_get_function_name,
+	.get_function_groups	= ls2k0300_pinmux_get_function_groups,
+	.set_mux		= ls2k0300_pinmux_set_mux,
+};
+
+static int ls2k0300_pinctrl_parse_group(struct device *dev,
+					struct ls2k0300_pinctrl *pctrl,
+					struct device_node *np,
+					struct ls2k0300_pinctrl_group *group)
+{
+	group->name = np->name;
+
+	return pinconf_generic_parse_dt_pinmux(np, dev, &group->pins,
+					       &group->muxes,
+					       &group->npins);
+}
+
+static int ls2k0300_pinctrl_parse_function(struct device *dev,
+					   struct ls2k0300_pinctrl *pctrl,
+					   struct device_node *np,
+					   struct ls2k0300_pinctrl_func *func)
+{
+	struct ls2k0300_pinctrl_group *group;
+	unsigned int i;
+	int ret;
+
+	func->ngroups = of_get_child_count(np);
+
+	func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups),
+				    GFP_KERNEL);
+	func->group_names = devm_kcalloc(dev, func->ngroups,
+					 sizeof(*func->group_names),
+					 GFP_KERNEL);
+	if (!func->groups || !func->group_names)
+		return -ENOMEM;
+
+	func->name = np->name;
+
+	i = 0;
+
+	for_each_child_of_node_scoped(np, child) {
+		group = &pctrl->groups[pctrl->ngroups];
+
+		ret = ls2k0300_pinctrl_parse_group(dev, pctrl, child, group);
+		if (ret)
+			return ret;
+
+		func->groups[i]		= pctrl->ngroups;
+		func->group_names[i]	= group->name;
+
+		i++;
+		pctrl->ngroups++;
+	}
+
+	return 0;
+}
+
+static int drive_strength_ma_to_val(struct ls2k0300_pinctrl_drive_conf *conf,
+				    u32 drive_strength_ma, u8 *val)
+{
+	u8 val_max;
+
+	if (drive_strength_ma < LS2K0300_DRIVE_STRENGTH_MIN ||
+	    drive_strength_ma > LS2K0300_DRIVE_STRENGTH_MAX)
+		return -EINVAL;
+
+	val_max = (1 << conf->width) - 1;
+	*val = (drive_strength_ma - LS2K0300_DRIVE_STRENGTH_MIN) * val_max;
+	*val = DIV_ROUND_UP(*val, LS2K0300_DRIVE_STRENGTH_MAX -
+				  LS2K0300_DRIVE_STRENGTH_MIN + 1);
+
+	return 0;
+}
+
+static int ls2k0300_pinctrl_parse_drive(struct device *dev,
+					struct ls2k0300_pinctrl *pctrl,
+					struct device_node *np)
+{
+	struct ls2k0300_pinctrl_drive_conf *conf;
+	struct device_node *func_np;
+	u32 drive_strength_ma;
+	int ret, i;
+
+	memset(pctrl->drive_confs, LS2K0300_DRIVE_STRENGTH_DEFAULT,
+	       ARRAY_SIZE(pctrl->drive_confs));
+
+	for (i = 0; i < ARRAY_SIZE(ls2k0300_pinctrl_drive_confs); i++) {
+		conf = &ls2k0300_pinctrl_drive_confs[i];
+
+		func_np = of_get_child_by_name(np, conf->func);
+		if (!func_np)
+			continue;
+
+		ret = of_property_read_u32(func_np, "drive-strength",
+					   &drive_strength_ma);
+		of_node_put(func_np);
+		if (ret == -EINVAL)
+			continue;
+		else if (ret)
+			return ret;
+
+		ret = drive_strength_ma_to_val(conf, drive_strength_ma,
+					       &pctrl->drive_confs[i]);
+		if (ret) {
+			dev_err(dev, "invalid drive-strength %d for \"%s\"\n",
+				drive_strength_ma, conf->func);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ls2k0300_pinctrl_parse_dt(struct device *dev,
+				     struct ls2k0300_pinctrl *pctrl)
+{
+	struct device_node *np = dev->of_node;
+	struct ls2k0300_pinctrl_func *func;
+	unsigned int ngroups, nfuncs;
+	int ret;
+
+	for_each_child_of_node_scoped(np, child) {
+		nfuncs++;
+		ngroups += of_get_child_count(child);
+	}
+
+	pctrl->groups = devm_kcalloc(dev, ngroups, sizeof(*pctrl->groups),
+				     GFP_KERNEL);
+	pctrl->funcs = devm_kcalloc(dev, nfuncs, sizeof(*pctrl->funcs),
+				    GFP_KERNEL);
+	if (!pctrl->groups || !pctrl->funcs)
+		return -ENOMEM;
+
+	for_each_child_of_node_scoped(np, child) {
+		func = &pctrl->funcs[pctrl->nfuncs++];
+
+		ret = ls2k0300_pinctrl_parse_function(dev, pctrl, child, func);
+		if (ret)
+			return ret;
+	}
+
+	return ls2k0300_pinctrl_parse_drive(dev, pctrl, np);
+}
+
+static void ls2k0300_pinctrl_set_drive_strength(struct ls2k0300_pinctrl *pctrl)
+{
+	struct ls2k0300_pinctrl_drive_conf *conf;
+	u32 reg;
+	int i;
+
+	reg = readl(pctrl->reg_drive);
+
+	for (i = 0; i < ARRAY_SIZE(ls2k0300_pinctrl_drive_confs); i++) {
+		if (pctrl->drive_confs[i] == LS2K0300_DRIVE_STRENGTH_DEFAULT)
+			continue;
+
+		conf = &ls2k0300_pinctrl_drive_confs[i];
+		reg &= ~GENMASK(conf->shift + conf->width - 1, conf->shift);
+		reg |= pctrl->drive_confs[i] << conf->shift;
+	}
+
+	writel(reg, pctrl->reg_drive);
+}
+
+static int ls2k0300_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ls2k0300_pinctrl *pctrl;
+	int ret;
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->reg_mux = devm_platform_ioremap_resource_byname(pdev, "mux");
+	if (IS_ERR(pctrl->reg_mux))
+		return dev_err_probe(dev, PTR_ERR(pctrl->reg_mux),
+				     "failed to map mux registers\n");
+
+	pctrl->reg_drive = devm_platform_ioremap_resource_byname(pdev, "drive");
+	if (IS_ERR(pctrl->reg_drive))
+		return dev_err_probe(dev, PTR_ERR(pctrl->reg_drive),
+				     "failed to map drive registers\n");
+
+	ret = ls2k0300_pinctrl_parse_dt(dev, pctrl);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse devicetree\n");
+
+	ls2k0300_pinctrl_set_drive_strength(pctrl);
+
+	spin_lock_init(&pctrl->lock);
+
+	pctrl->dev		= dev;
+	pctrl->pdesc.name	= "pinctrl-ls2k0300";
+	pctrl->pdesc.owner	= THIS_MODULE;
+	pctrl->pdesc.pins	= ls2k0300_pins;
+	pctrl->pdesc.npins	= ARRAY_SIZE(ls2k0300_pins);
+	pctrl->pdesc.pctlops	= &ls2k0300_pctrl_ops;
+	pctrl->pdesc.pmxops	= &ls2k0300_pmux_ops;
+	pctrl->pdesc.owner	= THIS_MODULE;
+
+	pctrl->pctldev = devm_pinctrl_register(dev, &pctrl->pdesc, pctrl);
+	if (IS_ERR(pctrl->pctldev))
+		return dev_err_probe(pctrl->dev, PTR_ERR(pctrl->pctldev),
+				     "failed to register pinctrl device");
+
+	return 0;
+}
+
+static const struct of_device_id ls2k0300_pinctrl_of_match[] = {
+	{ .compatible = "loongson,ls2k0300-pinctrl" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ls2k0300_pinctrl_of_match);
+
+static struct platform_driver ls2k0300_pinctrl_driver = {
+	.probe	= ls2k0300_pinctrl_probe,
+	.driver	= {
+		.name			= "ls2k0300-pinctrl",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= ls2k0300_pinctrl_of_match,
+	},
+};
+
+builtin_platform_driver(ls2k0300_pinctrl_driver);
+
+MODULE_AUTHOR("Yao Zi <ziyao@disroot.org>");
+MODULE_DESCRIPTION("Pinctrl driver for Loongson-2K0300 SoC");
+MODULE_LICENSE("GPL");
-- 
2.50.1


