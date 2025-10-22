Return-Path: <linux-gpio+bounces-27434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B08ABFB555
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 12:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D128E1884436
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 10:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B98322C7B;
	Wed, 22 Oct 2025 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSenboSk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A1322A24;
	Wed, 22 Oct 2025 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127835; cv=none; b=SOZvt/gLK7XY/S/o+nU5STkNDNOpjPAOG2z8Nl1B72FnN9KsuTsvfJefpWfc7mYg8FLC+c9HiBaCDq1KLivR6nSynOueG0zlT6Kn1WuoEbyqO2K8cOPvj+Qe20YI6aEm+iWRd3bojuOEhu4q2/j3khh8Co3A1n7ZGKyV+rJu7A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127835; c=relaxed/simple;
	bh=USKbnz/WWtmRAu/WsgpdJwkstKtmlsjlsNtL8jTy6Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+0+MXidQU1dXQmkMv9epbUtda33+XwTU40tW29+ITdxVwcMZfBzrxCQDg4tz4qq7i3e9/tiPmByt316IVRCRjJYOPMabj2+nm+DWWEIqFNQy4Z8UIbUcScTF3MBisKFSexwPPXuRxP3/N40I8JUKCcbnb0BHMjc4EXOznnLiOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSenboSk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3361DC113D0;
	Wed, 22 Oct 2025 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761127835;
	bh=USKbnz/WWtmRAu/WsgpdJwkstKtmlsjlsNtL8jTy6Fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSenboSkPXVVBsgZDX0czzmHIXPLI7vF7jgY40p9RdOI9ACB7TKJpqMH7b+tdzLYy
	 DfNJ6asT8p8bEnxU6lzRMpi3Y6DujiwBDbT0ziCfawnw9X4q4JAkJTY7bABuY+TEVU
	 uWgvYQBtfxfTfhB9RI3i+dn+kNvSuaaCaOayrD4qn41iLdz8DDgROpnYEInFzBsWsC
	 9jkODbxvshmSxyh73638WB6M36afz24JY+6yEp8srfINGdyU5cM0+Zzr4wxsaV5lZy
	 u/uhCIbvN1HQoOeWq4SSF0vFm6/hZuWthkf1Io6p8MHHOSf4/B+2X0a7H32EN6AGV3
	 aJKnNyZJW5RHA==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v3 4/5] pinctrl: add polarfire soc iomux0 pinmux driver
Date: Wed, 22 Oct 2025 11:09:12 +0100
Message-ID: <20251022-cryptic-recede-0968b187fc44@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022-dash-refinance-ac3387657ae4@spud>
References: <20251022-dash-refinance-ac3387657ae4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11389; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FspkpCwBeD2MbueZeRJsfAuxKRuAcH0xEJ18CVdNA/o=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBk/1kaHLzauXP518QqBx/PShPKlVIQerbhk6PWZNzKuz m9+FaNQRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZiMIOR4e3ZT8u0b9TaHdln f+3EojMzBTgu37IVa+Gy4WdwmJnUsJKRoadiW2vBo/kt6T53l9gd3XN3exnfCefXMm42Gdk7MiR CWQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Polarfire SoC, iomux0 is responsible for routing functions to either
Multiprocessor Subsystem (MSS) IOs or to the FPGA fabric, where they
can either interface with custom RTL or be routed to the FPGA fabric's
IOs. Add a driver for it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/Kconfig               |   8 +
 drivers/pinctrl/Makefile              |   1 +
 drivers/pinctrl/pinctrl-mpfs-iomux0.c | 278 ++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-iomux0.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index e83fda9bf308..4ec2bb7f67cf 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -505,6 +505,14 @@ config PINCTRL_PISTACHIO
 	help
 	  This support pinctrl and GPIO driver for IMG Pistachio SoC.
 
+config PINCTRL_POLARFIRE_SOC
+	bool "Polarfire SoC pinctrl driver"
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	select GENERIC_PINCONF
+	default y
+	help
+	  This selects the pinctrl driver for Microchip Polarfire SoC.
+
 config PINCTRL_RK805
 	tristate "Pinctrl and GPIO driver for RK805 PMIC"
 	depends on MFD_RK8XX
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f33976a6c91b..ea4e890766e1 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_PINCTRL_PEF2256)	+= pinctrl-pef2256.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PIC64GX)	+= pinctrl-pic64gx-gpio2.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
+obj-$(CONFIG_PINCTRL_POLARFIRE_SOC)	+= pinctrl-mpfs-iomux0.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_RP1)       += pinctrl-rp1.o
diff --git a/drivers/pinctrl/pinctrl-mpfs-iomux0.c b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
new file mode 100644
index 000000000000..49d9fcec0a16
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "core.h"
+#include "pinctrl-utils.h"
+#include "pinconf.h"
+#include "pinmux.h"
+
+#define MPFS_IOMUX0_REG 0x200
+
+struct mpfs_iomux0_pinctrl {
+	struct pinctrl_dev *pctrl;
+	struct device *dev;
+	struct regmap *regmap;
+	struct pinctrl_desc desc;
+};
+
+struct mpfs_iomux0_pin_group {
+	const char *name;
+	const unsigned int *pins;
+	u32 mask;
+	u32 setting;
+};
+
+struct mpfs_iomux0_function {
+	const char *name;
+	const char * const *groups;
+};
+
+static const struct pinctrl_pin_desc mpfs_iomux0_pins[] = {
+	PINCTRL_PIN(0, "spi0"),
+	PINCTRL_PIN(1, "spi1"),
+	PINCTRL_PIN(2, "i2c0"),
+	PINCTRL_PIN(3, "i2c1"),
+	PINCTRL_PIN(4, "can0"),
+	PINCTRL_PIN(5, "can1"),
+	PINCTRL_PIN(6, "qspi"),
+	PINCTRL_PIN(7, "uart0"),
+	PINCTRL_PIN(8, "uart1"),
+	PINCTRL_PIN(9, "uart2"),
+	PINCTRL_PIN(10, "uart3"),
+	PINCTRL_PIN(11, "uart4"),
+	PINCTRL_PIN(12, "mdio0"),
+	PINCTRL_PIN(13, "mdio1"),
+};
+
+static const unsigned int mpfs_iomux0_spi0_pins[] = { 0 };
+static const unsigned int mpfs_iomux0_spi1_pins[] = { 1 };
+static const unsigned int mpfs_iomux0_i2c0_pins[] = { 2 };
+static const unsigned int mpfs_iomux0_i2c1_pins[] = { 3 };
+static const unsigned int mpfs_iomux0_can0_pins[] = { 4 };
+static const unsigned int mpfs_iomux0_can1_pins[] = { 5 };
+static const unsigned int mpfs_iomux0_qspi_pins[] = { 6 };
+static const unsigned int mpfs_iomux0_uart0_pins[] = { 7 };
+static const unsigned int mpfs_iomux0_uart1_pins[] = { 8 };
+static const unsigned int mpfs_iomux0_uart2_pins[] = { 9 };
+static const unsigned int mpfs_iomux0_uart3_pins[] = { 10 };
+static const unsigned int mpfs_iomux0_uart4_pins[] = { 11 };
+static const unsigned int mpfs_iomux0_mdio0_pins[] = { 12 };
+static const unsigned int mpfs_iomux0_mdio1_pins[] = { 13 };
+
+#define MPFS_IOMUX0_GROUP(_name) { \
+	.name = #_name "_mssio",	\
+	.pins = mpfs_iomux0_##_name##_pins,	\
+	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
+	.setting = 0x0,	\
+}, { \
+	.name = #_name "_fabric",	\
+	.pins = mpfs_iomux0_##_name##_pins,	\
+	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
+	.setting = BIT(mpfs_iomux0_##_name##_pins[0]),	\
+}
+
+static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] = {
+	MPFS_IOMUX0_GROUP(spi0),
+	MPFS_IOMUX0_GROUP(spi1),
+	MPFS_IOMUX0_GROUP(i2c0),
+	MPFS_IOMUX0_GROUP(i2c1),
+	MPFS_IOMUX0_GROUP(can0),
+	MPFS_IOMUX0_GROUP(can1),
+	MPFS_IOMUX0_GROUP(qspi),
+	MPFS_IOMUX0_GROUP(uart0),
+	MPFS_IOMUX0_GROUP(uart1),
+	MPFS_IOMUX0_GROUP(uart2),
+	MPFS_IOMUX0_GROUP(uart3),
+	MPFS_IOMUX0_GROUP(uart4),
+	MPFS_IOMUX0_GROUP(mdio0),
+	MPFS_IOMUX0_GROUP(mdio1),
+};
+
+static const char * const mpfs_iomux0_spi0_groups[] = { "spi0_mssio", "spi0_fabric" };
+static const char * const mpfs_iomux0_spi1_groups[] = { "spi1_mssio", "spi1_fabric" };
+static const char * const mpfs_iomux0_i2c0_groups[] = { "i2c0_mssio", "i2c0_fabric" };
+static const char * const mpfs_iomux0_i2c1_groups[] = { "i2c1_mssio", "i2c1_fabric" };
+static const char * const mpfs_iomux0_can0_groups[] = { "can0_mssio", "can0_fabric" };
+static const char * const mpfs_iomux0_can1_groups[] = { "can1_mssio", "can1_fabric" };
+static const char * const mpfs_iomux0_qspi_groups[] = { "qspi_mssio", "qspi_fabric" };
+static const char * const mpfs_iomux0_uart0_groups[] = { "uart0_mssio", "uart0_fabric" };
+static const char * const mpfs_iomux0_uart1_groups[] = { "uart1_mssio", "uart1_fabric" };
+static const char * const mpfs_iomux0_uart2_groups[] = { "uart2_mssio", "uart2_fabric" };
+static const char * const mpfs_iomux0_uart3_groups[] = { "uart3_mssio", "uart3_fabric" };
+static const char * const mpfs_iomux0_uart4_groups[] = { "uart4_mssio", "uart4_fabric" };
+static const char * const mpfs_iomux0_mdio0_groups[] = { "mdio0_mssio", "mdio0_fabric" };
+static const char * const mpfs_iomux0_mdio1_groups[] = { "mdio1_mssio", "mdio1_fabric" };
+
+#define MPFS_IOMUX0_FUNCTION(_name) { \
+	.name = #_name,	\
+	.groups = mpfs_iomux0_##_name##_groups,	\
+}
+
+static const struct mpfs_iomux0_function mpfs_iomux0_functions[] = {
+	MPFS_IOMUX0_FUNCTION(spi0),
+	MPFS_IOMUX0_FUNCTION(spi1),
+	MPFS_IOMUX0_FUNCTION(i2c0),
+	MPFS_IOMUX0_FUNCTION(i2c1),
+	MPFS_IOMUX0_FUNCTION(can0),
+	MPFS_IOMUX0_FUNCTION(can1),
+	MPFS_IOMUX0_FUNCTION(qspi),
+	MPFS_IOMUX0_FUNCTION(uart0),
+	MPFS_IOMUX0_FUNCTION(uart1),
+	MPFS_IOMUX0_FUNCTION(uart2),
+	MPFS_IOMUX0_FUNCTION(uart3),
+	MPFS_IOMUX0_FUNCTION(uart4),
+	MPFS_IOMUX0_FUNCTION(mdio0),
+	MPFS_IOMUX0_FUNCTION(mdio1),
+};
+
+static void mpfs_iomux0_pin_dbg_show(struct pinctrl_dev *pctrl_dev, struct seq_file *seq,
+				     unsigned int pin)
+{
+	struct mpfs_iomux0_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	u32 val;
+
+	seq_printf(seq, "reg: %x, pin: %u ", MPFS_IOMUX0_REG, pin);
+
+	regmap_read(pctrl->regmap, MPFS_IOMUX0_REG, &val);
+	val = (val & BIT(pin)) >> pin;
+
+	seq_printf(seq, "val: %x\n", val);
+}
+
+static int mpfs_iomux0_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(mpfs_iomux0_pin_groups);
+}
+
+static const char *mpfs_iomux0_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	return mpfs_iomux0_pin_groups[selector].name;
+}
+
+static int mpfs_iomux0_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+				  const unsigned int **pins, unsigned int *num_pins)
+{
+	*pins = mpfs_iomux0_pin_groups[selector].pins;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops mpfs_iomux0_pinctrl_ops = {
+	.get_groups_count = mpfs_iomux0_groups_count,
+	.get_group_name = mpfs_iomux0_group_name,
+	.get_group_pins = mpfs_iomux0_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinctrl_utils_free_map,
+	.pin_dbg_show = mpfs_iomux0_pin_dbg_show,
+};
+
+static int mpfs_iomux0_pinmux_set_mux(struct pinctrl_dev *pctrl_dev, unsigned int fsel,
+				      unsigned int gsel)
+{
+	struct mpfs_iomux0_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	struct device *dev = pctrl->dev;
+	const struct mpfs_iomux0_pin_group *group;
+	const struct mpfs_iomux0_function *function;
+
+	group = &mpfs_iomux0_pin_groups[gsel];
+	function = &mpfs_iomux0_functions[fsel];
+
+	dev_dbg(dev, "Setting func %s mask %x setting %x\n",
+		function->name, group->mask, group->setting);
+	regmap_assign_bits(pctrl->regmap, MPFS_IOMUX0_REG, group->mask, group->setting);
+
+	return 0;
+}
+
+static int mpfs_iomux0_pinmux_get_funcs_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(mpfs_iomux0_functions);
+}
+
+static const char *mpfs_iomux0_pinmux_get_func_name(struct pinctrl_dev *pctldev,
+						    unsigned int selector)
+{
+	return mpfs_iomux0_functions[selector].name;
+}
+
+static int mpfs_iomux0_pinmux_get_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+					 const char * const **groups,
+					 unsigned int * const num_groups)
+{
+	*groups = mpfs_iomux0_functions[selector].groups;
+	*num_groups = 2;
+
+	return 0;
+}
+
+static const struct pinmux_ops mpfs_iomux0_pinmux_ops = {
+	.get_functions_count = mpfs_iomux0_pinmux_get_funcs_count,
+	.get_function_name = mpfs_iomux0_pinmux_get_func_name,
+	.get_function_groups = mpfs_iomux0_pinmux_get_groups,
+	.set_mux = mpfs_iomux0_pinmux_set_mux,
+};
+
+static int mpfs_iomux0_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mpfs_iomux0_pinctrl *pctrl;
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->regmap = device_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(pctrl->regmap))
+		dev_err_probe(dev, PTR_ERR(pctrl->regmap), "Failed to find syscon regmap\n");
+
+	pctrl->desc.name = dev_name(dev);
+	pctrl->desc.pins = mpfs_iomux0_pins;
+	pctrl->desc.npins = ARRAY_SIZE(mpfs_iomux0_pins);
+	pctrl->desc.pctlops = &mpfs_iomux0_pinctrl_ops;
+	pctrl->desc.pmxops = &mpfs_iomux0_pinmux_ops;
+	pctrl->desc.owner = THIS_MODULE;
+
+	pctrl->dev = dev;
+
+	platform_set_drvdata(pdev, pctrl);
+
+	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
+	if (IS_ERR(pctrl->pctrl))
+		return PTR_ERR(pctrl->pctrl);
+
+	return 0;
+}
+
+static const struct of_device_id mpfs_iomux0_of_match[] = {
+	{ .compatible = "microchip,mpfs-pinctrl-iomux0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mpfs_iomux0_of_match);
+
+static struct platform_driver mpfs_iomux0_driver = {
+	.driver = {
+		.name = "mpfs-pinctrl-iomux0",
+		.of_match_table = mpfs_iomux0_of_match,
+	},
+	.probe = mpfs_iomux0_probe,
+};
+module_platform_driver(mpfs_iomux0_driver);
+
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("Polarfire SoC iomux0 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


