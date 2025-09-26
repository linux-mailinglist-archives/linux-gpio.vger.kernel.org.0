Return-Path: <linux-gpio+bounces-26631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0EBA43AE
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BCD15630E6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881A721E08D;
	Fri, 26 Sep 2025 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wo1u6zTe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A921CC79;
	Fri, 26 Sep 2025 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897214; cv=none; b=HLvaXAn0koBNFDtxeiKUBhsktVuK5zsdWl+uhGUwR9bZUx3oxS+Zb36PiF8bF/FiOtPtrLsBQ1yNEvgyMFNCPCIeJhsuhUH+u3YdWMfgzAiBx6csWKLPpMmJYznqav3SvYcWL3VtPj4sF5CzLXGjsy9sw0rz/FgnNKBqQO8WwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897214; c=relaxed/simple;
	bh=ngk1ZvJx0G1wt33VLB3prZ5qrkv2guaMvCgsiOGDmhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZkeknP2ra0FY7CW0KHpalKCO7uLlCdJVLLZtFYJ9zzgFjzsmcgEvwmjniDpTLzT/hdxHWThSoD70lLwP46Q7LW1HLKfMlaLBOwrlqkUX6iWljQlVVLTckVrC7qhm+aa+ADK0otFk8Y+V3JC/LCGLlq/D/zahiMfe3GZydgjBA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wo1u6zTe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B59C4CEF4;
	Fri, 26 Sep 2025 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897213;
	bh=ngk1ZvJx0G1wt33VLB3prZ5qrkv2guaMvCgsiOGDmhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wo1u6zTedl2nz6pIU/02dnqMH0+MLA9egjqjI8yMpZnEQAz8FdPiwMwLI6WlQNakF
	 3FJCOjmTcf/UASQHKPDuttgL9+KX/aKpX7DKqh2WGt9Y8k8JLeVW17Rjjo//fEmY4I
	 mn8KAPy588A8C+jdeJu74wrTjW5MaCQ97MW5yOz6tgflkA+P5E23UCWWDT5Nf/5snB
	 o5zGIX1C3Ul11DeTjqVTetcU7eByiuVe7UuRBWt/BDXSvv73+Yjq9uGRAtimamAYck
	 UEyV0jBtMFQ+HJcWkG4mSwH2xfpWbAvnP1yfoRCt03LCLDGNRuSC6YhHiUrQ1e4oav
	 dm7BMfbJs7dJw==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC 4/5] pinctrl: add pic64gx "gpio2" pinmux driver
Date: Fri, 26 Sep 2025 15:33:12 +0100
Message-ID: <20250926-rut-disown-d32cab17b497@spud>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926-manpower-glacial-e9756c82b427@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10969; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5eY/QKf3BTB5TvZmK/rAP8gdhe2ajmpqm/CJwTEOZ68=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnXlqjKxHxZUVXysS5dL2b+Bu65qSWVGV+FlwckV1uxH snlDtvcUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlw9DH8U3ws+/3zVWEW5TX2 pfkmCfMOrl97aMJk702G8/MuqdR7PmJkmN6TpP3/udc3c08j8713PGTnrNlc1/O/YJep0MaZEVe duAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The pic64gx has a second pinmux "downstream" of the iomux0 pinmux. The
documentation for the SoC provides no name for this device, but it is
used to swap pins between either GPIO controller #2 or select other
functions, hence the "gpio2" name. Add a driver for it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,pic64gx-pinctrl-gpio2.yaml      |   2 +-
 drivers/pinctrl/Kconfig                       |   7 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-pic64gx-gpio2.c       | 283 ++++++++++++++++++
 4 files changed, 292 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/pinctrl-pic64gx-gpio2.c

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
index be7d4b1948dc..6af7b67731d6 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
@@ -16,7 +16,7 @@ description:
 
 properties:
   compatible:
-     const: microchip,pic64gx-pinctrl-gpio2
+    const: microchip,pic64gx-pinctrl-gpio2
 
   reg:
     maxItems: 1
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index f85ccbc2a0e2..692eb577ed74 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -461,6 +461,13 @@ config PINCTRL_PIC32MZDA
 	def_bool y if PIC32MZDA
 	select PINCTRL_PIC32
 
+config PINCTRL_PIC64GX
+	bool "pic64gx gpio2 pinctrl driver"
+	depends on ARCH_MICROCHIP
+	default y
+	help
+	  This selects the pinctrl driver for gpio2 on pic64gx.
+
 config PINCTRL_PISTACHIO
 	bool "IMG Pistachio SoC pinctrl driver"
 	depends on OF && (MIPS || COMPILE_TEST)
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 8af119804f77..5493628a9a47 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PEF2256)	+= pinctrl-pef2256.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
+obj-$(CONFIG_PINCTRL_PIC64GX)	+= pinctrl-pic64gx-gpio2.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_POLARFIRE_SOC)	+= pinctrl-mpfs-iomux0.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
diff --git a/drivers/pinctrl/pinctrl-pic64gx-gpio2.c b/drivers/pinctrl/pinctrl-pic64gx-gpio2.c
new file mode 100644
index 000000000000..b0607aad934c
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-pic64gx-gpio2.c
@@ -0,0 +1,283 @@
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
+#define PIC64GX_PINCTRL_DT_FUNC_MASK GENMASK(3, 0);
+#define PIC64GX_PINCTRL_DT_PIN_OFFSET 16
+
+#define PIC64GX_PINMUX_REG 0x0
+
+static const struct regmap_config pic64gx_gpio2_pinctrl_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.max_register = 0x0,
+};
+
+struct pic64gx_gpio2_pinctrl_mux_config {
+	u8 pin;
+	u32 config;
+};
+
+struct pic64gx_gpio2_pinctrl {
+	struct pinctrl_dev *pctrl;
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex mutex;
+	struct pinctrl_desc desc;
+};
+
+static void pic64gx_gpio2_pinctrl_dbg_show(struct pinctrl_dev *pctrl_dev, struct seq_file *seq,
+				  unsigned int pin)
+{
+	struct pic64gx_gpio2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	u32 val;
+
+	seq_printf(seq, "reg: %x, pin: %u ", PIC64GX_PINMUX_REG, pin);
+
+	regmap_read(pctrl->regmap, PIC64GX_PINMUX_REG, &val);
+	val = (val & BIT(pin)) >> pin;
+	seq_printf(seq, "val: %x\n", val);
+}
+
+static int pic64gx_gpio2_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev, struct device_node *np,
+					 struct pinctrl_map **maps, unsigned int *num_maps)
+{
+	struct pic64gx_gpio2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	struct device *dev = pctrl->dev;
+	struct pic64gx_gpio2_pinctrl_mux_config *pinmuxs;
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
+		pins[i] = config >> PIC64GX_PINCTRL_DT_PIN_OFFSET;
+		pinmuxs[i].config = config & PIC64GX_PINCTRL_DT_FUNC_MASK;
+		pinmuxs[i].pin = config >> PIC64GX_PINCTRL_DT_PIN_OFFSET;
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
+static struct pinctrl_ops pic64gx_gpio2_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name	= pinctrl_generic_get_group_name,
+	.get_group_pins	= pinctrl_generic_get_group_pins,
+	.pin_dbg_show = pic64gx_gpio2_pinctrl_dbg_show,
+	.dt_node_to_map = pic64gx_gpio2_pinctrl_dt_node_to_map,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static int pic64gx_gpio2_pinctrl_set_pin_func(struct pic64gx_gpio2_pinctrl *pctrl, u8 pin, u32 config)
+{
+	struct device *dev = pctrl->dev;
+	u32 func;
+
+	func = config & PIC64GX_PINCTRL_DT_FUNC_MASK;
+	func <<= pin;
+
+	dev_dbg(dev, "Setting pin %u reg: %x pin %u func %x\n", pin, PIC64GX_PINMUX_REG, pin, func);
+
+	regmap_set_bits(pctrl->regmap, PIC64GX_PINMUX_REG, func);
+
+	return 0;
+}
+
+static int pic64gx_gpio2_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev, unsigned int fsel, unsigned int gsel)
+{
+	struct pic64gx_gpio2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	const struct group_desc *group;
+	struct pic64gx_gpio2_pinctrl_mux_config *configs;
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
+		ret = pic64gx_gpio2_pinctrl_set_pin_func(pctrl, pin, config);
+	}
+
+	return ret;
+}
+
+static const struct pinmux_ops pic64gx_gpio2_pinctrl_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = pic64gx_gpio2_pinctrl_set_mux,
+};
+
+static const struct pinctrl_pin_desc pic64gx_gpio2_pinctrl_pins[] = {
+	PINCTRL_PIN(0, "gpio2 0"),
+	PINCTRL_PIN(1, "gpio2 1"),
+	PINCTRL_PIN(2, "gpio2 2"),
+	PINCTRL_PIN(3, "gpio2 3"),
+	PINCTRL_PIN(4, "gpio2 4"),
+	PINCTRL_PIN(5, "gpio2 5"),
+	PINCTRL_PIN(6, "gpio2 6"),
+	PINCTRL_PIN(7, "gpio2 7"),
+	PINCTRL_PIN(8, "gpio2 8"),
+	PINCTRL_PIN(9, "gpio2 9"),
+	PINCTRL_PIN(10, "gpio2 10"),
+	PINCTRL_PIN(11, "gpio2 11"),
+	PINCTRL_PIN(12, "gpio2 12"),
+	PINCTRL_PIN(13, "gpio2 13"),
+	PINCTRL_PIN(14, "gpio2 14"),
+	PINCTRL_PIN(15, "gpio2 15"),
+	PINCTRL_PIN(16, "gpio2 16"),
+	PINCTRL_PIN(17, "gpio2 17"),
+	PINCTRL_PIN(18, "gpio2 18"),
+	PINCTRL_PIN(19, "gpio2 19"),
+	PINCTRL_PIN(20, "gpio2 20"),
+	PINCTRL_PIN(21, "gpio2 21"),
+	PINCTRL_PIN(22, "gpio2 22"),
+	PINCTRL_PIN(23, "gpio2 23"),
+	PINCTRL_PIN(24, "gpio2 24"),
+	PINCTRL_PIN(25, "gpio2 25"),
+	PINCTRL_PIN(26, "gpio2 26"),
+	PINCTRL_PIN(27, "gpio2 27"),
+	PINCTRL_PIN(28, "gpio2 28"),
+
+};
+
+static int pic64gx_gpio2_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pic64gx_gpio2_pinctrl *pctrl;
+	void __iomem *base;
+	int ret;
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
+	pctrl->regmap = devm_regmap_init_mmio(dev, base, &pic64gx_gpio2_pinctrl_regmap_config);
+	if (IS_ERR(pctrl->regmap)) {
+		dev_err(dev, "Failed to map regmap\n");
+		return PTR_ERR(pctrl->regmap);
+	}
+
+	pctrl->desc.name = dev_name(dev);
+	pctrl->desc.pins = pic64gx_gpio2_pinctrl_pins;
+	pctrl->desc.npins = ARRAY_SIZE(pic64gx_gpio2_pinctrl_pins);
+	pctrl->desc.pctlops = &pic64gx_gpio2_pinctrl_ops;
+	pctrl->desc.pmxops = &pic64gx_gpio2_pinctrl_pinmux_ops;
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
+static const struct of_device_id pic64gx_gpio2_pinctrl_of_match[] = {
+	{ .compatible = "microchip,pic64gx-pinctrl-gpio2" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pic64gx_gpio2_pinctrl_of_match);
+
+static struct platform_driver pic64gx_gpio2_pinctrl_driver = {
+	.driver = {
+		.name = "pic64gx-pinctrl-gpio2",
+		.of_match_table = pic64gx_gpio2_pinctrl_of_match,
+	},
+	.probe = pic64gx_gpio2_pinctrl_probe,
+};
+module_platform_driver(pic64gx_gpio2_pinctrl_driver);
+
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("pic64gx gpio2 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


