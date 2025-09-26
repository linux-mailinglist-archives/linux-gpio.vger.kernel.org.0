Return-Path: <linux-gpio+bounces-26630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1E3BA440A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 529DF7BF66D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AA221A421;
	Fri, 26 Sep 2025 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUJv/JqQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A485218ADD;
	Fri, 26 Sep 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897212; cv=none; b=fFi4L84gz24zNDcSD9IzVqC+tKwToqMPmA/zJ+VUGMDyzxmkFqPFzo11ZgkJwG+TODILmiyx2Pr2mVQV5JQ0ptXdOKhUvvVCsfnv4Qe58+Pk2ZcZ0IcJcNwdR6TbCcp8t/jQTWzqHwsrMoUf12LTN61aPxoY//Fm2fdH+sI4ofM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897212; c=relaxed/simple;
	bh=cxtJAwcSroUFWX+p132OdjkCtTK4tzieiQjBgjmy2pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0YeVGpgVfMI9er7mS77gmaz0PZu19ecMiiCff0rOqkNgWqZgM9TizofUAPpVZHXTnjovnxvut7gRtKrgVmhsElkRRHlkCaH/XS9WPXUwy2u3IY3P1KAsSkWE2/ZFeEG7s3Pn0KlnvLd2s955VgftCoTdm2v318tFJ6Ev8smcfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUJv/JqQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC44BC4CEF7;
	Fri, 26 Sep 2025 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897211;
	bh=cxtJAwcSroUFWX+p132OdjkCtTK4tzieiQjBgjmy2pY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WUJv/JqQFFSGzDySxaNkF4D1HU2Xa4CqOLWGOCKpGMYY04qrTPbpz8tp3IAtvJk7z
	 qwcjcIe2nLyDfYUGfmlVc/XEbUGXuJ6ZRP24cXDHy81QLb8ourQSYdHECnipaB852h
	 4Xitp4WbyQi+gRPmosMNs21r7PEaw5y7ey1RpsiCnuronSCuT7dAXyj+DDMxB4k8Ip
	 veQVZoagmP0VnwzhIT7k7c9vZn1DZ7MUewvQhh4JS6l0c6wakY7osX9Wq1tJsCHxOs
	 xceH8+zOP4o5+XFnxcCsjWzwTVqWuwbNF6mPAf90K6G4H39IgUgfcy7u/G1NAUjybl
	 Bmf/1VxNXcm3g==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC 3/5] pinctrl: add polarfire soc iomux0 pinmux driver
Date: Fri, 26 Sep 2025 15:33:11 +0100
Message-ID: <20250926-unshackle-jury-79f701f97e94@spud>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926-manpower-glacial-e9756c82b427@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10112; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3Ua9rGDiZ78KGESuIEYgHMwQRlK1a6Eq+e6zOrIYK7g=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnXlqi+5BLbsLPyjY1wg7nW06e7p30IK7QM+fjw2jaNL /M5Xq9s7ihlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEBJoZGfblm7Smbt1qa3vU 5my269wLGs7rJWLWeGxwTbpdpN4z5Twjw9L42d9fKF3d8fD48pX38k1s65i+GEpVqR7c/czN+Ky OOh8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Polarfire SoC, iomux0 is responsible for routing functions to either
MSS (multiprocessor subsystem) IOs or to the FPGA fabric, where they
can either interface with custom RTL or be routed to the FPGA fabric's
IOs. Add a driver for it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-mss-top-sysreg.yaml        |   2 +-
 drivers/pinctrl/Kconfig                       |   7 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-mpfs-iomux0.c         | 252 ++++++++++++++++++
 4 files changed, 261 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-iomux0.c

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 1b737a3fcd33..cb5784ec5ac5 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -55,7 +55,7 @@ additionalProperties: false
 examples:
   - |
     syscon@20002000 {
-      compatible = "microchip,mpfs-mss-top-sysreg", "syscon";
+      compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
       reg = <0x20002000 0x1000>;
       #reset-cells = <1>;
     };
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 33db9104df17..f85ccbc2a0e2 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -472,6 +472,13 @@ config PINCTRL_PISTACHIO
 	help
 	  This support pinctrl and GPIO driver for IMG Pistachio SoC.
 
+config PINCTRL_POLARFIRE_SOC
+	bool "Polarfire SoC pinctrl driver"
+	depends on ARCH_MICROCHIP
+	default y
+	help
+	  This selects the pinctrl driver for Microchip Polarfire SoC.
+
 config PINCTRL_RK805
 	tristate "Pinctrl and GPIO driver for RK805 PMIC"
 	depends on MFD_RK8XX
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index ac27e88677d1..8af119804f77 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PEF2256)	+= pinctrl-pef2256.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
+obj-$(CONFIG_PINCTRL_POLARFIRE_SOC)	+= pinctrl-mpfs-iomux0.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_SCMI)	+= pinctrl-scmi.o
diff --git a/drivers/pinctrl/pinctrl-mpfs-iomux0.c b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
new file mode 100644
index 000000000000..93a17c9c299d
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
@@ -0,0 +1,252 @@
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
+#define MPFS_PINCTRL_DT_FUNC_MASK GENMASK(3, 0);
+#define MPFS_PINCTRL_DT_PIN_OFFSET 16
+
+#define MPFS_PINCTRL_IOMUX0_REG 0x200
+
+struct mpfs_iomux0_pinctrl_mux_config {
+	u8 pin;
+	u32 config;
+};
+
+struct mpfs_iomux0_pinctrl {
+	struct pinctrl_dev *pctrl;
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex mutex;
+	struct pinctrl_desc desc;
+};
+
+static void mpfs_iomux0_pinctrl_dbg_show(struct pinctrl_dev *pctrl_dev, struct seq_file *seq,
+				  unsigned int pin)
+{
+	struct mpfs_iomux0_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	u32 val;
+
+	seq_printf(seq, "reg: %x, pin: %u ", MPFS_PINCTRL_IOMUX0_REG, pin);
+
+	regmap_read(pctrl->regmap, MPFS_PINCTRL_IOMUX0_REG, &val);
+	val = (val & BIT(pin)) >> pin;
+
+	seq_printf(seq, "val: %x\n", val);
+}
+
+static int mpfs_iomux0_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev, struct device_node *np,
+					 struct pinctrl_map **maps, unsigned int *num_maps)
+{
+	struct mpfs_iomux0_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	struct device *dev = pctrl->dev;
+	struct mpfs_iomux0_pinctrl_mux_config *pinmuxs;
+	struct pinctrl_map *map;
+	const char **grpnames;
+	const char *grpname;
+	int ret, i, npins;
+	unsigned int config, *pins;
+
+	map = kcalloc(1, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	guard(mutex)(&pctrl->mutex);
+
+	npins = of_property_count_u32_elems(np, "pinmux");
+	if (npins < 1) {
+		dev_err(dev, "invalid pinctrl group %pOFn\n", np);
+		return -EINVAL;
+	}
+
+	grpnames = devm_kmalloc(dev, sizeof(*grpnames), GFP_KERNEL);
+	if (!grpnames)
+		return -ENOMEM;
+
+	grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", np);
+	if (!grpname)
+		return -ENOMEM;
+
+	*grpnames = grpname;
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
+	if (!pinmuxs)
+		return -ENOMEM;
+
+	for (i = 0; i < npins; i++) {
+		ret = of_property_read_u32_index(np, "pinmux", i, &config);
+		if (ret)
+			return -EINVAL;
+
+		pins[i] = config >> MPFS_PINCTRL_DT_PIN_OFFSET;
+		pinmuxs[i].config = config & MPFS_PINCTRL_DT_FUNC_MASK;
+		pinmuxs[i].pin = config >> MPFS_PINCTRL_DT_PIN_OFFSET;
+	}
+
+	map->type = PIN_MAP_TYPE_MUX_GROUP;
+	map->data.mux.function = np->name;
+	map->data.mux.group = grpname;
+
+	ret = pinctrl_generic_add_group(pctrl_dev, grpname, pins, npins, pinmuxs);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to add group %s: %d\n", grpname, ret);
+
+	ret = pinmux_generic_add_function(pctrl_dev, np->name, grpnames, 1, NULL);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctrl_dev, map, 1);
+		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
+	}
+
+	*maps = map;
+	*num_maps = 1;
+
+	return 0;
+};
+
+static struct pinctrl_ops mpfs_iomux0_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name	= pinctrl_generic_get_group_name,
+	.get_group_pins	= pinctrl_generic_get_group_pins,
+	.pin_dbg_show = mpfs_iomux0_pinctrl_dbg_show,
+	.dt_node_to_map = mpfs_iomux0_pinctrl_dt_node_to_map,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static int mpfs_iomux0_pinctrl_set_pin_func(struct mpfs_iomux0_pinctrl *pctrl, u8 pin, u32 config)
+{
+	struct device *dev = pctrl->dev;
+	u32 state;
+
+	state = config & MPFS_PINCTRL_DT_FUNC_MASK;
+	state <<= pin;
+
+	dev_dbg(dev, "Setting pin %u reg %x offset %u func %x\n", pin, MPFS_PINCTRL_IOMUX0_REG, pin, state);
+
+	regmap_set_bits(pctrl->regmap, MPFS_PINCTRL_IOMUX0_REG, state);
+
+	return 0;
+}
+
+static int mpfs_iomux0_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev, unsigned int fsel, unsigned int gsel)
+{
+	struct mpfs_iomux0_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	const struct group_desc *group;
+	struct mpfs_iomux0_pinctrl_mux_config *configs;
+	int ret = -EINVAL;
+
+	group = pinctrl_generic_get_group(pctrl_dev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	configs = group->data;
+
+	for (int i = 0; i < group->grp.npins; i++) {
+		u8 pin = configs[i].pin;
+		u32 config = configs[i].config;
+
+		ret = mpfs_iomux0_pinctrl_set_pin_func(pctrl, pin, config);
+	}
+
+	return ret;
+}
+
+static const struct pinmux_ops mpfs_iomux0_pinctrl_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = mpfs_iomux0_pinctrl_set_mux,
+};
+
+static const struct pinctrl_pin_desc mpfs_iomux0_pinctrl_pins[] = {
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
+
+};
+
+static int mpfs_iomux0_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mpfs_iomux0_pinctrl *pctrl;
+	int ret;
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
+	pctrl->desc.pins = mpfs_iomux0_pinctrl_pins;
+	pctrl->desc.npins = ARRAY_SIZE(mpfs_iomux0_pinctrl_pins);
+	pctrl->desc.pctlops = &mpfs_iomux0_pinctrl_ops;
+	pctrl->desc.pmxops = &mpfs_iomux0_pinctrl_pinmux_ops;
+	pctrl->desc.owner = THIS_MODULE;
+
+	pctrl->dev = dev;
+
+	ret = devm_mutex_init(dev, &pctrl->mutex);
+	if (ret)
+		return ret;
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
+static const struct of_device_id mpfs_iomux0_pinctrl_of_match[] = {
+	{ .compatible = "microchip,mpfs-pinctrl-iomux0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mpfs_iomux0_pinctrl_of_match);
+
+static struct platform_driver mpfs_iomux0_pinctrl_driver = {
+	.driver = {
+		.name = "mpfs-pinctrl-iomux0",
+		.of_match_table = mpfs_iomux0_pinctrl_of_match,
+	},
+	.probe = mpfs_iomux0_pinctrl_probe,
+};
+module_platform_driver(mpfs_iomux0_pinctrl_driver);
+
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("Polarfire SoC iomux0 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


