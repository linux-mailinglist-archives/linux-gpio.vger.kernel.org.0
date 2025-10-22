Return-Path: <linux-gpio+bounces-27432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF9BFB540
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 12:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DE2519C7C2F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 10:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0F7320CA2;
	Wed, 22 Oct 2025 10:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7zkvD78"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ED7320A0F;
	Wed, 22 Oct 2025 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127831; cv=none; b=kB6Uvv7KtOcbLQ1vE70baNzwE3j7EwheopuC8TqYXa3VZSnMed87PKFd2dFmMMt5X06KR9MwsRXs9t6CHFY8+fANXz3RtOxztvEWAMZSlHpX6rhd9izm3COIH5nfpZNTS+U0fsnGoCvlxyM5kKlm6s4C64MJNfInxzRp0Iib0wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127831; c=relaxed/simple;
	bh=1RIR6sd/TBREn2myqoXqIybk1h8ttf7pSz2j+UceWT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSDGFFaHGLjgdQG76xOOGA0+QE+uFBqloSK4ZukgSP2JhsRfroysxPz/RoxVGfTNcB89HiguP1iXvWb9e/UVe90dJWVxXYIo0dpuJYlFAUv3ON8t1BThoOFIgBuAoKYO2aHptS8D3hYcg+tAF3vtvALRDKj989McSJ+ZRfBJkMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7zkvD78; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C396CC4CEFF;
	Wed, 22 Oct 2025 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761127830;
	bh=1RIR6sd/TBREn2myqoXqIybk1h8ttf7pSz2j+UceWT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I7zkvD78aBwTx9vSR2qQQ7HKVfQFEnR79loLyNMdOhS4lATSbOZK3G3B8bAbdwekQ
	 QskbCxCfudiJDq+2QtAvM9jgDhtimQKCqZaapJNTlR3HbTFAc5479dBH2KJMLfFzgu
	 PBHjHV4xuZXxt+w2j1IFea0CkB/4PphL8Tr9anLrE6VIpy7E8dAx619r2nd6ADqqFd
	 TShQynBKINLK7Z3GhjJQQy+T7FGkthXlgZ+vsk6P9Hb7JKT+7B03PC2GpRwabOA39u
	 2CLu7ez64sYsfWGhfLLL5pT+zpw5De9Pfd8DmM3ACBnXgzUpq4Ckl+cUeqqa0Fioqy
	 V5aXdecoBLUuw==
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
Subject: [PATCH v3 2/5] pinctrl: add pic64gx "gpio2" pinmux driver
Date: Wed, 22 Oct 2025 11:09:10 +0100
Message-ID: <20251022-shakily-sinner-7325cdf67463@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022-dash-refinance-ac3387657ae4@spud>
References: <20251022-dash-refinance-ac3387657ae4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12131; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=81hTZ4qEz/0MgkwoUR5e217Jfv2h0ZsKkrTXugpFNag=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBk/1kZXTlz0pn0xy9PAqDSt05Xeu9OXdDJ2rtsSbJxS5 af04ppdRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACaytI/hr9gRR72vNk8cLefu 21Glbr+nw1v0pphC1asntx4VtMtK9TAyXFRQ0u8M7GOyq1PdOOWB/JFjt9tzGWN4uqafnax09/x 9JgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The pic64gx has a second pinmux "downstream" of the iomux0 pinmux. The
documentation for the SoC provides no name for this device, but it is
used to swap pins between either GPIO controller #2 or select other
functions, hence the "gpio2" name. Add a driver for it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/Kconfig                 |   8 +
 drivers/pinctrl/Makefile                |   1 +
 drivers/pinctrl/pinctrl-pic64gx-gpio2.c | 356 ++++++++++++++++++++++++
 3 files changed, 365 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-pic64gx-gpio2.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 4f8507ebbdac..e83fda9bf308 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -486,6 +486,14 @@ config PINCTRL_PIC32MZDA
 	def_bool y if PIC32MZDA
 	select PINCTRL_PIC32
 
+config PINCTRL_PIC64GX
+	bool "pic64gx gpio2 pinctrl driver"
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	select GENERIC_PINCONF
+	default y
+	help
+	  This selects the pinctrl driver for gpio2 on pic64gx.
+
 config PINCTRL_PISTACHIO
 	bool "IMG Pistachio SoC pinctrl driver"
 	depends on OF && (MIPS || COMPILE_TEST)
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e0cfb9b7c99b..f33976a6c91b 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PEF2256)	+= pinctrl-pef2256.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
+obj-$(CONFIG_PINCTRL_PIC64GX)	+= pinctrl-pic64gx-gpio2.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
diff --git a/drivers/pinctrl/pinctrl-pic64gx-gpio2.c b/drivers/pinctrl/pinctrl-pic64gx-gpio2.c
new file mode 100644
index 000000000000..f322bb5e6181
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-pic64gx-gpio2.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitfield.h>
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
+#include "pinctrl-utils.h"
+
+#define PIC64GX_PINMUX_REG 0x0
+
+static const struct regmap_config pic64gx_gpio2_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.max_register = 0x0,
+};
+
+struct pic64gx_gpio2_pinctrl {
+	struct pinctrl_dev *pctrl;
+	struct device *dev;
+	struct regmap *regmap;
+	struct pinctrl_desc desc;
+};
+
+struct pic64gx_gpio2_pin_group {
+	const char *name;
+	const unsigned int *pins;
+	const unsigned int num_pins;
+	u32 mask;
+	u32 setting;
+};
+
+struct pic64gx_gpio2_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned int num_groups;
+};
+
+static const struct pinctrl_pin_desc pic64gx_gpio2_pins[] = {
+	PINCTRL_PIN(0, "E14"),
+	PINCTRL_PIN(1, "E15"),
+	PINCTRL_PIN(2, "F16"),
+	PINCTRL_PIN(3, "F17"),
+	PINCTRL_PIN(4, "D19"),
+	PINCTRL_PIN(5, "B18"),
+	PINCTRL_PIN(6, "B10"),
+	PINCTRL_PIN(7, "C14"),
+	PINCTRL_PIN(8, "E18"),
+	PINCTRL_PIN(9, "D18"),
+	PINCTRL_PIN(10, "E19"),
+	PINCTRL_PIN(11, "C7"),
+	PINCTRL_PIN(12, "D6"),
+	PINCTRL_PIN(13, "D7"),
+	PINCTRL_PIN(14, "C9"),
+	PINCTRL_PIN(15, "C10"),
+	PINCTRL_PIN(16, "A5"),
+	PINCTRL_PIN(17, "A6"),
+	PINCTRL_PIN(18, "D8"),
+	PINCTRL_PIN(19, "D9"),
+	PINCTRL_PIN(20, "B8"),
+	PINCTRL_PIN(21, "A8"),
+	PINCTRL_PIN(22, "C12"),
+	PINCTRL_PIN(23, "B12"),
+	PINCTRL_PIN(24, "A11"),
+	PINCTRL_PIN(25, "A10"),
+	PINCTRL_PIN(26, "D11"),
+	PINCTRL_PIN(27, "C11"),
+	PINCTRL_PIN(28, "B9"),
+};
+
+static const unsigned int pic64gx_gpio2_mdio0_pins[] = {
+	0, 1
+};
+
+static const unsigned int pic64gx_gpio2_mdio1_pins[] = {
+	2, 3
+};
+
+static const unsigned int pic64gx_gpio2_spi0_pins[] = {
+	4, 5, 10, 11
+};
+
+static const unsigned int pic64gx_gpio2_can0_pins[] = {
+	6, 24, 28
+};
+
+static const unsigned int pic64gx_gpio2_pcie_pins[] = {
+	7, 8, 9
+};
+
+static const unsigned int pic64gx_gpio2_qspi_pins[] = {
+	12, 13, 14, 15, 16, 17
+};
+
+static const unsigned int pic64gx_gpio2_uart3_pins[] = {
+	18, 19
+};
+
+static const unsigned int pic64gx_gpio2_uart4_pins[] = {
+	20, 21
+};
+
+static const unsigned int pic64gx_gpio2_can1_pins[] = {
+	22, 23, 25
+};
+
+static const unsigned int pic64gx_gpio2_uart2_pins[] = {
+	26, 27
+};
+
+#define PIC64GX_PINCTRL_GROUP(_name, _mask) { \
+	.name = "gpio_" #_name,	\
+	.pins = pic64gx_gpio2_##_name##_pins,	\
+	.num_pins = ARRAY_SIZE(pic64gx_gpio2_##_name##_pins), \
+	.mask = _mask,	\
+	.setting = 0x0,	\
+}, { \
+	.name = #_name,	\
+	.pins = pic64gx_gpio2_##_name##_pins,	\
+	.num_pins = ARRAY_SIZE(pic64gx_gpio2_##_name##_pins), \
+	.mask = _mask,	\
+	.setting = _mask,	\
+}
+
+static const struct pic64gx_gpio2_pin_group pic64gx_gpio2_pin_groups[] = {
+	PIC64GX_PINCTRL_GROUP(mdio0, BIT(0) | BIT(1)),
+	PIC64GX_PINCTRL_GROUP(mdio1, BIT(2) | BIT(3)),
+	PIC64GX_PINCTRL_GROUP(spi0, BIT(4) | BIT(5) | BIT(10) | BIT(11)),
+	PIC64GX_PINCTRL_GROUP(can0, BIT(6) | BIT(24) | BIT(28)),
+	PIC64GX_PINCTRL_GROUP(pcie, BIT(7) | BIT(8) | BIT(9)),
+	PIC64GX_PINCTRL_GROUP(qspi, GENMASK(17, 12)),
+	PIC64GX_PINCTRL_GROUP(uart3, BIT(18) | BIT(19)),
+	PIC64GX_PINCTRL_GROUP(uart4, BIT(20) | BIT(21)),
+	PIC64GX_PINCTRL_GROUP(can1, BIT(22) | BIT(23) | BIT(25)),
+	PIC64GX_PINCTRL_GROUP(uart2, BIT(26) | BIT(27)),
+};
+
+static const char * const pic64gx_gpio2_gpio_groups[] = {
+	"gpio_mdio0", "gpio_mdio1", "gpio_spi0", "gpio_can0", "gpio_pcie",
+	"gpio_qspi", "gpio_uart3", "gpio_uart4", "gpio_can1", "gpio_uart2"
+};
+
+static const char * const pic64gx_gpio2_mdio0_groups[] = {
+	"mdio0"
+};
+
+static const char * const pic64gx_gpio2_mdio1_groups[] = {
+	"mdio1"
+};
+
+static const char * const pic64gx_gpio2_spi0_groups[] = {
+	"spi0"
+};
+
+static const char * const pic64gx_gpio2_can0_groups[] = {
+	"can0"
+};
+
+static const char * const pic64gx_gpio2_pcie_groups[] = {
+	"pcie"
+};
+
+static const char * const pic64gx_gpio2_qspi_groups[] = {
+	"qspi"
+};
+
+static const char * const pic64gx_gpio2_uart3_groups[] = {
+	"uart3"
+};
+
+static const char * const pic64gx_gpio2_uart4_groups[] = {
+	"uart4"
+};
+
+static const char * const pic64gx_gpio2_can1_groups[] = {
+	"can1"
+};
+
+static const char * const pic64gx_gpio2_uart2_groups[] = {
+	"uart2"
+};
+
+#define PIC64GX_PINCTRL_FUNCTION(_name) { \
+	.name = #_name,	\
+	.groups = pic64gx_gpio2_##_name##_groups,	\
+	.num_groups = ARRAY_SIZE(pic64gx_gpio2_##_name##_groups), \
+}
+
+static const struct pic64gx_gpio2_function pic64gx_gpio2_functions[] = {
+	PIC64GX_PINCTRL_FUNCTION(gpio),
+	PIC64GX_PINCTRL_FUNCTION(mdio0),
+	PIC64GX_PINCTRL_FUNCTION(mdio1),
+	PIC64GX_PINCTRL_FUNCTION(spi0),
+	PIC64GX_PINCTRL_FUNCTION(can0),
+	PIC64GX_PINCTRL_FUNCTION(pcie),
+	PIC64GX_PINCTRL_FUNCTION(qspi),
+	PIC64GX_PINCTRL_FUNCTION(uart3),
+	PIC64GX_PINCTRL_FUNCTION(uart4),
+	PIC64GX_PINCTRL_FUNCTION(can1),
+	PIC64GX_PINCTRL_FUNCTION(uart2),
+};
+
+static void pic64gx_gpio2_pin_dbg_show(struct pinctrl_dev *pctrl_dev, struct seq_file *seq,
+				       unsigned int pin)
+{
+	struct pic64gx_gpio2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	u32 val;
+
+	regmap_read(pctrl->regmap, PIC64GX_PINMUX_REG, &val);
+	val = (val & BIT(pin)) >> pin;
+	seq_printf(seq, "pin: %u val: %x\n", pin, val);
+}
+
+static int pic64gx_gpio2_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(pic64gx_gpio2_pin_groups);
+}
+
+static const char *pic64gx_gpio2_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	return pic64gx_gpio2_pin_groups[selector].name;
+}
+
+static int pic64gx_gpio2_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+				    const unsigned int **pins, unsigned int *num_pins)
+{
+	*pins = pic64gx_gpio2_pin_groups[selector].pins;
+	*num_pins = pic64gx_gpio2_pin_groups[selector].num_pins;
+
+	return 0;
+}
+
+static const struct pinctrl_ops pic64gx_gpio2_pinctrl_ops = {
+	.get_groups_count = pic64gx_gpio2_groups_count,
+	.get_group_name = pic64gx_gpio2_group_name,
+	.get_group_pins = pic64gx_gpio2_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinctrl_utils_free_map,
+	.pin_dbg_show = pic64gx_gpio2_pin_dbg_show,
+};
+
+static int pic64gx_gpio2_pinmux_get_funcs_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(pic64gx_gpio2_functions);
+}
+
+static const char *pic64gx_gpio2_pinmux_get_func_name(struct pinctrl_dev *pctldev,
+						      unsigned int selector)
+{
+	return pic64gx_gpio2_functions[selector].name;
+}
+
+static int pic64gx_gpio2_pinmux_get_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+					   const char * const **groups,
+					   unsigned int * const num_groups)
+{
+	*groups = pic64gx_gpio2_functions[selector].groups;
+	*num_groups = pic64gx_gpio2_functions[selector].num_groups;
+
+	return 0;
+}
+
+static int pic64gx_gpio2_pinmux_set_mux(struct pinctrl_dev *pctrl_dev, unsigned int fsel,
+					unsigned int gsel)
+{
+	struct pic64gx_gpio2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	struct device *dev = pctrl->dev;
+	const struct pic64gx_gpio2_pin_group *group;
+	const struct pic64gx_gpio2_function *function;
+
+	group = &pic64gx_gpio2_pin_groups[gsel];
+	function = &pic64gx_gpio2_functions[fsel];
+
+	dev_dbg(dev, "Setting func %s mask %x setting %x\n",
+		function->name, group->mask, group->setting);
+	regmap_assign_bits(pctrl->regmap, PIC64GX_PINMUX_REG, group->mask, group->setting);
+
+	return 0;
+}
+
+static const struct pinmux_ops pic64gx_gpio2_pinmux_ops = {
+	.get_functions_count = pic64gx_gpio2_pinmux_get_funcs_count,
+	.get_function_name = pic64gx_gpio2_pinmux_get_func_name,
+	.get_function_groups = pic64gx_gpio2_pinmux_get_groups,
+	.set_mux = pic64gx_gpio2_pinmux_set_mux,
+};
+
+static int pic64gx_gpio2_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pic64gx_gpio2_pinctrl *pctrl;
+	void __iomem *base;
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "Failed get resource\n");
+		return PTR_ERR(base);
+	}
+
+	pctrl->regmap = devm_regmap_init_mmio(dev, base, &pic64gx_gpio2_regmap_config);
+	if (IS_ERR(pctrl->regmap)) {
+		dev_err(dev, "Failed to map regmap\n");
+		return PTR_ERR(pctrl->regmap);
+	}
+
+	pctrl->desc.name = dev_name(dev);
+	pctrl->desc.pins = pic64gx_gpio2_pins;
+	pctrl->desc.npins = ARRAY_SIZE(pic64gx_gpio2_pins);
+	pctrl->desc.pctlops = &pic64gx_gpio2_pinctrl_ops;
+	pctrl->desc.pmxops = &pic64gx_gpio2_pinmux_ops;
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
+static const struct of_device_id pic64gx_gpio2_of_match[] = {
+	{ .compatible = "microchip,pic64gx-pinctrl-gpio2" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pic64gx_gpio2_of_match);
+
+static struct platform_driver pic64gx_gpio2_driver = {
+	.driver = {
+		.name = "pic64gx-pinctrl-gpio2",
+		.of_match_table = pic64gx_gpio2_of_match,
+	},
+	.probe = pic64gx_gpio2_probe,
+};
+module_platform_driver(pic64gx_gpio2_driver);
+
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("pic64gx gpio2 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


